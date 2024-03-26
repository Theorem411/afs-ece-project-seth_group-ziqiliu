; ModuleID = 'matmul.c'
source_filename = "matmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@rand_nxt = dso_local local_unnamed_addr global i64 0, align 8, !dbg !0
@.str = private unnamed_addr constant [5 x i8] c"%f  \00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"-n\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"-rc\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"-h\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"-r\00", align 1
@specifiers = dso_local global [6 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* null], align 16, !dbg !10
@opt_types = dso_local global [6 x i32] [i32 1, i32 4, i32 4, i32 4, i32 1, i32 0], align 16, !dbg !18
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [58 x i8] c"Usage: matmul [-n size] [-c] [-rc] [-h] [<cilk options>]\0A\00", align 1
@.str.8 = private unnamed_addr constant [70 x i8] c"if -c is set, check result against iterative matrix multiply O(n^3).\0A\00", align 1
@.str.9 = private unnamed_addr constant [80 x i8] c"if -rc is set, check result against randomlized algo. due to Freivalds O(n^2).\0A\00", align 1
@.str.10 = private unnamed_addr constant [59 x i8] c"\0ACalculate using recursive method ... (timing start here)\0A\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"PBBS-time: %f\0A\00", align 1
@.str.12 = private unnamed_addr constant [20 x i8] c"Max error     = %g\0A\00", align 1
@.str.13 = private unnamed_addr constant [23 x i8] c"\0ACilk Example: matmul\0A\00", align 1
@.str.14 = private unnamed_addr constant [20 x i8] c"Options: size = %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i64 @todval(%struct.timeval* nocapture noundef readonly %tp) local_unnamed_addr #0 !dbg !28 {
entry:
  call void @llvm.dbg.value(metadata %struct.timeval* %tp, metadata !43, metadata !DIExpression()), !dbg !44
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 0, !dbg !45
  %0 = load i64, i64* %tv_sec, align 8, !dbg !45, !tbaa !46
  %mul1 = mul i64 %0, 1000000, !dbg !51
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 1, !dbg !52
  %1 = load i64, i64* %tv_usec, align 8, !dbg !52, !tbaa !53
  %add = add nsw i64 %mul1, %1, !dbg !54
  ret i64 %add, !dbg !55
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable writeonly
define dso_local void @startup_cilk() local_unnamed_addr #2 !dbg !56 {
entry:
  %g = alloca double, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !68
  %g.0.g.0.g.0..sroa_cast = bitcast double* %g to i8*, !dbg !69
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !69
  call void @llvm.dbg.value(metadata double 2.000000e+00, metadata !60, metadata !DIExpression()), !dbg !68
  store double 2.000000e+00, double* %g, align 8, !dbg !70, !tbaa !71
  call void @llvm.dbg.value(metadata i32 0, metadata !61, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 1000, metadata !63, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 0, metadata !64, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i32 1000, metadata !65, metadata !DIExpression()), !dbg !73
  br label %pfor.cond, !dbg !74

pfor.cond:                                        ; preds = %pfor.inc, %entry
  %__begin.0 = phi i32 [ 0, %entry ], [ %inc, %pfor.inc ], !dbg !73
  call void @llvm.dbg.value(metadata i32 %__begin.0, metadata !64, metadata !DIExpression()), !dbg !73
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc, !dbg !75

pfor.body.entry:                                  ; preds = %pfor.cond
  call void @llvm.dbg.value(metadata !DIArgList(i32 0, i32 %__begin.0), metadata !66, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !76
  %g.0.g.0.g.0. = load double, double* %g, align 8, !dbg !77, !tbaa !71
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !60, metadata !DIExpression()), !dbg !68
  %call = tail call double @sin(double noundef %g.0.g.0.g.0.) #22, !dbg !79
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !60, metadata !DIExpression()), !dbg !68
  %div3 = fdiv double %g.0.g.0.g.0., %call, !dbg !80
  call void @llvm.dbg.value(metadata double %div3, metadata !60, metadata !DIExpression()), !dbg !68
  store double %div3, double* %g, align 8, !dbg !80, !tbaa !71
  reattach within %syncreg, label %pfor.inc, !dbg !81

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %inc = add nuw nsw i32 %__begin.0, 1, !dbg !82
  call void @llvm.dbg.value(metadata i32 %inc, metadata !64, metadata !DIExpression()), !dbg !73
  %exitcond.not = icmp eq i32 %inc, 1000, !dbg !83
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !dbg !84, !llvm.loop !85

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %cleanup, !dbg !84

cleanup:                                          ; preds = %pfor.cond.cleanup
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !88
  ret void, !dbg !88
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare token @llvm.syncregion.start() #4

; Function Attrs: mustprogress nofree nounwind willreturn writeonly
declare dso_local double @sin(double noundef) local_unnamed_addr #5

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local i32 @cilk_rand() local_unnamed_addr #6 !dbg !89 {
entry:
  %0 = load i64, i64* @rand_nxt, align 8, !dbg !94, !tbaa !95
  %mul = mul i64 %0, 1103515245, !dbg !96
  %add = add i64 %mul, 12345, !dbg !97
  store i64 %add, i64* @rand_nxt, align 8, !dbg !98, !tbaa !95
  %shr = lshr i64 %add, 16, !dbg !99
  %1 = trunc i64 %shr to i32, !dbg !100
  %conv = and i32 %1, 2147483647, !dbg !100
  call void @llvm.dbg.value(metadata i32 %conv, metadata !93, metadata !DIExpression()), !dbg !101
  ret i32 %conv, !dbg !102
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind uwtable writeonly
define dso_local void @zero_vec(float* nocapture noundef writeonly %V, i32 noundef %n) local_unnamed_addr #7 !dbg !103 {
entry:
  call void @llvm.dbg.value(metadata float* %V, metadata !107, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata i32 %n, metadata !108, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata i32 0, metadata !109, metadata !DIExpression()), !dbg !110
  %cmp4 = icmp sgt i32 %n, 0, !dbg !111
  br i1 %cmp4, label %for.body.preheader, label %for.end, !dbg !114

for.body.preheader:                               ; preds = %entry
  %V6 = bitcast float* %V to i8*, !dbg !111
  %0 = zext i32 %n to i64, !dbg !114
  %1 = shl nuw nsw i64 %0, 2, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 4 %V6, i8 0, i64 %1, i1 false), !dbg !115, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.value(metadata i32 undef, metadata !109, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !110
  br label %for.end, !dbg !119

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void, !dbg !119
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @init_vec(float* nocapture noundef writeonly %V, i32 noundef %n) local_unnamed_addr #8 !dbg !120 {
entry:
  call void @llvm.dbg.value(metadata float* %V, metadata !122, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i32 %n, metadata !123, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i32 0, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i32 0, metadata !124, metadata !DIExpression()), !dbg !125
  %cmp5 = icmp sgt i32 %n, 0, !dbg !126
  br i1 %cmp5, label %for.body.preheader, label %for.end, !dbg !129

for.body.preheader:                               ; preds = %entry
  %rand_nxt.promoted = load i64, i64* @rand_nxt, align 8, !tbaa !95
  %wide.trip.count = zext i32 %n to i64, !dbg !126
  %xtraiter = and i64 %wide.trip.count, 1, !dbg !129
  %0 = icmp eq i32 %n, 1, !dbg !129
  br i1 %0, label %for.cond.for.end_crit_edge.unr-lcssa, label %for.body.preheader.new, !dbg !129

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %wide.trip.count, 4294967294, !dbg !129
  br label %for.body, !dbg !129

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %indvars.iv = phi i64 [ 0, %for.body.preheader.new ], [ %indvars.iv.next.1, %for.body ]
  %add.i46 = phi i64 [ %rand_nxt.promoted, %for.body.preheader.new ], [ %add.i.1, %for.body ]
  %niter = phi i64 [ 0, %for.body.preheader.new ], [ %niter.next.1, %for.body ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !124, metadata !DIExpression()), !dbg !125
  %mul.i = mul i64 %add.i46, 1103515245, !dbg !130
  %add.i = add i64 %mul.i, 12345, !dbg !133
  %shr.i = lshr i64 %add.i, 16, !dbg !134
  %1 = trunc i64 %shr.i to i32, !dbg !135
  %conv.i = and i32 %1, 2147483647, !dbg !135
  call void @llvm.dbg.value(metadata i32 %conv.i, metadata !93, metadata !DIExpression()), !dbg !136
  %conv = sitofp i32 %conv.i to float, !dbg !137
  %arrayidx = getelementptr inbounds float, float* %V, i64 %indvars.iv, !dbg !138
  store float %conv, float* %arrayidx, align 4, !dbg !139, !tbaa !117
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !140
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !124, metadata !DIExpression()), !dbg !125
  %mul.i.1 = mul i64 %add.i, 1103515245, !dbg !130
  %add.i.1 = add i64 %mul.i.1, 12345, !dbg !133
  %shr.i.1 = lshr i64 %add.i.1, 16, !dbg !134
  %2 = trunc i64 %shr.i.1 to i32, !dbg !135
  %conv.i.1 = and i32 %2, 2147483647, !dbg !135
  call void @llvm.dbg.value(metadata i32 %conv.i.1, metadata !93, metadata !DIExpression()), !dbg !136
  %conv.1 = sitofp i32 %conv.i.1 to float, !dbg !137
  %arrayidx.1 = getelementptr inbounds float, float* %V, i64 %indvars.iv.next, !dbg !138
  store float %conv.1, float* %arrayidx.1, align 4, !dbg !139, !tbaa !117
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !140
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1, metadata !124, metadata !DIExpression()), !dbg !125
  %niter.next.1 = add i64 %niter, 2, !dbg !129
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !129
  br i1 %niter.ncmp.1, label %for.cond.for.end_crit_edge.unr-lcssa, label %for.body, !dbg !129, !llvm.loop !141

for.cond.for.end_crit_edge.unr-lcssa:             ; preds = %for.body, %for.body.preheader
  %add.i.lcssa.ph = phi i64 [ undef, %for.body.preheader ], [ %add.i.1, %for.body ]
  %indvars.iv.unr = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next.1, %for.body ]
  %add.i46.unr = phi i64 [ %rand_nxt.promoted, %for.body.preheader ], [ %add.i.1, %for.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !129
  br i1 %lcmp.mod.not, label %for.cond.for.end_crit_edge, label %for.body.epil, !dbg !129

for.body.epil:                                    ; preds = %for.cond.for.end_crit_edge.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !124, metadata !DIExpression()), !dbg !125
  %mul.i.epil = mul i64 %add.i46.unr, 1103515245, !dbg !130
  %add.i.epil = add i64 %mul.i.epil, 12345, !dbg !133
  %shr.i.epil = lshr i64 %add.i.epil, 16, !dbg !134
  %3 = trunc i64 %shr.i.epil to i32, !dbg !135
  %conv.i.epil = and i32 %3, 2147483647, !dbg !135
  call void @llvm.dbg.value(metadata i32 %conv.i.epil, metadata !93, metadata !DIExpression()), !dbg !136
  %conv.epil = sitofp i32 %conv.i.epil to float, !dbg !137
  %arrayidx.epil = getelementptr inbounds float, float* %V, i64 %indvars.iv.unr, !dbg !138
  store float %conv.epil, float* %arrayidx.epil, align 4, !dbg !139, !tbaa !117
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !124, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !125
  br label %for.cond.for.end_crit_edge, !dbg !144

for.cond.for.end_crit_edge:                       ; preds = %for.cond.for.end_crit_edge.unr-lcssa, %for.body.epil
  %add.i.lcssa = phi i64 [ %add.i.lcssa.ph, %for.cond.for.end_crit_edge.unr-lcssa ], [ %add.i.epil, %for.body.epil ], !dbg !133
  store i64 %add.i.lcssa, i64* @rand_nxt, align 8, !dbg !144, !tbaa !95
  br label %for.end, !dbg !129

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret void, !dbg !145
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly uwtable
define dso_local double @maxerror_vec(float* nocapture noundef readonly %V1, float* nocapture noundef readonly %V2, i32 noundef %n) local_unnamed_addr #9 !dbg !146 {
entry:
  call void @llvm.dbg.value(metadata float* %V1, metadata !150, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.value(metadata float* %V2, metadata !151, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.value(metadata i32 %n, metadata !152, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !154, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.value(metadata i32 0, metadata !153, metadata !DIExpression()), !dbg !156
  %cmp23 = icmp sgt i32 %n, 0, !dbg !157
  br i1 %cmp23, label %for.body.preheader, label %for.end, !dbg !160

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64, !dbg !157
  br label %for.body, !dbg !160

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %err.025 = phi double [ 0.000000e+00, %for.body.preheader ], [ %err.1, %for.body ]
  call void @llvm.dbg.value(metadata double %err.025, metadata !154, metadata !DIExpression()), !dbg !156
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !153, metadata !DIExpression()), !dbg !156
  %arrayidx = getelementptr inbounds float, float* %V1, i64 %indvars.iv, !dbg !161
  %0 = load float, float* %arrayidx, align 4, !dbg !161, !tbaa !117
  %arrayidx2 = getelementptr inbounds float, float* %V2, i64 %indvars.iv, !dbg !163
  %1 = load float, float* %arrayidx2, align 4, !dbg !163, !tbaa !117
  %sub = fsub float %0, %1, !dbg !164
  %div = fdiv float %sub, %0, !dbg !165
  %conv = fpext float %div to double, !dbg !166
  call void @llvm.dbg.value(metadata double %conv, metadata !155, metadata !DIExpression()), !dbg !156
  %cmp5 = fcmp olt float %div, 0.000000e+00, !dbg !167
  %fneg = fneg double %conv, !dbg !169
  %diff.0 = select i1 %cmp5, double %fneg, double %conv, !dbg !169
  call void @llvm.dbg.value(metadata double %diff.0, metadata !155, metadata !DIExpression()), !dbg !156
  %cmp7 = fcmp ogt double %diff.0, %err.025, !dbg !170
  %err.1 = select i1 %cmp7, double %diff.0, double %err.025, !dbg !172
  call void @llvm.dbg.value(metadata double %err.1, metadata !154, metadata !DIExpression()), !dbg !156
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !173
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !153, metadata !DIExpression()), !dbg !156
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !157
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !160, !llvm.loop !174

for.end:                                          ; preds = %for.body, %entry
  %err.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %err.1, %for.body ], !dbg !156
  ret double %err.0.lcssa, !dbg !176
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly uwtable
define dso_local double @sum_diff_vec(float* nocapture noundef readonly %V1, float* nocapture noundef readonly %V2, i32 noundef %n) local_unnamed_addr #9 !dbg !177 {
entry:
  call void @llvm.dbg.value(metadata float* %V1, metadata !179, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.value(metadata float* %V2, metadata !180, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.value(metadata i32 %n, metadata !181, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !183, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.value(metadata i32 0, metadata !182, metadata !DIExpression()), !dbg !185
  %cmp18 = icmp sgt i32 %n, 0, !dbg !186
  br i1 %cmp18, label %for.body.preheader, label %for.end, !dbg !189

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64, !dbg !186
  %xtraiter = and i64 %wide.trip.count, 1, !dbg !189
  %0 = icmp eq i32 %n, 1, !dbg !189
  br i1 %0, label %for.end.loopexit.unr-lcssa, label %for.body.preheader.new, !dbg !189

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %wide.trip.count, 4294967294, !dbg !189
  br label %for.body, !dbg !189

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %indvars.iv = phi i64 [ 0, %for.body.preheader.new ], [ %indvars.iv.next.1, %for.body ]
  %err.020 = phi double [ 0.000000e+00, %for.body.preheader.new ], [ %add.1, %for.body ]
  %niter = phi i64 [ 0, %for.body.preheader.new ], [ %niter.next.1, %for.body ]
  call void @llvm.dbg.value(metadata double %err.020, metadata !183, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !182, metadata !DIExpression()), !dbg !185
  %arrayidx = getelementptr inbounds float, float* %V1, i64 %indvars.iv, !dbg !190
  %1 = load float, float* %arrayidx, align 4, !dbg !190, !tbaa !117
  %arrayidx2 = getelementptr inbounds float, float* %V2, i64 %indvars.iv, !dbg !192
  %2 = load float, float* %arrayidx2, align 4, !dbg !192, !tbaa !117
  %sub = fsub float %1, %2, !dbg !193
  %div = fdiv float %sub, %1, !dbg !194
  %conv = fpext float %div to double, !dbg !195
  call void @llvm.dbg.value(metadata double %conv, metadata !184, metadata !DIExpression()), !dbg !185
  %cmp5 = fcmp olt float %div, 0.000000e+00, !dbg !196
  %fneg = fneg double %conv, !dbg !198
  %diff.0 = select i1 %cmp5, double %fneg, double %conv, !dbg !198
  call void @llvm.dbg.value(metadata double %diff.0, metadata !184, metadata !DIExpression()), !dbg !185
  %add = fadd double %err.020, %diff.0, !dbg !199
  call void @llvm.dbg.value(metadata double %add, metadata !183, metadata !DIExpression()), !dbg !185
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !200
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !182, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.value(metadata double %add, metadata !183, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !182, metadata !DIExpression()), !dbg !185
  %arrayidx.1 = getelementptr inbounds float, float* %V1, i64 %indvars.iv.next, !dbg !190
  %3 = load float, float* %arrayidx.1, align 4, !dbg !190, !tbaa !117
  %arrayidx2.1 = getelementptr inbounds float, float* %V2, i64 %indvars.iv.next, !dbg !192
  %4 = load float, float* %arrayidx2.1, align 4, !dbg !192, !tbaa !117
  %sub.1 = fsub float %3, %4, !dbg !193
  %div.1 = fdiv float %sub.1, %3, !dbg !194
  %conv.1 = fpext float %div.1 to double, !dbg !195
  call void @llvm.dbg.value(metadata double %conv.1, metadata !184, metadata !DIExpression()), !dbg !185
  %cmp5.1 = fcmp olt float %div.1, 0.000000e+00, !dbg !196
  %fneg.1 = fneg double %conv.1, !dbg !198
  %diff.0.1 = select i1 %cmp5.1, double %fneg.1, double %conv.1, !dbg !198
  call void @llvm.dbg.value(metadata double %diff.0.1, metadata !184, metadata !DIExpression()), !dbg !185
  %add.1 = fadd double %add, %diff.0.1, !dbg !199
  call void @llvm.dbg.value(metadata double %add.1, metadata !183, metadata !DIExpression()), !dbg !185
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !200
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1, metadata !182, metadata !DIExpression()), !dbg !185
  %niter.next.1 = add i64 %niter, 2, !dbg !189
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !189
  br i1 %niter.ncmp.1, label %for.end.loopexit.unr-lcssa, label %for.body, !dbg !189, !llvm.loop !201

for.end.loopexit.unr-lcssa:                       ; preds = %for.body, %for.body.preheader
  %add.lcssa.ph = phi double [ undef, %for.body.preheader ], [ %add.1, %for.body ]
  %indvars.iv.unr = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next.1, %for.body ]
  %err.020.unr = phi double [ 0.000000e+00, %for.body.preheader ], [ %add.1, %for.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !189
  br i1 %lcmp.mod.not, label %for.end, label %for.body.epil, !dbg !189

for.body.epil:                                    ; preds = %for.end.loopexit.unr-lcssa
  call void @llvm.dbg.value(metadata double %err.020.unr, metadata !183, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !182, metadata !DIExpression()), !dbg !185
  %arrayidx.epil = getelementptr inbounds float, float* %V1, i64 %indvars.iv.unr, !dbg !190
  %5 = load float, float* %arrayidx.epil, align 4, !dbg !190, !tbaa !117
  %arrayidx2.epil = getelementptr inbounds float, float* %V2, i64 %indvars.iv.unr, !dbg !192
  %6 = load float, float* %arrayidx2.epil, align 4, !dbg !192, !tbaa !117
  %sub.epil = fsub float %5, %6, !dbg !193
  %div.epil = fdiv float %sub.epil, %5, !dbg !194
  %conv.epil = fpext float %div.epil to double, !dbg !195
  call void @llvm.dbg.value(metadata double %conv.epil, metadata !184, metadata !DIExpression()), !dbg !185
  %cmp5.epil = fcmp olt float %div.epil, 0.000000e+00, !dbg !196
  %fneg.epil = fneg double %conv.epil, !dbg !198
  %diff.0.epil = select i1 %cmp5.epil, double %fneg.epil, double %conv.epil, !dbg !198
  call void @llvm.dbg.value(metadata double %diff.0.epil, metadata !184, metadata !DIExpression()), !dbg !185
  %add.epil = fadd double %err.020.unr, %diff.0.epil, !dbg !199
  call void @llvm.dbg.value(metadata double %add.epil, metadata !183, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !182, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !185
  br label %for.end, !dbg !203

for.end:                                          ; preds = %for.body.epil, %for.end.loopexit.unr-lcssa, %entry
  %err.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add.lcssa.ph, %for.end.loopexit.unr-lcssa ], [ %add.epil, %for.body.epil ], !dbg !185
  ret double %err.0.lcssa, !dbg !203
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @print_vec(float* nocapture noundef readonly %V, i32 noundef %n) local_unnamed_addr #10 !dbg !204 {
entry:
  call void @llvm.dbg.value(metadata float* %V, metadata !206, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i32 %n, metadata !207, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i32 0, metadata !208, metadata !DIExpression()), !dbg !209
  %cmp4 = icmp sgt i32 %n, 0, !dbg !210
  br i1 %cmp4, label %for.body.preheader, label %for.end, !dbg !213

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64, !dbg !210
  br label %for.body, !dbg !213

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !208, metadata !DIExpression()), !dbg !209
  %arrayidx = getelementptr inbounds float, float* %V, i64 %indvars.iv, !dbg !214
  %0 = load float, float* %arrayidx, align 4, !dbg !214, !tbaa !117
  %conv = fpext float %0 to double, !dbg !214
  %call = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), double noundef %conv), !dbg !216
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !217
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !208, metadata !DIExpression()), !dbg !209
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !210
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !213, !llvm.loop !218

for.end:                                          ; preds = %for.body, %entry
  ret void, !dbg !220
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #11

; Function Attrs: nofree nounwind uwtable
define dso_local void @print_matrix(float* nocapture noundef readonly %A, i32 noundef %n, i32 noundef %ld) local_unnamed_addr #10 !dbg !221 {
entry:
  call void @llvm.dbg.value(metadata float* %A, metadata !225, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.value(metadata i32 %n, metadata !226, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.value(metadata i32 %ld, metadata !227, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.value(metadata i32 0, metadata !228, metadata !DIExpression()), !dbg !230
  %cmp17 = icmp sgt i32 %n, 0, !dbg !231
  br i1 %cmp17, label %for.cond1.preheader.us.preheader, label %for.end7, !dbg !234

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = sext i32 %ld to i64, !dbg !234
  %wide.trip.count26 = zext i32 %n to i64, !dbg !231
  br label %for.cond1.preheader.us, !dbg !234

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.end_crit_edge.us
  %indvars.iv22 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next23, %for.cond1.for.end_crit_edge.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv22, metadata !228, metadata !DIExpression()), !dbg !230
  call void @llvm.dbg.value(metadata i32 0, metadata !229, metadata !DIExpression()), !dbg !230
  %1 = mul nsw i64 %indvars.iv22, %0
  br label %for.body3.us, !dbg !235

for.body3.us:                                     ; preds = %for.cond1.preheader.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.body3.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !229, metadata !DIExpression()), !dbg !230
  %2 = add nsw i64 %indvars.iv, %1, !dbg !238
  %arrayidx.us = getelementptr inbounds float, float* %A, i64 %2, !dbg !241
  %3 = load float, float* %arrayidx.us, align 4, !dbg !241, !tbaa !117
  %conv.us = fpext float %3 to double, !dbg !241
  %call.us = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), double noundef %conv.us), !dbg !242
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !243
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !229, metadata !DIExpression()), !dbg !230
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count26, !dbg !244
  br i1 %exitcond.not, label %for.cond1.for.end_crit_edge.us, label %for.body3.us, !dbg !235, !llvm.loop !245

for.cond1.for.end_crit_edge.us:                   ; preds = %for.body3.us
  %putchar.us = tail call i32 @putchar(i32 10), !dbg !247
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1, !dbg !248
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next23, metadata !228, metadata !DIExpression()), !dbg !230
  %exitcond27.not = icmp eq i64 %indvars.iv.next23, %wide.trip.count26, !dbg !231
  br i1 %exitcond27.not, label %for.end7, label %for.cond1.preheader.us, !dbg !234, !llvm.loop !249

for.end7:                                         ; preds = %for.cond1.for.end_crit_edge.us, %entry
  ret void, !dbg !251
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind uwtable writeonly
define dso_local void @zero(float* nocapture noundef writeonly %A, i32 noundef %n) local_unnamed_addr #7 !dbg !252 {
entry:
  call void @llvm.dbg.value(metadata float* %A, metadata !254, metadata !DIExpression()), !dbg !258
  call void @llvm.dbg.value(metadata i32 %n, metadata !255, metadata !DIExpression()), !dbg !258
  call void @llvm.dbg.value(metadata i32 0, metadata !256, metadata !DIExpression()), !dbg !258
  %cmp17 = icmp sgt i32 %n, 0, !dbg !259
  br i1 %cmp17, label %for.cond1.preheader.us.preheader, label %for.end6, !dbg !262

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %A23 = bitcast float* %A to i8*, !dbg !259
  %0 = zext i32 %n to i64, !dbg !262
  %1 = mul nuw nsw i64 %0, %0, !dbg !262
  %2 = shl nuw i64 %1, 2, !dbg !262
  call void @llvm.memset.p0i8.i64(i8* align 4 %A23, i8 0, i64 %2, i1 false), !dbg !263, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !256, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !258
  call void @llvm.dbg.value(metadata i32 undef, metadata !257, metadata !DIExpression()), !dbg !258
  call void @llvm.dbg.value(metadata i32 undef, metadata !257, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !258
  call void @llvm.dbg.value(metadata i32 undef, metadata !256, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !258
  br label %for.end6, !dbg !268

for.end6:                                         ; preds = %for.cond1.preheader.us.preheader, %entry
  ret void, !dbg !268
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @init(float* nocapture noundef writeonly %A, i32 noundef %n) local_unnamed_addr #8 !dbg !269 {
entry:
  call void @llvm.dbg.value(metadata float* %A, metadata !271, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i32 %n, metadata !272, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i32 0, metadata !273, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i32 0, metadata !273, metadata !DIExpression()), !dbg !275
  %cmp24 = icmp sgt i32 %n, 0, !dbg !276
  br i1 %cmp24, label %for.cond1.preheader.us.preheader, label %for.end7, !dbg !279

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %rand_nxt.promoted21 = load i64, i64* @rand_nxt, align 8, !tbaa !95
  %0 = zext i32 %n to i64, !dbg !279
  %xtraiter = and i64 %0, 1
  %1 = icmp eq i32 %n, 1
  %unroll_iter = and i64 %0, 4294967294
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for.cond1.preheader.us, !dbg !279

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc5_crit_edge.us
  %indvars.iv30 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next31, %for.cond1.for.inc5_crit_edge.us ]
  %add.i.lcssa2325.us = phi i64 [ %rand_nxt.promoted21, %for.cond1.preheader.us.preheader ], [ %add.i.us.lcssa, %for.cond1.for.inc5_crit_edge.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv30, metadata !273, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i32 0, metadata !274, metadata !DIExpression()), !dbg !275
  %2 = mul nsw i64 %indvars.iv30, %0
  br i1 %1, label %for.cond1.for.inc5_crit_edge.us.unr-lcssa, label %for.body3.us, !dbg !280

for.body3.us:                                     ; preds = %for.cond1.preheader.us, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %add.i1618.us = phi i64 [ %add.i.us.1, %for.body3.us ], [ %add.i.lcssa2325.us, %for.cond1.preheader.us ]
  %niter = phi i64 [ %niter.next.1, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !274, metadata !DIExpression()), !dbg !275
  %mul.i.us = mul i64 %add.i1618.us, 1103515245, !dbg !283
  %add.i.us = add i64 %mul.i.us, 12345, !dbg !287
  %shr.i.us = lshr i64 %add.i.us, 16, !dbg !288
  %3 = trunc i64 %shr.i.us to i32, !dbg !289
  %conv.i.us = and i32 %3, 2147483647, !dbg !289
  call void @llvm.dbg.value(metadata i32 %conv.i.us, metadata !93, metadata !DIExpression()), !dbg !290
  %conv4.us = sitofp i32 %conv.i.us to float, !dbg !291
  %4 = add nuw nsw i64 %indvars.iv, %2, !dbg !292
  %arrayidx.us = getelementptr inbounds float, float* %A, i64 %4, !dbg !293
  store float %conv4.us, float* %arrayidx.us, align 4, !dbg !294, !tbaa !117
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !295
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !274, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !274, metadata !DIExpression()), !dbg !275
  %mul.i.us.1 = mul i64 %add.i.us, 1103515245, !dbg !283
  %add.i.us.1 = add i64 %mul.i.us.1, 12345, !dbg !287
  %shr.i.us.1 = lshr i64 %add.i.us.1, 16, !dbg !288
  %5 = trunc i64 %shr.i.us.1 to i32, !dbg !289
  %conv.i.us.1 = and i32 %5, 2147483647, !dbg !289
  call void @llvm.dbg.value(metadata i32 %conv.i.us.1, metadata !93, metadata !DIExpression()), !dbg !290
  %conv4.us.1 = sitofp i32 %conv.i.us.1 to float, !dbg !291
  %6 = add nuw nsw i64 %indvars.iv.next, %2, !dbg !292
  %arrayidx.us.1 = getelementptr inbounds float, float* %A, i64 %6, !dbg !293
  store float %conv4.us.1, float* %arrayidx.us.1, align 4, !dbg !294, !tbaa !117
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !295
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1, metadata !274, metadata !DIExpression()), !dbg !275
  %niter.next.1 = add i64 %niter, 2, !dbg !280
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !280
  br i1 %niter.ncmp.1, label %for.cond1.for.inc5_crit_edge.us.unr-lcssa, label %for.body3.us, !dbg !280, !llvm.loop !296

for.cond1.for.inc5_crit_edge.us.unr-lcssa:        ; preds = %for.body3.us, %for.cond1.preheader.us
  %add.i.us.lcssa.ph = phi i64 [ undef, %for.cond1.preheader.us ], [ %add.i.us.1, %for.body3.us ]
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.1, %for.body3.us ]
  %add.i1618.us.unr = phi i64 [ %add.i.lcssa2325.us, %for.cond1.preheader.us ], [ %add.i.us.1, %for.body3.us ]
  br i1 %lcmp.mod.not, label %for.cond1.for.inc5_crit_edge.us, label %for.body3.us.epil, !dbg !280

for.body3.us.epil:                                ; preds = %for.cond1.for.inc5_crit_edge.us.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !274, metadata !DIExpression()), !dbg !275
  %mul.i.us.epil = mul i64 %add.i1618.us.unr, 1103515245, !dbg !283
  %add.i.us.epil = add i64 %mul.i.us.epil, 12345, !dbg !287
  %shr.i.us.epil = lshr i64 %add.i.us.epil, 16, !dbg !288
  %7 = trunc i64 %shr.i.us.epil to i32, !dbg !289
  %conv.i.us.epil = and i32 %7, 2147483647, !dbg !289
  call void @llvm.dbg.value(metadata i32 %conv.i.us.epil, metadata !93, metadata !DIExpression()), !dbg !290
  %conv4.us.epil = sitofp i32 %conv.i.us.epil to float, !dbg !291
  %8 = add nuw nsw i64 %indvars.iv.unr, %2, !dbg !292
  %arrayidx.us.epil = getelementptr inbounds float, float* %A, i64 %8, !dbg !293
  store float %conv4.us.epil, float* %arrayidx.us.epil, align 4, !dbg !294, !tbaa !117
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !274, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !275
  br label %for.cond1.for.inc5_crit_edge.us, !dbg !298

for.cond1.for.inc5_crit_edge.us:                  ; preds = %for.cond1.for.inc5_crit_edge.us.unr-lcssa, %for.body3.us.epil
  %add.i.us.lcssa = phi i64 [ %add.i.us.lcssa.ph, %for.cond1.for.inc5_crit_edge.us.unr-lcssa ], [ %add.i.us.epil, %for.body3.us.epil ], !dbg !287
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1, !dbg !298
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next31, metadata !273, metadata !DIExpression()), !dbg !275
  %exitcond35.not = icmp eq i64 %indvars.iv.next31, %0, !dbg !276
  br i1 %exitcond35.not, label %for.cond.for.end7_crit_edge.split.us, label %for.cond1.preheader.us, !dbg !279, !llvm.loop !299

for.cond.for.end7_crit_edge.split.us:             ; preds = %for.cond1.for.inc5_crit_edge.us
  store i64 %add.i.us.lcssa, i64* @rand_nxt, align 8, !dbg !301, !tbaa !95
  br label %for.end7, !dbg !279

