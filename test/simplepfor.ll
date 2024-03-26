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
define dso_local noundef i64 @_Z18__cilkrts_getticksv() local_unnamed_addr #0 {
entry:
  %0 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !3
  %asmresult = extractvalue { i32, i32 } %0, 0
  %asmresult1 = extractvalue { i32, i32 } %0, 1
  %conv = zext i32 %asmresult to i64
  %conv2 = zext i32 %asmresult1 to i64
  %shl = shl nuw i64 %conv2, 32
  %or = or i64 %shl, %conv
  ret i64 %or
}

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, i8** nocapture noundef readonly %argv) local_unnamed_addr #1 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1
  %0 = load i8*, i8** %arrayidx, align 8, !tbaa !4
  %call.i = tail call i64 @strtol(i8* nocapture noundef nonnull %0, i8** noundef null, i32 noundef 10) #8
  %arrayidx1 = getelementptr inbounds i8*, i8** %argv, i64 2
  %1 = load i8*, i8** %arrayidx1, align 8, !tbaa !4
  %call.i55 = tail call i64 @strtol(i8* nocapture noundef nonnull %1, i8** noundef null, i32 noundef 10) #8
  %mul = shl i64 %call.i55, 2
  %call3 = tail call noalias i8* @malloc(i64 noundef %mul) #8
  %2 = bitcast i8* %call3 to i32*
  %3 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !3
  %conv = trunc i64 %call.i to i32
  %conv5 = trunc i64 %call.i55 to i32
  %cmp = icmp sgt i32 %conv5, %conv
  br i1 %cmp, label %pfor.ph, label %cleanup

pfor.ph:                                          ; preds = %entry
  %sub = sub i32 %conv5, %conv
  %sext = shl i64 %call.i, 32
  %4 = ashr exact i64 %sext, 32
  %smax = call i32 @llvm.smax.i32(i32 %sub, i32 1)
  %wide.trip.count = zext i32 %smax to i64
  br label %pfor.cond

pfor.cond:                                        ; preds = %pfor.inc, %pfor.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %pfor.inc ], [ 0, %pfor.ph ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = add nsw i64 %indvars.iv, %4
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc

pfor.body.entry:                                  ; preds = %pfor.cond
  %arrayidx9 = getelementptr inbounds i32, i32* %2, i64 %5
  %6 = trunc i64 %5 to i32
  store i32 %6, i32* %arrayidx9, align 4, !tbaa !8
  reattach within %syncreg, label %pfor.inc

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !llvm.loop !10

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %sync.continue

sync.continue:                                    ; preds = %pfor.cond.cleanup
  tail call void @llvm.sync.unwind(token %syncreg)
  br label %cleanup

cleanup:                                          ; preds = %entry, %sync.continue
  %7 = tail call { i32, i32 } asm sideeffect "rdtsc", "={ax},={dx},~{dirflag},~{fpsr},~{flags}"() #8, !srcloc !3
  %cmp1562 = icmp slt i64 %call.i, %call.i55
  br i1 %cmp1562, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.body, %cleanup
  %asmresult1.i57 = extractvalue { i32, i32 } %7, 1
  %conv2.i59 = zext i32 %asmresult1.i57 to i64
  %shl.i60 = shl nuw i64 %conv2.i59, 32
  %asmresult.i56 = extractvalue { i32, i32 } %7, 0
  %conv.i58 = zext i32 %asmresult.i56 to i64
  %asmresult1.i = extractvalue { i32, i32 } %3, 1
  %conv2.i = zext i32 %asmresult1.i to i64
  %shl.i.neg64 = mul i64 %conv2.i, -4294967296
  %asmresult.i = extractvalue { i32, i32 } %3, 0
  %conv.i = zext i32 %asmresult.i to i64
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !4
  %or.i.neg = sub i64 %shl.i.neg64, %conv.i
  %or.i61 = add i64 %or.i.neg, %conv.i58
  %sub20 = add i64 %or.i61, %shl.i60
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %8, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i64 noundef %sub20) #9
  ret i32 1

for.body:                                         ; preds = %cleanup, %for.body
  %i14.063 = phi i64 [ %inc18, %for.body ], [ %call.i, %cleanup ]
  %arrayidx16 = getelementptr inbounds i32, i32* %2, i64 %i14.063
  %9 = load i32, i32* %arrayidx16, align 4, !tbaa !8
  %call17 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i64 noundef %i14.063, i32 noundef %9)
  %inc18 = add i64 %i14.063, 1
  %exitcond67.not = icmp eq i64 %inc18, %call.i55
  br i1 %exitcond67.not, label %for.cond.cleanup, label %for.body, !llvm.loop !13
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
declare i32 @llvm.smax.i32(i32, i32) #7

attributes #0 = { mustprogress nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress norecurse uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nounwind willreturn }
attributes #4 = { argmemonly mustprogress willreturn }
attributes #5 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #8 = { nounwind }
attributes #9 = { cold }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang a9be1306ca6ed5a9814f041c1db11a9ffe20487b)"}
!3 = !{i64 210}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = distinct !{!10, !11, !12}
!11 = !{!"tapir.loop.spawn.strategy", i32 1}
!12 = !{!"tapir.loop.grainsize", i32 1}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
