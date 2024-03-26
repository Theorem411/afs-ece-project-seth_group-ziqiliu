	.text
	.file	"simplepfor.cpp"
	.file	0 "/afs/ece/project/seth_group/ziqiliu/test" "simplepfor.cpp" md5 0x666eed0d19f266c837e09d83bfdae148
	.file	1 "/usr/include" "stdlib.h" md5 0xf7a1412d75d9e3df251dfc21b02d59ef
	.file	2 "/opt/rh/devtoolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10/bits" "std_abs.h"
	.file	3 "/opt/rh/devtoolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10" "cstdlib"
	.file	4 "/usr/include/bits" "stdlib-float.h" md5 0x4d8319456d5af4c05d02ff17edfe1b26
	.file	5 "/afs" "ece.cmu.edu/project/seth_group/ziqiliu/uli-opencilk-project/build/lib/clang/14.0.6/include/stddef.h" md5 0x2499dd2361b915724b073282bea3a7bc
	.file	6 "/opt/rh/devtoolset-10/root/usr/lib/gcc/x86_64-redhat-linux/10/../../../../include/c++/10" "stdlib.h" md5 0x74812296ae1ebf65f0c19983efc04bc1
	.globl	_Z18__cilkrts_getticksv         # -- Begin function _Z18__cilkrts_getticksv
	.p2align	4, 0x90
	.type	_Z18__cilkrts_getticksv,@function
_Z18__cilkrts_getticksv:                # @_Z18__cilkrts_getticksv
.Lfunc_begin0:
	.loc	0 8 0                           # simplepfor.cpp:8:0
	.cfi_startproc
# %bb.0:                                # %entry
	.loc	0 11 3 prologue_end             # simplepfor.cpp:11:3
	#APP
	rdtsc
	#NO_APP
                                        # kill: def $edx killed $edx def $rdx
.Ltmp0:
	#DEBUG_VALUE: __cilkrts_getticks:a <- $eax
	#DEBUG_VALUE: __cilkrts_getticks:d <- $edx
	.loc	0 12 31                         # simplepfor.cpp:12:31
	movl	%eax, %eax
.Ltmp1:
	.loc	0 12 61 is_stmt 0               # simplepfor.cpp:12:61
	shlq	$32, %rdx
.Ltmp2:
	.loc	0 12 34                         # simplepfor.cpp:12:34
	orq	%rdx, %rax
	.loc	0 12 3                          # simplepfor.cpp:12:3
	retq
.Ltmp3:
.Lfunc_end0:
	.size	_Z18__cilkrts_getticksv, .Lfunc_end0-_Z18__cilkrts_getticksv
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function main
.LCPI1_0:
	.quad	1                               # 0x1
	.quad	2                               # 0x2
.LCPI1_1:
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin1:
	.loc	0 19 0 is_stmt 1                # simplepfor.cpp:19:0
	.cfi_startproc
# %bb.0:                                # %entry
	#DEBUG_VALUE: main:argc <- $edi
	#DEBUG_VALUE: main:argv <- $rsi
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset -64
	.cfi_restore %rbx
	.cfi_restore %r12
	.cfi_restore %r13
	.cfi_restore %r14
	.cfi_restore %r15
	.cfi_restore %rbp
	movq	%rsi, %rbp
.Ltmp4:
	.loc	0 20 23 prologue_end            # simplepfor.cpp:20:23
	movq	8(%rsi), %rdi
.Ltmp5:
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: atol:__nptr <- $rdi
	.loc	1 285 10                        # /usr/include/stdlib.h:285:10
	xorl	%esi, %esi
.Ltmp6:
	#DEBUG_VALUE: main:argv <- $rbp
	movl	$10, %edx
	callq	strtol
.Ltmp7:
	movq	%rax, %rbx
.Ltmp8:
	#DEBUG_VALUE: main:start <- $rbx
	.loc	0 21 21                         # simplepfor.cpp:21:21
	movq	16(%rbp), %rdi
.Ltmp9:
	#DEBUG_VALUE: atol:__nptr <- $rdi
	.loc	1 285 10                        # /usr/include/stdlib.h:285:10
	xorl	%esi, %esi
	movl	$10, %edx
	callq	strtol
.Ltmp10:
	movq	%rax, %r12
.Ltmp11:
	#DEBUG_VALUE: main:end <- $r12
	.loc	0 22 32                         # simplepfor.cpp:22:32
	leaq	(,%rax,4), %rdi
	.loc	0 22 22 is_stmt 0               # simplepfor.cpp:22:22
	callq	malloc
.Ltmp12:
	movq	%rax, %rbp
.Ltmp13:
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:res <- $rbp
	.loc	0 11 3 is_stmt 1                # simplepfor.cpp:11:3
	#APP
	rdtsc
	#NO_APP
	movl	%eax, (%rsp)                    # 4-byte Spill
	movl	%edx, 4(%rsp)                   # 4-byte Spill
.Ltmp14:
	#DEBUG_VALUE: main:startT <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 64 7, DW_OP_constu 32, DW_OP_shl, DW_OP_LLVM_arg 0, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 64 7, DW_OP_or, DW_OP_stack_value] undef
	#DEBUG_VALUE: __cilkrts_getticks:a <- undef
	#DEBUG_VALUE: __cilkrts_getticks:d <- undef
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	.loc	0 26 31                         # simplepfor.cpp:26:31
	movl	%r12d, %eax
	subl	%ebx, %eax
	.loc	0 26 33 is_stmt 0               # simplepfor.cpp:26:33
	jle	.LBB1_12
.Ltmp15:
# %bb.1:                                # %pfor.ph
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	#DEBUG_VALUE: __begin <- 0
	#DEBUG_VALUE: __end <- undef
	.loc	0 26 31                         # simplepfor.cpp:26:31
	cmpl	$2, %eax
	movl	$1, %r14d
	cmovgel	%eax, %r14d
	movslq	%ebx, %r13
	leaq	-1(%r14), %rax
	movl	%r14d, %r15d
	andl	$2047, %r15d                    # imm = 0x7FF
	cmpq	$2047, %rax                     # imm = 0x7FF
	jb	.LBB1_3
.Ltmp16:
# %bb.2:                                # %pfor.ph.new
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	#DEBUG_VALUE: __begin <- 0
	movl	%r14d, %esi
	shrl	$11, %esi
	leaq	3(%r13), %rcx
	.loc	0 26 5                          # simplepfor.cpp:26:5
	xorl	%edi, %edi
	movq	%r13, %rdx
	movq	%rbp, %r8
	callq	.Lmain.outline_pfor.cond.strpm.outer.ls1
.Ltmp17:
.LBB1_3:                                # %pfor.cond.cleanup.strpm-lcssa
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	#DEBUG_VALUE: __begin <- 0
	testq	%r15, %r15
	je	.LBB1_12
.Ltmp18:
# %bb.4:                                # %pfor.cond.epil.preheader
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	#DEBUG_VALUE: __begin <- 0
	movl	%r14d, %eax
	andl	$2147481600, %eax               # imm = 0x7FFFF800
	cmpl	$8, %r15d
	jae	.LBB1_6
.Ltmp19:
# %bb.5:
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	#DEBUG_VALUE: __begin <- 0
	.loc	0 0 5                           # simplepfor.cpp:0:5
	movq	%r15, %r14
	jmp	.LBB1_10
.Ltmp20:
.LBB1_6:                                # %vector.ph75
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	#DEBUG_VALUE: __begin <- 0
	.loc	0 26 5                          # simplepfor.cpp:26:5
	andl	$7, %r14d
	subq	%r14, %r15
	leaq	(%rax,%r13), %rcx
	movdqa	.LCPI1_0(%rip), %xmm0           # xmm0 = [1,2]
	movdqa	.LCPI1_1(%rip), %xmm1           # xmm1 = [4,5,6,7]
	movq	%r15, %rdx
.Ltmp21:
	.p2align	4, 0x90
.LBB1_7:                                # %vector.body74
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	#DEBUG_VALUE: __begin <- 0
	.loc	0 26 14                         # simplepfor.cpp:26:14
	movq	%rcx, %xmm2
	pshufd	$68, %xmm2, %xmm3               # xmm3 = xmm2[0,1,0,1]
	paddq	%xmm0, %xmm3
	leal	3(%rcx), %esi
	punpcklqdq	%xmm3, %xmm2            # xmm2 = xmm2[0],xmm3[0]
	movd	%esi, %xmm4
	shufps	$228, %xmm3, %xmm4              # xmm4 = xmm4[0,1],xmm3[2,3]
	shufps	$40, %xmm4, %xmm2               # xmm2 = xmm2[0,2],xmm4[2,0]
	movd	%ecx, %xmm3
	pshufd	$0, %xmm3, %xmm3                # xmm3 = xmm3[0,0,0,0]
	paddd	%xmm1, %xmm3
.Ltmp22:
	.loc	0 27 16 is_stmt 1               # simplepfor.cpp:27:16
	movups	%xmm2, (%rbp,%rcx,4)
	movdqu	%xmm3, 16(%rbp,%rcx,4)
	addq	$8, %rcx
	addq	$-8, %rdx
	jne	.LBB1_7
.Ltmp23:
# %bb.8:                                # %middle.block72
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	#DEBUG_VALUE: __begin <- 0
	.loc	0 26 5                          # simplepfor.cpp:26:5
	testq	%r14, %r14
	je	.LBB1_12
.Ltmp24:
# %bb.9:
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	#DEBUG_VALUE: __begin <- 0
	.loc	0 0 5 is_stmt 0                 # simplepfor.cpp:0:5
	addq	%r15, %rax
.Ltmp25:
.LBB1_10:                               # %pfor.cond.epil.preheader4
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	#DEBUG_VALUE: __begin <- 0
	.loc	0 26 5                          # simplepfor.cpp:26:5
	leal	(%rbx,%rax), %ecx
	addq	%rax, %r13
	leaq	(,%r13,4), %rax
	addq	%rbp, %rax
	xorl	%edx, %edx
.Ltmp26:
	.p2align	4, 0x90
