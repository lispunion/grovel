(define-library (c-groveler)
  (export make-c-groveler
          c-groveler->string

          grovel-c-constant-integer
          grovel-c-constant-ifdef-integer

          grovel-c-constant-string
          grovel-c-constant-ifdef-string

          grovel-c-call-constant-string
          grovel-c-call-constant-ifdef-string

          grovel-c-include
          grovel-c-quote
          grovel-c-struct-slot-offset
          grovel-c-struct-slot-size
          grovel-c-struct-size
          grovel-c-type-signedness
          grovel-c-type-size)
  (import (scheme base)
          (scheme char))
  (begin

    (define (the-filename filename)
      filename)

    (define (the-identifier identifier)
      (symbol->string identifier))

    (define (c-string s)
      (call-with-port (open-output-string)
                      (lambda (out)
                        (parameterize ((current-output-port out))
                          (write-char #\")
                          (string-for-each (lambda (c)
                                             (if (or (char-alphabetic? c)
                                                     (char-numeric? c)
                                                     (char=? #\_ c)
                                                     (char=? #\- c)
                                                     (char=? #\. c)
                                                     )
                                                 (write-char c)
                                                 (error "Boo:" c)))
                                           s)
                          (write-char #\"))
                        (get-output-string out))))

    (define (line g . strings)
      (set-car! g (apply string-append
                         (car g)
                         (append strings (list "\n")))))

    (define (grovel-c-quote g . strings)
      (for-each (lambda (s) (line g s)) strings))

    (define (grovel-c-include g filename)
      (line g
            "#include <" (the-filename filename) ">"))

    (define (with-g g thunk)
      (let ((next-id (+ 1 (cdr g))))
        (set-cdr! g next-id)
        (line g "")
        (line g "static void grovel_" (number->string next-id) "(void)")
        (line g "{")
        (thunk g)
        (line g "}")))

    (define (grovel-c-type-signedness g typename)
      (with-g
       g (lambda (g)
           (line g "  const char *grovel_tmp;")
           (line g "")
           (line g "  grovel_tmp = "
                 "("
                 "((" (the-identifier typename) ")-1)"
                 " < "
                 "((" (the-identifier typename) ")0)"
                 ")"
                 " ? \"signed\" : \"unsigned\";")
           (line g
                 "  "
                 "grovel_symbol("
                 (c-string "type-signedness")
                 ", "
                 (c-string (the-identifier typename))
                 ", "
                 "grovel_tmp"
                 ");"))))

    (define (grovel-c-type-size g typename)
      (with-g
       g (lambda (g)
           (line g
                 "  "
                 "grovel_uintmax("
                 (c-string "type-size") ", "
                 (c-string (the-identifier typename)) ", "
                 "sizeof(" (the-identifier typename) ")"
                 ");"))))

    (define (grovel-c-struct-size g structname)
      (with-g
       g (lambda (g)
           (line g
                 "  "
                 "grovel_uintmax("
                 (c-string "type-size") ", "
                 (c-string
                  (string-append
                   "struct-" (the-identifier structname)))
                 ", "
                 "sizeof(struct " (the-identifier structname) ")"
                 ");"))))

    (define (grovel-c-struct-slot-size g structname slot-name)
      (with-g
       g (lambda (g)
           (line g
                 "  "
                 "static struct " (the-identifier structname) " grovel_tmp;")
           (line g "")
           (line g
                 "  "
                 "grovel_uintmax_2("
                 (c-string "slot-size")
                 ", "
                 (c-string
                  (string-append "struct-" (the-identifier structname)))
                 ", "
                 (c-string (the-identifier slot-name))
                 ", "
                 "sizeof(grovel_tmp." (the-identifier slot-name) "));"))))

    (define (grovel-c-struct-slot-offset g structname slot-name)
      (with-g
       g (lambda (g)
           (line g "  "
                 "grovel_uintmax_2("
                 (c-string "slot-offs")
                 ", "
                 (c-string (string-append "struct-" (the-identifier structname)))
                 ", "
                 (c-string (the-identifier slot-name))
                 ", "
                 "offsetof(struct " (the-identifier structname)
                 ", " (the-identifier slot-name) "));"))))

    (define (constant-integer-thunk g identifier)
      (line g
            "  "
            "grovel_intmax("
            (c-string "constant") ", "
            (c-string (the-identifier identifier)) ", "
            "(intmax_t)(" (the-identifier identifier) ")"
            ");"))

    (define (constant-string-thunk g identifier)
      (line g
            "  "
            "grovel_string("
            (c-string "constant") ", "
            (c-string (the-identifier identifier)) ", "
            "(" (the-identifier identifier) ")"
            ");"))

    (define (call-constant-string-thunk g function identifier)
      (line g
            "  "
            "grovel_string_2("
            (c-string "call-constant")
            ", "
            (c-string (the-identifier function))
            ", "
            (c-string (the-identifier identifier))
            ", "
            "("
            (the-identifier function)
            "(" (the-identifier identifier) ")"
            ")"
            ");"))

    (define (grovel-c-constant-ifdef-integer g identifier)
      (with-g
       g (lambda (g)
           (line g "#ifdef " (the-identifier identifier))
           (constant-integer-thunk g identifier)
           (line g "#endif"))))

    (define (grovel-c-constant-integer g identifier)
      (with-g
       g (lambda (g)
           (constant-integer-thunk g identifier))))

    (define (grovel-c-constant-ifdef-string g identifier)
      (with-g
       g (lambda (g)
           (line g "#ifdef " (the-identifier identifier))
           (constant-string-thunk g identifier)
           (line g "#endif"))))

    (define (grovel-c-call-constant-string g function identifier)
      (with-g
       g (lambda (g)
           (call-constant-string-thunk g function identifier))))

    (define (grovel-c-call-constant-ifdef-string g function identifier)
      (with-g
       g (lambda (g)
           (line g "#ifdef " (the-identifier identifier))
           (call-constant-string-thunk g function identifier)
           (line g "#endif"))))

    (define (grovel-c-constant-string g identifier)
      (with-g
       g (lambda (g)
           (constant-string-thunk g identifier))))

    (define (make-c-groveler)
      (let ((g (cons "" 0)))
        (grovel-c-include g "inttypes.h")
        (grovel-c-include g "stddef.h")
        (grovel-c-include g "stdio.h")
        (grovel-c-include g "stdlib.h")
        (grovel-c-quote
         g
         ""
         "static void check(int rv)"
         "{"
         "  if (rv < 0) {"
         "    exit(1);"
         "  }"
         "}"
         ""
         "static void grovel_uintmax("
         "  const char *prefix,"
         "  const char *symbol,"
         "  uintmax_t value"
         ")"
         "{"
         "  check(printf(\"(%s %s %\" PRIuMAX \")\\n\","
         "    prefix, symbol, value));"
         "}"
         ""
         "static void grovel_uintmax_2("
         "  const char *prefix,"
         "  const char *symbol1,"
         "  const char *symbol2,"
         "  uintmax_t value"
         ")"
         "{"
         "  check(printf(\"(%s %s %s %\" PRIuMAX \")\\n\","
         "    prefix, symbol1, symbol2, value));"
         "}"
         ""
         "static void grovel_intmax("
         "  const char *prefix,"
         "  const char *symbol,"
         "  intmax_t value"
         ")"
         "{"
         "  check(printf(\"(%s %s %\" PRIdMAX \")\\n\","
         "    prefix, symbol, value));"
         "}"
         ""
         "static void grovel_symbol("
         "  const char *prefix,"
         "  const char *symbol,"
         "  const char *value"
         ")"
         "{"
         "  check(printf(\"(%s %s %s)\\n\", prefix, symbol, value));"
         "}"
         ""
         "static void grovel_string("
         "  const char *prefix,"
         "  const char *symbol,"
         "  const char *value"
         ")"
         "{"
         "  check(printf(\"(%s %s \\\"%s\\\")\\n\", prefix, symbol, value));"
         "}"
         ""
         "static void grovel_string_2("
         "  const char *prefix,"
         "  const char *symbol1,"
         "  const char *symbol2,"
         "  const char *value"
         ")"
         "{"
         "  check(printf(\"(%s %s %s \\\"%s\\\")\\n\","
         "    prefix, symbol1, symbol2, value));"
         "}"
         "")
        g))

    (define (c-groveler->string g)
      (line g "")
      (line g "int main(void)")
      (line g "{")
      (let ((first-id 1)
            (last-id (cdr g)))
        (let loop ((i first-id))
          (when (<= i last-id)
            (line g "  grovel_" (number->string i) "();")
            (loop (+ i 1)))))
      (line g "  return 0;")
      (line g "}")
      (car g))))