for.end7:                                         ; preds = %for.cond.for.end7_crit_edge.split.us, %entry
  ret void, !dbg !302
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly uwtable
define dso_local double @maxerror(float* nocapture noundef readonly %A, float* nocapture noundef readonly %B, i32 noundef %n) local_unnamed_addr #9 !dbg !303 {
entry:
  call void @llvm.dbg.value(metadata float* %A, metadata !305, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.value(metadata float* %B, metadata !306, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.value(metadata i32 %n, metadata !307, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !310, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.value(metadata i32 0, metadata !308, metadata !DIExpression()), !dbg !318
  %cmp45 = icmp sgt i32 %n, 0, !dbg !319
  br i1 %cmp45, label %for.cond1.preheader.us.preheader, label %for.end20, !dbg !320

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = zext i32 %n to i64, !dbg !320
  br label %for.cond1.preheader.us, !dbg !320

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc18_crit_edge.us
  %indvars.iv52 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next53, %for.cond1.for.inc18_crit_edge.us ]
  %error.048.us = phi double [ 0.000000e+00, %for.cond1.preheader.us.preheader ], [ %error.2.us, %for.cond1.for.inc18_crit_edge.us ]
  call void @llvm.dbg.value(metadata double %error.048.us, metadata !310, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv52, metadata !308, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.value(metadata double %error.048.us, metadata !310, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.value(metadata i32 0, metadata !309, metadata !DIExpression()), !dbg !318
  %1 = mul nsw i64 %indvars.iv52, %0
  br label %for.body3.us, !dbg !321

for.body3.us:                                     ; preds = %for.cond1.preheader.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.body3.us ]
  %error.144.us = phi double [ %error.048.us, %for.cond1.preheader.us ], [ %error.2.us, %for.body3.us ]
  call void @llvm.dbg.value(metadata double %error.144.us, metadata !310, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !309, metadata !DIExpression()), !dbg !318
  %2 = add nuw nsw i64 %indvars.iv, %1, !dbg !322
  %arrayidx.us = getelementptr inbounds float, float* %A, i64 %2, !dbg !323
  %3 = load float, float* %arrayidx.us, align 4, !dbg !323, !tbaa !117
  %arrayidx7.us = getelementptr inbounds float, float* %B, i64 %2, !dbg !324
  %4 = load float, float* %arrayidx7.us, align 4, !dbg !324, !tbaa !117
  %sub.us = fsub float %3, %4, !dbg !325
  %div.us = fdiv float %sub.us, %3, !dbg !326
  %conv.us = fpext float %div.us to double, !dbg !327
  call void @llvm.dbg.value(metadata double %conv.us, metadata !311, metadata !DIExpression()), !dbg !328
  %cmp12.us = fcmp olt float %div.us, 0.000000e+00, !dbg !329
  %fneg.us = fneg double %conv.us, !dbg !331
  %diff.0.us = select i1 %cmp12.us, double %fneg.us, double %conv.us, !dbg !331
  call void @llvm.dbg.value(metadata double %diff.0.us, metadata !311, metadata !DIExpression()), !dbg !328
  %cmp14.us = fcmp ogt double %diff.0.us, %error.144.us, !dbg !332
  %error.2.us = select i1 %cmp14.us, double %diff.0.us, double %error.144.us, !dbg !334
  call void @llvm.dbg.value(metadata double %error.2.us, metadata !310, metadata !DIExpression()), !dbg !318
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !335
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !309, metadata !DIExpression()), !dbg !318
  %exitcond.not = icmp eq i64 %indvars.iv.next, %0, !dbg !336
  br i1 %exitcond.not, label %for.cond1.for.inc18_crit_edge.us, label %for.body3.us, !dbg !321, !llvm.loop !337

for.cond1.for.inc18_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1, !dbg !339
  call void @llvm.dbg.value(metadata double undef, metadata !310, metadata !DIExpression()), !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next53, metadata !308, metadata !DIExpression()), !dbg !318
  %exitcond57.not = icmp eq i64 %indvars.iv.next53, %0, !dbg !319
  br i1 %exitcond57.not, label %for.end20, label %for.cond1.preheader.us, !dbg !320, !llvm.loop !340

for.end20:                                        ; preds = %for.cond1.for.inc18_crit_edge.us, %entry
  %error.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %error.2.us, %for.cond1.for.inc18_crit_edge.us ], !dbg !342
  ret double %error.0.lcssa, !dbg !343
}

; Function Attrs: argmemonly nofree nosync nounwind uwtable
define dso_local void @iter_matmul(float* nocapture noundef readonly %A, float* nocapture noundef readonly %B, float* nocapture noundef writeonly %C, i32 noundef %n) local_unnamed_addr #12 !dbg !344 {
entry:
  call void @llvm.dbg.value(metadata float* %A, metadata !348, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata float* %B, metadata !349, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata float* %C, metadata !350, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata i32 %n, metadata !351, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata i32 0, metadata !352, metadata !DIExpression()), !dbg !361
  %cmp47 = icmp sgt i32 %n, 0, !dbg !362
  br i1 %cmp47, label %for.cond1.preheader.us.us.preheader, label %for.end21, !dbg !363

for.cond1.preheader.us.us.preheader:              ; preds = %entry
  %0 = zext i32 %n to i64, !dbg !363
  %xtraiter = and i64 %0, 1
  %1 = icmp eq i32 %n, 1
  %unroll_iter = and i64 %0, 4294967294
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for.cond1.preheader.us.us, !dbg !363

for.cond1.preheader.us.us:                        ; preds = %for.cond1.preheader.us.us.preheader, %for.cond1.for.inc19_crit_edge.split.us.us.us
  %indvars.iv69 = phi i64 [ 0, %for.cond1.preheader.us.us.preheader ], [ %indvars.iv.next70, %for.cond1.for.inc19_crit_edge.split.us.us.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv69, metadata !352, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata i32 0, metadata !354, metadata !DIExpression()), !dbg !361
  %2 = mul nsw i64 %indvars.iv69, %0
  br label %for.cond4.preheader.us.us.us, !dbg !364

for.cond4.preheader.us.us.us:                     ; preds = %for.cond4.for.end_crit_edge.us.us.us, %for.cond1.preheader.us.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.cond4.for.end_crit_edge.us.us.us ], [ 0, %for.cond1.preheader.us.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv63, metadata !354, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata float 0.000000e+00, metadata !355, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.value(metadata i32 0, metadata !353, metadata !DIExpression()), !dbg !361
  br i1 %1, label %for.cond4.for.end_crit_edge.us.us.us.unr-lcssa, label %for.body6.us.us.us, !dbg !366

for.body6.us.us.us:                               ; preds = %for.cond4.preheader.us.us.us, %for.body6.us.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.us.us.us ], [ 0, %for.cond4.preheader.us.us.us ]
  %c.043.us.us.us = phi float [ %14, %for.body6.us.us.us ], [ 0.000000e+00, %for.cond4.preheader.us.us.us ]
  %niter = phi i64 [ %niter.next.1, %for.body6.us.us.us ], [ 0, %for.cond4.preheader.us.us.us ]
  call void @llvm.dbg.value(metadata float %c.043.us.us.us, metadata !355, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !353, metadata !DIExpression()), !dbg !361
  %3 = add nuw nsw i64 %indvars.iv, %2, !dbg !368
  %arrayidx.us.us.us = getelementptr inbounds float, float* %A, i64 %3, !dbg !370
  %4 = load float, float* %arrayidx.us.us.us, align 4, !dbg !370, !tbaa !117
  %5 = mul nsw i64 %indvars.iv, %0, !dbg !371
  %6 = add nuw nsw i64 %5, %indvars.iv63, !dbg !372
  %arrayidx10.us.us.us = getelementptr inbounds float, float* %B, i64 %6, !dbg !373
  %7 = load float, float* %arrayidx10.us.us.us, align 4, !dbg !373, !tbaa !117
  %8 = tail call float @llvm.fmuladd.f32(float %4, float %7, float %c.043.us.us.us), !dbg !374
  call void @llvm.dbg.value(metadata float %8, metadata !355, metadata !DIExpression()), !dbg !365
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !375
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !353, metadata !DIExpression()), !dbg !361
  call void @llvm.dbg.value(metadata float %8, metadata !355, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !353, metadata !DIExpression()), !dbg !361
  %9 = add nuw nsw i64 %indvars.iv.next, %2, !dbg !368
  %arrayidx.us.us.us.1 = getelementptr inbounds float, float* %A, i64 %9, !dbg !370
  %10 = load float, float* %arrayidx.us.us.us.1, align 4, !dbg !370, !tbaa !117
  %11 = mul nsw i64 %indvars.iv.next, %0, !dbg !371
  %12 = add nuw nsw i64 %11, %indvars.iv63, !dbg !372
  %arrayidx10.us.us.us.1 = getelementptr inbounds float, float* %B, i64 %12, !dbg !373
  %13 = load float, float* %arrayidx10.us.us.us.1, align 4, !dbg !373, !tbaa !117
  %14 = tail call float @llvm.fmuladd.f32(float %10, float %13, float %8), !dbg !374
  call void @llvm.dbg.value(metadata float %14, metadata !355, metadata !DIExpression()), !dbg !365
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !375
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1, metadata !353, metadata !DIExpression()), !dbg !361
  %niter.next.1 = add i64 %niter, 2, !dbg !366
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !366
  br i1 %niter.ncmp.1, label %for.cond4.for.end_crit_edge.us.us.us.unr-lcssa, label %for.body6.us.us.us, !dbg !366, !llvm.loop !376

for.cond4.for.end_crit_edge.us.us.us.unr-lcssa:   ; preds = %for.body6.us.us.us, %for.cond4.preheader.us.us.us
  %.lcssa.ph = phi float [ undef, %for.cond4.preheader.us.us.us ], [ %14, %for.body6.us.us.us ]
  %indvars.iv.unr = phi i64 [ 0, %for.cond4.preheader.us.us.us ], [ %indvars.iv.next.1, %for.body6.us.us.us ]
  %c.043.us.us.us.unr = phi float [ 0.000000e+00, %for.cond4.preheader.us.us.us ], [ %14, %for.body6.us.us.us ]
  br i1 %lcmp.mod.not, label %for.cond4.for.end_crit_edge.us.us.us, label %for.body6.us.us.us.epil, !dbg !366

for.body6.us.us.us.epil:                          ; preds = %for.cond4.for.end_crit_edge.us.us.us.unr-lcssa
  call void @llvm.dbg.value(metadata float %c.043.us.us.us.unr, metadata !355, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !353, metadata !DIExpression()), !dbg !361
  %15 = add nuw nsw i64 %indvars.iv.unr, %2, !dbg !368
  %arrayidx.us.us.us.epil = getelementptr inbounds float, float* %A, i64 %15, !dbg !370
  %16 = load float, float* %arrayidx.us.us.us.epil, align 4, !dbg !370, !tbaa !117
  %17 = mul nsw i64 %indvars.iv.unr, %0, !dbg !371
  %18 = add nuw nsw i64 %17, %indvars.iv63, !dbg !372
  %arrayidx10.us.us.us.epil = getelementptr inbounds float, float* %B, i64 %18, !dbg !373
  %19 = load float, float* %arrayidx10.us.us.us.epil, align 4, !dbg !373, !tbaa !117
  %20 = tail call float @llvm.fmuladd.f32(float %16, float %19, float %c.043.us.us.us.unr), !dbg !374
  call void @llvm.dbg.value(metadata float %20, metadata !355, metadata !DIExpression()), !dbg !365
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !353, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !361
  br label %for.cond4.for.end_crit_edge.us.us.us, !dbg !378

for.cond4.for.end_crit_edge.us.us.us:             ; preds = %for.cond4.for.end_crit_edge.us.us.us.unr-lcssa, %for.body6.us.us.us.epil
  %.lcssa = phi float [ %.lcssa.ph, %for.cond4.for.end_crit_edge.us.us.us.unr-lcssa ], [ %20, %for.body6.us.us.us.epil ], !dbg !374
  %21 = add nuw nsw i64 %indvars.iv63, %2, !dbg !378
  %arrayidx15.us.us.us = getelementptr inbounds float, float* %C, i64 %21, !dbg !379
  store float %.lcssa, float* %arrayidx15.us.us.us, align 4, !dbg !380, !tbaa !117
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1, !dbg !381
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next64, metadata !354, metadata !DIExpression()), !dbg !361
  %exitcond68.not = icmp eq i64 %indvars.iv.next64, %0, !dbg !382
  br i1 %exitcond68.not, label %for.cond1.for.inc19_crit_edge.split.us.us.us, label %for.cond4.preheader.us.us.us, !dbg !364, !llvm.loop !383

for.cond1.for.inc19_crit_edge.split.us.us.us:     ; preds = %for.cond4.for.end_crit_edge.us.us.us
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1, !dbg !385
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next70, metadata !352, metadata !DIExpression()), !dbg !361
  %exitcond75.not = icmp eq i64 %indvars.iv.next70, %0, !dbg !362
  br i1 %exitcond75.not, label %for.end21, label %for.cond1.preheader.us.us, !dbg !363, !llvm.loop !386

for.end21:                                        ; preds = %for.cond1.for.inc19_crit_edge.split.us.us.us, %entry
  ret void, !dbg !388
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: argmemonly nounwind uwtable
define dso_local void @rec_matmulAdd(float* noundef %A, float* noundef %B, float* noundef %C, i32 noundef %m, i32 noundef %n, i32 noundef %p, i32 noundef %ld) local_unnamed_addr #13 !dbg !389 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !420
  %add153174 = add nsw i32 %n, %m
  call void @llvm.dbg.value(metadata float* %A, metadata !393, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %B, metadata !394, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %C, metadata !395, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %m, metadata !396, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %n, metadata !397, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %p, metadata !398, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %ld, metadata !399, metadata !DIExpression()), !dbg !421
  %add1137154175 = add nsw i32 %add153174, %p, !dbg !422
  %cmp138155176 = icmp slt i32 %add1137154175, 65, !dbg !423
  br i1 %cmp138155176, label %for.cond.preheader, label %if.end.lr.ph.lr.ph, !dbg !424

if.end.lr.ph.lr.ph:                               ; preds = %entry, %det.cont
  %add153183 = phi i32 [ %add153, %det.cont ], [ %add153174, %entry ]
  %p.tr.ph.ph182 = phi i32 [ %p.tr141, %det.cont ], [ %p, %entry ]
  %n.tr.ph.ph181 = phi i32 [ %n.tr.ph159, %det.cont ], [ %n, %entry ]
  %m.tr.ph.ph180 = phi i32 [ %sub, %det.cont ], [ %m, %entry ]
  %C.tr.ph.ph179 = phi float* [ %add.ptr33, %det.cont ], [ %C, %entry ]
  %B.tr.ph.ph178 = phi float* [ %B.tr139, %det.cont ], [ %B, %entry ]
  %A.tr.ph.ph177 = phi float* [ %add.ptr, %det.cont ], [ %A, %entry ]
  call void @llvm.dbg.value(metadata i32 %p.tr.ph.ph182, metadata !398, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %n.tr.ph.ph181, metadata !397, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %m.tr.ph.ph180, metadata !396, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %C.tr.ph.ph179, metadata !395, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %B.tr.ph.ph178, metadata !394, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %A.tr.ph.ph177, metadata !393, metadata !DIExpression()), !dbg !421
  br label %if.end.lr.ph, !dbg !424

if.end.lr.ph:                                     ; preds = %if.end.lr.ph.lr.ph, %if.else
  %add161 = phi i32 [ %add153183, %if.end.lr.ph.lr.ph ], [ %add, %if.else ]
  %p.tr.ph160 = phi i32 [ %p.tr.ph.ph182, %if.end.lr.ph.lr.ph ], [ %p.tr141, %if.else ]
  %n.tr.ph159 = phi i32 [ %n.tr.ph.ph181, %if.end.lr.ph.lr.ph ], [ %sub40, %if.else ]
  %C.tr.ph158 = phi float* [ %C.tr.ph.ph179, %if.end.lr.ph.lr.ph ], [ %C.tr140, %if.else ]
  %B.tr.ph157 = phi float* [ %B.tr.ph.ph178, %if.end.lr.ph.lr.ph ], [ %add.ptr39, %if.else ]
  %A.tr.ph156 = phi float* [ %A.tr.ph.ph177, %if.end.lr.ph.lr.ph ], [ %add.ptr36, %if.else ]
  call void @llvm.dbg.value(metadata i32 %p.tr.ph160, metadata !398, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %n.tr.ph159, metadata !397, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %C.tr.ph158, metadata !395, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %B.tr.ph157, metadata !394, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %A.tr.ph156, metadata !393, metadata !DIExpression()), !dbg !421
  br label %if.end, !dbg !424

for.cond.preheader:                               ; preds = %det.cont, %if.else, %det.cont44, %entry
  %m.tr.ph.ph.lcssa = phi i32 [ %m, %entry ], [ %m.tr.ph.ph180, %det.cont44 ], [ %m.tr.ph.ph180, %if.else ], [ %sub, %det.cont ]
  %A.tr.ph.lcssa135 = phi float* [ %A, %entry ], [ %A.tr.ph156, %det.cont44 ], [ %add.ptr36, %if.else ], [ %add.ptr, %det.cont ]
  %n.tr.ph.lcssa134 = phi i32 [ %n, %entry ], [ %n.tr.ph159, %det.cont44 ], [ %sub40, %if.else ], [ %n.tr.ph159, %det.cont ]
  %B.tr.lcssa = phi float* [ %B, %entry ], [ %add.ptr46, %det.cont44 ], [ %add.ptr39, %if.else ], [ %B.tr139, %det.cont ]
  %C.tr.lcssa = phi float* [ %C, %entry ], [ %add.ptr48, %det.cont44 ], [ %C.tr140, %if.else ], [ %add.ptr33, %det.cont ]
  %p.tr.lcssa = phi i32 [ %p, %entry ], [ %sub49, %det.cont44 ], [ %p.tr141, %if.else ], [ %p.tr141, %det.cont ]
  call void @llvm.dbg.value(metadata i32 0, metadata !400, metadata !DIExpression()), !dbg !425
  %cmp2197 = icmp sgt i32 %m.tr.ph.ph.lcssa, 0, !dbg !426
  %cmp4194 = icmp sgt i32 %p.tr.lcssa, 0
  %or.cond = select i1 %cmp2197, i1 %cmp4194, i1 false, !dbg !427
  br i1 %or.cond, label %for.cond3.preheader.lr.ph.split.us, label %return, !dbg !427

for.cond3.preheader.lr.ph.split.us:               ; preds = %for.cond.preheader
  %cmp7190 = icmp sgt i32 %n.tr.ph.lcssa134, 0
  %0 = sext i32 %ld to i64, !dbg !427
  %wide.trip.count255 = zext i32 %m.tr.ph.ph.lcssa to i64, !dbg !426
  %wide.trip.count248 = zext i32 %p.tr.lcssa to i64
  br i1 %cmp7190, label %for.cond3.preheader.us.us.preheader, label %for.cond3.preheader.us.preheader, !dbg !428

for.cond3.preheader.us.preheader:                 ; preds = %for.cond3.preheader.lr.ph.split.us
  %1 = and i64 %wide.trip.count248, 4294967288, !dbg !427
  %2 = add nsw i64 %1, -8, !dbg !427
  %3 = lshr exact i64 %2, 3, !dbg !427
  %4 = add nuw nsw i64 %3, 1, !dbg !427
  %min.iters.check = icmp ult i32 %p.tr.lcssa, 8
  %n.vec = and i64 %wide.trip.count248, 4294967288
  %xtraiter = and i64 %4, 1
  %5 = icmp eq i64 %2, 0
  %unroll_iter = and i64 %4, 4611686018427387902
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count248
  br label %for.cond3.preheader.us, !dbg !427

for.cond3.preheader.us.us.preheader:              ; preds = %for.cond3.preheader.lr.ph.split.us
  %wide.trip.count242 = zext i32 %n.tr.ph.lcssa134 to i64
  %xtraiter328 = and i64 %wide.trip.count242, 1
  %6 = icmp eq i32 %n.tr.ph.lcssa134, 1
  %unroll_iter331 = and i64 %wide.trip.count242, 4294967294
  %lcmp.mod329.not = icmp eq i64 %xtraiter328, 0
  br label %for.cond3.preheader.us.us, !dbg !427

for.cond3.preheader.us.us:                        ; preds = %for.cond3.preheader.us.us.preheader, %for.cond3.for.inc23_crit_edge.split.us.us.us
  %indvars.iv250 = phi i64 [ 0, %for.cond3.preheader.us.us.preheader ], [ %indvars.iv.next251, %for.cond3.for.inc23_crit_edge.split.us.us.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv250, metadata !400, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata i32 0, metadata !404, metadata !DIExpression()), !dbg !425
  %7 = mul nsw i64 %indvars.iv250, %0
  br label %for.cond6.preheader.us.us.us, !dbg !430

for.cond6.preheader.us.us.us:                     ; preds = %for.cond6.for.end_crit_edge.us.us.us, %for.cond3.preheader.us.us
  %indvars.iv244 = phi i64 [ %indvars.iv.next245, %for.cond6.for.end_crit_edge.us.us.us ], [ 0, %for.cond3.preheader.us.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv244, metadata !404, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata i32 0, metadata !403, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata float 0.000000e+00, metadata !405, metadata !DIExpression()), !dbg !431
  br i1 %6, label %for.cond6.for.end_crit_edge.us.us.us.unr-lcssa, label %for.body8.us.us.us, !dbg !428

for.body8.us.us.us:                               ; preds = %for.cond6.preheader.us.us.us, %for.body8.us.us.us
  %indvars.iv236 = phi i64 [ %indvars.iv.next237.1, %for.body8.us.us.us ], [ 0, %for.cond6.preheader.us.us.us ]
  %c.0191.us.us.us = phi float [ %19, %for.body8.us.us.us ], [ 0.000000e+00, %for.cond6.preheader.us.us.us ]
  %niter332 = phi i64 [ %niter332.next.1, %for.body8.us.us.us ], [ 0, %for.cond6.preheader.us.us.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv236, metadata !403, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata float %c.0191.us.us.us, metadata !405, metadata !DIExpression()), !dbg !431
  %8 = add nsw i64 %indvars.iv236, %7, !dbg !432
  %arrayidx.us.us.us = getelementptr inbounds float, float* %A.tr.ph.lcssa135, i64 %8, !dbg !434
  %9 = load float, float* %arrayidx.us.us.us, align 4, !dbg !434, !tbaa !117
  %10 = mul nsw i64 %indvars.iv236, %0, !dbg !435
  %11 = add nsw i64 %10, %indvars.iv244, !dbg !436
  %arrayidx13.us.us.us = getelementptr inbounds float, float* %B.tr.lcssa, i64 %11, !dbg !437
  %12 = load float, float* %arrayidx13.us.us.us, align 4, !dbg !437, !tbaa !117
  %13 = tail call float @llvm.fmuladd.f32(float %9, float %12, float %c.0191.us.us.us), !dbg !438
  call void @llvm.dbg.value(metadata float %13, metadata !405, metadata !DIExpression()), !dbg !431
  %indvars.iv.next237 = or i64 %indvars.iv236, 1, !dbg !439
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next237, metadata !403, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next237, metadata !403, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata float %13, metadata !405, metadata !DIExpression()), !dbg !431
  %14 = add nsw i64 %indvars.iv.next237, %7, !dbg !432
  %arrayidx.us.us.us.1 = getelementptr inbounds float, float* %A.tr.ph.lcssa135, i64 %14, !dbg !434
  %15 = load float, float* %arrayidx.us.us.us.1, align 4, !dbg !434, !tbaa !117
  %16 = mul nsw i64 %indvars.iv.next237, %0, !dbg !435
  %17 = add nsw i64 %16, %indvars.iv244, !dbg !436
  %arrayidx13.us.us.us.1 = getelementptr inbounds float, float* %B.tr.lcssa, i64 %17, !dbg !437
  %18 = load float, float* %arrayidx13.us.us.us.1, align 4, !dbg !437, !tbaa !117
  %19 = tail call float @llvm.fmuladd.f32(float %15, float %18, float %13), !dbg !438
  call void @llvm.dbg.value(metadata float %19, metadata !405, metadata !DIExpression()), !dbg !431
  %indvars.iv.next237.1 = add nuw nsw i64 %indvars.iv236, 2, !dbg !439
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next237.1, metadata !403, metadata !DIExpression()), !dbg !425
  %niter332.next.1 = add i64 %niter332, 2, !dbg !428
  %niter332.ncmp.1 = icmp eq i64 %niter332.next.1, %unroll_iter331, !dbg !428
  br i1 %niter332.ncmp.1, label %for.cond6.for.end_crit_edge.us.us.us.unr-lcssa, label %for.body8.us.us.us, !dbg !428, !llvm.loop !440

for.cond6.for.end_crit_edge.us.us.us.unr-lcssa:   ; preds = %for.body8.us.us.us, %for.cond6.preheader.us.us.us
  %.lcssa.ph = phi float [ undef, %for.cond6.preheader.us.us.us ], [ %19, %for.body8.us.us.us ]
  %indvars.iv236.unr = phi i64 [ 0, %for.cond6.preheader.us.us.us ], [ %indvars.iv.next237.1, %for.body8.us.us.us ]
  %c.0191.us.us.us.unr = phi float [ 0.000000e+00, %for.cond6.preheader.us.us.us ], [ %19, %for.body8.us.us.us ]
  br i1 %lcmp.mod329.not, label %for.cond6.for.end_crit_edge.us.us.us, label %for.body8.us.us.us.epil, !dbg !428

for.body8.us.us.us.epil:                          ; preds = %for.cond6.for.end_crit_edge.us.us.us.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv236.unr, metadata !403, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata float %c.0191.us.us.us.unr, metadata !405, metadata !DIExpression()), !dbg !431
  %20 = add nsw i64 %indvars.iv236.unr, %7, !dbg !432
  %arrayidx.us.us.us.epil = getelementptr inbounds float, float* %A.tr.ph.lcssa135, i64 %20, !dbg !434
  %21 = load float, float* %arrayidx.us.us.us.epil, align 4, !dbg !434, !tbaa !117
  %22 = mul nsw i64 %indvars.iv236.unr, %0, !dbg !435
  %23 = add nsw i64 %22, %indvars.iv244, !dbg !436
  %arrayidx13.us.us.us.epil = getelementptr inbounds float, float* %B.tr.lcssa, i64 %23, !dbg !437
  %24 = load float, float* %arrayidx13.us.us.us.epil, align 4, !dbg !437, !tbaa !117
  %25 = tail call float @llvm.fmuladd.f32(float %21, float %24, float %c.0191.us.us.us.unr), !dbg !438
  call void @llvm.dbg.value(metadata float %25, metadata !405, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.value(metadata i64 %indvars.iv236.unr, metadata !403, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !425
  br label %for.cond6.for.end_crit_edge.us.us.us, !dbg !442

for.cond6.for.end_crit_edge.us.us.us:             ; preds = %for.cond6.for.end_crit_edge.us.us.us.unr-lcssa, %for.body8.us.us.us.epil
  %.lcssa = phi float [ %.lcssa.ph, %for.cond6.for.end_crit_edge.us.us.us.unr-lcssa ], [ %25, %for.body8.us.us.us.epil ], !dbg !438
  %26 = add nsw i64 %indvars.iv244, %7, !dbg !442
  %arrayidx18.us.us.us = getelementptr inbounds float, float* %C.tr.lcssa, i64 %26, !dbg !443
  %27 = load float, float* %arrayidx18.us.us.us, align 4, !dbg !444, !tbaa !117
  %add19.us.us.us = fadd float %.lcssa, %27, !dbg !444
  store float %add19.us.us.us, float* %arrayidx18.us.us.us, align 4, !dbg !444, !tbaa !117
  %indvars.iv.next245 = add nuw nsw i64 %indvars.iv244, 1, !dbg !445
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next245, metadata !404, metadata !DIExpression()), !dbg !425
  %exitcond249.not = icmp eq i64 %indvars.iv.next245, %wide.trip.count248, !dbg !446
  br i1 %exitcond249.not, label %for.cond3.for.inc23_crit_edge.split.us.us.us, label %for.cond6.preheader.us.us.us, !dbg !430, !llvm.loop !447

for.cond3.for.inc23_crit_edge.split.us.us.us:     ; preds = %for.cond6.for.end_crit_edge.us.us.us
  %indvars.iv.next251 = add nuw nsw i64 %indvars.iv250, 1, !dbg !449
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next251, metadata !400, metadata !DIExpression()), !dbg !425
  %exitcond256.not = icmp eq i64 %indvars.iv.next251, %wide.trip.count255, !dbg !426
  br i1 %exitcond256.not, label %return, label %for.cond3.preheader.us.us, !dbg !427, !llvm.loop !450

for.cond3.preheader.us:                           ; preds = %for.cond3.preheader.us.preheader, %for.cond3.for.inc23_crit_edge.split.us208
  %indvars.iv230 = phi i64 [ %indvars.iv.next231, %for.cond3.for.inc23_crit_edge.split.us208 ], [ 0, %for.cond3.preheader.us.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv230, metadata !400, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata i32 0, metadata !404, metadata !DIExpression()), !dbg !425
  %28 = mul nsw i64 %indvars.iv230, %0
  br i1 %min.iters.check, label %for.cond6.preheader.us200.preheader, label %vector.ph, !dbg !430

vector.ph:                                        ; preds = %for.cond3.preheader.us
  br i1 %5, label %middle.block.unr-lcssa, label %vector.body, !dbg !430

vector.body:                                      ; preds = %vector.ph, %vector.body
  %index = phi i64 [ %index.next.1, %vector.body ], [ 0, %vector.ph ], !dbg !445
  %niter = phi i64 [ %niter.next.1, %vector.body ], [ 0, %vector.ph ]
  %29 = add nsw i64 %index, %28, !dbg !445
  %30 = getelementptr inbounds float, float* %C.tr.lcssa, i64 %29, !dbg !445
  %31 = bitcast float* %30 to <4 x float>*, !dbg !444
  %wide.load = load <4 x float>, <4 x float>* %31, align 4, !dbg !444, !tbaa !117
  %32 = getelementptr inbounds float, float* %30, i64 4, !dbg !444
  %33 = bitcast float* %32 to <4 x float>*, !dbg !444
  %wide.load310 = load <4 x float>, <4 x float>* %33, align 4, !dbg !444, !tbaa !117
  %34 = fadd <4 x float> %wide.load, zeroinitializer, !dbg !444
  %35 = fadd <4 x float> %wide.load310, zeroinitializer, !dbg !444
  store <4 x float> %34, <4 x float>* %31, align 4, !dbg !444, !tbaa !117
  store <4 x float> %35, <4 x float>* %33, align 4, !dbg !444, !tbaa !117
  %index.next = or i64 %index, 8, !dbg !445
  %36 = add nsw i64 %index.next, %28, !dbg !445
  %37 = getelementptr inbounds float, float* %C.tr.lcssa, i64 %36, !dbg !445
  %38 = bitcast float* %37 to <4 x float>*, !dbg !444
  %wide.load.1 = load <4 x float>, <4 x float>* %38, align 4, !dbg !444, !tbaa !117
  %39 = getelementptr inbounds float, float* %37, i64 4, !dbg !444
  %40 = bitcast float* %39 to <4 x float>*, !dbg !444
  %wide.load310.1 = load <4 x float>, <4 x float>* %40, align 4, !dbg !444, !tbaa !117
  %41 = fadd <4 x float> %wide.load.1, zeroinitializer, !dbg !444
  %42 = fadd <4 x float> %wide.load310.1, zeroinitializer, !dbg !444
  store <4 x float> %41, <4 x float>* %38, align 4, !dbg !444, !tbaa !117
  store <4 x float> %42, <4 x float>* %40, align 4, !dbg !444, !tbaa !117
  %index.next.1 = add nuw i64 %index, 16, !dbg !445
  %niter.next.1 = add i64 %niter, 2, !dbg !445
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !445
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa, label %vector.body, !dbg !445, !llvm.loop !452

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil, !dbg !445

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa
  %43 = add nsw i64 %index.unr, %28, !dbg !445
  %44 = getelementptr inbounds float, float* %C.tr.lcssa, i64 %43, !dbg !445
  %45 = bitcast float* %44 to <4 x float>*, !dbg !444
  %wide.load.epil = load <4 x float>, <4 x float>* %45, align 4, !dbg !444, !tbaa !117
  %46 = getelementptr inbounds float, float* %44, i64 4, !dbg !444
  %47 = bitcast float* %46 to <4 x float>*, !dbg !444
  %wide.load310.epil = load <4 x float>, <4 x float>* %47, align 4, !dbg !444, !tbaa !117
  %48 = fadd <4 x float> %wide.load.epil, zeroinitializer, !dbg !444
  %49 = fadd <4 x float> %wide.load310.epil, zeroinitializer, !dbg !444
  store <4 x float> %48, <4 x float>* %45, align 4, !dbg !444, !tbaa !117
  store <4 x float> %49, <4 x float>* %47, align 4, !dbg !444, !tbaa !117
  br label %middle.block, !dbg !430

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.epil
  br i1 %cmp.n, label %for.cond3.for.inc23_crit_edge.split.us208, label %for.cond6.preheader.us200.preheader, !dbg !430

for.cond6.preheader.us200.preheader:              ; preds = %for.cond3.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond3.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.cond6.preheader.us200, !dbg !430

for.cond6.preheader.us200:                        ; preds = %for.cond6.preheader.us200.preheader, %for.cond6.preheader.us200
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond6.preheader.us200 ], [ %indvars.iv.ph, %for.cond6.preheader.us200.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !404, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata i32 0, metadata !403, metadata !DIExpression()), !dbg !425
  call void @llvm.dbg.value(metadata float 0.000000e+00, metadata !405, metadata !DIExpression()), !dbg !431
  %50 = add nsw i64 %indvars.iv, %28, !dbg !442
  %arrayidx18.us204 = getelementptr inbounds float, float* %C.tr.lcssa, i64 %50, !dbg !443
  %51 = load float, float* %arrayidx18.us204, align 4, !dbg !444, !tbaa !117
  %add19.us205 = fadd float %51, 0.000000e+00, !dbg !444
  store float %add19.us205, float* %arrayidx18.us204, align 4, !dbg !444, !tbaa !117
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !445
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !404, metadata !DIExpression()), !dbg !425
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count248, !dbg !446
  br i1 %exitcond.not, label %for.cond3.for.inc23_crit_edge.split.us208, label %for.cond6.preheader.us200, !dbg !430, !llvm.loop !454

for.cond3.for.inc23_crit_edge.split.us208:        ; preds = %for.cond6.preheader.us200, %middle.block
  %indvars.iv.next231 = add nuw nsw i64 %indvars.iv230, 1, !dbg !449
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next231, metadata !400, metadata !DIExpression()), !dbg !425
  %exitcond235.not = icmp eq i64 %indvars.iv.next231, %wide.trip.count255, !dbg !426
  br i1 %exitcond235.not, label %return, label %for.cond3.preheader.us, !dbg !427, !llvm.loop !450

