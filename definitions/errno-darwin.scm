(constant EACCES 13)
(constant EADDRINUSE 48)
(constant EADDRNOTAVAIL 49)
(constant EAFNOSUPPORT 47)
(constant EAGAIN 35)
(constant EALREADY 37)
(constant EAUTH 80)
(constant EBADARCH 86)
(constant EBADEXEC 85)
(constant EBADF 9)
(constant EBADMACHO 88)
(constant EBADMSG 94)
(constant EBADRPC 72)
(constant EBUSY 16)
(constant ECANCELED 89)
(constant ECHILD 10)
(constant ECONNABORTED 53)
(constant ECONNREFUSED 61)
(constant ECONNRESET 54)
(constant EDEADLK 11)
(constant EDESTADDRREQ 39)
(constant EDEVERR 83)
(constant EDOM 33)
(constant EDQUOT 69)
(constant EEXIST 17)
(constant EFAULT 14)
(constant EFBIG 27)
(constant EFTYPE 79)
(constant EHOSTDOWN 64)
(constant EHOSTUNREACH 65)
(constant EIDRM 90)
(constant EILSEQ 92)
(constant EINPROGRESS 36)
(constant EINTR 4)
(constant EINVAL 22)
(constant EIO 5)
(constant EISCONN 56)
(constant EISDIR 21)
(constant ELOOP 62)
(constant EMFILE 24)
(constant EMLINK 31)
(constant EMSGSIZE 40)
(constant EMULTIHOP 95)
(constant ENAMETOOLONG 63)
(constant ENEEDAUTH 81)
(constant ENETDOWN 50)
(constant ENETRESET 52)
(constant ENETUNREACH 51)
(constant ENFILE 23)
(constant ENOATTR 93)
(constant ENOBUFS 55)
(constant ENODATA 96)
(constant ENODEV 19)
(constant ENOENT 2)
(constant ENOEXEC 8)
(constant ENOLCK 77)
(constant ENOLINK 97)
(constant ENOMEM 12)
(constant ENOMSG 91)
(constant ENOPOLICY 103)
(constant ENOPROTOOPT 42)
(constant ENOSPC 28)
(constant ENOSR 98)
(constant ENOSTR 99)
(constant ENOSYS 78)
(constant ENOTBLK 15)
(constant ENOTCONN 57)
(constant ENOTDIR 20)
(constant ENOTEMPTY 66)
(constant ENOTRECOVERABLE 104)
(constant ENOTSOCK 38)
(constant ENOTSUP 45)
(constant ENOTTY 25)
(constant ENXIO 6)
(constant EOPNOTSUPP 102)
(constant EOVERFLOW 84)
(constant EOWNERDEAD 105)
(constant EPERM 1)
(constant EPFNOSUPPORT 46)
(constant EPIPE 32)
(constant EPROCLIM 67)
(constant EPROCUNAVAIL 76)
(constant EPROGMISMATCH 75)
(constant EPROGUNAVAIL 74)
(constant EPROTO 100)
(constant EPROTONOSUPPORT 43)
(constant EPROTOTYPE 41)
(constant EPWROFF 82)
(constant EQFULL 106)
(constant ERANGE 34)
(constant EREMOTE 71)
(constant EROFS 30)
(constant ERPCMISMATCH 73)
(constant ESHLIBVERS 87)
(constant ESHUTDOWN 58)
(constant ESOCKTNOSUPPORT 44)
(constant ESPIPE 29)
(constant ESRCH 3)
(constant ESTALE 70)
(constant ETIME 101)
(constant ETIMEDOUT 60)
(constant ETOOMANYREFS 59)
(constant ETXTBSY 26)
(constant EUSERS 68)
(constant EWOULDBLOCK 35)
(constant EXDEV 18)
(call-constant strerror EACCES "Permission denied")
(call-constant strerror EADDRINUSE "Address already in use")
(call-constant strerror EADDRNOTAVAIL "Can't assign requested address")
(call-constant strerror EAFNOSUPPORT "Address family not supported by protocol family")
(call-constant strerror EAGAIN "Resource temporarily unavailable")
(call-constant strerror EALREADY "Operation already in progress")
(call-constant strerror EAUTH "Authentication error")
(call-constant strerror EBADARCH "Bad CPU type in executable")
(call-constant strerror EBADEXEC "Bad executable (or shared library)")
(call-constant strerror EBADF "Bad file descriptor")
(call-constant strerror EBADMACHO "Malformed Mach-o file")
(call-constant strerror EBADMSG "Bad message")
(call-constant strerror EBADRPC "RPC struct is bad")
(call-constant strerror EBUSY "Resource busy")
(call-constant strerror ECANCELED "Operation canceled")
(call-constant strerror ECHILD "No child processes")
(call-constant strerror ECONNABORTED "Software caused connection abort")
(call-constant strerror ECONNREFUSED "Connection refused")
(call-constant strerror ECONNRESET "Connection reset by peer")
(call-constant strerror EDEADLK "Resource deadlock avoided")
(call-constant strerror EDESTADDRREQ "Destination address required")
(call-constant strerror EDEVERR "Device error")
(call-constant strerror EDOM "Numerical argument out of domain")
(call-constant strerror EDQUOT "Disc quota exceeded")
(call-constant strerror EEXIST "File exists")
(call-constant strerror EFAULT "Bad address")
(call-constant strerror EFBIG "File too large")
(call-constant strerror EFTYPE "Inappropriate file type or format")
(call-constant strerror EHOSTDOWN "Host is down")
(call-constant strerror EHOSTUNREACH "No route to host")
(call-constant strerror EIDRM "Identifier removed")
(call-constant strerror EILSEQ "Illegal byte sequence")
(call-constant strerror EINPROGRESS "Operation now in progress")
(call-constant strerror EINTR "Interrupted system call")
(call-constant strerror EINVAL "Invalid argument")
(call-constant strerror EIO "Input/output error")
(call-constant strerror EISCONN "Socket is already connected")
(call-constant strerror EISDIR "Is a directory")
(call-constant strerror ELOOP "Too many levels of symbolic links")
(call-constant strerror EMFILE "Too many open files")
(call-constant strerror EMLINK "Too many links")
(call-constant strerror EMSGSIZE "Message too long")
(call-constant strerror EMULTIHOP "EMULTIHOP (Reserved)")
(call-constant strerror ENAMETOOLONG "File name too long")
(call-constant strerror ENEEDAUTH "Need authenticator")
(call-constant strerror ENETDOWN "Network is down")
(call-constant strerror ENETRESET "Network dropped connection on reset")
(call-constant strerror ENETUNREACH "Network is unreachable")
(call-constant strerror ENFILE "Too many open files in system")
(call-constant strerror ENOATTR "Attribute not found")
(call-constant strerror ENOBUFS "No buffer space available")
(call-constant strerror ENODATA "No message available on STREAM")
(call-constant strerror ENODEV "Operation not supported by device")
(call-constant strerror ENOENT "No such file or directory")
(call-constant strerror ENOEXEC "Exec format error")
(call-constant strerror ENOLCK "No locks available")
(call-constant strerror ENOLINK "ENOLINK (Reserved)")
(call-constant strerror ENOMEM "Cannot allocate memory")
(call-constant strerror ENOMSG "No message of desired type")
(call-constant strerror ENOPOLICY "Policy not found")
(call-constant strerror ENOPROTOOPT "Protocol not available")
(call-constant strerror ENOSPC "No space left on device")
(call-constant strerror ENOSR "No STREAM resources")
(call-constant strerror ENOSTR "Not a STREAM")
(call-constant strerror ENOSYS "Function not implemented")
(call-constant strerror ENOTBLK "Block device required")
(call-constant strerror ENOTCONN "Socket is not connected")
(call-constant strerror ENOTDIR "Not a directory")
(call-constant strerror ENOTEMPTY "Directory not empty")
(call-constant strerror ENOTRECOVERABLE "State not recoverable")
(call-constant strerror ENOTSOCK "Socket operation on non-socket")
(call-constant strerror ENOTSUP "Operation not supported")
(call-constant strerror ENOTTY "Inappropriate ioctl for device")
(call-constant strerror ENXIO "Device not configured")
(call-constant strerror EOPNOTSUPP "Operation not supported on socket")
(call-constant strerror EOVERFLOW "Value too large to be stored in data type")
(call-constant strerror EOWNERDEAD "Previous owner died")
(call-constant strerror EPERM "Operation not permitted")
(call-constant strerror EPFNOSUPPORT "Protocol family not supported")
(call-constant strerror EPIPE "Broken pipe")
(call-constant strerror EPROCLIM "Too many processes")
(call-constant strerror EPROCUNAVAIL "Bad procedure for program")
(call-constant strerror EPROGMISMATCH "Program version wrong")
(call-constant strerror EPROGUNAVAIL "RPC prog. not avail")
(call-constant strerror EPROTO "Protocol error")
(call-constant strerror EPROTONOSUPPORT "Protocol not supported")
(call-constant strerror EPROTOTYPE "Protocol wrong type for socket")
(call-constant strerror EPWROFF "Device power is off")
(call-constant strerror EQFULL "Interface output queue is full")
(call-constant strerror ERANGE "Result too large")
(call-constant strerror EREMOTE "Too many levels of remote in path")
(call-constant strerror EROFS "Read-only file system")
(call-constant strerror ERPCMISMATCH "RPC version wrong")
(call-constant strerror ESHLIBVERS "Shared library version mismatch")
(call-constant strerror ESHUTDOWN "Can't send after socket shutdown")
(call-constant strerror ESOCKTNOSUPPORT "Socket type not supported")
(call-constant strerror ESPIPE "Illegal seek")
(call-constant strerror ESRCH "No such process")
(call-constant strerror ESTALE "Stale NFS file handle")
(call-constant strerror ETIME "STREAM ioctl timeout")
(call-constant strerror ETIMEDOUT "Operation timed out")
(call-constant strerror ETOOMANYREFS "Too many references: can't splice")
(call-constant strerror ETXTBSY "Text file busy")
(call-constant strerror EUSERS "Too many users")
(call-constant strerror EWOULDBLOCK "Resource temporarily unavailable")
(call-constant strerror EXDEV "Cross-device link")
