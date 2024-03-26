; ModuleID = './fib.ll'
source_filename = "fib.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [51 x i8] c"Usage: fib [<cilk options>] <n> <number of round>\0A\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"PBBS-time: %f\0A\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"Result: %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i64 @todval(%struct.timeval* nocapture noundef readonly %tp) local_unnamed_addr #0 !dbg !13 {
entry:
  call void @llvm.dbg.value(metadata %struct.timeval* %tp, metadata !28, metadata !DIExpression()), !dbg !29
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 0, !dbg !30
  %0 = load i64, i64* %tv_sec, align 8, !dbg !30, !tbaa !31
  %mul1 = mul i64 %0, 1000000, !dbg !36
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 1, !dbg !37
  %1 = load i64, i64* %tv_usec, align 8, !dbg !37, !tbaa !38
  %add = add nsw i64 %mul1, %1, !dbg !39
  ret i64 %add, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree noinline norecurse nosync nounwind readnone uwtable
define dso_local void @startup_cilk() local_unnamed_addr #2 !dbg !41 {
entry:
  %g = alloca double, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !54
  %g.0.g.0.g.0..sroa_cast = bitcast double* %g to i8*, !dbg !55
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !55
  call void @llvm.dbg.value(metadata double 2.000000e+00, metadata !45, metadata !DIExpression()), !dbg !54
  store double 2.000000e+00, double* %g, align 8, !dbg !56, !tbaa !57
  call void @llvm.dbg.value(metadata i32 0, metadata !47, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 1000, metadata !49, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 0, metadata !50, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.value(metadata i32 1000, metadata !51, metadata !DIExpression()), !dbg !59
  br label %pfor.cond, !dbg !60

pfor.cond:                                        ; preds = %pfor.inc, %entry
  %__begin.0 = phi i32 [ 0, %entry ], [ %inc3, %pfor.inc ], !dbg !59
  call void @llvm.dbg.value(metadata i32 %__begin.0, metadata !50, metadata !DIExpression()), !dbg !59
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc, !dbg !61

pfor.body.entry:                                  ; preds = %pfor.cond
  call void @llvm.dbg.value(metadata !DIArgList(i32 0, i32 %__begin.0), metadata !52, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !62
  %g.0.g.0.g.0. = load double, double* %g, align 8, !dbg !63, !tbaa !57
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !45, metadata !DIExpression()), !dbg !54
  %inc = fadd double %g.0.g.0.g.0., 1.000000e+00, !dbg !63
  call void @llvm.dbg.value(metadata double %inc, metadata !45, metadata !DIExpression()), !dbg !54
  store double %inc, double* %g, align 8, !dbg !63, !tbaa !57
  reattach within %syncreg, label %pfor.inc, !dbg !65

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %inc3 = add nuw nsw i32 %__begin.0, 1, !dbg !66
  call void @llvm.dbg.value(metadata i32 %inc3, metadata !50, metadata !DIExpression()), !dbg !59
  %exitcond.not = icmp eq i32 %inc3, 1000, !dbg !67
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !dbg !68, !llvm.loop !69

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %cleanup, !dbg !68

cleanup:                                          ; preds = %pfor.cond.cleanup
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !72
  ret void, !dbg !72
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare token @llvm.syncregion.start() #4

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nofree nosync nounwind readnone uwtable
define dso_local i32 @fib(i32 noundef %n) local_unnamed_addr #5 !dbg !73 {
entry:
  %x = alloca i32, align 4
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !82
  call void @llvm.dbg.value(metadata i32 %n, metadata !77, metadata !DIExpression()), !dbg !83
  %cmp = icmp slt i32 %n, 2, !dbg !84
  br i1 %cmp, label %return, label %if.else, !dbg !85

if.else:                                          ; preds = %entry
  %x.0.x.0.x.0..sroa_cast = bitcast i32* %x to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %x.0.x.0.x.0..sroa_cast), !dbg !86
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !87