if.end:                                           ; preds = %if.end.lr.ph, %det.cont44
  %p.tr141 = phi i32 [ %p.tr.ph160, %if.end.lr.ph ], [ %sub49, %det.cont44 ]
  %C.tr140 = phi float* [ %C.tr.ph158, %if.end.lr.ph ], [ %add.ptr48, %det.cont44 ]
  %B.tr139 = phi float* [ %B.tr.ph157, %if.end.lr.ph ], [ %add.ptr46, %det.cont44 ]
  call void @llvm.dbg.value(metadata i32 %p.tr141, metadata !398, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %C.tr140, metadata !395, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %B.tr139, metadata !394, metadata !DIExpression()), !dbg !421
  %cmp26.not = icmp slt i32 %n.tr.ph159, %p.tr141, !dbg !456
  br i1 %cmp26.not, label %if.else41, label %if.then27, !dbg !457

if.then27:                                        ; preds = %if.end
  %cmp28.not = icmp slt i32 %m.tr.ph.ph180, %n.tr.ph159, !dbg !458
  br i1 %cmp28.not, label %if.else, label %if.then29, !dbg !459

if.then29:                                        ; preds = %if.then27
  %shr = ashr i32 %m.tr.ph.ph180, 1, !dbg !460
  call void @llvm.dbg.value(metadata i32 %shr, metadata !411, metadata !DIExpression()), !dbg !420
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !461

det.achd:                                         ; preds = %if.then29
  tail call void @rec_matmulAdd(float* noundef %A.tr.ph156, float* noundef %B.tr139, float* noundef %C.tr140, i32 noundef %shr, i32 noundef %n.tr.ph159, i32 noundef %p.tr141, i32 noundef %ld), !dbg !461
  reattach within %syncreg, label %det.cont, !dbg !461

det.cont:                                         ; preds = %det.achd, %if.then29
  %mul30 = mul nsw i32 %shr, %ld, !dbg !462
  %idx.ext = sext i32 %mul30 to i64, !dbg !463
  %add.ptr = getelementptr inbounds float, float* %A.tr.ph156, i64 %idx.ext, !dbg !463
  %add.ptr33 = getelementptr inbounds float, float* %C.tr140, i64 %idx.ext, !dbg !464
  %sub = sub nsw i32 %m.tr.ph.ph180, %shr, !dbg !465
  %add153 = add nsw i32 %n.tr.ph159, %sub
  call void @llvm.dbg.value(metadata float* %add.ptr, metadata !393, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %B.tr139, metadata !394, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %add.ptr33, metadata !395, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %sub, metadata !396, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %n.tr.ph159, metadata !397, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %p.tr141, metadata !398, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %ld, metadata !399, metadata !DIExpression()), !dbg !421
  %add1137154 = add nsw i32 %add153, %p.tr141, !dbg !422
  %cmp138155 = icmp slt i32 %add1137154, 65, !dbg !423
  br i1 %cmp138155, label %for.cond.preheader, label %if.end.lr.ph.lr.ph, !dbg !424

if.else:                                          ; preds = %if.then27
  %shr34 = ashr i32 %n.tr.ph159, 1, !dbg !466
  call void @llvm.dbg.value(metadata i32 %shr34, metadata !416, metadata !DIExpression()), !dbg !467
  tail call void @rec_matmulAdd(float* noundef %A.tr.ph156, float* noundef %B.tr139, float* noundef %C.tr140, i32 noundef %m.tr.ph.ph180, i32 noundef %shr34, i32 noundef %p.tr141, i32 noundef %ld), !dbg !468
  %idx.ext35 = sext i32 %shr34 to i64, !dbg !469
  %add.ptr36 = getelementptr inbounds float, float* %A.tr.ph156, i64 %idx.ext35, !dbg !469
  %mul37 = mul nsw i32 %shr34, %ld, !dbg !470
  %idx.ext38 = sext i32 %mul37 to i64, !dbg !471
  %add.ptr39 = getelementptr inbounds float, float* %B.tr139, i64 %idx.ext38, !dbg !471
  %sub40 = sub nsw i32 %n.tr.ph159, %shr34, !dbg !472
  %add = add nsw i32 %sub40, %m.tr.ph.ph180
  call void @llvm.dbg.value(metadata float* %add.ptr36, metadata !393, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %add.ptr39, metadata !394, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %C.tr140, metadata !395, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %m.tr.ph.ph180, metadata !396, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %sub40, metadata !397, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %p.tr141, metadata !398, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %ld, metadata !399, metadata !DIExpression()), !dbg !421
  %add1137 = add nsw i32 %add, %p.tr141, !dbg !422
  %cmp138 = icmp slt i32 %add1137, 65, !dbg !423
  br i1 %cmp138, label %for.cond.preheader, label %if.end.lr.ph, !dbg !424

if.else41:                                        ; preds = %if.end
  %shr42 = ashr i32 %p.tr141, 1, !dbg !473
  call void @llvm.dbg.value(metadata i32 %shr42, metadata !418, metadata !DIExpression()), !dbg !474
  detach within %syncreg, label %det.achd43, label %det.cont44, !dbg !475

det.achd43:                                       ; preds = %if.else41
  tail call void @rec_matmulAdd(float* noundef %A.tr.ph156, float* noundef %B.tr139, float* noundef %C.tr140, i32 noundef %m.tr.ph.ph180, i32 noundef %n.tr.ph159, i32 noundef %shr42, i32 noundef %ld), !dbg !475
  reattach within %syncreg, label %det.cont44, !dbg !475

det.cont44:                                       ; preds = %det.achd43, %if.else41
  %idx.ext45 = sext i32 %shr42 to i64, !dbg !476
  %add.ptr46 = getelementptr inbounds float, float* %B.tr139, i64 %idx.ext45, !dbg !476
  %add.ptr48 = getelementptr inbounds float, float* %C.tr140, i64 %idx.ext45, !dbg !477
  %sub49 = sub nsw i32 %p.tr141, %shr42, !dbg !478
  call void @llvm.dbg.value(metadata float* %A.tr.ph156, metadata !393, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %add.ptr46, metadata !394, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata float* %add.ptr48, metadata !395, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %m.tr.ph.ph180, metadata !396, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %n.tr.ph159, metadata !397, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %sub49, metadata !398, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata i32 %ld, metadata !399, metadata !DIExpression()), !dbg !421
  %add1 = add nsw i32 %add161, %sub49, !dbg !422
  %cmp = icmp slt i32 %add1, 65, !dbg !423
  br i1 %cmp, label %for.cond.preheader, label %if.end, !dbg !424

return:                                           ; preds = %for.cond3.for.inc23_crit_edge.split.us208, %for.cond3.for.inc23_crit_edge.split.us.us.us, %for.cond.preheader
  sync within %syncreg, label %return.split, !dbg !479

return.split:                                     ; preds = %return
  ret void, !dbg !479
}

; Function Attrs: argmemonly nounwind uwtable
define dso_local void @rec_matmul(float* noundef %A, float* noundef %B, float* noundef %C, i32 noundef %m, i32 noundef %n, i32 noundef %p, i32 noundef %ld) local_unnamed_addr #13 !dbg !480 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !509
  %add149 = add nsw i32 %m, %n
  call void @llvm.dbg.value(metadata float* %A, metadata !482, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata float* %B, metadata !483, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata float* %C, metadata !484, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %m, metadata !485, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %n, metadata !486, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %p, metadata !487, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %ld, metadata !488, metadata !DIExpression()), !dbg !510
  %add1135150 = add nsw i32 %add149, %p, !dbg !511
  %cmp136151 = icmp slt i32 %add1135150, 65, !dbg !512
  br i1 %cmp136151, label %for.cond.preheader, label %if.end.lr.ph, !dbg !513

if.end.lr.ph:                                     ; preds = %entry, %det.cont
  %add158 = phi i32 [ %add, %det.cont ], [ %add149, %entry ]
  %p.tr.ph157 = phi i32 [ %p.tr139, %det.cont ], [ %p, %entry ]
  %m.tr.ph156 = phi i32 [ %sub, %det.cont ], [ %m, %entry ]
  %C.tr.ph155 = phi float* [ %add.ptr32, %det.cont ], [ %C, %entry ]
  %B.tr.ph154 = phi float* [ %B.tr137, %det.cont ], [ %B, %entry ]
  %A.tr.ph152 = phi float* [ %add.ptr, %det.cont ], [ %A, %entry ]
  call void @llvm.dbg.value(metadata i32 %p.tr.ph157, metadata !487, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %m.tr.ph156, metadata !485, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata float* %C.tr.ph155, metadata !484, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata float* %B.tr.ph154, metadata !483, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata float* %A.tr.ph152, metadata !482, metadata !DIExpression()), !dbg !510
  br label %if.end, !dbg !513

for.cond.preheader:                               ; preds = %det.cont, %det.cont43, %entry
  %A.tr.ph.lcssa134 = phi float* [ %A, %entry ], [ %A.tr.ph152, %det.cont43 ], [ %add.ptr, %det.cont ]
  %m.tr.ph.lcssa133 = phi i32 [ %m, %entry ], [ %m.tr.ph156, %det.cont43 ], [ %sub, %det.cont ]
  %B.tr.lcssa = phi float* [ %B, %entry ], [ %add.ptr45, %det.cont43 ], [ %B.tr137, %det.cont ]
  %C.tr.lcssa = phi float* [ %C, %entry ], [ %add.ptr47, %det.cont43 ], [ %add.ptr32, %det.cont ]
  %p.tr.lcssa = phi i32 [ %p, %entry ], [ %sub48, %det.cont43 ], [ %p.tr139, %det.cont ]
  call void @llvm.dbg.value(metadata i32 0, metadata !489, metadata !DIExpression()), !dbg !514
  %cmp2171 = icmp sgt i32 %m.tr.ph.lcssa133, 0, !dbg !515
  %cmp4168 = icmp sgt i32 %p.tr.lcssa, 0
  %or.cond = select i1 %cmp2171, i1 %cmp4168, i1 false, !dbg !516
  br i1 %or.cond, label %for.cond3.preheader.lr.ph.split.us, label %return, !dbg !516

for.cond3.preheader.lr.ph.split.us:               ; preds = %for.cond.preheader
  %cmp7164 = icmp sgt i32 %n, 0
  %0 = sext i32 %ld to i64, !dbg !516
  br i1 %cmp7164, label %for.cond3.preheader.us.us.preheader, label %for.cond3.preheader.us.preheader, !dbg !517

for.cond3.preheader.us.preheader:                 ; preds = %for.cond3.preheader.lr.ph.split.us
  %1 = zext i32 %p.tr.lcssa to i64, !dbg !516
  %2 = shl nuw nsw i64 %1, 2, !dbg !516
  %wide.trip.count = zext i32 %m.tr.ph.lcssa133 to i64, !dbg !515
  %3 = add nsw i64 %wide.trip.count, -1, !dbg !516
  %xtraiter = and i64 %wide.trip.count, 7, !dbg !516
  %4 = icmp ult i64 %3, 7, !dbg !516
  br i1 %4, label %return.loopexit255.unr-lcssa, label %for.cond3.preheader.us.preheader.new, !dbg !516

for.cond3.preheader.us.preheader.new:             ; preds = %for.cond3.preheader.us.preheader
  %unroll_iter = and i64 %wide.trip.count, 4294967288, !dbg !516
  br label %for.cond3.preheader.us, !dbg !516

for.cond3.preheader.us.us.preheader:              ; preds = %for.cond3.preheader.lr.ph.split.us
  %wide.trip.count217 = zext i32 %m.tr.ph.lcssa133 to i64, !dbg !515
  %wide.trip.count210 = zext i32 %p.tr.lcssa to i64
  %wide.trip.count204 = zext i32 %n to i64
  %xtraiter267 = and i64 %wide.trip.count204, 1
  %5 = icmp eq i32 %n, 1
  %unroll_iter271 = and i64 %wide.trip.count204, 4294967294
  %lcmp.mod269.not = icmp eq i64 %xtraiter267, 0
  br label %for.cond3.preheader.us.us, !dbg !516

for.cond3.preheader.us.us:                        ; preds = %for.cond3.preheader.us.us.preheader, %for.cond3.for.inc22_crit_edge.split.us.us.us
  %indvars.iv212 = phi i64 [ 0, %for.cond3.preheader.us.us.preheader ], [ %indvars.iv.next213, %for.cond3.for.inc22_crit_edge.split.us.us.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv212, metadata !489, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i32 0, metadata !493, metadata !DIExpression()), !dbg !514
  %6 = mul nsw i64 %indvars.iv212, %0
  br label %for.cond6.preheader.us.us.us, !dbg !519

for.cond6.preheader.us.us.us:                     ; preds = %for.cond6.for.end_crit_edge.us.us.us, %for.cond3.preheader.us.us
  %indvars.iv206 = phi i64 [ %indvars.iv.next207, %for.cond6.for.end_crit_edge.us.us.us ], [ 0, %for.cond3.preheader.us.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv206, metadata !493, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i32 0, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata float 0.000000e+00, metadata !494, metadata !DIExpression()), !dbg !520
  br i1 %5, label %for.cond6.for.end_crit_edge.us.us.us.unr-lcssa, label %for.body8.us.us.us, !dbg !517

for.body8.us.us.us:                               ; preds = %for.cond6.preheader.us.us.us, %for.body8.us.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body8.us.us.us ], [ 0, %for.cond6.preheader.us.us.us ]
  %c.0165.us.us.us = phi float [ %18, %for.body8.us.us.us ], [ 0.000000e+00, %for.cond6.preheader.us.us.us ]
  %niter272 = phi i64 [ %niter272.next.1, %for.body8.us.us.us ], [ 0, %for.cond6.preheader.us.us.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata float %c.0165.us.us.us, metadata !494, metadata !DIExpression()), !dbg !520
  %7 = add nsw i64 %indvars.iv, %6, !dbg !521
  %arrayidx.us.us.us = getelementptr inbounds float, float* %A.tr.ph.lcssa134, i64 %7, !dbg !523
  %8 = load float, float* %arrayidx.us.us.us, align 4, !dbg !523, !tbaa !117
  %9 = mul nsw i64 %indvars.iv, %0, !dbg !524
  %10 = add nsw i64 %9, %indvars.iv206, !dbg !525
  %arrayidx13.us.us.us = getelementptr inbounds float, float* %B.tr.lcssa, i64 %10, !dbg !526
  %11 = load float, float* %arrayidx13.us.us.us, align 4, !dbg !526, !tbaa !117
  %12 = tail call float @llvm.fmuladd.f32(float %8, float %11, float %c.0165.us.us.us), !dbg !527
  call void @llvm.dbg.value(metadata float %12, metadata !494, metadata !DIExpression()), !dbg !520
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !528
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata float %12, metadata !494, metadata !DIExpression()), !dbg !520
  %13 = add nsw i64 %indvars.iv.next, %6, !dbg !521
  %arrayidx.us.us.us.1 = getelementptr inbounds float, float* %A.tr.ph.lcssa134, i64 %13, !dbg !523
  %14 = load float, float* %arrayidx.us.us.us.1, align 4, !dbg !523, !tbaa !117
  %15 = mul nsw i64 %indvars.iv.next, %0, !dbg !524
  %16 = add nsw i64 %15, %indvars.iv206, !dbg !525
  %arrayidx13.us.us.us.1 = getelementptr inbounds float, float* %B.tr.lcssa, i64 %16, !dbg !526
  %17 = load float, float* %arrayidx13.us.us.us.1, align 4, !dbg !526, !tbaa !117
  %18 = tail call float @llvm.fmuladd.f32(float %14, float %17, float %12), !dbg !527
  call void @llvm.dbg.value(metadata float %18, metadata !494, metadata !DIExpression()), !dbg !520
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !528
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1, metadata !492, metadata !DIExpression()), !dbg !514
  %niter272.next.1 = add i64 %niter272, 2, !dbg !517
  %niter272.ncmp.1 = icmp eq i64 %niter272.next.1, %unroll_iter271, !dbg !517
  br i1 %niter272.ncmp.1, label %for.cond6.for.end_crit_edge.us.us.us.unr-lcssa, label %for.body8.us.us.us, !dbg !517, !llvm.loop !529

for.cond6.for.end_crit_edge.us.us.us.unr-lcssa:   ; preds = %for.body8.us.us.us, %for.cond6.preheader.us.us.us
  %.lcssa.ph = phi float [ undef, %for.cond6.preheader.us.us.us ], [ %18, %for.body8.us.us.us ]
  %indvars.iv.unr = phi i64 [ 0, %for.cond6.preheader.us.us.us ], [ %indvars.iv.next.1, %for.body8.us.us.us ]
  %c.0165.us.us.us.unr = phi float [ 0.000000e+00, %for.cond6.preheader.us.us.us ], [ %18, %for.body8.us.us.us ]
  br i1 %lcmp.mod269.not, label %for.cond6.for.end_crit_edge.us.us.us, label %for.body8.us.us.us.epil, !dbg !517

for.body8.us.us.us.epil:                          ; preds = %for.cond6.for.end_crit_edge.us.us.us.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata float %c.0165.us.us.us.unr, metadata !494, metadata !DIExpression()), !dbg !520
  %19 = add nsw i64 %indvars.iv.unr, %6, !dbg !521
  %arrayidx.us.us.us.epil = getelementptr inbounds float, float* %A.tr.ph.lcssa134, i64 %19, !dbg !523
  %20 = load float, float* %arrayidx.us.us.us.epil, align 4, !dbg !523, !tbaa !117
  %21 = mul nsw i64 %indvars.iv.unr, %0, !dbg !524
  %22 = add nsw i64 %21, %indvars.iv206, !dbg !525
  %arrayidx13.us.us.us.epil = getelementptr inbounds float, float* %B.tr.lcssa, i64 %22, !dbg !526
  %23 = load float, float* %arrayidx13.us.us.us.epil, align 4, !dbg !526, !tbaa !117
  %24 = tail call float @llvm.fmuladd.f32(float %20, float %23, float %c.0165.us.us.us.unr), !dbg !527
  call void @llvm.dbg.value(metadata float %24, metadata !494, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !492, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !514
  br label %for.cond6.for.end_crit_edge.us.us.us, !dbg !531

for.cond6.for.end_crit_edge.us.us.us:             ; preds = %for.cond6.for.end_crit_edge.us.us.us.unr-lcssa, %for.body8.us.us.us.epil
  %.lcssa = phi float [ %.lcssa.ph, %for.cond6.for.end_crit_edge.us.us.us.unr-lcssa ], [ %24, %for.body8.us.us.us.epil ], !dbg !527
  %25 = add nsw i64 %indvars.iv206, %6, !dbg !531
  %arrayidx18.us.us.us = getelementptr inbounds float, float* %C.tr.lcssa, i64 %25, !dbg !532
  store float %.lcssa, float* %arrayidx18.us.us.us, align 4, !dbg !533, !tbaa !117
  %indvars.iv.next207 = add nuw nsw i64 %indvars.iv206, 1, !dbg !534
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next207, metadata !493, metadata !DIExpression()), !dbg !514
  %exitcond211.not = icmp eq i64 %indvars.iv.next207, %wide.trip.count210, !dbg !535
  br i1 %exitcond211.not, label %for.cond3.for.inc22_crit_edge.split.us.us.us, label %for.cond6.preheader.us.us.us, !dbg !519, !llvm.loop !536

for.cond3.for.inc22_crit_edge.split.us.us.us:     ; preds = %for.cond6.for.end_crit_edge.us.us.us
  %indvars.iv.next213 = add nuw nsw i64 %indvars.iv212, 1, !dbg !538
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next213, metadata !489, metadata !DIExpression()), !dbg !514
  %exitcond218.not = icmp eq i64 %indvars.iv.next213, %wide.trip.count217, !dbg !515
  br i1 %exitcond218.not, label %return, label %for.cond3.preheader.us.us, !dbg !516, !llvm.loop !539

for.cond3.preheader.us:                           ; preds = %for.cond3.preheader.us, %for.cond3.preheader.us.preheader.new
  %indvar = phi i64 [ 0, %for.cond3.preheader.us.preheader.new ], [ %indvar.next.7, %for.cond3.preheader.us ]
  %niter = phi i64 [ 0, %for.cond3.preheader.us.preheader.new ], [ %niter.next.7, %for.cond3.preheader.us ]
  call void @llvm.dbg.value(metadata i64 %indvar, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i32 0, metadata !493, metadata !DIExpression()), !dbg !514
  %26 = mul nsw i64 %indvar, %0
  %scevgep = getelementptr float, float* %C.tr.lcssa, i64 %26
  %scevgep196 = bitcast float* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep196, i8 0, i64 %2, i1 false), !dbg !533, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i32 undef, metadata !494, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i32 undef, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !514
  %indvar.next = or i64 %indvar, 1, !dbg !516
  call void @llvm.dbg.value(metadata i64 %indvar.next, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i64 %indvar.next, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i32 0, metadata !493, metadata !DIExpression()), !dbg !514
  %27 = mul nsw i64 %indvar.next, %0
  %scevgep.1 = getelementptr float, float* %C.tr.lcssa, i64 %27
  %scevgep196.1 = bitcast float* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep196.1, i8 0, i64 %2, i1 false), !dbg !533, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i32 undef, metadata !494, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i32 undef, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !514
  %indvar.next.1 = or i64 %indvar, 2, !dbg !516
  call void @llvm.dbg.value(metadata i64 %indvar.next.1, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i64 %indvar.next.1, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i32 0, metadata !493, metadata !DIExpression()), !dbg !514
  %28 = mul nsw i64 %indvar.next.1, %0
  %scevgep.2 = getelementptr float, float* %C.tr.lcssa, i64 %28
  %scevgep196.2 = bitcast float* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep196.2, i8 0, i64 %2, i1 false), !dbg !533, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i32 undef, metadata !494, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i32 undef, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !514
  %indvar.next.2 = or i64 %indvar, 3, !dbg !516
  call void @llvm.dbg.value(metadata i64 %indvar.next.2, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i64 %indvar.next.2, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i32 0, metadata !493, metadata !DIExpression()), !dbg !514
  %29 = mul nsw i64 %indvar.next.2, %0
  %scevgep.3 = getelementptr float, float* %C.tr.lcssa, i64 %29
  %scevgep196.3 = bitcast float* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep196.3, i8 0, i64 %2, i1 false), !dbg !533, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i32 undef, metadata !494, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i32 undef, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !514
  %indvar.next.3 = or i64 %indvar, 4, !dbg !516
  call void @llvm.dbg.value(metadata i64 %indvar.next.3, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i64 %indvar.next.3, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i32 0, metadata !493, metadata !DIExpression()), !dbg !514
  %30 = mul nsw i64 %indvar.next.3, %0
  %scevgep.4 = getelementptr float, float* %C.tr.lcssa, i64 %30
  %scevgep196.4 = bitcast float* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep196.4, i8 0, i64 %2, i1 false), !dbg !533, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i32 undef, metadata !494, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i32 undef, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !514
  %indvar.next.4 = or i64 %indvar, 5, !dbg !516
  call void @llvm.dbg.value(metadata i64 %indvar.next.4, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i64 %indvar.next.4, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i32 0, metadata !493, metadata !DIExpression()), !dbg !514
  %31 = mul nsw i64 %indvar.next.4, %0
  %scevgep.5 = getelementptr float, float* %C.tr.lcssa, i64 %31
  %scevgep196.5 = bitcast float* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep196.5, i8 0, i64 %2, i1 false), !dbg !533, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i32 undef, metadata !494, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i32 undef, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !514
  %indvar.next.5 = or i64 %indvar, 6, !dbg !516
  call void @llvm.dbg.value(metadata i64 %indvar.next.5, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i64 %indvar.next.5, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i32 0, metadata !493, metadata !DIExpression()), !dbg !514
  %32 = mul nsw i64 %indvar.next.5, %0
  %scevgep.6 = getelementptr float, float* %C.tr.lcssa, i64 %32
  %scevgep196.6 = bitcast float* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep196.6, i8 0, i64 %2, i1 false), !dbg !533, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i32 undef, metadata !494, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i32 undef, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !514
  %indvar.next.6 = or i64 %indvar, 7, !dbg !516
  call void @llvm.dbg.value(metadata i64 %indvar.next.6, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i64 %indvar.next.6, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i32 0, metadata !493, metadata !DIExpression()), !dbg !514
  %33 = mul nsw i64 %indvar.next.6, %0
  %scevgep.7 = getelementptr float, float* %C.tr.lcssa, i64 %33
  %scevgep196.7 = bitcast float* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep196.7, i8 0, i64 %2, i1 false), !dbg !533, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i32 undef, metadata !494, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i32 undef, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !514
  %indvar.next.7 = add nuw nsw i64 %indvar, 8, !dbg !516
  call void @llvm.dbg.value(metadata i64 %indvar.next.7, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  %niter.next.7 = add i64 %niter, 8, !dbg !516
  %niter.ncmp.7 = icmp eq i64 %niter.next.7, %unroll_iter, !dbg !516
  br i1 %niter.ncmp.7, label %return.loopexit255.unr-lcssa, label %for.cond3.preheader.us, !dbg !516, !llvm.loop !539

if.end:                                           ; preds = %if.end.lr.ph, %det.cont43
  %p.tr139 = phi i32 [ %p.tr.ph157, %if.end.lr.ph ], [ %sub48, %det.cont43 ]
  %C.tr138 = phi float* [ %C.tr.ph155, %if.end.lr.ph ], [ %add.ptr47, %det.cont43 ]
  %B.tr137 = phi float* [ %B.tr.ph154, %if.end.lr.ph ], [ %add.ptr45, %det.cont43 ]
  call void @llvm.dbg.value(metadata i32 %p.tr139, metadata !487, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata float* %C.tr138, metadata !484, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata float* %B.tr137, metadata !483, metadata !DIExpression()), !dbg !510
  %cmp25.not = icmp sgt i32 %p.tr139, %n, !dbg !541
  br i1 %cmp25.not, label %if.else40, label %if.then26, !dbg !542

if.then26:                                        ; preds = %if.end
  %cmp27.not = icmp slt i32 %m.tr.ph156, %n, !dbg !543
  br i1 %cmp27.not, label %if.else, label %if.then28, !dbg !544

if.then28:                                        ; preds = %if.then26
  %shr = ashr i32 %m.tr.ph156, 1, !dbg !545
  call void @llvm.dbg.value(metadata i32 %shr, metadata !500, metadata !DIExpression()), !dbg !509
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !546

det.achd:                                         ; preds = %if.then28
  tail call void @rec_matmul(float* noundef %A.tr.ph152, float* noundef %B.tr137, float* noundef %C.tr138, i32 noundef %shr, i32 noundef %n, i32 noundef %p.tr139, i32 noundef %ld), !dbg !546
  reattach within %syncreg, label %det.cont, !dbg !546

det.cont:                                         ; preds = %det.achd, %if.then28
  %mul29 = mul nsw i32 %shr, %ld, !dbg !547
  %idx.ext = sext i32 %mul29 to i64, !dbg !548
  %add.ptr = getelementptr inbounds float, float* %A.tr.ph152, i64 %idx.ext, !dbg !548
  %add.ptr32 = getelementptr inbounds float, float* %C.tr138, i64 %idx.ext, !dbg !549
  %sub = sub nsw i32 %m.tr.ph156, %shr, !dbg !550
  %add = add nsw i32 %sub, %n
  call void @llvm.dbg.value(metadata float* %add.ptr, metadata !482, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata float* %B.tr137, metadata !483, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata float* %add.ptr32, metadata !484, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %sub, metadata !485, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %n, metadata !486, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %p.tr139, metadata !487, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %ld, metadata !488, metadata !DIExpression()), !dbg !510
  %add1135 = add nsw i32 %add, %p.tr139, !dbg !511
  %cmp136 = icmp slt i32 %add1135, 65, !dbg !512
  br i1 %cmp136, label %for.cond.preheader, label %if.end.lr.ph, !dbg !513

if.else:                                          ; preds = %if.then26
  %shr33 = ashr i32 %n, 1, !dbg !551
  call void @llvm.dbg.value(metadata i32 %shr33, metadata !505, metadata !DIExpression()), !dbg !552
  tail call void @rec_matmul(float* noundef %A.tr.ph152, float* noundef %B.tr137, float* noundef %C.tr138, i32 noundef %m.tr.ph156, i32 noundef %shr33, i32 noundef %p.tr139, i32 noundef %ld), !dbg !553
  %idx.ext34 = sext i32 %shr33 to i64, !dbg !554
  %add.ptr35 = getelementptr inbounds float, float* %A.tr.ph152, i64 %idx.ext34, !dbg !554
  %mul36 = mul nsw i32 %shr33, %ld, !dbg !555
  %idx.ext37 = sext i32 %mul36 to i64, !dbg !556
  %add.ptr38 = getelementptr inbounds float, float* %B.tr137, i64 %idx.ext37, !dbg !556
  %sub39 = sub nsw i32 %n, %shr33, !dbg !557
  tail call void @rec_matmulAdd(float* noundef %add.ptr35, float* noundef %add.ptr38, float* noundef %C.tr138, i32 noundef %m.tr.ph156, i32 noundef %sub39, i32 noundef %p.tr139, i32 noundef %ld), !dbg !558
  sync within %syncreg, label %common.ret, !dbg !559

common.ret:                                       ; preds = %return, %if.else
  ret void, !dbg !559

if.else40:                                        ; preds = %if.end
  %shr41 = ashr i32 %p.tr139, 1, !dbg !560
  call void @llvm.dbg.value(metadata i32 %shr41, metadata !507, metadata !DIExpression()), !dbg !561
  detach within %syncreg, label %det.achd42, label %det.cont43, !dbg !562

det.achd42:                                       ; preds = %if.else40
  tail call void @rec_matmul(float* noundef %A.tr.ph152, float* noundef %B.tr137, float* noundef %C.tr138, i32 noundef %m.tr.ph156, i32 noundef %n, i32 noundef %shr41, i32 noundef %ld), !dbg !562
  reattach within %syncreg, label %det.cont43, !dbg !562

det.cont43:                                       ; preds = %det.achd42, %if.else40
  %idx.ext44 = sext i32 %shr41 to i64, !dbg !563
  %add.ptr45 = getelementptr inbounds float, float* %B.tr137, i64 %idx.ext44, !dbg !563
  %add.ptr47 = getelementptr inbounds float, float* %C.tr138, i64 %idx.ext44, !dbg !564
  %sub48 = sub nsw i32 %p.tr139, %shr41, !dbg !565
  call void @llvm.dbg.value(metadata float* %A.tr.ph152, metadata !482, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata float* %add.ptr45, metadata !483, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata float* %add.ptr47, metadata !484, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %m.tr.ph156, metadata !485, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %n, metadata !486, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %sub48, metadata !487, metadata !DIExpression()), !dbg !510
  call void @llvm.dbg.value(metadata i32 %ld, metadata !488, metadata !DIExpression()), !dbg !510
  %add1 = add nsw i32 %add158, %sub48, !dbg !511
  %cmp = icmp slt i32 %add1, 65, !dbg !512
  br i1 %cmp, label %for.cond.preheader, label %if.end, !dbg !513

return.loopexit255.unr-lcssa:                     ; preds = %for.cond3.preheader.us, %for.cond3.preheader.us.preheader
  %indvar.unr = phi i64 [ 0, %for.cond3.preheader.us.preheader ], [ %indvar.next.7, %for.cond3.preheader.us ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !516
  br i1 %lcmp.mod.not, label %return, label %for.cond3.preheader.us.epil, !dbg !516

for.cond3.preheader.us.epil:                      ; preds = %return.loopexit255.unr-lcssa, %for.cond3.preheader.us.epil
  %indvar.epil = phi i64 [ %indvar.next.epil, %for.cond3.preheader.us.epil ], [ %indvar.unr, %return.loopexit255.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.cond3.preheader.us.epil ], [ 0, %return.loopexit255.unr-lcssa ]
  call void @llvm.dbg.value(metadata i64 %indvar.epil, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  call void @llvm.dbg.value(metadata i32 0, metadata !493, metadata !DIExpression()), !dbg !514
  %34 = mul nsw i64 %indvar.epil, %0
  %scevgep.epil = getelementptr float, float* %C.tr.lcssa, i64 %34
  %scevgep196.epil = bitcast float* %scevgep.epil to i8*
  call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep196.epil, i8 0, i64 %2, i1 false), !dbg !533, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !492, metadata !DIExpression()), !dbg !514
  call void @llvm.dbg.value(metadata i32 undef, metadata !494, metadata !DIExpression()), !dbg !520
  call void @llvm.dbg.value(metadata i32 undef, metadata !493, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !514
  %indvar.next.epil = add nuw nsw i64 %indvar.epil, 1, !dbg !516
  call void @llvm.dbg.value(metadata i64 %indvar.next.epil, metadata !489, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !514
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !516
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !516
  br i1 %epil.iter.cmp.not, label %return, label %for.cond3.preheader.us.epil, !dbg !516, !llvm.loop !566

return:                                           ; preds = %return.loopexit255.unr-lcssa, %for.cond3.preheader.us.epil, %for.cond3.for.inc22_crit_edge.split.us.us.us, %for.cond.preheader
  sync within %syncreg, label %common.ret, !dbg !559
}

; Function Attrs: argmemonly nofree nosync nounwind uwtable
define dso_local void @mat_vec_mul(float* noundef %A, float* noundef %R, float* noundef %P, i32 noundef %m, i32 noundef %n, i32 noundef %ld, i32 noundef %add) local_unnamed_addr #12 !dbg !568 {
entry:
  call void @llvm.dbg.value(metadata float* %A, metadata !570, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata float* %R, metadata !571, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata float* %P, metadata !572, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %m, metadata !573, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %n, metadata !574, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %ld, metadata !575, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %add, metadata !576, metadata !DIExpression()), !dbg !597
  %add1124140 = add nsw i32 %n, %m, !dbg !598
  %cmp125141 = icmp slt i32 %add1124140, 65, !dbg !599
  br i1 %cmp125141, label %if.then, label %if.else39.lr.ph, !dbg !600

if.else39.lr.ph:                                  ; preds = %entry, %if.else45
  %add.tr.ph147 = phi i32 [ 1, %if.else45 ], [ %add, %entry ]
  %n.tr.ph146 = phi i32 [ %sub51, %if.else45 ], [ %n, %entry ]
  %m.tr.ph145 = phi i32 [ %m.tr128, %if.else45 ], [ %m, %entry ]
  %P.tr.ph144 = phi float* [ %P.tr127, %if.else45 ], [ %P, %entry ]
  %R.tr.ph143 = phi float* [ %add.ptr50, %if.else45 ], [ %R, %entry ]
  %A.tr.ph142 = phi float* [ %add.ptr48, %if.else45 ], [ %A, %entry ]
  call void @llvm.dbg.value(metadata i32 %add.tr.ph147, metadata !576, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %n.tr.ph146, metadata !574, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %m.tr.ph145, metadata !573, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata float* %P.tr.ph144, metadata !572, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata float* %R.tr.ph143, metadata !571, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata float* %A.tr.ph142, metadata !570, metadata !DIExpression()), !dbg !597
  br label %if.else39, !dbg !600

if.then:                                          ; preds = %if.then41, %entry
  %R.tr.ph.lcssa = phi float* [ %R, %entry ], [ %R.tr.ph143, %if.then41 ]
  %n.tr.ph.lcssa = phi i32 [ %n, %entry ], [ %n.tr.ph146, %if.then41 ]
  %add.tr.ph.lcssa = phi i32 [ %add, %entry ], [ %add.tr.ph147, %if.then41 ]
  %A.tr.lcssa = phi float* [ %A, %entry ], [ %add.ptr, %if.then41 ]
  %P.tr.lcssa = phi float* [ %P, %entry ], [ %add.ptr44, %if.then41 ]
  %m.tr.lcssa = phi i32 [ %m, %entry ], [ %sub, %if.then41 ]
  %P.tr.lcssa190 = bitcast float* %P.tr.lcssa to i8*, !dbg !601
  %tobool.not = icmp eq i32 %add.tr.ph.lcssa, 0, !dbg !601
  br i1 %tobool.not, label %for.cond17.preheader, label %for.cond.preheader, !dbg !602

for.cond.preheader:                               ; preds = %if.else45, %if.then
  %m.tr.lcssa218 = phi i32 [ %m.tr.lcssa, %if.then ], [ %m.tr128, %if.else45 ]
  %P.tr.lcssa217 = phi float* [ %P.tr.lcssa, %if.then ], [ %P.tr127, %if.else45 ]
  %A.tr.lcssa216 = phi float* [ %A.tr.lcssa, %if.then ], [ %add.ptr48, %if.else45 ]
  %n.tr.ph.lcssa215 = phi i32 [ %n.tr.ph.lcssa, %if.then ], [ %sub51, %if.else45 ]
  %R.tr.ph.lcssa214 = phi float* [ %R.tr.ph.lcssa, %if.then ], [ %add.ptr50, %if.else45 ]
  call void @llvm.dbg.value(metadata i32 0, metadata !577, metadata !DIExpression()), !dbg !603
  %cmp3158 = icmp sgt i32 %m.tr.lcssa218, 0, !dbg !604
  br i1 %cmp3158, label %for.cond4.preheader.lr.ph, label %if.end53, !dbg !605

for.cond4.preheader.lr.ph:                        ; preds = %for.cond.preheader
  %cmp5154 = icmp sgt i32 %n.tr.ph.lcssa215, 0
  br i1 %cmp5154, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader, !dbg !606

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  %wide.trip.count = zext i32 %m.tr.lcssa218 to i64, !dbg !604
  %min.iters.check = icmp ult i32 %m.tr.lcssa218, 8, !dbg !605
  br i1 %min.iters.check, label %for.cond4.preheader.preheader249, label %vector.ph, !dbg !605

vector.ph:                                        ; preds = %for.cond4.preheader.preheader
  %n.vec = and i64 %wide.trip.count, 4294967288, !dbg !605
  %0 = add nsw i64 %n.vec, -8, !dbg !605
  %1 = lshr exact i64 %0, 3, !dbg !605
  %2 = add nuw nsw i64 %1, 1, !dbg !605
  %xtraiter = and i64 %2, 1, !dbg !605
  %3 = icmp eq i64 %0, 0, !dbg !605
  br i1 %3, label %middle.block.unr-lcssa, label %vector.ph.new, !dbg !605

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter = and i64 %2, 4611686018427387902, !dbg !605
  br label %vector.body, !dbg !605

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.1, %vector.body ], !dbg !608
  %niter = phi i64 [ 0, %vector.ph.new ], [ %niter.next.1, %vector.body ]
  %4 = getelementptr inbounds float, float* %P.tr.lcssa217, i64 %index, !dbg !608
  %5 = bitcast float* %4 to <4 x float>*, !dbg !609
  %wide.load = load <4 x float>, <4 x float>* %5, align 4, !dbg !609, !tbaa !117
  %6 = getelementptr inbounds float, float* %4, i64 4, !dbg !609
  %7 = bitcast float* %6 to <4 x float>*, !dbg !609
  %wide.load246 = load <4 x float>, <4 x float>* %7, align 4, !dbg !609, !tbaa !117
  %8 = fadd <4 x float> %wide.load, zeroinitializer, !dbg !609
  %9 = fadd <4 x float> %wide.load246, zeroinitializer, !dbg !609
  store <4 x float> %8, <4 x float>* %5, align 4, !dbg !609, !tbaa !117
  store <4 x float> %9, <4 x float>* %7, align 4, !dbg !609, !tbaa !117
  %index.next = or i64 %index, 8, !dbg !608
  %10 = getelementptr inbounds float, float* %P.tr.lcssa217, i64 %index.next, !dbg !608
  %11 = bitcast float* %10 to <4 x float>*, !dbg !609
  %wide.load.1 = load <4 x float>, <4 x float>* %11, align 4, !dbg !609, !tbaa !117
  %12 = getelementptr inbounds float, float* %10, i64 4, !dbg !609
  %13 = bitcast float* %12 to <4 x float>*, !dbg !609
  %wide.load246.1 = load <4 x float>, <4 x float>* %13, align 4, !dbg !609, !tbaa !117
  %14 = fadd <4 x float> %wide.load.1, zeroinitializer, !dbg !609
  %15 = fadd <4 x float> %wide.load246.1, zeroinitializer, !dbg !609
  store <4 x float> %14, <4 x float>* %11, align 4, !dbg !609, !tbaa !117
  store <4 x float> %15, <4 x float>* %13, align 4, !dbg !609, !tbaa !117
  %index.next.1 = add nuw i64 %index, 16, !dbg !608
  %niter.next.1 = add i64 %niter, 2, !dbg !608
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !608
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa, label %vector.body, !dbg !608, !llvm.loop !610

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !608
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil, !dbg !608

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa
  %16 = getelementptr inbounds float, float* %P.tr.lcssa217, i64 %index.unr, !dbg !608
  %17 = bitcast float* %16 to <4 x float>*, !dbg !609
  %wide.load.epil = load <4 x float>, <4 x float>* %17, align 4, !dbg !609, !tbaa !117
  %18 = getelementptr inbounds float, float* %16, i64 4, !dbg !609
  %19 = bitcast float* %18 to <4 x float>*, !dbg !609
  %wide.load246.epil = load <4 x float>, <4 x float>* %19, align 4, !dbg !609, !tbaa !117
  %20 = fadd <4 x float> %wide.load.epil, zeroinitializer, !dbg !609
  %21 = fadd <4 x float> %wide.load246.epil, zeroinitializer, !dbg !609
  store <4 x float> %20, <4 x float>* %17, align 4, !dbg !609, !tbaa !117
  store <4 x float> %21, <4 x float>* %19, align 4, !dbg !609, !tbaa !117
  br label %middle.block, !dbg !605

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count, !dbg !605
  br i1 %cmp.n, label %if.end53, label %for.cond4.preheader.preheader249, !dbg !605

for.cond4.preheader.preheader249:                 ; preds = %for.cond4.preheader.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %n.vec, %middle.block ]
  br label %for.cond4.preheader, !dbg !605

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  %22 = sext i32 %ld to i64, !dbg !605
  %wide.trip.count188 = zext i32 %m.tr.lcssa218 to i64, !dbg !604
  %wide.trip.count182 = zext i32 %n.tr.ph.lcssa215 to i64
  %23 = add nsw i64 %wide.trip.count182, -1, !dbg !605
  %xtraiter257 = and i64 %wide.trip.count182, 3
  %24 = icmp ult i64 %23, 3
  %unroll_iter260 = and i64 %wide.trip.count182, 4294967292
  %lcmp.mod258.not = icmp eq i64 %xtraiter257, 0
  br label %for.cond4.preheader.us, !dbg !605

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.for.end_crit_edge.us
  %indvars.iv184 = phi i64 [ 0, %for.cond4.preheader.us.preheader ], [ %indvars.iv.next185, %for.cond4.for.end_crit_edge.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv184, metadata !577, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 0, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float 0.000000e+00, metadata !581, metadata !DIExpression()), !dbg !612
  %25 = mul nsw i64 %indvars.iv184, %22
  br i1 %24, label %for.cond4.for.end_crit_edge.us.unr-lcssa, label %for.body6.us, !dbg !606