.LBB1_11:                               # %pfor.cond.epil
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: __init <- $ebx
	#DEBUG_VALUE: __limit <- $r12d
	#DEBUG_VALUE: __begin <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_stack_value] undef
	#DEBUG_VALUE: i <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_arg 0, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 64 5, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 27 16 is_stmt 1               # simplepfor.cpp:27:16
	leal	(%rcx,%rdx), %esi
	movl	%esi, (%rax,%rdx,4)
.Ltmp27:
	#DEBUG_VALUE: __begin <- [DW_OP_LLVM_arg 0, DW_OP_consts 1, DW_OP_LLVM_arg 0, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 26 5                          # simplepfor.cpp:26:5
	addq	$1, %rdx
	cmpq	%rdx, %r14
	jne	.LBB1_11
.Ltmp28:
.LBB1_12:                               # %cleanup
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:start <- $rbx
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	.loc	0 11 3                          # simplepfor.cpp:11:3
	#APP
	rdtsc
	#NO_APP
	movl	%edx, %r13d
.Ltmp29:
	#DEBUG_VALUE: main:endT <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 64 7, DW_OP_constu 32, DW_OP_shl, DW_OP_LLVM_arg 0, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 64 7, DW_OP_or, DW_OP_stack_value] undef
	#DEBUG_VALUE: __cilkrts_getticks:a <- undef
	#DEBUG_VALUE: __cilkrts_getticks:d <- undef
	movl	%eax, %r14d
.Ltmp30:
	#DEBUG_VALUE: main:i <- $rbx
	#DEBUG_VALUE: i <- $rbx
	.loc	0 32 28                         # simplepfor.cpp:32:28
	cmpq	%r12, %rbx
.Ltmp31:
	.loc	0 32 5 is_stmt 0                # simplepfor.cpp:32:5
	jge	.LBB1_14
.Ltmp32:
	.p2align	4, 0x90
.LBB1_13:                               # %for.body
                                        # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: i <- $rbx
	#DEBUG_VALUE: i <- $rbx
	.loc	0 33 36 is_stmt 1               # simplepfor.cpp:33:36
	movl	(%rbp,%rbx,4), %edx
	.loc	0 33 9 is_stmt 0                # simplepfor.cpp:33:9
	movl	$.L.str, %edi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	printf
.Ltmp33:
	.loc	0 32 36 is_stmt 1               # simplepfor.cpp:32:36
	addq	$1, %rbx
.Ltmp34:
	#DEBUG_VALUE: i <- $rbx
	.loc	0 32 28 is_stmt 0               # simplepfor.cpp:32:28
	cmpq	%rbx, %r12
.Ltmp35:
	.loc	0 32 5                          # simplepfor.cpp:32:5
	jne	.LBB1_13
.Ltmp36:
.LBB1_14:                               # %for.cond.cleanup
	#DEBUG_VALUE: main:argc <- [DW_OP_LLVM_entry_value 1] $edi
	#DEBUG_VALUE: main:argv <- [DW_OP_LLVM_entry_value 1] $rsi
	#DEBUG_VALUE: main:end <- $r12
	#DEBUG_VALUE: main:res <- $rbp
	#DEBUG_VALUE: main:endT <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 64 7, DW_OP_constu 32, DW_OP_shl, DW_OP_LLVM_arg 1, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 64 7, DW_OP_or, DW_OP_stack_value] undef, undef
	#DEBUG_VALUE: __cilkrts_getticks:d <- $r13d
	#DEBUG_VALUE: main:endT <- [DW_OP_LLVM_arg 0, DW_OP_constu 4294967296, DW_OP_mul, DW_OP_LLVM_arg 1, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 64 7, DW_OP_or, DW_OP_stack_value] undef
	#DEBUG_VALUE: __cilkrts_getticks:a <- $r14d
	.loc	0 12 31 is_stmt 1               # simplepfor.cpp:12:31
	movl	%r14d, %eax
.Ltmp37:
	#DEBUG_VALUE: main:startT <- [DW_OP_LLVM_arg 0, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 64 7, DW_OP_constu 32, DW_OP_shl, DW_OP_LLVM_arg 1, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 64 7, DW_OP_or, DW_OP_stack_value] undef, undef
	#DEBUG_VALUE: main:endT <- undef
	#DEBUG_VALUE: __cilkrts_getticks:d <- [DW_OP_plus_uconst 4] [$rsp+0]
	#DEBUG_VALUE: main:startT <- [DW_OP_LLVM_arg 0, DW_OP_constu 32, DW_OP_shl, DW_OP_LLVM_arg 1, DW_OP_LLVM_convert 32 7, DW_OP_LLVM_convert 64 7, DW_OP_or, DW_OP_stack_value] undef
	#DEBUG_VALUE: __cilkrts_getticks:a <- [$rsp+0]
	.loc	0 12 31 is_stmt 0               # simplepfor.cpp:12:31
	movl	(%rsp), %ecx                    # 4-byte Reload
.Ltmp38:
	#DEBUG_VALUE: __cilkrts_getticks:a <- $ecx
	#DEBUG_VALUE: main:startT <- [DW_OP_LLVM_arg 0, DW_OP_constu 18446744069414584320, DW_OP_mul, DW_OP_LLVM_arg 1, DW_OP_LLVM_arg 2, DW_OP_minus, DW_OP_plus, DW_OP_stack_value] undef
	.loc	0 12 34                         # simplepfor.cpp:12:34
	subq	%rcx, %rax
.Ltmp39:
	.loc	0 36 13 is_stmt 1               # simplepfor.cpp:36:13
	movq	stderr(%rip), %rdi
	subl	4(%rsp), %r13d                  # 4-byte Folded Reload
.Ltmp40:
	.loc	0 0 13 is_stmt 0                # simplepfor.cpp:0:13
	shlq	$32, %r13
	.loc	0 36 41                         # simplepfor.cpp:36:41
	addq	%rax, %r13
	.loc	0 36 5                          # simplepfor.cpp:36:5
	movl	$.L.str.1, %esi
	movq	%r13, %rdx
	xorl	%eax, %eax
	callq	fprintf
.Ltmp41:
	#DEBUG_VALUE: __cilkrts_getticks:a <- [$rsp+0]
	.loc	0 39 1 is_stmt 1                # simplepfor.cpp:39:1
	movl	$1, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
.Ltmp42:
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
.Ltmp43:
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
.Ltmp44:
	.cfi_def_cfa_offset 8
	retq
.Ltmp45:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function main.outline_pfor.cond.strpm.outer.ls1
.LCPI2_0:
	.quad	1                               # 0x1
	.quad	2                               # 0x2
.LCPI2_1:
	.long	4                               # 0x4
	.long	5                               # 0x5
	.long	6                               # 0x6
	.long	7                               # 0x7
	.text
	.p2align	4, 0x90
	.type	.Lmain.outline_pfor.cond.strpm.outer.ls1,@function
.Lmain.outline_pfor.cond.strpm.outer.ls1: # @main.outline_pfor.cond.strpm.outer.ls1
.Lfunc_begin2:
	.loc	0 19 0                          # simplepfor.cpp:19:0
	.cfi_startproc
# %bb.0:                                # %pfor.ph.new.ls1
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	pushq	%rax
	.cfi_def_cfa_offset -64
	.cfi_restore %rbx
	.cfi_restore %r12
	.cfi_restore %r13
	.cfi_restore %r14
	.cfi_restore %r15
	.cfi_restore %rbp
	movq	%r8, %r13
	movq	%rcx, %r14
	movq	%rdx, %rbp
	movq	%rsi, %r15
.Ltmp46:
	.loc	0 26 5 prologue_end             # simplepfor.cpp:26:5
	movq	%rsi, %rax
	subq	%rdi, %rax
	cmpq	$2, %rax
	jb	.LBB2_1
	.p2align	4, 0x90
.LBB2_7:                                # %.split.split
                                        # =>This Inner Loop Header: Depth=1
	shrq	%rax
	movq	%rax, %r12
	addq	%rdi, %r12
	movq	%r12, %rsi
	movq	%rbp, %rdx
	movq	%r14, %rcx
	movq	%r13, %r8
	callq	.Lmain.outline_pfor.cond.strpm.outer.ls1
.Ltmp47:
	movq	%r15, %rax
	subq	%r12, %rax
	movq	%r12, %rdi
	cmpq	$1, %rax
	ja	.LBB2_7
	jmp	.LBB2_2
.LBB2_1:
	.loc	0 0 5 is_stmt 0                 # simplepfor.cpp:0:5
	movq	%rdi, %r12
.LBB2_2:                                # %pfor.body.entry.strpm.outer.ls1.preheader
	.loc	0 26 5                          # simplepfor.cpp:26:5
	movq	%r12, %rax
	shlq	$11, %rax
	addq	%rax, %r14
	addq	%rax, %rbp
	leaq	16(,%rbp,4), %rbx
	addq	%r13, %rbx
	.p2align	4, 0x90
.LBB2_3:                                # %pfor.body.entry.strpm.outer.ls1
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_4 Depth 2
	movl	$.Lloopname, %edi
	callq	_ZN17InstrumentLibrary7_choiceEPKc@PLT
.Ltmp48:
	callq	_ZN17InstrumentLibrary11_rc_bump_upEv@PLT
.Ltmp49:
	.loc	0 0 5                           # simplepfor.cpp:0:5
	xorl	%eax, %eax
	movdqa	.LCPI2_0(%rip), %xmm3           # xmm3 = [1,2]
	movdqa	.LCPI2_1(%rip), %xmm4           # xmm4 = [4,5,6,7]
	.p2align	4, 0x90
.LBB2_4:                                # %vector.body.ls1
                                        #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
.Ltmp50:
	.loc	0 26 14                         # simplepfor.cpp:26:14
	leaq	(%rax,%rbp), %rcx
	movq	%rcx, %xmm0
	pshufd	$68, %xmm0, %xmm1               # xmm1 = xmm0[0,1,0,1]
	paddq	%xmm3, %xmm1
	leal	(%r14,%rax), %edx
	punpcklqdq	%xmm1, %xmm0            # xmm0 = xmm0[0],xmm1[0]
	movd	%edx, %xmm2
	shufps	$228, %xmm1, %xmm2              # xmm2 = xmm2[0,1],xmm1[2,3]
	shufps	$40, %xmm2, %xmm0               # xmm0 = xmm0[0,2],xmm2[2,0]
	movd	%ecx, %xmm1
	pshufd	$0, %xmm1, %xmm1                # xmm1 = xmm1[0,0,0,0]
	paddd	%xmm4, %xmm1