det.achd:                                         ; preds = %if.else
  %sub = add nsw i32 %n, -1, !dbg !88
  %call = tail call i32 @fib(i32 noundef %sub), !dbg !87
  call void @llvm.dbg.value(metadata i32 %call, metadata !78, metadata !DIExpression()), !dbg !82
  store i32 %call, i32* %x, align 4, !dbg !89, !tbaa !90
  reattach within %syncreg, label %det.cont, !dbg !89

det.cont:                                         ; preds = %det.achd, %if.else
  %sub1 = add nsw i32 %n, -2, !dbg !92
  %call2 = tail call i32 @fib(i32 noundef %sub1), !dbg !93
  call void @llvm.dbg.value(metadata i32 %call2, metadata !81, metadata !DIExpression()), !dbg !82
  sync within %syncreg, label %sync.continue, !dbg !94

sync.continue:                                    ; preds = %det.cont
  %x.0.load = load i32, i32* %x, align 4, !dbg !95
  call void @llvm.dbg.value(metadata i32 %x.0.load, metadata !78, metadata !DIExpression()), !dbg !82
  %add = add nsw i32 %x.0.load, %call2, !dbg !96
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %x.0.x.0.x.0..sroa_cast), !dbg !97
  br label %return

return:                                           ; preds = %sync.continue, %entry
  %retval.0 = phi i32 [ %add, %sync.continue ], [ %n, %entry ], !dbg !98
  ret i32 %retval.0, !dbg !99
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** nocapture noundef readonly %argv) local_unnamed_addr #6 !dbg !100 {
entry:
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !104, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.value(metadata i8** %argv, metadata !105, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.value(metadata i32 1, metadata !108, metadata !DIExpression()), !dbg !116
  %cmp.not = icmp eq i32 %argc, 3, !dbg !117
  br i1 %cmp.not, label %if.end, label %if.then, !dbg !119

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !120, !tbaa !122
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([51 x i8], [51 x i8]* @.str, i64 0, i64 0), i64 50, i64 1, %struct._IO_FILE* %0) #11, !dbg !124
  tail call void @exit(i32 noundef 1) #12, !dbg !125
  unreachable, !dbg !125

