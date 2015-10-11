package main

/*
#include "ruby.h"

extern inline VALUE go_fast_blank(VALUE);
*/
import "C"
import (
	"fmt"
	"strings"
	"unicode"
	"unsafe"
)

//export go_fast_blank
func go_fast_blank(s C.VALUE) C.VALUE {
	gs := C.GoString(C.rb_string_value_cstr(&s))

	if gs == "" || strings.TrimLeftFunc(gs, unicode.IsSpace) == "" {
		return C.Qtrue
	}

	return C.Qfalse
}

//export Init_go_fast_blank
func Init_go_fast_blank() {
	fmt.Println("go_fast_blank init")
	cs := C.CString("blank?")
	defer C.free(unsafe.Pointer(cs))

	C.rb_define_method(C.rb_cString, cs, (*[0]byte)(C.go_fast_blank), 0)
}

func main() {} // Required but ignored