for.body6.us:                                     ; preds = %for.cond4.preheader.us, %for.body6.us
  %indvars.iv178 = phi i64 [ %indvars.iv.next179.3, %for.body6.us ], [ 0, %for.cond4.preheader.us ]
  %c.0155.us = phi float [ %41, %for.body6.us ], [ 0.000000e+00, %for.cond4.preheader.us ]
  %niter261 = phi i64 [ %niter261.next.3, %for.body6.us ], [ 0, %for.cond4.preheader.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv178, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float %c.0155.us, metadata !581, metadata !DIExpression()), !dbg !612
  %26 = add nsw i64 %indvars.iv178, %25, !dbg !613
  %arrayidx.us = getelementptr inbounds float, float* %A.tr.lcssa216, i64 %26, !dbg !616
  %27 = load float, float* %arrayidx.us, align 4, !dbg !616, !tbaa !117
  %arrayidx9.us = getelementptr inbounds float, float* %R.tr.ph.lcssa214, i64 %indvars.iv178, !dbg !617
  %28 = load float, float* %arrayidx9.us, align 4, !dbg !617, !tbaa !117
  %29 = tail call float @llvm.fmuladd.f32(float %27, float %28, float %c.0155.us), !dbg !618
  call void @llvm.dbg.value(metadata float %29, metadata !581, metadata !DIExpression()), !dbg !612
  %indvars.iv.next179 = or i64 %indvars.iv178, 1, !dbg !619
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next179, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next179, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float %29, metadata !581, metadata !DIExpression()), !dbg !612
  %30 = add nsw i64 %indvars.iv.next179, %25, !dbg !613
  %arrayidx.us.1 = getelementptr inbounds float, float* %A.tr.lcssa216, i64 %30, !dbg !616
  %31 = load float, float* %arrayidx.us.1, align 4, !dbg !616, !tbaa !117
  %arrayidx9.us.1 = getelementptr inbounds float, float* %R.tr.ph.lcssa214, i64 %indvars.iv.next179, !dbg !617
  %32 = load float, float* %arrayidx9.us.1, align 4, !dbg !617, !tbaa !117
  %33 = tail call float @llvm.fmuladd.f32(float %31, float %32, float %29), !dbg !618
  call void @llvm.dbg.value(metadata float %33, metadata !581, metadata !DIExpression()), !dbg !612
  %indvars.iv.next179.1 = or i64 %indvars.iv178, 2, !dbg !619
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next179.1, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next179.1, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float %33, metadata !581, metadata !DIExpression()), !dbg !612
  %34 = add nsw i64 %indvars.iv.next179.1, %25, !dbg !613
  %arrayidx.us.2 = getelementptr inbounds float, float* %A.tr.lcssa216, i64 %34, !dbg !616
  %35 = load float, float* %arrayidx.us.2, align 4, !dbg !616, !tbaa !117
  %arrayidx9.us.2 = getelementptr inbounds float, float* %R.tr.ph.lcssa214, i64 %indvars.iv.next179.1, !dbg !617
  %36 = load float, float* %arrayidx9.us.2, align 4, !dbg !617, !tbaa !117
  %37 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %33), !dbg !618
  call void @llvm.dbg.value(metadata float %37, metadata !581, metadata !DIExpression()), !dbg !612
  %indvars.iv.next179.2 = or i64 %indvars.iv178, 3, !dbg !619
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next179.2, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next179.2, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float %37, metadata !581, metadata !DIExpression()), !dbg !612
  %38 = add nsw i64 %indvars.iv.next179.2, %25, !dbg !613
  %arrayidx.us.3 = getelementptr inbounds float, float* %A.tr.lcssa216, i64 %38, !dbg !616
  %39 = load float, float* %arrayidx.us.3, align 4, !dbg !616, !tbaa !117
  %arrayidx9.us.3 = getelementptr inbounds float, float* %R.tr.ph.lcssa214, i64 %indvars.iv.next179.2, !dbg !617
  %40 = load float, float* %arrayidx9.us.3, align 4, !dbg !617, !tbaa !117
  %41 = tail call float @llvm.fmuladd.f32(float %39, float %40, float %37), !dbg !618
  call void @llvm.dbg.value(metadata float %41, metadata !581, metadata !DIExpression()), !dbg !612
  %indvars.iv.next179.3 = add nuw nsw i64 %indvars.iv178, 4, !dbg !619
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next179.3, metadata !580, metadata !DIExpression()), !dbg !603
  %niter261.next.3 = add i64 %niter261, 4, !dbg !606
  %niter261.ncmp.3 = icmp eq i64 %niter261.next.3, %unroll_iter260, !dbg !606
  br i1 %niter261.ncmp.3, label %for.cond4.for.end_crit_edge.us.unr-lcssa, label %for.body6.us, !dbg !606, !llvm.loop !620

for.cond4.for.end_crit_edge.us.unr-lcssa:         ; preds = %for.body6.us, %for.cond4.preheader.us
  %.lcssa248.ph = phi float [ undef, %for.cond4.preheader.us ], [ %41, %for.body6.us ]
  %indvars.iv178.unr = phi i64 [ 0, %for.cond4.preheader.us ], [ %indvars.iv.next179.3, %for.body6.us ]
  %c.0155.us.unr = phi float [ 0.000000e+00, %for.cond4.preheader.us ], [ %41, %for.body6.us ]
  br i1 %lcmp.mod258.not, label %for.cond4.for.end_crit_edge.us, label %for.body6.us.epil, !dbg !606

for.body6.us.epil:                                ; preds = %for.cond4.for.end_crit_edge.us.unr-lcssa, %for.body6.us.epil
  %indvars.iv178.epil = phi i64 [ %indvars.iv.next179.epil, %for.body6.us.epil ], [ %indvars.iv178.unr, %for.cond4.for.end_crit_edge.us.unr-lcssa ]
  %c.0155.us.epil = phi float [ %45, %for.body6.us.epil ], [ %c.0155.us.unr, %for.cond4.for.end_crit_edge.us.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.body6.us.epil ], [ 0, %for.cond4.for.end_crit_edge.us.unr-lcssa ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv178.epil, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float %c.0155.us.epil, metadata !581, metadata !DIExpression()), !dbg !612
  %42 = add nsw i64 %indvars.iv178.epil, %25, !dbg !613
  %arrayidx.us.epil = getelementptr inbounds float, float* %A.tr.lcssa216, i64 %42, !dbg !616
  %43 = load float, float* %arrayidx.us.epil, align 4, !dbg !616, !tbaa !117
  %arrayidx9.us.epil = getelementptr inbounds float, float* %R.tr.ph.lcssa214, i64 %indvars.iv178.epil, !dbg !617
  %44 = load float, float* %arrayidx9.us.epil, align 4, !dbg !617, !tbaa !117
  %45 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %c.0155.us.epil), !dbg !618
  call void @llvm.dbg.value(metadata float %45, metadata !581, metadata !DIExpression()), !dbg !612
  %indvars.iv.next179.epil = add nuw nsw i64 %indvars.iv178.epil, 1, !dbg !619
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next179.epil, metadata !580, metadata !DIExpression()), !dbg !603
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !606
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter257, !dbg !606
  br i1 %epil.iter.cmp.not, label %for.cond4.for.end_crit_edge.us, label %for.body6.us.epil, !dbg !606, !llvm.loop !622

for.cond4.for.end_crit_edge.us:                   ; preds = %for.body6.us.epil, %for.cond4.for.end_crit_edge.us.unr-lcssa
  %.lcssa248 = phi float [ %.lcssa248.ph, %for.cond4.for.end_crit_edge.us.unr-lcssa ], [ %45, %for.body6.us.epil ], !dbg !618
  %arrayidx12.us = getelementptr inbounds float, float* %P.tr.lcssa217, i64 %indvars.iv184, !dbg !623
  %46 = load float, float* %arrayidx12.us, align 4, !dbg !609, !tbaa !117
  %add13.us = fadd float %.lcssa248, %46, !dbg !609
  store float %add13.us, float* %arrayidx12.us, align 4, !dbg !609, !tbaa !117
  %indvars.iv.next185 = add nuw nsw i64 %indvars.iv184, 1, !dbg !608
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next185, metadata !577, metadata !DIExpression()), !dbg !603
  %exitcond189.not = icmp eq i64 %indvars.iv.next185, %wide.trip.count188, !dbg !604
  br i1 %exitcond189.not, label %if.end53, label %for.cond4.preheader.us, !dbg !605, !llvm.loop !624

for.cond17.preheader:                             ; preds = %if.then
  call void @llvm.dbg.value(metadata i32 0, metadata !577, metadata !DIExpression()), !dbg !603
  %cmp18164 = icmp sgt i32 %m.tr.lcssa, 0, !dbg !625
  br i1 %cmp18164, label %for.cond21.preheader.lr.ph, label %if.end53, !dbg !626

for.cond21.preheader.lr.ph:                       ; preds = %for.cond17.preheader
  %cmp22160 = icmp sgt i32 %n.tr.ph.lcssa, 0
  br i1 %cmp22160, label %for.cond21.preheader.us.preheader, label %for.cond21.preheader.preheader, !dbg !627

for.cond21.preheader.preheader:                   ; preds = %for.cond21.preheader.lr.ph
  %47 = zext i32 %m.tr.lcssa to i64, !dbg !626
  %48 = shl nuw nsw i64 %47, 2, !dbg !626
  call void @llvm.memset.p0i8.i64(i8* align 4 %P.tr.lcssa190, i8 0, i64 %48, i1 false), !dbg !629, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 undef, metadata !587, metadata !DIExpression()), !dbg !630
  call void @llvm.dbg.value(metadata i32 undef, metadata !577, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !603
  br label %if.end53, !dbg !631

for.cond21.preheader.us.preheader:                ; preds = %for.cond21.preheader.lr.ph
  %49 = sext i32 %ld to i64, !dbg !626
  %wide.trip.count204 = zext i32 %m.tr.lcssa to i64, !dbg !625
  %wide.trip.count198 = zext i32 %n.tr.ph.lcssa to i64
  %50 = add nsw i64 %wide.trip.count198, -1, !dbg !626
  %xtraiter262 = and i64 %wide.trip.count198, 3
  %51 = icmp ult i64 %50, 3
  %unroll_iter266 = and i64 %wide.trip.count198, 4294967292
  %lcmp.mod264.not = icmp eq i64 %xtraiter262, 0
  br label %for.cond21.preheader.us, !dbg !626

for.cond21.preheader.us:                          ; preds = %for.cond21.preheader.us.preheader, %for.cond21.for.end33_crit_edge.us
  %indvars.iv200 = phi i64 [ 0, %for.cond21.preheader.us.preheader ], [ %indvars.iv.next201, %for.cond21.for.end33_crit_edge.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv200, metadata !577, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 0, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float 0.000000e+00, metadata !587, metadata !DIExpression()), !dbg !630
  %52 = mul nsw i64 %indvars.iv200, %49
  br i1 %51, label %for.cond21.for.end33_crit_edge.us.unr-lcssa, label %for.body23.us, !dbg !627

for.body23.us:                                    ; preds = %for.cond21.preheader.us, %for.body23.us
  %indvars.iv194 = phi i64 [ %indvars.iv.next195.3, %for.body23.us ], [ 0, %for.cond21.preheader.us ]
  %c20.0161.us = phi float [ %68, %for.body23.us ], [ 0.000000e+00, %for.cond21.preheader.us ]
  %niter267 = phi i64 [ %niter267.next.3, %for.body23.us ], [ 0, %for.cond21.preheader.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv194, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float %c20.0161.us, metadata !587, metadata !DIExpression()), !dbg !630
  %53 = add nsw i64 %indvars.iv194, %52, !dbg !632
  %arrayidx27.us = getelementptr inbounds float, float* %A.tr.lcssa, i64 %53, !dbg !635
  %54 = load float, float* %arrayidx27.us, align 4, !dbg !635, !tbaa !117
  %arrayidx29.us = getelementptr inbounds float, float* %R.tr.ph.lcssa, i64 %indvars.iv194, !dbg !636
  %55 = load float, float* %arrayidx29.us, align 4, !dbg !636, !tbaa !117
  %56 = tail call float @llvm.fmuladd.f32(float %54, float %55, float %c20.0161.us), !dbg !637
  call void @llvm.dbg.value(metadata float %56, metadata !587, metadata !DIExpression()), !dbg !630
  %indvars.iv.next195 = or i64 %indvars.iv194, 1, !dbg !638
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next195, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next195, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float %56, metadata !587, metadata !DIExpression()), !dbg !630
  %57 = add nsw i64 %indvars.iv.next195, %52, !dbg !632
  %arrayidx27.us.1 = getelementptr inbounds float, float* %A.tr.lcssa, i64 %57, !dbg !635
  %58 = load float, float* %arrayidx27.us.1, align 4, !dbg !635, !tbaa !117
  %arrayidx29.us.1 = getelementptr inbounds float, float* %R.tr.ph.lcssa, i64 %indvars.iv.next195, !dbg !636
  %59 = load float, float* %arrayidx29.us.1, align 4, !dbg !636, !tbaa !117
  %60 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %56), !dbg !637
  call void @llvm.dbg.value(metadata float %60, metadata !587, metadata !DIExpression()), !dbg !630
  %indvars.iv.next195.1 = or i64 %indvars.iv194, 2, !dbg !638
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next195.1, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next195.1, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float %60, metadata !587, metadata !DIExpression()), !dbg !630
  %61 = add nsw i64 %indvars.iv.next195.1, %52, !dbg !632
  %arrayidx27.us.2 = getelementptr inbounds float, float* %A.tr.lcssa, i64 %61, !dbg !635
  %62 = load float, float* %arrayidx27.us.2, align 4, !dbg !635, !tbaa !117
  %arrayidx29.us.2 = getelementptr inbounds float, float* %R.tr.ph.lcssa, i64 %indvars.iv.next195.1, !dbg !636
  %63 = load float, float* %arrayidx29.us.2, align 4, !dbg !636, !tbaa !117
  %64 = tail call float @llvm.fmuladd.f32(float %62, float %63, float %60), !dbg !637
  call void @llvm.dbg.value(metadata float %64, metadata !587, metadata !DIExpression()), !dbg !630
  %indvars.iv.next195.2 = or i64 %indvars.iv194, 3, !dbg !638
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next195.2, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next195.2, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float %64, metadata !587, metadata !DIExpression()), !dbg !630
  %65 = add nsw i64 %indvars.iv.next195.2, %52, !dbg !632
  %arrayidx27.us.3 = getelementptr inbounds float, float* %A.tr.lcssa, i64 %65, !dbg !635
  %66 = load float, float* %arrayidx27.us.3, align 4, !dbg !635, !tbaa !117
  %arrayidx29.us.3 = getelementptr inbounds float, float* %R.tr.ph.lcssa, i64 %indvars.iv.next195.2, !dbg !636
  %67 = load float, float* %arrayidx29.us.3, align 4, !dbg !636, !tbaa !117
  %68 = tail call float @llvm.fmuladd.f32(float %66, float %67, float %64), !dbg !637
  call void @llvm.dbg.value(metadata float %68, metadata !587, metadata !DIExpression()), !dbg !630
  %indvars.iv.next195.3 = add nuw nsw i64 %indvars.iv194, 4, !dbg !638
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next195.3, metadata !580, metadata !DIExpression()), !dbg !603
  %niter267.next.3 = add i64 %niter267, 4, !dbg !627
  %niter267.ncmp.3 = icmp eq i64 %niter267.next.3, %unroll_iter266, !dbg !627
  br i1 %niter267.ncmp.3, label %for.cond21.for.end33_crit_edge.us.unr-lcssa, label %for.body23.us, !dbg !627, !llvm.loop !639

for.cond21.for.end33_crit_edge.us.unr-lcssa:      ; preds = %for.body23.us, %for.cond21.preheader.us
  %.lcssa.ph = phi float [ undef, %for.cond21.preheader.us ], [ %68, %for.body23.us ]
  %indvars.iv194.unr = phi i64 [ 0, %for.cond21.preheader.us ], [ %indvars.iv.next195.3, %for.body23.us ]
  %c20.0161.us.unr = phi float [ 0.000000e+00, %for.cond21.preheader.us ], [ %68, %for.body23.us ]
  br i1 %lcmp.mod264.not, label %for.cond21.for.end33_crit_edge.us, label %for.body23.us.epil, !dbg !627

for.body23.us.epil:                               ; preds = %for.cond21.for.end33_crit_edge.us.unr-lcssa, %for.body23.us.epil
  %indvars.iv194.epil = phi i64 [ %indvars.iv.next195.epil, %for.body23.us.epil ], [ %indvars.iv194.unr, %for.cond21.for.end33_crit_edge.us.unr-lcssa ]
  %c20.0161.us.epil = phi float [ %72, %for.body23.us.epil ], [ %c20.0161.us.unr, %for.cond21.for.end33_crit_edge.us.unr-lcssa ]
  %epil.iter263 = phi i64 [ %epil.iter263.next, %for.body23.us.epil ], [ 0, %for.cond21.for.end33_crit_edge.us.unr-lcssa ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv194.epil, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float %c20.0161.us.epil, metadata !587, metadata !DIExpression()), !dbg !630
  %69 = add nsw i64 %indvars.iv194.epil, %52, !dbg !632
  %arrayidx27.us.epil = getelementptr inbounds float, float* %A.tr.lcssa, i64 %69, !dbg !635
  %70 = load float, float* %arrayidx27.us.epil, align 4, !dbg !635, !tbaa !117
  %arrayidx29.us.epil = getelementptr inbounds float, float* %R.tr.ph.lcssa, i64 %indvars.iv194.epil, !dbg !636
  %71 = load float, float* %arrayidx29.us.epil, align 4, !dbg !636, !tbaa !117
  %72 = tail call float @llvm.fmuladd.f32(float %70, float %71, float %c20.0161.us.epil), !dbg !637
  call void @llvm.dbg.value(metadata float %72, metadata !587, metadata !DIExpression()), !dbg !630
  %indvars.iv.next195.epil = add nuw nsw i64 %indvars.iv194.epil, 1, !dbg !638
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next195.epil, metadata !580, metadata !DIExpression()), !dbg !603
  %epil.iter263.next = add i64 %epil.iter263, 1, !dbg !627
  %epil.iter263.cmp.not = icmp eq i64 %epil.iter263.next, %xtraiter262, !dbg !627
  br i1 %epil.iter263.cmp.not, label %for.cond21.for.end33_crit_edge.us, label %for.body23.us.epil, !dbg !627, !llvm.loop !641

for.cond21.for.end33_crit_edge.us:                ; preds = %for.body23.us.epil, %for.cond21.for.end33_crit_edge.us.unr-lcssa
  %.lcssa = phi float [ %.lcssa.ph, %for.cond21.for.end33_crit_edge.us.unr-lcssa ], [ %72, %for.body23.us.epil ], !dbg !637
  %arrayidx35.us = getelementptr inbounds float, float* %P.tr.lcssa, i64 %indvars.iv200, !dbg !642
  store float %.lcssa, float* %arrayidx35.us, align 4, !dbg !629, !tbaa !117
  %indvars.iv.next201 = add nuw nsw i64 %indvars.iv200, 1, !dbg !643
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next201, metadata !577, metadata !DIExpression()), !dbg !603
  %exitcond205.not = icmp eq i64 %indvars.iv.next201, %wide.trip.count204, !dbg !625
  br i1 %exitcond205.not, label %if.end53, label %for.cond21.preheader.us, !dbg !626, !llvm.loop !644

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader249, %for.cond4.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond4.preheader ], [ %indvars.iv.ph, %for.cond4.preheader.preheader249 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !577, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata i32 0, metadata !580, metadata !DIExpression()), !dbg !603
  call void @llvm.dbg.value(metadata float 0.000000e+00, metadata !581, metadata !DIExpression()), !dbg !612
  %arrayidx12 = getelementptr inbounds float, float* %P.tr.lcssa217, i64 %indvars.iv, !dbg !623
  %73 = load float, float* %arrayidx12, align 4, !dbg !609, !tbaa !117
  %add13 = fadd float %73, 0.000000e+00, !dbg !609
  store float %add13, float* %arrayidx12, align 4, !dbg !609, !tbaa !117
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !608
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !577, metadata !DIExpression()), !dbg !603
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !604
  br i1 %exitcond.not, label %if.end53, label %for.cond4.preheader, !dbg !605, !llvm.loop !646

if.else39:                                        ; preds = %if.else39.lr.ph, %if.then41
  %m.tr128 = phi i32 [ %m.tr.ph145, %if.else39.lr.ph ], [ %sub, %if.then41 ]
  %P.tr127 = phi float* [ %P.tr.ph144, %if.else39.lr.ph ], [ %add.ptr44, %if.then41 ]
  %A.tr126 = phi float* [ %A.tr.ph142, %if.else39.lr.ph ], [ %add.ptr, %if.then41 ]
  call void @llvm.dbg.value(metadata i32 %m.tr128, metadata !573, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata float* %P.tr127, metadata !572, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata float* %A.tr126, metadata !570, metadata !DIExpression()), !dbg !597
  %cmp40.not = icmp slt i32 %m.tr128, %n.tr.ph146, !dbg !647
  br i1 %cmp40.not, label %if.else45, label %if.then41, !dbg !648

if.then41:                                        ; preds = %if.else39
  %shr = ashr i32 %m.tr128, 1, !dbg !649
  call void @llvm.dbg.value(metadata i32 %shr, metadata !592, metadata !DIExpression()), !dbg !650
  tail call void @mat_vec_mul(float* noundef %A.tr126, float* noundef %R.tr.ph143, float* noundef %P.tr127, i32 noundef %shr, i32 noundef %n.tr.ph146, i32 noundef %ld, i32 noundef %add.tr.ph147), !dbg !651
  %mul42 = mul nsw i32 %shr, %ld, !dbg !652
  %idx.ext = sext i32 %mul42 to i64, !dbg !653
  %add.ptr = getelementptr inbounds float, float* %A.tr126, i64 %idx.ext, !dbg !653
  %idx.ext43 = sext i32 %shr to i64, !dbg !654
  %add.ptr44 = getelementptr inbounds float, float* %P.tr127, i64 %idx.ext43, !dbg !654
  %sub = sub nsw i32 %m.tr128, %shr, !dbg !655
  call void @llvm.dbg.value(metadata float* %add.ptr, metadata !570, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata float* %R.tr.ph143, metadata !571, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata float* %add.ptr44, metadata !572, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %sub, metadata !573, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %n.tr.ph146, metadata !574, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %ld, metadata !575, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %add.tr.ph147, metadata !576, metadata !DIExpression()), !dbg !597
  %add1 = add nsw i32 %n.tr.ph146, %sub, !dbg !598
  %cmp = icmp slt i32 %add1, 65, !dbg !599
  br i1 %cmp, label %if.then, label %if.else39, !dbg !600

if.else45:                                        ; preds = %if.else39
  %shr46 = ashr i32 %n.tr.ph146, 1, !dbg !656
  call void @llvm.dbg.value(metadata i32 %shr46, metadata !595, metadata !DIExpression()), !dbg !657
  tail call void @mat_vec_mul(float* noundef %A.tr126, float* noundef %R.tr.ph143, float* noundef %P.tr127, i32 noundef %m.tr128, i32 noundef %shr46, i32 noundef %ld, i32 noundef %add.tr.ph147), !dbg !658
  %idx.ext47 = sext i32 %shr46 to i64, !dbg !659
  %add.ptr48 = getelementptr inbounds float, float* %A.tr126, i64 %idx.ext47, !dbg !659
  %add.ptr50 = getelementptr inbounds float, float* %R.tr.ph143, i64 %idx.ext47, !dbg !660
  %sub51 = sub nsw i32 %n.tr.ph146, %shr46, !dbg !661
  call void @llvm.dbg.value(metadata float* %add.ptr48, metadata !570, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata float* %add.ptr50, metadata !571, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata float* %P.tr127, metadata !572, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %m.tr128, metadata !573, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %sub51, metadata !574, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 %ld, metadata !575, metadata !DIExpression()), !dbg !597
  call void @llvm.dbg.value(metadata i32 1, metadata !576, metadata !DIExpression()), !dbg !597
  %add1124 = add nsw i32 %sub51, %m.tr128, !dbg !598
  %cmp125 = icmp slt i32 %add1124, 65, !dbg !599
  br i1 %cmp125, label %for.cond.preheader, label %if.else39.lr.ph, !dbg !600