if.end:                                           ; preds = %entry
  tail call void @startup_cilk(), !dbg !126
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !127
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !127, !tbaa !122
  call void @llvm.dbg.value(metadata i8* %2, metadata !128, metadata !DIExpression()) #13, !dbg !136
  %call.i = tail call i64 @strtol(i8* nocapture noundef nonnull %2, i8** noundef null, i32 noundef 10) #13, !dbg !138
  %conv.i = trunc i64 %call.i to i32, !dbg !139
  call void @llvm.dbg.value(metadata i32 %conv.i, metadata !106, metadata !DIExpression()), !dbg !116
  %arrayidx2 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !140
  %3 = load i8*, i8** %arrayidx2, align 8, !dbg !140, !tbaa !122
  call void @llvm.dbg.value(metadata i8* %3, metadata !128, metadata !DIExpression()) #13, !dbg !141
  %call.i20 = tail call i64 @strtol(i8* nocapture noundef nonnull %3, i8** noundef null, i32 noundef 10) #13, !dbg !143
  %conv.i21 = trunc i64 %call.i20 to i32, !dbg !144
  call void @llvm.dbg.value(metadata i32 %conv.i21, metadata !108, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.value(metadata i32 0, metadata !109, metadata !DIExpression()), !dbg !145
  %cmp426 = icmp sgt i32 %conv.i21, 0, !dbg !146
  br i1 %cmp426, label %for.body.lr.ph, label %for.cond.cleanup, !dbg !147

for.body.lr.ph:                                   ; preds = %if.end
  %4 = bitcast %struct.timeval* %t1 to i8*
  %5 = bitcast %struct.timeval* %t2 to i8*
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1
  %tv_sec.i22 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0
  %tv_usec.i24 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1
  br label %for.body, !dbg !147

for.cond.cleanup:                                 ; preds = %for.body, %if.end
  ret i32 0, !dbg !148

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %r.027 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  call void @llvm.dbg.value(metadata i32 %r.027, metadata !109, metadata !DIExpression()), !dbg !145
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #13, !dbg !149
  call void @llvm.dbg.declare(metadata %struct.timeval* %t1, metadata !111, metadata !DIExpression()), !dbg !150
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %5) #13, !dbg !149
  call void @llvm.dbg.declare(metadata %struct.timeval* %t2, metadata !114, metadata !DIExpression()), !dbg !151
  %call5 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #13, !dbg !152
  %call6 = tail call i32 @fib(i32 noundef %conv.i), !dbg !153
  call void @llvm.dbg.value(metadata i32 %call6, metadata !107, metadata !DIExpression()), !dbg !116
  %call7 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #13, !dbg !154
  call void @llvm.dbg.value(metadata %struct.timeval* %t2, metadata !28, metadata !DIExpression()), !dbg !155
  %6 = load i64, i64* %tv_sec.i, align 8, !dbg !157, !tbaa !31
  %7 = load i64, i64* %tv_usec.i, align 8, !dbg !158, !tbaa !38
  call void @llvm.dbg.value(metadata %struct.timeval* %t1, metadata !28, metadata !DIExpression()), !dbg !159
  %8 = load i64, i64* %tv_sec.i22, align 8, !dbg !161, !tbaa !31
  %9 = load i64, i64* %tv_usec.i24, align 8, !dbg !162, !tbaa !38
  %reass.add = sub i64 %6, %8
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i = sub i64 %7, %9, !dbg !163
  %sub = add i64 %add.i, %reass.mul, !dbg !164
  %div = udiv i64 %sub, 1000, !dbg !165
  call void @llvm.dbg.value(metadata i64 %div, metadata !115, metadata !DIExpression()), !dbg !166
  %conv = uitofp i64 %div to double, !dbg !167
  %div10 = fdiv double %conv, 1.000000e+03, !dbg !168
  %call11 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i64 0, i64 0), double noundef %div10), !dbg !169
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !170, !tbaa !122
  %call12 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %10, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0), i32 noundef %call6) #11, !dbg !171
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %5) #13, !dbg !172
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #13, !dbg !172
  %inc = add nuw nsw i32 %r.027, 1, !dbg !173
  call void @llvm.dbg.value(metadata i32 %inc, metadata !109, metadata !DIExpression()), !dbg !145
  %exitcond.not = icmp eq i32 %inc, %conv.i21, !dbg !146
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !dbg !147, !llvm.loop !174
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #7

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare !dbg !177 dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #7

