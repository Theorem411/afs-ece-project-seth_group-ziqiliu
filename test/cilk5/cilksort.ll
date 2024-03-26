; ModuleID = 'cilksort.c'
source_filename = "cilksort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [69 x i8] c"\0AUsage: cilksort [<cilk-options>] [-n size] [-c] [-benchmark] [-h]\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [69 x i8] c"Cilksort is a parallel sorting algorithm, donned \22Multisort\22, which\0A\00", align 1
@.str.2 = private unnamed_addr constant [70 x i8] c"is a variant of ordinary mergesort.  Multisort begins by dividing an\0A\00", align 1
@.str.3 = private unnamed_addr constant [70 x i8] c"array of elements in half and sorting each half.  It then merges the\0A\00", align 1
@.str.4 = private unnamed_addr constant [71 x i8] c"two sorted halves back together, but in a divide-and-conquer approach\0A\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"rather than the usual serial merge.\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"-n\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"-benchmark\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"-h\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"-r\00", align 1
@specifiers = dso_local global [6 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i8* null], align 16, !dbg !0
@opt_types = dso_local global [6 x i32] [i32 3, i32 4, i32 6, i32 4, i32 1, i32 0], align 16, !dbg !9
@.str.11 = private unnamed_addr constant [15 x i8] c"PBBS-time: %f\0A\00", align 1
@.str.13 = private unnamed_addr constant [17 x i8] c"SORTING FAILURE!\00", align 1
@.str.14 = private unnamed_addr constant [20 x i8] c"Sorting successful.\00", align 1
@.str.15 = private unnamed_addr constant [25 x i8] c"\0ACilk Example: cilksort\0A\00", align 1
@.str.16 = private unnamed_addr constant [36 x i8] c"options: number of elements = %ld\0A\0A\00", align 1
@rand_nxt = internal unnamed_addr global i64 0, align 8, !dbg !15
@str = private unnamed_addr constant [22 x i8] c"Now check result ... \00", align 1

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i64 @todval(%struct.timeval* nocapture noundef readonly %tp) local_unnamed_addr #0 !dbg !27 {
entry:
  call void @llvm.dbg.value(metadata %struct.timeval* %tp, metadata !41, metadata !DIExpression()), !dbg !42
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 0, !dbg !43
  %0 = load i64, i64* %tv_sec, align 8, !dbg !43, !tbaa !44
  %mul1 = mul i64 %0, 1000000, !dbg !49
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 1, !dbg !50
  %1 = load i64, i64* %tv_usec, align 8, !dbg !50, !tbaa !51
  %add = add nsw i64 %mul1, %1, !dbg !52
  ret i64 %add, !dbg !53
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable writeonly
define dso_local void @startup_cilk() local_unnamed_addr #2 !dbg !54 {
entry:
  %g = alloca double, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !67
  %g.0.g.0.g.0..sroa_cast = bitcast double* %g to i8*, !dbg !68
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !68
  call void @llvm.dbg.value(metadata double 2.000000e+00, metadata !58, metadata !DIExpression()), !dbg !67
  store double 2.000000e+00, double* %g, align 8, !dbg !69, !tbaa !70
  call void @llvm.dbg.value(metadata i32 0, metadata !60, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata i32 1000, metadata !62, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata i32 0, metadata !63, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata i32 1000, metadata !64, metadata !DIExpression()), !dbg !72
  br label %pfor.cond, !dbg !73

pfor.cond:                                        ; preds = %pfor.inc, %entry
  %__begin.0 = phi i32 [ 0, %entry ], [ %inc, %pfor.inc ], !dbg !72
  call void @llvm.dbg.value(metadata i32 %__begin.0, metadata !63, metadata !DIExpression()), !dbg !72
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc, !dbg !74

pfor.body.entry:                                  ; preds = %pfor.cond
  call void @llvm.dbg.value(metadata !DIArgList(i32 0, i32 %__begin.0), metadata !65, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !75
  %g.0.g.0.g.0. = load double, double* %g, align 8, !dbg !76, !tbaa !70
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !58, metadata !DIExpression()), !dbg !67
  %call = tail call double @sin(double noundef %g.0.g.0.g.0.) #19, !dbg !78
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !58, metadata !DIExpression()), !dbg !67
  %div3 = fdiv double %g.0.g.0.g.0., %call, !dbg !79
  call void @llvm.dbg.value(metadata double %div3, metadata !58, metadata !DIExpression()), !dbg !67
  store double %div3, double* %g, align 8, !dbg !79, !tbaa !70
  reattach within %syncreg, label %pfor.inc, !dbg !80

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %inc = add nuw nsw i32 %__begin.0, 1, !dbg !81
  call void @llvm.dbg.value(metadata i32 %inc, metadata !63, metadata !DIExpression()), !dbg !72
  %exitcond.not = icmp eq i32 %inc, 1000, !dbg !82
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !dbg !83, !llvm.loop !84

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %cleanup, !dbg !83

cleanup:                                          ; preds = %pfor.cond.cleanup
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !87
  ret void, !dbg !87
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare token @llvm.syncregion.start() #4

; Function Attrs: mustprogress nofree nounwind willreturn writeonly
declare dso_local double @sin(double noundef) local_unnamed_addr #5

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nofree nosync nounwind uwtable
define dso_local void @seqquick(i64* noundef %low, i64* noundef %high) local_unnamed_addr #6 !dbg !88 {
entry:
  call void @llvm.dbg.value(metadata i64* %low, metadata !92, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.value(metadata i64* %high, metadata !93, metadata !DIExpression()), !dbg !95
  %sub.ptr.lhs.cast = ptrtoint i64* %high to i64
  call void @llvm.dbg.value(metadata i64* %low, metadata !92, metadata !DIExpression()), !dbg !95
  %sub.ptr.rhs.cast12 = ptrtoint i64* %low to i64, !dbg !96
  %sub.ptr.sub13 = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast12, !dbg !96
  %cmp14 = icmp sgt i64 %sub.ptr.sub13, 152, !dbg !97
  br i1 %cmp14, label %while.body, label %while.end, !dbg !98

while.body:                                       ; preds = %entry, %seqpart.exit
  %sub.ptr.sub16 = phi i64 [ %sub.ptr.sub, %seqpart.exit ], [ %sub.ptr.sub13, %entry ]
  %low.addr.015 = phi i64* [ %add.ptr, %seqpart.exit ], [ %low, %entry ]
  call void @llvm.dbg.value(metadata i64* %low.addr.015, metadata !92, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.value(metadata i64* %low.addr.015, metadata !99, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata i64* %high, metadata !104, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata i64* %low.addr.015, metadata !108, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata i64* %high, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata i64* %low.addr.015, metadata !113, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.value(metadata i64* %high, metadata !118, metadata !DIExpression()), !dbg !119
  %0 = load i64, i64* %low.addr.015, align 8, !dbg !121, !tbaa !122
  %1 = load i64, i64* %high, align 8, !dbg !123, !tbaa !122
  %div.i.i10 = lshr i64 %sub.ptr.sub16, 4, !dbg !124
  %arrayidx.i.i = getelementptr inbounds i64, i64* %low.addr.015, i64 %div.i.i10, !dbg !125
  %2 = load i64, i64* %arrayidx.i.i, align 8, !dbg !125, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %0, metadata !126, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.value(metadata i64 %1, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.value(metadata i64 %2, metadata !132, metadata !DIExpression()), !dbg !133
  %cmp.i.i.i = icmp slt i64 %0, %1, !dbg !135
  br i1 %cmp.i.i.i, label %if.then.i.i.i, label %if.else6.i.i.i, !dbg !137

if.then.i.i.i:                                    ; preds = %while.body
  %cmp1.i.i.i = icmp slt i64 %1, %2, !dbg !138
  br i1 %cmp1.i.i.i, label %choose_pivot.exit.i, label %if.else.i.i.i, !dbg !141

if.else.i.i.i:                                    ; preds = %if.then.i.i.i
  %cmp3.i.i.i = icmp slt i64 %0, %2, !dbg !142
  %c.a.i.i.i = select i1 %cmp3.i.i.i, i64 %2, i64 %0, !dbg !145
  br label %choose_pivot.exit.i, !dbg !145

if.else6.i.i.i:                                   ; preds = %while.body
  %cmp7.i.i.i = icmp sgt i64 %1, %2, !dbg !146
  br i1 %cmp7.i.i.i, label %choose_pivot.exit.i, label %if.else9.i.i.i, !dbg !149

if.else9.i.i.i:                                   ; preds = %if.else6.i.i.i
  %cmp10.i.i.i = icmp sgt i64 %0, %2, !dbg !150
  %c.a26.i.i.i = select i1 %cmp10.i.i.i, i64 %2, i64 %0, !dbg !153
  br label %choose_pivot.exit.i, !dbg !153

choose_pivot.exit.i:                              ; preds = %if.else9.i.i.i, %if.else6.i.i.i, %if.else.i.i.i, %if.then.i.i.i
  %retval.0.i.i.i = phi i64 [ %1, %if.then.i.i.i ], [ %c.a.i.i.i, %if.else.i.i.i ], [ %1, %if.else6.i.i.i ], [ %c.a26.i.i.i, %if.else9.i.i.i ], !dbg !154
  call void @llvm.dbg.value(metadata i64 %retval.0.i.i.i, metadata !105, metadata !DIExpression()), !dbg !110
  br label %while.cond.i, !dbg !155

while.cond.i:                                     ; preds = %if.end.i, %choose_pivot.exit.i
  %curr_low.0.i = phi i64* [ %low.addr.015, %choose_pivot.exit.i ], [ %incdec.ptr6.i, %if.end.i ], !dbg !110
  %curr_high.0.i = phi i64* [ %high, %choose_pivot.exit.i ], [ %incdec.ptr.i, %if.end.i ], !dbg !110
  call void @llvm.dbg.value(metadata i64* %curr_high.0.i, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata i64* %curr_low.0.i, metadata !108, metadata !DIExpression()), !dbg !110
  br label %while.cond1.i, !dbg !156

while.cond1.i:                                    ; preds = %while.cond1.i, %while.cond.i
  %curr_high.1.i = phi i64* [ %curr_high.0.i, %while.cond.i ], [ %incdec.ptr.i, %while.cond1.i ], !dbg !110
  call void @llvm.dbg.value(metadata i64* %curr_high.1.i, metadata !109, metadata !DIExpression()), !dbg !110
  %3 = load i64, i64* %curr_high.1.i, align 8, !dbg !158, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %3, metadata !106, metadata !DIExpression()), !dbg !110
  %cmp.i = icmp sgt i64 %3, %retval.0.i.i.i, !dbg !159
  %incdec.ptr.i = getelementptr inbounds i64, i64* %curr_high.1.i, i64 -1, !dbg !160
  call void @llvm.dbg.value(metadata i64* %incdec.ptr.i, metadata !109, metadata !DIExpression()), !dbg !110
  br i1 %cmp.i, label %while.cond1.i, label %while.cond3.i, !dbg !156, !llvm.loop !161

while.cond3.i:                                    ; preds = %while.cond1.i, %while.cond3.i
  %curr_low.1.i = phi i64* [ %incdec.ptr6.i, %while.cond3.i ], [ %curr_low.0.i, %while.cond1.i ], !dbg !110
  call void @llvm.dbg.value(metadata i64* %curr_low.1.i, metadata !108, metadata !DIExpression()), !dbg !110
  %4 = load i64, i64* %curr_low.1.i, align 8, !dbg !163, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %4, metadata !107, metadata !DIExpression()), !dbg !110
  %cmp4.i = icmp slt i64 %4, %retval.0.i.i.i, !dbg !164
  %incdec.ptr6.i = getelementptr inbounds i64, i64* %curr_low.1.i, i64 1, !dbg !165
  call void @llvm.dbg.value(metadata i64* %incdec.ptr6.i, metadata !108, metadata !DIExpression()), !dbg !110
  br i1 %cmp4.i, label %while.cond3.i, label %while.end7.i, !dbg !166, !llvm.loop !167

while.end7.i:                                     ; preds = %while.cond3.i
  %cmp8.not.i = icmp ult i64* %curr_low.1.i, %curr_high.1.i, !dbg !168
  br i1 %cmp8.not.i, label %if.end.i, label %seqpart.exit, !dbg !170

if.end.i:                                         ; preds = %while.end7.i
  call void @llvm.dbg.value(metadata i64* %incdec.ptr.i, metadata !109, metadata !DIExpression()), !dbg !110
  store i64 %4, i64* %curr_high.1.i, align 8, !dbg !171, !tbaa !122
  call void @llvm.dbg.value(metadata i64* %incdec.ptr6.i, metadata !108, metadata !DIExpression()), !dbg !110
  store i64 %3, i64* %curr_low.1.i, align 8, !dbg !172, !tbaa !122
  br label %while.cond.i, !dbg !155, !llvm.loop !173

seqpart.exit:                                     ; preds = %while.end7.i
  %cmp12.i = icmp uge i64* %curr_high.1.i, %high, !dbg !175
  %retval.0.idx.i = sext i1 %cmp12.i to i64, !dbg !177
  %retval.0.i = getelementptr i64, i64* %curr_high.1.i, i64 %retval.0.idx.i, !dbg !177
  call void @llvm.dbg.value(metadata i64* %retval.0.i, metadata !94, metadata !DIExpression()), !dbg !95
  tail call void @seqquick(i64* noundef nonnull %low.addr.015, i64* noundef %retval.0.i), !dbg !178
  %add.ptr = getelementptr inbounds i64, i64* %retval.0.i, i64 1, !dbg !179
  call void @llvm.dbg.value(metadata i64* %add.ptr, metadata !92, metadata !DIExpression()), !dbg !95
  %sub.ptr.rhs.cast = ptrtoint i64* %add.ptr to i64, !dbg !96
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !96
  %cmp = icmp sgt i64 %sub.ptr.sub, 152, !dbg !97
  br i1 %cmp, label %while.body, label %while.end, !dbg !98, !llvm.loop !180

while.end:                                        ; preds = %seqpart.exit, %entry
  %low.addr.0.lcssa = phi i64* [ %low, %entry ], [ %add.ptr, %seqpart.exit ]
  call void @llvm.dbg.value(metadata i64* %low.addr.0.lcssa, metadata !182, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i64* %high, metadata !185, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i64* %low.addr.0.lcssa, metadata !187, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)), !dbg !190
  %q.028.i = getelementptr inbounds i64, i64* %low.addr.0.lcssa, i64 1, !dbg !192
  call void @llvm.dbg.value(metadata i64* %q.028.i, metadata !187, metadata !DIExpression()), !dbg !190
  %cmp.not29.i = icmp ugt i64* %q.028.i, %high, !dbg !194
  br i1 %cmp.not29.i, label %insertion_sort.exit, label %for.body.i, !dbg !196

for.body.i:                                       ; preds = %while.end, %for.end.i
  %q.031.i = phi i64* [ %q.0.i, %for.end.i ], [ %q.028.i, %while.end ]
  %low.pn30.i = phi i64* [ %q.031.i, %for.end.i ], [ %low.addr.0.lcssa, %while.end ]
  %5 = load i64, i64* %q.031.i, align 8, !dbg !197, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %5, metadata !188, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i64* %low.pn30.i, metadata !186, metadata !DIExpression()), !dbg !190
  %cmp3.not25.i = icmp ult i64* %low.pn30.i, %low.addr.0.lcssa, !dbg !199
  br i1 %cmp3.not25.i, label %for.end.i, label %land.rhs.i, !dbg !202

land.rhs.i:                                       ; preds = %for.body.i, %for.body6.i
  %p.026.i = phi i64* [ %incdec.ptr.i8, %for.body6.i ], [ %low.pn30.i, %for.body.i ]
  call void @llvm.dbg.value(metadata i64* %p.026.i, metadata !186, metadata !DIExpression()), !dbg !190
  %6 = load i64, i64* %p.026.i, align 8, !dbg !203, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %6, metadata !189, metadata !DIExpression()), !dbg !190
  %cmp5.i = icmp sgt i64 %6, %5, !dbg !204
  br i1 %cmp5.i, label %for.body6.i, label %for.end.i, !dbg !205

for.body6.i:                                      ; preds = %land.rhs.i
  %arrayidx7.i = getelementptr inbounds i64, i64* %p.026.i, i64 1, !dbg !206
  store i64 %6, i64* %arrayidx7.i, align 8, !dbg !207, !tbaa !122
  %incdec.ptr.i8 = getelementptr inbounds i64, i64* %p.026.i, i64 -1, !dbg !208
  call void @llvm.dbg.value(metadata i64* %incdec.ptr.i8, metadata !186, metadata !DIExpression()), !dbg !190
  %cmp3.not.i = icmp ult i64* %incdec.ptr.i8, %low.addr.0.lcssa, !dbg !199
  br i1 %cmp3.not.i, label %for.end.i, label %land.rhs.i, !dbg !202, !llvm.loop !209

for.end.i:                                        ; preds = %for.body6.i, %land.rhs.i, %for.body.i
  %p.0.lcssa.i = phi i64* [ %low.pn30.i, %for.body.i ], [ %incdec.ptr.i8, %for.body6.i ], [ %p.026.i, %land.rhs.i ], !dbg !211
  %arrayidx8.i = getelementptr inbounds i64, i64* %p.0.lcssa.i, i64 1, !dbg !212
  store i64 %5, i64* %arrayidx8.i, align 8, !dbg !213, !tbaa !122
  call void @llvm.dbg.value(metadata i64* %q.031.i, metadata !187, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)), !dbg !190
  %q.0.i = getelementptr inbounds i64, i64* %q.031.i, i64 1, !dbg !192
  call void @llvm.dbg.value(metadata i64* %q.0.i, metadata !187, metadata !DIExpression()), !dbg !190
  %cmp.not.i = icmp ugt i64* %q.0.i, %high, !dbg !194
  br i1 %cmp.not.i, label %insertion_sort.exit, label %for.body.i, !dbg !196, !llvm.loop !214

insertion_sort.exit:                              ; preds = %for.end.i, %while.end
  ret void, !dbg !216
}

; Function Attrs: argmemonly nofree nosync nounwind uwtable
define dso_local void @seqmerge(i64* noundef %low1, i64* noundef %high1, i64* noundef %low2, i64* noundef %high2, i64* nocapture noundef writeonly %lowdest) local_unnamed_addr #6 !dbg !217 {
entry:
  call void @llvm.dbg.value(metadata i64* %low1, metadata !221, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %high1, metadata !222, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %low2, metadata !223, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %high2, metadata !224, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %lowdest, metadata !225, metadata !DIExpression()), !dbg !228
  %cmp = icmp ult i64* %low1, %high1, !dbg !229
  %cmp1 = icmp ult i64* %low2, %high2
  %or.cond = and i1 %cmp, %cmp1, !dbg !231
  br i1 %or.cond, label %if.then, label %if.end13, !dbg !231

if.then:                                          ; preds = %entry
  %0 = load i64, i64* %low1, align 8, !dbg !232, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %0, metadata !226, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64 undef, metadata !227, metadata !DIExpression()), !dbg !228
  br label %for.cond.outer, !dbg !234

for.cond.outer:                                   ; preds = %if.else, %if.then
  %low2.addr.0.ph = phi i64* [ %incdec.ptr8, %if.else ], [ %low2, %if.then ]
  %low1.addr.0.ph = phi i64* [ %low1.addr.0, %if.else ], [ %low1, %if.then ]
  %lowdest.addr.0.ph = phi i64* [ %incdec.ptr, %if.else ], [ %lowdest, %if.then ]
  %a1.0.ph = phi i64 [ %a1.0, %if.else ], [ %0, %if.then ]
  %a2.0.ph = load i64, i64* %low2.addr.0.ph, align 8, !dbg !235, !tbaa !122
  br label %for.cond, !dbg !236

for.cond:                                         ; preds = %for.cond.outer, %if.then3
  %low1.addr.0 = phi i64* [ %incdec.ptr4, %if.then3 ], [ %low1.addr.0.ph, %for.cond.outer ]
  %lowdest.addr.0 = phi i64* [ %incdec.ptr, %if.then3 ], [ %lowdest.addr.0.ph, %for.cond.outer ]
  %a1.0 = phi i64 [ %1, %if.then3 ], [ %a1.0.ph, %for.cond.outer ], !dbg !235
  call void @llvm.dbg.value(metadata i64 %a2.0.ph, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64 %a1.0, metadata !226, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %lowdest.addr.0, metadata !225, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %low1.addr.0, metadata !221, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %low2.addr.0.ph, metadata !223, metadata !DIExpression()), !dbg !228
  %cmp2 = icmp slt i64 %a1.0, %a2.0.ph, !dbg !238
  %incdec.ptr = getelementptr inbounds i64, i64* %lowdest.addr.0, i64 1, !dbg !242
  call void @llvm.dbg.value(metadata i64* %incdec.ptr, metadata !225, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %incdec.ptr, metadata !225, metadata !DIExpression()), !dbg !228
  br i1 %cmp2, label %if.then3, label %if.else, !dbg !243

if.then3:                                         ; preds = %for.cond
  store i64 %a1.0, i64* %lowdest.addr.0, align 8, !dbg !244, !tbaa !122
  %incdec.ptr4 = getelementptr inbounds i64, i64* %low1.addr.0, i64 1, !dbg !246
  call void @llvm.dbg.value(metadata i64* %incdec.ptr4, metadata !221, metadata !DIExpression()), !dbg !228
  %1 = load i64, i64* %incdec.ptr4, align 8, !dbg !247, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %1, metadata !226, metadata !DIExpression()), !dbg !228
  %cmp5.not = icmp ult i64* %incdec.ptr4, %high1, !dbg !248
  br i1 %cmp5.not, label %for.cond, label %if.end13, !dbg !250, !llvm.loop !251

if.else:                                          ; preds = %for.cond
  store i64 %a2.0.ph, i64* %lowdest.addr.0, align 8, !dbg !253, !tbaa !122
  %incdec.ptr8 = getelementptr inbounds i64, i64* %low2.addr.0.ph, i64 1, !dbg !255
  call void @llvm.dbg.value(metadata i64* %incdec.ptr8, metadata !223, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64 undef, metadata !227, metadata !DIExpression()), !dbg !228
  %cmp9.not = icmp ult i64* %incdec.ptr8, %high2, !dbg !256
  br i1 %cmp9.not, label %for.cond.outer, label %if.end13, !dbg !258, !llvm.loop !251

