; ModuleID = 'simplepfor.cpp'
source_filename = "simplepfor.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [13 x i8] c"res[%ld]=%d\0A\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [12 x i8] c"Time: %llu\0A\00", align 1

; Function Attrs: mustprogress nounwind uwtable
define dso_local noundef i64 @_Z18__cilkrts_getticksv() local_unnamed_addr #0 !dbg !17 {
entry:
  %0 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #8, !dbg !24, !srcloc !25
  %asmresult = extractvalue { i32, i32 } %0, 0, !dbg !24
  %asmresult1 = extractvalue { i32, i32 } %0, 1, !dbg !24
  call void @llvm.dbg.value(metadata i32 %asmresult, metadata !21, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.value(metadata i32 %asmresult1, metadata !23, metadata !DIExpression()), !dbg !26
  %conv = zext i32 %asmresult to i64, !dbg !27
  %conv2 = zext i32 %asmresult1 to i64, !dbg !28
  %shl = shl nuw i64 %conv2, 32, !dbg !29
  %or = or i64 %shl, %conv, !dbg !30
  ret i64 %or, !dbg !31
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, i8** nocapture noundef readonly %argv) local_unnamed_addr #1 !dbg !32 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !54
  call void @llvm.dbg.value(metadata i32 %argc, metadata !36, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i8** %argv, metadata !37, metadata !DIExpression()), !dbg !54
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !55
  %0 = load i8*, i8** %arrayidx, align 8, !dbg !55, !tbaa !56
  call void @llvm.dbg.value(metadata i8* %0, metadata !60, metadata !DIExpression()) #8, !dbg !68
  %call.i = tail call i64 @strtol(i8* nocapture noundef nonnull %0, i8** noundef null, i32 noundef 10) #8, !dbg !70
  call void @llvm.dbg.value(metadata i64 %call.i, metadata !38, metadata !DIExpression()), !dbg !54
  %arrayidx1 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !71
  %1 = load i8*, i8** %arrayidx1, align 8, !dbg !71, !tbaa !56
  call void @llvm.dbg.value(metadata i8* %1, metadata !60, metadata !DIExpression()) #8, !dbg !72
  %call.i55 = tail call i64 @strtol(i8* nocapture noundef nonnull %1, i8** noundef null, i32 noundef 10) #8, !dbg !74
  call void @llvm.dbg.value(metadata i64 %call.i55, metadata !40, metadata !DIExpression()), !dbg !54
  %mul = shl i64 %call.i55, 2, !dbg !75
  %call3 = tail call noalias i8* @malloc(i64 noundef %mul) #8, !dbg !76
  %2 = bitcast i8* %call3 to i32*, !dbg !77
  call void @llvm.dbg.value(metadata i32* %2, metadata !41, metadata !DIExpression()), !dbg !54
  %3 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #8, !dbg !78, !srcloc !25
  call void @llvm.dbg.value(metadata i32 undef, metadata !21, metadata !DIExpression()) #8, !dbg !80
  call void @llvm.dbg.value(metadata i32 undef, metadata !23, metadata !DIExpression()) #8, !dbg !80
  call void @llvm.dbg.value(metadata !DIArgList(i32 undef, i32 undef), metadata !42, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_constu, 32, DW_OP_shl, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_or, DW_OP_stack_value)), !dbg !54
  %conv = trunc i64 %call.i to i32, !dbg !81
  call void @llvm.dbg.value(metadata i32 %conv, metadata !44, metadata !DIExpression()), !dbg !82
  %conv5 = trunc i64 %call.i55 to i32, !dbg !83
  call void @llvm.dbg.value(metadata i32 %conv5, metadata !46, metadata !DIExpression()), !dbg !82
  %cmp = icmp sgt i32 %conv5, %conv, !dbg !84
  br i1 %cmp, label %pfor.ph, label %cleanup, !dbg !83