.Ltmp51:
	.loc	0 27 16 is_stmt 1               # simplepfor.cpp:27:16
	movups	%xmm0, -16(%rbx,%rax,4)
	movdqu	%xmm1, (%rbx,%rax,4)
	addq	$8, %rax
	cmpq	$2048, %rax                     # imm = 0x800
	jne	.LBB2_4
.Ltmp52:
# %bb.5:                                # %pfor.inc.strpm.outer.ls1
                                        #   in Loop: Header=BB2_3 Depth=1
	.loc	0 26 5                          # simplepfor.cpp:26:5
	callq	_ZN17InstrumentLibrary13_rc_bump_downEv@PLT
.Ltmp53:
	addq	$1, %r12
	addq	$2048, %r14                     # imm = 0x800
	addq	$8192, %rbx                     # imm = 0x2000
	addq	$2048, %rbp                     # imm = 0x800
	cmpq	%r15, %r12
	jne	.LBB2_3
# %bb.6:                                # %pfor.cond.cleanup.strpm-lcssa.loopexit.ls1.split
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Ltmp54:
.Lfunc_end2:
	.size	.Lmain.outline_pfor.cond.strpm.outer.ls1, .Lfunc_end2-.Lmain.outline_pfor.cond.strpm.outer.ls1
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"res[%ld]=%d\n"
	.size	.L.str, 13

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Time: %llu\n"
	.size	.L.str.1, 12

	.type	.Lloopname,@object              # @loopname
.Lloopname:
	.asciz	"pfor.ph.new"
	.size	.Lloopname, 12

	.section	.debug_loclists,"",@progbits
	.long	.Ldebug_list_header_end0-.Ldebug_list_header_start0 # Length
.Ldebug_list_header_start0:
	.short	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.long	15                              # Offset entry count
.Lloclists_table_base0:
	.long	.Ldebug_loc0-.Lloclists_table_base0
	.long	.Ldebug_loc1-.Lloclists_table_base0
	.long	.Ldebug_loc2-.Lloclists_table_base0
	.long	.Ldebug_loc3-.Lloclists_table_base0
	.long	.Ldebug_loc4-.Lloclists_table_base0
	.long	.Ldebug_loc5-.Lloclists_table_base0
	.long	.Ldebug_loc6-.Lloclists_table_base0
	.long	.Ldebug_loc7-.Lloclists_table_base0
	.long	.Ldebug_loc8-.Lloclists_table_base0
	.long	.Ldebug_loc9-.Lloclists_table_base0
	.long	.Ldebug_loc10-.Lloclists_table_base0
	.long	.Ldebug_loc11-.Lloclists_table_base0
	.long	.Ldebug_loc12-.Lloclists_table_base0
	.long	.Ldebug_loc13-.Lloclists_table_base0
	.long	.Ldebug_loc14-.Lloclists_table_base0
.Ldebug_loc0:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp1-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	80                              # super-register DW_OP_reg0
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc1:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp0-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp2-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	81                              # super-register DW_OP_reg1
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc2:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin1-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp5-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # super-register DW_OP_reg5
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Lfunc_end1-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	85                              # super-register DW_OP_reg5
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc3:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Lfunc_begin1-.Lfunc_begin0    #   starting offset
	.uleb128 .Ltmp6-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	84                              # DW_OP_reg4
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp13-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end1-.Lfunc_begin0      #   ending offset
	.byte	4                               # Loc expr size
	.byte	163                             # DW_OP_entry_value
	.byte	1                               # 1
	.byte	84                              # DW_OP_reg4
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc4:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp5-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp7-.Lfunc_begin0           #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc5:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp8-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp32-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc6:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp9-.Lfunc_begin0           #   starting offset
	.uleb128 .Ltmp10-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	85                              # DW_OP_reg5
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc7:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp11-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp42-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	92                              # DW_OP_reg12
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc8:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp44-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	86                              # DW_OP_reg6
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc9:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp37-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp38-.Lfunc_begin0          #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	0                               # 0
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp38-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp41-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	82                              # super-register DW_OP_reg2
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc10:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp37-.Lfunc_begin0          #   starting offset
	.uleb128 .Lfunc_end1-.Lfunc_begin0      #   ending offset
	.byte	2                               # Loc expr size
	.byte	119                             # DW_OP_breg7
	.byte	4                               # 4
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc11:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp15-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp26-.Lfunc_begin0          #   ending offset
	.byte	3                               # Loc expr size
	.byte	17                              # DW_OP_consts
	.byte	0                               # 0
	.byte	159                             # DW_OP_stack_value
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc12:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp36-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp43-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	94                              # super-register DW_OP_reg14
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc13:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp36-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp40-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	93                              # super-register DW_OP_reg13
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_loc14:
	.byte	4                               # DW_LLE_offset_pair
	.uleb128 .Ltmp30-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp32-.Lfunc_begin0          #   ending offset
	.byte	1                               # Loc expr size
	.byte	83                              # DW_OP_reg3
	.byte	0                               # DW_LLE_end_of_list