if.end13:                                         ; preds = %if.then3, %if.else, %entry
  %low2.addr.2 = phi i64* [ %low2, %entry ], [ %low2.addr.0.ph, %if.then3 ], [ %incdec.ptr8, %if.else ]
  %low1.addr.2 = phi i64* [ %low1, %entry ], [ %incdec.ptr4, %if.then3 ], [ %low1.addr.0, %if.else ]
  %lowdest.addr.2 = phi i64* [ %lowdest, %entry ], [ %incdec.ptr, %if.else ], [ %incdec.ptr, %if.then3 ]
  call void @llvm.dbg.value(metadata i64* %lowdest.addr.2, metadata !225, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %low1.addr.2, metadata !221, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %low2.addr.2, metadata !223, metadata !DIExpression()), !dbg !228
  %cmp14.not = icmp ugt i64* %low1.addr.2, %high1, !dbg !259
  %cmp16.not = icmp ugt i64* %low2.addr.2, %high2
  %or.cond88 = or i1 %cmp14.not, %cmp16.not, !dbg !261
  br i1 %or.cond88, label %if.end34, label %if.then17, !dbg !261

if.then17:                                        ; preds = %if.end13
  %2 = load i64, i64* %low1.addr.2, align 8, !dbg !262, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %2, metadata !226, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64 undef, metadata !227, metadata !DIExpression()), !dbg !228
  br label %for.cond18.outer, !dbg !264

for.cond18.outer:                                 ; preds = %if.else26, %if.then17
  %low2.addr.3.ph = phi i64* [ %low2.addr.2, %if.then17 ], [ %incdec.ptr28, %if.else26 ]
  %low1.addr.3.ph = phi i64* [ %low1.addr.2, %if.then17 ], [ %low1.addr.3, %if.else26 ]
  %lowdest.addr.3.ph = phi i64* [ %lowdest.addr.2, %if.then17 ], [ %incdec.ptr21, %if.else26 ]
  %a1.2.ph = phi i64 [ %2, %if.then17 ], [ %a1.2, %if.else26 ]
  %a2.2.ph = load i64, i64* %low2.addr.3.ph, align 8, !dbg !265, !tbaa !122
  br label %for.cond18, !dbg !266

for.cond18:                                       ; preds = %for.cond18.outer, %if.end25
  %low1.addr.3 = phi i64* [ %incdec.ptr22, %if.end25 ], [ %low1.addr.3.ph, %for.cond18.outer ], !dbg !228
  %lowdest.addr.3 = phi i64* [ %incdec.ptr21, %if.end25 ], [ %lowdest.addr.3.ph, %for.cond18.outer ], !dbg !228
  %a1.2 = phi i64 [ %3, %if.end25 ], [ %a1.2.ph, %for.cond18.outer ], !dbg !265
  call void @llvm.dbg.value(metadata i64 %a2.2.ph, metadata !227, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64 %a1.2, metadata !226, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %lowdest.addr.3, metadata !225, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %low1.addr.3, metadata !221, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %low2.addr.3.ph, metadata !223, metadata !DIExpression()), !dbg !228
  %cmp19 = icmp slt i64 %a1.2, %a2.2.ph, !dbg !268
  %incdec.ptr21 = getelementptr inbounds i64, i64* %lowdest.addr.3, i64 1, !dbg !272
  call void @llvm.dbg.value(metadata i64* %incdec.ptr21, metadata !225, metadata !DIExpression()), !dbg !228
  br i1 %cmp19, label %if.then20, label %if.else26, !dbg !273

if.then20:                                        ; preds = %for.cond18
  store i64 %a1.2, i64* %lowdest.addr.3, align 8, !dbg !274, !tbaa !122
  %incdec.ptr22 = getelementptr inbounds i64, i64* %low1.addr.3, i64 1, !dbg !276
  call void @llvm.dbg.value(metadata i64* %incdec.ptr22, metadata !221, metadata !DIExpression()), !dbg !228
  %cmp23 = icmp ugt i64* %incdec.ptr22, %high1, !dbg !277
  br i1 %cmp23, label %if.end34, label %if.end25, !dbg !279

if.end25:                                         ; preds = %if.then20
  %3 = load i64, i64* %incdec.ptr22, align 8, !dbg !280, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %3, metadata !226, metadata !DIExpression()), !dbg !228
  br label %for.cond18, !dbg !281, !llvm.loop !282

if.else26:                                        ; preds = %for.cond18
  store i64 %a2.2.ph, i64* %lowdest.addr.3, align 8, !dbg !284, !tbaa !122
  %incdec.ptr28 = getelementptr inbounds i64, i64* %low2.addr.3.ph, i64 1, !dbg !286
  call void @llvm.dbg.value(metadata i64* %incdec.ptr28, metadata !223, metadata !DIExpression()), !dbg !228
  %cmp29 = icmp ugt i64* %incdec.ptr28, %high2, !dbg !287
  br i1 %cmp29, label %if.end34, label %for.cond18.outer, !dbg !289, !llvm.loop !282

if.end34:                                         ; preds = %if.then20, %if.else26, %if.end13
  %low2.addr.5 = phi i64* [ %low2.addr.2, %if.end13 ], [ %low2.addr.3.ph, %if.then20 ], [ %incdec.ptr28, %if.else26 ]
  %low1.addr.5 = phi i64* [ %low1.addr.2, %if.end13 ], [ %incdec.ptr22, %if.then20 ], [ %low1.addr.3, %if.else26 ], !dbg !228
  %lowdest.addr.5 = phi i64* [ %lowdest.addr.2, %if.end13 ], [ %incdec.ptr21, %if.else26 ], [ %incdec.ptr21, %if.then20 ], !dbg !228
  call void @llvm.dbg.value(metadata i64* %lowdest.addr.5, metadata !225, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %low1.addr.5, metadata !221, metadata !DIExpression()), !dbg !228
  call void @llvm.dbg.value(metadata i64* %low2.addr.5, metadata !223, metadata !DIExpression()), !dbg !228
  %cmp35 = icmp ugt i64* %low1.addr.5, %high1, !dbg !290
  %4 = bitcast i64* %lowdest.addr.5 to i8*, !dbg !292
  %low2.addr.5.low1.addr.5 = select i1 %cmp35, i64* %low2.addr.5, i64* %low1.addr.5
  %high2.high1 = select i1 %cmp35, i64* %high2, i64* %high1
  %5 = bitcast i64* %low2.addr.5.low1.addr.5 to i8*, !dbg !292
  %sub.ptr.lhs.cast38 = ptrtoint i64* %high2.high1 to i64, !dbg !292
  %sub.ptr.rhs.cast39 = ptrtoint i64* %low2.addr.5.low1.addr.5 to i64, !dbg !292
  %sub.ptr.sub40 = add i64 %sub.ptr.lhs.cast38, 8, !dbg !292
  %mul43 = sub i64 %sub.ptr.sub40, %sub.ptr.rhs.cast39, !dbg !292
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %4, i8* align 8 %5, i64 %mul43, i1 false), !dbg !292
  ret void, !dbg !293
}

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #7

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly uwtable
define dso_local i64* @binsplit(i64 noundef %val, i64* noundef %low, i64* noundef %high) local_unnamed_addr #8 !dbg !294 {
entry:
  call void @llvm.dbg.value(metadata i64 %val, metadata !298, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.value(metadata i64* %low, metadata !299, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.value(metadata i64* %high, metadata !300, metadata !DIExpression()), !dbg !302
  %cmp.not17 = icmp eq i64* %low, %high, !dbg !303
  br i1 %cmp.not17, label %while.end, label %while.body, !dbg !304

while.body:                                       ; preds = %entry, %while.body
  %high.addr.019 = phi i64* [ %high.addr.1, %while.body ], [ %high, %entry ]
  %low.addr.018 = phi i64* [ %low.addr.1, %while.body ], [ %low, %entry ]
  call void @llvm.dbg.value(metadata i64* %high.addr.019, metadata !300, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.value(metadata i64* %low.addr.018, metadata !299, metadata !DIExpression()), !dbg !302
  %sub.ptr.lhs.cast = ptrtoint i64* %high.addr.019 to i64, !dbg !305
  %sub.ptr.rhs.cast = ptrtoint i64* %low.addr.018 to i64, !dbg !305
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !305
  %sub.ptr.div = ashr exact i64 %sub.ptr.sub, 3, !dbg !305
  %add = add nsw i64 %sub.ptr.div, 1, !dbg !307
  %shr = ashr i64 %add, 1, !dbg !308
  %add.ptr = getelementptr inbounds i64, i64* %low.addr.018, i64 %shr, !dbg !309
  call void @llvm.dbg.value(metadata i64* %add.ptr, metadata !301, metadata !DIExpression()), !dbg !302
  %0 = load i64, i64* %add.ptr, align 8, !dbg !310, !tbaa !122
  %cmp1.not = icmp slt i64 %0, %val, !dbg !312
  %add.ptr2 = getelementptr inbounds i64, i64* %add.ptr, i64 -1, !dbg !313
  %low.addr.1 = select i1 %cmp1.not, i64* %add.ptr, i64* %low.addr.018, !dbg !313
  %high.addr.1 = select i1 %cmp1.not, i64* %high.addr.019, i64* %add.ptr2, !dbg !313
  call void @llvm.dbg.value(metadata i64* %high.addr.1, metadata !300, metadata !DIExpression()), !dbg !302
  call void @llvm.dbg.value(metadata i64* %low.addr.1, metadata !299, metadata !DIExpression()), !dbg !302
  %cmp.not = icmp eq i64* %low.addr.1, %high.addr.1, !dbg !303
  br i1 %cmp.not, label %while.end, label %while.body, !dbg !304, !llvm.loop !314

while.end:                                        ; preds = %while.body, %entry
  %low.addr.0.lcssa = phi i64* [ %low, %entry ], [ %low.addr.1, %while.body ]
  %1 = load i64, i64* %low.addr.0.lcssa, align 8, !dbg !316, !tbaa !122
  %cmp3 = icmp sgt i64 %1, %val, !dbg !318
  %retval.0.idx = sext i1 %cmp3 to i64, !dbg !319
  %retval.0 = getelementptr i64, i64* %low.addr.0.lcssa, i64 %retval.0.idx, !dbg !319
  ret i64* %retval.0, !dbg !320
}

; Function Attrs: argmemonly nounwind uwtable
define dso_local void @cilkmerge(i64* noundef %low1, i64* noundef %high1, i64* noundef %low2, i64* noundef %high2, i64* noundef %lowdest) local_unnamed_addr #9 !dbg !321 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !337
  br label %tailrecurse, !dbg !338

tailrecurse:                                      ; preds = %det.cont, %entry
  %low1.tr = phi i64* [ %low1, %entry ], [ %add.ptr36, %det.cont ]
  %high1.tr = phi i64* [ %high1, %entry ], [ %high1.addr.0, %det.cont ]
  %low2.tr = phi i64* [ %low2, %entry ], [ %add.ptr37, %det.cont ]
  %high2.tr = phi i64* [ %high2, %entry ], [ %high2.addr.0, %det.cont ]
  %lowdest.tr = phi i64* [ %lowdest, %entry ], [ %add.ptr39, %det.cont ]
  call void @llvm.dbg.value(metadata i64* %low1.tr, metadata !323, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i64* %high1.tr, metadata !324, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i64* %low2.tr, metadata !325, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i64* %high2.tr, metadata !326, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i64* %lowdest.tr, metadata !327, metadata !DIExpression()), !dbg !337
  %sub.ptr.lhs.cast = ptrtoint i64* %high2.tr to i64, !dbg !339
  %sub.ptr.rhs.cast = ptrtoint i64* %low2.tr to i64, !dbg !339
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !339
  %sub.ptr.lhs.cast1 = ptrtoint i64* %high1.tr to i64, !dbg !340
  %sub.ptr.rhs.cast2 = ptrtoint i64* %low1.tr to i64, !dbg !340
  %sub.ptr.sub3 = sub i64 %sub.ptr.lhs.cast1, %sub.ptr.rhs.cast2, !dbg !340
  %cmp = icmp sgt i64 %sub.ptr.sub, %sub.ptr.sub3, !dbg !341
  br i1 %cmp, label %if.then, label %if.end, !dbg !342

if.then:                                          ; preds = %tailrecurse
  call void @llvm.dbg.value(metadata i64* %low2.tr, metadata !323, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i64* %low1.tr, metadata !325, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i64* %high2.tr, metadata !324, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i64* %high1.tr, metadata !326, metadata !DIExpression()), !dbg !337
  br label %if.end, !dbg !343

if.end:                                           ; preds = %if.then, %tailrecurse
  %high2.addr.0 = phi i64* [ %high1.tr, %if.then ], [ %high2.tr, %tailrecurse ]
  %low2.addr.0 = phi i64* [ %low1.tr, %if.then ], [ %low2.tr, %tailrecurse ]
  %high1.addr.0 = phi i64* [ %high2.tr, %if.then ], [ %high1.tr, %tailrecurse ]
  %low1.addr.0 = phi i64* [ %low2.tr, %if.then ], [ %low1.tr, %tailrecurse ]
  call void @llvm.dbg.value(metadata i64* %low1.addr.0, metadata !323, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i64* %high1.addr.0, metadata !324, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i64* %low2.addr.0, metadata !325, metadata !DIExpression()), !dbg !337
  call void @llvm.dbg.value(metadata i64* %high2.addr.0, metadata !326, metadata !DIExpression()), !dbg !337
  %cmp6 = icmp ult i64* %high1.addr.0, %low1.addr.0, !dbg !344
  br i1 %cmp6, label %if.then7, label %if.end12, !dbg !346

if.then7:                                         ; preds = %if.end
  %0 = bitcast i64* %lowdest.tr to i8*, !dbg !347
  %1 = bitcast i64* %low2.addr.0 to i8*, !dbg !347
  %sub.ptr.lhs.cast8 = ptrtoint i64* %high2.addr.0 to i64, !dbg !349
  %sub.ptr.rhs.cast9 = ptrtoint i64* %low2.addr.0 to i64, !dbg !349
  %sub.ptr.sub10 = sub i64 %sub.ptr.lhs.cast8, %sub.ptr.rhs.cast9, !dbg !349
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 %sub.ptr.sub10, i1 false), !dbg !347
  br label %cleanup, !dbg !350

if.end12:                                         ; preds = %if.end
  %sub.ptr.lhs.cast13 = ptrtoint i64* %high2.addr.0 to i64, !dbg !351
  %sub.ptr.rhs.cast14 = ptrtoint i64* %low2.addr.0 to i64, !dbg !351
  %sub.ptr.sub15 = sub i64 %sub.ptr.lhs.cast13, %sub.ptr.rhs.cast14, !dbg !351
  %cmp17 = icmp slt i64 %sub.ptr.sub15, 16384, !dbg !353
  br i1 %cmp17, label %if.then18, label %if.end19, !dbg !354

if.then18:                                        ; preds = %if.end12
  call void @llvm.dbg.value(metadata i64* %low1.addr.0, metadata !221, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %high1.addr.0, metadata !222, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %low2.addr.0, metadata !223, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %high2.addr.0, metadata !224, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %lowdest.tr, metadata !225, metadata !DIExpression()) #19, !dbg !355
  %cmp.i = icmp ult i64* %low1.addr.0, %high1.addr.0, !dbg !358
  %cmp1.i = icmp ult i64* %low2.addr.0, %high2.addr.0
  %or.cond.i = and i1 %cmp1.i, %cmp.i, !dbg !359
  br i1 %or.cond.i, label %if.then.i, label %if.end13.i, !dbg !359

if.then.i:                                        ; preds = %if.then18
  %2 = load i64, i64* %low1.addr.0, align 8, !dbg !360, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %2, metadata !226, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64 undef, metadata !227, metadata !DIExpression()) #19, !dbg !355
  br label %for.cond.i.outer, !dbg !361

for.cond.i.outer:                                 ; preds = %if.else.i, %if.then.i
  %low2.addr.0.i.ph = phi i64* [ %incdec.ptr8.i, %if.else.i ], [ %low2.addr.0, %if.then.i ]
  %low1.addr.0.i.ph = phi i64* [ %low1.addr.0.i, %if.else.i ], [ %low1.addr.0, %if.then.i ]
  %lowdest.addr.0.i.ph = phi i64* [ %incdec.ptr.i, %if.else.i ], [ %lowdest.tr, %if.then.i ]
  %a1.0.i.ph = phi i64 [ %a1.0.i, %if.else.i ], [ %2, %if.then.i ]
  %a2.0.i.ph = load i64, i64* %low2.addr.0.i.ph, align 8, !dbg !362, !tbaa !122
  br label %for.cond.i, !dbg !363

for.cond.i:                                       ; preds = %for.cond.i.outer, %if.then3.i
  %low1.addr.0.i = phi i64* [ %incdec.ptr4.i, %if.then3.i ], [ %low1.addr.0.i.ph, %for.cond.i.outer ]
  %lowdest.addr.0.i = phi i64* [ %incdec.ptr.i, %if.then3.i ], [ %lowdest.addr.0.i.ph, %for.cond.i.outer ]
  %a1.0.i = phi i64 [ %3, %if.then3.i ], [ %a1.0.i.ph, %for.cond.i.outer ], !dbg !362
  call void @llvm.dbg.value(metadata i64 %a2.0.i.ph, metadata !227, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64 %a1.0.i, metadata !226, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %lowdest.addr.0.i, metadata !225, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %low1.addr.0.i, metadata !221, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %low2.addr.0.i.ph, metadata !223, metadata !DIExpression()) #19, !dbg !355
  %cmp2.i = icmp slt i64 %a1.0.i, %a2.0.i.ph, !dbg !364
  %incdec.ptr.i = getelementptr inbounds i64, i64* %lowdest.addr.0.i, i64 1, !dbg !365
  call void @llvm.dbg.value(metadata i64* %incdec.ptr.i, metadata !225, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %incdec.ptr.i, metadata !225, metadata !DIExpression()) #19, !dbg !355
  br i1 %cmp2.i, label %if.then3.i, label %if.else.i, !dbg !366

if.then3.i:                                       ; preds = %for.cond.i
  store i64 %a1.0.i, i64* %lowdest.addr.0.i, align 8, !dbg !367, !tbaa !122
  %incdec.ptr4.i = getelementptr inbounds i64, i64* %low1.addr.0.i, i64 1, !dbg !368
  call void @llvm.dbg.value(metadata i64* %incdec.ptr4.i, metadata !221, metadata !DIExpression()) #19, !dbg !355
  %3 = load i64, i64* %incdec.ptr4.i, align 8, !dbg !369, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %3, metadata !226, metadata !DIExpression()) #19, !dbg !355
  %cmp5.not.i = icmp ult i64* %incdec.ptr4.i, %high1.addr.0, !dbg !370
  br i1 %cmp5.not.i, label %for.cond.i, label %if.end13.i, !dbg !371, !llvm.loop !372

if.else.i:                                        ; preds = %for.cond.i
  store i64 %a2.0.i.ph, i64* %lowdest.addr.0.i, align 8, !dbg !374, !tbaa !122
  %incdec.ptr8.i = getelementptr inbounds i64, i64* %low2.addr.0.i.ph, i64 1, !dbg !375
  call void @llvm.dbg.value(metadata i64* %incdec.ptr8.i, metadata !223, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64 undef, metadata !227, metadata !DIExpression()) #19, !dbg !355
  %cmp9.not.i = icmp ult i64* %incdec.ptr8.i, %high2.addr.0, !dbg !376
  br i1 %cmp9.not.i, label %for.cond.i.outer, label %if.end13.i, !dbg !377, !llvm.loop !372

if.end13.i:                                       ; preds = %if.then3.i, %if.else.i, %if.then18
  %low2.addr.2.i = phi i64* [ %low2.addr.0, %if.then18 ], [ %low2.addr.0.i.ph, %if.then3.i ], [ %incdec.ptr8.i, %if.else.i ]
  %low1.addr.2.i = phi i64* [ %low1.addr.0, %if.then18 ], [ %incdec.ptr4.i, %if.then3.i ], [ %low1.addr.0.i, %if.else.i ]
  %lowdest.addr.2.i = phi i64* [ %lowdest.tr, %if.then18 ], [ %incdec.ptr.i, %if.else.i ], [ %incdec.ptr.i, %if.then3.i ]
  call void @llvm.dbg.value(metadata i64* %lowdest.addr.2.i, metadata !225, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %low1.addr.2.i, metadata !221, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %low2.addr.2.i, metadata !223, metadata !DIExpression()) #19, !dbg !355
  %cmp14.not.i = icmp ugt i64* %low1.addr.2.i, %high1.addr.0, !dbg !378
  %cmp16.not.i = icmp ugt i64* %low2.addr.2.i, %high2.addr.0
  %or.cond88.i = select i1 %cmp14.not.i, i1 true, i1 %cmp16.not.i, !dbg !379
  br i1 %or.cond88.i, label %seqmerge.exit, label %if.then17.i, !dbg !379

if.then17.i:                                      ; preds = %if.end13.i
  %4 = load i64, i64* %low1.addr.2.i, align 8, !dbg !380, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %4, metadata !226, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64 undef, metadata !227, metadata !DIExpression()) #19, !dbg !355
  br label %for.cond18.i.outer, !dbg !381

for.cond18.i.outer:                               ; preds = %if.else26.i, %if.then17.i
  %low2.addr.3.i.ph = phi i64* [ %low2.addr.2.i, %if.then17.i ], [ %incdec.ptr28.i, %if.else26.i ]
  %low1.addr.3.i.ph = phi i64* [ %low1.addr.2.i, %if.then17.i ], [ %low1.addr.3.i, %if.else26.i ]
  %lowdest.addr.3.i.ph = phi i64* [ %lowdest.addr.2.i, %if.then17.i ], [ %incdec.ptr21.i, %if.else26.i ]
  %a1.2.i.ph = phi i64 [ %4, %if.then17.i ], [ %a1.2.i, %if.else26.i ]
  %a2.2.i.ph = load i64, i64* %low2.addr.3.i.ph, align 8, !dbg !382, !tbaa !122
  br label %for.cond18.i, !dbg !383