pfor.ph:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i32 0, metadata !47, metadata !DIExpression()), !dbg !82
  %sub = sub i32 %conv5, %conv, !dbg !84
  call void @llvm.dbg.value(metadata i32 %sub, metadata !48, metadata !DIExpression()), !dbg !82
  %sext = shl i64 %call.i, 32, !dbg !84
  %4 = ashr exact i64 %sext, 32, !dbg !84
  %smax = call i32 @llvm.smax.i32(i32 %sub, i32 1), !dbg !84
  %wide.trip.count = zext i32 %smax to i64, !dbg !85
  br label %pfor.cond, !dbg !84

pfor.cond:                                        ; preds = %pfor.inc, %pfor.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %pfor.inc ], [ 0, %pfor.ph ], !dbg !82
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !47, metadata !DIExpression()), !dbg !82
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !86
  %5 = add nsw i64 %indvars.iv, %4, !dbg !87
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc, !dbg !88

pfor.body.entry:                                  ; preds = %pfor.cond
  call void @llvm.dbg.value(metadata i64 %5, metadata !49, metadata !DIExpression()), !dbg !89
  %arrayidx9 = getelementptr inbounds i32, i32* %2, i64 %5, !dbg !90
  %6 = trunc i64 %5 to i32, !dbg !92
  store i32 %6, i32* %arrayidx9, align 4, !dbg !92, !tbaa !93
  reattach within %syncreg, label %pfor.inc, !dbg !95

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !47, metadata !DIExpression()), !dbg !82
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !85
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !dbg !96, !llvm.loop !97

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %sync.continue, !dbg !96

sync.continue:                                    ; preds = %pfor.cond.cleanup
  tail call void @llvm.sync.unwind(token %syncreg), !dbg !96
  br label %cleanup

cleanup:                                          ; preds = %entry, %sync.continue
  %7 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #8, !dbg !101, !srcloc !25
  call void @llvm.dbg.value(metadata i32 undef, metadata !21, metadata !DIExpression()) #8, !dbg !103
  call void @llvm.dbg.value(metadata i32 undef, metadata !23, metadata !DIExpression()) #8, !dbg !103
  call void @llvm.dbg.value(metadata !DIArgList(i32 undef, i32 undef), metadata !43, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_constu, 32, DW_OP_shl, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_or, DW_OP_stack_value)), !dbg !54
  call void @llvm.dbg.value(metadata i64 %call.i, metadata !51, metadata !DIExpression()), !dbg !54
  call void @llvm.dbg.value(metadata i64 %call.i, metadata !52, metadata !DIExpression()), !dbg !104
  %cmp1562 = icmp slt i64 %call.i, %call.i55, !dbg !105
  br i1 %cmp1562, label %for.body, label %for.cond.cleanup, !dbg !107