.Ldebug_list_header_end0:
	.section	.debug_abbrev,"",@progbits
	.byte	1                               # Abbreviation Code
	.byte	17                              # DW_TAG_compile_unit
	.byte	1                               # DW_CHILDREN_yes
	.byte	37                              # DW_AT_producer
	.byte	37                              # DW_FORM_strx1
	.byte	19                              # DW_AT_language
	.byte	5                               # DW_FORM_data2
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	114                             # DW_AT_str_offsets_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	16                              # DW_AT_stmt_list
	.byte	23                              # DW_FORM_sec_offset
	.byte	27                              # DW_AT_comp_dir
	.byte	37                              # DW_FORM_strx1
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	115                             # DW_AT_addr_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	116                             # DW_AT_rnglists_base
	.byte	23                              # DW_FORM_sec_offset
	.ascii	"\214\001"                      # DW_AT_loclists_base
	.byte	23                              # DW_FORM_sec_offset
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	2                               # Abbreviation Code
	.byte	36                              # DW_TAG_base_type
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	62                              # DW_AT_encoding
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	3                               # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	4                               # Abbreviation Code
	.byte	57                              # DW_TAG_namespace
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	5                               # Abbreviation Code
	.byte	8                               # DW_TAG_imported_declaration
	.byte	0                               # DW_CHILDREN_no
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	24                              # DW_AT_import
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	6                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	110                             # DW_AT_linkage_name
	.byte	37                              # DW_FORM_strx1
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	7                               # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	8                               # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	9                               # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	10                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	0                               # DW_CHILDREN_no
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	11                              # Abbreviation Code
	.byte	19                              # DW_TAG_structure_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	54                              # DW_AT_calling_convention
	.byte	11                              # DW_FORM_data1
	.byte	11                              # DW_AT_byte_size
	.byte	11                              # DW_FORM_data1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	12                              # Abbreviation Code
	.byte	13                              # DW_TAG_member
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	56                              # DW_AT_data_member_location
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	13                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.ascii	"\207\001"                      # DW_AT_noreturn
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	14                              # Abbreviation Code
	.byte	21                              # DW_TAG_subroutine_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	15                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	16                              # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	17                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	18                              # Abbreviation Code
	.byte	15                              # DW_TAG_pointer_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	19                              # Abbreviation Code
	.byte	38                              # DW_TAG_const_type
	.byte	0                               # DW_CHILDREN_no
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	20                              # Abbreviation Code
	.byte	22                              # DW_TAG_typedef
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	21                              # Abbreviation Code
	.byte	21                              # DW_TAG_subroutine_type
	.byte	1                               # DW_CHILDREN_yes
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	22                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.ascii	"\207\001"                      # DW_AT_noreturn
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	23                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	24                              # Abbreviation Code
	.byte	55                              # DW_TAG_restrict_type
	.byte	0                               # DW_CHILDREN_no
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	25                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	60                              # DW_AT_declaration
	.byte	25                              # DW_FORM_flag_present
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	26                              # Abbreviation Code
	.byte	58                              # DW_TAG_imported_module
	.byte	0                               # DW_CHILDREN_no
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	24                              # DW_AT_import
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	27                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	28                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	29                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	32                              # DW_AT_inline
	.byte	33                              # DW_FORM_implicit_const
	.byte	1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	30                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	5                               # DW_FORM_data2
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	31                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	110                             # DW_AT_linkage_name
	.byte	37                              # DW_FORM_strx1
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	32                              # DW_AT_inline
	.byte	33                              # DW_FORM_implicit_const
	.byte	1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	32                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	33                              # Abbreviation Code
	.byte	46                              # DW_TAG_subprogram
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	64                              # DW_AT_frame_base
	.byte	24                              # DW_FORM_exprloc
	.byte	122                             # DW_AT_call_all_calls
	.byte	25                              # DW_FORM_flag_present
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	63                              # DW_AT_external
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	34                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	35                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	36                              # Abbreviation Code
	.byte	29                              # DW_TAG_inlined_subroutine
	.byte	1                               # DW_CHILDREN_yes
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	88                              # DW_AT_call_file
	.byte	11                              # DW_FORM_data1
	.byte	89                              # DW_AT_call_line
	.byte	11                              # DW_FORM_data1
	.byte	87                              # DW_AT_call_column
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	37                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	38                              # Abbreviation Code
	.byte	29                              # DW_TAG_inlined_subroutine
	.byte	1                               # DW_CHILDREN_yes
	.byte	49                              # DW_AT_abstract_origin
	.byte	19                              # DW_FORM_ref4
	.byte	85                              # DW_AT_ranges
	.byte	35                              # DW_FORM_rnglistx
	.byte	88                              # DW_AT_call_file
	.byte	11                              # DW_FORM_data1
	.byte	89                              # DW_AT_call_line
	.byte	11                              # DW_FORM_data1
	.byte	87                              # DW_AT_call_column
	.byte	11                              # DW_FORM_data1
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	39                              # Abbreviation Code
	.byte	11                              # DW_TAG_lexical_block
	.byte	1                               # DW_CHILDREN_yes
	.byte	17                              # DW_AT_low_pc
	.byte	27                              # DW_FORM_addrx
	.byte	18                              # DW_AT_high_pc
	.byte	6                               # DW_FORM_data4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	40                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	52                              # DW_AT_artificial
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	41                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	34                              # DW_FORM_loclistx
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	52                              # DW_AT_artificial
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	42                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	52                              # DW_AT_artificial
	.byte	25                              # DW_FORM_flag_present
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	43                              # Abbreviation Code
	.byte	52                              # DW_TAG_variable
	.byte	0                               # DW_CHILDREN_no
	.byte	2                               # DW_AT_location
	.byte	24                              # DW_FORM_exprloc
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	44                              # Abbreviation Code
	.byte	72                              # DW_TAG_call_site
	.byte	0                               # DW_CHILDREN_no
	.byte	127                             # DW_AT_call_origin
	.byte	19                              # DW_FORM_ref4
	.byte	125                             # DW_AT_call_return_pc
	.byte	27                              # DW_FORM_addrx
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	45                              # Abbreviation Code
	.byte	5                               # DW_TAG_formal_parameter
	.byte	0                               # DW_CHILDREN_no
	.byte	3                               # DW_AT_name
	.byte	37                              # DW_FORM_strx1
	.byte	58                              # DW_AT_decl_file
	.byte	11                              # DW_FORM_data1
	.byte	59                              # DW_AT_decl_line
	.byte	11                              # DW_FORM_data1
	.byte	73                              # DW_AT_type
	.byte	19                              # DW_FORM_ref4
	.byte	0                               # EOM(1)
	.byte	0                               # EOM(2)
	.byte	0                               # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	5                               # DWARF version number
	.byte	1                               # DWARF Unit Type
	.byte	8                               # Address Size (in bytes)
	.long	.debug_abbrev                   # Offset Into Abbrev. Section
	.byte	1                               # Abbrev [1] 0xc:0x7d7 DW_TAG_compile_unit
	.byte	0                               # DW_AT_producer
	.short	33                              # DW_AT_language
	.byte	1                               # DW_AT_name
	.long	.Lstr_offsets_base0             # DW_AT_str_offsets_base
	.long	.Lline_table_start0             # DW_AT_stmt_list
	.byte	2                               # DW_AT_comp_dir
	.byte	0                               # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin0       # DW_AT_high_pc
	.long	.Laddr_table_base0              # DW_AT_addr_base
	.long	.Lrnglists_table_base0          # DW_AT_rnglists_base
	.long	.Lloclists_table_base0          # DW_AT_loclists_base
	.byte	2                               # Abbrev [2] 0x2b:0x4 DW_TAG_base_type
	.byte	3                               # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x2f:0x5 DW_TAG_pointer_type
	.long	52                              # DW_AT_type
	.byte	2                               # Abbrev [2] 0x34:0x4 DW_TAG_base_type
	.byte	4                               # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x38:0x5 DW_TAG_pointer_type
	.long	61                              # DW_AT_type
	.byte	3                               # Abbrev [3] 0x3d:0x5 DW_TAG_pointer_type
	.long	66                              # DW_AT_type
	.byte	2                               # Abbrev [2] 0x42:0x4 DW_TAG_base_type
	.byte	5                               # DW_AT_name
	.byte	6                               # DW_AT_encoding
	.byte	1                               # DW_AT_byte_size
	.byte	4                               # Abbrev [4] 0x46:0x138 DW_TAG_namespace
	.byte	6                               # DW_AT_name
	.byte	5                               # Abbrev [5] 0x48:0x7 DW_TAG_imported_declaration
	.byte	2                               # DW_AT_decl_file
	.byte	52                              # DW_AT_decl_line
	.long	382                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x4f:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	127                             # DW_AT_decl_line
	.long	397                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x56:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	128                             # DW_AT_decl_line
	.long	406                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5d:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	130                             # DW_AT_decl_line
	.long	442                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x64:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	134                             # DW_AT_decl_line
	.long	447                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x6b:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	137                             # DW_AT_decl_line
	.long	468                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x72:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	140                             # DW_AT_decl_line
	.long	483                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x79:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	141                             # DW_AT_decl_line
	.long	511                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x80:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	142                             # DW_AT_decl_line
	.long	526                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x87:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	143                             # DW_AT_decl_line
	.long	527                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x8e:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	144                             # DW_AT_decl_line
	.long	611                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x95:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	145                             # DW_AT_decl_line
	.long	631                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x9c:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	146                             # DW_AT_decl_line
	.long	651                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xa3:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	147                             # DW_AT_decl_line
	.long	662                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xaa:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	148                             # DW_AT_decl_line
	.long	673                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xb1:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	149                             # DW_AT_decl_line
	.long	688                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xb8:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	150                             # DW_AT_decl_line
	.long	703                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xbf:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	151                             # DW_AT_decl_line
	.long	723                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xc6:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	153                             # DW_AT_decl_line
	.long	738                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xcd:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	154                             # DW_AT_decl_line
	.long	758                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xd4:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	155                             # DW_AT_decl_line
	.long	802                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xdb:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	157                             # DW_AT_decl_line
	.long	827                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xe2:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	160                             # DW_AT_decl_line
	.long	853                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xe9:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	163                             # DW_AT_decl_line
	.long	864                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xf0:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	164                             # DW_AT_decl_line
	.long	873                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xf7:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	165                             # DW_AT_decl_line
	.long	893                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0xfe:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	166                             # DW_AT_decl_line
	.long	908                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x105:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	167                             # DW_AT_decl_line
	.long	932                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x10c:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	168                             # DW_AT_decl_line
	.long	956                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x113:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	169                             # DW_AT_decl_line
	.long	980                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x11a:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	171                             # DW_AT_decl_line
	.long	995                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x121:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	172                             # DW_AT_decl_line
	.long	1040                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x128:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	240                             # DW_AT_decl_line
	.long	1146                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x12f:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	242                             # DW_AT_decl_line
	.long	1182                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x136:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	244                             # DW_AT_decl_line
	.long	1193                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x13d:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	245                             # DW_AT_decl_line
	.long	1125                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x144:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	246                             # DW_AT_decl_line
	.long	1208                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x14b:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	248                             # DW_AT_decl_line
	.long	1228                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x152:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	249                             # DW_AT_decl_line
	.long	1291                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x159:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	250                             # DW_AT_decl_line
	.long	1243                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x160:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	251                             # DW_AT_decl_line
	.long	1267                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x167:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	252                             # DW_AT_decl_line
	.long	1314                            # DW_AT_import
	.byte	6                               # Abbrev [6] 0x16e:0xf DW_TAG_subprogram
	.byte	61                              # DW_AT_linkage_name
	.byte	7                               # DW_AT_name
	.byte	2                               # DW_AT_decl_file
	.byte	103                             # DW_AT_decl_line
	.long	1386                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x177:0x5 DW_TAG_formal_parameter
	.long	1386                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x17e:0xf DW_TAG_subprogram
	.byte	7                               # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	770                             # DW_AT_decl_line
	.long	52                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x187:0x5 DW_TAG_formal_parameter
	.long	52                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x18d:0x8 DW_TAG_typedef
	.long	405                             # DW_AT_type
	.byte	8                               # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	101                             # DW_AT_decl_line
	.byte	10                              # Abbrev [10] 0x195:0x1 DW_TAG_structure_type
                                        # DW_AT_declaration
	.byte	9                               # Abbrev [9] 0x196:0x8 DW_TAG_typedef
	.long	414                             # DW_AT_type
	.byte	12                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	109                             # DW_AT_decl_line
	.byte	11                              # Abbrev [11] 0x19e:0x18 DW_TAG_structure_type
	.byte	5                               # DW_AT_calling_convention
	.byte	16                              # DW_AT_byte_size
	.byte	1                               # DW_AT_decl_file
	.byte	105                             # DW_AT_decl_line
	.byte	12                              # Abbrev [12] 0x1a3:0x9 DW_TAG_member
	.byte	9                               # DW_AT_name
	.long	438                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	107                             # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	12                              # Abbrev [12] 0x1ac:0x9 DW_TAG_member
	.byte	11                              # DW_AT_name
	.long	438                             # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	108                             # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	2                               # Abbrev [2] 0x1b6:0x4 DW_TAG_base_type
	.byte	10                              # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	13                              # Abbrev [13] 0x1ba:0x5 DW_TAG_subprogram
	.byte	13                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	514                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
                                        # DW_AT_noreturn
	.byte	8                               # Abbrev [8] 0x1bf:0xf DW_TAG_subprogram
	.byte	14                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	518                             # DW_AT_decl_line
	.long	52                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x1c8:0x5 DW_TAG_formal_parameter
	.long	462                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	3                               # Abbrev [3] 0x1ce:0x5 DW_TAG_pointer_type
	.long	467                             # DW_AT_type
	.byte	14                              # Abbrev [14] 0x1d3:0x1 DW_TAG_subroutine_type
	.byte	8                               # Abbrev [8] 0x1d4:0xf DW_TAG_subprogram
	.byte	15                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	523                             # DW_AT_decl_line
	.long	52                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x1dd:0x5 DW_TAG_formal_parameter
	.long	462                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0x1e3:0xe DW_TAG_subprogram
	.byte	16                              # DW_AT_name
	.byte	4                               # DW_AT_decl_file
	.byte	26                              # DW_AT_decl_line
	.long	497                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x1eb:0x5 DW_TAG_formal_parameter
	.long	501                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	2                               # Abbrev [2] 0x1f1:0x4 DW_TAG_base_type
	.byte	17                              # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	3                               # Abbrev [3] 0x1f5:0x5 DW_TAG_pointer_type
	.long	506                             # DW_AT_type
	.byte	16                              # Abbrev [16] 0x1fa:0x5 DW_TAG_const_type
	.long	66                              # DW_AT_type
	.byte	8                               # Abbrev [8] 0x1ff:0xf DW_TAG_subprogram
	.byte	18                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	278                             # DW_AT_decl_line
	.long	52                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x208:0x5 DW_TAG_formal_parameter
	.long	501                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	17                              # Abbrev [17] 0x20e:0x1 DW_TAG_subprogram
	.byte	8                               # Abbrev [8] 0x20f:0x23 DW_TAG_subprogram
	.byte	19                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	754                             # DW_AT_decl_line
	.long	562                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x218:0x5 DW_TAG_formal_parameter
	.long	563                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x21d:0x5 DW_TAG_formal_parameter
	.long	563                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x222:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x227:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x22c:0x5 DW_TAG_formal_parameter
	.long	581                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	18                              # Abbrev [18] 0x232:0x1 DW_TAG_pointer_type
	.byte	3                               # Abbrev [3] 0x233:0x5 DW_TAG_pointer_type
	.long	568                             # DW_AT_type
	.byte	19                              # Abbrev [19] 0x238:0x1 DW_TAG_const_type
	.byte	9                               # Abbrev [9] 0x239:0x8 DW_TAG_typedef
	.long	577                             # DW_AT_type
	.byte	21                              # DW_AT_name
	.byte	5                               # DW_AT_decl_file
	.byte	46                              # DW_AT_decl_line
	.byte	2                               # Abbrev [2] 0x241:0x4 DW_TAG_base_type
	.byte	20                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	20                              # Abbrev [20] 0x245:0x9 DW_TAG_typedef
	.long	590                             # DW_AT_type
	.byte	22                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	741                             # DW_AT_decl_line
	.byte	3                               # Abbrev [3] 0x24e:0x5 DW_TAG_pointer_type
	.long	595                             # DW_AT_type
	.byte	21                              # Abbrev [21] 0x253:0x10 DW_TAG_subroutine_type
	.long	52                              # DW_AT_type
	.byte	7                               # Abbrev [7] 0x258:0x5 DW_TAG_formal_parameter
	.long	563                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x25d:0x5 DW_TAG_formal_parameter
	.long	563                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x263:0x14 DW_TAG_subprogram
	.byte	23                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	467                             # DW_AT_decl_line
	.long	562                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x26c:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x271:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x277:0x14 DW_TAG_subprogram
	.byte	24                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	784                             # DW_AT_decl_line
	.long	397                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x280:0x5 DW_TAG_formal_parameter
	.long	52                              # DW_AT_type
	.byte	7                               # Abbrev [7] 0x285:0x5 DW_TAG_formal_parameter
	.long	52                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	22                              # Abbrev [22] 0x28b:0xb DW_TAG_subprogram
	.byte	25                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	542                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
                                        # DW_AT_noreturn
	.byte	7                               # Abbrev [7] 0x290:0x5 DW_TAG_formal_parameter
	.long	52                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	23                              # Abbrev [23] 0x296:0xb DW_TAG_subprogram
	.byte	26                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	482                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x29b:0x5 DW_TAG_formal_parameter
	.long	562                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x2a1:0xf DW_TAG_subprogram
	.byte	27                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	563                             # DW_AT_decl_line
	.long	61                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x2aa:0x5 DW_TAG_formal_parameter
	.long	501                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x2b0:0xf DW_TAG_subprogram
	.byte	28                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	771                             # DW_AT_decl_line
	.long	438                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x2b9:0x5 DW_TAG_formal_parameter
	.long	438                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x2bf:0x14 DW_TAG_subprogram
	.byte	29                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	786                             # DW_AT_decl_line
	.long	406                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x2c8:0x5 DW_TAG_formal_parameter
	.long	438                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x2cd:0x5 DW_TAG_formal_parameter
	.long	438                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x2d3:0xf DW_TAG_subprogram
	.byte	30                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	465                             # DW_AT_decl_line
	.long	562                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x2dc:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x2e2:0x14 DW_TAG_subprogram
	.byte	31                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	859                             # DW_AT_decl_line
	.long	52                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x2eb:0x5 DW_TAG_formal_parameter
	.long	501                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x2f0:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x2f6:0x19 DW_TAG_subprogram
	.byte	32                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	870                             # DW_AT_decl_line
	.long	569                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x2ff:0x5 DW_TAG_formal_parameter
	.long	783                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x304:0x5 DW_TAG_formal_parameter
	.long	797                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x309:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	24                              # Abbrev [24] 0x30f:0x5 DW_TAG_restrict_type
	.long	788                             # DW_AT_type
	.byte	3                               # Abbrev [3] 0x314:0x5 DW_TAG_pointer_type
	.long	793                             # DW_AT_type
	.byte	2                               # Abbrev [2] 0x319:0x4 DW_TAG_base_type
	.byte	33                              # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	24                              # Abbrev [24] 0x31d:0x5 DW_TAG_restrict_type
	.long	501                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x322:0x19 DW_TAG_subprogram
	.byte	34                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	862                             # DW_AT_decl_line
	.long	52                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x32b:0x5 DW_TAG_formal_parameter
	.long	783                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x330:0x5 DW_TAG_formal_parameter
	.long	797                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x335:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	23                              # Abbrev [23] 0x33b:0x1a DW_TAG_subprogram
	.byte	35                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	760                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x340:0x5 DW_TAG_formal_parameter
	.long	562                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x345:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x34a:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x34f:0x5 DW_TAG_formal_parameter
	.long	581                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	22                              # Abbrev [22] 0x355:0xb DW_TAG_subprogram
	.byte	36                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	548                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
                                        # DW_AT_noreturn
	.byte	7                               # Abbrev [7] 0x35a:0x5 DW_TAG_formal_parameter
	.long	52                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	25                              # Abbrev [25] 0x360:0x9 DW_TAG_subprogram
	.byte	37                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	374                             # DW_AT_decl_line
	.long	52                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	8                               # Abbrev [8] 0x369:0x14 DW_TAG_subprogram
	.byte	38                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	479                             # DW_AT_decl_line
	.long	562                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x372:0x5 DW_TAG_formal_parameter
	.long	562                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x377:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	23                              # Abbrev [23] 0x37d:0xb DW_TAG_subprogram
	.byte	39                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	376                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x382:0x5 DW_TAG_formal_parameter
	.long	904                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	2                               # Abbrev [2] 0x388:0x4 DW_TAG_base_type
	.byte	40                              # DW_AT_name
	.byte	7                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	15                              # Abbrev [15] 0x38c:0x13 DW_TAG_subprogram
	.byte	41                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	164                             # DW_AT_decl_line
	.long	497                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x394:0x5 DW_TAG_formal_parameter
	.long	797                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x399:0x5 DW_TAG_formal_parameter
	.long	927                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	24                              # Abbrev [24] 0x39f:0x5 DW_TAG_restrict_type
	.long	56                              # DW_AT_type
	.byte	15                              # Abbrev [15] 0x3a4:0x18 DW_TAG_subprogram
	.byte	42                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	183                             # DW_AT_decl_line
	.long	438                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x3ac:0x5 DW_TAG_formal_parameter
	.long	797                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x3b1:0x5 DW_TAG_formal_parameter
	.long	927                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x3b6:0x5 DW_TAG_formal_parameter
	.long	52                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0x3bc:0x18 DW_TAG_subprogram
	.byte	43                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	187                             # DW_AT_decl_line
	.long	577                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x3c4:0x5 DW_TAG_formal_parameter
	.long	797                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x3c9:0x5 DW_TAG_formal_parameter
	.long	927                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x3ce:0x5 DW_TAG_formal_parameter
	.long	52                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x3d4:0xf DW_TAG_subprogram
	.byte	44                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	716                             # DW_AT_decl_line
	.long	52                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x3dd:0x5 DW_TAG_formal_parameter
	.long	501                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x3e3:0x19 DW_TAG_subprogram
	.byte	45                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	873                             # DW_AT_decl_line
	.long	569                             # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x3ec:0x5 DW_TAG_formal_parameter
	.long	1020                            # DW_AT_type
	.byte	7                               # Abbrev [7] 0x3f1:0x5 DW_TAG_formal_parameter
	.long	1025                            # DW_AT_type
	.byte	7                               # Abbrev [7] 0x3f6:0x5 DW_TAG_formal_parameter
	.long	569                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	24                              # Abbrev [24] 0x3fc:0x5 DW_TAG_restrict_type
	.long	61                              # DW_AT_type
	.byte	24                              # Abbrev [24] 0x401:0x5 DW_TAG_restrict_type
	.long	1030                            # DW_AT_type
	.byte	3                               # Abbrev [3] 0x406:0x5 DW_TAG_pointer_type
	.long	1035                            # DW_AT_type
	.byte	16                              # Abbrev [16] 0x40b:0x5 DW_TAG_const_type
	.long	793                             # DW_AT_type
	.byte	8                               # Abbrev [8] 0x410:0x14 DW_TAG_subprogram
	.byte	46                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	866                             # DW_AT_decl_line
	.long	52                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x419:0x5 DW_TAG_formal_parameter
	.long	61                              # DW_AT_type
	.byte	7                               # Abbrev [7] 0x41e:0x5 DW_TAG_formal_parameter
	.long	793                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	4                               # Abbrev [4] 0x424:0x56 DW_TAG_namespace
	.byte	47                              # DW_AT_name
	.byte	5                               # Abbrev [5] 0x426:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	200                             # DW_AT_decl_line
	.long	1146                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x42d:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	206                             # DW_AT_decl_line
	.long	1182                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x434:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	210                             # DW_AT_decl_line
	.long	1193                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x43b:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	216                             # DW_AT_decl_line
	.long	1208                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x442:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	227                             # DW_AT_decl_line
	.long	1228                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x449:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	228                             # DW_AT_decl_line
	.long	1243                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x450:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	229                             # DW_AT_decl_line
	.long	1267                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x457:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	231                             # DW_AT_decl_line
	.long	1291                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x45e:0x7 DW_TAG_imported_declaration
	.byte	3                               # DW_AT_decl_file
	.byte	232                             # DW_AT_decl_line
	.long	1314                            # DW_AT_import
	.byte	6                               # Abbrev [6] 0x465:0x14 DW_TAG_subprogram
	.byte	60                              # DW_AT_linkage_name
	.byte	24                              # DW_AT_name
	.byte	3                               # DW_AT_decl_file
	.byte	213                             # DW_AT_decl_line
	.long	1146                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x46e:0x5 DW_TAG_formal_parameter
	.long	1178                            # DW_AT_type
	.byte	7                               # Abbrev [7] 0x473:0x5 DW_TAG_formal_parameter
	.long	1178                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	9                               # Abbrev [9] 0x47a:0x8 DW_TAG_typedef
	.long	1154                            # DW_AT_type
	.byte	49                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	121                             # DW_AT_decl_line
	.byte	11                              # Abbrev [11] 0x482:0x18 DW_TAG_structure_type
	.byte	5                               # DW_AT_calling_convention
	.byte	16                              # DW_AT_byte_size
	.byte	1                               # DW_AT_decl_file
	.byte	117                             # DW_AT_decl_line
	.byte	12                              # Abbrev [12] 0x487:0x9 DW_TAG_member
	.byte	9                               # DW_AT_name
	.long	1178                            # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	119                             # DW_AT_decl_line
	.byte	0                               # DW_AT_data_member_location
	.byte	12                              # Abbrev [12] 0x490:0x9 DW_TAG_member
	.byte	11                              # DW_AT_name
	.long	1178                            # DW_AT_type
	.byte	1                               # DW_AT_decl_file
	.byte	120                             # DW_AT_decl_line
	.byte	8                               # DW_AT_data_member_location
	.byte	0                               # End Of Children Mark
	.byte	2                               # Abbrev [2] 0x49a:0x4 DW_TAG_base_type
	.byte	48                              # DW_AT_name
	.byte	5                               # DW_AT_encoding
	.byte	8                               # DW_AT_byte_size
	.byte	22                              # Abbrev [22] 0x49e:0xb DW_TAG_subprogram
	.byte	50                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	556                             # DW_AT_decl_line
                                        # DW_AT_declaration
                                        # DW_AT_external
                                        # DW_AT_noreturn
	.byte	7                               # Abbrev [7] 0x4a3:0x5 DW_TAG_formal_parameter
	.long	52                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x4a9:0xf DW_TAG_subprogram
	.byte	51                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	775                             # DW_AT_decl_line
	.long	1178                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x4b2:0x5 DW_TAG_formal_parameter
	.long	1178                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x4b8:0x14 DW_TAG_subprogram
	.byte	52                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	792                             # DW_AT_decl_line
	.long	1146                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x4c1:0x5 DW_TAG_formal_parameter
	.long	1178                            # DW_AT_type
	.byte	7                               # Abbrev [7] 0x4c6:0x5 DW_TAG_formal_parameter
	.long	1178                            # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	8                               # Abbrev [8] 0x4cc:0xf DW_TAG_subprogram
	.byte	53                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	292                             # DW_AT_decl_line
	.long	1178                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x4d5:0x5 DW_TAG_formal_parameter
	.long	501                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0x4db:0x18 DW_TAG_subprogram
	.byte	54                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	209                             # DW_AT_decl_line
	.long	1178                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x4e3:0x5 DW_TAG_formal_parameter
	.long	797                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x4e8:0x5 DW_TAG_formal_parameter
	.long	927                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x4ed:0x5 DW_TAG_formal_parameter
	.long	52                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0x4f3:0x18 DW_TAG_subprogram
	.byte	55                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	214                             # DW_AT_decl_line
	.long	43                              # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x4fb:0x5 DW_TAG_formal_parameter
	.long	797                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x500:0x5 DW_TAG_formal_parameter
	.long	927                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x505:0x5 DW_TAG_formal_parameter
	.long	52                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	15                              # Abbrev [15] 0x50b:0x13 DW_TAG_subprogram
	.byte	56                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	172                             # DW_AT_decl_line
	.long	1310                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x513:0x5 DW_TAG_formal_parameter
	.long	797                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x518:0x5 DW_TAG_formal_parameter
	.long	927                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	2                               # Abbrev [2] 0x51e:0x4 DW_TAG_base_type
	.byte	57                              # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	4                               # DW_AT_byte_size
	.byte	15                              # Abbrev [15] 0x522:0x13 DW_TAG_subprogram
	.byte	58                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.byte	175                             # DW_AT_decl_line
	.long	1333                            # DW_AT_type
                                        # DW_AT_declaration
                                        # DW_AT_external
	.byte	7                               # Abbrev [7] 0x52a:0x5 DW_TAG_formal_parameter
	.long	797                             # DW_AT_type
	.byte	7                               # Abbrev [7] 0x52f:0x5 DW_TAG_formal_parameter
	.long	927                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	2                               # Abbrev [2] 0x535:0x4 DW_TAG_base_type
	.byte	59                              # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	16                              # DW_AT_byte_size
	.byte	5                               # Abbrev [5] 0x539:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	38                              # DW_AT_decl_line
	.long	442                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x540:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	39                              # DW_AT_decl_line
	.long	447                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x547:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	40                              # DW_AT_decl_line
	.long	651                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x54e:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	43                              # DW_AT_decl_line
	.long	468                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x555:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	46                              # DW_AT_decl_line
	.long	853                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x55c:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	51                              # DW_AT_decl_line
	.long	397                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x563:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	52                              # DW_AT_decl_line
	.long	406                             # DW_AT_import
	.byte	2                               # Abbrev [2] 0x56a:0x4 DW_TAG_base_type
	.byte	62                              # DW_AT_name
	.byte	4                               # DW_AT_encoding
	.byte	16                              # DW_AT_byte_size
	.byte	5                               # Abbrev [5] 0x56e:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	54                              # DW_AT_decl_line
	.long	366                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x575:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	55                              # DW_AT_decl_line
	.long	483                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x57c:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	56                              # DW_AT_decl_line
	.long	511                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x583:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	57                              # DW_AT_decl_line
	.long	526                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x58a:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	58                              # DW_AT_decl_line
	.long	527                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x591:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	59                              # DW_AT_decl_line
	.long	611                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x598:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	60                              # DW_AT_decl_line
	.long	1125                            # DW_AT_import
	.byte	5                               # Abbrev [5] 0x59f:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	61                              # DW_AT_decl_line
	.long	662                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5a6:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	62                              # DW_AT_decl_line
	.long	673                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5ad:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	63                              # DW_AT_decl_line
	.long	688                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5b4:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	64                              # DW_AT_decl_line
	.long	703                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5bb:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	65                              # DW_AT_decl_line
	.long	723                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5c2:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	67                              # DW_AT_decl_line
	.long	738                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5c9:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	68                              # DW_AT_decl_line
	.long	758                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5d0:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	69                              # DW_AT_decl_line
	.long	802                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5d7:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	71                              # DW_AT_decl_line
	.long	827                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5de:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	72                              # DW_AT_decl_line
	.long	864                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5e5:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	73                              # DW_AT_decl_line
	.long	873                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5ec:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	74                              # DW_AT_decl_line
	.long	893                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5f3:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	75                              # DW_AT_decl_line
	.long	908                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x5fa:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	76                              # DW_AT_decl_line
	.long	932                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x601:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	77                              # DW_AT_decl_line
	.long	956                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x608:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	78                              # DW_AT_decl_line
	.long	980                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x60f:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	80                              # DW_AT_decl_line
	.long	995                             # DW_AT_import
	.byte	5                               # Abbrev [5] 0x616:0x7 DW_TAG_imported_declaration
	.byte	6                               # DW_AT_decl_file
	.byte	81                              # DW_AT_decl_line
	.long	1040                            # DW_AT_import
	.byte	26                              # Abbrev [26] 0x61d:0x7 DW_TAG_imported_module
	.byte	0                               # DW_AT_decl_file
	.byte	5                               # DW_AT_decl_line
	.long	70                              # DW_AT_import
	.byte	27                              # Abbrev [27] 0x624:0x19 DW_TAG_subprogram
	.byte	0                               # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.long	1616                            # DW_AT_abstract_origin
	.byte	28                              # Abbrev [28] 0x630:0x6 DW_TAG_variable
	.byte	0                               # DW_AT_location
	.long	1625                            # DW_AT_abstract_origin
	.byte	28                              # Abbrev [28] 0x636:0x6 DW_TAG_variable
	.byte	1                               # DW_AT_location
	.long	1633                            # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	29                              # Abbrev [29] 0x63d:0x13 DW_TAG_subprogram
	.byte	63                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	283                             # DW_AT_decl_line
	.long	438                             # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_inline
	.byte	30                              # Abbrev [30] 0x646:0x9 DW_TAG_formal_parameter
	.byte	64                              # DW_AT_name
	.byte	1                               # DW_AT_decl_file
	.short	283                             # DW_AT_decl_line
	.long	501                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	31                              # Abbrev [31] 0x650:0x1a DW_TAG_subprogram
	.byte	65                              # DW_AT_linkage_name
	.byte	66                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	7                               # DW_AT_decl_line
	.long	43                              # DW_AT_type
                                        # DW_AT_external
                                        # DW_AT_inline
	.byte	32                              # Abbrev [32] 0x659:0x8 DW_TAG_variable
	.byte	67                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.long	904                             # DW_AT_type
	.byte	32                              # Abbrev [32] 0x661:0x8 DW_TAG_variable
	.byte	68                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	10                              # DW_AT_decl_line
	.long	904                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	33                              # Abbrev [33] 0x66a:0xf4 DW_TAG_subprogram
	.byte	1                               # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	69                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	19                              # DW_AT_decl_line
	.long	52                              # DW_AT_type
                                        # DW_AT_external
	.byte	34                              # Abbrev [34] 0x679:0x9 DW_TAG_formal_parameter
	.byte	2                               # DW_AT_location
	.byte	70                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	19                              # DW_AT_decl_line
	.long	52                              # DW_AT_type
	.byte	34                              # Abbrev [34] 0x682:0x9 DW_TAG_formal_parameter
	.byte	3                               # DW_AT_location
	.byte	71                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	19                              # DW_AT_decl_line
	.long	56                              # DW_AT_type
	.byte	35                              # Abbrev [35] 0x68b:0x9 DW_TAG_variable
	.byte	5                               # DW_AT_location
	.byte	72                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	20                              # DW_AT_decl_line
	.long	438                             # DW_AT_type
	.byte	35                              # Abbrev [35] 0x694:0x9 DW_TAG_variable
	.byte	7                               # DW_AT_location
	.byte	73                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	21                              # DW_AT_decl_line
	.long	438                             # DW_AT_type
	.byte	35                              # Abbrev [35] 0x69d:0x9 DW_TAG_variable
	.byte	8                               # DW_AT_location
	.byte	74                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	22                              # DW_AT_decl_line
	.long	47                              # DW_AT_type
	.byte	32                              # Abbrev [32] 0x6a6:0x8 DW_TAG_variable
	.byte	75                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	24                              # DW_AT_decl_line
	.long	43                              # DW_AT_type
	.byte	32                              # Abbrev [32] 0x6ae:0x8 DW_TAG_variable
	.byte	80                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	24                              # DW_AT_decl_line
	.long	43                              # DW_AT_type
	.byte	35                              # Abbrev [35] 0x6b6:0x9 DW_TAG_variable
	.byte	14                              # DW_AT_location
	.byte	79                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	31                              # DW_AT_decl_line
	.long	438                             # DW_AT_type
	.byte	36                              # Abbrev [36] 0x6bf:0x14 DW_TAG_inlined_subroutine
	.long	1597                            # DW_AT_abstract_origin
	.byte	2                               # DW_AT_low_pc
	.long	.Ltmp8-.Ltmp5                   # DW_AT_high_pc
	.byte	0                               # DW_AT_call_file
	.byte	20                              # DW_AT_call_line
	.byte	18                              # DW_AT_call_column
	.byte	37                              # Abbrev [37] 0x6cc:0x6 DW_TAG_formal_parameter
	.byte	4                               # DW_AT_location
	.long	1606                            # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	36                              # Abbrev [36] 0x6d3:0x14 DW_TAG_inlined_subroutine
	.long	1597                            # DW_AT_abstract_origin
	.byte	3                               # DW_AT_low_pc
	.long	.Ltmp11-.Ltmp9                  # DW_AT_high_pc
	.byte	0                               # DW_AT_call_file
	.byte	21                              # DW_AT_call_line
	.byte	16                              # DW_AT_call_column
	.byte	37                              # Abbrev [37] 0x6e0:0x6 DW_TAG_formal_parameter
	.byte	6                               # DW_AT_location
	.long	1606                            # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	38                              # Abbrev [38] 0x6e7:0x16 DW_TAG_inlined_subroutine
	.long	1616                            # DW_AT_abstract_origin
	.byte	0                               # DW_AT_ranges
	.byte	0                               # DW_AT_call_file
	.byte	25                              # DW_AT_call_line
	.byte	14                              # DW_AT_call_column
	.byte	28                              # Abbrev [28] 0x6f0:0x6 DW_TAG_variable
	.byte	9                               # DW_AT_location
	.long	1625                            # DW_AT_abstract_origin
	.byte	28                              # Abbrev [28] 0x6f6:0x6 DW_TAG_variable
	.byte	10                              # DW_AT_location
	.long	1633                            # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	39                              # Abbrev [39] 0x6fd:0x33 DW_TAG_lexical_block
	.byte	4                               # DW_AT_low_pc
	.long	.Ltmp28-.Ltmp14                 # DW_AT_high_pc
	.byte	40                              # Abbrev [40] 0x703:0x8 DW_TAG_variable
	.byte	1                               # DW_AT_location
	.byte	83
	.byte	76                              # DW_AT_name
	.long	52                              # DW_AT_type
                                        # DW_AT_artificial
	.byte	40                              # Abbrev [40] 0x70b:0x8 DW_TAG_variable
	.byte	1                               # DW_AT_location
	.byte	92
	.byte	77                              # DW_AT_name
	.long	52                              # DW_AT_type
                                        # DW_AT_artificial
	.byte	41                              # Abbrev [41] 0x713:0x7 DW_TAG_variable
	.byte	11                              # DW_AT_location
	.byte	78                              # DW_AT_name
	.long	52                              # DW_AT_type
                                        # DW_AT_artificial
	.byte	42                              # Abbrev [42] 0x71a:0x6 DW_TAG_variable
	.byte	81                              # DW_AT_name
	.long	52                              # DW_AT_type
                                        # DW_AT_artificial
	.byte	39                              # Abbrev [39] 0x720:0xf DW_TAG_lexical_block
	.byte	5                               # DW_AT_low_pc
	.long	.Ltmp28-.Ltmp21                 # DW_AT_high_pc
	.byte	32                              # Abbrev [32] 0x726:0x8 DW_TAG_variable
	.byte	79                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	26                              # DW_AT_decl_line
	.long	52                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	38                              # Abbrev [38] 0x730:0x16 DW_TAG_inlined_subroutine
	.long	1616                            # DW_AT_abstract_origin
	.byte	1                               # DW_AT_ranges
	.byte	0                               # DW_AT_call_file
	.byte	29                              # DW_AT_call_line
	.byte	10                              # DW_AT_call_column
	.byte	28                              # Abbrev [28] 0x739:0x6 DW_TAG_variable
	.byte	12                              # DW_AT_location
	.long	1625                            # DW_AT_abstract_origin
	.byte	28                              # Abbrev [28] 0x73f:0x6 DW_TAG_variable
	.byte	13                              # DW_AT_location
	.long	1633                            # DW_AT_abstract_origin
	.byte	0                               # End Of Children Mark
	.byte	39                              # Abbrev [39] 0x746:0x11 DW_TAG_lexical_block
	.byte	6                               # DW_AT_low_pc
	.long	.Ltmp36-.Ltmp30                 # DW_AT_high_pc
	.byte	43                              # Abbrev [43] 0x74c:0xa DW_TAG_variable
	.byte	1                               # DW_AT_location
	.byte	83
	.byte	79                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	32                              # DW_AT_decl_line
	.long	438                             # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	44                              # Abbrev [44] 0x757:0x6 DW_TAG_call_site
	.long	1886                            # DW_AT_call_origin
	.byte	7                               # DW_AT_call_return_pc
	.byte	0                               # End Of Children Mark
	.byte	33                              # Abbrev [33] 0x75e:0x84 DW_TAG_subprogram
	.byte	8                               # DW_AT_low_pc
	.long	.Lfunc_end2-.Lfunc_begin2       # DW_AT_high_pc
	.byte	1                               # DW_AT_frame_base
	.byte	87
                                        # DW_AT_call_all_calls
	.byte	69                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	19                              # DW_AT_decl_line
	.long	52                              # DW_AT_type
                                        # DW_AT_external
	.byte	45                              # Abbrev [45] 0x76d:0x8 DW_TAG_formal_parameter
	.byte	70                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	19                              # DW_AT_decl_line
	.long	52                              # DW_AT_type
	.byte	45                              # Abbrev [45] 0x775:0x8 DW_TAG_formal_parameter
	.byte	71                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	19                              # DW_AT_decl_line
	.long	56                              # DW_AT_type
	.byte	32                              # Abbrev [32] 0x77d:0x8 DW_TAG_variable
	.byte	72                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	20                              # DW_AT_decl_line
	.long	438                             # DW_AT_type
	.byte	32                              # Abbrev [32] 0x785:0x8 DW_TAG_variable
	.byte	73                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	21                              # DW_AT_decl_line
	.long	438                             # DW_AT_type
	.byte	32                              # Abbrev [32] 0x78d:0x8 DW_TAG_variable
	.byte	74                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	22                              # DW_AT_decl_line
	.long	47                              # DW_AT_type
	.byte	32                              # Abbrev [32] 0x795:0x8 DW_TAG_variable
	.byte	75                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	24                              # DW_AT_decl_line
	.long	43                              # DW_AT_type
	.byte	32                              # Abbrev [32] 0x79d:0x8 DW_TAG_variable
	.byte	80                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	24                              # DW_AT_decl_line
	.long	43                              # DW_AT_type
	.byte	32                              # Abbrev [32] 0x7a5:0x8 DW_TAG_variable
	.byte	79                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	31                              # DW_AT_decl_line
	.long	438                             # DW_AT_type
	.byte	39                              # Abbrev [39] 0x7ad:0x2e DW_TAG_lexical_block
	.byte	9                               # DW_AT_low_pc
	.long	.Ltmp54-.Ltmp46                 # DW_AT_high_pc
	.byte	42                              # Abbrev [42] 0x7b3:0x6 DW_TAG_variable
	.byte	76                              # DW_AT_name
	.long	52                              # DW_AT_type
                                        # DW_AT_artificial
	.byte	42                              # Abbrev [42] 0x7b9:0x6 DW_TAG_variable
	.byte	77                              # DW_AT_name
	.long	52                              # DW_AT_type
                                        # DW_AT_artificial
	.byte	42                              # Abbrev [42] 0x7bf:0x6 DW_TAG_variable
	.byte	78                              # DW_AT_name
	.long	52                              # DW_AT_type
                                        # DW_AT_artificial
	.byte	42                              # Abbrev [42] 0x7c5:0x6 DW_TAG_variable
	.byte	81                              # DW_AT_name
	.long	52                              # DW_AT_type
                                        # DW_AT_artificial
	.byte	39                              # Abbrev [39] 0x7cb:0xf DW_TAG_lexical_block
	.byte	10                              # DW_AT_low_pc
	.long	.Ltmp52-.Ltmp50                 # DW_AT_high_pc
	.byte	32                              # Abbrev [32] 0x7d1:0x8 DW_TAG_variable
	.byte	79                              # DW_AT_name
	.byte	0                               # DW_AT_decl_file
	.byte	26                              # DW_AT_decl_line
	.long	52                              # DW_AT_type
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
	.byte	44                              # Abbrev [44] 0x7db:0x6 DW_TAG_call_site
	.long	1886                            # DW_AT_call_origin
	.byte	11                              # DW_AT_call_return_pc
	.byte	0                               # End Of Children Mark
	.byte	0                               # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_rnglists,"",@progbits
	.long	.Ldebug_list_header_end1-.Ldebug_list_header_start1 # Length