for.cond18.i:                                     ; preds = %for.cond18.i.outer, %if.end25.i
  %low1.addr.3.i = phi i64* [ %incdec.ptr22.i, %if.end25.i ], [ %low1.addr.3.i.ph, %for.cond18.i.outer ], !dbg !355
  %lowdest.addr.3.i = phi i64* [ %incdec.ptr21.i, %if.end25.i ], [ %lowdest.addr.3.i.ph, %for.cond18.i.outer ], !dbg !355
  %a1.2.i = phi i64 [ %5, %if.end25.i ], [ %a1.2.i.ph, %for.cond18.i.outer ], !dbg !382
  call void @llvm.dbg.value(metadata i64 %a2.2.i.ph, metadata !227, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64 %a1.2.i, metadata !226, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %lowdest.addr.3.i, metadata !225, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %low1.addr.3.i, metadata !221, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %low2.addr.3.i.ph, metadata !223, metadata !DIExpression()) #19, !dbg !355
  %cmp19.i = icmp slt i64 %a1.2.i, %a2.2.i.ph, !dbg !384
  %incdec.ptr21.i = getelementptr inbounds i64, i64* %lowdest.addr.3.i, i64 1, !dbg !385
  call void @llvm.dbg.value(metadata i64* %incdec.ptr21.i, metadata !225, metadata !DIExpression()) #19, !dbg !355
  br i1 %cmp19.i, label %if.then20.i, label %if.else26.i, !dbg !386

if.then20.i:                                      ; preds = %for.cond18.i
  store i64 %a1.2.i, i64* %lowdest.addr.3.i, align 8, !dbg !387, !tbaa !122
  %incdec.ptr22.i = getelementptr inbounds i64, i64* %low1.addr.3.i, i64 1, !dbg !388
  call void @llvm.dbg.value(metadata i64* %incdec.ptr22.i, metadata !221, metadata !DIExpression()) #19, !dbg !355
  %cmp23.i = icmp ugt i64* %incdec.ptr22.i, %high1.addr.0, !dbg !389
  br i1 %cmp23.i, label %seqmerge.exit, label %if.end25.i, !dbg !390

if.end25.i:                                       ; preds = %if.then20.i
  %5 = load i64, i64* %incdec.ptr22.i, align 8, !dbg !391, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %5, metadata !226, metadata !DIExpression()) #19, !dbg !355
  br label %for.cond18.i, !dbg !392, !llvm.loop !393

if.else26.i:                                      ; preds = %for.cond18.i
  store i64 %a2.2.i.ph, i64* %lowdest.addr.3.i, align 8, !dbg !395, !tbaa !122
  %incdec.ptr28.i = getelementptr inbounds i64, i64* %low2.addr.3.i.ph, i64 1, !dbg !396
  call void @llvm.dbg.value(metadata i64* %incdec.ptr28.i, metadata !223, metadata !DIExpression()) #19, !dbg !355
  %cmp29.i = icmp ugt i64* %incdec.ptr28.i, %high2.addr.0, !dbg !397
  br i1 %cmp29.i, label %seqmerge.exit, label %for.cond18.i.outer, !dbg !398, !llvm.loop !393

seqmerge.exit:                                    ; preds = %if.then20.i, %if.else26.i, %if.end13.i
  %low2.addr.5.i = phi i64* [ %low2.addr.2.i, %if.end13.i ], [ %low2.addr.3.i.ph, %if.then20.i ], [ %incdec.ptr28.i, %if.else26.i ]
  %low1.addr.5.i = phi i64* [ %low1.addr.2.i, %if.end13.i ], [ %incdec.ptr22.i, %if.then20.i ], [ %low1.addr.3.i, %if.else26.i ], !dbg !355
  %lowdest.addr.5.i = phi i64* [ %lowdest.addr.2.i, %if.end13.i ], [ %incdec.ptr21.i, %if.else26.i ], [ %incdec.ptr21.i, %if.then20.i ], !dbg !355
  call void @llvm.dbg.value(metadata i64* %lowdest.addr.5.i, metadata !225, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %low1.addr.5.i, metadata !221, metadata !DIExpression()) #19, !dbg !355
  call void @llvm.dbg.value(metadata i64* %low2.addr.5.i, metadata !223, metadata !DIExpression()) #19, !dbg !355
  %cmp35.i = icmp ugt i64* %low1.addr.5.i, %high1.addr.0, !dbg !399
  %6 = bitcast i64* %lowdest.addr.5.i to i8*, !dbg !400
  %low2.addr.5.low1.addr.5.i = select i1 %cmp35.i, i64* %low2.addr.5.i, i64* %low1.addr.5.i
  %high2.high1.i = select i1 %cmp35.i, i64* %high2.addr.0, i64* %high1.addr.0
  %7 = bitcast i64* %low2.addr.5.low1.addr.5.i to i8*, !dbg !400
  %sub.ptr.lhs.cast38.i = ptrtoint i64* %high2.high1.i to i64, !dbg !400
  %sub.ptr.rhs.cast39.i = ptrtoint i64* %low2.addr.5.low1.addr.5.i to i64, !dbg !400
  %sub.ptr.sub40.i = add i64 %sub.ptr.lhs.cast38.i, 8, !dbg !400
  %mul43.i = sub i64 %sub.ptr.sub40.i, %sub.ptr.rhs.cast39.i, !dbg !400
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 8 %7, i64 %mul43.i, i1 false) #19, !dbg !400
  br label %cleanup, !dbg !401

if.end19:                                         ; preds = %if.end12
  %sub.ptr.lhs.cast20 = ptrtoint i64* %high1.addr.0 to i64, !dbg !402
  %sub.ptr.rhs.cast21 = ptrtoint i64* %low1.addr.0 to i64, !dbg !402
  %sub.ptr.sub22 = sub i64 %sub.ptr.lhs.cast20, %sub.ptr.rhs.cast21, !dbg !402
  %sub.ptr.div23 = ashr exact i64 %sub.ptr.sub22, 3, !dbg !402
  %add = add nsw i64 %sub.ptr.div23, 1, !dbg !403
  %div = sdiv i64 %add, 2, !dbg !404
  %add.ptr = getelementptr inbounds i64, i64* %low1.addr.0, i64 %div, !dbg !405
  call void @llvm.dbg.value(metadata i64* %add.ptr, metadata !328, metadata !DIExpression()), !dbg !337
  %8 = load i64, i64* %add.ptr, align 8, !dbg !406, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %8, metadata !298, metadata !DIExpression()), !dbg !407
  call void @llvm.dbg.value(metadata i64* %low2.addr.0, metadata !299, metadata !DIExpression()), !dbg !407
  call void @llvm.dbg.value(metadata i64* %high2.addr.0, metadata !300, metadata !DIExpression()), !dbg !407
  %cmp.not17.i = icmp eq i64* %low2.addr.0, %high2.addr.0, !dbg !409
  br i1 %cmp.not17.i, label %binsplit.exit, label %while.body.i, !dbg !410

while.body.i:                                     ; preds = %if.end19, %while.body.i
  %high.addr.019.i = phi i64* [ %high.addr.1.i, %while.body.i ], [ %high2.addr.0, %if.end19 ]
  %low.addr.018.i = phi i64* [ %low.addr.1.i, %while.body.i ], [ %low2.addr.0, %if.end19 ]
  call void @llvm.dbg.value(metadata i64* %high.addr.019.i, metadata !300, metadata !DIExpression()), !dbg !407
  call void @llvm.dbg.value(metadata i64* %low.addr.018.i, metadata !299, metadata !DIExpression()), !dbg !407
  %sub.ptr.lhs.cast.i = ptrtoint i64* %high.addr.019.i to i64, !dbg !411
  %sub.ptr.rhs.cast.i = ptrtoint i64* %low.addr.018.i to i64, !dbg !411
  %sub.ptr.sub.i = sub i64 %sub.ptr.lhs.cast.i, %sub.ptr.rhs.cast.i, !dbg !411
  %sub.ptr.div.i = ashr exact i64 %sub.ptr.sub.i, 3, !dbg !411
  %add.i = add nsw i64 %sub.ptr.div.i, 1, !dbg !412
  %shr.i = ashr i64 %add.i, 1, !dbg !413
  %add.ptr.i = getelementptr inbounds i64, i64* %low.addr.018.i, i64 %shr.i, !dbg !414
  call void @llvm.dbg.value(metadata i64* %add.ptr.i, metadata !301, metadata !DIExpression()), !dbg !407
  %9 = load i64, i64* %add.ptr.i, align 8, !dbg !415, !tbaa !122
  %cmp1.not.i = icmp slt i64 %9, %8, !dbg !416
  %add.ptr2.i = getelementptr inbounds i64, i64* %add.ptr.i, i64 -1, !dbg !417
  %low.addr.1.i = select i1 %cmp1.not.i, i64* %add.ptr.i, i64* %low.addr.018.i, !dbg !417
  %high.addr.1.i = select i1 %cmp1.not.i, i64* %high.addr.019.i, i64* %add.ptr2.i, !dbg !417
  call void @llvm.dbg.value(metadata i64* %high.addr.1.i, metadata !300, metadata !DIExpression()), !dbg !407
  call void @llvm.dbg.value(metadata i64* %low.addr.1.i, metadata !299, metadata !DIExpression()), !dbg !407
  %cmp.not.i = icmp eq i64* %low.addr.1.i, %high.addr.1.i, !dbg !409
  br i1 %cmp.not.i, label %binsplit.exit, label %while.body.i, !dbg !410, !llvm.loop !418

binsplit.exit:                                    ; preds = %while.body.i, %if.end19
  %low.addr.0.lcssa.i = phi i64* [ %high2.addr.0, %if.end19 ], [ %low.addr.1.i, %while.body.i ]
  %10 = load i64, i64* %low.addr.0.lcssa.i, align 8, !dbg !420, !tbaa !122
  %cmp3.i = icmp sgt i64 %10, %8, !dbg !421
  %retval.0.idx.i = sext i1 %cmp3.i to i64, !dbg !422
  %retval.0.i = getelementptr i64, i64* %low.addr.0.lcssa.i, i64 %retval.0.idx.i, !dbg !422
  call void @llvm.dbg.value(metadata i64* %retval.0.i, metadata !329, metadata !DIExpression()), !dbg !337
  %add.ptr28 = getelementptr inbounds i64, i64* %retval.0.i, i64 %div, !dbg !423
  %sub.ptr.lhs.cast29 = ptrtoint i64* %add.ptr28 to i64, !dbg !424
  %sub.ptr.sub31 = sub i64 %sub.ptr.lhs.cast29, %sub.ptr.rhs.cast14, !dbg !424
  %sub.ptr.div32 = ashr exact i64 %sub.ptr.sub31, 3, !dbg !424
  call void @llvm.dbg.value(metadata i64 %sub.ptr.div32, metadata !330, metadata !DIExpression()), !dbg !337
  %add.ptr33 = getelementptr inbounds i64, i64* %lowdest.tr, i64 %sub.ptr.div32, !dbg !425
  %add.ptr34 = getelementptr inbounds i64, i64* %add.ptr33, i64 1, !dbg !426
  store i64 %8, i64* %add.ptr34, align 8, !dbg !427, !tbaa !122
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !428

det.achd:                                         ; preds = %binsplit.exit
  %add.ptr35 = getelementptr inbounds i64, i64* %add.ptr, i64 -1, !dbg !429
  tail call void @cilkmerge(i64* noundef %low1.addr.0, i64* noundef nonnull %add.ptr35, i64* noundef %low2.addr.0, i64* noundef %retval.0.i, i64* noundef nonnull %lowdest.tr), !dbg !428
  reattach within %syncreg, label %det.cont, !dbg !428

det.cont:                                         ; preds = %det.achd, %binsplit.exit
  %add.ptr36 = getelementptr inbounds i64, i64* %add.ptr, i64 1, !dbg !430
  %add.ptr37 = getelementptr inbounds i64, i64* %retval.0.i, i64 1, !dbg !431
  %add.ptr39 = getelementptr inbounds i64, i64* %add.ptr33, i64 2, !dbg !432
  br label %tailrecurse, !dbg !338

cleanup:                                          ; preds = %seqmerge.exit, %if.then7
  sync within %syncreg, label %cleanup.split, !dbg !433

cleanup.split:                                    ; preds = %cleanup
  ret void, !dbg !433
}

; Function Attrs: argmemonly nounwind uwtable
define dso_local void @cilksort(i64* noundef %low, i64* noundef %tmp, i64 noundef %size) local_unnamed_addr #9 !dbg !434 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !450
  call void @llvm.dbg.value(metadata i64* %low, metadata !438, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.value(metadata i64* %tmp, metadata !439, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.value(metadata i64 %size, metadata !440, metadata !DIExpression()), !dbg !450
  %div = sdiv i64 %size, 4, !dbg !451
  call void @llvm.dbg.value(metadata i64 %div, metadata !441, metadata !DIExpression()), !dbg !450
  %cmp = icmp slt i64 %size, 2048, !dbg !452
  br i1 %cmp, label %if.then, label %if.end, !dbg !454

if.then:                                          ; preds = %entry
  %add.ptr = getelementptr inbounds i64, i64* %low, i64 %size, !dbg !455
  %add.ptr1 = getelementptr inbounds i64, i64* %add.ptr, i64 -1, !dbg !457
  tail call void @seqquick(i64* noundef %low, i64* noundef nonnull %add.ptr1), !dbg !458
  br label %cleanup, !dbg !459

if.end:                                           ; preds = %entry
  call void @llvm.dbg.value(metadata i64* %low, metadata !442, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.value(metadata i64* %tmp, metadata !446, metadata !DIExpression()), !dbg !450
  %add.ptr2 = getelementptr inbounds i64, i64* %low, i64 %div, !dbg !460
  call void @llvm.dbg.value(metadata i64* %add.ptr2, metadata !443, metadata !DIExpression()), !dbg !450
  %add.ptr3 = getelementptr inbounds i64, i64* %tmp, i64 %div, !dbg !461
  call void @llvm.dbg.value(metadata i64* %add.ptr3, metadata !447, metadata !DIExpression()), !dbg !450
  %add.ptr4 = getelementptr inbounds i64, i64* %add.ptr2, i64 %div, !dbg !462
  call void @llvm.dbg.value(metadata i64* %add.ptr4, metadata !444, metadata !DIExpression()), !dbg !450
  %add.ptr5 = getelementptr inbounds i64, i64* %add.ptr3, i64 %div, !dbg !463
  call void @llvm.dbg.value(metadata i64* %add.ptr5, metadata !448, metadata !DIExpression()), !dbg !450
  %add.ptr6 = getelementptr inbounds i64, i64* %add.ptr4, i64 %div, !dbg !464
  call void @llvm.dbg.value(metadata i64* %add.ptr6, metadata !445, metadata !DIExpression()), !dbg !450
  %add.ptr7 = getelementptr inbounds i64, i64* %add.ptr5, i64 %div, !dbg !465
  call void @llvm.dbg.value(metadata i64* %add.ptr7, metadata !449, metadata !DIExpression()), !dbg !450
  detach within %syncreg, label %det.achd, label %det.cont.tf, !dbg !466

det.achd:                                         ; preds = %if.end
  tail call void @cilksort(i64* noundef %low, i64* noundef %tmp, i64 noundef %div), !dbg !466
  reattach within %syncreg, label %det.cont.tf, !dbg !466

det.cont.tf:                                      ; preds = %if.end, %det.achd
  detach within %syncreg, label %det.achd8, label %det.cont9.tf, !dbg !467

det.achd8:                                        ; preds = %det.cont.tf
  tail call void @cilksort(i64* noundef %add.ptr2, i64* noundef %add.ptr3, i64 noundef %div), !dbg !467
  reattach within %syncreg, label %det.cont9.tf, !dbg !467

det.cont9.tf:                                     ; preds = %det.cont.tf, %det.achd8
  detach within %syncreg, label %det.achd10, label %det.cont11, !dbg !468

det.achd10:                                       ; preds = %det.cont9.tf
  tail call void @cilksort(i64* noundef %add.ptr4, i64* noundef %add.ptr5, i64 noundef %div), !dbg !468
  reattach within %syncreg, label %det.cont11, !dbg !468

det.cont11:                                       ; preds = %det.achd10, %det.cont9.tf
  %mul.neg = mul nsw i64 %div, -3, !dbg !469
  %sub = add i64 %mul.neg, %size, !dbg !470
  tail call void @cilksort(i64* noundef %add.ptr6, i64* noundef %add.ptr7, i64 noundef %sub), !dbg !471
  sync within %syncreg, label %sync.continue.tf, !dbg !472

sync.continue.tf:                                 ; preds = %det.cont11
  detach within %syncreg, label %det.achd16, label %det.cont17, !dbg !473

det.achd16:                                       ; preds = %sync.continue.tf
  %add.ptr15 = getelementptr inbounds i64, i64* %add.ptr4, i64 -1, !dbg !474
  %add.ptr13 = getelementptr inbounds i64, i64* %add.ptr2, i64 -1, !dbg !475
  tail call void @cilkmerge(i64* noundef %low, i64* noundef nonnull %add.ptr13, i64* noundef %add.ptr2, i64* noundef nonnull %add.ptr15, i64* noundef %tmp), !dbg !473
  reattach within %syncreg, label %det.cont17, !dbg !473

det.cont17:                                       ; preds = %det.achd16, %sync.continue.tf
  %add.ptr19 = getelementptr inbounds i64, i64* %add.ptr6, i64 -1, !dbg !476
  %add.ptr20 = getelementptr inbounds i64, i64* %low, i64 %size, !dbg !477
  %add.ptr21 = getelementptr inbounds i64, i64* %add.ptr20, i64 -1, !dbg !478
  tail call void @cilkmerge(i64* noundef %add.ptr4, i64* noundef nonnull %add.ptr19, i64* noundef %add.ptr6, i64* noundef nonnull %add.ptr21, i64* noundef %add.ptr5), !dbg !479
  sync within %syncreg, label %sync.continue22, !dbg !480

sync.continue22:                                  ; preds = %det.cont17
  %add.ptr23 = getelementptr inbounds i64, i64* %add.ptr5, i64 -1, !dbg !481
  %add.ptr24 = getelementptr inbounds i64, i64* %tmp, i64 %size, !dbg !482
  %add.ptr25 = getelementptr inbounds i64, i64* %add.ptr24, i64 -1, !dbg !483
  tail call void @cilkmerge(i64* noundef %tmp, i64* noundef nonnull %add.ptr23, i64* noundef %add.ptr5, i64* noundef nonnull %add.ptr25, i64* noundef %low), !dbg !484
  br label %cleanup, !dbg !485

cleanup:                                          ; preds = %sync.continue22, %if.then
  ret void, !dbg !486
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @scramble_array(i64* nocapture noundef %arr, i64 noundef %size) local_unnamed_addr #10 !dbg !487 {
entry:
  call void @llvm.dbg.value(metadata i64* %arr, metadata !491, metadata !DIExpression()), !dbg !500
  call void @llvm.dbg.value(metadata i64 %size, metadata !492, metadata !DIExpression()), !dbg !500
  call void @llvm.dbg.value(metadata i64 0, metadata !493, metadata !DIExpression()), !dbg !500
  call void @llvm.dbg.value(metadata i64 0, metadata !493, metadata !DIExpression()), !dbg !500
  %cmp17.not = icmp eq i64 %size, 0, !dbg !501
  br i1 %cmp17.not, label %for.end, label %for.body.preheader, !dbg !502

for.body.preheader:                               ; preds = %entry
  %rand_nxt.promoted = load i64, i64* @rand_nxt, align 8, !tbaa !122
  %xtraiter = and i64 %size, 1, !dbg !502
  %0 = icmp eq i64 %size, 1, !dbg !502
  br i1 %0, label %for.cond.for.end_crit_edge.unr-lcssa, label %for.body.preheader.new, !dbg !502

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %size, -2, !dbg !502
  br label %for.body, !dbg !502

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %i.019 = phi i64 [ 0, %for.body.preheader.new ], [ %inc.1, %for.body ]
  %add.i1618 = phi i64 [ %rand_nxt.promoted, %for.body.preheader.new ], [ %add.i.1, %for.body ]
  %niter = phi i64 [ 0, %for.body.preheader.new ], [ %niter.next.1, %for.body ]
  call void @llvm.dbg.value(metadata i64 %i.019, metadata !493, metadata !DIExpression()), !dbg !500
  %mul.i = mul i64 %add.i1618, 1103515245, !dbg !503
  %add.i = add i64 %mul.i, 12345, !dbg !509
  call void @llvm.dbg.value(metadata i64 %add.i, metadata !494, metadata !DIExpression()), !dbg !500
  %rem = urem i64 %add.i, %size, !dbg !510
  call void @llvm.dbg.value(metadata i64 %rem, metadata !494, metadata !DIExpression()), !dbg !500
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %i.019, !dbg !511
  %1 = load i64, i64* %arrayidx, align 8, !dbg !511, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %1, metadata !495, metadata !DIExpression()), !dbg !512
  %arrayidx1 = getelementptr inbounds i64, i64* %arr, i64 %rem, !dbg !511
  %2 = load i64, i64* %arrayidx1, align 8, !dbg !511, !tbaa !122
  store i64 %2, i64* %arrayidx, align 8, !dbg !511, !tbaa !122
  store i64 %1, i64* %arrayidx1, align 8, !dbg !511, !tbaa !122
  %inc = or i64 %i.019, 1, !dbg !513
  call void @llvm.dbg.value(metadata i64 %inc, metadata !493, metadata !DIExpression()), !dbg !500
  call void @llvm.dbg.value(metadata i64 %inc, metadata !493, metadata !DIExpression()), !dbg !500
  %mul.i.1 = mul i64 %add.i, 1103515245, !dbg !503
  %add.i.1 = add i64 %mul.i.1, 12345, !dbg !509
  call void @llvm.dbg.value(metadata i64 %add.i.1, metadata !494, metadata !DIExpression()), !dbg !500
  %rem.1 = urem i64 %add.i.1, %size, !dbg !510
  call void @llvm.dbg.value(metadata i64 %rem.1, metadata !494, metadata !DIExpression()), !dbg !500
  %arrayidx.1 = getelementptr inbounds i64, i64* %arr, i64 %inc, !dbg !511
  %3 = load i64, i64* %arrayidx.1, align 8, !dbg !511, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %3, metadata !495, metadata !DIExpression()), !dbg !512
  %arrayidx1.1 = getelementptr inbounds i64, i64* %arr, i64 %rem.1, !dbg !511
  %4 = load i64, i64* %arrayidx1.1, align 8, !dbg !511, !tbaa !122
  store i64 %4, i64* %arrayidx.1, align 8, !dbg !511, !tbaa !122
  store i64 %3, i64* %arrayidx1.1, align 8, !dbg !511, !tbaa !122
  %inc.1 = add nuw i64 %i.019, 2, !dbg !513
  call void @llvm.dbg.value(metadata i64 %inc.1, metadata !493, metadata !DIExpression()), !dbg !500
  %niter.next.1 = add i64 %niter, 2, !dbg !502
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !502
  br i1 %niter.ncmp.1, label %for.cond.for.end_crit_edge.unr-lcssa, label %for.body, !dbg !502, !llvm.loop !514

for.cond.for.end_crit_edge.unr-lcssa:             ; preds = %for.body, %for.body.preheader
  %add.i.lcssa.ph = phi i64 [ undef, %for.body.preheader ], [ %add.i.1, %for.body ]
  %i.019.unr = phi i64 [ 0, %for.body.preheader ], [ %inc.1, %for.body ]
  %add.i1618.unr = phi i64 [ %rand_nxt.promoted, %for.body.preheader ], [ %add.i.1, %for.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !502
  br i1 %lcmp.mod.not, label %for.cond.for.end_crit_edge, label %for.body.epil, !dbg !502

for.body.epil:                                    ; preds = %for.cond.for.end_crit_edge.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %i.019.unr, metadata !493, metadata !DIExpression()), !dbg !500
  %mul.i.epil = mul i64 %add.i1618.unr, 1103515245, !dbg !503
  %add.i.epil = add i64 %mul.i.epil, 12345, !dbg !509
  call void @llvm.dbg.value(metadata i64 %add.i.epil, metadata !494, metadata !DIExpression()), !dbg !500
  %rem.epil = urem i64 %add.i.epil, %size, !dbg !510
  call void @llvm.dbg.value(metadata i64 %rem.epil, metadata !494, metadata !DIExpression()), !dbg !500
  %arrayidx.epil = getelementptr inbounds i64, i64* %arr, i64 %i.019.unr, !dbg !511
  %5 = load i64, i64* %arrayidx.epil, align 8, !dbg !511, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %5, metadata !495, metadata !DIExpression()), !dbg !512
  %arrayidx1.epil = getelementptr inbounds i64, i64* %arr, i64 %rem.epil, !dbg !511
  %6 = load i64, i64* %arrayidx1.epil, align 8, !dbg !511, !tbaa !122
  store i64 %6, i64* %arrayidx.epil, align 8, !dbg !511, !tbaa !122
  store i64 %5, i64* %arrayidx1.epil, align 8, !dbg !511, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %i.019.unr, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !500
  br label %for.cond.for.end_crit_edge, !dbg !516