for.cond.cleanup:                                 ; preds = %for.body, %cleanup
  %asmresult1.i57 = extractvalue { i32, i32 } %7, 1, !dbg !101
  call void @llvm.dbg.value(metadata i32 %asmresult1.i57, metadata !23, metadata !DIExpression()) #8, !dbg !103
  call void @llvm.dbg.value(metadata !DIArgList(i32 %asmresult1.i57, i32 undef), metadata !43, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_constu, 32, DW_OP_shl, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_or, DW_OP_stack_value)), !dbg !54
  %conv2.i59 = zext i32 %asmresult1.i57 to i64, !dbg !108
  call void @llvm.dbg.value(metadata !DIArgList(i64 %conv2.i59, i32 undef), metadata !43, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 32, DW_OP_shl, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_or, DW_OP_stack_value)), !dbg !54
  %shl.i60 = shl nuw i64 %conv2.i59, 32, !dbg !109
  call void @llvm.dbg.value(metadata !DIArgList(i64 %shl.i60, i32 undef), metadata !43, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_or, DW_OP_stack_value)), !dbg !54
  %asmresult.i56 = extractvalue { i32, i32 } %7, 0, !dbg !101
  call void @llvm.dbg.value(metadata i32 %asmresult.i56, metadata !21, metadata !DIExpression()) #8, !dbg !103
  call void @llvm.dbg.value(metadata !DIArgList(i32 undef, i32 %asmresult.i56), metadata !43, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_constu, 32, DW_OP_shl, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_or, DW_OP_stack_value)), !dbg !54
  %conv.i58 = zext i32 %asmresult.i56 to i64, !dbg !110
  call void @llvm.dbg.value(metadata i64 undef, metadata !43, metadata !DIExpression()), !dbg !54
  %asmresult1.i = extractvalue { i32, i32 } %3, 1, !dbg !78
  call void @llvm.dbg.value(metadata i32 %asmresult1.i, metadata !23, metadata !DIExpression()) #8, !dbg !80
  call void @llvm.dbg.value(metadata !DIArgList(i32 %asmresult1.i, i32 undef), metadata !42, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_constu, 32, DW_OP_shl, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_or, DW_OP_stack_value)), !dbg !54
  %conv2.i = zext i32 %asmresult1.i to i64, !dbg !111
  call void @llvm.dbg.value(metadata !DIArgList(i64 %conv2.i, i32 undef), metadata !42, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 32, DW_OP_shl, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_or, DW_OP_stack_value)), !dbg !54
  %shl.i.neg64 = mul i64 %conv2.i, -4294967296, !dbg !112
  %asmresult.i = extractvalue { i32, i32 } %3, 0, !dbg !78
  call void @llvm.dbg.value(metadata i32 %asmresult.i, metadata !21, metadata !DIExpression()) #8, !dbg !80
  call void @llvm.dbg.value(metadata !DIArgList(i32 undef, i32 %asmresult.i), metadata !42, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_constu, 32, DW_OP_shl, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_or, DW_OP_stack_value)), !dbg !54
  %conv.i = zext i32 %asmresult.i to i64, !dbg !113
  call void @llvm.dbg.value(metadata i64 %or.i.neg, metadata !42, metadata !DIExpression()), !dbg !54
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !114, !tbaa !56
  %or.i.neg = sub i64 %shl.i.neg64, %conv.i, !dbg !115
  %or.i61 = add i64 %or.i.neg, %conv.i58, !dbg !116
  %sub20 = add i64 %or.i61, %shl.i60, !dbg !117
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %8, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i64 noundef %sub20) #9, !dbg !118
  ret i32 1, !dbg !119

for.body:                                         ; preds = %cleanup, %for.body
  %i14.063 = phi i64 [ %inc18, %for.body ], [ %call.i, %cleanup ]
  call void @llvm.dbg.value(metadata i64 %i14.063, metadata !52, metadata !DIExpression()), !dbg !104
  %arrayidx16 = getelementptr inbounds i32, i32* %2, i64 %i14.063, !dbg !120
  %9 = load i32, i32* %arrayidx16, align 4, !dbg !120, !tbaa !93
  %call17 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 noundef %i14.063, i32 noundef %9), !dbg !122
  %inc18 = add i64 %i14.063, 1, !dbg !123
  call void @llvm.dbg.value(metadata i64 %inc18, metadata !52, metadata !DIExpression()), !dbg !104
  %exitcond67.not = icmp eq i64 %inc18, %call.i55, !dbg !105
  br i1 %exitcond67.not, label %for.cond.cleanup, label %for.body, !dbg !107, !llvm.loop !124
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare token @llvm.syncregion.start() #3