; Function Attrs: mustprogress nofree nounwind willreturn
declare dso_local i64 @strtol(i8* noundef readonly, i8** nocapture noundef, i32 noundef) local_unnamed_addr #9

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #10

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nofree noinline norecurse nosync nounwind readnone uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nofree nosync nounwind readnone uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noreturn nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree nounwind }
attributes #11 = { cold }
attributes #12 = { noreturn nounwind }
attributes #13 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "fib.c", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "39d49fa35beb68673896807b3595ec1b")
!2 = !{!3, !4, !7}
!3 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{i32 7, !"Dwarf Version", i32 5}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)"}
!13 = distinct !DISubprogram(name: "todval", scope: !1, file: !1, line: 27, type: !14, scopeLine: 27, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !27)
!14 = !DISubroutineType(types: !15)
!15 = !{!16, !17}
!16 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !19, line: 30, size: 128, elements: !20)
!19 = !DIFile(filename: "/usr/include/bits/time.h", directory: "", checksumkind: CSK_MD5, checksum: "7275d681a2390320bc78ae3cf595b8d2")
!20 = !{!21, !25}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !18, file: !19, line: 32, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !23, line: 148, baseType: !24)
!23 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "77efac6352c67c8f56830ba4c854379f")
!24 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !18, file: !19, line: 33, baseType: !26, size: 64, offset: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !23, line: 150, baseType: !24)
!27 = !{!28}
!28 = !DILocalVariable(name: "tp", arg: 1, scope: !13, file: !1, line: 27, type: !17)
!29 = !DILocation(line: 0, scope: !13)
!30 = !DILocation(line: 28, column: 16, scope: !13)
!31 = !{!32, !33, i64 0}
!32 = !{!"timeval", !33, i64 0, !33, i64 8}
!33 = !{!"long", !34, i64 0}
!34 = !{!"omnipotent char", !35, i64 0}
!35 = !{!"Simple C/C++ TBAA"}
!36 = !DILocation(line: 28, column: 30, scope: !13)
!37 = !DILocation(line: 28, column: 43, scope: !13)
!38 = !{!32, !33, i64 8}
!39 = !DILocation(line: 28, column: 37, scope: !13)
!40 = !DILocation(line: 28, column: 5, scope: !13)
!41 = distinct !DISubprogram(name: "startup_cilk", scope: !1, file: !1, line: 32, type: !42, scopeLine: 32, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !44)
!42 = !DISubroutineType(types: !43)
!43 = !{null}
!44 = !{!45, !47, !49, !50, !51, !52}
!45 = !DILocalVariable(name: "g", scope: !41, file: !1, line: 33, type: !46)
!46 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!47 = !DILocalVariable(name: "__init", scope: !48, type: !3, flags: DIFlagArtificial)
!48 = distinct !DILexicalBlock(scope: !41, file: !1, line: 34, column: 3)
!49 = !DILocalVariable(name: "__limit", scope: !48, type: !3, flags: DIFlagArtificial)
!50 = !DILocalVariable(name: "__begin", scope: !48, type: !3, flags: DIFlagArtificial)
!51 = !DILocalVariable(name: "__end", scope: !48, type: !3, flags: DIFlagArtificial)
!52 = !DILocalVariable(name: "i", scope: !53, file: !1, line: 34, type: !3)
!53 = distinct !DILexicalBlock(scope: !48, file: !1, line: 34, column: 3)
!54 = !DILocation(line: 0, scope: !41)
!55 = !DILocation(line: 33, column: 3, scope: !41)
!56 = !DILocation(line: 33, column: 10, scope: !41)
!57 = !{!58, !58, i64 0}
!58 = !{!"double", !34, i64 0}
!59 = !DILocation(line: 0, scope: !48)
!60 = !DILocation(line: 34, column: 24, scope: !48)
!61 = !DILocation(line: 34, column: 3, scope: !48)
!62 = !DILocation(line: 0, scope: !53)
!63 = !DILocation(line: 35, column: 6, scope: !64)
!64 = distinct !DILexicalBlock(scope: !53, file: !1, line: 34, column: 36)
!65 = !DILocation(line: 36, column: 3, scope: !64)
!66 = !DILocation(line: 34, column: 32, scope: !53)
!67 = !DILocation(line: 34, column: 24, scope: !53)
!68 = !DILocation(line: 34, column: 3, scope: !53)
!69 = distinct !{!69, !61, !70, !71}
!70 = !DILocation(line: 36, column: 3, scope: !48)
!71 = !{!"tapir.loop.spawn.strategy", i32 1}
!72 = !DILocation(line: 37, column: 1, scope: !41)
!73 = distinct !DISubprogram(name: "fib", scope: !1, file: !1, line: 43, type: !74, scopeLine: 43, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !76)
!74 = !DISubroutineType(types: !75)
!75 = !{!3, !3}
!76 = !{!77, !78, !81}
!77 = !DILocalVariable(name: "n", arg: 1, scope: !73, file: !1, line: 43, type: !3)
!78 = !DILocalVariable(name: "x", scope: !79, file: !1, line: 50, type: !3)
!79 = distinct !DILexicalBlock(scope: !80, file: !1, line: 47, column: 12)
!80 = distinct !DILexicalBlock(scope: !73, file: !1, line: 44, column: 9)
!81 = !DILocalVariable(name: "y", scope: !79, file: !1, line: 50, type: !3)
!82 = !DILocation(line: 0, scope: !79)
!83 = !DILocation(line: 0, scope: !73)
!84 = !DILocation(line: 44, column: 11, scope: !80)
!85 = !DILocation(line: 44, column: 9, scope: !73)
!86 = !DILocation(line: 50, column: 7, scope: !79)
!87 = !DILocation(line: 51, column: 17, scope: !79)
!88 = !DILocation(line: 51, column: 23, scope: !79)
!89 = !DILocation(line: 51, column: 4, scope: !79)
!90 = !{!91, !91, i64 0}
!91 = !{!"int", !34, i64 0}
!92 = !DILocation(line: 52, column: 19, scope: !79)
!93 = !DILocation(line: 52, column: 13, scope: !79)
!94 = !DILocation(line: 53, column: 9, scope: !79)
!95 = !DILocation(line: 55, column: 17, scope: !79)
!96 = !DILocation(line: 55, column: 19, scope: !79)
!97 = !DILocation(line: 56, column: 5, scope: !80)
!98 = !DILocation(line: 0, scope: !80)
!99 = !DILocation(line: 57, column: 1, scope: !73)
!100 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 59, type: !101, scopeLine: 59, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !103)
!101 = !DISubroutineType(types: !102)
!102 = !{!3, !3, !4}
!103 = !{!104, !105, !106, !107, !108, !109, !111, !114, !115}
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !1, line: 59, type: !3)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !1, line: 59, type: !4)
!106 = !DILocalVariable(name: "n", scope: !100, file: !1, line: 61, type: !3)
!107 = !DILocalVariable(name: "result", scope: !100, file: !1, line: 61, type: !3)
!108 = !DILocalVariable(name: "round", scope: !100, file: !1, line: 61, type: !3)
!109 = !DILocalVariable(name: "r", scope: !110, file: !1, line: 74, type: !3)
!110 = distinct !DILexicalBlock(scope: !100, file: !1, line: 74, column: 3)
!111 = !DILocalVariable(name: "t1", scope: !112, file: !1, line: 76, type: !18)
!112 = distinct !DILexicalBlock(scope: !113, file: !1, line: 74, column: 30)
!113 = distinct !DILexicalBlock(scope: !110, file: !1, line: 74, column: 3)
!114 = !DILocalVariable(name: "t2", scope: !112, file: !1, line: 76, type: !18)
!115 = !DILocalVariable(name: "runtime_ms", scope: !112, file: !1, line: 81, type: !16)
!116 = !DILocation(line: 0, scope: !100)
!117 = !DILocation(line: 63, column: 12, scope: !118)
!118 = distinct !DILexicalBlock(scope: !100, file: !1, line: 63, column: 7)
!119 = !DILocation(line: 63, column: 7, scope: !100)
!120 = !DILocation(line: 64, column: 13, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !1, line: 63, column: 18)
!122 = !{!123, !123, i64 0}
!123 = !{!"any pointer", !34, i64 0}
!124 = !DILocation(line: 64, column: 5, scope: !121)
!125 = !DILocation(line: 65, column: 5, scope: !121)
!126 = !DILocation(line: 69, column: 3, scope: !100)
!127 = !DILocation(line: 71, column: 12, scope: !100)
!128 = !DILocalVariable(name: "__nptr", arg: 1, scope: !129, file: !130, line: 278, type: !133)
!129 = distinct !DISubprogram(name: "atoi", scope: !130, file: !130, line: 278, type: !131, scopeLine: 279, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !135)
!130 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f7a1412d75d9e3df251dfc21b02d59ef")
!131 = !DISubroutineType(types: !132)
!132 = !{!3, !133}
!133 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !134, size: 64)
!134 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!135 = !{!128}
!136 = !DILocation(line: 0, scope: !129, inlinedAt: !137)
!137 = distinct !DILocation(line: 71, column: 7, scope: !100)
!138 = !DILocation(line: 280, column: 16, scope: !129, inlinedAt: !137)
!139 = !DILocation(line: 280, column: 10, scope: !129, inlinedAt: !137)
!140 = !DILocation(line: 72, column: 16, scope: !100)
!141 = !DILocation(line: 0, scope: !129, inlinedAt: !142)
!142 = distinct !DILocation(line: 72, column: 11, scope: !100)
!143 = !DILocation(line: 280, column: 16, scope: !129, inlinedAt: !142)
!144 = !DILocation(line: 280, column: 10, scope: !129, inlinedAt: !142)
!145 = !DILocation(line: 0, scope: !110)
!146 = !DILocation(line: 74, column: 17, scope: !113)
!147 = !DILocation(line: 74, column: 3, scope: !110)
!148 = !DILocation(line: 86, column: 3, scope: !100)
!149 = !DILocation(line: 76, column: 5, scope: !112)
!150 = !DILocation(line: 76, column: 20, scope: !112)
!151 = !DILocation(line: 76, column: 24, scope: !112)
!152 = !DILocation(line: 77, column: 5, scope: !112)
!153 = !DILocation(line: 78, column: 14, scope: !112)
!154 = !DILocation(line: 80, column: 5, scope: !112)
!155 = !DILocation(line: 0, scope: !13, inlinedAt: !156)
!156 = distinct !DILocation(line: 81, column: 38, scope: !112)
!157 = !DILocation(line: 28, column: 16, scope: !13, inlinedAt: !156)
!158 = !DILocation(line: 28, column: 43, scope: !13, inlinedAt: !156)
!159 = !DILocation(line: 0, scope: !13, inlinedAt: !160)
!160 = distinct !DILocation(line: 81, column: 50, scope: !112)
!161 = !DILocation(line: 28, column: 16, scope: !13, inlinedAt: !160)
!162 = !DILocation(line: 28, column: 43, scope: !13, inlinedAt: !160)
!163 = !DILocation(line: 28, column: 37, scope: !13, inlinedAt: !156)
!164 = !DILocation(line: 81, column: 49, scope: !112)
!165 = !DILocation(line: 81, column: 62, scope: !112)
!166 = !DILocation(line: 0, scope: !112)
!167 = !DILocation(line: 82, column: 31, scope: !112)
!168 = !DILocation(line: 82, column: 41, scope: !112)
!169 = !DILocation(line: 82, column: 5, scope: !112)
!170 = !DILocation(line: 83, column: 13, scope: !112)
!171 = !DILocation(line: 83, column: 5, scope: !112)
!172 = !DILocation(line: 85, column: 3, scope: !113)
!173 = !DILocation(line: 74, column: 26, scope: !113)
!174 = distinct !{!174, !147, !175, !176}
!175 = !DILocation(line: 85, column: 3, scope: !110)
!176 = !{!"llvm.loop.mustprogress"}
!177 = !DISubprogram(name: "gettimeofday", scope: !178, file: !178, line: 72, type: !179, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !189)
!178 = !DIFile(filename: "/usr/include/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b3cbcac52b1954fa045aa74bfcd1a38")
!179 = !DISubroutineType(types: !180)
!180 = !{!3, !181, !182}
!181 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !17)
!182 = !DIDerivedType(tag: DW_TAG_typedef, name: "__timezone_ptr_t", file: !178, line: 62, baseType: !183)
!183 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !184)
!184 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !185, size: 64)
!185 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !178, line: 56, size: 64, elements: !186)
!186 = !{!187, !188}
!187 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !185, file: !178, line: 58, baseType: !3, size: 32)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !185, file: !178, line: 59, baseType: !3, size: 32, offset: 32)
!189 = !{}