for.cond.for.end_crit_edge:                       ; preds = %for.cond.for.end_crit_edge.unr-lcssa, %for.body.epil
  %add.i.lcssa = phi i64 [ %add.i.lcssa.ph, %for.cond.for.end_crit_edge.unr-lcssa ], [ %add.i.epil, %for.body.epil ], !dbg !509
  store i64 %add.i.lcssa, i64* @rand_nxt, align 8, !dbg !516, !tbaa !122
  br label %for.end, !dbg !502

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret void, !dbg !517
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @fill_array(i64* nocapture noundef %arr, i64 noundef %size) local_unnamed_addr #10 !dbg !518 {
entry:
  call void @llvm.dbg.value(metadata i64* %arr, metadata !520, metadata !DIExpression()), !dbg !523
  call void @llvm.dbg.value(metadata i64 %size, metadata !521, metadata !DIExpression()), !dbg !523
  call void @llvm.dbg.value(metadata i64 1, metadata !524, metadata !DIExpression()), !dbg !529
  store i64 1, i64* @rand_nxt, align 8, !dbg !531, !tbaa !122
  call void @llvm.dbg.value(metadata i64 0, metadata !522, metadata !DIExpression()), !dbg !523
  %cmp7.not = icmp eq i64 %size, 0, !dbg !532
  br i1 %cmp7.not, label %scramble_array.exit, label %for.body.preheader, !dbg !535

for.body.preheader:                               ; preds = %entry
  %min.iters.check = icmp ult i64 %size, 4, !dbg !535
  br i1 %min.iters.check, label %for.body.preheader10, label %vector.ph, !dbg !535

vector.ph:                                        ; preds = %for.body.preheader
  %n.vec = and i64 %size, -4, !dbg !535
  %0 = add i64 %n.vec, -4, !dbg !535
  %1 = lshr exact i64 %0, 2, !dbg !535
  %2 = add nuw nsw i64 %1, 1, !dbg !535
  %xtraiter = and i64 %2, 3, !dbg !535
  %3 = icmp ult i64 %0, 12, !dbg !535
  br i1 %3, label %middle.block.unr-lcssa, label %vector.ph.new, !dbg !535

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter = and i64 %2, 9223372036854775804, !dbg !535
  br label %vector.body, !dbg !535

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.3, %vector.body ], !dbg !536
  %vec.ind = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph.new ], [ %vec.ind.next.3, %vector.body ]
  %niter = phi i64 [ 0, %vector.ph.new ], [ %niter.next.3, %vector.body ]
  %step.add = add <2 x i64> %vec.ind, <i64 2, i64 2>
  %4 = getelementptr inbounds i64, i64* %arr, i64 %index, !dbg !536
  %5 = bitcast i64* %4 to <2 x i64>*, !dbg !537
  store <2 x i64> %vec.ind, <2 x i64>* %5, align 8, !dbg !537, !tbaa !122
  %6 = getelementptr inbounds i64, i64* %4, i64 2, !dbg !537
  %7 = bitcast i64* %6 to <2 x i64>*, !dbg !537
  store <2 x i64> %step.add, <2 x i64>* %7, align 8, !dbg !537, !tbaa !122
  %index.next = or i64 %index, 4, !dbg !536
  %vec.ind.next = add <2 x i64> %vec.ind, <i64 4, i64 4>
  %step.add.1 = add <2 x i64> %vec.ind, <i64 6, i64 6>
  %8 = getelementptr inbounds i64, i64* %arr, i64 %index.next, !dbg !536
  %9 = bitcast i64* %8 to <2 x i64>*, !dbg !537
  store <2 x i64> %vec.ind.next, <2 x i64>* %9, align 8, !dbg !537, !tbaa !122
  %10 = getelementptr inbounds i64, i64* %8, i64 2, !dbg !537
  %11 = bitcast i64* %10 to <2 x i64>*, !dbg !537
  store <2 x i64> %step.add.1, <2 x i64>* %11, align 8, !dbg !537, !tbaa !122
  %index.next.1 = or i64 %index, 8, !dbg !536
  %vec.ind.next.1 = add <2 x i64> %vec.ind, <i64 8, i64 8>
  %step.add.2 = add <2 x i64> %vec.ind, <i64 10, i64 10>
  %12 = getelementptr inbounds i64, i64* %arr, i64 %index.next.1, !dbg !536
  %13 = bitcast i64* %12 to <2 x i64>*, !dbg !537
  store <2 x i64> %vec.ind.next.1, <2 x i64>* %13, align 8, !dbg !537, !tbaa !122
  %14 = getelementptr inbounds i64, i64* %12, i64 2, !dbg !537
  %15 = bitcast i64* %14 to <2 x i64>*, !dbg !537
  store <2 x i64> %step.add.2, <2 x i64>* %15, align 8, !dbg !537, !tbaa !122
  %index.next.2 = or i64 %index, 12, !dbg !536
  %vec.ind.next.2 = add <2 x i64> %vec.ind, <i64 12, i64 12>
  %step.add.3 = add <2 x i64> %vec.ind, <i64 14, i64 14>
  %16 = getelementptr inbounds i64, i64* %arr, i64 %index.next.2, !dbg !536
  %17 = bitcast i64* %16 to <2 x i64>*, !dbg !537
  store <2 x i64> %vec.ind.next.2, <2 x i64>* %17, align 8, !dbg !537, !tbaa !122
  %18 = getelementptr inbounds i64, i64* %16, i64 2, !dbg !537
  %19 = bitcast i64* %18 to <2 x i64>*, !dbg !537
  store <2 x i64> %step.add.3, <2 x i64>* %19, align 8, !dbg !537, !tbaa !122
  %index.next.3 = add nuw i64 %index, 16, !dbg !536
  %vec.ind.next.3 = add <2 x i64> %vec.ind, <i64 16, i64 16>
  %niter.next.3 = add nuw i64 %niter, 4, !dbg !536
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter, !dbg !536
  br i1 %niter.ncmp.3, label %middle.block.unr-lcssa, label %vector.body, !dbg !536, !llvm.loop !539

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  %vec.ind.unr = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph ], [ %vec.ind.next.3, %vector.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !536
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil, !dbg !536

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %index.epil = phi i64 [ %index.next.epil, %vector.body.epil ], [ %index.unr, %middle.block.unr-lcssa ], !dbg !536
  %vec.ind.epil = phi <2 x i64> [ %vec.ind.next.epil, %vector.body.epil ], [ %vec.ind.unr, %middle.block.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %vector.body.epil ], [ 0, %middle.block.unr-lcssa ]
  %step.add.epil = add <2 x i64> %vec.ind.epil, <i64 2, i64 2>
  %20 = getelementptr inbounds i64, i64* %arr, i64 %index.epil, !dbg !536
  %21 = bitcast i64* %20 to <2 x i64>*, !dbg !537
  store <2 x i64> %vec.ind.epil, <2 x i64>* %21, align 8, !dbg !537, !tbaa !122
  %22 = getelementptr inbounds i64, i64* %20, i64 2, !dbg !537
  %23 = bitcast i64* %22 to <2 x i64>*, !dbg !537
  store <2 x i64> %step.add.epil, <2 x i64>* %23, align 8, !dbg !537, !tbaa !122
  %index.next.epil = add nuw i64 %index.epil, 4, !dbg !536
  %vec.ind.next.epil = add <2 x i64> %vec.ind.epil, <i64 4, i64 4>
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !536
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !536
  br i1 %epil.iter.cmp.not, label %middle.block, label %vector.body.epil, !dbg !536, !llvm.loop !542

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %n.vec, %size, !dbg !535
  br i1 %cmp.n, label %for.body.i.preheader, label %for.body.preheader10, !dbg !535

for.body.preheader10:                             ; preds = %for.body.preheader, %middle.block
  %i.08.ph = phi i64 [ 0, %for.body.preheader ], [ %n.vec, %middle.block ]
  br label %for.body, !dbg !535

for.body:                                         ; preds = %for.body.preheader10, %for.body
  %i.08 = phi i64 [ %inc, %for.body ], [ %i.08.ph, %for.body.preheader10 ]
  call void @llvm.dbg.value(metadata i64 %i.08, metadata !522, metadata !DIExpression()), !dbg !523
  %arrayidx = getelementptr inbounds i64, i64* %arr, i64 %i.08, !dbg !544
  store i64 %i.08, i64* %arrayidx, align 8, !dbg !537, !tbaa !122
  %inc = add nuw i64 %i.08, 1, !dbg !536
  call void @llvm.dbg.value(metadata i64 %inc, metadata !522, metadata !DIExpression()), !dbg !523
  %exitcond.not = icmp eq i64 %inc, %size, !dbg !532
  br i1 %exitcond.not, label %for.body.i.preheader, label %for.body, !dbg !535, !llvm.loop !545

for.body.i.preheader:                             ; preds = %middle.block, %for.body
  call void @llvm.dbg.value(metadata i64* %arr, metadata !491, metadata !DIExpression()), !dbg !547
  call void @llvm.dbg.value(metadata i64 %size, metadata !492, metadata !DIExpression()), !dbg !547
  call void @llvm.dbg.value(metadata i64 0, metadata !493, metadata !DIExpression()), !dbg !547
  %xtraiter11 = and i64 %size, 1, !dbg !549
  %24 = icmp eq i64 %size, 1, !dbg !549
  br i1 %24, label %for.cond.for.end_crit_edge.i.unr-lcssa, label %for.body.i.preheader.new, !dbg !549

for.body.i.preheader.new:                         ; preds = %for.body.i.preheader
  %unroll_iter15 = and i64 %size, -2, !dbg !549
  br label %for.body.i, !dbg !549

for.body.i:                                       ; preds = %for.body.i, %for.body.i.preheader.new
  %i.019.i = phi i64 [ 0, %for.body.i.preheader.new ], [ %inc.i.1, %for.body.i ]
  %add.i1618.i = phi i64 [ 1, %for.body.i.preheader.new ], [ %add.i.i.1, %for.body.i ]
  %niter16 = phi i64 [ 0, %for.body.i.preheader.new ], [ %niter16.next.1, %for.body.i ]
  call void @llvm.dbg.value(metadata i64 %i.019.i, metadata !493, metadata !DIExpression()), !dbg !547
  %mul.i.i = mul i64 %add.i1618.i, 1103515245, !dbg !550
  %add.i.i = add i64 %mul.i.i, 12345, !dbg !552
  call void @llvm.dbg.value(metadata i64 %add.i.i, metadata !494, metadata !DIExpression()), !dbg !547
  %rem.i = urem i64 %add.i.i, %size, !dbg !553
  call void @llvm.dbg.value(metadata i64 %rem.i, metadata !494, metadata !DIExpression()), !dbg !547
  %arrayidx.i = getelementptr inbounds i64, i64* %arr, i64 %i.019.i, !dbg !554
  %25 = load i64, i64* %arrayidx.i, align 8, !dbg !554, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %25, metadata !495, metadata !DIExpression()), !dbg !555
  %arrayidx1.i = getelementptr inbounds i64, i64* %arr, i64 %rem.i, !dbg !554
  %26 = load i64, i64* %arrayidx1.i, align 8, !dbg !554, !tbaa !122
  store i64 %26, i64* %arrayidx.i, align 8, !dbg !554, !tbaa !122
  store i64 %25, i64* %arrayidx1.i, align 8, !dbg !554, !tbaa !122
  %inc.i = or i64 %i.019.i, 1, !dbg !556
  call void @llvm.dbg.value(metadata i64 %inc.i, metadata !493, metadata !DIExpression()), !dbg !547
  call void @llvm.dbg.value(metadata i64 %inc.i, metadata !493, metadata !DIExpression()), !dbg !547
  %mul.i.i.1 = mul i64 %add.i.i, 1103515245, !dbg !550
  %add.i.i.1 = add i64 %mul.i.i.1, 12345, !dbg !552
  call void @llvm.dbg.value(metadata i64 %add.i.i.1, metadata !494, metadata !DIExpression()), !dbg !547
  %rem.i.1 = urem i64 %add.i.i.1, %size, !dbg !553
  call void @llvm.dbg.value(metadata i64 %rem.i.1, metadata !494, metadata !DIExpression()), !dbg !547
  %arrayidx.i.1 = getelementptr inbounds i64, i64* %arr, i64 %inc.i, !dbg !554
  %27 = load i64, i64* %arrayidx.i.1, align 8, !dbg !554, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %27, metadata !495, metadata !DIExpression()), !dbg !555
  %arrayidx1.i.1 = getelementptr inbounds i64, i64* %arr, i64 %rem.i.1, !dbg !554
  %28 = load i64, i64* %arrayidx1.i.1, align 8, !dbg !554, !tbaa !122
  store i64 %28, i64* %arrayidx.i.1, align 8, !dbg !554, !tbaa !122
  store i64 %27, i64* %arrayidx1.i.1, align 8, !dbg !554, !tbaa !122
  %inc.i.1 = add nuw i64 %i.019.i, 2, !dbg !556
  call void @llvm.dbg.value(metadata i64 %inc.i.1, metadata !493, metadata !DIExpression()), !dbg !547
  %niter16.next.1 = add i64 %niter16, 2, !dbg !549
  %niter16.ncmp.1 = icmp eq i64 %niter16.next.1, %unroll_iter15, !dbg !549
  br i1 %niter16.ncmp.1, label %for.cond.for.end_crit_edge.i.unr-lcssa.loopexit, label %for.body.i, !dbg !549, !llvm.loop !557

for.cond.for.end_crit_edge.i.unr-lcssa.loopexit:  ; preds = %for.body.i
  %phi.bo = mul i64 %add.i.i.1, 1103515245, !dbg !549
  %phi.bo17 = add i64 %phi.bo, 12345, !dbg !549
  br label %for.cond.for.end_crit_edge.i.unr-lcssa, !dbg !549

for.cond.for.end_crit_edge.i.unr-lcssa:           ; preds = %for.cond.for.end_crit_edge.i.unr-lcssa.loopexit, %for.body.i.preheader
  %add.i.i.lcssa.ph = phi i64 [ undef, %for.body.i.preheader ], [ %add.i.i.1, %for.cond.for.end_crit_edge.i.unr-lcssa.loopexit ]
  %i.019.i.unr = phi i64 [ 0, %for.body.i.preheader ], [ %inc.i.1, %for.cond.for.end_crit_edge.i.unr-lcssa.loopexit ]
  %add.i1618.i.unr = phi i64 [ 1103527590, %for.body.i.preheader ], [ %phi.bo17, %for.cond.for.end_crit_edge.i.unr-lcssa.loopexit ]
  %lcmp.mod13.not = icmp eq i64 %xtraiter11, 0, !dbg !549
  br i1 %lcmp.mod13.not, label %for.cond.for.end_crit_edge.i, label %for.body.i.epil, !dbg !549

for.body.i.epil:                                  ; preds = %for.cond.for.end_crit_edge.i.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %i.019.i.unr, metadata !493, metadata !DIExpression()), !dbg !547
  call void @llvm.dbg.value(metadata i64 %add.i1618.i.unr, metadata !494, metadata !DIExpression()), !dbg !547
  %rem.i.epil = urem i64 %add.i1618.i.unr, %size, !dbg !553
  call void @llvm.dbg.value(metadata i64 %rem.i.epil, metadata !494, metadata !DIExpression()), !dbg !547
  %arrayidx.i.epil = getelementptr inbounds i64, i64* %arr, i64 %i.019.i.unr, !dbg !554
  %29 = load i64, i64* %arrayidx.i.epil, align 8, !dbg !554, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %29, metadata !495, metadata !DIExpression()), !dbg !555
  %arrayidx1.i.epil = getelementptr inbounds i64, i64* %arr, i64 %rem.i.epil, !dbg !554
  %30 = load i64, i64* %arrayidx1.i.epil, align 8, !dbg !554, !tbaa !122
  store i64 %30, i64* %arrayidx.i.epil, align 8, !dbg !554, !tbaa !122
  store i64 %29, i64* %arrayidx1.i.epil, align 8, !dbg !554, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %i.019.i.unr, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !547
  br label %for.cond.for.end_crit_edge.i, !dbg !559

for.cond.for.end_crit_edge.i:                     ; preds = %for.cond.for.end_crit_edge.i.unr-lcssa, %for.body.i.epil
  %add.i.i.lcssa = phi i64 [ %add.i.i.lcssa.ph, %for.cond.for.end_crit_edge.i.unr-lcssa ], [ %add.i1618.i.unr, %for.body.i.epil ], !dbg !552
  store i64 %add.i.i.lcssa, i64* @rand_nxt, align 8, !dbg !559, !tbaa !122
  br label %scramble_array.exit, !dbg !549

scramble_array.exit:                              ; preds = %entry, %for.cond.for.end_crit_edge.i
  ret void, !dbg !560
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @usage() local_unnamed_addr #11 !dbg !561 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !564, !tbaa !565
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0), i64 68, i64 1, %struct._IO_FILE* %0) #20, !dbg !567
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !568, !tbaa !565
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.1, i64 0, i64 0), i64 68, i64 1, %struct._IO_FILE* %2) #20, !dbg !569
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !570, !tbaa !565
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.2, i64 0, i64 0), i64 69, i64 1, %struct._IO_FILE* %4) #20, !dbg !571
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !572, !tbaa !565
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.3, i64 0, i64 0), i64 69, i64 1, %struct._IO_FILE* %6) #20, !dbg !573
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !574, !tbaa !565
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.4, i64 0, i64 0), i64 70, i64 1, %struct._IO_FILE* %8) #20, !dbg !575
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !576, !tbaa !565
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %10) #20, !dbg !577
  ret i32 -1, !dbg !578
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #12

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** noundef %argv) local_unnamed_addr #13 !dbg !579 {
entry:
  %size = alloca i64, align 8
  %round = alloca i32, align 4
  %benchmark = alloca i32, align 4
  %help = alloca i32, align 4
  %check = alloca i32, align 4
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !585, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i8** %argv, metadata !586, metadata !DIExpression()), !dbg !603
  %0 = bitcast i64* %size to i8*, !dbg !604
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %0) #19, !dbg !604
  %1 = bitcast i32* %round to i8*, !dbg !605
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #19, !dbg !605
  %2 = bitcast i32* %benchmark to i8*, !dbg !606
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #19, !dbg !606
  %3 = bitcast i32* %help to i8*, !dbg !606
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #19, !dbg !606
  %4 = bitcast i32* %check to i8*, !dbg !606
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #19, !dbg !606
  call void @llvm.dbg.value(metadata i32 1, metadata !591, metadata !DIExpression()), !dbg !603
  store i32 1, i32* %round, align 4, !dbg !607, !tbaa !608
  call void @llvm.dbg.value(metadata i32 0, metadata !595, metadata !DIExpression()), !dbg !603
  store i32 0, i32* %check, align 4, !dbg !610, !tbaa !608
  call void @llvm.dbg.value(metadata i64 3000000, metadata !587, metadata !DIExpression()), !dbg !603
  store i64 3000000, i64* %size, align 8, !dbg !611, !tbaa !122
  call void @llvm.dbg.value(metadata i64* %size, metadata !587, metadata !DIExpression(DW_OP_deref)), !dbg !603
  call void @llvm.dbg.value(metadata i32* %round, metadata !591, metadata !DIExpression(DW_OP_deref)), !dbg !603
  call void @llvm.dbg.value(metadata i32* %benchmark, metadata !593, metadata !DIExpression(DW_OP_deref)), !dbg !603
  call void @llvm.dbg.value(metadata i32* %help, metadata !594, metadata !DIExpression(DW_OP_deref)), !dbg !603
  call void @llvm.dbg.value(metadata i32* %check, metadata !595, metadata !DIExpression(DW_OP_deref)), !dbg !603
  call void (i32, i8**, i8**, i32*, ...) @get_options(i32 noundef %argc, i8** noundef %argv, i8** noundef getelementptr inbounds ([6 x i8*], [6 x i8*]* @specifiers, i64 0, i64 0), i32* noundef getelementptr inbounds ([6 x i32], [6 x i32]* @opt_types, i64 0, i64 0), i64* noundef nonnull %size, i32* noundef nonnull %check, i32* noundef nonnull %benchmark, i32* noundef nonnull %help, i32* noundef nonnull %round) #19, !dbg !612
  %5 = load i32, i32* %help, align 4, !dbg !613, !tbaa !608
  call void @llvm.dbg.value(metadata i32 %5, metadata !594, metadata !DIExpression()), !dbg !603
  %tobool.not = icmp eq i32 %5, 0, !dbg !613
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !615