; Function Attrs: argmemonly mustprogress willreturn
declare void @llvm.sync.unwind(token) #4

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: mustprogress nofree nounwind willreturn
declare dso_local i64 @strtol(i8* noundef readonly, i8** nocapture noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #7

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #7

attributes #0 = { mustprogress nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nounwind willreturn }
attributes #4 = { argmemonly mustprogress willreturn }
attributes #5 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #8 = { nounwind }
attributes #9 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !1, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang a9be1306ca6ed5a9814f041c1db11a9ffe20487b)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, imports: !9, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "simplepfor.cpp", directory: "/afs/ece/project/seth_group/ziqiliu/test", checksumkind: CSK_MD5, checksum: "a43ea96642a1a371b71b67ead9f206c4")
!2 = !{!3, !4, !6}
!3 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!9 = !{!10}
!10 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !0, entity: !11, file: !1, line: 5)
!11 = !DINamespace(name: "std", scope: null)
!12 = !{i32 7, !"Dwarf Version", i32 5}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang a9be1306ca6ed5a9814f041c1db11a9ffe20487b)"}
!17 = distinct !DISubprogram(name: "__cilkrts_getticks", linkageName: "_Z18__cilkrts_getticksv", scope: !1, file: !1, line: 7, type: !18, scopeLine: 8, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !20)
!18 = !DISubroutineType(types: !19)
!19 = !{!3}
!20 = !{!21, !23}
!21 = !DILocalVariable(name: "a", scope: !17, file: !1, line: 10, type: !22)
!22 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!23 = !DILocalVariable(name: "d", scope: !17, file: !1, line: 10, type: !22)
!24 = !DILocation(line: 11, column: 3, scope: !17)
!25 = !{i64 210}
!26 = !DILocation(line: 0, scope: !17)
!27 = !DILocation(line: 12, column: 31, scope: !17)
!28 = !DILocation(line: 12, column: 58, scope: !17)
!29 = !DILocation(line: 12, column: 61, scope: !17)
!30 = !DILocation(line: 12, column: 34, scope: !17)
!31 = !DILocation(line: 12, column: 3, scope: !17)
!32 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 19, type: !33, scopeLine: 19, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !35)
!33 = !DISubroutineType(types: !34)
!34 = !{!5, !5, !6}
!35 = !{!36, !37, !38, !40, !41, !42, !43, !44, !46, !47, !48, !49, !51, !52}
!36 = !DILocalVariable(name: "argc", arg: 1, scope: !32, file: !1, line: 19, type: !5)
!37 = !DILocalVariable(name: "argv", arg: 2, scope: !32, file: !1, line: 19, type: !6)
!38 = !DILocalVariable(name: "start", scope: !32, file: !1, line: 20, type: !39)
!39 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!40 = !DILocalVariable(name: "end", scope: !32, file: !1, line: 21, type: !39)
!41 = !DILocalVariable(name: "res", scope: !32, file: !1, line: 22, type: !4)
!42 = !DILocalVariable(name: "startT", scope: !32, file: !1, line: 24, type: !3)
!43 = !DILocalVariable(name: "endT", scope: !32, file: !1, line: 24, type: !3)
!44 = !DILocalVariable(name: "__init", scope: !45, type: !5, flags: DIFlagArtificial)
!45 = distinct !DILexicalBlock(scope: !32, file: !1, line: 27, column: 5)
!46 = !DILocalVariable(name: "__limit", scope: !45, type: !5, flags: DIFlagArtificial)
!47 = !DILocalVariable(name: "__begin", scope: !45, type: !5, flags: DIFlagArtificial)
!48 = !DILocalVariable(name: "__end", scope: !45, type: !5, flags: DIFlagArtificial)
!49 = !DILocalVariable(name: "i", scope: !50, file: !1, line: 27, type: !5)
!50 = distinct !DILexicalBlock(scope: !45, file: !1, line: 27, column: 5)
!51 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 32, type: !39)
!52 = !DILocalVariable(name: "i", scope: !53, file: !1, line: 33, type: !39)
!53 = distinct !DILexicalBlock(scope: !32, file: !1, line: 33, column: 5)
!54 = !DILocation(line: 0, scope: !32)
!55 = !DILocation(line: 20, column: 23, scope: !32)
!56 = !{!57, !57, i64 0}
!57 = !{!"any pointer", !58, i64 0}
!58 = !{!"omnipotent char", !59, i64 0}
!59 = !{!"Simple C++ TBAA"}
!60 = !DILocalVariable(name: "__nptr", arg: 1, scope: !61, file: !62, line: 283, type: !65)
!61 = distinct !DISubprogram(name: "atol", scope: !62, file: !62, line: 283, type: !63, scopeLine: 284, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !67)
!62 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f7a1412d75d9e3df251dfc21b02d59ef")
!63 = !DISubroutineType(types: !64)
!64 = !{!39, !65}
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !8)
!67 = !{!60}
!68 = !DILocation(line: 0, scope: !61, inlinedAt: !69)
!69 = distinct !DILocation(line: 20, column: 18, scope: !32)
!70 = !DILocation(line: 285, column: 10, scope: !61, inlinedAt: !69)
!71 = !DILocation(line: 21, column: 21, scope: !32)
!72 = !DILocation(line: 0, scope: !61, inlinedAt: !73)
!73 = distinct !DILocation(line: 21, column: 16, scope: !32)
!74 = !DILocation(line: 285, column: 10, scope: !61, inlinedAt: !73)
!75 = !DILocation(line: 22, column: 32, scope: !32)
!76 = !DILocation(line: 22, column: 22, scope: !32)
!77 = !DILocation(line: 22, column: 16, scope: !32)
!78 = !DILocation(line: 11, column: 3, scope: !17, inlinedAt: !79)
!79 = distinct !DILocation(line: 25, column: 14, scope: !32)
!80 = !DILocation(line: 0, scope: !17, inlinedAt: !79)
!81 = !DILocation(line: 27, column: 22, scope: !45)
!82 = !DILocation(line: 0, scope: !45)
!83 = !DILocation(line: 27, column: 33, scope: !45)
!84 = !DILocation(line: 27, column: 31, scope: !45)
!85 = !DILocation(line: 27, column: 31, scope: !50)
!86 = !DILocation(line: 27, column: 39, scope: !50)
!87 = !DILocation(line: 27, column: 14, scope: !50)
!88 = !DILocation(line: 27, column: 5, scope: !45)
!89 = !DILocation(line: 0, scope: !50)
!90 = !DILocation(line: 28, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !50, file: !1, line: 27, column: 43)
!92 = !DILocation(line: 28, column: 16, scope: !91)
!93 = !{!94, !94, i64 0}
!94 = !{!"int", !58, i64 0}
!95 = !DILocation(line: 29, column: 5, scope: !91)
!96 = !DILocation(line: 27, column: 5, scope: !50)
!97 = distinct !{!97, !88, !98, !99, !100}
!98 = !DILocation(line: 29, column: 5, scope: !45)
!99 = !{!"tapir.loop.spawn.strategy", i32 1}
!100 = !{!"tapir.loop.grainsize", i32 1}
!101 = !DILocation(line: 11, column: 3, scope: !17, inlinedAt: !102)
!102 = distinct !DILocation(line: 30, column: 10, scope: !32)
!103 = !DILocation(line: 0, scope: !17, inlinedAt: !102)
!104 = !DILocation(line: 0, scope: !53)
!105 = !DILocation(line: 33, column: 28, scope: !106)
!106 = distinct !DILexicalBlock(scope: !53, file: !1, line: 33, column: 5)
!107 = !DILocation(line: 33, column: 5, scope: !53)
!108 = !DILocation(line: 12, column: 58, scope: !17, inlinedAt: !102)
!109 = !DILocation(line: 12, column: 61, scope: !17, inlinedAt: !102)
!110 = !DILocation(line: 12, column: 31, scope: !17, inlinedAt: !102)
!111 = !DILocation(line: 12, column: 58, scope: !17, inlinedAt: !79)
!112 = !DILocation(line: 12, column: 61, scope: !17, inlinedAt: !79)
!113 = !DILocation(line: 12, column: 31, scope: !17, inlinedAt: !79)
!114 = !DILocation(line: 37, column: 13, scope: !32)
!115 = !DILocation(line: 12, column: 34, scope: !17, inlinedAt: !79)
!116 = !DILocation(line: 12, column: 34, scope: !17, inlinedAt: !102)
!117 = !DILocation(line: 37, column: 41, scope: !32)
!118 = !DILocation(line: 37, column: 5, scope: !32)
!119 = !DILocation(line: 40, column: 1, scope: !32)
!120 = !DILocation(line: 34, column: 36, scope: !121)
!121 = distinct !DILexicalBlock(scope: !106, file: !1, line: 33, column: 40)
!122 = !DILocation(line: 34, column: 9, scope: !121)
!123 = !DILocation(line: 33, column: 36, scope: !106)
!124 = distinct !{!124, !107, !125, !126}
!125 = !DILocation(line: 35, column: 5, scope: !53)
!126 = !{!"llvm.loop.mustprogress"}