if.end53:                                         ; preds = %for.cond4.preheader, %for.cond4.for.end_crit_edge.us, %for.cond21.for.end33_crit_edge.us, %middle.block, %for.cond21.preheader.preheader, %for.cond.preheader, %for.cond17.preheader
  ret void, !dbg !631
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** noundef %argv) local_unnamed_addr #14 !dbg !662 {
entry:
  %n = alloca i32, align 4
  %check = alloca i32, align 4
  %rand_check = alloca i32, align 4
  %help = alloca i32, align 4
  %round = alloca i32, align 4
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !668, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata i8** %argv, metadata !669, metadata !DIExpression()), !dbg !690
  %0 = bitcast i32* %n to i8*, !dbg !691
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #22, !dbg !691
  call void @llvm.dbg.value(metadata i32 1024, metadata !670, metadata !DIExpression()), !dbg !690
  store i32 1024, i32* %n, align 4, !dbg !692, !tbaa !693
  %1 = bitcast i32* %check to i8*, !dbg !695
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #22, !dbg !695
  call void @llvm.dbg.value(metadata i32 0, metadata !671, metadata !DIExpression()), !dbg !690
  store i32 0, i32* %check, align 4, !dbg !696, !tbaa !693
  %2 = bitcast i32* %rand_check to i8*, !dbg !695
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #22, !dbg !695
  call void @llvm.dbg.value(metadata i32 0, metadata !672, metadata !DIExpression()), !dbg !690
  store i32 0, i32* %rand_check, align 4, !dbg !697, !tbaa !693
  %3 = bitcast i32* %help to i8*, !dbg !695
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #22, !dbg !695
  call void @llvm.dbg.value(metadata i32 0, metadata !673, metadata !DIExpression()), !dbg !690
  store i32 0, i32* %help, align 4, !dbg !698, !tbaa !693
  %4 = bitcast i32* %round to i8*, !dbg !699
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #22, !dbg !699
  call void @llvm.dbg.value(metadata i32 1, metadata !674, metadata !DIExpression()), !dbg !690
  store i32 1, i32* %round, align 4, !dbg !700, !tbaa !693
  call void @llvm.dbg.value(metadata i32* %n, metadata !670, metadata !DIExpression(DW_OP_deref)), !dbg !690
  call void @llvm.dbg.value(metadata i32* %check, metadata !671, metadata !DIExpression(DW_OP_deref)), !dbg !690
  call void @llvm.dbg.value(metadata i32* %rand_check, metadata !672, metadata !DIExpression(DW_OP_deref)), !dbg !690
  call void @llvm.dbg.value(metadata i32* %help, metadata !673, metadata !DIExpression(DW_OP_deref)), !dbg !690
  call void @llvm.dbg.value(metadata i32* %round, metadata !674, metadata !DIExpression(DW_OP_deref)), !dbg !690
  call void (i32, i8**, i8**, i32*, ...) @get_options(i32 noundef %argc, i8** noundef %argv, i8** noundef getelementptr inbounds ([6 x i8*], [6 x i8*]* @specifiers, i64 0, i64 0), i32* noundef getelementptr inbounds ([6 x i32], [6 x i32]* @opt_types, i64 0, i64 0), i32* noundef nonnull %n, i32* noundef nonnull %check, i32* noundef nonnull %rand_check, i32* noundef nonnull %help, i32* noundef nonnull %round) #22, !dbg !701
  %5 = load i32, i32* %help, align 4, !dbg !702, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %5, metadata !673, metadata !DIExpression()), !dbg !690
  %tobool.not = icmp eq i32 %5, 0, !dbg !702
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !704

if.then:                                          ; preds = %entry
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !705, !tbaa !707
  %7 = call i64 @fwrite(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.7, i64 0, i64 0), i64 57, i64 1, %struct._IO_FILE* %6) #23, !dbg !709
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !710, !tbaa !707
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.8, i64 0, i64 0), i64 69, i64 1, %struct._IO_FILE* %8) #23, !dbg !711
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !712, !tbaa !707
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([80 x i8], [80 x i8]* @.str.9, i64 0, i64 0), i64 79, i64 1, %struct._IO_FILE* %10) #23, !dbg !713
  call void @exit(i32 noundef 1) #24, !dbg !714
  unreachable, !dbg !714

if.end:                                           ; preds = %entry
  call void @startup_cilk(), !dbg !715
  call void @llvm.dbg.value(metadata i32 0, metadata !683, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata float* undef, metadata !678, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* undef, metadata !681, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* undef, metadata !680, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* undef, metadata !679, metadata !DIExpression()), !dbg !690
  %12 = load i32, i32* %round, align 4, !dbg !717, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %12, metadata !674, metadata !DIExpression()), !dbg !690
  %cmp189 = icmp sgt i32 %12, 0, !dbg !718
  br i1 %cmp189, label %for.body.lr.ph, label %for.cond.cleanup, !dbg !719

for.body.lr.ph:                                   ; preds = %if.end
  %13 = bitcast %struct.timeval* %t1 to i8*
  %14 = bitcast %struct.timeval* %t2 to i8*
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1
  %tv_sec.i126 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0
  %tv_usec.i128 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1
  br label %for.body, !dbg !719

for.cond.cleanup:                                 ; preds = %if.end59, %if.end
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #22, !dbg !720
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #22, !dbg !720
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #22, !dbg !720
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #22, !dbg !720
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #22, !dbg !720
  ret i32 0, !dbg !721

for.body:                                         ; preds = %for.body.lr.ph, %if.end59
  %R.0194 = phi float* [ undef, %for.body.lr.ph ], [ %R.1161181, %if.end59 ]
  %r.0193 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %if.end59 ]
  %C2.0192 = phi float* [ undef, %for.body.lr.ph ], [ %C2.1160182, %if.end59 ]
  %P2.0191 = phi float* [ undef, %for.body.lr.ph ], [ %P2.1157183, %if.end59 ]
  %P1.0190 = phi float* [ undef, %for.body.lr.ph ], [ %P1.1154184, %if.end59 ]
  call void @llvm.dbg.value(metadata float* %R.0194, metadata !678, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata i32 %r.0193, metadata !683, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata float* %C2.0192, metadata !681, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %P2.0191, metadata !680, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %P1.0190, metadata !679, metadata !DIExpression()), !dbg !690
  %15 = load i32, i32* %n, align 4, !dbg !722, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %15, metadata !670, metadata !DIExpression()), !dbg !690
  %mul = mul nsw i32 %15, %15, !dbg !723
  %conv = zext i32 %mul to i64, !dbg !722
  %mul3 = shl nuw nsw i64 %conv, 2, !dbg !724
  %call4 = call noalias i8* @malloc(i64 noundef %mul3) #22, !dbg !725
  %16 = bitcast i8* %call4 to float*, !dbg !726
  call void @llvm.dbg.value(metadata float* %16, metadata !675, metadata !DIExpression()), !dbg !690
  %call8 = call noalias i8* @malloc(i64 noundef %mul3) #22, !dbg !727
  %17 = bitcast i8* %call8 to float*, !dbg !728
  call void @llvm.dbg.value(metadata float* %17, metadata !676, metadata !DIExpression()), !dbg !690
  %call12 = call noalias i8* @malloc(i64 noundef %mul3) #22, !dbg !729
  %18 = bitcast i8* %call12 to float*, !dbg !730
  call void @llvm.dbg.value(metadata float* %18, metadata !677, metadata !DIExpression()), !dbg !690
  %19 = load i32, i32* %rand_check, align 4, !dbg !731, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %19, metadata !672, metadata !DIExpression()), !dbg !690
  %tobool13.not = icmp eq i32 %19, 0, !dbg !731
  br i1 %tobool13.not, label %if.else, label %if.then14, !dbg !733

if.then14:                                        ; preds = %for.body
  call void @llvm.dbg.value(metadata i32 %15, metadata !670, metadata !DIExpression()), !dbg !690
  %conv15 = sext i32 %15 to i64, !dbg !734
  %mul16 = shl nsw i64 %conv15, 2, !dbg !736
  %call17 = call noalias i8* @malloc(i64 noundef %mul16) #22, !dbg !737
  %20 = bitcast i8* %call17 to float*, !dbg !738
  call void @llvm.dbg.value(metadata float* %20, metadata !678, metadata !DIExpression()), !dbg !690
  %call20 = call noalias i8* @malloc(i64 noundef %mul16) #22, !dbg !739
  %21 = bitcast i8* %call20 to float*, !dbg !740
  call void @llvm.dbg.value(metadata float* %21, metadata !679, metadata !DIExpression()), !dbg !690
  %call23 = call noalias i8* @malloc(i64 noundef %mul16) #22, !dbg !741
  %22 = bitcast i8* %call23 to float*, !dbg !742
  call void @llvm.dbg.value(metadata float* %22, metadata !680, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %20, metadata !122, metadata !DIExpression()), !dbg !743
  call void @llvm.dbg.value(metadata i32 %15, metadata !123, metadata !DIExpression()), !dbg !743
  call void @llvm.dbg.value(metadata i32 0, metadata !124, metadata !DIExpression()), !dbg !743
  %cmp5.i = icmp sgt i32 %15, 0, !dbg !745
  br i1 %cmp5.i, label %for.body.preheader.i, label %init.exit122, !dbg !746

for.body.preheader.i:                             ; preds = %if.then14
  %rand_nxt.promoted.i = load i64, i64* @rand_nxt, align 8, !tbaa !95
  %wide.trip.count.i = zext i32 %15 to i64, !dbg !745
  %xtraiter = and i64 %wide.trip.count.i, 1, !dbg !746
  %23 = icmp eq i32 %15, 1, !dbg !746
  br i1 %23, label %for.cond.for.end_crit_edge.i.unr-lcssa, label %for.body.preheader.i.new, !dbg !746

for.body.preheader.i.new:                         ; preds = %for.body.preheader.i
  %unroll_iter = and i64 %wide.trip.count.i, 4294967294, !dbg !746
  br label %for.body.i, !dbg !746

for.body.i:                                       ; preds = %for.body.i, %for.body.preheader.i.new
  %indvars.iv.i = phi i64 [ 0, %for.body.preheader.i.new ], [ %indvars.iv.next.i.1, %for.body.i ]
  %add.i46.i = phi i64 [ %rand_nxt.promoted.i, %for.body.preheader.i.new ], [ %add.i.i.1, %for.body.i ]
  %niter = phi i64 [ 0, %for.body.preheader.i.new ], [ %niter.next.1, %for.body.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !124, metadata !DIExpression()), !dbg !743
  %mul.i.i = mul i64 %add.i46.i, 1103515245, !dbg !747
  %add.i.i = add i64 %mul.i.i, 12345, !dbg !749
  %shr.i.i = lshr i64 %add.i.i, 16, !dbg !750
  %24 = trunc i64 %shr.i.i to i32, !dbg !751
  %conv.i.i = and i32 %24, 2147483647, !dbg !751
  call void @llvm.dbg.value(metadata i32 %conv.i.i, metadata !93, metadata !DIExpression()), !dbg !752
  %conv.i = sitofp i32 %conv.i.i to float, !dbg !753
  %arrayidx.i = getelementptr inbounds float, float* %20, i64 %indvars.iv.i, !dbg !754
  store float %conv.i, float* %arrayidx.i, align 4, !dbg !755, !tbaa !117
  %indvars.iv.next.i = or i64 %indvars.iv.i, 1, !dbg !756
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !124, metadata !DIExpression()), !dbg !743
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !124, metadata !DIExpression()), !dbg !743
  %mul.i.i.1 = mul i64 %add.i.i, 1103515245, !dbg !747
  %add.i.i.1 = add i64 %mul.i.i.1, 12345, !dbg !749
  %shr.i.i.1 = lshr i64 %add.i.i.1, 16, !dbg !750
  %25 = trunc i64 %shr.i.i.1 to i32, !dbg !751
  %conv.i.i.1 = and i32 %25, 2147483647, !dbg !751
  call void @llvm.dbg.value(metadata i32 %conv.i.i.1, metadata !93, metadata !DIExpression()), !dbg !752
  %conv.i.1 = sitofp i32 %conv.i.i.1 to float, !dbg !753
  %arrayidx.i.1 = getelementptr inbounds float, float* %20, i64 %indvars.iv.next.i, !dbg !754
  store float %conv.i.1, float* %arrayidx.i.1, align 4, !dbg !755, !tbaa !117
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2, !dbg !756
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.1, metadata !124, metadata !DIExpression()), !dbg !743
  %niter.next.1 = add i64 %niter, 2, !dbg !746
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !746
  br i1 %niter.ncmp.1, label %for.cond.for.end_crit_edge.i.unr-lcssa, label %for.body.i, !dbg !746, !llvm.loop !757

for.cond.for.end_crit_edge.i.unr-lcssa:           ; preds = %for.body.i, %for.body.preheader.i
  %add.i.i.lcssa.ph = phi i64 [ undef, %for.body.preheader.i ], [ %add.i.i.1, %for.body.i ]
  %indvars.iv.i.unr = phi i64 [ 0, %for.body.preheader.i ], [ %indvars.iv.next.i.1, %for.body.i ]
  %add.i46.i.unr = phi i64 [ %rand_nxt.promoted.i, %for.body.preheader.i ], [ %add.i.i.1, %for.body.i ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !746
  br i1 %lcmp.mod.not, label %for.cond.for.end_crit_edge.i, label %for.body.i.epil, !dbg !746

for.body.i.epil:                                  ; preds = %for.cond.for.end_crit_edge.i.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i.unr, metadata !124, metadata !DIExpression()), !dbg !743
  %mul.i.i.epil = mul i64 %add.i46.i.unr, 1103515245, !dbg !747
  %add.i.i.epil = add i64 %mul.i.i.epil, 12345, !dbg !749
  %shr.i.i.epil = lshr i64 %add.i.i.epil, 16, !dbg !750
  %26 = trunc i64 %shr.i.i.epil to i32, !dbg !751
  %conv.i.i.epil = and i32 %26, 2147483647, !dbg !751
  call void @llvm.dbg.value(metadata i32 %conv.i.i.epil, metadata !93, metadata !DIExpression()), !dbg !752
  %conv.i.epil = sitofp i32 %conv.i.i.epil to float, !dbg !753
  %arrayidx.i.epil = getelementptr inbounds float, float* %20, i64 %indvars.iv.i.unr, !dbg !754
  store float %conv.i.epil, float* %arrayidx.i.epil, align 4, !dbg !755, !tbaa !117
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i.unr, metadata !124, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !743
  br label %for.cond.for.end_crit_edge.i, !dbg !759

for.cond.for.end_crit_edge.i:                     ; preds = %for.cond.for.end_crit_edge.i.unr-lcssa, %for.body.i.epil
  %add.i.i.lcssa = phi i64 [ %add.i.i.lcssa.ph, %for.cond.for.end_crit_edge.i.unr-lcssa ], [ %add.i.i.epil, %for.body.i.epil ], !dbg !749
  store i64 %add.i.i.lcssa, i64* @rand_nxt, align 8, !dbg !759, !tbaa !95
  br label %if.end31, !dbg !746

if.else:                                          ; preds = %for.body
  %27 = load i32, i32* %check, align 4, !dbg !760, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %27, metadata !671, metadata !DIExpression()), !dbg !690
  %tobool24.not = icmp eq i32 %27, 0, !dbg !760
  br i1 %tobool24.not, label %if.end31, label %if.then25, !dbg !762

if.then25:                                        ; preds = %if.else
  call void @llvm.dbg.value(metadata i32 %15, metadata !670, metadata !DIExpression()), !dbg !690
  %call29 = call noalias i8* @malloc(i64 noundef %mul3) #22, !dbg !763
  %28 = bitcast i8* %call29 to float*, !dbg !765
  call void @llvm.dbg.value(metadata float* %28, metadata !681, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %28, metadata !254, metadata !DIExpression()) #22, !dbg !766
  call void @llvm.dbg.value(metadata i32 %15, metadata !255, metadata !DIExpression()) #22, !dbg !766
  call void @llvm.dbg.value(metadata i32 0, metadata !256, metadata !DIExpression()) #22, !dbg !766
  %cmp17.i = icmp sgt i32 %15, 0, !dbg !768
  br i1 %cmp17.i, label %if.end31.thread165, label %init.exit122, !dbg !769

if.end31.thread165:                               ; preds = %if.then25
  %29 = zext i32 %15 to i64, !dbg !769
  %30 = shl nuw nsw i64 %29, 2, !dbg !769
  %31 = mul nuw i64 %30, %29, !dbg !769
  call void @llvm.memset.p0i8.i64(i8* align 4 %call29, i8 0, i64 %31, i1 false) #22, !dbg !770, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !257, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !766
  call void @llvm.dbg.value(metadata i32 undef, metadata !256, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #22, !dbg !766
  call void @llvm.dbg.value(metadata float* %R.1, metadata !678, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* undef, metadata !681, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %P2.1, metadata !680, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %P1.1, metadata !679, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata i32 %15, metadata !670, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %16, metadata !271, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata i32 %15, metadata !272, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata i32 0, metadata !273, metadata !DIExpression()), !dbg !771
  br label %for.cond1.preheader.us.preheader.i96, !dbg !773

if.end31:                                         ; preds = %for.cond.for.end_crit_edge.i, %if.else
  %P1.1 = phi float* [ %P1.0190, %if.else ], [ %21, %for.cond.for.end_crit_edge.i ]
  %P2.1 = phi float* [ %P2.0191, %if.else ], [ %22, %for.cond.for.end_crit_edge.i ]
  %R.1 = phi float* [ %R.0194, %if.else ], [ %20, %for.cond.for.end_crit_edge.i ]
  call void @llvm.dbg.value(metadata float* %R.1, metadata !678, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %C2.0192, metadata !681, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %P2.1, metadata !680, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %P1.1, metadata !679, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata i32 %15, metadata !670, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %16, metadata !271, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata i32 %15, metadata !272, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata i32 0, metadata !273, metadata !DIExpression()), !dbg !771
  %cmp24.i = icmp sgt i32 %15, 0, !dbg !774
  br i1 %cmp24.i, label %if.end31.for.cond1.preheader.us.preheader.i96_crit_edge, label %init.exit122, !dbg !773

if.end31.for.cond1.preheader.us.preheader.i96_crit_edge: ; preds = %if.end31
  %.pre = zext i32 %15 to i64, !dbg !773
  br label %for.cond1.preheader.us.preheader.i96, !dbg !773

for.cond1.preheader.us.preheader.i96:             ; preds = %if.end31.for.cond1.preheader.us.preheader.i96_crit_edge, %if.end31.thread165
  %.pre-phi = phi i64 [ %.pre, %if.end31.for.cond1.preheader.us.preheader.i96_crit_edge ], [ %29, %if.end31.thread165 ], !dbg !773
  %R.1174 = phi float* [ %R.1, %if.end31.for.cond1.preheader.us.preheader.i96_crit_edge ], [ %R.0194, %if.end31.thread165 ]
  %C2.1173 = phi float* [ %C2.0192, %if.end31.for.cond1.preheader.us.preheader.i96_crit_edge ], [ %28, %if.end31.thread165 ]
  %P2.1172 = phi float* [ %P2.1, %if.end31.for.cond1.preheader.us.preheader.i96_crit_edge ], [ %P2.0191, %if.end31.thread165 ]
  %P1.1171 = phi float* [ %P1.1, %if.end31.for.cond1.preheader.us.preheader.i96_crit_edge ], [ %P1.0190, %if.end31.thread165 ]
  %rand_nxt.promoted21.i = load i64, i64* @rand_nxt, align 8, !tbaa !95
  %32 = add nsw i64 %.pre-phi, -1, !dbg !773
  %xtraiter199 = and i64 %.pre-phi, 1
  %33 = icmp eq i64 %32, 0
  %unroll_iter202 = and i64 %.pre-phi, 4294967294
  %lcmp.mod200.not = icmp eq i64 %xtraiter199, 0
  br label %for.cond1.preheader.us.i, !dbg !773

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc5_crit_edge.us.i, %for.cond1.preheader.us.preheader.i96
  %indvars.iv30.i = phi i64 [ 0, %for.cond1.preheader.us.preheader.i96 ], [ %indvars.iv.next31.i, %for.cond1.for.inc5_crit_edge.us.i ]
  %add.i.lcssa2325.us.i = phi i64 [ %rand_nxt.promoted21.i, %for.cond1.preheader.us.preheader.i96 ], [ %add.i.us.i.lcssa, %for.cond1.for.inc5_crit_edge.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv30.i, metadata !273, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata i32 0, metadata !274, metadata !DIExpression()), !dbg !771
  %34 = mul nuw nsw i64 %indvars.iv30.i, %.pre-phi
  br i1 %33, label %for.cond1.for.inc5_crit_edge.us.i.unr-lcssa, label %for.body3.us.i, !dbg !775

for.body3.us.i:                                   ; preds = %for.cond1.preheader.us.i, %for.body3.us.i
  %indvars.iv.i97 = phi i64 [ %indvars.iv.next.i98.1, %for.body3.us.i ], [ 0, %for.cond1.preheader.us.i ]
  %add.i1618.us.i = phi i64 [ %add.i.us.i.1, %for.body3.us.i ], [ %add.i.lcssa2325.us.i, %for.cond1.preheader.us.i ]
  %niter203 = phi i64 [ %niter203.next.1, %for.body3.us.i ], [ 0, %for.cond1.preheader.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i97, metadata !274, metadata !DIExpression()), !dbg !771
  %mul.i.us.i = mul i64 %add.i1618.us.i, 1103515245, !dbg !776
  %add.i.us.i = add i64 %mul.i.us.i, 12345, !dbg !778
  %shr.i.us.i = lshr i64 %add.i.us.i, 16, !dbg !779
  %35 = trunc i64 %shr.i.us.i to i32, !dbg !780
  %conv.i.us.i = and i32 %35, 2147483647, !dbg !780
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i, metadata !93, metadata !DIExpression()), !dbg !781
  %conv4.us.i = sitofp i32 %conv.i.us.i to float, !dbg !782
  %36 = add nuw nsw i64 %indvars.iv.i97, %34, !dbg !783
  %arrayidx.us.i = getelementptr inbounds float, float* %16, i64 %36, !dbg !784
  store float %conv4.us.i, float* %arrayidx.us.i, align 4, !dbg !785, !tbaa !117
  %indvars.iv.next.i98 = or i64 %indvars.iv.i97, 1, !dbg !786
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i98, metadata !274, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i98, metadata !274, metadata !DIExpression()), !dbg !771
  %mul.i.us.i.1 = mul i64 %add.i.us.i, 1103515245, !dbg !776
  %add.i.us.i.1 = add i64 %mul.i.us.i.1, 12345, !dbg !778
  %shr.i.us.i.1 = lshr i64 %add.i.us.i.1, 16, !dbg !779
  %37 = trunc i64 %shr.i.us.i.1 to i32, !dbg !780
  %conv.i.us.i.1 = and i32 %37, 2147483647, !dbg !780
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i.1, metadata !93, metadata !DIExpression()), !dbg !781
  %conv4.us.i.1 = sitofp i32 %conv.i.us.i.1 to float, !dbg !782
  %38 = add nuw nsw i64 %indvars.iv.next.i98, %34, !dbg !783
  %arrayidx.us.i.1 = getelementptr inbounds float, float* %16, i64 %38, !dbg !784
  store float %conv4.us.i.1, float* %arrayidx.us.i.1, align 4, !dbg !785, !tbaa !117
  %indvars.iv.next.i98.1 = add nuw nsw i64 %indvars.iv.i97, 2, !dbg !786
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i98.1, metadata !274, metadata !DIExpression()), !dbg !771
  %niter203.next.1 = add i64 %niter203, 2, !dbg !775
  %niter203.ncmp.1 = icmp eq i64 %niter203.next.1, %unroll_iter202, !dbg !775
  br i1 %niter203.ncmp.1, label %for.cond1.for.inc5_crit_edge.us.i.unr-lcssa, label %for.body3.us.i, !dbg !775, !llvm.loop !787

for.cond1.for.inc5_crit_edge.us.i.unr-lcssa:      ; preds = %for.body3.us.i, %for.cond1.preheader.us.i
  %add.i.us.i.lcssa.ph = phi i64 [ undef, %for.cond1.preheader.us.i ], [ %add.i.us.i.1, %for.body3.us.i ]
  %indvars.iv.i97.unr = phi i64 [ 0, %for.cond1.preheader.us.i ], [ %indvars.iv.next.i98.1, %for.body3.us.i ]
  %add.i1618.us.i.unr = phi i64 [ %add.i.lcssa2325.us.i, %for.cond1.preheader.us.i ], [ %add.i.us.i.1, %for.body3.us.i ]
  br i1 %lcmp.mod200.not, label %for.cond1.for.inc5_crit_edge.us.i, label %for.body3.us.i.epil, !dbg !775

for.body3.us.i.epil:                              ; preds = %for.cond1.for.inc5_crit_edge.us.i.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i97.unr, metadata !274, metadata !DIExpression()), !dbg !771
  %mul.i.us.i.epil = mul i64 %add.i1618.us.i.unr, 1103515245, !dbg !776
  %add.i.us.i.epil = add i64 %mul.i.us.i.epil, 12345, !dbg !778
  %shr.i.us.i.epil = lshr i64 %add.i.us.i.epil, 16, !dbg !779
  %39 = trunc i64 %shr.i.us.i.epil to i32, !dbg !780
  %conv.i.us.i.epil = and i32 %39, 2147483647, !dbg !780
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i.epil, metadata !93, metadata !DIExpression()), !dbg !781
  %conv4.us.i.epil = sitofp i32 %conv.i.us.i.epil to float, !dbg !782
  %40 = add nuw nsw i64 %indvars.iv.i97.unr, %34, !dbg !783
  %arrayidx.us.i.epil = getelementptr inbounds float, float* %16, i64 %40, !dbg !784
  store float %conv4.us.i.epil, float* %arrayidx.us.i.epil, align 4, !dbg !785, !tbaa !117
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i97.unr, metadata !274, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !771
  br label %for.cond1.for.inc5_crit_edge.us.i, !dbg !789

for.cond1.for.inc5_crit_edge.us.i:                ; preds = %for.cond1.for.inc5_crit_edge.us.i.unr-lcssa, %for.body3.us.i.epil
  %add.i.us.i.lcssa = phi i64 [ %add.i.us.i.lcssa.ph, %for.cond1.for.inc5_crit_edge.us.i.unr-lcssa ], [ %add.i.us.i.epil, %for.body3.us.i.epil ], !dbg !778
  %indvars.iv.next31.i = add nuw nsw i64 %indvars.iv30.i, 1, !dbg !789
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next31.i, metadata !273, metadata !DIExpression()), !dbg !771
  %exitcond35.not.i = icmp eq i64 %indvars.iv.next31.i, %.pre-phi, !dbg !774
  br i1 %exitcond35.not.i, label %for.cond1.preheader.us.i106.preheader, label %for.cond1.preheader.us.i, !dbg !773, !llvm.loop !790

for.cond1.preheader.us.i106.preheader:            ; preds = %for.cond1.for.inc5_crit_edge.us.i
  %xtraiter204 = and i64 %.pre-phi, 1
  %41 = icmp eq i64 %32, 0
  %unroll_iter207 = and i64 %.pre-phi, 4294967294
  %lcmp.mod205.not = icmp eq i64 %xtraiter204, 0
  br label %for.cond1.preheader.us.i106, !dbg !792

for.cond1.preheader.us.i106:                      ; preds = %for.cond1.preheader.us.i106.preheader, %for.cond1.for.inc5_crit_edge.us.i120
  %indvars.iv30.i104 = phi i64 [ %indvars.iv.next31.i118, %for.cond1.for.inc5_crit_edge.us.i120 ], [ 0, %for.cond1.preheader.us.i106.preheader ]
  %add.i.lcssa2325.us.i105 = phi i64 [ %add.i.us.i110.lcssa, %for.cond1.for.inc5_crit_edge.us.i120 ], [ %add.i.us.i.lcssa, %for.cond1.preheader.us.i106.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv30.i104, metadata !273, metadata !DIExpression()), !dbg !794
  call void @llvm.dbg.value(metadata i32 0, metadata !274, metadata !DIExpression()), !dbg !794
  %42 = mul nuw nsw i64 %indvars.iv30.i104, %.pre-phi
  br i1 %41, label %for.cond1.for.inc5_crit_edge.us.i120.unr-lcssa, label %for.body3.us.i117, !dbg !795

for.body3.us.i117:                                ; preds = %for.cond1.preheader.us.i106, %for.body3.us.i117
  %indvars.iv.i107 = phi i64 [ %indvars.iv.next.i115.1, %for.body3.us.i117 ], [ 0, %for.cond1.preheader.us.i106 ]
  %add.i1618.us.i108 = phi i64 [ %add.i.us.i110.1, %for.body3.us.i117 ], [ %add.i.lcssa2325.us.i105, %for.cond1.preheader.us.i106 ]
  %niter208 = phi i64 [ %niter208.next.1, %for.body3.us.i117 ], [ 0, %for.cond1.preheader.us.i106 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i107, metadata !274, metadata !DIExpression()), !dbg !794
  %mul.i.us.i109 = mul i64 %add.i1618.us.i108, 1103515245, !dbg !796
  %add.i.us.i110 = add i64 %mul.i.us.i109, 12345, !dbg !798
  %shr.i.us.i111 = lshr i64 %add.i.us.i110, 16, !dbg !799
  %43 = trunc i64 %shr.i.us.i111 to i32, !dbg !800
  %conv.i.us.i112 = and i32 %43, 2147483647, !dbg !800
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i112, metadata !93, metadata !DIExpression()), !dbg !801
  %conv4.us.i113 = sitofp i32 %conv.i.us.i112 to float, !dbg !802
  %44 = add nuw nsw i64 %indvars.iv.i107, %42, !dbg !803
  %arrayidx.us.i114 = getelementptr inbounds float, float* %17, i64 %44, !dbg !804
  store float %conv4.us.i113, float* %arrayidx.us.i114, align 4, !dbg !805, !tbaa !117
  %indvars.iv.next.i115 = or i64 %indvars.iv.i107, 1, !dbg !806
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i115, metadata !274, metadata !DIExpression()), !dbg !794
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i115, metadata !274, metadata !DIExpression()), !dbg !794
  %mul.i.us.i109.1 = mul i64 %add.i.us.i110, 1103515245, !dbg !796
  %add.i.us.i110.1 = add i64 %mul.i.us.i109.1, 12345, !dbg !798
  %shr.i.us.i111.1 = lshr i64 %add.i.us.i110.1, 16, !dbg !799
  %45 = trunc i64 %shr.i.us.i111.1 to i32, !dbg !800
  %conv.i.us.i112.1 = and i32 %45, 2147483647, !dbg !800
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i112.1, metadata !93, metadata !DIExpression()), !dbg !801
  %conv4.us.i113.1 = sitofp i32 %conv.i.us.i112.1 to float, !dbg !802
  %46 = add nuw nsw i64 %indvars.iv.next.i115, %42, !dbg !803
  %arrayidx.us.i114.1 = getelementptr inbounds float, float* %17, i64 %46, !dbg !804
  store float %conv4.us.i113.1, float* %arrayidx.us.i114.1, align 4, !dbg !805, !tbaa !117
  %indvars.iv.next.i115.1 = add nuw nsw i64 %indvars.iv.i107, 2, !dbg !806
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i115.1, metadata !274, metadata !DIExpression()), !dbg !794
  %niter208.next.1 = add i64 %niter208, 2, !dbg !795
  %niter208.ncmp.1 = icmp eq i64 %niter208.next.1, %unroll_iter207, !dbg !795
  br i1 %niter208.ncmp.1, label %for.cond1.for.inc5_crit_edge.us.i120.unr-lcssa, label %for.body3.us.i117, !dbg !795, !llvm.loop !807

for.cond1.for.inc5_crit_edge.us.i120.unr-lcssa:   ; preds = %for.body3.us.i117, %for.cond1.preheader.us.i106
  %add.i.us.i110.lcssa.ph = phi i64 [ undef, %for.cond1.preheader.us.i106 ], [ %add.i.us.i110.1, %for.body3.us.i117 ]
  %indvars.iv.i107.unr = phi i64 [ 0, %for.cond1.preheader.us.i106 ], [ %indvars.iv.next.i115.1, %for.body3.us.i117 ]
  %add.i1618.us.i108.unr = phi i64 [ %add.i.lcssa2325.us.i105, %for.cond1.preheader.us.i106 ], [ %add.i.us.i110.1, %for.body3.us.i117 ]
  br i1 %lcmp.mod205.not, label %for.cond1.for.inc5_crit_edge.us.i120, label %for.body3.us.i117.epil, !dbg !795

for.body3.us.i117.epil:                           ; preds = %for.cond1.for.inc5_crit_edge.us.i120.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i107.unr, metadata !274, metadata !DIExpression()), !dbg !794
  %mul.i.us.i109.epil = mul i64 %add.i1618.us.i108.unr, 1103515245, !dbg !796
  %add.i.us.i110.epil = add i64 %mul.i.us.i109.epil, 12345, !dbg !798
  %shr.i.us.i111.epil = lshr i64 %add.i.us.i110.epil, 16, !dbg !799
  %47 = trunc i64 %shr.i.us.i111.epil to i32, !dbg !800
  %conv.i.us.i112.epil = and i32 %47, 2147483647, !dbg !800
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i112.epil, metadata !93, metadata !DIExpression()), !dbg !801
  %conv4.us.i113.epil = sitofp i32 %conv.i.us.i112.epil to float, !dbg !802
  %48 = add nuw nsw i64 %indvars.iv.i107.unr, %42, !dbg !803
  %arrayidx.us.i114.epil = getelementptr inbounds float, float* %17, i64 %48, !dbg !804
  store float %conv4.us.i113.epil, float* %arrayidx.us.i114.epil, align 4, !dbg !805, !tbaa !117
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i107.unr, metadata !274, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !794
  br label %for.cond1.for.inc5_crit_edge.us.i120, !dbg !809

for.cond1.for.inc5_crit_edge.us.i120:             ; preds = %for.cond1.for.inc5_crit_edge.us.i120.unr-lcssa, %for.body3.us.i117.epil
  %add.i.us.i110.lcssa = phi i64 [ %add.i.us.i110.lcssa.ph, %for.cond1.for.inc5_crit_edge.us.i120.unr-lcssa ], [ %add.i.us.i110.epil, %for.body3.us.i117.epil ], !dbg !798
  %indvars.iv.next31.i118 = add nuw nsw i64 %indvars.iv30.i104, 1, !dbg !809
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next31.i118, metadata !273, metadata !DIExpression()), !dbg !794
  %exitcond35.not.i119 = icmp eq i64 %indvars.iv.next31.i118, %.pre-phi, !dbg !810
  br i1 %exitcond35.not.i119, label %for.cond.for.end7_crit_edge.split.us.i121, label %for.cond1.preheader.us.i106, !dbg !792, !llvm.loop !811