.Ldebug_list_header_start1:
	.short	5                               # Version
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
	.long	2                               # Offset entry count
.Lrnglists_table_base0:
	.long	.Ldebug_ranges0-.Lrnglists_table_base0
	.long	.Ldebug_ranges1-.Lrnglists_table_base0
.Ldebug_ranges0:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp13-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp14-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp37-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp38-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_ranges1:
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp28-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp36-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp37-.Lfunc_begin0          #   ending offset
	.byte	4                               # DW_RLE_offset_pair
	.uleb128 .Ltmp38-.Lfunc_begin0          #   starting offset
	.uleb128 .Ltmp39-.Lfunc_begin0          #   ending offset
	.byte	0                               # DW_RLE_end_of_list
.Ldebug_list_header_end1:
	.section	.debug_str_offsets,"",@progbits
	.long	332                             # Length of String Offsets Set
	.short	5
	.short	0
.Lstr_offsets_base0:
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang a9be1306ca6ed5a9814f041c1db11a9ffe20487b)" # string offset=0
.Linfo_string1:
	.asciz	"simplepfor.cpp"                # string offset=127
.Linfo_string2:
	.asciz	"/afs/ece/project/seth_group/ziqiliu/test" # string offset=142
.Linfo_string3:
	.asciz	"unsigned long long"            # string offset=183
