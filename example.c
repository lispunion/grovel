#include <inttypes.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

static void check(int rv) { if (rv < 0) exit(1); }

static void grovel_uintmax(
  const char *prefix,
  const char *symbol,
  uintmax_t value)
{
  check(printf("(%s %s %" PRIuMAX ")\n",
    prefix, symbol, value));
}

static void grovel_intmax(
  const char *prefix,
  const char *symbol,
  intmax_t value)
{
  check(printf("(%s %s %" PRIdMAX ")\n",
    prefix, symbol, value));
}

static void grovel_symbol(
  const char *prefix,
  const char *symbol,
  const char *value)
{
  check(printf("(%s %s %s)\n", prefix, symbol, value));
}

static void grovel_string(
  const char *prefix,
  const char *symbol,
  const char *value)
{
  check(printf("(%s %s \"%s\")\n", prefix, symbol, value));
}

#include <sys/stat.h>
#include <sys/utsname.h>
#include <errno.h>
#include <sqlite3.h>

static void grovel_1(void) {
  grovel_uintmax("size", "struct-stat", sizeof(struct stat));
}

static void grovel_2(void) {
  static struct stat grovel_tmp;
  grovel_uintmax("size", "struct-stat.st_mtime", sizeof(grovel_tmp.st_mtime));
}

static void grovel_3(void) {
  grovel_uintmax("offset", "struct-stat.st_mtime", offsetof(struct stat, st_mtime));
}

static void grovel_4(void) {
  static struct utsname grovel_tmp;
  grovel_uintmax("size", "struct-utsname.sysname", sizeof(grovel_tmp.sysname));
}

static void grovel_5(void) {
#ifdef EADDRINUSE
  grovel_intmax("value", "EADDRINUSE", (intmax_t)(EADDRINUSE));
#endif
}

static void grovel_6(void) {
  const char *grovel_tmp = (((char)-1) < ((char)0)) ? "signed" : "unsigned";
  grovel_symbol("signedness", "char", grovel_tmp);
}

static void grovel_7(void) {
  const char *grovel_tmp = (((pid_t)-1) < ((pid_t)0)) ? "signed" : "unsigned";
  grovel_symbol("signedness", "pid_t", grovel_tmp);
}

static void grovel_8(void) {
  const char *grovel_tmp = (((size_t)-1) < ((size_t)0)) ? "signed" : "unsigned";
  grovel_symbol("signedness", "size_t", grovel_tmp);
}

static void grovel_9(void) {
  grovel_uintmax("size", "pid_t", sizeof(pid_t));
}

static void grovel_10(void) {
#ifdef SQLITE_READONLY
  grovel_intmax("value", "SQLITE_READONLY", (intmax_t)(SQLITE_READONLY));
#endif
}

int main(void) {
  grovel_1();
  grovel_2();
  grovel_3();
  grovel_4();
  grovel_5();
  grovel_6();
  grovel_7();
  grovel_8();
  grovel_9();
  grovel_10();
  return 0;
}