if.then:                                          ; preds = %entry
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !616, !tbaa !565
  %7 = call i64 @fwrite(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str, i64 0, i64 0), i64 68, i64 1, %struct._IO_FILE* %6) #21, !dbg !618
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !619, !tbaa !565
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([69 x i8], [69 x i8]* @.str.1, i64 0, i64 0), i64 68, i64 1, %struct._IO_FILE* %8) #21, !dbg !620
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !621, !tbaa !565
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.2, i64 0, i64 0), i64 69, i64 1, %struct._IO_FILE* %10) #21, !dbg !622
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !623, !tbaa !565
  %13 = call i64 @fwrite(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.3, i64 0, i64 0), i64 69, i64 1, %struct._IO_FILE* %12) #21, !dbg !624
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !625, !tbaa !565
  %15 = call i64 @fwrite(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.4, i64 0, i64 0), i64 70, i64 1, %struct._IO_FILE* %14) #21, !dbg !626
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !627, !tbaa !565
  %17 = call i64 @fwrite(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i64 0, i64 0), i64 37, i64 1, %struct._IO_FILE* %16) #21, !dbg !628
  br label %cleanup, !dbg !629

if.end:                                           ; preds = %entry
  %18 = load i32, i32* %benchmark, align 4, !dbg !630, !tbaa !608
  call void @llvm.dbg.value(metadata i32 %18, metadata !593, metadata !DIExpression()), !dbg !603
  switch i32 %18, label %if.end5 [
    i32 3, label %sw.bb4
    i32 1, label %sw.bb
    i32 2, label %sw.bb3
  ], !dbg !632

sw.bb:                                            ; preds = %if.end
  call void @llvm.dbg.value(metadata i64 10000, metadata !587, metadata !DIExpression()), !dbg !603
  store i64 10000, i64* %size, align 8, !dbg !633, !tbaa !122
  br label %if.end5, !dbg !636

sw.bb3:                                           ; preds = %if.end
  call void @llvm.dbg.value(metadata i64 3000000, metadata !587, metadata !DIExpression()), !dbg !603
  store i64 3000000, i64* %size, align 8, !dbg !637, !tbaa !122
  br label %if.end5, !dbg !638

sw.bb4:                                           ; preds = %if.end
  call void @llvm.dbg.value(metadata i64 4100000, metadata !587, metadata !DIExpression()), !dbg !603
  store i64 4100000, i64* %size, align 8, !dbg !639, !tbaa !122
  br label %if.end5, !dbg !640

if.end5:                                          ; preds = %if.end, %sw.bb, %sw.bb3, %sw.bb4
  call void @startup_cilk(), !dbg !641
  call void @llvm.dbg.value(metadata i32 0, metadata !596, metadata !DIExpression()), !dbg !642
  %19 = load i32, i32* %round, align 4, !dbg !643, !tbaa !608
  call void @llvm.dbg.value(metadata i32 %19, metadata !591, metadata !DIExpression()), !dbg !603
  %cmp66 = icmp sgt i32 %19, 0, !dbg !644
  br i1 %cmp66, label %for.body.lr.ph, label %cleanup, !dbg !645

for.body.lr.ph:                                   ; preds = %if.end5
  %20 = bitcast %struct.timeval* %t1 to i8*
  %21 = bitcast %struct.timeval* %t2 to i8*
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1
  %tv_sec.i59 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0
  %tv_usec.i61 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1
  br label %for.body, !dbg !645

for.body:                                         ; preds = %for.body.lr.ph, %if.end31
  %r.067 = phi i32 [ 0, %for.body.lr.ph ], [ %inc35, %if.end31 ]
  call void @llvm.dbg.value(metadata i32 %r.067, metadata !596, metadata !DIExpression()), !dbg !642
  %22 = load i64, i64* %size, align 8, !dbg !646, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %22, metadata !587, metadata !DIExpression()), !dbg !603
  %mul = shl i64 %22, 3, !dbg !647
  %call6 = call noalias i8* @malloc(i64 noundef %mul) #19, !dbg !648
  %23 = bitcast i8* %call6 to i64*, !dbg !649
  call void @llvm.dbg.value(metadata i64* %23, metadata !588, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %22, metadata !587, metadata !DIExpression()), !dbg !603
  %call8 = call noalias i8* @malloc(i64 noundef %mul) #19, !dbg !650
  %24 = bitcast i8* %call8 to i64*, !dbg !651
  call void @llvm.dbg.value(metadata i64* %24, metadata !589, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %22, metadata !587, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64* %23, metadata !520, metadata !DIExpression()), !dbg !652
  call void @llvm.dbg.value(metadata i64 %22, metadata !521, metadata !DIExpression()), !dbg !652
  call void @llvm.dbg.value(metadata i64 1, metadata !524, metadata !DIExpression()), !dbg !654
  store i64 1, i64* @rand_nxt, align 8, !dbg !656, !tbaa !122
  call void @llvm.dbg.value(metadata i64 0, metadata !522, metadata !DIExpression()), !dbg !652
  %cmp7.not.i = icmp eq i64 %22, 0, !dbg !657
  br i1 %cmp7.not.i, label %fill_array.exit, label %for.body.i.preheader, !dbg !658

for.body.i.preheader:                             ; preds = %for.body
  %min.iters.check = icmp ult i64 %22, 4, !dbg !658
  br i1 %min.iters.check, label %for.body.i.preheader71, label %vector.ph, !dbg !658

vector.ph:                                        ; preds = %for.body.i.preheader
  %n.vec = and i64 %22, -4, !dbg !658
  %25 = add i64 %n.vec, -4, !dbg !658
  %26 = lshr exact i64 %25, 2, !dbg !658
  %27 = add nuw nsw i64 %26, 1, !dbg !658
  %xtraiter = and i64 %27, 3, !dbg !658
  %28 = icmp ult i64 %25, 12, !dbg !658
  br i1 %28, label %middle.block.unr-lcssa, label %vector.ph.new, !dbg !658

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter = and i64 %27, 9223372036854775804, !dbg !658
  br label %vector.body, !dbg !658

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.3, %vector.body ], !dbg !659
  %vec.ind = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph.new ], [ %vec.ind.next.3, %vector.body ]
  %niter = phi i64 [ 0, %vector.ph.new ], [ %niter.next.3, %vector.body ]
  %step.add = add <2 x i64> %vec.ind, <i64 2, i64 2>
  %29 = getelementptr inbounds i64, i64* %23, i64 %index, !dbg !659
  %30 = bitcast i64* %29 to <2 x i64>*, !dbg !660
  store <2 x i64> %vec.ind, <2 x i64>* %30, align 8, !dbg !660, !tbaa !122
  %31 = getelementptr inbounds i64, i64* %29, i64 2, !dbg !660
  %32 = bitcast i64* %31 to <2 x i64>*, !dbg !660
  store <2 x i64> %step.add, <2 x i64>* %32, align 8, !dbg !660, !tbaa !122
  %index.next = or i64 %index, 4, !dbg !659
  %vec.ind.next = add <2 x i64> %vec.ind, <i64 4, i64 4>
  %step.add.1 = add <2 x i64> %vec.ind, <i64 6, i64 6>
  %33 = getelementptr inbounds i64, i64* %23, i64 %index.next, !dbg !659
  %34 = bitcast i64* %33 to <2 x i64>*, !dbg !660
  store <2 x i64> %vec.ind.next, <2 x i64>* %34, align 8, !dbg !660, !tbaa !122
  %35 = getelementptr inbounds i64, i64* %33, i64 2, !dbg !660
  %36 = bitcast i64* %35 to <2 x i64>*, !dbg !660
  store <2 x i64> %step.add.1, <2 x i64>* %36, align 8, !dbg !660, !tbaa !122
  %index.next.1 = or i64 %index, 8, !dbg !659
  %vec.ind.next.1 = add <2 x i64> %vec.ind, <i64 8, i64 8>
  %step.add.2 = add <2 x i64> %vec.ind, <i64 10, i64 10>
  %37 = getelementptr inbounds i64, i64* %23, i64 %index.next.1, !dbg !659
  %38 = bitcast i64* %37 to <2 x i64>*, !dbg !660
  store <2 x i64> %vec.ind.next.1, <2 x i64>* %38, align 8, !dbg !660, !tbaa !122
  %39 = getelementptr inbounds i64, i64* %37, i64 2, !dbg !660
  %40 = bitcast i64* %39 to <2 x i64>*, !dbg !660
  store <2 x i64> %step.add.2, <2 x i64>* %40, align 8, !dbg !660, !tbaa !122
  %index.next.2 = or i64 %index, 12, !dbg !659
  %vec.ind.next.2 = add <2 x i64> %vec.ind, <i64 12, i64 12>
  %step.add.3 = add <2 x i64> %vec.ind, <i64 14, i64 14>
  %41 = getelementptr inbounds i64, i64* %23, i64 %index.next.2, !dbg !659
  %42 = bitcast i64* %41 to <2 x i64>*, !dbg !660
  store <2 x i64> %vec.ind.next.2, <2 x i64>* %42, align 8, !dbg !660, !tbaa !122
  %43 = getelementptr inbounds i64, i64* %41, i64 2, !dbg !660
  %44 = bitcast i64* %43 to <2 x i64>*, !dbg !660
  store <2 x i64> %step.add.3, <2 x i64>* %44, align 8, !dbg !660, !tbaa !122
  %index.next.3 = add nuw i64 %index, 16, !dbg !659
  %vec.ind.next.3 = add <2 x i64> %vec.ind, <i64 16, i64 16>
  %niter.next.3 = add nuw i64 %niter, 4, !dbg !659
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter, !dbg !659
  br i1 %niter.ncmp.3, label %middle.block.unr-lcssa, label %vector.body, !dbg !659, !llvm.loop !661

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  %vec.ind.unr = phi <2 x i64> [ <i64 0, i64 1>, %vector.ph ], [ %vec.ind.next.3, %vector.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !659
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil, !dbg !659

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %index.epil = phi i64 [ %index.next.epil, %vector.body.epil ], [ %index.unr, %middle.block.unr-lcssa ], !dbg !659
  %vec.ind.epil = phi <2 x i64> [ %vec.ind.next.epil, %vector.body.epil ], [ %vec.ind.unr, %middle.block.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %vector.body.epil ], [ 0, %middle.block.unr-lcssa ]
  %step.add.epil = add <2 x i64> %vec.ind.epil, <i64 2, i64 2>
  %45 = getelementptr inbounds i64, i64* %23, i64 %index.epil, !dbg !659
  %46 = bitcast i64* %45 to <2 x i64>*, !dbg !660
  store <2 x i64> %vec.ind.epil, <2 x i64>* %46, align 8, !dbg !660, !tbaa !122
  %47 = getelementptr inbounds i64, i64* %45, i64 2, !dbg !660
  %48 = bitcast i64* %47 to <2 x i64>*, !dbg !660
  store <2 x i64> %step.add.epil, <2 x i64>* %48, align 8, !dbg !660, !tbaa !122
  %index.next.epil = add nuw i64 %index.epil, 4, !dbg !659
  %vec.ind.next.epil = add <2 x i64> %vec.ind.epil, <i64 4, i64 4>
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !659
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !659
  br i1 %epil.iter.cmp.not, label %middle.block, label %vector.body.epil, !dbg !659, !llvm.loop !663

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %22, %n.vec, !dbg !658
  br i1 %cmp.n, label %for.body.i.i.preheader, label %for.body.i.preheader71, !dbg !658

for.body.i.preheader71:                           ; preds = %for.body.i.preheader, %middle.block
  %i.08.i.ph = phi i64 [ 0, %for.body.i.preheader ], [ %n.vec, %middle.block ]
  br label %for.body.i, !dbg !658

for.body.i:                                       ; preds = %for.body.i.preheader71, %for.body.i
  %i.08.i = phi i64 [ %inc.i, %for.body.i ], [ %i.08.i.ph, %for.body.i.preheader71 ]
  call void @llvm.dbg.value(metadata i64 %i.08.i, metadata !522, metadata !DIExpression()), !dbg !652
  %arrayidx.i = getelementptr inbounds i64, i64* %23, i64 %i.08.i, !dbg !664
  store i64 %i.08.i, i64* %arrayidx.i, align 8, !dbg !660, !tbaa !122
  %inc.i = add nuw i64 %i.08.i, 1, !dbg !659
  call void @llvm.dbg.value(metadata i64 %inc.i, metadata !522, metadata !DIExpression()), !dbg !652
  %exitcond.not.i = icmp eq i64 %inc.i, %22, !dbg !657
  br i1 %exitcond.not.i, label %for.body.i.i.preheader, label %for.body.i, !dbg !658, !llvm.loop !665

for.body.i.i.preheader:                           ; preds = %for.body.i, %middle.block
  %xtraiter72 = and i64 %22, 1, !dbg !666
  %49 = icmp eq i64 %22, 1, !dbg !666
  br i1 %49, label %for.cond.for.end_crit_edge.i.i.unr-lcssa, label %for.body.i.i.preheader.new, !dbg !666

for.body.i.i.preheader.new:                       ; preds = %for.body.i.i.preheader
  %unroll_iter76 = and i64 %22, -2, !dbg !666
  br label %for.body.i.i, !dbg !666

for.body.i.i:                                     ; preds = %for.body.i.i, %for.body.i.i.preheader.new
  %i.019.i.i = phi i64 [ 0, %for.body.i.i.preheader.new ], [ %inc.i.i.1, %for.body.i.i ]
  %add.i1618.i.i = phi i64 [ 1, %for.body.i.i.preheader.new ], [ %add.i.i.i.1, %for.body.i.i ]
  %niter77 = phi i64 [ 0, %for.body.i.i.preheader.new ], [ %niter77.next.1, %for.body.i.i ]
  call void @llvm.dbg.value(metadata i64 %i.019.i.i, metadata !493, metadata !DIExpression()), !dbg !668
  %mul.i.i.i = mul i64 %add.i1618.i.i, 1103515245, !dbg !669
  %add.i.i.i = add i64 %mul.i.i.i, 12345, !dbg !671
  call void @llvm.dbg.value(metadata i64 %add.i.i.i, metadata !494, metadata !DIExpression()), !dbg !668
  %rem.i.i = urem i64 %add.i.i.i, %22, !dbg !672
  call void @llvm.dbg.value(metadata i64 %rem.i.i, metadata !494, metadata !DIExpression()), !dbg !668
  %arrayidx.i.i = getelementptr inbounds i64, i64* %23, i64 %i.019.i.i, !dbg !673
  %50 = load i64, i64* %arrayidx.i.i, align 8, !dbg !673, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %50, metadata !495, metadata !DIExpression()), !dbg !674
  %arrayidx1.i.i = getelementptr inbounds i64, i64* %23, i64 %rem.i.i, !dbg !673
  %51 = load i64, i64* %arrayidx1.i.i, align 8, !dbg !673, !tbaa !122
  store i64 %51, i64* %arrayidx.i.i, align 8, !dbg !673, !tbaa !122
  store i64 %50, i64* %arrayidx1.i.i, align 8, !dbg !673, !tbaa !122
  %inc.i.i = or i64 %i.019.i.i, 1, !dbg !675
  call void @llvm.dbg.value(metadata i64 %inc.i.i, metadata !493, metadata !DIExpression()), !dbg !668
  call void @llvm.dbg.value(metadata i64 %inc.i.i, metadata !493, metadata !DIExpression()), !dbg !668
  %mul.i.i.i.1 = mul i64 %add.i.i.i, 1103515245, !dbg !669
  %add.i.i.i.1 = add i64 %mul.i.i.i.1, 12345, !dbg !671
  call void @llvm.dbg.value(metadata i64 %add.i.i.i.1, metadata !494, metadata !DIExpression()), !dbg !668
  %rem.i.i.1 = urem i64 %add.i.i.i.1, %22, !dbg !672
  call void @llvm.dbg.value(metadata i64 %rem.i.i.1, metadata !494, metadata !DIExpression()), !dbg !668
  %arrayidx.i.i.1 = getelementptr inbounds i64, i64* %23, i64 %inc.i.i, !dbg !673
  %52 = load i64, i64* %arrayidx.i.i.1, align 8, !dbg !673, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %52, metadata !495, metadata !DIExpression()), !dbg !674
  %arrayidx1.i.i.1 = getelementptr inbounds i64, i64* %23, i64 %rem.i.i.1, !dbg !673
  %53 = load i64, i64* %arrayidx1.i.i.1, align 8, !dbg !673, !tbaa !122
  store i64 %53, i64* %arrayidx.i.i.1, align 8, !dbg !673, !tbaa !122
  store i64 %52, i64* %arrayidx1.i.i.1, align 8, !dbg !673, !tbaa !122
  %inc.i.i.1 = add nuw i64 %i.019.i.i, 2, !dbg !675
  call void @llvm.dbg.value(metadata i64 %inc.i.i.1, metadata !493, metadata !DIExpression()), !dbg !668
  %niter77.next.1 = add i64 %niter77, 2, !dbg !666
  %niter77.ncmp.1 = icmp eq i64 %niter77.next.1, %unroll_iter76, !dbg !666
  br i1 %niter77.ncmp.1, label %for.cond.for.end_crit_edge.i.i.unr-lcssa, label %for.body.i.i, !dbg !666, !llvm.loop !676

for.cond.for.end_crit_edge.i.i.unr-lcssa:         ; preds = %for.body.i.i, %for.body.i.i.preheader
  %add.i.i.i.lcssa.ph = phi i64 [ undef, %for.body.i.i.preheader ], [ %add.i.i.i.1, %for.body.i.i ]
  %i.019.i.i.unr = phi i64 [ 0, %for.body.i.i.preheader ], [ %inc.i.i.1, %for.body.i.i ]
  %add.i1618.i.i.unr = phi i64 [ 1, %for.body.i.i.preheader ], [ %add.i.i.i.1, %for.body.i.i ]
  %lcmp.mod74.not = icmp eq i64 %xtraiter72, 0, !dbg !666
  br i1 %lcmp.mod74.not, label %for.cond.for.end_crit_edge.i.i, label %for.body.i.i.epil, !dbg !666

for.body.i.i.epil:                                ; preds = %for.cond.for.end_crit_edge.i.i.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %i.019.i.i.unr, metadata !493, metadata !DIExpression()), !dbg !668
  %mul.i.i.i.epil = mul i64 %add.i1618.i.i.unr, 1103515245, !dbg !669
  %add.i.i.i.epil = add i64 %mul.i.i.i.epil, 12345, !dbg !671
  call void @llvm.dbg.value(metadata i64 %add.i.i.i.epil, metadata !494, metadata !DIExpression()), !dbg !668
  %rem.i.i.epil = urem i64 %add.i.i.i.epil, %22, !dbg !672
  call void @llvm.dbg.value(metadata i64 %rem.i.i.epil, metadata !494, metadata !DIExpression()), !dbg !668
  %arrayidx.i.i.epil = getelementptr inbounds i64, i64* %23, i64 %i.019.i.i.unr, !dbg !673
  %54 = load i64, i64* %arrayidx.i.i.epil, align 8, !dbg !673, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %54, metadata !495, metadata !DIExpression()), !dbg !674
  %arrayidx1.i.i.epil = getelementptr inbounds i64, i64* %23, i64 %rem.i.i.epil, !dbg !673
  %55 = load i64, i64* %arrayidx1.i.i.epil, align 8, !dbg !673, !tbaa !122
  store i64 %55, i64* %arrayidx.i.i.epil, align 8, !dbg !673, !tbaa !122
  store i64 %54, i64* %arrayidx1.i.i.epil, align 8, !dbg !673, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %i.019.i.i.unr, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !668
  br label %for.cond.for.end_crit_edge.i.i, !dbg !678

for.cond.for.end_crit_edge.i.i:                   ; preds = %for.cond.for.end_crit_edge.i.i.unr-lcssa, %for.body.i.i.epil
  %add.i.i.i.lcssa = phi i64 [ %add.i.i.i.lcssa.ph, %for.cond.for.end_crit_edge.i.i.unr-lcssa ], [ %add.i.i.i.epil, %for.body.i.i.epil ], !dbg !671
  store i64 %add.i.i.i.lcssa, i64* @rand_nxt, align 8, !dbg !678, !tbaa !122
  br label %fill_array.exit, !dbg !666

fill_array.exit:                                  ; preds = %for.body, %for.cond.for.end_crit_edge.i.i
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %20) #19, !dbg !679
  call void @llvm.dbg.declare(metadata %struct.timeval* %t1, metadata !598, metadata !DIExpression()), !dbg !680
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %21) #19, !dbg !679
  call void @llvm.dbg.declare(metadata %struct.timeval* %t2, metadata !601, metadata !DIExpression()), !dbg !681
  %call9 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #19, !dbg !682
  %56 = load i64, i64* %size, align 8, !dbg !683, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %56, metadata !587, metadata !DIExpression()), !dbg !603
  call void @cilksort(i64* noundef %23, i64* noundef %24, i64 noundef %56), !dbg !684
  %call10 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #19, !dbg !685
  call void @llvm.dbg.value(metadata %struct.timeval* %t2, metadata !41, metadata !DIExpression()), !dbg !686
  %57 = load i64, i64* %tv_sec.i, align 8, !dbg !688, !tbaa !44
  %58 = load i64, i64* %tv_usec.i, align 8, !dbg !689, !tbaa !51
  call void @llvm.dbg.value(metadata %struct.timeval* %t1, metadata !41, metadata !DIExpression()), !dbg !690
  %59 = load i64, i64* %tv_sec.i59, align 8, !dbg !692, !tbaa !44
  %60 = load i64, i64* %tv_usec.i61, align 8, !dbg !693, !tbaa !51
  %reass.add = sub i64 %57, %59
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i = sub i64 %58, %60, !dbg !694
  %sub = add i64 %add.i, %reass.mul, !dbg !695
  %div = udiv i64 %sub, 1000, !dbg !696
  call void @llvm.dbg.value(metadata i64 %div, metadata !602, metadata !DIExpression()), !dbg !697
  %conv = uitofp i64 %div to double, !dbg !698
  %div13 = fdiv double %conv, 1.000000e+03, !dbg !699
  %call14 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i64 0, i64 0), double noundef %div13), !dbg !700
  %61 = load i32, i32* %check, align 4, !dbg !701, !tbaa !608
  call void @llvm.dbg.value(metadata i32 %61, metadata !595, metadata !DIExpression()), !dbg !603
  %tobool15.not = icmp eq i32 %61, 0, !dbg !701
  br i1 %tobool15.not, label %if.end31, label %if.then16, !dbg !703