for.cond.for.end7_crit_edge.split.us.i121:        ; preds = %for.cond1.for.inc5_crit_edge.us.i120
  store i64 %add.i.us.i110.lcssa, i64* @rand_nxt, align 8, !dbg !813, !tbaa !95
  br label %init.exit122, !dbg !792

init.exit122:                                     ; preds = %if.end31, %if.then14, %if.then25, %for.cond.for.end7_crit_edge.split.us.i121
  %P1.1154184 = phi float* [ %P1.1171, %for.cond.for.end7_crit_edge.split.us.i121 ], [ %P1.0190, %if.then25 ], [ %21, %if.then14 ], [ %P1.1, %if.end31 ]
  %P2.1157183 = phi float* [ %P2.1172, %for.cond.for.end7_crit_edge.split.us.i121 ], [ %P2.0191, %if.then25 ], [ %22, %if.then14 ], [ %P2.1, %if.end31 ]
  %C2.1160182 = phi float* [ %C2.1173, %for.cond.for.end7_crit_edge.split.us.i121 ], [ %28, %if.then25 ], [ %C2.0192, %if.then14 ], [ %C2.0192, %if.end31 ]
  %R.1161181 = phi float* [ %R.1174, %for.cond.for.end7_crit_edge.split.us.i121 ], [ %R.0194, %if.then25 ], [ %20, %if.then14 ], [ %R.1, %if.end31 ]
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !814, !tbaa !707
  %50 = call i64 @fwrite(i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str.10, i64 0, i64 0), i64 58, i64 1, %struct._IO_FILE* %49) #23, !dbg !815
  %51 = load i32, i32* %n, align 4, !dbg !816, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %51, metadata !670, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %18, metadata !254, metadata !DIExpression()) #22, !dbg !817
  call void @llvm.dbg.value(metadata i32 %51, metadata !255, metadata !DIExpression()) #22, !dbg !817
  call void @llvm.dbg.value(metadata i32 0, metadata !256, metadata !DIExpression()) #22, !dbg !817
  %cmp17.i123 = icmp sgt i32 %51, 0, !dbg !819
  br i1 %cmp17.i123, label %for.cond1.preheader.us.preheader.i124, label %zero.exit125, !dbg !820

for.cond1.preheader.us.preheader.i124:            ; preds = %init.exit122
  %52 = zext i32 %51 to i64, !dbg !820
  %53 = shl nuw nsw i64 %52, 2, !dbg !820
  %54 = mul nuw i64 %53, %52, !dbg !820
  call void @llvm.memset.p0i8.i64(i8* align 4 %call12, i8 0, i64 %54, i1 false) #22, !dbg !821, !tbaa !117
  call void @llvm.dbg.value(metadata i32 undef, metadata !257, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !817
  call void @llvm.dbg.value(metadata i32 undef, metadata !256, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #22, !dbg !817
  br label %zero.exit125, !dbg !822

zero.exit125:                                     ; preds = %init.exit122, %for.cond1.preheader.us.preheader.i124
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %13) #22, !dbg !823
  call void @llvm.dbg.declare(metadata %struct.timeval* %t1, metadata !685, metadata !DIExpression()), !dbg !824
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %14) #22, !dbg !823
  call void @llvm.dbg.declare(metadata %struct.timeval* %t2, metadata !688, metadata !DIExpression()), !dbg !825
  %call33 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #22, !dbg !826
  %55 = load i32, i32* %n, align 4, !dbg !827, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %55, metadata !670, metadata !DIExpression()), !dbg !690
  call void @rec_matmul(float* noundef %16, float* noundef %17, float* noundef %18, i32 noundef %55, i32 noundef %55, i32 noundef %55, i32 noundef %55), !dbg !828
  %call34 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #22, !dbg !829
  call void @llvm.dbg.value(metadata %struct.timeval* %t2, metadata !43, metadata !DIExpression()), !dbg !830
  %56 = load i64, i64* %tv_sec.i, align 8, !dbg !832, !tbaa !46
  %57 = load i64, i64* %tv_usec.i, align 8, !dbg !833, !tbaa !53
  call void @llvm.dbg.value(metadata %struct.timeval* %t1, metadata !43, metadata !DIExpression()), !dbg !834
  %58 = load i64, i64* %tv_sec.i126, align 8, !dbg !836, !tbaa !46
  %59 = load i64, i64* %tv_usec.i128, align 8, !dbg !837, !tbaa !53
  %reass.add = sub i64 %56, %58
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i = sub i64 %57, %59, !dbg !838
  %sub = add i64 %add.i, %reass.mul, !dbg !839
  %div = udiv i64 %sub, 1000, !dbg !840
  call void @llvm.dbg.value(metadata i64 %div, metadata !689, metadata !DIExpression()), !dbg !841
  %conv37 = uitofp i64 %div to double, !dbg !842
  %div38 = fdiv double %conv37, 1.000000e+03, !dbg !843
  %call39 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i64 0, i64 0), double noundef %div38), !dbg !844
  %60 = load i32, i32* %rand_check, align 4, !dbg !845, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %60, metadata !672, metadata !DIExpression()), !dbg !690
  %tobool40.not = icmp eq i32 %60, 0, !dbg !845
  br i1 %tobool40.not, label %if.else44, label %if.then41, !dbg !847

if.then41:                                        ; preds = %zero.exit125
  %61 = load i32, i32* %n, align 4, !dbg !848, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %61, metadata !670, metadata !DIExpression()), !dbg !690
  call void @mat_vec_mul(float* noundef %17, float* noundef %R.1161181, float* noundef %P1.1154184, i32 noundef %61, i32 noundef %61, i32 noundef %61, i32 noundef 0), !dbg !850
  %62 = load i32, i32* %n, align 4, !dbg !851, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %62, metadata !670, metadata !DIExpression()), !dbg !690
  call void @mat_vec_mul(float* noundef %16, float* noundef %P1.1154184, float* noundef %P2.1157183, i32 noundef %62, i32 noundef %62, i32 noundef %62, i32 noundef 0), !dbg !852
  %63 = load i32, i32* %n, align 4, !dbg !853, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %63, metadata !670, metadata !DIExpression()), !dbg !690
  call void @mat_vec_mul(float* noundef %18, float* noundef %R.1161181, float* noundef %P1.1154184, i32 noundef %63, i32 noundef %63, i32 noundef %63, i32 noundef 0), !dbg !854
  %64 = load i32, i32* %n, align 4, !dbg !855, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %64, metadata !670, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %P1.1, metadata !150, metadata !DIExpression()), !dbg !856
  call void @llvm.dbg.value(metadata float* %P2.1, metadata !151, metadata !DIExpression()), !dbg !856
  call void @llvm.dbg.value(metadata i32 %64, metadata !152, metadata !DIExpression()), !dbg !856
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !154, metadata !DIExpression()), !dbg !856
  call void @llvm.dbg.value(metadata i32 0, metadata !153, metadata !DIExpression()), !dbg !856
  %cmp23.i = icmp sgt i32 %64, 0, !dbg !858
  br i1 %cmp23.i, label %for.body.preheader.i131, label %if.end50.sink.split, !dbg !859

for.body.preheader.i131:                          ; preds = %if.then41
  %wide.trip.count.i130 = zext i32 %64 to i64, !dbg !858
  br label %for.body.i138, !dbg !859

for.body.i138:                                    ; preds = %for.body.i138, %for.body.preheader.i131
  %indvars.iv.i132 = phi i64 [ 0, %for.body.preheader.i131 ], [ %indvars.iv.next.i136, %for.body.i138 ]
  %err.025.i = phi double [ 0.000000e+00, %for.body.preheader.i131 ], [ %err.1.i, %for.body.i138 ]
  call void @llvm.dbg.value(metadata double %err.025.i, metadata !154, metadata !DIExpression()), !dbg !856
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i132, metadata !153, metadata !DIExpression()), !dbg !856
  %arrayidx.i133 = getelementptr inbounds float, float* %P1.1154184, i64 %indvars.iv.i132, !dbg !860
  %65 = load float, float* %arrayidx.i133, align 4, !dbg !860, !tbaa !117
  %arrayidx2.i = getelementptr inbounds float, float* %P2.1157183, i64 %indvars.iv.i132, !dbg !861
  %66 = load float, float* %arrayidx2.i, align 4, !dbg !861, !tbaa !117
  %sub.i = fsub float %65, %66, !dbg !862
  %div.i = fdiv float %sub.i, %65, !dbg !863
  %conv.i134 = fpext float %div.i to double, !dbg !864
  call void @llvm.dbg.value(metadata double %conv.i134, metadata !155, metadata !DIExpression()), !dbg !856
  %cmp5.i135 = fcmp olt float %div.i, 0.000000e+00, !dbg !865
  %fneg.i = fneg double %conv.i134, !dbg !866
  %diff.0.i = select i1 %cmp5.i135, double %fneg.i, double %conv.i134, !dbg !866
  call void @llvm.dbg.value(metadata double %diff.0.i, metadata !155, metadata !DIExpression()), !dbg !856
  %cmp7.i = fcmp ogt double %diff.0.i, %err.025.i, !dbg !867
  %err.1.i = select i1 %cmp7.i, double %diff.0.i, double %err.025.i, !dbg !868
  call void @llvm.dbg.value(metadata double %err.1.i, metadata !154, metadata !DIExpression()), !dbg !856
  %indvars.iv.next.i136 = add nuw nsw i64 %indvars.iv.i132, 1, !dbg !869
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i136, metadata !153, metadata !DIExpression()), !dbg !856
  %exitcond.not.i137 = icmp eq i64 %indvars.iv.next.i136, %wide.trip.count.i130, !dbg !858
  br i1 %exitcond.not.i137, label %if.end50.sink.split, label %for.body.i138, !dbg !859, !llvm.loop !870

if.else44:                                        ; preds = %zero.exit125
  %67 = load i32, i32* %check, align 4, !dbg !872, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %67, metadata !671, metadata !DIExpression()), !dbg !690
  %tobool45.not = icmp eq i32 %67, 0, !dbg !872
  br i1 %tobool45.not, label %if.end50, label %if.then46, !dbg !874

if.then46:                                        ; preds = %if.else44
  %68 = load i32, i32* %n, align 4, !dbg !875, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %68, metadata !670, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %16, metadata !348, metadata !DIExpression()) #22, !dbg !877
  call void @llvm.dbg.value(metadata float* %17, metadata !349, metadata !DIExpression()) #22, !dbg !877
  call void @llvm.dbg.value(metadata float* undef, metadata !350, metadata !DIExpression()) #22, !dbg !877
  call void @llvm.dbg.value(metadata i32 %68, metadata !351, metadata !DIExpression()) #22, !dbg !877
  call void @llvm.dbg.value(metadata i32 0, metadata !352, metadata !DIExpression()) #22, !dbg !877
  %cmp47.i = icmp sgt i32 %68, 0, !dbg !879
  br i1 %cmp47.i, label %for.cond1.preheader.us.us.preheader.i, label %if.end50.sink.split, !dbg !880

for.cond1.preheader.us.us.preheader.i:            ; preds = %if.then46
  %69 = zext i32 %68 to i64, !dbg !880
  %xtraiter209 = and i64 %69, 1
  %70 = icmp eq i32 %68, 1
  %unroll_iter212 = and i64 %69, 4294967294
  %lcmp.mod210.not = icmp eq i64 %xtraiter209, 0
  br label %for.cond1.preheader.us.us.i, !dbg !880

for.cond1.preheader.us.us.i:                      ; preds = %for.cond1.for.inc19_crit_edge.split.us.us.us.i, %for.cond1.preheader.us.us.preheader.i
  %indvars.iv69.i = phi i64 [ 0, %for.cond1.preheader.us.us.preheader.i ], [ %indvars.iv.next70.i, %for.cond1.for.inc19_crit_edge.split.us.us.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv69.i, metadata !352, metadata !DIExpression()) #22, !dbg !877
  call void @llvm.dbg.value(metadata i32 0, metadata !354, metadata !DIExpression()) #22, !dbg !877
  %71 = mul nuw nsw i64 %indvars.iv69.i, %69
  br label %for.cond4.preheader.us.us.us.i, !dbg !881

for.cond4.preheader.us.us.us.i:                   ; preds = %for.cond4.for.end_crit_edge.us.us.us.i, %for.cond1.preheader.us.us.i
  %indvars.iv63.i = phi i64 [ %indvars.iv.next64.i, %for.cond4.for.end_crit_edge.us.us.us.i ], [ 0, %for.cond1.preheader.us.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv63.i, metadata !354, metadata !DIExpression()) #22, !dbg !877
  call void @llvm.dbg.value(metadata float 0.000000e+00, metadata !355, metadata !DIExpression()) #22, !dbg !882
  call void @llvm.dbg.value(metadata i32 0, metadata !353, metadata !DIExpression()) #22, !dbg !877
  br i1 %70, label %for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa, label %for.body6.us.us.us.i, !dbg !883

for.body6.us.us.us.i:                             ; preds = %for.cond4.preheader.us.us.us.i, %for.body6.us.us.us.i
  %indvars.iv.i139 = phi i64 [ %indvars.iv.next.i140.1, %for.body6.us.us.us.i ], [ 0, %for.cond4.preheader.us.us.us.i ]
  %c.043.us.us.us.i = phi float [ %83, %for.body6.us.us.us.i ], [ 0.000000e+00, %for.cond4.preheader.us.us.us.i ]
  %niter213 = phi i64 [ %niter213.next.1, %for.body6.us.us.us.i ], [ 0, %for.cond4.preheader.us.us.us.i ]
  call void @llvm.dbg.value(metadata float %c.043.us.us.us.i, metadata !355, metadata !DIExpression()) #22, !dbg !882
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i139, metadata !353, metadata !DIExpression()) #22, !dbg !877
  %72 = add nuw nsw i64 %indvars.iv.i139, %71, !dbg !884
  %arrayidx.us.us.us.i = getelementptr inbounds float, float* %16, i64 %72, !dbg !885
  %73 = load float, float* %arrayidx.us.us.us.i, align 4, !dbg !885, !tbaa !117
  %74 = mul nuw nsw i64 %indvars.iv.i139, %69, !dbg !886
  %75 = add nuw nsw i64 %74, %indvars.iv63.i, !dbg !887
  %arrayidx10.us.us.us.i = getelementptr inbounds float, float* %17, i64 %75, !dbg !888
  %76 = load float, float* %arrayidx10.us.us.us.i, align 4, !dbg !888, !tbaa !117
  %77 = call float @llvm.fmuladd.f32(float %73, float %76, float %c.043.us.us.us.i) #22, !dbg !889
  call void @llvm.dbg.value(metadata float %77, metadata !355, metadata !DIExpression()) #22, !dbg !882
  %indvars.iv.next.i140 = or i64 %indvars.iv.i139, 1, !dbg !890
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i140, metadata !353, metadata !DIExpression()) #22, !dbg !877
  call void @llvm.dbg.value(metadata float %77, metadata !355, metadata !DIExpression()) #22, !dbg !882
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i140, metadata !353, metadata !DIExpression()) #22, !dbg !877
  %78 = add nuw nsw i64 %indvars.iv.next.i140, %71, !dbg !884
  %arrayidx.us.us.us.i.1 = getelementptr inbounds float, float* %16, i64 %78, !dbg !885
  %79 = load float, float* %arrayidx.us.us.us.i.1, align 4, !dbg !885, !tbaa !117
  %80 = mul nuw nsw i64 %indvars.iv.next.i140, %69, !dbg !886
  %81 = add nuw nsw i64 %80, %indvars.iv63.i, !dbg !887
  %arrayidx10.us.us.us.i.1 = getelementptr inbounds float, float* %17, i64 %81, !dbg !888
  %82 = load float, float* %arrayidx10.us.us.us.i.1, align 4, !dbg !888, !tbaa !117
  %83 = call float @llvm.fmuladd.f32(float %79, float %82, float %77) #22, !dbg !889
  call void @llvm.dbg.value(metadata float %83, metadata !355, metadata !DIExpression()) #22, !dbg !882
  %indvars.iv.next.i140.1 = add nuw nsw i64 %indvars.iv.i139, 2, !dbg !890
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i140.1, metadata !353, metadata !DIExpression()) #22, !dbg !877
  %niter213.next.1 = add i64 %niter213, 2, !dbg !883
  %niter213.ncmp.1 = icmp eq i64 %niter213.next.1, %unroll_iter212, !dbg !883
  br i1 %niter213.ncmp.1, label %for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa, label %for.body6.us.us.us.i, !dbg !883, !llvm.loop !891

for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa: ; preds = %for.body6.us.us.us.i, %for.cond4.preheader.us.us.us.i
  %.lcssa.ph = phi float [ undef, %for.cond4.preheader.us.us.us.i ], [ %83, %for.body6.us.us.us.i ]
  %indvars.iv.i139.unr = phi i64 [ 0, %for.cond4.preheader.us.us.us.i ], [ %indvars.iv.next.i140.1, %for.body6.us.us.us.i ]
  %c.043.us.us.us.i.unr = phi float [ 0.000000e+00, %for.cond4.preheader.us.us.us.i ], [ %83, %for.body6.us.us.us.i ]
  br i1 %lcmp.mod210.not, label %for.cond4.for.end_crit_edge.us.us.us.i, label %for.body6.us.us.us.i.epil, !dbg !883

for.body6.us.us.us.i.epil:                        ; preds = %for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa
  call void @llvm.dbg.value(metadata float %c.043.us.us.us.i.unr, metadata !355, metadata !DIExpression()) #22, !dbg !882
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i139.unr, metadata !353, metadata !DIExpression()) #22, !dbg !877
  %84 = add nuw nsw i64 %indvars.iv.i139.unr, %71, !dbg !884
  %arrayidx.us.us.us.i.epil = getelementptr inbounds float, float* %16, i64 %84, !dbg !885
  %85 = load float, float* %arrayidx.us.us.us.i.epil, align 4, !dbg !885, !tbaa !117
  %86 = mul nuw nsw i64 %indvars.iv.i139.unr, %69, !dbg !886
  %87 = add nuw nsw i64 %86, %indvars.iv63.i, !dbg !887
  %arrayidx10.us.us.us.i.epil = getelementptr inbounds float, float* %17, i64 %87, !dbg !888
  %88 = load float, float* %arrayidx10.us.us.us.i.epil, align 4, !dbg !888, !tbaa !117
  %89 = call float @llvm.fmuladd.f32(float %85, float %88, float %c.043.us.us.us.i.unr) #22, !dbg !889
  call void @llvm.dbg.value(metadata float %89, metadata !355, metadata !DIExpression()) #22, !dbg !882
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i139.unr, metadata !353, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !877
  br label %for.cond4.for.end_crit_edge.us.us.us.i, !dbg !893

for.cond4.for.end_crit_edge.us.us.us.i:           ; preds = %for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa, %for.body6.us.us.us.i.epil
  %.lcssa = phi float [ %.lcssa.ph, %for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa ], [ %89, %for.body6.us.us.us.i.epil ], !dbg !889
  %90 = add nuw nsw i64 %indvars.iv63.i, %71, !dbg !893
  %arrayidx15.us.us.us.i = getelementptr inbounds float, float* %C2.1160182, i64 %90, !dbg !894
  store float %.lcssa, float* %arrayidx15.us.us.us.i, align 4, !dbg !895, !tbaa !117
  %indvars.iv.next64.i = add nuw nsw i64 %indvars.iv63.i, 1, !dbg !896
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next64.i, metadata !354, metadata !DIExpression()) #22, !dbg !877
  %exitcond68.not.i = icmp eq i64 %indvars.iv.next64.i, %69, !dbg !897
  br i1 %exitcond68.not.i, label %for.cond1.for.inc19_crit_edge.split.us.us.us.i, label %for.cond4.preheader.us.us.us.i, !dbg !881, !llvm.loop !898

for.cond1.for.inc19_crit_edge.split.us.us.us.i:   ; preds = %for.cond4.for.end_crit_edge.us.us.us.i
  %indvars.iv.next70.i = add nuw nsw i64 %indvars.iv69.i, 1, !dbg !900
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next70.i, metadata !352, metadata !DIExpression()) #22, !dbg !877
  %exitcond75.not.i = icmp eq i64 %indvars.iv.next70.i, %69, !dbg !879
  br i1 %exitcond75.not.i, label %for.cond1.preheader.us.i143, label %for.cond1.preheader.us.us.i, !dbg !880, !llvm.loop !901

for.cond1.preheader.us.i143:                      ; preds = %for.cond1.for.inc19_crit_edge.split.us.us.us.i, %for.cond1.for.inc18_crit_edge.us.i
  %indvars.iv52.i = phi i64 [ %indvars.iv.next53.i, %for.cond1.for.inc18_crit_edge.us.i ], [ 0, %for.cond1.for.inc19_crit_edge.split.us.us.us.i ]
  %error.048.us.i = phi double [ %error.2.us.i, %for.cond1.for.inc18_crit_edge.us.i ], [ 0.000000e+00, %for.cond1.for.inc19_crit_edge.split.us.us.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv52.i, metadata !308, metadata !DIExpression()), !dbg !903
  call void @llvm.dbg.value(metadata double %error.048.us.i, metadata !310, metadata !DIExpression()), !dbg !903
  call void @llvm.dbg.value(metadata i32 0, metadata !309, metadata !DIExpression()), !dbg !903
  %91 = mul nuw nsw i64 %indvars.iv52.i, %69
  br label %for.body3.us.i148, !dbg !905

for.body3.us.i148:                                ; preds = %for.body3.us.i148, %for.cond1.preheader.us.i143
  %indvars.iv.i144 = phi i64 [ 0, %for.cond1.preheader.us.i143 ], [ %indvars.iv.next.i146, %for.body3.us.i148 ]
  %error.144.us.i = phi double [ %error.048.us.i, %for.cond1.preheader.us.i143 ], [ %error.2.us.i, %for.body3.us.i148 ]
  call void @llvm.dbg.value(metadata double %error.144.us.i, metadata !310, metadata !DIExpression()), !dbg !903
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i144, metadata !309, metadata !DIExpression()), !dbg !903
  %92 = add nuw nsw i64 %indvars.iv.i144, %91, !dbg !906
  %arrayidx.us.i145 = getelementptr inbounds float, float* %18, i64 %92, !dbg !907
  %93 = load float, float* %arrayidx.us.i145, align 4, !dbg !907, !tbaa !117
  %arrayidx7.us.i = getelementptr inbounds float, float* %C2.1160182, i64 %92, !dbg !908
  %94 = load float, float* %arrayidx7.us.i, align 4, !dbg !908, !tbaa !117
  %sub.us.i = fsub float %93, %94, !dbg !909
  %div.us.i = fdiv float %sub.us.i, %93, !dbg !910
  %conv.us.i = fpext float %div.us.i to double, !dbg !911
  call void @llvm.dbg.value(metadata double %conv.us.i, metadata !311, metadata !DIExpression()), !dbg !912
  %cmp12.us.i = fcmp olt float %div.us.i, 0.000000e+00, !dbg !913
  %fneg.us.i = fneg double %conv.us.i, !dbg !914
  %diff.0.us.i = select i1 %cmp12.us.i, double %fneg.us.i, double %conv.us.i, !dbg !914
  call void @llvm.dbg.value(metadata double %diff.0.us.i, metadata !311, metadata !DIExpression()), !dbg !912
  %cmp14.us.i = fcmp ogt double %diff.0.us.i, %error.144.us.i, !dbg !915
  %error.2.us.i = select i1 %cmp14.us.i, double %diff.0.us.i, double %error.144.us.i, !dbg !916
  call void @llvm.dbg.value(metadata double %error.2.us.i, metadata !310, metadata !DIExpression()), !dbg !903
  %indvars.iv.next.i146 = add nuw nsw i64 %indvars.iv.i144, 1, !dbg !917
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i146, metadata !309, metadata !DIExpression()), !dbg !903
  %exitcond.not.i147 = icmp eq i64 %indvars.iv.next.i146, %69, !dbg !918
  br i1 %exitcond.not.i147, label %for.cond1.for.inc18_crit_edge.us.i, label %for.body3.us.i148, !dbg !905, !llvm.loop !919

for.cond1.for.inc18_crit_edge.us.i:               ; preds = %for.body3.us.i148
  %indvars.iv.next53.i = add nuw nsw i64 %indvars.iv52.i, 1, !dbg !921
  call void @llvm.dbg.value(metadata double undef, metadata !310, metadata !DIExpression()), !dbg !903
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next53.i, metadata !308, metadata !DIExpression()), !dbg !903
  %exitcond57.not.i = icmp eq i64 %indvars.iv.next53.i, %69, !dbg !922
  br i1 %exitcond57.not.i, label %if.end50.sink.split, label %for.cond1.preheader.us.i143, !dbg !923, !llvm.loop !924

if.end50.sink.split:                              ; preds = %for.body.i138, %for.cond1.for.inc18_crit_edge.us.i, %if.then46, %if.then41
  %error.0.lcssa.i.sink = phi double [ 0.000000e+00, %if.then41 ], [ 0.000000e+00, %if.then46 ], [ %error.2.us.i, %for.cond1.for.inc18_crit_edge.us.i ], [ %err.1.i, %for.body.i138 ]
  %95 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !926, !tbaa !707
  %call48 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %95, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i64 0, i64 0), double noundef %error.0.lcssa.i.sink) #23, !dbg !926
  br label %if.end50, !dbg !927

if.end50:                                         ; preds = %if.end50.sink.split, %if.else44
  %96 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !927, !tbaa !707
  %97 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.13, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %96) #23, !dbg !928
  %98 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !929, !tbaa !707
  %99 = load i32, i32* %n, align 4, !dbg !930, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %99, metadata !670, metadata !DIExpression()), !dbg !690
  %call52 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %98, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str.14, i64 0, i64 0), i32 noundef %99) #23, !dbg !931
  call void @free(i8* noundef %call12) #22, !dbg !932
  call void @free(i8* noundef %call8) #22, !dbg !933
  call void @free(i8* noundef %call4) #22, !dbg !934
  %100 = load i32, i32* %rand_check, align 4, !dbg !935, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %100, metadata !672, metadata !DIExpression()), !dbg !690
  %tobool53.not = icmp eq i32 %100, 0, !dbg !935
  br i1 %tobool53.not, label %if.else55, label %if.then54, !dbg !937

if.then54:                                        ; preds = %if.end50
  %101 = bitcast float* %R.1161181 to i8*, !dbg !938
  call void @free(i8* noundef %101) #22, !dbg !940
  %102 = bitcast float* %P1.1154184 to i8*, !dbg !941
  call void @free(i8* noundef %102) #22, !dbg !942
  br label %if.end59.sink.split, !dbg !943

if.else55:                                        ; preds = %if.end50
  %103 = load i32, i32* %check, align 4, !dbg !944, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %103, metadata !671, metadata !DIExpression()), !dbg !690
  %tobool56.not = icmp eq i32 %103, 0, !dbg !944
  br i1 %tobool56.not, label %if.end59, label %if.end59.sink.split, !dbg !946

if.end59.sink.split:                              ; preds = %if.else55, %if.then54
  %C2.1160182.sink = phi float* [ %P2.1157183, %if.then54 ], [ %C2.1160182, %if.else55 ]
  %104 = bitcast float* %C2.1160182.sink to i8*, !dbg !947
  call void @free(i8* noundef %104) #22, !dbg !947
  br label %if.end59, !dbg !948

if.end59:                                         ; preds = %if.end59.sink.split, %if.else55
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %14) #22, !dbg !948
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %13) #22, !dbg !948
  %inc = add nuw nsw i32 %r.0193, 1, !dbg !949
  call void @llvm.dbg.value(metadata float* %R.1161181, metadata !678, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata i32 %inc, metadata !683, metadata !DIExpression()), !dbg !716
  call void @llvm.dbg.value(metadata float* %C2.1160182, metadata !681, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %P2.1157183, metadata !680, metadata !DIExpression()), !dbg !690
  call void @llvm.dbg.value(metadata float* %P1.1154184, metadata !679, metadata !DIExpression()), !dbg !690
  %105 = load i32, i32* %round, align 4, !dbg !717, !tbaa !693
  call void @llvm.dbg.value(metadata i32 %105, metadata !674, metadata !DIExpression()), !dbg !690
  %cmp = icmp slt i32 %inc, %105, !dbg !718
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !719, !llvm.loop !950
}

declare !dbg !952 dso_local void @get_options(i32 noundef, i8** noundef, i8** noundef, i32* noundef, ...) local_unnamed_addr #15

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #11

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #16

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #17