.Linfo_string4:
	.asciz	"int"                           # string offset=202
.Linfo_string5:
	.asciz	"char"                          # string offset=206
.Linfo_string6:
	.asciz	"std"                           # string offset=211
.Linfo_string7:
	.asciz	"abs"                           # string offset=215
.Linfo_string8:
	.asciz	"div_t"                         # string offset=219
.Linfo_string9:
	.asciz	"quot"                          # string offset=225
.Linfo_string10:
	.asciz	"long"                          # string offset=230
.Linfo_string11:
	.asciz	"rem"                           # string offset=235
.Linfo_string12:
	.asciz	"ldiv_t"                        # string offset=239
.Linfo_string13:
	.asciz	"abort"                         # string offset=246
.Linfo_string14:
	.asciz	"atexit"                        # string offset=252
.Linfo_string15:
	.asciz	"at_quick_exit"                 # string offset=259
.Linfo_string16:
	.asciz	"atof"                          # string offset=273
.Linfo_string17:
	.asciz	"double"                        # string offset=278
.Linfo_string18:
	.asciz	"atoi"                          # string offset=285
.Linfo_string19:
	.asciz	"bsearch"                       # string offset=290
.Linfo_string20:
	.asciz	"unsigned long"                 # string offset=298
.Linfo_string21:
	.asciz	"size_t"                        # string offset=312