if.then16:                                        ; preds = %fill_array.exit
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @str, i64 0, i64 0)), !dbg !704
  call void @llvm.dbg.value(metadata i32 1, metadata !592, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 0, metadata !590, metadata !DIExpression()), !dbg !603
  %62 = load i64, i64* %size, align 8, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %62, metadata !587, metadata !DIExpression()), !dbg !603
  %cmp1963 = icmp sgt i64 %62, 0, !dbg !706
  br i1 %cmp1963, label %for.body21.preheader, label %if.else, !dbg !709

for.body21.preheader:                             ; preds = %if.then16
  %63 = add i64 %62, -1, !dbg !709
  %xtraiter78 = and i64 %62, 3, !dbg !709
  %64 = icmp ult i64 %63, 3, !dbg !709
  br i1 %64, label %for.end.unr-lcssa, label %for.body21.preheader.new, !dbg !709

for.body21.preheader.new:                         ; preds = %for.body21.preheader
  %unroll_iter82 = and i64 %62, -4, !dbg !709
  br label %for.body21, !dbg !709

for.body21:                                       ; preds = %for.body21, %for.body21.preheader.new
  %success.065 = phi i32 [ 1, %for.body21.preheader.new ], [ %spec.select.3, %for.body21 ]
  %i.064 = phi i64 [ 0, %for.body21.preheader.new ], [ %inc.3, %for.body21 ]
  %niter83 = phi i64 [ 0, %for.body21.preheader.new ], [ %niter83.next.3, %for.body21 ]
  call void @llvm.dbg.value(metadata i32 %success.065, metadata !592, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %i.064, metadata !590, metadata !DIExpression()), !dbg !603
  %arrayidx = getelementptr inbounds i64, i64* %23, i64 %i.064, !dbg !710
  %65 = load i64, i64* %arrayidx, align 8, !dbg !710, !tbaa !122
  %cmp22.not = icmp eq i64 %65, %i.064, !dbg !712
  call void @llvm.dbg.value(metadata i32 undef, metadata !592, metadata !DIExpression()), !dbg !603
  %inc = or i64 %i.064, 1, !dbg !713
  call void @llvm.dbg.value(metadata i64 %inc, metadata !590, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %62, metadata !587, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 undef, metadata !592, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %inc, metadata !590, metadata !DIExpression()), !dbg !603
  %arrayidx.1 = getelementptr inbounds i64, i64* %23, i64 %inc, !dbg !710
  %66 = load i64, i64* %arrayidx.1, align 8, !dbg !710, !tbaa !122
  %cmp22.not.1 = icmp eq i64 %66, %inc, !dbg !712
  call void @llvm.dbg.value(metadata i32 undef, metadata !592, metadata !DIExpression()), !dbg !603
  %inc.1 = or i64 %i.064, 2, !dbg !713
  call void @llvm.dbg.value(metadata i64 %inc.1, metadata !590, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %62, metadata !587, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 undef, metadata !592, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %inc.1, metadata !590, metadata !DIExpression()), !dbg !603
  %arrayidx.2 = getelementptr inbounds i64, i64* %23, i64 %inc.1, !dbg !710
  %67 = load i64, i64* %arrayidx.2, align 8, !dbg !710, !tbaa !122
  %cmp22.not.2 = icmp eq i64 %67, %inc.1, !dbg !712
  call void @llvm.dbg.value(metadata i32 undef, metadata !592, metadata !DIExpression()), !dbg !603
  %inc.2 = or i64 %i.064, 3, !dbg !713
  call void @llvm.dbg.value(metadata i64 %inc.2, metadata !590, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %62, metadata !587, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 undef, metadata !592, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %inc.2, metadata !590, metadata !DIExpression()), !dbg !603
  %arrayidx.3 = getelementptr inbounds i64, i64* %23, i64 %inc.2, !dbg !710
  %68 = load i64, i64* %arrayidx.3, align 8, !dbg !710, !tbaa !122
  %cmp22.not.3 = icmp eq i64 %68, %inc.2, !dbg !712
  %69 = select i1 %cmp22.not.3, i1 %cmp22.not.2, i1 false, !dbg !714
  %70 = select i1 %69, i1 %cmp22.not.1, i1 false, !dbg !714
  %71 = select i1 %70, i1 %cmp22.not, i1 false, !dbg !714
  %spec.select.3 = select i1 %71, i32 %success.065, i32 0, !dbg !714
  call void @llvm.dbg.value(metadata i32 %spec.select.3, metadata !592, metadata !DIExpression()), !dbg !603
  %inc.3 = add nuw nsw i64 %i.064, 4, !dbg !713
  call void @llvm.dbg.value(metadata i64 %inc.3, metadata !590, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %62, metadata !587, metadata !DIExpression()), !dbg !603
  %niter83.next.3 = add i64 %niter83, 4, !dbg !709
  %niter83.ncmp.3 = icmp eq i64 %niter83.next.3, %unroll_iter82, !dbg !709
  br i1 %niter83.ncmp.3, label %for.end.unr-lcssa, label %for.body21, !dbg !709, !llvm.loop !715

for.end.unr-lcssa:                                ; preds = %for.body21, %for.body21.preheader
  %spec.select.lcssa.ph = phi i32 [ undef, %for.body21.preheader ], [ %spec.select.3, %for.body21 ]
  %success.065.unr = phi i32 [ 1, %for.body21.preheader ], [ %spec.select.3, %for.body21 ]
  %i.064.unr = phi i64 [ 0, %for.body21.preheader ], [ %inc.3, %for.body21 ]
  %lcmp.mod80.not = icmp eq i64 %xtraiter78, 0, !dbg !709
  br i1 %lcmp.mod80.not, label %for.end, label %for.body21.epil, !dbg !709

for.body21.epil:                                  ; preds = %for.end.unr-lcssa, %for.body21.epil
  %success.065.epil = phi i32 [ %spec.select.epil, %for.body21.epil ], [ %success.065.unr, %for.end.unr-lcssa ]
  %i.064.epil = phi i64 [ %inc.epil, %for.body21.epil ], [ %i.064.unr, %for.end.unr-lcssa ]
  %epil.iter79 = phi i64 [ %epil.iter79.next, %for.body21.epil ], [ 0, %for.end.unr-lcssa ]
  call void @llvm.dbg.value(metadata i32 %success.065.epil, metadata !592, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %i.064.epil, metadata !590, metadata !DIExpression()), !dbg !603
  %arrayidx.epil = getelementptr inbounds i64, i64* %23, i64 %i.064.epil, !dbg !710
  %72 = load i64, i64* %arrayidx.epil, align 8, !dbg !710, !tbaa !122
  %cmp22.not.epil = icmp eq i64 %72, %i.064.epil, !dbg !712
  %spec.select.epil = select i1 %cmp22.not.epil, i32 %success.065.epil, i32 0, !dbg !714
  call void @llvm.dbg.value(metadata i32 %spec.select.epil, metadata !592, metadata !DIExpression()), !dbg !603
  %inc.epil = add nuw nsw i64 %i.064.epil, 1, !dbg !713
  call void @llvm.dbg.value(metadata i64 %inc.epil, metadata !590, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %62, metadata !587, metadata !DIExpression()), !dbg !603
  %epil.iter79.next = add i64 %epil.iter79, 1, !dbg !709
  %epil.iter79.cmp.not = icmp eq i64 %epil.iter79.next, %xtraiter78, !dbg !709
  br i1 %epil.iter79.cmp.not, label %for.end, label %for.body21.epil, !dbg !709, !llvm.loop !717

for.end:                                          ; preds = %for.body21.epil, %for.end.unr-lcssa
  %spec.select.lcssa = phi i32 [ %spec.select.lcssa.ph, %for.end.unr-lcssa ], [ %spec.select.epil, %for.body21.epil ], !dbg !714
  %tobool26.not = icmp eq i32 %spec.select.lcssa, 0, !dbg !718
  br i1 %tobool26.not, label %if.then27, label %if.else, !dbg !720

if.then27:                                        ; preds = %for.end
  %73 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !721, !tbaa !565
  %74 = call i64 @fwrite(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.13, i64 0, i64 0), i64 16, i64 1, %struct._IO_FILE* %73) #20, !dbg !722
  br label %if.end31, !dbg !722

if.else:                                          ; preds = %if.then16, %for.end
  %75 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !723, !tbaa !565
  %76 = call i64 @fwrite(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.14, i64 0, i64 0), i64 19, i64 1, %struct._IO_FILE* %75) #20, !dbg !724
  br label %if.end31

if.end31:                                         ; preds = %if.then27, %if.else, %fill_array.exit
  %77 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !725, !tbaa !565
  %78 = call i64 @fwrite(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.15, i64 0, i64 0), i64 24, i64 1, %struct._IO_FILE* %77) #20, !dbg !726
  %79 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !727, !tbaa !565
  %80 = load i64, i64* %size, align 8, !dbg !728, !tbaa !122
  call void @llvm.dbg.value(metadata i64 %80, metadata !587, metadata !DIExpression()), !dbg !603
  %call33 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %79, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.16, i64 0, i64 0), i64 noundef %80) #20, !dbg !729
  call void @free(i8* noundef %call6) #19, !dbg !730
  call void @free(i8* noundef %call8) #19, !dbg !731
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %21) #19, !dbg !732
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %20) #19, !dbg !732
  %inc35 = add nuw nsw i32 %r.067, 1, !dbg !733
  call void @llvm.dbg.value(metadata i32 %inc35, metadata !596, metadata !DIExpression()), !dbg !642
  %81 = load i32, i32* %round, align 4, !dbg !643, !tbaa !608
  call void @llvm.dbg.value(metadata i32 %81, metadata !591, metadata !DIExpression()), !dbg !603
  %cmp = icmp slt i32 %inc35, %81, !dbg !644
  br i1 %cmp, label %for.body, label %cleanup, !dbg !645, !llvm.loop !734

cleanup:                                          ; preds = %if.end31, %if.end5, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ 0, %if.end5 ], [ 0, %if.end31 ], !dbg !603
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #19, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #19, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #19, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #19, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %0) #19, !dbg !736
  ret i32 %retval.0, !dbg !736
}

declare !dbg !737 dso_local void @get_options(i32 noundef, i8** noundef, i8** noundef, i32* noundef, ...) local_unnamed_addr #14

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #15