; Function Attrs: nofree nounwind
declare !dbg !959 dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #11

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #18

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #19

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #20

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #20

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #21

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { argmemonly mustprogress nounwind willreturn }
attributes #5 = { mustprogress nofree nounwind willreturn writeonly "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly nofree norecurse nosync nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { argmemonly nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { argmemonly nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { argmemonly nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { noreturn nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #18 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #19 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #20 = { nofree nounwind }
attributes #21 = { argmemonly nofree nounwind willreturn writeonly }
attributes #22 = { nounwind }
attributes #23 = { cold }
attributes #24 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "rand_nxt", scope: !2, file: !3, line: 57, type: !22, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "matmul.c", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "cc6ff4bcb966c8ba1276c2ce482957ed")
!4 = !{!5, !6, !7, !8}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!7 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!9 = !{!0, !10, !18}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "specifiers", scope: !2, file: !3, line: 313, type: !12, isLocal: false, isDefinition: true)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 384, elements: !16)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !{!17}
!17 = !DISubrange(count: 6)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "opt_types", scope: !2, file: !3, line: 314, type: !20, isLocal: false, isDefinition: true)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 192, elements: !16)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!23 = !{i32 7, !"Dwarf Version", i32 5}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{i32 7, !"uwtable", i32 1}
!27 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)"}
!28 = distinct !DISubprogram(name: "todval", scope: !3, file: !3, line: 39, type: !29, scopeLine: 39, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !42)
!29 = !DISubroutineType(types: !30)
!30 = !{!31, !32}
!31 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 64)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !34, line: 30, size: 128, elements: !35)
!34 = !DIFile(filename: "/usr/include/bits/time.h", directory: "", checksumkind: CSK_MD5, checksum: "7275d681a2390320bc78ae3cf595b8d2")
!35 = !{!36, !40}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !33, file: !34, line: 32, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !38, line: 148, baseType: !39)
!38 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "77efac6352c67c8f56830ba4c854379f")
!39 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !33, file: !34, line: 33, baseType: !41, size: 64, offset: 64)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !38, line: 150, baseType: !39)
!42 = !{!43}
!43 = !DILocalVariable(name: "tp", arg: 1, scope: !28, file: !3, line: 39, type: !32)
!44 = !DILocation(line: 0, scope: !28)
!45 = !DILocation(line: 40, column: 16, scope: !28)
!46 = !{!47, !48, i64 0}
!47 = !{!"timeval", !48, i64 0, !48, i64 8}
!48 = !{!"long", !49, i64 0}
!49 = !{!"omnipotent char", !50, i64 0}
!50 = !{!"Simple C/C++ TBAA"}
!51 = !DILocation(line: 40, column: 30, scope: !28)
!52 = !DILocation(line: 40, column: 43, scope: !28)
!53 = !{!47, !48, i64 8}
!54 = !DILocation(line: 40, column: 37, scope: !28)
!55 = !DILocation(line: 40, column: 5, scope: !28)
!56 = distinct !DISubprogram(name: "startup_cilk", scope: !3, file: !3, line: 44, type: !57, scopeLine: 44, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !59)
!57 = !DISubroutineType(types: !58)
!58 = !{null}
!59 = !{!60, !61, !63, !64, !65, !66}
!60 = !DILocalVariable(name: "g", scope: !56, file: !3, line: 45, type: !7)
!61 = !DILocalVariable(name: "__init", scope: !62, type: !21, flags: DIFlagArtificial)
!62 = distinct !DILexicalBlock(scope: !56, file: !3, line: 46, column: 3)
!63 = !DILocalVariable(name: "__limit", scope: !62, type: !21, flags: DIFlagArtificial)
!64 = !DILocalVariable(name: "__begin", scope: !62, type: !21, flags: DIFlagArtificial)
!65 = !DILocalVariable(name: "__end", scope: !62, type: !21, flags: DIFlagArtificial)
!66 = !DILocalVariable(name: "i", scope: !67, file: !3, line: 46, type: !21)
!67 = distinct !DILexicalBlock(scope: !62, file: !3, line: 46, column: 3)
!68 = !DILocation(line: 0, scope: !56)
!69 = !DILocation(line: 45, column: 3, scope: !56)
!70 = !DILocation(line: 45, column: 10, scope: !56)
!71 = !{!72, !72, i64 0}
!72 = !{!"double", !49, i64 0}
!73 = !DILocation(line: 0, scope: !62)
!74 = !DILocation(line: 46, column: 24, scope: !62)
!75 = !DILocation(line: 46, column: 3, scope: !62)
!76 = !DILocation(line: 0, scope: !67)
!77 = !DILocation(line: 47, column: 14, scope: !78)
!78 = distinct !DILexicalBlock(scope: !67, file: !3, line: 46, column: 36)
!79 = !DILocation(line: 47, column: 10, scope: !78)
!80 = !DILocation(line: 47, column: 7, scope: !78)
!81 = !DILocation(line: 48, column: 3, scope: !78)
!82 = !DILocation(line: 46, column: 32, scope: !67)
!83 = !DILocation(line: 46, column: 24, scope: !67)
!84 = !DILocation(line: 46, column: 3, scope: !67)
!85 = distinct !{!85, !75, !86, !87}
!86 = !DILocation(line: 48, column: 3, scope: !62)
!87 = !{!"tapir.loop.spawn.strategy", i32 1}
!88 = !DILocation(line: 49, column: 1, scope: !56)
!89 = distinct !DISubprogram(name: "cilk_rand", scope: !3, file: !3, line: 59, type: !90, scopeLine: 59, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !92)
!90 = !DISubroutineType(types: !91)
!91 = !{!21}
!92 = !{!93}
!93 = !DILocalVariable(name: "result", scope: !89, file: !3, line: 60, type: !21)
!94 = !DILocation(line: 61, column: 14, scope: !89)
!95 = !{!48, !48, i64 0}
!96 = !DILocation(line: 61, column: 23, scope: !89)
!97 = !DILocation(line: 61, column: 36, scope: !89)
!98 = !DILocation(line: 61, column: 12, scope: !89)
!99 = !DILocation(line: 62, column: 22, scope: !89)
!100 = !DILocation(line: 62, column: 12, scope: !89)
!101 = !DILocation(line: 0, scope: !89)
!102 = !DILocation(line: 63, column: 3, scope: !89)
!103 = distinct !DISubprogram(name: "zero_vec", scope: !3, file: !3, line: 67, type: !104, scopeLine: 67, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !106)
!104 = !DISubroutineType(types: !105)
!105 = !{null, !8, !21}
!106 = !{!107, !108, !109}
!107 = !DILocalVariable(name: "V", arg: 1, scope: !103, file: !3, line: 67, type: !8)
!108 = !DILocalVariable(name: "n", arg: 2, scope: !103, file: !3, line: 67, type: !21)
!109 = !DILocalVariable(name: "i", scope: !103, file: !3, line: 69, type: !21)
!110 = !DILocation(line: 0, scope: !103)
!111 = !DILocation(line: 71, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !3, line: 71, column: 3)
!113 = distinct !DILexicalBlock(scope: !103, file: !3, line: 71, column: 3)
!114 = !DILocation(line: 71, column: 3, scope: !113)
!115 = !DILocation(line: 72, column: 10, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !3, line: 71, column: 26)
!117 = !{!118, !118, i64 0}
!118 = !{!"float", !49, i64 0}
!119 = !DILocation(line: 74, column: 1, scope: !103)
!120 = distinct !DISubprogram(name: "init_vec", scope: !3, file: !3, line: 76, type: !104, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !121)
!121 = !{!122, !123, !124}
!122 = !DILocalVariable(name: "V", arg: 1, scope: !120, file: !3, line: 76, type: !8)
!123 = !DILocalVariable(name: "n", arg: 2, scope: !120, file: !3, line: 76, type: !21)
!124 = !DILocalVariable(name: "i", scope: !120, file: !3, line: 78, type: !21)
!125 = !DILocation(line: 0, scope: !120)
!126 = !DILocation(line: 80, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !128, file: !3, line: 80, column: 3)
!128 = distinct !DILexicalBlock(scope: !120, file: !3, line: 80, column: 3)
!129 = !DILocation(line: 80, column: 3, scope: !128)
!130 = !DILocation(line: 61, column: 23, scope: !89, inlinedAt: !131)
!131 = distinct !DILocation(line: 81, column: 19, scope: !132)
!132 = distinct !DILexicalBlock(scope: !127, file: !3, line: 80, column: 26)
!133 = !DILocation(line: 61, column: 36, scope: !89, inlinedAt: !131)
!134 = !DILocation(line: 62, column: 22, scope: !89, inlinedAt: !131)
!135 = !DILocation(line: 62, column: 12, scope: !89, inlinedAt: !131)
!136 = !DILocation(line: 0, scope: !89, inlinedAt: !131)
!137 = !DILocation(line: 81, column: 12, scope: !132)
!138 = !DILocation(line: 81, column: 5, scope: !132)
!139 = !DILocation(line: 81, column: 10, scope: !132)
!140 = !DILocation(line: 80, column: 22, scope: !127)
!141 = distinct !{!141, !129, !142, !143}
!142 = !DILocation(line: 82, column: 3, scope: !128)
!143 = !{!"llvm.loop.mustprogress"}
!144 = !DILocation(line: 61, column: 12, scope: !89, inlinedAt: !131)
!145 = !DILocation(line: 83, column: 1, scope: !120)
!146 = distinct !DISubprogram(name: "maxerror_vec", scope: !3, file: !3, line: 85, type: !147, scopeLine: 85, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !149)
!147 = !DISubroutineType(types: !148)
!148 = !{!7, !8, !8, !21}
!149 = !{!150, !151, !152, !153, !154, !155}
!150 = !DILocalVariable(name: "V1", arg: 1, scope: !146, file: !3, line: 85, type: !8)
!151 = !DILocalVariable(name: "V2", arg: 2, scope: !146, file: !3, line: 85, type: !8)
!152 = !DILocalVariable(name: "n", arg: 3, scope: !146, file: !3, line: 85, type: !21)
!153 = !DILocalVariable(name: "i", scope: !146, file: !3, line: 86, type: !21)
!154 = !DILocalVariable(name: "err", scope: !146, file: !3, line: 87, type: !7)
!155 = !DILocalVariable(name: "diff", scope: !146, file: !3, line: 87, type: !7)
!156 = !DILocation(line: 0, scope: !146)
!157 = !DILocation(line: 89, column: 16, scope: !158)
!158 = distinct !DILexicalBlock(scope: !159, file: !3, line: 89, column: 3)
!159 = distinct !DILexicalBlock(scope: !146, file: !3, line: 89, column: 3)
!160 = !DILocation(line: 89, column: 3, scope: !159)
!161 = !DILocation(line: 90, column: 13, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !3, line: 89, column: 26)
!163 = !DILocation(line: 90, column: 21, scope: !162)
!164 = !DILocation(line: 90, column: 19, scope: !162)
!165 = !DILocation(line: 90, column: 28, scope: !162)
!166 = !DILocation(line: 90, column: 12, scope: !162)
!167 = !DILocation(line: 91, column: 13, scope: !168)
!168 = distinct !DILexicalBlock(scope: !162, file: !3, line: 91, column: 8)
!169 = !DILocation(line: 91, column: 8, scope: !162)
!170 = !DILocation(line: 93, column: 13, scope: !171)
!171 = distinct !DILexicalBlock(scope: !162, file: !3, line: 93, column: 8)
!172 = !DILocation(line: 93, column: 8, scope: !162)
!173 = !DILocation(line: 89, column: 22, scope: !158)
!174 = distinct !{!174, !160, !175, !143}
!175 = !DILocation(line: 96, column: 3, scope: !159)
!176 = !DILocation(line: 98, column: 3, scope: !146)
!177 = distinct !DISubprogram(name: "sum_diff_vec", scope: !3, file: !3, line: 101, type: !147, scopeLine: 101, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !178)
!178 = !{!179, !180, !181, !182, !183, !184}
!179 = !DILocalVariable(name: "V1", arg: 1, scope: !177, file: !3, line: 101, type: !8)
!180 = !DILocalVariable(name: "V2", arg: 2, scope: !177, file: !3, line: 101, type: !8)
!181 = !DILocalVariable(name: "n", arg: 3, scope: !177, file: !3, line: 101, type: !21)
!182 = !DILocalVariable(name: "i", scope: !177, file: !3, line: 102, type: !21)
!183 = !DILocalVariable(name: "err", scope: !177, file: !3, line: 103, type: !7)
!184 = !DILocalVariable(name: "diff", scope: !177, file: !3, line: 103, type: !7)
!185 = !DILocation(line: 0, scope: !177)
!186 = !DILocation(line: 105, column: 16, scope: !187)
!187 = distinct !DILexicalBlock(scope: !188, file: !3, line: 105, column: 3)
!188 = distinct !DILexicalBlock(scope: !177, file: !3, line: 105, column: 3)
!189 = !DILocation(line: 105, column: 3, scope: !188)
!190 = !DILocation(line: 106, column: 13, scope: !191)
!191 = distinct !DILexicalBlock(scope: !187, file: !3, line: 105, column: 26)
!192 = !DILocation(line: 106, column: 21, scope: !191)
!193 = !DILocation(line: 106, column: 19, scope: !191)
!194 = !DILocation(line: 106, column: 28, scope: !191)
!195 = !DILocation(line: 106, column: 12, scope: !191)
!196 = !DILocation(line: 107, column: 13, scope: !197)
!197 = distinct !DILexicalBlock(scope: !191, file: !3, line: 107, column: 8)
!198 = !DILocation(line: 107, column: 8, scope: !191)
!199 = !DILocation(line: 109, column: 9, scope: !191)
!200 = !DILocation(line: 105, column: 22, scope: !187)
!201 = distinct !{!201, !189, !202, !143}
!202 = !DILocation(line: 110, column: 3, scope: !188)
!203 = !DILocation(line: 112, column: 3, scope: !177)
!204 = distinct !DISubprogram(name: "print_vec", scope: !3, file: !3, line: 115, type: !104, scopeLine: 115, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !205)
!205 = !{!206, !207, !208}
!206 = !DILocalVariable(name: "V", arg: 1, scope: !204, file: !3, line: 115, type: !8)
!207 = !DILocalVariable(name: "n", arg: 2, scope: !204, file: !3, line: 115, type: !21)
!208 = !DILocalVariable(name: "i", scope: !204, file: !3, line: 116, type: !21)
!209 = !DILocation(line: 0, scope: !204)
!210 = !DILocation(line: 118, column: 16, scope: !211)
!211 = distinct !DILexicalBlock(scope: !212, file: !3, line: 118, column: 3)
!212 = distinct !DILexicalBlock(scope: !204, file: !3, line: 118, column: 3)
!213 = !DILocation(line: 118, column: 3, scope: !212)
!214 = !DILocation(line: 119, column: 20, scope: !215)
!215 = distinct !DILexicalBlock(scope: !211, file: !3, line: 118, column: 26)
!216 = !DILocation(line: 119, column: 5, scope: !215)
!217 = !DILocation(line: 118, column: 22, scope: !211)
!218 = distinct !{!218, !213, !219, !143}
!219 = !DILocation(line: 120, column: 3, scope: !212)
!220 = !DILocation(line: 121, column: 1, scope: !204)
!221 = distinct !DISubprogram(name: "print_matrix", scope: !3, file: !3, line: 123, type: !222, scopeLine: 123, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !224)
!222 = !DISubroutineType(types: !223)
!223 = !{null, !8, !21, !21}
!224 = !{!225, !226, !227, !228, !229}
!225 = !DILocalVariable(name: "A", arg: 1, scope: !221, file: !3, line: 123, type: !8)
!226 = !DILocalVariable(name: "n", arg: 2, scope: !221, file: !3, line: 123, type: !21)
!227 = !DILocalVariable(name: "ld", arg: 3, scope: !221, file: !3, line: 123, type: !21)
!228 = !DILocalVariable(name: "i", scope: !221, file: !3, line: 124, type: !21)
!229 = !DILocalVariable(name: "j", scope: !221, file: !3, line: 124, type: !21)
!230 = !DILocation(line: 0, scope: !221)
!231 = !DILocation(line: 126, column: 16, scope: !232)
!232 = distinct !DILexicalBlock(scope: !233, file: !3, line: 126, column: 3)
!233 = distinct !DILexicalBlock(scope: !221, file: !3, line: 126, column: 3)
!234 = !DILocation(line: 126, column: 3, scope: !233)
!235 = !DILocation(line: 127, column: 5, scope: !236)
!236 = distinct !DILexicalBlock(scope: !237, file: !3, line: 127, column: 5)
!237 = distinct !DILexicalBlock(scope: !232, file: !3, line: 126, column: 26)
!238 = !DILocation(line: 128, column: 29, scope: !239)
!239 = distinct !DILexicalBlock(scope: !240, file: !3, line: 127, column: 28)
!240 = distinct !DILexicalBlock(scope: !236, file: !3, line: 127, column: 5)
!241 = !DILocation(line: 128, column: 22, scope: !239)
!242 = !DILocation(line: 128, column: 7, scope: !239)
!243 = !DILocation(line: 127, column: 24, scope: !240)
!244 = !DILocation(line: 127, column: 18, scope: !240)
!245 = distinct !{!245, !235, !246, !143}
!246 = !DILocation(line: 129, column: 5, scope: !236)
!247 = !DILocation(line: 130, column: 5, scope: !237)
!248 = !DILocation(line: 126, column: 22, scope: !232)
!249 = distinct !{!249, !234, !250, !143}
!250 = !DILocation(line: 131, column: 3, scope: !233)
!251 = !DILocation(line: 132, column: 1, scope: !221)
!252 = distinct !DISubprogram(name: "zero", scope: !3, file: !3, line: 134, type: !104, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !253)
!253 = !{!254, !255, !256, !257}
!254 = !DILocalVariable(name: "A", arg: 1, scope: !252, file: !3, line: 134, type: !8)
!255 = !DILocalVariable(name: "n", arg: 2, scope: !252, file: !3, line: 134, type: !21)
!256 = !DILocalVariable(name: "i", scope: !252, file: !3, line: 136, type: !21)
!257 = !DILocalVariable(name: "j", scope: !252, file: !3, line: 136, type: !21)
!258 = !DILocation(line: 0, scope: !252)
!259 = !DILocation(line: 138, column: 17, scope: !260)
!260 = distinct !DILexicalBlock(scope: !261, file: !3, line: 138, column: 3)
!261 = distinct !DILexicalBlock(scope: !252, file: !3, line: 138, column: 3)
!262 = !DILocation(line: 138, column: 3, scope: !261)
!263 = !DILocation(line: 140, column: 20, scope: !264)
!264 = distinct !DILexicalBlock(scope: !265, file: !3, line: 139, column: 29)
!265 = distinct !DILexicalBlock(scope: !266, file: !3, line: 139, column: 5)
!266 = distinct !DILexicalBlock(scope: !267, file: !3, line: 139, column: 5)
!267 = distinct !DILexicalBlock(scope: !260, file: !3, line: 138, column: 27)
!268 = !DILocation(line: 143, column: 1, scope: !252)
!269 = distinct !DISubprogram(name: "init", scope: !3, file: !3, line: 145, type: !104, scopeLine: 145, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !270)
!270 = !{!271, !272, !273, !274}
!271 = !DILocalVariable(name: "A", arg: 1, scope: !269, file: !3, line: 145, type: !8)
!272 = !DILocalVariable(name: "n", arg: 2, scope: !269, file: !3, line: 145, type: !21)
!273 = !DILocalVariable(name: "i", scope: !269, file: !3, line: 147, type: !21)
!274 = !DILocalVariable(name: "j", scope: !269, file: !3, line: 147, type: !21)
!275 = !DILocation(line: 0, scope: !269)
!276 = !DILocation(line: 149, column: 17, scope: !277)
!277 = distinct !DILexicalBlock(scope: !278, file: !3, line: 149, column: 3)
!278 = distinct !DILexicalBlock(scope: !269, file: !3, line: 149, column: 3)
!279 = !DILocation(line: 149, column: 3, scope: !278)
!280 = !DILocation(line: 150, column: 5, scope: !281)
!281 = distinct !DILexicalBlock(scope: !282, file: !3, line: 150, column: 5)
!282 = distinct !DILexicalBlock(scope: !277, file: !3, line: 149, column: 27)
!283 = !DILocation(line: 61, column: 23, scope: !89, inlinedAt: !284)
!284 = distinct !DILocation(line: 151, column: 30, scope: !285)
!285 = distinct !DILexicalBlock(scope: !286, file: !3, line: 150, column: 29)
!286 = distinct !DILexicalBlock(scope: !281, file: !3, line: 150, column: 5)
!287 = !DILocation(line: 61, column: 36, scope: !89, inlinedAt: !284)
!288 = !DILocation(line: 62, column: 22, scope: !89, inlinedAt: !284)
!289 = !DILocation(line: 62, column: 12, scope: !89, inlinedAt: !284)
!290 = !DILocation(line: 0, scope: !89, inlinedAt: !284)
!291 = !DILocation(line: 151, column: 22, scope: !285)
!292 = !DILocation(line: 151, column: 15, scope: !285)
!293 = !DILocation(line: 151, column: 7, scope: !285)
!294 = !DILocation(line: 151, column: 20, scope: !285)
!295 = !DILocation(line: 150, column: 25, scope: !286)
!296 = distinct !{!296, !280, !297, !143}
!297 = !DILocation(line: 152, column: 5, scope: !281)
!298 = !DILocation(line: 149, column: 23, scope: !277)
!299 = distinct !{!299, !279, !300, !143}
!300 = !DILocation(line: 153, column: 3, scope: !278)
!301 = !DILocation(line: 61, column: 12, scope: !89, inlinedAt: !284)
!302 = !DILocation(line: 154, column: 1, scope: !269)
!303 = distinct !DISubprogram(name: "maxerror", scope: !3, file: !3, line: 156, type: !147, scopeLine: 156, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !304)
!304 = !{!305, !306, !307, !308, !309, !310, !311}
!305 = !DILocalVariable(name: "A", arg: 1, scope: !303, file: !3, line: 156, type: !8)
!306 = !DILocalVariable(name: "B", arg: 2, scope: !303, file: !3, line: 156, type: !8)
!307 = !DILocalVariable(name: "n", arg: 3, scope: !303, file: !3, line: 156, type: !21)
!308 = !DILocalVariable(name: "i", scope: !303, file: !3, line: 158, type: !21)
!309 = !DILocalVariable(name: "j", scope: !303, file: !3, line: 158, type: !21)
!310 = !DILocalVariable(name: "error", scope: !303, file: !3, line: 159, type: !7)
!311 = !DILocalVariable(name: "diff", scope: !312, file: !3, line: 163, type: !7)
!312 = distinct !DILexicalBlock(scope: !313, file: !3, line: 162, column: 29)
!313 = distinct !DILexicalBlock(scope: !314, file: !3, line: 162, column: 5)
!314 = distinct !DILexicalBlock(scope: !315, file: !3, line: 162, column: 5)
!315 = distinct !DILexicalBlock(scope: !316, file: !3, line: 161, column: 27)
!316 = distinct !DILexicalBlock(scope: !317, file: !3, line: 161, column: 3)
!317 = distinct !DILexicalBlock(scope: !303, file: !3, line: 161, column: 3)
!318 = !DILocation(line: 0, scope: !303)
!319 = !DILocation(line: 161, column: 17, scope: !316)
!320 = !DILocation(line: 161, column: 3, scope: !317)
!321 = !DILocation(line: 162, column: 5, scope: !314)
!322 = !DILocation(line: 163, column: 30, scope: !312)
!323 = !DILocation(line: 163, column: 22, scope: !312)
!324 = !DILocation(line: 163, column: 37, scope: !312)
!325 = !DILocation(line: 163, column: 35, scope: !312)
!326 = !DILocation(line: 163, column: 51, scope: !312)
!327 = !DILocation(line: 163, column: 21, scope: !312)
!328 = !DILocation(line: 0, scope: !312)
!329 = !DILocation(line: 164, column: 16, scope: !330)
!330 = distinct !DILexicalBlock(scope: !312, file: !3, line: 164, column: 11)
!331 = !DILocation(line: 164, column: 11, scope: !312)
!332 = !DILocation(line: 166, column: 16, scope: !333)
!333 = distinct !DILexicalBlock(scope: !312, file: !3, line: 166, column: 11)
!334 = !DILocation(line: 166, column: 11, scope: !312)
!335 = !DILocation(line: 162, column: 25, scope: !313)
!336 = !DILocation(line: 162, column: 19, scope: !313)
!337 = distinct !{!337, !321, !338, !143}
!338 = !DILocation(line: 168, column: 5, scope: !314)
!339 = !DILocation(line: 161, column: 23, scope: !316)
!340 = distinct !{!340, !320, !341, !143}
!341 = !DILocation(line: 169, column: 3, scope: !317)
!342 = !DILocation(line: 159, column: 10, scope: !303)
!343 = !DILocation(line: 171, column: 3, scope: !303)
!344 = distinct !DISubprogram(name: "iter_matmul", scope: !3, file: !3, line: 174, type: !345, scopeLine: 174, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !347)
!345 = !DISubroutineType(types: !346)
!346 = !{null, !8, !8, !8, !21}
!347 = !{!348, !349, !350, !351, !352, !353, !354, !355}
!348 = !DILocalVariable(name: "A", arg: 1, scope: !344, file: !3, line: 174, type: !8)
!349 = !DILocalVariable(name: "B", arg: 2, scope: !344, file: !3, line: 174, type: !8)
!350 = !DILocalVariable(name: "C", arg: 3, scope: !344, file: !3, line: 174, type: !8)
!351 = !DILocalVariable(name: "n", arg: 4, scope: !344, file: !3, line: 174, type: !21)
!352 = !DILocalVariable(name: "i", scope: !344, file: !3, line: 176, type: !21)
!353 = !DILocalVariable(name: "j", scope: !344, file: !3, line: 176, type: !21)
!354 = !DILocalVariable(name: "k", scope: !344, file: !3, line: 176, type: !21)
!355 = !DILocalVariable(name: "c", scope: !356, file: !3, line: 180, type: !6)
!356 = distinct !DILexicalBlock(scope: !357, file: !3, line: 179, column: 29)
!357 = distinct !DILexicalBlock(scope: !358, file: !3, line: 179, column: 5)
!358 = distinct !DILexicalBlock(scope: !359, file: !3, line: 179, column: 5)
!359 = distinct !DILexicalBlock(scope: !360, file: !3, line: 178, column: 3)
!360 = distinct !DILexicalBlock(scope: !344, file: !3, line: 178, column: 3)
!361 = !DILocation(line: 0, scope: !344)
!362 = !DILocation(line: 178, column: 17, scope: !359)
!363 = !DILocation(line: 178, column: 3, scope: !360)
!364 = !DILocation(line: 179, column: 5, scope: !358)
!365 = !DILocation(line: 0, scope: !356)
!366 = !DILocation(line: 181, column: 7, scope: !367)
!367 = distinct !DILexicalBlock(scope: !356, file: !3, line: 181, column: 7)
!368 = !DILocation(line: 182, column: 22, scope: !369)
!369 = distinct !DILexicalBlock(scope: !367, file: !3, line: 181, column: 7)
!370 = !DILocation(line: 182, column: 14, scope: !369)
!371 = !DILocation(line: 182, column: 33, scope: !369)
!372 = !DILocation(line: 182, column: 37, scope: !369)
!373 = !DILocation(line: 182, column: 29, scope: !369)
!374 = !DILocation(line: 182, column: 11, scope: !369)
!375 = !DILocation(line: 181, column: 27, scope: !369)
!376 = distinct !{!376, !366, !377, !143}
!377 = !DILocation(line: 182, column: 40, scope: !367)
!378 = !DILocation(line: 183, column: 15, scope: !356)
!379 = !DILocation(line: 183, column: 7, scope: !356)
!380 = !DILocation(line: 183, column: 20, scope: !356)
!381 = !DILocation(line: 179, column: 25, scope: !357)
!382 = !DILocation(line: 179, column: 19, scope: !357)
!383 = distinct !{!383, !364, !384, !143}
!384 = !DILocation(line: 184, column: 5, scope: !358)
!385 = !DILocation(line: 178, column: 23, scope: !359)
!386 = distinct !{!386, !363, !387, !143}
!387 = !DILocation(line: 184, column: 5, scope: !360)
!388 = !DILocation(line: 185, column: 1, scope: !344)
!389 = distinct !DISubprogram(name: "rec_matmulAdd", scope: !3, file: !3, line: 192, type: !390, scopeLine: 193, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !392)
!390 = !DISubroutineType(types: !391)
!391 = !{null, !8, !8, !8, !21, !21, !21, !21}
!392 = !{!393, !394, !395, !396, !397, !398, !399, !400, !403, !404, !405, !411, !416, !418}
!393 = !DILocalVariable(name: "A", arg: 1, scope: !389, file: !3, line: 192, type: !8)
!394 = !DILocalVariable(name: "B", arg: 2, scope: !389, file: !3, line: 192, type: !8)
!395 = !DILocalVariable(name: "C", arg: 3, scope: !389, file: !3, line: 192, type: !8)
!396 = !DILocalVariable(name: "m", arg: 4, scope: !389, file: !3, line: 193, type: !21)
!397 = !DILocalVariable(name: "n", arg: 5, scope: !389, file: !3, line: 193, type: !21)
!398 = !DILocalVariable(name: "p", arg: 6, scope: !389, file: !3, line: 193, type: !21)
!399 = !DILocalVariable(name: "ld", arg: 7, scope: !389, file: !3, line: 193, type: !21)
!400 = !DILocalVariable(name: "i", scope: !401, file: !3, line: 196, type: !21)
!401 = distinct !DILexicalBlock(scope: !402, file: !3, line: 195, column: 26)
!402 = distinct !DILexicalBlock(scope: !389, file: !3, line: 195, column: 7)
!403 = !DILocalVariable(name: "j", scope: !401, file: !3, line: 196, type: !21)
!404 = !DILocalVariable(name: "k", scope: !401, file: !3, line: 196, type: !21)
!405 = !DILocalVariable(name: "c", scope: !406, file: !3, line: 200, type: !6)
!406 = distinct !DILexicalBlock(scope: !407, file: !3, line: 199, column: 33)
!407 = distinct !DILexicalBlock(scope: !408, file: !3, line: 199, column: 9)
!408 = distinct !DILexicalBlock(scope: !409, file: !3, line: 199, column: 9)
!409 = distinct !DILexicalBlock(scope: !410, file: !3, line: 198, column: 7)
!410 = distinct !DILexicalBlock(scope: !401, file: !3, line: 198, column: 7)
!411 = !DILocalVariable(name: "m1", scope: !412, file: !3, line: 210, type: !21)
!412 = distinct !DILexicalBlock(scope: !413, file: !3, line: 209, column: 17)
!413 = distinct !DILexicalBlock(scope: !414, file: !3, line: 209, column: 9)
!414 = distinct !DILexicalBlock(scope: !415, file: !3, line: 208, column: 15)
!415 = distinct !DILexicalBlock(scope: !389, file: !3, line: 208, column: 7)
!416 = !DILocalVariable(name: "n1", scope: !417, file: !3, line: 217, type: !21)
!417 = distinct !DILexicalBlock(scope: !413, file: !3, line: 216, column: 12)
!418 = !DILocalVariable(name: "p1", scope: !419, file: !3, line: 223, type: !21)
!419 = distinct !DILexicalBlock(scope: !415, file: !3, line: 222, column: 10)
!420 = !DILocation(line: 0, scope: !412)
!421 = !DILocation(line: 0, scope: !389)
!422 = !DILocation(line: 195, column: 14, scope: !402)
!423 = !DILocation(line: 195, column: 19, scope: !402)
!424 = !DILocation(line: 195, column: 7, scope: !389)
!425 = !DILocation(line: 0, scope: !401)
!426 = !DILocation(line: 198, column: 21, scope: !409)
!427 = !DILocation(line: 198, column: 7, scope: !410)
!428 = !DILocation(line: 201, column: 11, scope: !429)
!429 = distinct !DILexicalBlock(scope: !406, file: !3, line: 201, column: 11)
!430 = !DILocation(line: 199, column: 9, scope: !408)
!431 = !DILocation(line: 0, scope: !406)
!432 = !DILocation(line: 202, column: 27, scope: !433)
!433 = distinct !DILexicalBlock(scope: !429, file: !3, line: 201, column: 11)
!434 = !DILocation(line: 202, column: 18, scope: !433)
!435 = !DILocation(line: 202, column: 38, scope: !433)
!436 = !DILocation(line: 202, column: 43, scope: !433)
!437 = !DILocation(line: 202, column: 34, scope: !433)
!438 = !DILocation(line: 202, column: 15, scope: !433)
!439 = !DILocation(line: 201, column: 31, scope: !433)
!440 = distinct !{!440, !428, !441, !143}
!441 = !DILocation(line: 202, column: 46, scope: !429)
!442 = !DILocation(line: 203, column: 20, scope: !406)
!443 = !DILocation(line: 203, column: 11, scope: !406)
!444 = !DILocation(line: 203, column: 25, scope: !406)
!445 = !DILocation(line: 199, column: 29, scope: !407)
!446 = !DILocation(line: 199, column: 23, scope: !407)
!447 = distinct !{!447, !430, !448, !143}
!448 = !DILocation(line: 204, column: 9, scope: !408)
!449 = !DILocation(line: 198, column: 27, scope: !409)
!450 = distinct !{!450, !427, !451, !143}
!451 = !DILocation(line: 204, column: 9, scope: !410)
!452 = distinct !{!452, !430, !448, !143, !453}
!453 = !{!"llvm.loop.isvectorized", i32 1}
!454 = distinct !{!454, !430, !448, !143, !455, !453}
!455 = !{!"llvm.loop.unroll.runtime.disable"}
!456 = !DILocation(line: 208, column: 9, scope: !415)
!457 = !DILocation(line: 208, column: 7, scope: !389)
!458 = !DILocation(line: 209, column: 11, scope: !413)
!459 = !DILocation(line: 209, column: 9, scope: !414)
!460 = !DILocation(line: 210, column: 18, scope: !412)
!461 = !DILocation(line: 212, column: 18, scope: !412)
!462 = !DILocation(line: 213, column: 28, scope: !412)
!463 = !DILocation(line: 213, column: 23, scope: !412)
!464 = !DILocation(line: 213, column: 39, scope: !412)
!465 = !DILocation(line: 213, column: 52, scope: !412)
!466 = !DILocation(line: 217, column: 18, scope: !417)
!467 = !DILocation(line: 0, scope: !417)
!468 = !DILocation(line: 218, column: 7, scope: !417)
!469 = !DILocation(line: 219, column: 23, scope: !417)
!470 = !DILocation(line: 219, column: 36, scope: !417)
!471 = !DILocation(line: 219, column: 31, scope: !417)
!472 = !DILocation(line: 219, column: 50, scope: !417)
!473 = !DILocation(line: 223, column: 16, scope: !419)
!474 = !DILocation(line: 0, scope: !419)
!475 = !DILocation(line: 224, column: 16, scope: !419)
!476 = !DILocation(line: 225, column: 24, scope: !419)
!477 = !DILocation(line: 225, column: 32, scope: !419)
!478 = !DILocation(line: 225, column: 46, scope: !419)
!479 = !DILocation(line: 229, column: 1, scope: !389)
!480 = distinct !DISubprogram(name: "rec_matmul", scope: !3, file: !3, line: 231, type: !390, scopeLine: 232, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !481)
!481 = !{!482, !483, !484, !485, !486, !487, !488, !489, !492, !493, !494, !500, !505, !507}
!482 = !DILocalVariable(name: "A", arg: 1, scope: !480, file: !3, line: 231, type: !8)
!483 = !DILocalVariable(name: "B", arg: 2, scope: !480, file: !3, line: 231, type: !8)
!484 = !DILocalVariable(name: "C", arg: 3, scope: !480, file: !3, line: 231, type: !8)
!485 = !DILocalVariable(name: "m", arg: 4, scope: !480, file: !3, line: 232, type: !21)
!486 = !DILocalVariable(name: "n", arg: 5, scope: !480, file: !3, line: 232, type: !21)
!487 = !DILocalVariable(name: "p", arg: 6, scope: !480, file: !3, line: 232, type: !21)
!488 = !DILocalVariable(name: "ld", arg: 7, scope: !480, file: !3, line: 232, type: !21)
!489 = !DILocalVariable(name: "i", scope: !490, file: !3, line: 235, type: !21)
!490 = distinct !DILexicalBlock(scope: !491, file: !3, line: 234, column: 26)
!491 = distinct !DILexicalBlock(scope: !480, file: !3, line: 234, column: 7)
!492 = !DILocalVariable(name: "j", scope: !490, file: !3, line: 235, type: !21)
!493 = !DILocalVariable(name: "k", scope: !490, file: !3, line: 235, type: !21)
!494 = !DILocalVariable(name: "c", scope: !495, file: !3, line: 238, type: !6)
!495 = distinct !DILexicalBlock(scope: !496, file: !3, line: 237, column: 33)
!496 = distinct !DILexicalBlock(scope: !497, file: !3, line: 237, column: 9)
!497 = distinct !DILexicalBlock(scope: !498, file: !3, line: 237, column: 9)
!498 = distinct !DILexicalBlock(scope: !499, file: !3, line: 236, column: 7)
!499 = distinct !DILexicalBlock(scope: !490, file: !3, line: 236, column: 7)
!500 = !DILocalVariable(name: "m1", scope: !501, file: !3, line: 248, type: !21)
!501 = distinct !DILexicalBlock(scope: !502, file: !3, line: 247, column: 17)
!502 = distinct !DILexicalBlock(scope: !503, file: !3, line: 247, column: 9)
!503 = distinct !DILexicalBlock(scope: !504, file: !3, line: 246, column: 15)
!504 = distinct !DILexicalBlock(scope: !480, file: !3, line: 246, column: 7)
!505 = !DILocalVariable(name: "n1", scope: !506, file: !3, line: 254, type: !21)
!506 = distinct !DILexicalBlock(scope: !502, file: !3, line: 253, column: 12)
!507 = !DILocalVariable(name: "p1", scope: !508, file: !3, line: 260, type: !21)
!508 = distinct !DILexicalBlock(scope: !504, file: !3, line: 259, column: 10)
!509 = !DILocation(line: 0, scope: !501)
!510 = !DILocation(line: 0, scope: !480)
!511 = !DILocation(line: 234, column: 14, scope: !491)
!512 = !DILocation(line: 234, column: 19, scope: !491)
!513 = !DILocation(line: 234, column: 7, scope: !480)
!514 = !DILocation(line: 0, scope: !490)
!515 = !DILocation(line: 236, column: 21, scope: !498)
!516 = !DILocation(line: 236, column: 7, scope: !499)
!517 = !DILocation(line: 239, column: 11, scope: !518)
!518 = distinct !DILexicalBlock(scope: !495, file: !3, line: 239, column: 11)
!519 = !DILocation(line: 237, column: 9, scope: !497)
!520 = !DILocation(line: 0, scope: !495)
!521 = !DILocation(line: 240, column: 27, scope: !522)
!522 = distinct !DILexicalBlock(scope: !518, file: !3, line: 239, column: 11)
!523 = !DILocation(line: 240, column: 18, scope: !522)
!524 = !DILocation(line: 240, column: 38, scope: !522)
!525 = !DILocation(line: 240, column: 43, scope: !522)
!526 = !DILocation(line: 240, column: 34, scope: !522)
!527 = !DILocation(line: 240, column: 15, scope: !522)
!528 = !DILocation(line: 239, column: 31, scope: !522)
!529 = distinct !{!529, !517, !530, !143}
!530 = !DILocation(line: 240, column: 46, scope: !518)
!531 = !DILocation(line: 241, column: 20, scope: !495)
!532 = !DILocation(line: 241, column: 11, scope: !495)
!533 = !DILocation(line: 241, column: 25, scope: !495)
!534 = !DILocation(line: 237, column: 29, scope: !496)
!535 = !DILocation(line: 237, column: 23, scope: !496)
!536 = distinct !{!536, !519, !537, !143}
!537 = !DILocation(line: 242, column: 9, scope: !497)
!538 = !DILocation(line: 236, column: 27, scope: !498)
!539 = distinct !{!539, !516, !540, !143}
!540 = !DILocation(line: 242, column: 9, scope: !499)
!541 = !DILocation(line: 246, column: 9, scope: !504)
!542 = !DILocation(line: 246, column: 7, scope: !480)
!543 = !DILocation(line: 247, column: 11, scope: !502)
!544 = !DILocation(line: 247, column: 9, scope: !503)
!545 = !DILocation(line: 248, column: 18, scope: !501)
!546 = !DILocation(line: 249, column: 18, scope: !501)
!547 = !DILocation(line: 250, column: 25, scope: !501)
!548 = !DILocation(line: 250, column: 20, scope: !501)
!549 = !DILocation(line: 250, column: 36, scope: !501)
!550 = !DILocation(line: 250, column: 49, scope: !501)
!551 = !DILocation(line: 254, column: 18, scope: !506)
!552 = !DILocation(line: 0, scope: !506)
!553 = !DILocation(line: 255, column: 7, scope: !506)
!554 = !DILocation(line: 256, column: 23, scope: !506)
!555 = !DILocation(line: 256, column: 36, scope: !506)
!556 = !DILocation(line: 256, column: 31, scope: !506)
!557 = !DILocation(line: 256, column: 50, scope: !506)
!558 = !DILocation(line: 256, column: 7, scope: !506)
!559 = !DILocation(line: 266, column: 1, scope: !480)
!560 = !DILocation(line: 260, column: 16, scope: !508)
!561 = !DILocation(line: 0, scope: !508)
!562 = !DILocation(line: 261, column: 16, scope: !508)
!563 = !DILocation(line: 262, column: 21, scope: !508)
!564 = !DILocation(line: 262, column: 29, scope: !508)
!565 = !DILocation(line: 262, column: 43, scope: !508)
!566 = distinct !{!566, !567}
!567 = !{!"llvm.loop.unroll.disable"}
!568 = distinct !DISubprogram(name: "mat_vec_mul", scope: !3, file: !3, line: 277, type: !390, scopeLine: 277, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !569)
!569 = !{!570, !571, !572, !573, !574, !575, !576, !577, !580, !581, !587, !592, !595}
!570 = !DILocalVariable(name: "A", arg: 1, scope: !568, file: !3, line: 277, type: !8)
!571 = !DILocalVariable(name: "R", arg: 2, scope: !568, file: !3, line: 277, type: !8)
!572 = !DILocalVariable(name: "P", arg: 3, scope: !568, file: !3, line: 277, type: !8)
!573 = !DILocalVariable(name: "m", arg: 4, scope: !568, file: !3, line: 277, type: !21)
!574 = !DILocalVariable(name: "n", arg: 5, scope: !568, file: !3, line: 277, type: !21)
!575 = !DILocalVariable(name: "ld", arg: 6, scope: !568, file: !3, line: 277, type: !21)
!576 = !DILocalVariable(name: "add", arg: 7, scope: !568, file: !3, line: 277, type: !21)
!577 = !DILocalVariable(name: "i", scope: !578, file: !3, line: 280, type: !21)
!578 = distinct !DILexicalBlock(scope: !579, file: !3, line: 279, column: 21)
!579 = distinct !DILexicalBlock(scope: !568, file: !3, line: 279, column: 6)
!580 = !DILocalVariable(name: "j", scope: !578, file: !3, line: 280, type: !21)
!581 = !DILocalVariable(name: "c", scope: !582, file: !3, line: 284, type: !6)
!582 = distinct !DILexicalBlock(scope: !583, file: !3, line: 283, column: 30)
!583 = distinct !DILexicalBlock(scope: !584, file: !3, line: 283, column: 7)
!584 = distinct !DILexicalBlock(scope: !585, file: !3, line: 283, column: 7)
!585 = distinct !DILexicalBlock(scope: !586, file: !3, line: 282, column: 13)
!586 = distinct !DILexicalBlock(scope: !578, file: !3, line: 282, column: 8)
!587 = !DILocalVariable(name: "c", scope: !588, file: !3, line: 292, type: !6)
!588 = distinct !DILexicalBlock(scope: !589, file: !3, line: 291, column: 30)
!589 = distinct !DILexicalBlock(scope: !590, file: !3, line: 291, column: 7)
!590 = distinct !DILexicalBlock(scope: !591, file: !3, line: 291, column: 7)
!591 = distinct !DILexicalBlock(scope: !586, file: !3, line: 290, column: 12)
!592 = !DILocalVariable(name: "m1", scope: !593, file: !3, line: 301, type: !21)
!593 = distinct !DILexicalBlock(scope: !594, file: !3, line: 300, column: 23)
!594 = distinct !DILexicalBlock(scope: !579, file: !3, line: 300, column: 14)
!595 = !DILocalVariable(name: "n1", scope: !596, file: !3, line: 306, type: !21)
!596 = distinct !DILexicalBlock(scope: !594, file: !3, line: 305, column: 10)
!597 = !DILocation(line: 0, scope: !568)
!598 = !DILocation(line: 279, column: 9, scope: !579)
!599 = !DILocation(line: 279, column: 14, scope: !579)
!600 = !DILocation(line: 279, column: 6, scope: !568)
!601 = !DILocation(line: 282, column: 8, scope: !586)
!602 = !DILocation(line: 282, column: 8, scope: !578)
!603 = !DILocation(line: 0, scope: !578)
!604 = !DILocation(line: 283, column: 20, scope: !583)
!605 = !DILocation(line: 283, column: 7, scope: !584)
!606 = !DILocation(line: 285, column: 9, scope: !607)
!607 = distinct !DILexicalBlock(scope: !582, file: !3, line: 285, column: 9)
!608 = !DILocation(line: 283, column: 26, scope: !583)
!609 = !DILocation(line: 288, column: 14, scope: !582)
!610 = distinct !{!610, !605, !611, !143, !453}
!611 = !DILocation(line: 289, column: 7, scope: !584)
!612 = !DILocation(line: 0, scope: !582)
!613 = !DILocation(line: 286, column: 25, scope: !614)
!614 = distinct !DILexicalBlock(scope: !615, file: !3, line: 285, column: 32)
!615 = distinct !DILexicalBlock(scope: !607, file: !3, line: 285, column: 9)
!616 = !DILocation(line: 286, column: 16, scope: !614)
!617 = !DILocation(line: 286, column: 32, scope: !614)
!618 = !DILocation(line: 286, column: 13, scope: !614)
!619 = !DILocation(line: 285, column: 28, scope: !615)
!620 = distinct !{!620, !606, !621, !143}
!621 = !DILocation(line: 287, column: 9, scope: !607)
!622 = distinct !{!622, !567}
!623 = !DILocation(line: 288, column: 9, scope: !582)
!624 = distinct !{!624, !605, !611, !143}
!625 = !DILocation(line: 291, column: 20, scope: !589)
!626 = !DILocation(line: 291, column: 7, scope: !590)
!627 = !DILocation(line: 293, column: 9, scope: !628)
!628 = distinct !DILexicalBlock(scope: !588, file: !3, line: 293, column: 9)
!629 = !DILocation(line: 296, column: 14, scope: !588)
!630 = !DILocation(line: 0, scope: !588)
!631 = !DILocation(line: 311, column: 1, scope: !568)
!632 = !DILocation(line: 294, column: 25, scope: !633)
!633 = distinct !DILexicalBlock(scope: !634, file: !3, line: 293, column: 32)
!634 = distinct !DILexicalBlock(scope: !628, file: !3, line: 293, column: 9)
!635 = !DILocation(line: 294, column: 16, scope: !633)
!636 = !DILocation(line: 294, column: 32, scope: !633)
!637 = !DILocation(line: 294, column: 13, scope: !633)
!638 = !DILocation(line: 293, column: 28, scope: !634)
!639 = distinct !{!639, !627, !640, !143}
!640 = !DILocation(line: 295, column: 9, scope: !628)
!641 = distinct !{!641, !567}
!642 = !DILocation(line: 296, column: 9, scope: !588)
!643 = !DILocation(line: 291, column: 26, scope: !589)
!644 = distinct !{!644, !626, !645, !143}
!645 = !DILocation(line: 297, column: 7, scope: !590)
!646 = distinct !{!646, !605, !611, !143, !455, !453}
!647 = !DILocation(line: 300, column: 16, scope: !594)
!648 = !DILocation(line: 300, column: 14, scope: !579)
!649 = !DILocation(line: 301, column: 16, scope: !593)
!650 = !DILocation(line: 0, scope: !593)
!651 = !DILocation(line: 302, column: 5, scope: !593)
!652 = !DILocation(line: 303, column: 23, scope: !593)
!653 = !DILocation(line: 303, column: 19, scope: !593)
!654 = !DILocation(line: 303, column: 33, scope: !593)
!655 = !DILocation(line: 303, column: 41, scope: !593)
!656 = !DILocation(line: 306, column: 16, scope: !596)
!657 = !DILocation(line: 0, scope: !596)
!658 = !DILocation(line: 307, column: 5, scope: !596)
!659 = !DILocation(line: 309, column: 19, scope: !596)
!660 = !DILocation(line: 309, column: 27, scope: !596)
!661 = !DILocation(line: 309, column: 41, scope: !596)
!662 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 316, type: !663, scopeLine: 316, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !667)
!663 = !DISubroutineType(types: !664)
!664 = !{!21, !21, !665}
!665 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !666, size: 64)
!666 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!667 = !{!668, !669, !670, !671, !672, !673, !674, !675, !676, !677, !678, !679, !680, !681, !682, !683, !685, !688, !689}
!668 = !DILocalVariable(name: "argc", arg: 1, scope: !662, file: !3, line: 316, type: !21)
!669 = !DILocalVariable(name: "argv", arg: 2, scope: !662, file: !3, line: 316, type: !665)
!670 = !DILocalVariable(name: "n", scope: !662, file: !3, line: 318, type: !21)
!671 = !DILocalVariable(name: "check", scope: !662, file: !3, line: 319, type: !21)
!672 = !DILocalVariable(name: "rand_check", scope: !662, file: !3, line: 319, type: !21)
!673 = !DILocalVariable(name: "help", scope: !662, file: !3, line: 319, type: !21)
!674 = !DILocalVariable(name: "round", scope: !662, file: !3, line: 320, type: !21)
!675 = !DILocalVariable(name: "A", scope: !662, file: !3, line: 321, type: !8)
!676 = !DILocalVariable(name: "B", scope: !662, file: !3, line: 321, type: !8)
!677 = !DILocalVariable(name: "C", scope: !662, file: !3, line: 321, type: !8)
!678 = !DILocalVariable(name: "R", scope: !662, file: !3, line: 322, type: !8)
!679 = !DILocalVariable(name: "P1", scope: !662, file: !3, line: 322, type: !8)
!680 = !DILocalVariable(name: "P2", scope: !662, file: !3, line: 322, type: !8)
!681 = !DILocalVariable(name: "C2", scope: !662, file: !3, line: 323, type: !8)
!682 = !DILocalVariable(name: "err", scope: !662, file: !3, line: 324, type: !7)
!683 = !DILocalVariable(name: "r", scope: !684, file: !3, line: 342, type: !21)
!684 = distinct !DILexicalBlock(scope: !662, file: !3, line: 342, column: 3)
!685 = !DILocalVariable(name: "t1", scope: !686, file: !3, line: 366, type: !33)
!686 = distinct !DILexicalBlock(scope: !687, file: !3, line: 342, column: 30)
!687 = distinct !DILexicalBlock(scope: !684, file: !3, line: 342, column: 3)
!688 = !DILocalVariable(name: "t2", scope: !686, file: !3, line: 366, type: !33)
!689 = !DILocalVariable(name: "runtime_ms", scope: !686, file: !3, line: 370, type: !31)
!690 = !DILocation(line: 0, scope: !662)
!691 = !DILocation(line: 318, column: 3, scope: !662)
!692 = !DILocation(line: 318, column: 7, scope: !662)
!693 = !{!694, !694, i64 0}
!694 = !{!"int", !49, i64 0}
!695 = !DILocation(line: 319, column: 3, scope: !662)
!696 = !DILocation(line: 319, column: 7, scope: !662)
!697 = !DILocation(line: 319, column: 18, scope: !662)
!698 = !DILocation(line: 319, column: 34, scope: !662)
!699 = !DILocation(line: 320, column: 3, scope: !662)
!700 = !DILocation(line: 320, column: 7, scope: !662)
!701 = !DILocation(line: 326, column: 3, scope: !662)
!702 = !DILocation(line: 329, column: 6, scope: !703)
!703 = distinct !DILexicalBlock(scope: !662, file: !3, line: 329, column: 6)
!704 = !DILocation(line: 329, column: 6, scope: !662)
!705 = !DILocation(line: 330, column: 13, scope: !706)
!706 = distinct !DILexicalBlock(scope: !703, file: !3, line: 329, column: 12)
!707 = !{!708, !708, i64 0}
!708 = !{!"any pointer", !49, i64 0}
!709 = !DILocation(line: 330, column: 5, scope: !706)
!710 = !DILocation(line: 332, column: 13, scope: !706)
!711 = !DILocation(line: 332, column: 5, scope: !706)
!712 = !DILocation(line: 334, column: 13, scope: !706)
!713 = !DILocation(line: 334, column: 5, scope: !706)
!714 = !DILocation(line: 336, column: 5, scope: !706)
!715 = !DILocation(line: 340, column: 3, scope: !662)
!716 = !DILocation(line: 0, scope: !684)
!717 = !DILocation(line: 342, column: 18, scope: !687)
!718 = !DILocation(line: 342, column: 17, scope: !687)
!719 = !DILocation(line: 342, column: 3, scope: !684)
!720 = !DILocation(line: 409, column: 1, scope: !662)
!721 = !DILocation(line: 408, column: 3, scope: !662)
!722 = !DILocation(line: 343, column: 25, scope: !686)
!723 = !DILocation(line: 343, column: 27, scope: !686)
!724 = !DILocation(line: 343, column: 31, scope: !686)
!725 = !DILocation(line: 343, column: 18, scope: !686)
!726 = !DILocation(line: 343, column: 9, scope: !686)
!727 = !DILocation(line: 344, column: 18, scope: !686)
!728 = !DILocation(line: 344, column: 9, scope: !686)
!729 = !DILocation(line: 345, column: 18, scope: !686)
!730 = !DILocation(line: 345, column: 9, scope: !686)
!731 = !DILocation(line: 347, column: 8, scope: !732)
!732 = distinct !DILexicalBlock(scope: !686, file: !3, line: 347, column: 8)
!733 = !DILocation(line: 347, column: 8, scope: !686)
!734 = !DILocation(line: 348, column: 27, scope: !735)
!735 = distinct !DILexicalBlock(scope: !732, file: !3, line: 347, column: 20)
!736 = !DILocation(line: 348, column: 29, scope: !735)
!737 = !DILocation(line: 348, column: 20, scope: !735)
!738 = !DILocation(line: 348, column: 11, scope: !735)
!739 = !DILocation(line: 349, column: 21, scope: !735)
!740 = !DILocation(line: 349, column: 12, scope: !735)
!741 = !DILocation(line: 350, column: 21, scope: !735)
!742 = !DILocation(line: 350, column: 12, scope: !735)
!743 = !DILocation(line: 0, scope: !120, inlinedAt: !744)
!744 = distinct !DILocation(line: 351, column: 7, scope: !735)
!745 = !DILocation(line: 80, column: 16, scope: !127, inlinedAt: !744)
!746 = !DILocation(line: 80, column: 3, scope: !128, inlinedAt: !744)
!747 = !DILocation(line: 61, column: 23, scope: !89, inlinedAt: !748)
!748 = distinct !DILocation(line: 81, column: 19, scope: !132, inlinedAt: !744)
!749 = !DILocation(line: 61, column: 36, scope: !89, inlinedAt: !748)
!750 = !DILocation(line: 62, column: 22, scope: !89, inlinedAt: !748)
!751 = !DILocation(line: 62, column: 12, scope: !89, inlinedAt: !748)
!752 = !DILocation(line: 0, scope: !89, inlinedAt: !748)
!753 = !DILocation(line: 81, column: 12, scope: !132, inlinedAt: !744)
!754 = !DILocation(line: 81, column: 5, scope: !132, inlinedAt: !744)
!755 = !DILocation(line: 81, column: 10, scope: !132, inlinedAt: !744)
!756 = !DILocation(line: 80, column: 22, scope: !127, inlinedAt: !744)
!757 = distinct !{!757, !746, !758, !143}
!758 = !DILocation(line: 82, column: 3, scope: !128, inlinedAt: !744)
!759 = !DILocation(line: 61, column: 12, scope: !89, inlinedAt: !748)
!760 = !DILocation(line: 353, column: 15, scope: !761)
!761 = distinct !DILexicalBlock(scope: !732, file: !3, line: 353, column: 15)
!762 = !DILocation(line: 353, column: 15, scope: !732)
!763 = !DILocation(line: 354, column: 21, scope: !764)
!764 = distinct !DILexicalBlock(scope: !761, file: !3, line: 353, column: 22)
!765 = !DILocation(line: 354, column: 12, scope: !764)
!766 = !DILocation(line: 0, scope: !252, inlinedAt: !767)
!767 = distinct !DILocation(line: 355, column: 7, scope: !764)
!768 = !DILocation(line: 138, column: 17, scope: !260, inlinedAt: !767)
!769 = !DILocation(line: 138, column: 3, scope: !261, inlinedAt: !767)
!770 = !DILocation(line: 140, column: 20, scope: !264, inlinedAt: !767)
!771 = !DILocation(line: 0, scope: !269, inlinedAt: !772)
!772 = distinct !DILocation(line: 358, column: 5, scope: !686)
!773 = !DILocation(line: 149, column: 3, scope: !278, inlinedAt: !772)
!774 = !DILocation(line: 149, column: 17, scope: !277, inlinedAt: !772)
!775 = !DILocation(line: 150, column: 5, scope: !281, inlinedAt: !772)
!776 = !DILocation(line: 61, column: 23, scope: !89, inlinedAt: !777)
!777 = distinct !DILocation(line: 151, column: 30, scope: !285, inlinedAt: !772)
!778 = !DILocation(line: 61, column: 36, scope: !89, inlinedAt: !777)
!779 = !DILocation(line: 62, column: 22, scope: !89, inlinedAt: !777)
!780 = !DILocation(line: 62, column: 12, scope: !89, inlinedAt: !777)
!781 = !DILocation(line: 0, scope: !89, inlinedAt: !777)
!782 = !DILocation(line: 151, column: 22, scope: !285, inlinedAt: !772)
!783 = !DILocation(line: 151, column: 15, scope: !285, inlinedAt: !772)
!784 = !DILocation(line: 151, column: 7, scope: !285, inlinedAt: !772)
!785 = !DILocation(line: 151, column: 20, scope: !285, inlinedAt: !772)
!786 = !DILocation(line: 150, column: 25, scope: !286, inlinedAt: !772)
!787 = distinct !{!787, !775, !788, !143}
!788 = !DILocation(line: 152, column: 5, scope: !281, inlinedAt: !772)
!789 = !DILocation(line: 149, column: 23, scope: !277, inlinedAt: !772)
!790 = distinct !{!790, !773, !791, !143}
!791 = !DILocation(line: 153, column: 3, scope: !278, inlinedAt: !772)
!792 = !DILocation(line: 149, column: 3, scope: !278, inlinedAt: !793)
!793 = distinct !DILocation(line: 359, column: 5, scope: !686)
!794 = !DILocation(line: 0, scope: !269, inlinedAt: !793)
!795 = !DILocation(line: 150, column: 5, scope: !281, inlinedAt: !793)
!796 = !DILocation(line: 61, column: 23, scope: !89, inlinedAt: !797)
!797 = distinct !DILocation(line: 151, column: 30, scope: !285, inlinedAt: !793)
!798 = !DILocation(line: 61, column: 36, scope: !89, inlinedAt: !797)
!799 = !DILocation(line: 62, column: 22, scope: !89, inlinedAt: !797)
!800 = !DILocation(line: 62, column: 12, scope: !89, inlinedAt: !797)
!801 = !DILocation(line: 0, scope: !89, inlinedAt: !797)
!802 = !DILocation(line: 151, column: 22, scope: !285, inlinedAt: !793)
!803 = !DILocation(line: 151, column: 15, scope: !285, inlinedAt: !793)
!804 = !DILocation(line: 151, column: 7, scope: !285, inlinedAt: !793)
!805 = !DILocation(line: 151, column: 20, scope: !285, inlinedAt: !793)
!806 = !DILocation(line: 150, column: 25, scope: !286, inlinedAt: !793)
!807 = distinct !{!807, !795, !808, !143}
!808 = !DILocation(line: 152, column: 5, scope: !281, inlinedAt: !793)
!809 = !DILocation(line: 149, column: 23, scope: !277, inlinedAt: !793)
!810 = !DILocation(line: 149, column: 17, scope: !277, inlinedAt: !793)
!811 = distinct !{!811, !792, !812, !143}
!812 = !DILocation(line: 153, column: 3, scope: !278, inlinedAt: !793)
!813 = !DILocation(line: 61, column: 12, scope: !89, inlinedAt: !797)
!814 = !DILocation(line: 361, column: 13, scope: !686)
!815 = !DILocation(line: 361, column: 5, scope: !686)
!816 = !DILocation(line: 364, column: 13, scope: !686)
!817 = !DILocation(line: 0, scope: !252, inlinedAt: !818)
!818 = distinct !DILocation(line: 364, column: 5, scope: !686)
!819 = !DILocation(line: 138, column: 17, scope: !260, inlinedAt: !818)
!820 = !DILocation(line: 138, column: 3, scope: !261, inlinedAt: !818)
!821 = !DILocation(line: 140, column: 20, scope: !264, inlinedAt: !818)
!822 = !DILocation(line: 143, column: 1, scope: !252, inlinedAt: !818)
!823 = !DILocation(line: 366, column: 5, scope: !686)
!824 = !DILocation(line: 366, column: 20, scope: !686)
!825 = !DILocation(line: 366, column: 24, scope: !686)
!826 = !DILocation(line: 367, column: 5, scope: !686)
!827 = !DILocation(line: 368, column: 25, scope: !686)
!828 = !DILocation(line: 368, column: 5, scope: !686)
!829 = !DILocation(line: 369, column: 5, scope: !686)
!830 = !DILocation(line: 0, scope: !28, inlinedAt: !831)
!831 = distinct !DILocation(line: 370, column: 38, scope: !686)
!832 = !DILocation(line: 40, column: 16, scope: !28, inlinedAt: !831)
!833 = !DILocation(line: 40, column: 43, scope: !28, inlinedAt: !831)
!834 = !DILocation(line: 0, scope: !28, inlinedAt: !835)
!835 = distinct !DILocation(line: 370, column: 50, scope: !686)
!836 = !DILocation(line: 40, column: 16, scope: !28, inlinedAt: !835)
!837 = !DILocation(line: 40, column: 43, scope: !28, inlinedAt: !835)
!838 = !DILocation(line: 40, column: 37, scope: !28, inlinedAt: !831)
!839 = !DILocation(line: 370, column: 49, scope: !686)
!840 = !DILocation(line: 370, column: 62, scope: !686)
!841 = !DILocation(line: 0, scope: !686)
!842 = !DILocation(line: 371, column: 31, scope: !686)
!843 = !DILocation(line: 371, column: 41, scope: !686)
!844 = !DILocation(line: 371, column: 5, scope: !686)
!845 = !DILocation(line: 375, column: 8, scope: !846)
!846 = distinct !DILexicalBlock(scope: !686, file: !3, line: 375, column: 8)
!847 = !DILocation(line: 375, column: 8, scope: !686)
!848 = !DILocation(line: 376, column: 29, scope: !849)
!849 = distinct !DILexicalBlock(scope: !846, file: !3, line: 375, column: 20)
!850 = !DILocation(line: 376, column: 7, scope: !849)
!851 = !DILocation(line: 377, column: 30, scope: !849)
!852 = !DILocation(line: 377, column: 7, scope: !849)
!853 = !DILocation(line: 379, column: 29, scope: !849)
!854 = !DILocation(line: 379, column: 7, scope: !849)
!855 = !DILocation(line: 380, column: 34, scope: !849)
!856 = !DILocation(line: 0, scope: !146, inlinedAt: !857)
!857 = distinct !DILocation(line: 380, column: 13, scope: !849)
!858 = !DILocation(line: 89, column: 16, scope: !158, inlinedAt: !857)
!859 = !DILocation(line: 89, column: 3, scope: !159, inlinedAt: !857)
!860 = !DILocation(line: 90, column: 13, scope: !162, inlinedAt: !857)
!861 = !DILocation(line: 90, column: 21, scope: !162, inlinedAt: !857)
!862 = !DILocation(line: 90, column: 19, scope: !162, inlinedAt: !857)
!863 = !DILocation(line: 90, column: 28, scope: !162, inlinedAt: !857)
!864 = !DILocation(line: 90, column: 12, scope: !162, inlinedAt: !857)
!865 = !DILocation(line: 91, column: 13, scope: !168, inlinedAt: !857)
!866 = !DILocation(line: 91, column: 8, scope: !162, inlinedAt: !857)
!867 = !DILocation(line: 93, column: 13, scope: !171, inlinedAt: !857)
!868 = !DILocation(line: 93, column: 8, scope: !162, inlinedAt: !857)
!869 = !DILocation(line: 89, column: 22, scope: !158, inlinedAt: !857)
!870 = distinct !{!870, !859, !871, !143}
!871 = !DILocation(line: 96, column: 3, scope: !159, inlinedAt: !857)
!872 = !DILocation(line: 384, column: 15, scope: !873)
!873 = distinct !DILexicalBlock(scope: !846, file: !3, line: 384, column: 15)
!874 = !DILocation(line: 384, column: 15, scope: !846)
!875 = !DILocation(line: 385, column: 29, scope: !876)
!876 = distinct !DILexicalBlock(scope: !873, file: !3, line: 384, column: 22)
!877 = !DILocation(line: 0, scope: !344, inlinedAt: !878)
!878 = distinct !DILocation(line: 385, column: 7, scope: !876)
!879 = !DILocation(line: 178, column: 17, scope: !359, inlinedAt: !878)
!880 = !DILocation(line: 178, column: 3, scope: !360, inlinedAt: !878)
!881 = !DILocation(line: 179, column: 5, scope: !358, inlinedAt: !878)
!882 = !DILocation(line: 0, scope: !356, inlinedAt: !878)
!883 = !DILocation(line: 181, column: 7, scope: !367, inlinedAt: !878)
!884 = !DILocation(line: 182, column: 22, scope: !369, inlinedAt: !878)
!885 = !DILocation(line: 182, column: 14, scope: !369, inlinedAt: !878)
!886 = !DILocation(line: 182, column: 33, scope: !369, inlinedAt: !878)
!887 = !DILocation(line: 182, column: 37, scope: !369, inlinedAt: !878)
!888 = !DILocation(line: 182, column: 29, scope: !369, inlinedAt: !878)
!889 = !DILocation(line: 182, column: 11, scope: !369, inlinedAt: !878)
!890 = !DILocation(line: 181, column: 27, scope: !369, inlinedAt: !878)
!891 = distinct !{!891, !883, !892, !143}
!892 = !DILocation(line: 182, column: 40, scope: !367, inlinedAt: !878)
!893 = !DILocation(line: 183, column: 15, scope: !356, inlinedAt: !878)
!894 = !DILocation(line: 183, column: 7, scope: !356, inlinedAt: !878)
!895 = !DILocation(line: 183, column: 20, scope: !356, inlinedAt: !878)
!896 = !DILocation(line: 179, column: 25, scope: !357, inlinedAt: !878)
!897 = !DILocation(line: 179, column: 19, scope: !357, inlinedAt: !878)
!898 = distinct !{!898, !881, !899, !143}
!899 = !DILocation(line: 184, column: 5, scope: !358, inlinedAt: !878)
!900 = !DILocation(line: 178, column: 23, scope: !359, inlinedAt: !878)
!901 = distinct !{!901, !880, !902, !143}
!902 = !DILocation(line: 184, column: 5, scope: !360, inlinedAt: !878)
!903 = !DILocation(line: 0, scope: !303, inlinedAt: !904)
!904 = distinct !DILocation(line: 386, column: 13, scope: !876)
!905 = !DILocation(line: 162, column: 5, scope: !314, inlinedAt: !904)
!906 = !DILocation(line: 163, column: 30, scope: !312, inlinedAt: !904)
!907 = !DILocation(line: 163, column: 22, scope: !312, inlinedAt: !904)
!908 = !DILocation(line: 163, column: 37, scope: !312, inlinedAt: !904)
!909 = !DILocation(line: 163, column: 35, scope: !312, inlinedAt: !904)
!910 = !DILocation(line: 163, column: 51, scope: !312, inlinedAt: !904)
!911 = !DILocation(line: 163, column: 21, scope: !312, inlinedAt: !904)
!912 = !DILocation(line: 0, scope: !312, inlinedAt: !904)
!913 = !DILocation(line: 164, column: 16, scope: !330, inlinedAt: !904)
!914 = !DILocation(line: 164, column: 11, scope: !312, inlinedAt: !904)
!915 = !DILocation(line: 166, column: 16, scope: !333, inlinedAt: !904)
!916 = !DILocation(line: 166, column: 11, scope: !312, inlinedAt: !904)
!917 = !DILocation(line: 162, column: 25, scope: !313, inlinedAt: !904)
!918 = !DILocation(line: 162, column: 19, scope: !313, inlinedAt: !904)
!919 = distinct !{!919, !905, !920, !143}
!920 = !DILocation(line: 168, column: 5, scope: !314, inlinedAt: !904)
!921 = !DILocation(line: 161, column: 23, scope: !316, inlinedAt: !904)
!922 = !DILocation(line: 161, column: 17, scope: !316, inlinedAt: !904)
!923 = !DILocation(line: 161, column: 3, scope: !317, inlinedAt: !904)
!924 = distinct !{!924, !923, !925, !143}
!925 = !DILocation(line: 169, column: 3, scope: !317, inlinedAt: !904)
!926 = !DILocation(line: 0, scope: !846)
!927 = !DILocation(line: 391, column: 13, scope: !686)
!928 = !DILocation(line: 391, column: 5, scope: !686)
!929 = !DILocation(line: 392, column: 13, scope: !686)
!930 = !DILocation(line: 392, column: 45, scope: !686)
!931 = !DILocation(line: 392, column: 5, scope: !686)
!932 = !DILocation(line: 394, column: 5, scope: !686)
!933 = !DILocation(line: 395, column: 5, scope: !686)
!934 = !DILocation(line: 396, column: 5, scope: !686)
!935 = !DILocation(line: 398, column: 8, scope: !936)
!936 = distinct !DILexicalBlock(scope: !686, file: !3, line: 398, column: 8)
!937 = !DILocation(line: 398, column: 8, scope: !686)
!938 = !DILocation(line: 399, column: 12, scope: !939)
!939 = distinct !DILexicalBlock(scope: !936, file: !3, line: 398, column: 20)
!940 = !DILocation(line: 399, column: 7, scope: !939)
!941 = !DILocation(line: 400, column: 12, scope: !939)
!942 = !DILocation(line: 400, column: 7, scope: !939)
!943 = !DILocation(line: 402, column: 5, scope: !939)
!944 = !DILocation(line: 402, column: 16, scope: !945)
!945 = distinct !DILexicalBlock(scope: !936, file: !3, line: 402, column: 16)
!946 = !DILocation(line: 402, column: 16, scope: !936)
!947 = !DILocation(line: 0, scope: !936)
!948 = !DILocation(line: 406, column: 3, scope: !687)
!949 = !DILocation(line: 342, column: 26, scope: !687)
!950 = distinct !{!950, !719, !951, !143}
!951 = !DILocation(line: 406, column: 3, scope: !684)
!952 = !DISubprogram(name: "get_options", scope: !953, file: !953, line: 20, type: !954, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !958)
!953 = !DIFile(filename: "./getoptions.h", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "bf060e74fdb298e4a85522e522cd3a24")
!954 = !DISubroutineType(types: !955)
!955 = !{null, !21, !665, !956, !957, null}
!956 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!957 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!958 = !{}
!959 = !DISubprogram(name: "gettimeofday", scope: !960, file: !960, line: 72, type: !961, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !958)
!960 = !DIFile(filename: "/usr/include/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b3cbcac52b1954fa045aa74bfcd1a38")
!961 = !DISubroutineType(types: !962)
!962 = !{!21, !963, !964}
!963 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !32)
!964 = !DIDerivedType(tag: DW_TAG_typedef, name: "__timezone_ptr_t", file: !960, line: 62, baseType: !965)
!965 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !966)
!966 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !967, size: 64)
!967 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !960, line: 56, size: 64, elements: !968)
!968 = !{!969, !970}
!969 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !967, file: !960, line: 58, baseType: !21, size: 32)
!970 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !967, file: !960, line: 59, baseType: !21, size: 32, offset: 32)