.Linfo_string22:
	.asciz	"__compar_fn_t"                 # string offset=319
.Linfo_string23:
	.asciz	"calloc"                        # string offset=333
.Linfo_string24:
	.asciz	"div"                           # string offset=340
.Linfo_string25:
	.asciz	"exit"                          # string offset=344
.Linfo_string26:
	.asciz	"free"                          # string offset=349
.Linfo_string27:
	.asciz	"getenv"                        # string offset=354
.Linfo_string28:
	.asciz	"labs"                          # string offset=361
.Linfo_string29:
	.asciz	"ldiv"                          # string offset=366
.Linfo_string30:
	.asciz	"malloc"                        # string offset=371
.Linfo_string31:
	.asciz	"mblen"                         # string offset=378
.Linfo_string32:
	.asciz	"mbstowcs"                      # string offset=384
.Linfo_string33:
	.asciz	"wchar_t"                       # string offset=393
.Linfo_string34:
	.asciz	"mbtowc"                        # string offset=401
.Linfo_string35:
	.asciz	"qsort"                         # string offset=408
.Linfo_string36:
	.asciz	"quick_exit"                    # string offset=414
.Linfo_string37:
	.asciz	"rand"                          # string offset=425
.Linfo_string38:
	.asciz	"realloc"                       # string offset=430