; Function Attrs: nofree nounwind
declare !dbg !743 dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #12

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #16

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #17

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #18

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #18

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { argmemonly mustprogress nounwind willreturn }
attributes #5 = { mustprogress nofree nounwind willreturn writeonly "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #8 = { argmemonly nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { argmemonly nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #18 = { nofree nounwind }
attributes #19 = { nounwind }
attributes #20 = { cold }
attributes #21 = { cold nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "specifiers", scope: !2, file: !3, line: 466, type: !18, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "cilksort.c", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "9660a9f43fd66d1699acd1da095bc8c7")
!4 = !{!5}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "ELM", file: !3, line: 86, baseType: !7)
!7 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!8 = !{!0, !9, !15}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "opt_types", scope: !2, file: !3, line: 467, type: !11, isLocal: false, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 192, elements: !13)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !{!14}
!14 = !DISubrange(count: 6)
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "rand_nxt", scope: !2, file: !3, line: 94, type: !17, isLocal: true, isDefinition: true)
!17 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !19, size: 384, elements: !13)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{i32 7, !"Dwarf Version", i32 5}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)"}
!27 = distinct !DISubprogram(name: "todval", scope: !3, file: !3, line: 70, type: !28, scopeLine: 70, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !40)
!28 = !DISubroutineType(types: !29)
!29 = !{!30, !31}
!30 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!31 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !33, line: 30, size: 128, elements: !34)
!33 = !DIFile(filename: "/usr/include/bits/time.h", directory: "", checksumkind: CSK_MD5, checksum: "7275d681a2390320bc78ae3cf595b8d2")
!34 = !{!35, !38}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !32, file: !33, line: 32, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !37, line: 148, baseType: !7)
!37 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "77efac6352c67c8f56830ba4c854379f")
!38 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !32, file: !33, line: 33, baseType: !39, size: 64, offset: 64)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !37, line: 150, baseType: !7)
!40 = !{!41}
!41 = !DILocalVariable(name: "tp", arg: 1, scope: !27, file: !3, line: 70, type: !31)
!42 = !DILocation(line: 0, scope: !27)
!43 = !DILocation(line: 71, column: 16, scope: !27)
!44 = !{!45, !46, i64 0}
!45 = !{!"timeval", !46, i64 0, !46, i64 8}
!46 = !{!"long", !47, i64 0}
!47 = !{!"omnipotent char", !48, i64 0}
!48 = !{!"Simple C/C++ TBAA"}
!49 = !DILocation(line: 71, column: 30, scope: !27)
!50 = !DILocation(line: 71, column: 43, scope: !27)
!51 = !{!45, !46, i64 8}
!52 = !DILocation(line: 71, column: 37, scope: !27)
!53 = !DILocation(line: 71, column: 5, scope: !27)
!54 = distinct !DISubprogram(name: "startup_cilk", scope: !3, file: !3, line: 75, type: !55, scopeLine: 75, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !57)
!55 = !DISubroutineType(types: !56)
!56 = !{null}
!57 = !{!58, !60, !62, !63, !64, !65}
!58 = !DILocalVariable(name: "g", scope: !54, file: !3, line: 76, type: !59)
!59 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!60 = !DILocalVariable(name: "__init", scope: !61, type: !12, flags: DIFlagArtificial)
!61 = distinct !DILexicalBlock(scope: !54, file: !3, line: 77, column: 3)
!62 = !DILocalVariable(name: "__limit", scope: !61, type: !12, flags: DIFlagArtificial)
!63 = !DILocalVariable(name: "__begin", scope: !61, type: !12, flags: DIFlagArtificial)
!64 = !DILocalVariable(name: "__end", scope: !61, type: !12, flags: DIFlagArtificial)
!65 = !DILocalVariable(name: "i", scope: !66, file: !3, line: 77, type: !12)
!66 = distinct !DILexicalBlock(scope: !61, file: !3, line: 77, column: 3)
!67 = !DILocation(line: 0, scope: !54)
!68 = !DILocation(line: 76, column: 3, scope: !54)
!69 = !DILocation(line: 76, column: 10, scope: !54)
!70 = !{!71, !71, i64 0}
!71 = !{!"double", !47, i64 0}
!72 = !DILocation(line: 0, scope: !61)
!73 = !DILocation(line: 77, column: 24, scope: !61)
!74 = !DILocation(line: 77, column: 3, scope: !61)
!75 = !DILocation(line: 0, scope: !66)
!76 = !DILocation(line: 78, column: 14, scope: !77)
!77 = distinct !DILexicalBlock(scope: !66, file: !3, line: 77, column: 36)
!78 = !DILocation(line: 78, column: 10, scope: !77)
!79 = !DILocation(line: 78, column: 7, scope: !77)
!80 = !DILocation(line: 79, column: 3, scope: !77)
!81 = !DILocation(line: 77, column: 32, scope: !66)
!82 = !DILocation(line: 77, column: 24, scope: !66)
!83 = !DILocation(line: 77, column: 3, scope: !66)
!84 = distinct !{!84, !74, !85, !86}
!85 = !DILocation(line: 79, column: 3, scope: !61)
!86 = !{!"tapir.loop.spawn.strategy", i32 1}
!87 = !DILocation(line: 80, column: 1, scope: !54)
!88 = distinct !DISubprogram(name: "seqquick", scope: !3, file: !3, line: 200, type: !89, scopeLine: 200, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !91)
!89 = !DISubroutineType(types: !90)
!90 = !{null, !5, !5}
!91 = !{!92, !93, !94}
!92 = !DILocalVariable(name: "low", arg: 1, scope: !88, file: !3, line: 200, type: !5)
!93 = !DILocalVariable(name: "high", arg: 2, scope: !88, file: !3, line: 200, type: !5)
!94 = !DILocalVariable(name: "p", scope: !88, file: !3, line: 202, type: !5)
!95 = !DILocation(line: 0, scope: !88)
!96 = !DILocation(line: 204, column: 15, scope: !88)
!97 = !DILocation(line: 204, column: 21, scope: !88)
!98 = !DILocation(line: 204, column: 3, scope: !88)
!99 = !DILocalVariable(name: "low", arg: 1, scope: !100, file: !3, line: 139, type: !5)
!100 = distinct !DISubprogram(name: "seqpart", scope: !3, file: !3, line: 139, type: !101, scopeLine: 139, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !103)
!101 = !DISubroutineType(types: !102)
!102 = !{!5, !5, !5}
!103 = !{!99, !104, !105, !106, !107, !108, !109}
!104 = !DILocalVariable(name: "high", arg: 2, scope: !100, file: !3, line: 139, type: !5)
!105 = !DILocalVariable(name: "pivot", scope: !100, file: !3, line: 141, type: !6)
!106 = !DILocalVariable(name: "h", scope: !100, file: !3, line: 142, type: !6)
!107 = !DILocalVariable(name: "l", scope: !100, file: !3, line: 142, type: !6)
!108 = !DILocalVariable(name: "curr_low", scope: !100, file: !3, line: 143, type: !5)
!109 = !DILocalVariable(name: "curr_high", scope: !100, file: !3, line: 144, type: !5)
!110 = !DILocation(line: 0, scope: !100, inlinedAt: !111)
!111 = distinct !DILocation(line: 205, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !88, file: !3, line: 204, column: 39)
!113 = !DILocalVariable(name: "low", arg: 1, scope: !114, file: !3, line: 134, type: !5)
!114 = distinct !DISubprogram(name: "choose_pivot", scope: !3, file: !3, line: 134, type: !115, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !117)
!115 = !DISubroutineType(types: !116)
!116 = !{!6, !5, !5}
!117 = !{!113, !118}
!118 = !DILocalVariable(name: "high", arg: 2, scope: !114, file: !3, line: 134, type: !5)
!119 = !DILocation(line: 0, scope: !114, inlinedAt: !120)
!120 = distinct !DILocation(line: 146, column: 11, scope: !100, inlinedAt: !111)
!121 = !DILocation(line: 136, column: 15, scope: !114, inlinedAt: !120)
!122 = !{!46, !46, i64 0}
!123 = !DILocation(line: 136, column: 21, scope: !114, inlinedAt: !120)
!124 = !DILocation(line: 136, column: 45, scope: !114, inlinedAt: !120)
!125 = !DILocation(line: 136, column: 28, scope: !114, inlinedAt: !120)
!126 = !DILocalVariable(name: "a", arg: 1, scope: !127, file: !3, line: 107, type: !6)
!127 = distinct !DISubprogram(name: "med3", scope: !3, file: !3, line: 107, type: !128, scopeLine: 107, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !130)
!128 = !DISubroutineType(types: !129)
!129 = !{!6, !6, !6, !6}
!130 = !{!126, !131, !132}
!131 = !DILocalVariable(name: "b", arg: 2, scope: !127, file: !3, line: 107, type: !6)
!132 = !DILocalVariable(name: "c", arg: 3, scope: !127, file: !3, line: 107, type: !6)
!133 = !DILocation(line: 0, scope: !127, inlinedAt: !134)
!134 = distinct !DILocation(line: 136, column: 10, scope: !114, inlinedAt: !120)
!135 = !DILocation(line: 109, column: 9, scope: !136, inlinedAt: !134)
!136 = distinct !DILexicalBlock(scope: !127, file: !3, line: 109, column: 7)
!137 = !DILocation(line: 109, column: 7, scope: !127, inlinedAt: !134)
!138 = !DILocation(line: 110, column: 11, scope: !139, inlinedAt: !134)
!139 = distinct !DILexicalBlock(scope: !140, file: !3, line: 110, column: 9)
!140 = distinct !DILexicalBlock(scope: !136, file: !3, line: 109, column: 14)
!141 = !DILocation(line: 110, column: 9, scope: !140, inlinedAt: !134)
!142 = !DILocation(line: 113, column: 13, scope: !143, inlinedAt: !134)
!143 = distinct !DILexicalBlock(scope: !144, file: !3, line: 113, column: 11)
!144 = distinct !DILexicalBlock(scope: !139, file: !3, line: 112, column: 12)
!145 = !DILocation(line: 0, scope: !143, inlinedAt: !134)
!146 = !DILocation(line: 119, column: 11, scope: !147, inlinedAt: !134)
!147 = distinct !DILexicalBlock(scope: !148, file: !3, line: 119, column: 9)
!148 = distinct !DILexicalBlock(scope: !136, file: !3, line: 118, column: 10)
!149 = !DILocation(line: 119, column: 9, scope: !148, inlinedAt: !134)
!150 = !DILocation(line: 122, column: 13, scope: !151, inlinedAt: !134)
!151 = distinct !DILexicalBlock(scope: !152, file: !3, line: 122, column: 11)
!152 = distinct !DILexicalBlock(scope: !147, file: !3, line: 121, column: 12)
!153 = !DILocation(line: 0, scope: !151, inlinedAt: !134)
!154 = !DILocation(line: 0, scope: !136, inlinedAt: !134)
!155 = !DILocation(line: 148, column: 3, scope: !100, inlinedAt: !111)
!156 = !DILocation(line: 149, column: 5, scope: !157, inlinedAt: !111)
!157 = distinct !DILexicalBlock(scope: !100, file: !3, line: 148, column: 13)
!158 = !DILocation(line: 149, column: 17, scope: !157, inlinedAt: !111)
!159 = !DILocation(line: 149, column: 29, scope: !157, inlinedAt: !111)
!160 = !DILocation(line: 150, column: 16, scope: !157, inlinedAt: !111)
!161 = distinct !{!161, !156, !160, !162}
!162 = !{!"llvm.loop.mustprogress"}
!163 = !DILocation(line: 152, column: 17, scope: !157, inlinedAt: !111)
!164 = !DILocation(line: 152, column: 28, scope: !157, inlinedAt: !111)
!165 = !DILocation(line: 153, column: 15, scope: !157, inlinedAt: !111)
!166 = !DILocation(line: 152, column: 5, scope: !157, inlinedAt: !111)
!167 = distinct !{!167, !166, !165, !162}
!168 = !DILocation(line: 155, column: 18, scope: !169, inlinedAt: !111)
!169 = distinct !DILexicalBlock(scope: !157, file: !3, line: 155, column: 9)
!170 = !DILocation(line: 155, column: 9, scope: !157, inlinedAt: !111)
!171 = !DILocation(line: 158, column: 18, scope: !157, inlinedAt: !111)
!172 = !DILocation(line: 159, column: 17, scope: !157, inlinedAt: !111)
!173 = distinct !{!173, !155, !174}
!174 = !DILocation(line: 160, column: 3, scope: !100, inlinedAt: !111)
!175 = !DILocation(line: 170, column: 17, scope: !176, inlinedAt: !111)
!176 = distinct !DILexicalBlock(scope: !100, file: !3, line: 170, column: 7)
!177 = !DILocation(line: 170, column: 7, scope: !100, inlinedAt: !111)
!178 = !DILocation(line: 206, column: 5, scope: !112)
!179 = !DILocation(line: 207, column: 13, scope: !112)
!180 = distinct !{!180, !98, !181, !162}
!181 = !DILocation(line: 208, column: 3, scope: !88)
!182 = !DILocalVariable(name: "low", arg: 1, scope: !183, file: !3, line: 184, type: !5)
!183 = distinct !DISubprogram(name: "insertion_sort", scope: !3, file: !3, line: 184, type: !89, scopeLine: 184, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !184)
!184 = !{!182, !185, !186, !187, !188, !189}
!185 = !DILocalVariable(name: "high", arg: 2, scope: !183, file: !3, line: 184, type: !5)
!186 = !DILocalVariable(name: "p", scope: !183, file: !3, line: 186, type: !5)
!187 = !DILocalVariable(name: "q", scope: !183, file: !3, line: 186, type: !5)
!188 = !DILocalVariable(name: "a", scope: !183, file: !3, line: 187, type: !6)
!189 = !DILocalVariable(name: "b", scope: !183, file: !3, line: 187, type: !6)
!190 = !DILocation(line: 0, scope: !183, inlinedAt: !191)
!191 = distinct !DILocation(line: 210, column: 3, scope: !88)
!192 = !DILocation(line: 0, scope: !193, inlinedAt: !191)
!193 = distinct !DILexicalBlock(scope: !183, file: !3, line: 189, column: 3)
!194 = !DILocation(line: 189, column: 23, scope: !195, inlinedAt: !191)
!195 = distinct !DILexicalBlock(scope: !193, file: !3, line: 189, column: 3)
!196 = !DILocation(line: 189, column: 3, scope: !193, inlinedAt: !191)
!197 = !DILocation(line: 190, column: 9, scope: !198, inlinedAt: !191)
!198 = distinct !DILexicalBlock(scope: !195, file: !3, line: 189, column: 37)
!199 = !DILocation(line: 191, column: 23, scope: !200, inlinedAt: !191)
!200 = distinct !DILexicalBlock(scope: !201, file: !3, line: 191, column: 5)
!201 = distinct !DILexicalBlock(scope: !198, file: !3, line: 191, column: 5)
!202 = !DILocation(line: 191, column: 30, scope: !200, inlinedAt: !191)
!203 = !DILocation(line: 191, column: 38, scope: !200, inlinedAt: !191)
!204 = !DILocation(line: 191, column: 44, scope: !200, inlinedAt: !191)
!205 = !DILocation(line: 191, column: 5, scope: !201, inlinedAt: !191)
!206 = !DILocation(line: 192, column: 7, scope: !200, inlinedAt: !191)
!207 = !DILocation(line: 192, column: 12, scope: !200, inlinedAt: !191)
!208 = !DILocation(line: 191, column: 50, scope: !200, inlinedAt: !191)
!209 = distinct !{!209, !205, !210, !162}
!210 = !DILocation(line: 192, column: 14, scope: !201, inlinedAt: !191)
!211 = !DILocation(line: 0, scope: !201, inlinedAt: !191)
!212 = !DILocation(line: 193, column: 5, scope: !198, inlinedAt: !191)
!213 = !DILocation(line: 193, column: 10, scope: !198, inlinedAt: !191)
!214 = distinct !{!214, !196, !215, !162}
!215 = !DILocation(line: 194, column: 3, scope: !193, inlinedAt: !191)
!216 = !DILocation(line: 211, column: 1, scope: !88)
!217 = distinct !DISubprogram(name: "seqmerge", scope: !3, file: !3, line: 213, type: !218, scopeLine: 214, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !220)
!218 = !DISubroutineType(types: !219)
!219 = !{null, !5, !5, !5, !5, !5}
!220 = !{!221, !222, !223, !224, !225, !226, !227}
!221 = !DILocalVariable(name: "low1", arg: 1, scope: !217, file: !3, line: 213, type: !5)
!222 = !DILocalVariable(name: "high1", arg: 2, scope: !217, file: !3, line: 213, type: !5)
!223 = !DILocalVariable(name: "low2", arg: 3, scope: !217, file: !3, line: 214, type: !5)
!224 = !DILocalVariable(name: "high2", arg: 4, scope: !217, file: !3, line: 214, type: !5)
!225 = !DILocalVariable(name: "lowdest", arg: 5, scope: !217, file: !3, line: 214, type: !5)
!226 = !DILocalVariable(name: "a1", scope: !217, file: !3, line: 216, type: !6)
!227 = !DILocalVariable(name: "a2", scope: !217, file: !3, line: 216, type: !6)
!228 = !DILocation(line: 0, scope: !217)
!229 = !DILocation(line: 244, column: 12, scope: !230)
!230 = distinct !DILexicalBlock(scope: !217, file: !3, line: 244, column: 7)
!231 = !DILocation(line: 244, column: 20, scope: !230)
!232 = !DILocation(line: 245, column: 10, scope: !233)
!233 = distinct !DILexicalBlock(scope: !230, file: !3, line: 244, column: 37)
!234 = !DILocation(line: 247, column: 5, scope: !233)
!235 = !DILocation(line: 0, scope: !233)
!236 = !DILocation(line: 247, column: 5, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !3, line: 247, column: 5)
!238 = !DILocation(line: 248, column: 14, scope: !239)
!239 = distinct !DILexicalBlock(scope: !240, file: !3, line: 248, column: 11)
!240 = distinct !DILexicalBlock(scope: !241, file: !3, line: 247, column: 14)
!241 = distinct !DILexicalBlock(scope: !237, file: !3, line: 247, column: 5)
!242 = !DILocation(line: 0, scope: !239)
!243 = !DILocation(line: 248, column: 11, scope: !240)
!244 = !DILocation(line: 249, column: 20, scope: !245)
!245 = distinct !DILexicalBlock(scope: !239, file: !3, line: 248, column: 20)
!246 = !DILocation(line: 250, column: 15, scope: !245)
!247 = !DILocation(line: 250, column: 14, scope: !245)
!248 = !DILocation(line: 251, column: 18, scope: !249)
!249 = distinct !DILexicalBlock(scope: !245, file: !3, line: 251, column: 13)
!250 = !DILocation(line: 251, column: 13, scope: !245)
!251 = distinct !{!251, !236, !252}
!252 = !DILocation(line: 259, column: 5, scope: !237)
!253 = !DILocation(line: 254, column: 20, scope: !254)
!254 = distinct !DILexicalBlock(scope: !239, file: !3, line: 253, column: 14)
!255 = !DILocation(line: 255, column: 15, scope: !254)
!256 = !DILocation(line: 256, column: 18, scope: !257)
!257 = distinct !DILexicalBlock(scope: !254, file: !3, line: 256, column: 13)
!258 = !DILocation(line: 256, column: 13, scope: !254)
!259 = !DILocation(line: 261, column: 12, scope: !260)
!260 = distinct !DILexicalBlock(scope: !217, file: !3, line: 261, column: 7)
!261 = !DILocation(line: 261, column: 21, scope: !260)
!262 = !DILocation(line: 262, column: 10, scope: !263)
!263 = distinct !DILexicalBlock(scope: !260, file: !3, line: 261, column: 39)
!264 = !DILocation(line: 264, column: 5, scope: !263)
!265 = !DILocation(line: 0, scope: !263)
!266 = !DILocation(line: 264, column: 5, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !3, line: 264, column: 5)
!268 = !DILocation(line: 265, column: 14, scope: !269)
!269 = distinct !DILexicalBlock(scope: !270, file: !3, line: 265, column: 11)
!270 = distinct !DILexicalBlock(scope: !271, file: !3, line: 264, column: 14)
!271 = distinct !DILexicalBlock(scope: !267, file: !3, line: 264, column: 5)
!272 = !DILocation(line: 0, scope: !269)
!273 = !DILocation(line: 265, column: 11, scope: !270)
!274 = !DILocation(line: 266, column: 20, scope: !275)
!275 = distinct !DILexicalBlock(scope: !269, file: !3, line: 265, column: 20)
!276 = !DILocation(line: 267, column: 9, scope: !275)
!277 = !DILocation(line: 268, column: 18, scope: !278)
!278 = distinct !DILexicalBlock(scope: !275, file: !3, line: 268, column: 13)
!279 = !DILocation(line: 268, column: 13, scope: !275)
!280 = !DILocation(line: 270, column: 14, scope: !275)
!281 = !DILocation(line: 271, column: 7, scope: !275)
!282 = distinct !{!282, !266, !283}
!283 = !DILocation(line: 278, column: 5, scope: !267)
!284 = !DILocation(line: 272, column: 20, scope: !285)
!285 = distinct !DILexicalBlock(scope: !269, file: !3, line: 271, column: 14)
!286 = !DILocation(line: 273, column: 9, scope: !285)
!287 = !DILocation(line: 274, column: 18, scope: !288)
!288 = distinct !DILexicalBlock(scope: !285, file: !3, line: 274, column: 13)
!289 = !DILocation(line: 274, column: 13, scope: !285)
!290 = !DILocation(line: 280, column: 12, scope: !291)
!291 = distinct !DILexicalBlock(scope: !217, file: !3, line: 280, column: 7)
!292 = !DILocation(line: 0, scope: !291)
!293 = !DILocation(line: 285, column: 1, scope: !217)
!294 = distinct !DISubprogram(name: "binsplit", scope: !3, file: !3, line: 295, type: !295, scopeLine: 295, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !297)
!295 = !DISubroutineType(types: !296)
!296 = !{!5, !6, !5, !5}
!297 = !{!298, !299, !300, !301}
!298 = !DILocalVariable(name: "val", arg: 1, scope: !294, file: !3, line: 295, type: !6)
!299 = !DILocalVariable(name: "low", arg: 2, scope: !294, file: !3, line: 295, type: !5)
!300 = !DILocalVariable(name: "high", arg: 3, scope: !294, file: !3, line: 295, type: !5)
!301 = !DILocalVariable(name: "mid", scope: !294, file: !3, line: 301, type: !5)
!302 = !DILocation(line: 0, scope: !294)
!303 = !DILocation(line: 303, column: 14, scope: !294)
!304 = !DILocation(line: 303, column: 3, scope: !294)
!305 = !DILocation(line: 304, column: 24, scope: !306)
!306 = distinct !DILexicalBlock(scope: !294, file: !3, line: 303, column: 23)
!307 = !DILocation(line: 304, column: 30, scope: !306)
!308 = !DILocation(line: 304, column: 35, scope: !306)
!309 = !DILocation(line: 304, column: 15, scope: !306)
!310 = !DILocation(line: 305, column: 16, scope: !311)
!311 = distinct !DILexicalBlock(scope: !306, file: !3, line: 305, column: 9)
!312 = !DILocation(line: 305, column: 13, scope: !311)
!313 = !DILocation(line: 305, column: 9, scope: !306)
!314 = distinct !{!314, !304, !315, !162}
!315 = !DILocation(line: 309, column: 3, scope: !294)
!316 = !DILocation(line: 311, column: 7, scope: !317)
!317 = distinct !DILexicalBlock(scope: !294, file: !3, line: 311, column: 7)
!318 = !DILocation(line: 311, column: 12, scope: !317)
!319 = !DILocation(line: 311, column: 7, scope: !294)
!320 = !DILocation(line: 315, column: 1, scope: !294)
!321 = distinct !DISubprogram(name: "cilkmerge", scope: !3, file: !3, line: 317, type: !218, scopeLine: 318, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !322)
!322 = !{!323, !324, !325, !326, !327, !328, !329, !330, !331, !335}
!323 = !DILocalVariable(name: "low1", arg: 1, scope: !321, file: !3, line: 317, type: !5)
!324 = !DILocalVariable(name: "high1", arg: 2, scope: !321, file: !3, line: 317, type: !5)
!325 = !DILocalVariable(name: "low2", arg: 3, scope: !321, file: !3, line: 318, type: !5)
!326 = !DILocalVariable(name: "high2", arg: 4, scope: !321, file: !3, line: 318, type: !5)
!327 = !DILocalVariable(name: "lowdest", arg: 5, scope: !321, file: !3, line: 318, type: !5)
!328 = !DILocalVariable(name: "split1", scope: !321, file: !3, line: 332, type: !5)
!329 = !DILocalVariable(name: "split2", scope: !321, file: !3, line: 332, type: !5)
!330 = !DILocalVariable(name: "lowsize", scope: !321, file: !3, line: 336, type: !7)
!331 = !DILocalVariable(name: "tmp", scope: !332, file: !3, line: 342, type: !5)
!332 = distinct !DILexicalBlock(scope: !333, file: !3, line: 342, column: 5)
!333 = distinct !DILexicalBlock(scope: !334, file: !3, line: 341, column: 36)
!334 = distinct !DILexicalBlock(scope: !321, file: !3, line: 341, column: 7)
!335 = !DILocalVariable(name: "tmp", scope: !336, file: !3, line: 343, type: !5)
!336 = distinct !DILexicalBlock(scope: !333, file: !3, line: 343, column: 5)
!337 = !DILocation(line: 0, scope: !321)
!338 = !DILocation(line: 374, column: 3, scope: !321)
!339 = !DILocation(line: 341, column: 13, scope: !334)
!340 = !DILocation(line: 341, column: 28, scope: !334)
!341 = !DILocation(line: 341, column: 20, scope: !334)
!342 = !DILocation(line: 341, column: 7, scope: !321)
!343 = !DILocation(line: 344, column: 3, scope: !333)
!344 = !DILocation(line: 346, column: 13, scope: !345)
!345 = distinct !DILexicalBlock(scope: !321, file: !3, line: 346, column: 7)
!346 = !DILocation(line: 346, column: 7, scope: !321)
!347 = !DILocation(line: 348, column: 5, scope: !348)
!348 = distinct !DILexicalBlock(scope: !345, file: !3, line: 346, column: 21)
!349 = !DILocation(line: 348, column: 48, scope: !348)
!350 = !DILocation(line: 349, column: 5, scope: !348)
!351 = !DILocation(line: 352, column: 13, scope: !352)
!352 = distinct !DILexicalBlock(scope: !321, file: !3, line: 352, column: 7)
!353 = !DILocation(line: 352, column: 20, scope: !352)
!354 = !DILocation(line: 352, column: 7, scope: !321)
!355 = !DILocation(line: 0, scope: !217, inlinedAt: !356)
!356 = distinct !DILocation(line: 353, column: 5, scope: !357)
!357 = distinct !DILexicalBlock(scope: !352, file: !3, line: 352, column: 33)
!358 = !DILocation(line: 244, column: 12, scope: !230, inlinedAt: !356)
!359 = !DILocation(line: 244, column: 20, scope: !230, inlinedAt: !356)
!360 = !DILocation(line: 245, column: 10, scope: !233, inlinedAt: !356)
!361 = !DILocation(line: 247, column: 5, scope: !233, inlinedAt: !356)
!362 = !DILocation(line: 0, scope: !233, inlinedAt: !356)
!363 = !DILocation(line: 247, column: 5, scope: !237, inlinedAt: !356)
!364 = !DILocation(line: 248, column: 14, scope: !239, inlinedAt: !356)
!365 = !DILocation(line: 0, scope: !239, inlinedAt: !356)
!366 = !DILocation(line: 248, column: 11, scope: !240, inlinedAt: !356)
!367 = !DILocation(line: 249, column: 20, scope: !245, inlinedAt: !356)
!368 = !DILocation(line: 250, column: 15, scope: !245, inlinedAt: !356)
!369 = !DILocation(line: 250, column: 14, scope: !245, inlinedAt: !356)
!370 = !DILocation(line: 251, column: 18, scope: !249, inlinedAt: !356)
!371 = !DILocation(line: 251, column: 13, scope: !245, inlinedAt: !356)
!372 = distinct !{!372, !363, !373}
!373 = !DILocation(line: 259, column: 5, scope: !237, inlinedAt: !356)
!374 = !DILocation(line: 254, column: 20, scope: !254, inlinedAt: !356)
!375 = !DILocation(line: 255, column: 15, scope: !254, inlinedAt: !356)
!376 = !DILocation(line: 256, column: 18, scope: !257, inlinedAt: !356)
!377 = !DILocation(line: 256, column: 13, scope: !254, inlinedAt: !356)
!378 = !DILocation(line: 261, column: 12, scope: !260, inlinedAt: !356)
!379 = !DILocation(line: 261, column: 21, scope: !260, inlinedAt: !356)
!380 = !DILocation(line: 262, column: 10, scope: !263, inlinedAt: !356)
!381 = !DILocation(line: 264, column: 5, scope: !263, inlinedAt: !356)
!382 = !DILocation(line: 0, scope: !263, inlinedAt: !356)
!383 = !DILocation(line: 264, column: 5, scope: !267, inlinedAt: !356)
!384 = !DILocation(line: 265, column: 14, scope: !269, inlinedAt: !356)
!385 = !DILocation(line: 0, scope: !269, inlinedAt: !356)
!386 = !DILocation(line: 265, column: 11, scope: !270, inlinedAt: !356)
!387 = !DILocation(line: 266, column: 20, scope: !275, inlinedAt: !356)
!388 = !DILocation(line: 267, column: 9, scope: !275, inlinedAt: !356)
!389 = !DILocation(line: 268, column: 18, scope: !278, inlinedAt: !356)
!390 = !DILocation(line: 268, column: 13, scope: !275, inlinedAt: !356)
!391 = !DILocation(line: 270, column: 14, scope: !275, inlinedAt: !356)
!392 = !DILocation(line: 271, column: 7, scope: !275, inlinedAt: !356)
!393 = distinct !{!393, !383, !394}
!394 = !DILocation(line: 278, column: 5, scope: !267, inlinedAt: !356)
!395 = !DILocation(line: 272, column: 20, scope: !285, inlinedAt: !356)
!396 = !DILocation(line: 273, column: 9, scope: !285, inlinedAt: !356)
!397 = !DILocation(line: 274, column: 18, scope: !288, inlinedAt: !356)
!398 = !DILocation(line: 274, column: 13, scope: !285, inlinedAt: !356)
!399 = !DILocation(line: 280, column: 12, scope: !291, inlinedAt: !356)
!400 = !DILocation(line: 0, scope: !291, inlinedAt: !356)
!401 = !DILocation(line: 354, column: 5, scope: !357)
!402 = !DILocation(line: 363, column: 20, scope: !321)
!403 = !DILocation(line: 363, column: 27, scope: !321)
!404 = !DILocation(line: 363, column: 32, scope: !321)
!405 = !DILocation(line: 363, column: 37, scope: !321)
!406 = !DILocation(line: 364, column: 21, scope: !321)
!407 = !DILocation(line: 0, scope: !294, inlinedAt: !408)
!408 = distinct !DILocation(line: 364, column: 12, scope: !321)
!409 = !DILocation(line: 303, column: 14, scope: !294, inlinedAt: !408)
!410 = !DILocation(line: 303, column: 3, scope: !294, inlinedAt: !408)
!411 = !DILocation(line: 304, column: 24, scope: !306, inlinedAt: !408)
!412 = !DILocation(line: 304, column: 30, scope: !306, inlinedAt: !408)
!413 = !DILocation(line: 304, column: 35, scope: !306, inlinedAt: !408)
!414 = !DILocation(line: 304, column: 15, scope: !306, inlinedAt: !408)
!415 = !DILocation(line: 305, column: 16, scope: !311, inlinedAt: !408)
!416 = !DILocation(line: 305, column: 13, scope: !311, inlinedAt: !408)
!417 = !DILocation(line: 305, column: 9, scope: !306, inlinedAt: !408)
!418 = distinct !{!418, !410, !419, !162}
!419 = !DILocation(line: 309, column: 3, scope: !294, inlinedAt: !408)
!420 = !DILocation(line: 311, column: 7, scope: !317, inlinedAt: !408)
!421 = !DILocation(line: 311, column: 12, scope: !317, inlinedAt: !408)
!422 = !DILocation(line: 311, column: 7, scope: !294, inlinedAt: !408)
!423 = !DILocation(line: 365, column: 27, scope: !321)
!424 = !DILocation(line: 365, column: 36, scope: !321)
!425 = !DILocation(line: 371, column: 13, scope: !321)
!426 = !DILocation(line: 371, column: 23, scope: !321)
!427 = !DILocation(line: 371, column: 28, scope: !321)
!428 = !DILocation(line: 373, column: 14, scope: !321)
!429 = !DILocation(line: 373, column: 37, scope: !321)
!430 = !DILocation(line: 374, column: 20, scope: !321)
!431 = !DILocation(line: 374, column: 39, scope: !321)
!432 = !DILocation(line: 374, column: 69, scope: !321)
!433 = !DILocation(line: 378, column: 1, scope: !321)
!434 = distinct !DISubprogram(name: "cilksort", scope: !3, file: !3, line: 380, type: !435, scopeLine: 380, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !437)
!435 = !DISubroutineType(types: !436)
!436 = !{null, !5, !5, !7}
!437 = !{!438, !439, !440, !441, !442, !443, !444, !445, !446, !447, !448, !449}
!438 = !DILocalVariable(name: "low", arg: 1, scope: !434, file: !3, line: 380, type: !5)
!439 = !DILocalVariable(name: "tmp", arg: 2, scope: !434, file: !3, line: 380, type: !5)
!440 = !DILocalVariable(name: "size", arg: 3, scope: !434, file: !3, line: 380, type: !7)
!441 = !DILocalVariable(name: "quarter", scope: !434, file: !3, line: 390, type: !7)
!442 = !DILocalVariable(name: "A", scope: !434, file: !3, line: 391, type: !5)
!443 = !DILocalVariable(name: "B", scope: !434, file: !3, line: 391, type: !5)
!444 = !DILocalVariable(name: "C", scope: !434, file: !3, line: 391, type: !5)
!445 = !DILocalVariable(name: "D", scope: !434, file: !3, line: 391, type: !5)
!446 = !DILocalVariable(name: "tmpA", scope: !434, file: !3, line: 391, type: !5)
!447 = !DILocalVariable(name: "tmpB", scope: !434, file: !3, line: 391, type: !5)
!448 = !DILocalVariable(name: "tmpC", scope: !434, file: !3, line: 391, type: !5)
!449 = !DILocalVariable(name: "tmpD", scope: !434, file: !3, line: 391, type: !5)
!450 = !DILocation(line: 0, scope: !434)
!451 = !DILocation(line: 390, column: 23, scope: !434)
!452 = !DILocation(line: 393, column: 12, scope: !453)
!453 = distinct !DILexicalBlock(scope: !434, file: !3, line: 393, column: 7)
!454 = !DILocation(line: 393, column: 7, scope: !434)
!455 = !DILocation(line: 395, column: 23, scope: !456)
!456 = distinct !DILexicalBlock(scope: !453, file: !3, line: 393, column: 25)
!457 = !DILocation(line: 395, column: 30, scope: !456)
!458 = !DILocation(line: 395, column: 5, scope: !456)
!459 = !DILocation(line: 396, column: 5, scope: !456)
!460 = !DILocation(line: 401, column: 9, scope: !434)
!461 = !DILocation(line: 402, column: 15, scope: !434)
!462 = !DILocation(line: 403, column: 9, scope: !434)
!463 = !DILocation(line: 404, column: 15, scope: !434)
!464 = !DILocation(line: 405, column: 9, scope: !434)
!465 = !DILocation(line: 406, column: 15, scope: !434)
!466 = !DILocation(line: 408, column: 14, scope: !434)
!467 = !DILocation(line: 409, column: 14, scope: !434)
!468 = !DILocation(line: 410, column: 14, scope: !434)
!469 = !DILocation(line: 411, column: 30, scope: !434)
!470 = !DILocation(line: 411, column: 26, scope: !434)
!471 = !DILocation(line: 411, column: 3, scope: !434)
!472 = !DILocation(line: 412, column: 3, scope: !434)
!473 = !DILocation(line: 414, column: 14, scope: !434)
!474 = !DILocation(line: 414, column: 59, scope: !434)
!475 = !DILocation(line: 414, column: 39, scope: !434)
!476 = !DILocation(line: 415, column: 28, scope: !434)
!477 = !DILocation(line: 415, column: 40, scope: !434)
!478 = !DILocation(line: 415, column: 47, scope: !434)
!479 = !DILocation(line: 415, column: 3, scope: !434)
!480 = !DILocation(line: 416, column: 3, scope: !434)
!481 = !DILocation(line: 418, column: 24, scope: !434)
!482 = !DILocation(line: 418, column: 40, scope: !434)
!483 = !DILocation(line: 418, column: 47, scope: !434)
!484 = !DILocation(line: 418, column: 3, scope: !434)
!485 = !DILocation(line: 420, column: 3, scope: !434)
!486 = !DILocation(line: 421, column: 1, scope: !434)
!487 = distinct !DISubprogram(name: "scramble_array", scope: !3, file: !3, line: 423, type: !488, scopeLine: 423, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !490)
!488 = !DISubroutineType(types: !489)
!489 = !{null, !5, !17}
!490 = !{!491, !492, !493, !494, !495}
!491 = !DILocalVariable(name: "arr", arg: 1, scope: !487, file: !3, line: 423, type: !5)
!492 = !DILocalVariable(name: "size", arg: 2, scope: !487, file: !3, line: 423, type: !17)
!493 = !DILocalVariable(name: "i", scope: !487, file: !3, line: 425, type: !17)
!494 = !DILocalVariable(name: "j", scope: !487, file: !3, line: 426, type: !17)
!495 = !DILocalVariable(name: "tmp", scope: !496, file: !3, line: 431, type: !6)
!496 = distinct !DILexicalBlock(scope: !497, file: !3, line: 431, column: 5)
!497 = distinct !DILexicalBlock(scope: !498, file: !3, line: 428, column: 30)
!498 = distinct !DILexicalBlock(scope: !499, file: !3, line: 428, column: 3)
!499 = distinct !DILexicalBlock(scope: !487, file: !3, line: 428, column: 3)
!500 = !DILocation(line: 0, scope: !487)
!501 = !DILocation(line: 428, column: 17, scope: !498)
!502 = !DILocation(line: 428, column: 3, scope: !499)
!503 = !DILocation(line: 98, column: 23, scope: !504, inlinedAt: !508)
!504 = distinct !DISubprogram(name: "my_rand", scope: !3, file: !3, line: 96, type: !505, scopeLine: 96, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !507)
!505 = !DISubroutineType(types: !506)
!506 = !{!17}
!507 = !{}
!508 = distinct !DILocation(line: 429, column: 9, scope: !497)
!509 = !DILocation(line: 98, column: 36, scope: !504, inlinedAt: !508)
!510 = !DILocation(line: 430, column: 11, scope: !497)
!511 = !DILocation(line: 431, column: 5, scope: !496)
!512 = !DILocation(line: 0, scope: !496)
!513 = !DILocation(line: 428, column: 25, scope: !498)
!514 = distinct !{!514, !502, !515, !162}
!515 = !DILocation(line: 432, column: 3, scope: !499)
!516 = !DILocation(line: 98, column: 12, scope: !504, inlinedAt: !508)
!517 = !DILocation(line: 433, column: 1, scope: !487)
!518 = distinct !DISubprogram(name: "fill_array", scope: !3, file: !3, line: 435, type: !488, scopeLine: 435, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !519)
!519 = !{!520, !521, !522}
!520 = !DILocalVariable(name: "arr", arg: 1, scope: !518, file: !3, line: 435, type: !5)
!521 = !DILocalVariable(name: "size", arg: 2, scope: !518, file: !3, line: 435, type: !17)
!522 = !DILocalVariable(name: "i", scope: !518, file: !3, line: 437, type: !17)
!523 = !DILocation(line: 0, scope: !518)
!524 = !DILocalVariable(name: "seed", arg: 1, scope: !525, file: !3, line: 102, type: !17)
!525 = distinct !DISubprogram(name: "my_srand", scope: !3, file: !3, line: 102, type: !526, scopeLine: 102, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !528)
!526 = !DISubroutineType(types: !527)
!527 = !{null, !17}
!528 = !{!524}
!529 = !DILocation(line: 0, scope: !525, inlinedAt: !530)
!530 = distinct !DILocation(line: 439, column: 3, scope: !518)
!531 = !DILocation(line: 104, column: 12, scope: !525, inlinedAt: !530)
!532 = !DILocation(line: 441, column: 17, scope: !533)
!533 = distinct !DILexicalBlock(scope: !534, file: !3, line: 441, column: 3)
!534 = distinct !DILexicalBlock(scope: !518, file: !3, line: 441, column: 3)
!535 = !DILocation(line: 441, column: 3, scope: !534)
!536 = !DILocation(line: 441, column: 25, scope: !533)
!537 = !DILocation(line: 442, column: 12, scope: !538)
!538 = distinct !DILexicalBlock(scope: !533, file: !3, line: 441, column: 30)
!539 = distinct !{!539, !535, !540, !162, !541}
!540 = !DILocation(line: 443, column: 3, scope: !534)
!541 = !{!"llvm.loop.isvectorized", i32 1}
!542 = distinct !{!542, !543}
!543 = !{!"llvm.loop.unroll.disable"}
!544 = !DILocation(line: 442, column: 5, scope: !538)
!545 = distinct !{!545, !535, !540, !162, !546, !541}
!546 = !{!"llvm.loop.unroll.runtime.disable"}
!547 = !DILocation(line: 0, scope: !487, inlinedAt: !548)
!548 = distinct !DILocation(line: 446, column: 3, scope: !518)
!549 = !DILocation(line: 428, column: 3, scope: !499, inlinedAt: !548)
!550 = !DILocation(line: 98, column: 23, scope: !504, inlinedAt: !551)
!551 = distinct !DILocation(line: 429, column: 9, scope: !497, inlinedAt: !548)
!552 = !DILocation(line: 98, column: 36, scope: !504, inlinedAt: !551)
!553 = !DILocation(line: 430, column: 11, scope: !497, inlinedAt: !548)
!554 = !DILocation(line: 431, column: 5, scope: !496, inlinedAt: !548)
!555 = !DILocation(line: 0, scope: !496, inlinedAt: !548)
!556 = !DILocation(line: 428, column: 25, scope: !498, inlinedAt: !548)
!557 = distinct !{!557, !549, !558, !162}
!558 = !DILocation(line: 432, column: 3, scope: !499, inlinedAt: !548)
!559 = !DILocation(line: 98, column: 12, scope: !504, inlinedAt: !551)
!560 = !DILocation(line: 447, column: 1, scope: !518)
!561 = distinct !DISubprogram(name: "usage", scope: !3, file: !3, line: 449, type: !562, scopeLine: 449, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !507)
!562 = !DISubroutineType(types: !563)
!563 = !{!12}
!564 = !DILocation(line: 451, column: 11, scope: !561)
!565 = !{!566, !566, i64 0}
!566 = !{!"any pointer", !47, i64 0}
!567 = !DILocation(line: 451, column: 3, scope: !561)
!568 = !DILocation(line: 453, column: 11, scope: !561)
!569 = !DILocation(line: 453, column: 3, scope: !561)
!570 = !DILocation(line: 455, column: 11, scope: !561)
!571 = !DILocation(line: 455, column: 3, scope: !561)
!572 = !DILocation(line: 457, column: 11, scope: !561)
!573 = !DILocation(line: 457, column: 3, scope: !561)
!574 = !DILocation(line: 459, column: 11, scope: !561)
!575 = !DILocation(line: 459, column: 3, scope: !561)
!576 = !DILocation(line: 461, column: 11, scope: !561)
!577 = !DILocation(line: 461, column: 3, scope: !561)
!578 = !DILocation(line: 463, column: 3, scope: !561)
!579 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 469, type: !580, scopeLine: 469, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !584)
!580 = !DISubroutineType(types: !581)
!581 = !{!12, !12, !582}
!582 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !583, size: 64)
!583 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!584 = !{!585, !586, !587, !588, !589, !590, !591, !592, !593, !594, !595, !596, !598, !601, !602}
!585 = !DILocalVariable(name: "argc", arg: 1, scope: !579, file: !3, line: 469, type: !12)
!586 = !DILocalVariable(name: "argv", arg: 2, scope: !579, file: !3, line: 469, type: !582)
!587 = !DILocalVariable(name: "size", scope: !579, file: !3, line: 471, type: !7)
!588 = !DILocalVariable(name: "array", scope: !579, file: !3, line: 472, type: !5)
!589 = !DILocalVariable(name: "tmp", scope: !579, file: !3, line: 472, type: !5)
!590 = !DILocalVariable(name: "i", scope: !579, file: !3, line: 473, type: !7)
!591 = !DILocalVariable(name: "round", scope: !579, file: !3, line: 474, type: !12)
!592 = !DILocalVariable(name: "success", scope: !579, file: !3, line: 475, type: !12)
!593 = !DILocalVariable(name: "benchmark", scope: !579, file: !3, line: 475, type: !12)
!594 = !DILocalVariable(name: "help", scope: !579, file: !3, line: 475, type: !12)
!595 = !DILocalVariable(name: "check", scope: !579, file: !3, line: 475, type: !12)
!596 = !DILocalVariable(name: "r", scope: !597, file: !3, line: 505, type: !12)
!597 = distinct !DILexicalBlock(scope: !579, file: !3, line: 505, column: 3)
!598 = !DILocalVariable(name: "t1", scope: !599, file: !3, line: 511, type: !32)
!599 = distinct !DILexicalBlock(scope: !600, file: !3, line: 505, column: 30)
!600 = distinct !DILexicalBlock(scope: !597, file: !3, line: 505, column: 3)
!601 = !DILocalVariable(name: "t2", scope: !599, file: !3, line: 511, type: !32)
!602 = !DILocalVariable(name: "runtime_ms", scope: !599, file: !3, line: 515, type: !30)
!603 = !DILocation(line: 0, scope: !579)
!604 = !DILocation(line: 471, column: 3, scope: !579)
!605 = !DILocation(line: 474, column: 3, scope: !579)
!606 = !DILocation(line: 475, column: 3, scope: !579)
!607 = !DILocation(line: 478, column: 9, scope: !579)
!608 = !{!609, !609, i64 0}
!609 = !{!"int", !47, i64 0}
!610 = !DILocation(line: 479, column: 9, scope: !579)
!611 = !DILocation(line: 480, column: 8, scope: !579)
!612 = !DILocation(line: 482, column: 3, scope: !579)
!613 = !DILocation(line: 485, column: 6, scope: !614)
!614 = distinct !DILexicalBlock(scope: !579, file: !3, line: 485, column: 6)
!615 = !DILocation(line: 485, column: 6, scope: !579)
!616 = !DILocation(line: 451, column: 11, scope: !561, inlinedAt: !617)
!617 = distinct !DILocation(line: 486, column: 12, scope: !614)
!618 = !DILocation(line: 451, column: 3, scope: !561, inlinedAt: !617)
!619 = !DILocation(line: 453, column: 11, scope: !561, inlinedAt: !617)
!620 = !DILocation(line: 453, column: 3, scope: !561, inlinedAt: !617)
!621 = !DILocation(line: 455, column: 11, scope: !561, inlinedAt: !617)
!622 = !DILocation(line: 455, column: 3, scope: !561, inlinedAt: !617)
!623 = !DILocation(line: 457, column: 11, scope: !561, inlinedAt: !617)
!624 = !DILocation(line: 457, column: 3, scope: !561, inlinedAt: !617)
!625 = !DILocation(line: 459, column: 11, scope: !561, inlinedAt: !617)
!626 = !DILocation(line: 459, column: 3, scope: !561, inlinedAt: !617)
!627 = !DILocation(line: 461, column: 11, scope: !561, inlinedAt: !617)
!628 = !DILocation(line: 461, column: 3, scope: !561, inlinedAt: !617)
!629 = !DILocation(line: 486, column: 5, scope: !614)
!630 = !DILocation(line: 488, column: 6, scope: !631)
!631 = distinct !DILexicalBlock(scope: !579, file: !3, line: 488, column: 6)
!632 = !DILocation(line: 488, column: 6, scope: !579)
!633 = !DILocation(line: 491, column: 14, scope: !634)
!634 = distinct !DILexicalBlock(scope: !635, file: !3, line: 489, column: 24)
!635 = distinct !DILexicalBlock(scope: !631, file: !3, line: 488, column: 17)
!636 = !DILocation(line: 492, column: 9, scope: !634)
!637 = !DILocation(line: 494, column: 14, scope: !634)
!638 = !DILocation(line: 495, column: 9, scope: !634)
!639 = !DILocation(line: 497, column: 14, scope: !634)
!640 = !DILocation(line: 498, column: 9, scope: !634)
!641 = !DILocation(line: 503, column: 3, scope: !579)
!642 = !DILocation(line: 0, scope: !597)
!643 = !DILocation(line: 505, column: 18, scope: !600)
!644 = !DILocation(line: 505, column: 17, scope: !600)
!645 = !DILocation(line: 505, column: 3, scope: !597)
!646 = !DILocation(line: 506, column: 28, scope: !599)
!647 = !DILocation(line: 506, column: 33, scope: !599)
!648 = !DILocation(line: 506, column: 21, scope: !599)
!649 = !DILocation(line: 506, column: 13, scope: !599)
!650 = !DILocation(line: 507, column: 19, scope: !599)
!651 = !DILocation(line: 507, column: 11, scope: !599)
!652 = !DILocation(line: 0, scope: !518, inlinedAt: !653)
!653 = distinct !DILocation(line: 509, column: 5, scope: !599)
!654 = !DILocation(line: 0, scope: !525, inlinedAt: !655)
!655 = distinct !DILocation(line: 439, column: 3, scope: !518, inlinedAt: !653)
!656 = !DILocation(line: 104, column: 12, scope: !525, inlinedAt: !655)
!657 = !DILocation(line: 441, column: 17, scope: !533, inlinedAt: !653)
!658 = !DILocation(line: 441, column: 3, scope: !534, inlinedAt: !653)
!659 = !DILocation(line: 441, column: 25, scope: !533, inlinedAt: !653)
!660 = !DILocation(line: 442, column: 12, scope: !538, inlinedAt: !653)
!661 = distinct !{!661, !658, !662, !162, !541}
!662 = !DILocation(line: 443, column: 3, scope: !534, inlinedAt: !653)
!663 = distinct !{!663, !543}
!664 = !DILocation(line: 442, column: 5, scope: !538, inlinedAt: !653)
!665 = distinct !{!665, !658, !662, !162, !546, !541}
!666 = !DILocation(line: 428, column: 3, scope: !499, inlinedAt: !667)
!667 = distinct !DILocation(line: 446, column: 3, scope: !518, inlinedAt: !653)
!668 = !DILocation(line: 0, scope: !487, inlinedAt: !667)
!669 = !DILocation(line: 98, column: 23, scope: !504, inlinedAt: !670)
!670 = distinct !DILocation(line: 429, column: 9, scope: !497, inlinedAt: !667)
!671 = !DILocation(line: 98, column: 36, scope: !504, inlinedAt: !670)
!672 = !DILocation(line: 430, column: 11, scope: !497, inlinedAt: !667)
!673 = !DILocation(line: 431, column: 5, scope: !496, inlinedAt: !667)
!674 = !DILocation(line: 0, scope: !496, inlinedAt: !667)
!675 = !DILocation(line: 428, column: 25, scope: !498, inlinedAt: !667)
!676 = distinct !{!676, !666, !677, !162}
!677 = !DILocation(line: 432, column: 3, scope: !499, inlinedAt: !667)
!678 = !DILocation(line: 98, column: 12, scope: !504, inlinedAt: !670)
!679 = !DILocation(line: 511, column: 5, scope: !599)
!680 = !DILocation(line: 511, column: 20, scope: !599)
!681 = !DILocation(line: 511, column: 24, scope: !599)
!682 = !DILocation(line: 512, column: 5, scope: !599)
!683 = !DILocation(line: 513, column: 26, scope: !599)
!684 = !DILocation(line: 513, column: 5, scope: !599)
!685 = !DILocation(line: 514, column: 5, scope: !599)
!686 = !DILocation(line: 0, scope: !27, inlinedAt: !687)
!687 = distinct !DILocation(line: 515, column: 38, scope: !599)
!688 = !DILocation(line: 71, column: 16, scope: !27, inlinedAt: !687)
!689 = !DILocation(line: 71, column: 43, scope: !27, inlinedAt: !687)
!690 = !DILocation(line: 0, scope: !27, inlinedAt: !691)
!691 = distinct !DILocation(line: 515, column: 50, scope: !599)
!692 = !DILocation(line: 71, column: 16, scope: !27, inlinedAt: !691)
!693 = !DILocation(line: 71, column: 43, scope: !27, inlinedAt: !691)
!694 = !DILocation(line: 71, column: 37, scope: !27, inlinedAt: !687)
!695 = !DILocation(line: 515, column: 49, scope: !599)
!696 = !DILocation(line: 515, column: 62, scope: !599)
!697 = !DILocation(line: 0, scope: !599)
!698 = !DILocation(line: 516, column: 31, scope: !599)
!699 = !DILocation(line: 516, column: 41, scope: !599)
!700 = !DILocation(line: 516, column: 5, scope: !599)
!701 = !DILocation(line: 518, column: 8, scope: !702)
!702 = distinct !DILexicalBlock(scope: !599, file: !3, line: 518, column: 8)
!703 = !DILocation(line: 518, column: 8, scope: !599)
!704 = !DILocation(line: 519, column: 7, scope: !705)
!705 = distinct !DILexicalBlock(scope: !702, file: !3, line: 518, column: 15)
!706 = !DILocation(line: 522, column: 21, scope: !707)
!707 = distinct !DILexicalBlock(scope: !708, file: !3, line: 522, column: 7)
!708 = distinct !DILexicalBlock(scope: !705, file: !3, line: 522, column: 7)
!709 = !DILocation(line: 522, column: 7, scope: !708)
!710 = !DILocation(line: 523, column: 6, scope: !711)
!711 = distinct !DILexicalBlock(scope: !707, file: !3, line: 523, column: 6)
!712 = !DILocation(line: 523, column: 15, scope: !711)
!713 = !DILocation(line: 522, column: 29, scope: !707)
!714 = !DILocation(line: 523, column: 6, scope: !707)
!715 = distinct !{!715, !709, !716, !162}
!716 = !DILocation(line: 524, column: 14, scope: !708)
!717 = distinct !{!717, !543}
!718 = !DILocation(line: 526, column: 11, scope: !719)
!719 = distinct !DILexicalBlock(scope: !705, file: !3, line: 526, column: 10)
!720 = !DILocation(line: 526, column: 10, scope: !705)
!721 = !DILocation(line: 527, column: 10, scope: !719)
!722 = !DILocation(line: 527, column: 2, scope: !719)
!723 = !DILocation(line: 529, column: 10, scope: !719)
!724 = !DILocation(line: 529, column: 2, scope: !719)
!725 = !DILocation(line: 532, column: 13, scope: !599)
!726 = !DILocation(line: 532, column: 5, scope: !599)
!727 = !DILocation(line: 533, column: 13, scope: !599)
!728 = !DILocation(line: 533, column: 62, scope: !599)
!729 = !DILocation(line: 533, column: 5, scope: !599)
!730 = !DILocation(line: 535, column: 5, scope: !599)
!731 = !DILocation(line: 536, column: 5, scope: !599)
!732 = !DILocation(line: 537, column: 3, scope: !600)
!733 = !DILocation(line: 505, column: 26, scope: !600)
!734 = distinct !{!734, !645, !735, !162}
!735 = !DILocation(line: 537, column: 3, scope: !597)
!736 = !DILocation(line: 540, column: 1, scope: !579)
!737 = !DISubprogram(name: "get_options", scope: !738, file: !738, line: 20, type: !739, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !507)
!738 = !DIFile(filename: "./getoptions.h", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "bf060e74fdb298e4a85522e522cd3a24")
!739 = !DISubroutineType(types: !740)
!740 = !{null, !12, !582, !741, !742, null}
!741 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!742 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!743 = !DISubprogram(name: "gettimeofday", scope: !744, file: !744, line: 72, type: !745, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !507)
!744 = !DIFile(filename: "/usr/include/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b3cbcac52b1954fa045aa74bfcd1a38")
!745 = !DISubroutineType(types: !746)
!746 = !{!12, !747, !748}
!747 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !31)
!748 = !DIDerivedType(tag: DW_TAG_typedef, name: "__timezone_ptr_t", file: !744, line: 62, baseType: !749)
!749 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !750)
!750 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !751, size: 64)
!751 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !744, line: 56, size: 64, elements: !752)
!752 = !{!753, !754}
!753 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !751, file: !744, line: 58, baseType: !12, size: 32)
!754 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !751, file: !744, line: 59, baseType: !12, size: 32, offset: 32)