.Linfo_string39:
	.asciz	"srand"                         # string offset=438
.Linfo_string40:
	.asciz	"unsigned int"                  # string offset=444
.Linfo_string41:
	.asciz	"strtod"                        # string offset=457
.Linfo_string42:
	.asciz	"strtol"                        # string offset=464
.Linfo_string43:
	.asciz	"strtoul"                       # string offset=471
.Linfo_string44:
	.asciz	"system"                        # string offset=479
.Linfo_string45:
	.asciz	"wcstombs"                      # string offset=486
.Linfo_string46:
	.asciz	"wctomb"                        # string offset=495
.Linfo_string47:
	.asciz	"__gnu_cxx"                     # string offset=502
.Linfo_string48:
	.asciz	"long long"                     # string offset=512
.Linfo_string49:
	.asciz	"lldiv_t"                       # string offset=522
.Linfo_string50:
	.asciz	"_Exit"                         # string offset=530
.Linfo_string51:
	.asciz	"llabs"                         # string offset=536
.Linfo_string52:
	.asciz	"lldiv"                         # string offset=542
.Linfo_string53:
	.asciz	"atoll"                         # string offset=548
.Linfo_string54:
	.asciz	"strtoll"                       # string offset=554
.Linfo_string55:
	.asciz	"strtoull"                      # string offset=562
.Linfo_string56:
	.asciz	"strtof"                        # string offset=571
.Linfo_string57:
	.asciz	"float"                         # string offset=578
.Linfo_string58:
	.asciz	"strtold"                       # string offset=584
.Linfo_string59:
	.asciz	"long double"                   # string offset=592
.Linfo_string60:
	.asciz	"_ZN9__gnu_cxx3divExx"          # string offset=604
.Linfo_string61:
	.asciz	"_ZSt3absg"                     # string offset=625
.Linfo_string62:
	.asciz	"__float128"                    # string offset=635
.Linfo_string63:
	.asciz	"atol"                          # string offset=646
.Linfo_string64:
	.asciz	"__nptr"                        # string offset=651
.Linfo_string65:
	.asciz	"_Z18__cilkrts_getticksv"       # string offset=658
.Linfo_string66:
	.asciz	"__cilkrts_getticks"            # string offset=682
.Linfo_string67:
	.asciz	"a"                             # string offset=701
.Linfo_string68:
	.asciz	"d"                             # string offset=703
.Linfo_string69:
	.asciz	"main"                          # string offset=705
.Linfo_string70:
	.asciz	"argc"                          # string offset=710
.Linfo_string71:
	.asciz	"argv"                          # string offset=715
.Linfo_string72:
	.asciz	"start"                         # string offset=720
.Linfo_string73:
	.asciz	"end"                           # string offset=726
.Linfo_string74:
	.asciz	"res"                           # string offset=730
.Linfo_string75:
	.asciz	"startT"                        # string offset=734
.Linfo_string76:
	.asciz	"__init"                        # string offset=741
.Linfo_string77:
	.asciz	"__limit"                       # string offset=748
.Linfo_string78:
	.asciz	"__begin"                       # string offset=756
.Linfo_string79:
	.asciz	"i"                             # string offset=764
.Linfo_string80:
	.asciz	"endT"                          # string offset=766
.Linfo_string81:
	.asciz	"__end"                         # string offset=771
	.section	.debug_str_offsets,"",@progbits
	.long	.Linfo_string0
	.long	.Linfo_string1
	.long	.Linfo_string2
	.long	.Linfo_string3
	.long	.Linfo_string4
	.long	.Linfo_string5
	.long	.Linfo_string6
	.long	.Linfo_string7
	.long	.Linfo_string8
	.long	.Linfo_string9
	.long	.Linfo_string10
	.long	.Linfo_string11
	.long	.Linfo_string12
	.long	.Linfo_string13
	.long	.Linfo_string14
	.long	.Linfo_string15
	.long	.Linfo_string16
	.long	.Linfo_string17
	.long	.Linfo_string18
	.long	.Linfo_string19
	.long	.Linfo_string20
	.long	.Linfo_string21
	.long	.Linfo_string22
	.long	.Linfo_string23
	.long	.Linfo_string24
	.long	.Linfo_string25
	.long	.Linfo_string26
	.long	.Linfo_string27
	.long	.Linfo_string28
	.long	.Linfo_string29
	.long	.Linfo_string30
	.long	.Linfo_string31
	.long	.Linfo_string32
	.long	.Linfo_string33
	.long	.Linfo_string34
	.long	.Linfo_string35
	.long	.Linfo_string36
	.long	.Linfo_string37
	.long	.Linfo_string38
	.long	.Linfo_string39
	.long	.Linfo_string40
	.long	.Linfo_string41
	.long	.Linfo_string42
	.long	.Linfo_string43
	.long	.Linfo_string44
	.long	.Linfo_string45
	.long	.Linfo_string46
	.long	.Linfo_string47
	.long	.Linfo_string48
	.long	.Linfo_string49
	.long	.Linfo_string50
	.long	.Linfo_string51
	.long	.Linfo_string52
	.long	.Linfo_string53
	.long	.Linfo_string54
	.long	.Linfo_string55
	.long	.Linfo_string56
	.long	.Linfo_string57
	.long	.Linfo_string58
	.long	.Linfo_string59
	.long	.Linfo_string60
	.long	.Linfo_string61
	.long	.Linfo_string62
	.long	.Linfo_string63
	.long	.Linfo_string64
	.long	.Linfo_string65
	.long	.Linfo_string66
	.long	.Linfo_string67
	.long	.Linfo_string68
	.long	.Linfo_string69
	.long	.Linfo_string70
	.long	.Linfo_string71
	.long	.Linfo_string72
	.long	.Linfo_string73
	.long	.Linfo_string74
	.long	.Linfo_string75
	.long	.Linfo_string76
	.long	.Linfo_string77
	.long	.Linfo_string78
	.long	.Linfo_string79
	.long	.Linfo_string80
	.long	.Linfo_string81
	.section	.debug_addr,"",@progbits
	.long	.Ldebug_addr_end0-.Ldebug_addr_start0 # Length of contribution
.Ldebug_addr_start0:
	.short	5                               # DWARF version number
	.byte	8                               # Address size
	.byte	0                               # Segment selector size
.Laddr_table_base0:
	.quad	.Lfunc_begin0
	.quad	.Lfunc_begin1
	.quad	.Ltmp5
	.quad	.Ltmp9
	.quad	.Ltmp14
	.quad	.Ltmp21
	.quad	.Ltmp30
	.quad	.Ltmp17
	.quad	.Lfunc_begin2
	.quad	.Ltmp46
	.quad	.Ltmp50
	.quad	.Ltmp47
.Ldebug_addr_end0:
	.ident	"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang a9be1306ca6ed5a9814f041c1db11a9ffe20487b)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.section	.debug_line,"",@progbits
.Lline_table_start0:
