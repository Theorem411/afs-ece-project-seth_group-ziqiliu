; ModuleID = './strassen.ll'
source_filename = "strassen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@rand_nxt = dso_local local_unnamed_addr global i64 0, align 8, !dbg !0
@.str = private unnamed_addr constant [19 x i8] c"Sum of errors: %g\0A\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [226 x i8] c"\0AUsage: strassen [<cilk-options>] [-n #] [-c] [-rc]\0A\0AMultiplies two randomly generated n x n matrices. To check for\0Acorrectness use -c using iterative matrix multiply or use -rc \0Ausing randomized algorithm due to Freivalds.\0A\0A\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"-n\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"-rc\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"-benchmark\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"-h\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"-r\00", align 1
@specifiers = dso_local global [7 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i8* null], align 16, !dbg !14
@opt_types = dso_local global [7 x i32] [i32 1, i32 4, i32 4, i32 6, i32 4, i32 1, i32 0], align 16, !dbg !21
@.str.8 = private unnamed_addr constant [59 x i8] c"%d: matrix size must be a power of 2 and a multiple of %d\0A\00", align 1
@.str.9 = private unnamed_addr constant [15 x i8] c"PBBS-time: %f\0A\00", align 1
@.str.10 = private unnamed_addr constant [23 x i8] c"Checking results ... \0A\00", align 1
@.str.11 = private unnamed_addr constant [15 x i8] c"WRONG RESULT!\0A\00", align 1
@.str.12 = private unnamed_addr constant [25 x i8] c"\0ACilk Example: strassen\0A\00", align 1
@.str.13 = private unnamed_addr constant [18 x i8] c"Options: n = %d\0A\0A\00", align 1

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i64 @todval(%struct.timeval* nocapture noundef readonly %tp) local_unnamed_addr #0 !dbg !30 {
entry:
  call void @llvm.dbg.value(metadata %struct.timeval* %tp, metadata !45, metadata !DIExpression()), !dbg !46
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 0, !dbg !47
  %0 = load i64, i64* %tv_sec, align 8, !dbg !47, !tbaa !48
  %mul1 = mul i64 %0, 1000000, !dbg !53
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 1, !dbg !54
  %1 = load i64, i64* %tv_usec, align 8, !dbg !54, !tbaa !55
  %add = add nsw i64 %mul1, %1, !dbg !56
  ret i64 %add, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable writeonly
define dso_local void @startup_cilk() local_unnamed_addr #2 !dbg !58 {
entry:
  %g = alloca double, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !70
  %g.0.g.0.g.0..sroa_cast = bitcast double* %g to i8*, !dbg !71
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !71
  call void @llvm.dbg.value(metadata double 2.000000e+00, metadata !62, metadata !DIExpression()), !dbg !70
  store double 2.000000e+00, double* %g, align 8, !dbg !72, !tbaa !73
  call void @llvm.dbg.value(metadata i32 0, metadata !63, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata i32 1000, metadata !65, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata i32 0, metadata !66, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata i32 1000, metadata !67, metadata !DIExpression()), !dbg !75
  br label %pfor.cond, !dbg !76

pfor.cond:                                        ; preds = %pfor.inc, %entry
  %__begin.0 = phi i32 [ 0, %entry ], [ %inc, %pfor.inc ], !dbg !75
  call void @llvm.dbg.value(metadata i32 %__begin.0, metadata !66, metadata !DIExpression()), !dbg !75
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc, !dbg !77

pfor.body.entry:                                  ; preds = %pfor.cond
  call void @llvm.dbg.value(metadata !DIArgList(i32 0, i32 %__begin.0), metadata !68, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !78
  %g.0.g.0.g.0. = load double, double* %g, align 8, !dbg !79, !tbaa !73
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !62, metadata !DIExpression()), !dbg !70
  %call = tail call double @sin(double noundef %g.0.g.0.g.0.) #21, !dbg !81
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !62, metadata !DIExpression()), !dbg !70
  %div3 = fdiv double %g.0.g.0.g.0., %call, !dbg !82
  call void @llvm.dbg.value(metadata double %div3, metadata !62, metadata !DIExpression()), !dbg !70
  store double %div3, double* %g, align 8, !dbg !82, !tbaa !73
  reattach within %syncreg, label %pfor.inc, !dbg !83

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %inc = add nuw nsw i32 %__begin.0, 1, !dbg !84
  call void @llvm.dbg.value(metadata i32 %inc, metadata !66, metadata !DIExpression()), !dbg !75
  %exitcond.not = icmp eq i32 %inc, 1000, !dbg !85
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !dbg !86, !llvm.loop !87

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %cleanup, !dbg !86

cleanup:                                          ; preds = %pfor.cond.cleanup
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !90
  ret void, !dbg !90
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare token @llvm.syncregion.start() #4

; Function Attrs: mustprogress nofree nounwind willreturn writeonly
declare dso_local double @sin(double noundef) local_unnamed_addr #5

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local i32 @cilk_rand() local_unnamed_addr #6 !dbg !91 {
entry:
  %0 = load i64, i64* @rand_nxt, align 8, !dbg !96, !tbaa !97
  %mul = mul i64 %0, 1103515245, !dbg !98
  %add = add i64 %mul, 12345, !dbg !99
  store i64 %add, i64* @rand_nxt, align 8, !dbg !100, !tbaa !97
  %shr = lshr i64 %add, 16, !dbg !101
  %1 = trunc i64 %shr to i32, !dbg !102
  %conv = and i32 %1, 2147483647, !dbg !102
  call void @llvm.dbg.value(metadata i32 %conv, metadata !95, metadata !DIExpression()), !dbg !103
  ret i32 %conv, !dbg !104
}

; Function Attrs: argmemonly nofree nosync nounwind uwtable
define dso_local void @mat_vec_mul(i32 noundef %m, i32 noundef %n, i32 noundef %rw, double* noundef %A, double* noundef %V, double* noundef %P, i32 noundef %add) local_unnamed_addr #7 !dbg !105 {
entry:
  call void @llvm.dbg.value(metadata i32 %m, metadata !109, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 %n, metadata !110, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 %rw, metadata !111, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %A, metadata !112, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %V, metadata !113, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %P, metadata !114, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 %add, metadata !115, metadata !DIExpression()), !dbg !136
  %add1129146 = add nsw i32 %n, %m, !dbg !137
  %cmp130147 = icmp slt i32 %add1129146, 65, !dbg !138
  br i1 %cmp130147, label %if.then, label %if.else39.lr.ph, !dbg !139

if.else39.lr.ph:                                  ; preds = %if.then41, %entry
  %add.tr.ph153 = phi i32 [ %add.tr134, %if.then41 ], [ %add, %entry ]
  %P.tr.ph152 = phi double* [ %add.ptr, %if.then41 ], [ %P, %entry ]
  %V.tr.ph151 = phi double* [ %V.tr133, %if.then41 ], [ %V, %entry ]
  %A.tr.ph150 = phi double* [ %arrayidx45, %if.then41 ], [ %A, %entry ]
  %n.tr.ph149 = phi i32 [ %n.tr131, %if.then41 ], [ %n, %entry ]
  %m.tr.ph148 = phi i32 [ %sub, %if.then41 ], [ %m, %entry ]
  call void @llvm.dbg.value(metadata i32 %add.tr.ph153, metadata !115, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %P.tr.ph152, metadata !114, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %V.tr.ph151, metadata !113, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %A.tr.ph150, metadata !112, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 %n.tr.ph149, metadata !110, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 %m.tr.ph148, metadata !109, metadata !DIExpression()), !dbg !136
  br label %if.else39, !dbg !139

if.then:                                          ; preds = %if.then41, %entry
  %m.tr.ph.lcssa = phi i32 [ %m, %entry ], [ %sub, %if.then41 ]
  %P.tr.ph.lcssa = phi double* [ %P, %entry ], [ %add.ptr, %if.then41 ]
  %n.tr.lcssa = phi i32 [ %n, %entry ], [ %n.tr131, %if.then41 ]
  %A.tr.lcssa = phi double* [ %A, %entry ], [ %arrayidx45, %if.then41 ]
  %V.tr.lcssa = phi double* [ %V, %entry ], [ %V.tr133, %if.then41 ]
  %add.tr.lcssa = phi i32 [ %add, %entry ], [ %add.tr134, %if.then41 ]
  %P.tr.ph.lcssa196 = bitcast double* %P.tr.ph.lcssa to i8*, !dbg !140
  %tobool.not = icmp eq i32 %add.tr.lcssa, 0, !dbg !140
  br i1 %tobool.not, label %for.cond17.preheader, label %for.cond.preheader, !dbg !141

for.cond.preheader:                               ; preds = %if.else46, %if.then
  %V.tr.lcssa224 = phi double* [ %V.tr.lcssa, %if.then ], [ %add.ptr54, %if.else46 ]
  %A.tr.lcssa223 = phi double* [ %A.tr.lcssa, %if.then ], [ %arrayidx52, %if.else46 ]
  %n.tr.lcssa222 = phi i32 [ %n.tr.lcssa, %if.then ], [ %sub48, %if.else46 ]
  %P.tr.ph.lcssa221 = phi double* [ %P.tr.ph.lcssa, %if.then ], [ %P.tr.ph152, %if.else46 ]
  %m.tr.ph.lcssa220 = phi i32 [ %m.tr.ph.lcssa, %if.then ], [ %m.tr.ph148, %if.else46 ]
  call void @llvm.dbg.value(metadata i32 0, metadata !116, metadata !DIExpression()), !dbg !142
  %cmp3164 = icmp sgt i32 %m.tr.ph.lcssa220, 0, !dbg !143
  br i1 %cmp3164, label %for.cond4.preheader.lr.ph, label %if.end56, !dbg !144

for.cond4.preheader.lr.ph:                        ; preds = %for.cond.preheader
  %cmp5160 = icmp sgt i32 %n.tr.lcssa222, 0
  br i1 %cmp5160, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader, !dbg !145

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  %wide.trip.count = zext i32 %m.tr.ph.lcssa220 to i64, !dbg !143
  %min.iters.check = icmp ult i32 %m.tr.ph.lcssa220, 4, !dbg !144
  br i1 %min.iters.check, label %for.cond4.preheader.preheader255, label %vector.ph, !dbg !144

vector.ph:                                        ; preds = %for.cond4.preheader.preheader
  %n.vec = and i64 %wide.trip.count, 4294967292, !dbg !144
  %0 = add nsw i64 %n.vec, -4, !dbg !144
  %1 = lshr exact i64 %0, 2, !dbg !144
  %2 = add nuw nsw i64 %1, 1, !dbg !144
  %xtraiter = and i64 %2, 1, !dbg !144
  %3 = icmp eq i64 %0, 0, !dbg !144
  br i1 %3, label %middle.block.unr-lcssa, label %vector.ph.new, !dbg !144

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter = and i64 %2, 9223372036854775806, !dbg !144
  br label %vector.body, !dbg !144

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.1, %vector.body ], !dbg !147
  %niter = phi i64 [ 0, %vector.ph.new ], [ %niter.next.1, %vector.body ]
  %4 = getelementptr inbounds double, double* %P.tr.ph.lcssa221, i64 %index, !dbg !147
  %5 = bitcast double* %4 to <2 x double>*, !dbg !148
  %wide.load = load <2 x double>, <2 x double>* %5, align 8, !dbg !148, !tbaa !73
  %6 = getelementptr inbounds double, double* %4, i64 2, !dbg !148
  %7 = bitcast double* %6 to <2 x double>*, !dbg !148
  %wide.load252 = load <2 x double>, <2 x double>* %7, align 8, !dbg !148, !tbaa !73
  %8 = fadd <2 x double> %wide.load, zeroinitializer, !dbg !148
  %9 = fadd <2 x double> %wide.load252, zeroinitializer, !dbg !148
  store <2 x double> %8, <2 x double>* %5, align 8, !dbg !148, !tbaa !73
  store <2 x double> %9, <2 x double>* %7, align 8, !dbg !148, !tbaa !73
  %index.next = or i64 %index, 4, !dbg !147
  %10 = getelementptr inbounds double, double* %P.tr.ph.lcssa221, i64 %index.next, !dbg !147
  %11 = bitcast double* %10 to <2 x double>*, !dbg !148
  %wide.load.1 = load <2 x double>, <2 x double>* %11, align 8, !dbg !148, !tbaa !73
  %12 = getelementptr inbounds double, double* %10, i64 2, !dbg !148
  %13 = bitcast double* %12 to <2 x double>*, !dbg !148
  %wide.load252.1 = load <2 x double>, <2 x double>* %13, align 8, !dbg !148, !tbaa !73
  %14 = fadd <2 x double> %wide.load.1, zeroinitializer, !dbg !148
  %15 = fadd <2 x double> %wide.load252.1, zeroinitializer, !dbg !148
  store <2 x double> %14, <2 x double>* %11, align 8, !dbg !148, !tbaa !73
  store <2 x double> %15, <2 x double>* %13, align 8, !dbg !148, !tbaa !73
  %index.next.1 = add nuw i64 %index, 8, !dbg !147
  %niter.next.1 = add i64 %niter, 2, !dbg !147
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !147
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa, label %vector.body, !dbg !147, !llvm.loop !149

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !147
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil, !dbg !147

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa
  %16 = getelementptr inbounds double, double* %P.tr.ph.lcssa221, i64 %index.unr, !dbg !147
  %17 = bitcast double* %16 to <2 x double>*, !dbg !148
  %wide.load.epil = load <2 x double>, <2 x double>* %17, align 8, !dbg !148, !tbaa !73
  %18 = getelementptr inbounds double, double* %16, i64 2, !dbg !148
  %19 = bitcast double* %18 to <2 x double>*, !dbg !148
  %wide.load252.epil = load <2 x double>, <2 x double>* %19, align 8, !dbg !148, !tbaa !73
  %20 = fadd <2 x double> %wide.load.epil, zeroinitializer, !dbg !148
  %21 = fadd <2 x double> %wide.load252.epil, zeroinitializer, !dbg !148
  store <2 x double> %20, <2 x double>* %17, align 8, !dbg !148, !tbaa !73
  store <2 x double> %21, <2 x double>* %19, align 8, !dbg !148, !tbaa !73
  br label %middle.block, !dbg !144

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count, !dbg !144
  br i1 %cmp.n, label %if.end56, label %for.cond4.preheader.preheader255, !dbg !144

for.cond4.preheader.preheader255:                 ; preds = %middle.block, %for.cond4.preheader.preheader
  %indvars.iv.ph = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %n.vec, %middle.block ]
  br label %for.cond4.preheader, !dbg !144

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  %22 = sext i32 %rw to i64, !dbg !144
  %wide.trip.count194 = zext i32 %m.tr.ph.lcssa220 to i64, !dbg !143
  %wide.trip.count188 = zext i32 %n.tr.lcssa222 to i64
  %23 = add nsw i64 %wide.trip.count188, -1, !dbg !144
  %xtraiter263 = and i64 %wide.trip.count188, 3
  %24 = icmp ult i64 %23, 3
  %unroll_iter266 = and i64 %wide.trip.count188, 4294967292
  %lcmp.mod264.not = icmp eq i64 %xtraiter263, 0
  br label %for.cond4.preheader.us, !dbg !144

for.cond4.preheader.us:                           ; preds = %for.cond4.for.end_crit_edge.us, %for.cond4.preheader.us.preheader
  %indvars.iv190 = phi i64 [ 0, %for.cond4.preheader.us.preheader ], [ %indvars.iv.next191, %for.cond4.for.end_crit_edge.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv190, metadata !116, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata i32 0, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !120, metadata !DIExpression()), !dbg !153
  %25 = mul nsw i64 %indvars.iv190, %22
  br i1 %24, label %for.cond4.for.end_crit_edge.us.unr-lcssa, label %for.body6.us, !dbg !145

for.body6.us:                                     ; preds = %for.body6.us, %for.cond4.preheader.us
  %indvars.iv184 = phi i64 [ %indvars.iv.next185.3, %for.body6.us ], [ 0, %for.cond4.preheader.us ]
  %c.0161.us = phi double [ %41, %for.body6.us ], [ 0.000000e+00, %for.cond4.preheader.us ]
  %niter267 = phi i64 [ %niter267.next.3, %for.body6.us ], [ 0, %for.cond4.preheader.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv184, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double %c.0161.us, metadata !120, metadata !DIExpression()), !dbg !153
  %26 = add nsw i64 %indvars.iv184, %25, !dbg !154
  %arrayidx.us = getelementptr inbounds double, double* %A.tr.lcssa223, i64 %26, !dbg !154
  %27 = load double, double* %arrayidx.us, align 8, !dbg !154, !tbaa !73
  %arrayidx9.us = getelementptr inbounds double, double* %V.tr.lcssa224, i64 %indvars.iv184, !dbg !157
  %28 = load double, double* %arrayidx9.us, align 8, !dbg !157, !tbaa !73
  %29 = tail call double @llvm.fmuladd.f64(double %27, double %28, double %c.0161.us), !dbg !158
  call void @llvm.dbg.value(metadata double %29, metadata !120, metadata !DIExpression()), !dbg !153
  %indvars.iv.next185 = or i64 %indvars.iv184, 1, !dbg !159
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next185, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next185, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double %29, metadata !120, metadata !DIExpression()), !dbg !153
  %30 = add nsw i64 %indvars.iv.next185, %25, !dbg !154
  %arrayidx.us.1 = getelementptr inbounds double, double* %A.tr.lcssa223, i64 %30, !dbg !154
  %31 = load double, double* %arrayidx.us.1, align 8, !dbg !154, !tbaa !73
  %arrayidx9.us.1 = getelementptr inbounds double, double* %V.tr.lcssa224, i64 %indvars.iv.next185, !dbg !157
  %32 = load double, double* %arrayidx9.us.1, align 8, !dbg !157, !tbaa !73
  %33 = tail call double @llvm.fmuladd.f64(double %31, double %32, double %29), !dbg !158
  call void @llvm.dbg.value(metadata double %33, metadata !120, metadata !DIExpression()), !dbg !153
  %indvars.iv.next185.1 = or i64 %indvars.iv184, 2, !dbg !159
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next185.1, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next185.1, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double %33, metadata !120, metadata !DIExpression()), !dbg !153
  %34 = add nsw i64 %indvars.iv.next185.1, %25, !dbg !154
  %arrayidx.us.2 = getelementptr inbounds double, double* %A.tr.lcssa223, i64 %34, !dbg !154
  %35 = load double, double* %arrayidx.us.2, align 8, !dbg !154, !tbaa !73
  %arrayidx9.us.2 = getelementptr inbounds double, double* %V.tr.lcssa224, i64 %indvars.iv.next185.1, !dbg !157
  %36 = load double, double* %arrayidx9.us.2, align 8, !dbg !157, !tbaa !73
  %37 = tail call double @llvm.fmuladd.f64(double %35, double %36, double %33), !dbg !158
  call void @llvm.dbg.value(metadata double %37, metadata !120, metadata !DIExpression()), !dbg !153
  %indvars.iv.next185.2 = or i64 %indvars.iv184, 3, !dbg !159
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next185.2, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next185.2, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double %37, metadata !120, metadata !DIExpression()), !dbg !153
  %38 = add nsw i64 %indvars.iv.next185.2, %25, !dbg !154
  %arrayidx.us.3 = getelementptr inbounds double, double* %A.tr.lcssa223, i64 %38, !dbg !154
  %39 = load double, double* %arrayidx.us.3, align 8, !dbg !154, !tbaa !73
  %arrayidx9.us.3 = getelementptr inbounds double, double* %V.tr.lcssa224, i64 %indvars.iv.next185.2, !dbg !157
  %40 = load double, double* %arrayidx9.us.3, align 8, !dbg !157, !tbaa !73
  %41 = tail call double @llvm.fmuladd.f64(double %39, double %40, double %37), !dbg !158
  call void @llvm.dbg.value(metadata double %41, metadata !120, metadata !DIExpression()), !dbg !153
  %indvars.iv.next185.3 = add nuw nsw i64 %indvars.iv184, 4, !dbg !159
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next185.3, metadata !119, metadata !DIExpression()), !dbg !142
  %niter267.next.3 = add i64 %niter267, 4, !dbg !145
  %niter267.ncmp.3 = icmp eq i64 %niter267.next.3, %unroll_iter266, !dbg !145
  br i1 %niter267.ncmp.3, label %for.cond4.for.end_crit_edge.us.unr-lcssa, label %for.body6.us, !dbg !145, !llvm.loop !160

for.cond4.for.end_crit_edge.us.unr-lcssa:         ; preds = %for.body6.us, %for.cond4.preheader.us
  %.lcssa254.ph = phi double [ undef, %for.cond4.preheader.us ], [ %41, %for.body6.us ]
  %indvars.iv184.unr = phi i64 [ 0, %for.cond4.preheader.us ], [ %indvars.iv.next185.3, %for.body6.us ]
  %c.0161.us.unr = phi double [ 0.000000e+00, %for.cond4.preheader.us ], [ %41, %for.body6.us ]
  br i1 %lcmp.mod264.not, label %for.cond4.for.end_crit_edge.us, label %for.body6.us.epil, !dbg !145

for.body6.us.epil:                                ; preds = %for.body6.us.epil, %for.cond4.for.end_crit_edge.us.unr-lcssa
  %indvars.iv184.epil = phi i64 [ %indvars.iv.next185.epil, %for.body6.us.epil ], [ %indvars.iv184.unr, %for.cond4.for.end_crit_edge.us.unr-lcssa ]
  %c.0161.us.epil = phi double [ %45, %for.body6.us.epil ], [ %c.0161.us.unr, %for.cond4.for.end_crit_edge.us.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.body6.us.epil ], [ 0, %for.cond4.for.end_crit_edge.us.unr-lcssa ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv184.epil, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double %c.0161.us.epil, metadata !120, metadata !DIExpression()), !dbg !153
  %42 = add nsw i64 %indvars.iv184.epil, %25, !dbg !154
  %arrayidx.us.epil = getelementptr inbounds double, double* %A.tr.lcssa223, i64 %42, !dbg !154
  %43 = load double, double* %arrayidx.us.epil, align 8, !dbg !154, !tbaa !73
  %arrayidx9.us.epil = getelementptr inbounds double, double* %V.tr.lcssa224, i64 %indvars.iv184.epil, !dbg !157
  %44 = load double, double* %arrayidx9.us.epil, align 8, !dbg !157, !tbaa !73
  %45 = tail call double @llvm.fmuladd.f64(double %43, double %44, double %c.0161.us.epil), !dbg !158
  call void @llvm.dbg.value(metadata double %45, metadata !120, metadata !DIExpression()), !dbg !153
  %indvars.iv.next185.epil = add nuw nsw i64 %indvars.iv184.epil, 1, !dbg !159
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next185.epil, metadata !119, metadata !DIExpression()), !dbg !142
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !145
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter263, !dbg !145
  br i1 %epil.iter.cmp.not, label %for.cond4.for.end_crit_edge.us, label %for.body6.us.epil, !dbg !145, !llvm.loop !162

for.cond4.for.end_crit_edge.us:                   ; preds = %for.body6.us.epil, %for.cond4.for.end_crit_edge.us.unr-lcssa
  %.lcssa254 = phi double [ %.lcssa254.ph, %for.cond4.for.end_crit_edge.us.unr-lcssa ], [ %45, %for.body6.us.epil ], !dbg !158
  %arrayidx12.us = getelementptr inbounds double, double* %P.tr.ph.lcssa221, i64 %indvars.iv190, !dbg !164
  %46 = load double, double* %arrayidx12.us, align 8, !dbg !148, !tbaa !73
  %add13.us = fadd double %.lcssa254, %46, !dbg !148
  store double %add13.us, double* %arrayidx12.us, align 8, !dbg !148, !tbaa !73
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1, !dbg !147
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next191, metadata !116, metadata !DIExpression()), !dbg !142
  %exitcond195.not = icmp eq i64 %indvars.iv.next191, %wide.trip.count194, !dbg !143
  br i1 %exitcond195.not, label %if.end56, label %for.cond4.preheader.us, !dbg !144, !llvm.loop !165

for.cond17.preheader:                             ; preds = %if.then
  call void @llvm.dbg.value(metadata i32 0, metadata !116, metadata !DIExpression()), !dbg !142
  %cmp18170 = icmp sgt i32 %m.tr.ph.lcssa, 0, !dbg !166
  br i1 %cmp18170, label %for.cond21.preheader.lr.ph, label %if.end56, !dbg !167

for.cond21.preheader.lr.ph:                       ; preds = %for.cond17.preheader
  %cmp22166 = icmp sgt i32 %n.tr.lcssa, 0
  br i1 %cmp22166, label %for.cond21.preheader.us.preheader, label %for.cond21.preheader.preheader, !dbg !168

for.cond21.preheader.preheader:                   ; preds = %for.cond21.preheader.lr.ph
  %47 = zext i32 %m.tr.ph.lcssa to i64, !dbg !167
  %48 = shl nuw nsw i64 %47, 3, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 8 %P.tr.ph.lcssa196, i8 0, i64 %48, i1 false), !dbg !170, !tbaa !73
  call void @llvm.dbg.value(metadata i32 undef, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata i32 undef, metadata !126, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i32 undef, metadata !116, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !142
  br label %if.end56, !dbg !172

for.cond21.preheader.us.preheader:                ; preds = %for.cond21.preheader.lr.ph
  %49 = sext i32 %rw to i64, !dbg !167
  %wide.trip.count210 = zext i32 %m.tr.ph.lcssa to i64, !dbg !166
  %wide.trip.count204 = zext i32 %n.tr.lcssa to i64
  %50 = add nsw i64 %wide.trip.count204, -1, !dbg !167
  %xtraiter268 = and i64 %wide.trip.count204, 3
  %51 = icmp ult i64 %50, 3
  %unroll_iter272 = and i64 %wide.trip.count204, 4294967292
  %lcmp.mod270.not = icmp eq i64 %xtraiter268, 0
  br label %for.cond21.preheader.us, !dbg !167

for.cond21.preheader.us:                          ; preds = %for.cond21.for.end33_crit_edge.us, %for.cond21.preheader.us.preheader
  %indvars.iv206 = phi i64 [ 0, %for.cond21.preheader.us.preheader ], [ %indvars.iv.next207, %for.cond21.for.end33_crit_edge.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv206, metadata !116, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata i32 0, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !126, metadata !DIExpression()), !dbg !171
  %52 = mul nsw i64 %indvars.iv206, %49
  br i1 %51, label %for.cond21.for.end33_crit_edge.us.unr-lcssa, label %for.body23.us, !dbg !168

for.body23.us:                                    ; preds = %for.body23.us, %for.cond21.preheader.us
  %indvars.iv200 = phi i64 [ %indvars.iv.next201.3, %for.body23.us ], [ 0, %for.cond21.preheader.us ]
  %c20.0167.us = phi double [ %68, %for.body23.us ], [ 0.000000e+00, %for.cond21.preheader.us ]
  %niter273 = phi i64 [ %niter273.next.3, %for.body23.us ], [ 0, %for.cond21.preheader.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv200, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double %c20.0167.us, metadata !126, metadata !DIExpression()), !dbg !171
  %53 = add nsw i64 %indvars.iv200, %52, !dbg !173
  %arrayidx27.us = getelementptr inbounds double, double* %A.tr.lcssa, i64 %53, !dbg !173
  %54 = load double, double* %arrayidx27.us, align 8, !dbg !173, !tbaa !73
  %arrayidx29.us = getelementptr inbounds double, double* %V.tr.lcssa, i64 %indvars.iv200, !dbg !176
  %55 = load double, double* %arrayidx29.us, align 8, !dbg !176, !tbaa !73
  %56 = tail call double @llvm.fmuladd.f64(double %54, double %55, double %c20.0167.us), !dbg !177
  call void @llvm.dbg.value(metadata double %56, metadata !126, metadata !DIExpression()), !dbg !171
  %indvars.iv.next201 = or i64 %indvars.iv200, 1, !dbg !178
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next201, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next201, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double %56, metadata !126, metadata !DIExpression()), !dbg !171
  %57 = add nsw i64 %indvars.iv.next201, %52, !dbg !173
  %arrayidx27.us.1 = getelementptr inbounds double, double* %A.tr.lcssa, i64 %57, !dbg !173
  %58 = load double, double* %arrayidx27.us.1, align 8, !dbg !173, !tbaa !73
  %arrayidx29.us.1 = getelementptr inbounds double, double* %V.tr.lcssa, i64 %indvars.iv.next201, !dbg !176
  %59 = load double, double* %arrayidx29.us.1, align 8, !dbg !176, !tbaa !73
  %60 = tail call double @llvm.fmuladd.f64(double %58, double %59, double %56), !dbg !177
  call void @llvm.dbg.value(metadata double %60, metadata !126, metadata !DIExpression()), !dbg !171
  %indvars.iv.next201.1 = or i64 %indvars.iv200, 2, !dbg !178
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next201.1, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next201.1, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double %60, metadata !126, metadata !DIExpression()), !dbg !171
  %61 = add nsw i64 %indvars.iv.next201.1, %52, !dbg !173
  %arrayidx27.us.2 = getelementptr inbounds double, double* %A.tr.lcssa, i64 %61, !dbg !173
  %62 = load double, double* %arrayidx27.us.2, align 8, !dbg !173, !tbaa !73
  %arrayidx29.us.2 = getelementptr inbounds double, double* %V.tr.lcssa, i64 %indvars.iv.next201.1, !dbg !176
  %63 = load double, double* %arrayidx29.us.2, align 8, !dbg !176, !tbaa !73
  %64 = tail call double @llvm.fmuladd.f64(double %62, double %63, double %60), !dbg !177
  call void @llvm.dbg.value(metadata double %64, metadata !126, metadata !DIExpression()), !dbg !171
  %indvars.iv.next201.2 = or i64 %indvars.iv200, 3, !dbg !178
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next201.2, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next201.2, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double %64, metadata !126, metadata !DIExpression()), !dbg !171
  %65 = add nsw i64 %indvars.iv.next201.2, %52, !dbg !173
  %arrayidx27.us.3 = getelementptr inbounds double, double* %A.tr.lcssa, i64 %65, !dbg !173
  %66 = load double, double* %arrayidx27.us.3, align 8, !dbg !173, !tbaa !73
  %arrayidx29.us.3 = getelementptr inbounds double, double* %V.tr.lcssa, i64 %indvars.iv.next201.2, !dbg !176
  %67 = load double, double* %arrayidx29.us.3, align 8, !dbg !176, !tbaa !73
  %68 = tail call double @llvm.fmuladd.f64(double %66, double %67, double %64), !dbg !177
  call void @llvm.dbg.value(metadata double %68, metadata !126, metadata !DIExpression()), !dbg !171
  %indvars.iv.next201.3 = add nuw nsw i64 %indvars.iv200, 4, !dbg !178
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next201.3, metadata !119, metadata !DIExpression()), !dbg !142
  %niter273.next.3 = add i64 %niter273, 4, !dbg !168
  %niter273.ncmp.3 = icmp eq i64 %niter273.next.3, %unroll_iter272, !dbg !168
  br i1 %niter273.ncmp.3, label %for.cond21.for.end33_crit_edge.us.unr-lcssa, label %for.body23.us, !dbg !168, !llvm.loop !179

for.cond21.for.end33_crit_edge.us.unr-lcssa:      ; preds = %for.body23.us, %for.cond21.preheader.us
  %.lcssa.ph = phi double [ undef, %for.cond21.preheader.us ], [ %68, %for.body23.us ]
  %indvars.iv200.unr = phi i64 [ 0, %for.cond21.preheader.us ], [ %indvars.iv.next201.3, %for.body23.us ]
  %c20.0167.us.unr = phi double [ 0.000000e+00, %for.cond21.preheader.us ], [ %68, %for.body23.us ]
  br i1 %lcmp.mod270.not, label %for.cond21.for.end33_crit_edge.us, label %for.body23.us.epil, !dbg !168

for.body23.us.epil:                               ; preds = %for.body23.us.epil, %for.cond21.for.end33_crit_edge.us.unr-lcssa
  %indvars.iv200.epil = phi i64 [ %indvars.iv.next201.epil, %for.body23.us.epil ], [ %indvars.iv200.unr, %for.cond21.for.end33_crit_edge.us.unr-lcssa ]
  %c20.0167.us.epil = phi double [ %72, %for.body23.us.epil ], [ %c20.0167.us.unr, %for.cond21.for.end33_crit_edge.us.unr-lcssa ]
  %epil.iter269 = phi i64 [ %epil.iter269.next, %for.body23.us.epil ], [ 0, %for.cond21.for.end33_crit_edge.us.unr-lcssa ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv200.epil, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double %c20.0167.us.epil, metadata !126, metadata !DIExpression()), !dbg !171
  %69 = add nsw i64 %indvars.iv200.epil, %52, !dbg !173
  %arrayidx27.us.epil = getelementptr inbounds double, double* %A.tr.lcssa, i64 %69, !dbg !173
  %70 = load double, double* %arrayidx27.us.epil, align 8, !dbg !173, !tbaa !73
  %arrayidx29.us.epil = getelementptr inbounds double, double* %V.tr.lcssa, i64 %indvars.iv200.epil, !dbg !176
  %71 = load double, double* %arrayidx29.us.epil, align 8, !dbg !176, !tbaa !73
  %72 = tail call double @llvm.fmuladd.f64(double %70, double %71, double %c20.0167.us.epil), !dbg !177
  call void @llvm.dbg.value(metadata double %72, metadata !126, metadata !DIExpression()), !dbg !171
  %indvars.iv.next201.epil = add nuw nsw i64 %indvars.iv200.epil, 1, !dbg !178
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next201.epil, metadata !119, metadata !DIExpression()), !dbg !142
  %epil.iter269.next = add i64 %epil.iter269, 1, !dbg !168
  %epil.iter269.cmp.not = icmp eq i64 %epil.iter269.next, %xtraiter268, !dbg !168
  br i1 %epil.iter269.cmp.not, label %for.cond21.for.end33_crit_edge.us, label %for.body23.us.epil, !dbg !168, !llvm.loop !181

for.cond21.for.end33_crit_edge.us:                ; preds = %for.body23.us.epil, %for.cond21.for.end33_crit_edge.us.unr-lcssa
  %.lcssa = phi double [ %.lcssa.ph, %for.cond21.for.end33_crit_edge.us.unr-lcssa ], [ %72, %for.body23.us.epil ], !dbg !177
  %arrayidx35.us = getelementptr inbounds double, double* %P.tr.ph.lcssa, i64 %indvars.iv206, !dbg !182
  store double %.lcssa, double* %arrayidx35.us, align 8, !dbg !170, !tbaa !73
  %indvars.iv.next207 = add nuw nsw i64 %indvars.iv206, 1, !dbg !183
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next207, metadata !116, metadata !DIExpression()), !dbg !142
  %exitcond211.not = icmp eq i64 %indvars.iv.next207, %wide.trip.count210, !dbg !166
  br i1 %exitcond211.not, label %if.end56, label %for.cond21.preheader.us, !dbg !167, !llvm.loop !184

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond4.preheader.preheader255
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond4.preheader ], [ %indvars.iv.ph, %for.cond4.preheader.preheader255 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !116, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata i32 0, metadata !119, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !120, metadata !DIExpression()), !dbg !153
  %arrayidx12 = getelementptr inbounds double, double* %P.tr.ph.lcssa221, i64 %indvars.iv, !dbg !164
  %73 = load double, double* %arrayidx12, align 8, !dbg !148, !tbaa !73
  %add13 = fadd double %73, 0.000000e+00, !dbg !148
  store double %add13, double* %arrayidx12, align 8, !dbg !148, !tbaa !73
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !147
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !116, metadata !DIExpression()), !dbg !142
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !143
  br i1 %exitcond.not, label %if.end56, label %for.cond4.preheader, !dbg !144, !llvm.loop !186

if.else39:                                        ; preds = %if.else46, %if.else39.lr.ph
  %add.tr134 = phi i32 [ %add.tr.ph153, %if.else39.lr.ph ], [ 1, %if.else46 ]
  %V.tr133 = phi double* [ %V.tr.ph151, %if.else39.lr.ph ], [ %add.ptr54, %if.else46 ]
  %A.tr132 = phi double* [ %A.tr.ph150, %if.else39.lr.ph ], [ %arrayidx52, %if.else46 ]
  %n.tr131 = phi i32 [ %n.tr.ph149, %if.else39.lr.ph ], [ %sub48, %if.else46 ]
  call void @llvm.dbg.value(metadata i32 %add.tr134, metadata !115, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %V.tr133, metadata !113, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %A.tr132, metadata !112, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 %n.tr131, metadata !110, metadata !DIExpression()), !dbg !136
  %cmp40.not = icmp slt i32 %m.tr.ph148, %n.tr131, !dbg !188
  br i1 %cmp40.not, label %if.else46, label %if.then41, !dbg !189

if.then41:                                        ; preds = %if.else39
  %shr = ashr i32 %m.tr.ph148, 1, !dbg !190
  call void @llvm.dbg.value(metadata i32 %shr, metadata !131, metadata !DIExpression()), !dbg !191
  tail call void @mat_vec_mul(i32 noundef %shr, i32 noundef %n.tr131, i32 noundef %rw, double* noundef %A.tr132, double* noundef %V.tr133, double* noundef %P.tr.ph152, i32 noundef %add.tr134), !dbg !192
  %sub = sub nsw i32 %m.tr.ph148, %shr, !dbg !193
  %mul42 = mul nsw i32 %shr, %rw, !dbg !194
  %idxprom44 = sext i32 %mul42 to i64, !dbg !194
  %arrayidx45 = getelementptr inbounds double, double* %A.tr132, i64 %idxprom44, !dbg !194
  %idx.ext = sext i32 %shr to i64, !dbg !195
  %add.ptr = getelementptr inbounds double, double* %P.tr.ph152, i64 %idx.ext, !dbg !195
  call void @llvm.dbg.value(metadata i32 %sub, metadata !109, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 %n.tr131, metadata !110, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 %rw, metadata !111, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %arrayidx45, metadata !112, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %V.tr133, metadata !113, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %add.ptr, metadata !114, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 %add.tr134, metadata !115, metadata !DIExpression()), !dbg !136
  %add1129 = add nsw i32 %n.tr131, %sub, !dbg !137
  %cmp130 = icmp slt i32 %add1129, 65, !dbg !138
  br i1 %cmp130, label %if.then, label %if.else39.lr.ph, !dbg !139

if.else46:                                        ; preds = %if.else39
  %shr47 = ashr i32 %n.tr131, 1, !dbg !196
  call void @llvm.dbg.value(metadata i32 %shr47, metadata !134, metadata !DIExpression()), !dbg !197
  tail call void @mat_vec_mul(i32 noundef %m.tr.ph148, i32 noundef %shr47, i32 noundef %rw, double* noundef %A.tr132, double* noundef %V.tr133, double* noundef %P.tr.ph152, i32 noundef %add.tr134), !dbg !198
  %sub48 = sub nsw i32 %n.tr131, %shr47, !dbg !199
  %idxprom51 = sext i32 %shr47 to i64, !dbg !200
  %arrayidx52 = getelementptr inbounds double, double* %A.tr132, i64 %idxprom51, !dbg !200
  %add.ptr54 = getelementptr inbounds double, double* %V.tr133, i64 %idxprom51, !dbg !201
  call void @llvm.dbg.value(metadata i32 %m.tr.ph148, metadata !109, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 %sub48, metadata !110, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 %rw, metadata !111, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %arrayidx52, metadata !112, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %add.ptr54, metadata !113, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %P.tr.ph152, metadata !114, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata i32 1, metadata !115, metadata !DIExpression()), !dbg !136
  %add1 = add nsw i32 %sub48, %m.tr.ph148, !dbg !137
  %cmp = icmp slt i32 %add1, 65, !dbg !138
  br i1 %cmp, label %for.cond.preheader, label %if.else39, !dbg !139

if.end56:                                         ; preds = %for.cond4.preheader, %for.cond21.for.end33_crit_edge.us, %for.cond21.preheader.preheader, %for.cond17.preheader, %for.cond4.for.end_crit_edge.us, %middle.block, %for.cond.preheader
  ret void, !dbg !172
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: argmemonly nofree nosync nounwind uwtable
define dso_local void @matrixmul(i32 noundef %n, double* nocapture noundef readonly %A, i32 noundef %an, double* nocapture noundef readonly %B, i32 noundef %bn, double* nocapture noundef writeonly %C, i32 noundef %cn) local_unnamed_addr #7 !dbg !202 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !206, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata double* %A, metadata !207, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 %an, metadata !208, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata double* %B, metadata !209, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 %bn, metadata !210, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata double* %C, metadata !211, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 %cn, metadata !212, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 0, metadata !213, metadata !DIExpression()), !dbg !217
  %cmp44 = icmp sgt i32 %n, 0, !dbg !218
  br i1 %cmp44, label %for.cond1.preheader.us.us.preheader, label %for.end21, !dbg !221

for.cond1.preheader.us.us.preheader:              ; preds = %entry
  %0 = sext i32 %bn to i64, !dbg !221
  %1 = sext i32 %an to i64, !dbg !221
  %2 = sext i32 %cn to i64, !dbg !221
  %wide.trip.count71 = zext i32 %n to i64, !dbg !218
  %xtraiter = and i64 %wide.trip.count71, 1
  %3 = icmp eq i32 %n, 1
  %unroll_iter = and i64 %wide.trip.count71, 4294967294
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for.cond1.preheader.us.us, !dbg !221

for.cond1.preheader.us.us:                        ; preds = %for.cond1.for.inc19_crit_edge.split.us.us.us, %for.cond1.preheader.us.us.preheader
  %indvars.iv66 = phi i64 [ 0, %for.cond1.preheader.us.us.preheader ], [ %indvars.iv.next67, %for.cond1.for.inc19_crit_edge.split.us.us.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv66, metadata !213, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 0, metadata !214, metadata !DIExpression()), !dbg !217
  %4 = mul nsw i64 %indvars.iv66, %1
  %5 = mul nsw i64 %indvars.iv66, %2
  br label %for.cond4.preheader.us.us.us, !dbg !222

for.cond4.preheader.us.us.us:                     ; preds = %for.cond4.for.end_crit_edge.us.us.us, %for.cond1.preheader.us.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond4.for.end_crit_edge.us.us.us ], [ 0, %for.cond1.preheader.us.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv60, metadata !214, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i32 0, metadata !215, metadata !DIExpression()), !dbg !217
  br i1 %3, label %for.cond4.for.end_crit_edge.us.us.us.unr-lcssa, label %for.body6.us.us.us, !dbg !224

for.body6.us.us.us:                               ; preds = %for.body6.us.us.us, %for.cond4.preheader.us.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.us.us.us ], [ 0, %for.cond4.preheader.us.us.us ]
  %s.040.us.us.us = phi double [ %17, %for.body6.us.us.us ], [ 0.000000e+00, %for.cond4.preheader.us.us.us ]
  %niter = phi i64 [ %niter.next.1, %for.body6.us.us.us ], [ 0, %for.cond4.preheader.us.us.us ]
  call void @llvm.dbg.value(metadata double %s.040.us.us.us, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !215, metadata !DIExpression()), !dbg !217
  %6 = add nsw i64 %indvars.iv, %4, !dbg !228
  %arrayidx.us.us.us = getelementptr inbounds double, double* %A, i64 %6, !dbg !228
  %7 = load double, double* %arrayidx.us.us.us, align 8, !dbg !228, !tbaa !73
  %8 = mul nsw i64 %indvars.iv, %0, !dbg !230
  %9 = add nsw i64 %8, %indvars.iv60, !dbg !230
  %arrayidx10.us.us.us = getelementptr inbounds double, double* %B, i64 %9, !dbg !230
  %10 = load double, double* %arrayidx10.us.us.us, align 8, !dbg !230, !tbaa !73
  %11 = tail call double @llvm.fmuladd.f64(double %7, double %10, double %s.040.us.us.us), !dbg !231
  call void @llvm.dbg.value(metadata double %11, metadata !216, metadata !DIExpression()), !dbg !217
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !232
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !215, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata double %11, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !215, metadata !DIExpression()), !dbg !217
  %12 = add nsw i64 %indvars.iv.next, %4, !dbg !228
  %arrayidx.us.us.us.1 = getelementptr inbounds double, double* %A, i64 %12, !dbg !228
  %13 = load double, double* %arrayidx.us.us.us.1, align 8, !dbg !228, !tbaa !73
  %14 = mul nsw i64 %indvars.iv.next, %0, !dbg !230
  %15 = add nsw i64 %14, %indvars.iv60, !dbg !230
  %arrayidx10.us.us.us.1 = getelementptr inbounds double, double* %B, i64 %15, !dbg !230
  %16 = load double, double* %arrayidx10.us.us.us.1, align 8, !dbg !230, !tbaa !73
  %17 = tail call double @llvm.fmuladd.f64(double %13, double %16, double %11), !dbg !231
  call void @llvm.dbg.value(metadata double %17, metadata !216, metadata !DIExpression()), !dbg !217
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !232
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1, metadata !215, metadata !DIExpression()), !dbg !217
  %niter.next.1 = add i64 %niter, 2, !dbg !224
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !224
  br i1 %niter.ncmp.1, label %for.cond4.for.end_crit_edge.us.us.us.unr-lcssa, label %for.body6.us.us.us, !dbg !224, !llvm.loop !233

for.cond4.for.end_crit_edge.us.us.us.unr-lcssa:   ; preds = %for.body6.us.us.us, %for.cond4.preheader.us.us.us
  %.lcssa.ph = phi double [ undef, %for.cond4.preheader.us.us.us ], [ %17, %for.body6.us.us.us ]
  %indvars.iv.unr = phi i64 [ 0, %for.cond4.preheader.us.us.us ], [ %indvars.iv.next.1, %for.body6.us.us.us ]
  %s.040.us.us.us.unr = phi double [ 0.000000e+00, %for.cond4.preheader.us.us.us ], [ %17, %for.body6.us.us.us ]
  br i1 %lcmp.mod.not, label %for.cond4.for.end_crit_edge.us.us.us, label %for.body6.us.us.us.epil, !dbg !224

for.body6.us.us.us.epil:                          ; preds = %for.cond4.for.end_crit_edge.us.us.us.unr-lcssa
  call void @llvm.dbg.value(metadata double %s.040.us.us.us.unr, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !215, metadata !DIExpression()), !dbg !217
  %18 = add nsw i64 %indvars.iv.unr, %4, !dbg !228
  %arrayidx.us.us.us.epil = getelementptr inbounds double, double* %A, i64 %18, !dbg !228
  %19 = load double, double* %arrayidx.us.us.us.epil, align 8, !dbg !228, !tbaa !73
  %20 = mul nsw i64 %indvars.iv.unr, %0, !dbg !230
  %21 = add nsw i64 %20, %indvars.iv60, !dbg !230
  %arrayidx10.us.us.us.epil = getelementptr inbounds double, double* %B, i64 %21, !dbg !230
  %22 = load double, double* %arrayidx10.us.us.us.epil, align 8, !dbg !230, !tbaa !73
  %23 = tail call double @llvm.fmuladd.f64(double %19, double %22, double %s.040.us.us.us.unr), !dbg !231
  call void @llvm.dbg.value(metadata double %23, metadata !216, metadata !DIExpression()), !dbg !217
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !215, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !217
  br label %for.cond4.for.end_crit_edge.us.us.us, !dbg !235

for.cond4.for.end_crit_edge.us.us.us:             ; preds = %for.body6.us.us.us.epil, %for.cond4.for.end_crit_edge.us.us.us.unr-lcssa
  %.lcssa = phi double [ %.lcssa.ph, %for.cond4.for.end_crit_edge.us.us.us.unr-lcssa ], [ %23, %for.body6.us.us.us.epil ], !dbg !231
  %24 = add nsw i64 %indvars.iv60, %5, !dbg !235
  %arrayidx15.us.us.us = getelementptr inbounds double, double* %C, i64 %24, !dbg !235
  store double %.lcssa, double* %arrayidx15.us.us.us, align 8, !dbg !236, !tbaa !73
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1, !dbg !237
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next61, metadata !214, metadata !DIExpression()), !dbg !217
  %exitcond65.not = icmp eq i64 %indvars.iv.next61, %wide.trip.count71, !dbg !238
  br i1 %exitcond65.not, label %for.cond1.for.inc19_crit_edge.split.us.us.us, label %for.cond4.preheader.us.us.us, !dbg !222, !llvm.loop !239

for.cond1.for.inc19_crit_edge.split.us.us.us:     ; preds = %for.cond4.for.end_crit_edge.us.us.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1, !dbg !241
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next67, metadata !213, metadata !DIExpression()), !dbg !217
  %exitcond72.not = icmp eq i64 %indvars.iv.next67, %wide.trip.count71, !dbg !218
  br i1 %exitcond72.not, label %for.end21, label %for.cond1.preheader.us.us, !dbg !221, !llvm.loop !242

for.end21:                                        ; preds = %for.cond1.for.inc19_crit_edge.split.us.us.us, %entry
  ret void, !dbg !244
}

; Function Attrs: nofree nosync nounwind uwtable
define dso_local void @FastNaiveMatrixMultiply(double* noundef %C, double* noundef %A, double* noundef %B, i32 noundef %MatrixSize, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB) local_unnamed_addr #8 !dbg !245 {
entry:
  call void @llvm.dbg.value(metadata double* %C, metadata !249, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata double* %A, metadata !250, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata double* %B, metadata !251, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i32 %MatrixSize, metadata !252, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i32 %RowWidthC, metadata !253, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i32 %RowWidthA, metadata !254, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i32 %RowWidthB, metadata !255, metadata !DIExpression()), !dbg !284
  %shl = shl i32 %RowWidthB, 3, !dbg !285
  %conv = zext i32 %shl to i64, !dbg !286
  call void @llvm.dbg.value(metadata i64 %conv, metadata !256, metadata !DIExpression()), !dbg !284
  %shl1 = shl i32 %RowWidthA, 3, !dbg !287
  %conv2 = zext i32 %shl1 to i64, !dbg !288
  call void @llvm.dbg.value(metadata i64 %conv2, metadata !257, metadata !DIExpression()), !dbg !284
  %shl3 = shl i32 %MatrixSize, 3, !dbg !289
  %conv4 = zext i32 %shl3 to i64, !dbg !290
  call void @llvm.dbg.value(metadata i64 %conv4, metadata !258, metadata !DIExpression()), !dbg !284
  %sub = sub i32 %RowWidthC, %MatrixSize, !dbg !291
  %shl5 = shl i32 %sub, 3, !dbg !292
  %conv6 = zext i32 %shl5 to i64, !dbg !293
  call void @llvm.dbg.value(metadata i64 %conv6, metadata !259, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata double* %A, metadata !262, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i32 0, metadata !261, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata double* %C, metadata !249, metadata !DIExpression()), !dbg !284
  switch i32 %MatrixSize, label %for.cond8.preheader.us.preheader [
    i32 0, label %for.end62
    i32 1, label %for.end62.loopexit
  ], !dbg !294

for.cond8.preheader.us.preheader:                 ; preds = %entry
  %0 = zext i32 %MatrixSize to i64, !dbg !294
  br label %for.cond8.preheader.us, !dbg !294

for.cond8.preheader.us:                           ; preds = %for.cond8.for.end57_crit_edge.split.us.us, %for.cond8.preheader.us.preheader
  %C.addr.0171.us = phi double* [ %45, %for.cond8.for.end57_crit_edge.split.us.us ], [ %C, %for.cond8.preheader.us.preheader ]
  %ARowStart.0170.us = phi double* [ %43, %for.cond8.for.end57_crit_edge.split.us.us ], [ %A, %for.cond8.preheader.us.preheader ]
  %Vertical.0169.us = phi i32 [ %inc61.us, %for.cond8.for.end57_crit_edge.split.us.us ], [ 0, %for.cond8.preheader.us.preheader ]
  call void @llvm.dbg.value(metadata double* %C.addr.0171.us, metadata !249, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata double* %ARowStart.0170.us, metadata !262, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i32 %Vertical.0169.us, metadata !261, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata double* %C.addr.0171.us, metadata !249, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i32 0, metadata !260, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata double* %ARowStart.0170.us, metadata !262, metadata !DIExpression()), !dbg !284
  br label %for.body11.us.us, !dbg !295

for.body11.us.us:                                 ; preds = %for.cond26.for.end_crit_edge.us.us, %for.cond8.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond26.for.end_crit_edge.us.us ], [ 0, %for.cond8.preheader.us ]
  %C.addr.1164.us.us = phi double* [ %add.ptr54.us.us, %for.cond26.for.end_crit_edge.us.us ], [ %C.addr.0171.us, %for.cond8.preheader.us ]
  %ARowStart.1162.us.us = phi double* [ %38, %for.cond26.for.end_crit_edge.us.us ], [ %ARowStart.0170.us, %for.cond8.preheader.us ]
  call void @llvm.dbg.value(metadata double* %C.addr.1164.us.us, metadata !249, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !260, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata double* %ARowStart.1162.us.us, metadata !262, metadata !DIExpression()), !dbg !284
  %add.ptr.us.us = getelementptr inbounds double, double* %B, i64 %indvars.iv, !dbg !296
  call void @llvm.dbg.value(metadata double* %add.ptr.us.us, metadata !263, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double* %ARowStart.1162.us.us, metadata !262, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)), !dbg !284
  %1 = load double, double* %ARowStart.1162.us.us, align 8, !dbg !298, !tbaa !73
  call void @llvm.dbg.value(metadata double %1, metadata !270, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !271, metadata !DIExpression()), !dbg !297
  %2 = bitcast double* %add.ptr.us.us to <2 x double>*, !dbg !299
  %3 = load <2 x double>, <2 x double>* %2, align 8, !dbg !299, !tbaa !73
  %4 = insertelement <2 x double> poison, double %1, i64 0, !dbg !300
  %5 = shufflevector <2 x double> %4, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !300
  %6 = fmul <2 x double> %5, %3, !dbg !300
  call void @llvm.dbg.value(metadata double undef, metadata !272, metadata !DIExpression()), !dbg !297
  %add.ptr14.us.us = getelementptr inbounds double, double* %add.ptr.us.us, i64 2, !dbg !301
  call void @llvm.dbg.value(metadata double undef, metadata !273, metadata !DIExpression()), !dbg !297
  %7 = bitcast double* %add.ptr14.us.us to <2 x double>*, !dbg !302
  %8 = load <2 x double>, <2 x double>* %7, align 8, !dbg !302, !tbaa !73
  %9 = fmul <2 x double> %5, %8, !dbg !303
  call void @llvm.dbg.value(metadata double undef, metadata !274, metadata !DIExpression()), !dbg !297
  %add.ptr18.us.us = getelementptr inbounds double, double* %add.ptr.us.us, i64 4, !dbg !304
  call void @llvm.dbg.value(metadata double undef, metadata !275, metadata !DIExpression()), !dbg !297
  %10 = bitcast double* %add.ptr18.us.us to <2 x double>*, !dbg !305
  %11 = load <2 x double>, <2 x double>* %10, align 8, !dbg !305, !tbaa !73
  %12 = fmul <2 x double> %5, %11, !dbg !306
  call void @llvm.dbg.value(metadata double undef, metadata !276, metadata !DIExpression()), !dbg !297
  %add.ptr22.us.us = getelementptr inbounds double, double* %add.ptr.us.us, i64 6, !dbg !307
  call void @llvm.dbg.value(metadata double undef, metadata !277, metadata !DIExpression()), !dbg !297
  %13 = bitcast double* %add.ptr22.us.us to <2 x double>*, !dbg !308
  %14 = load <2 x double>, <2 x double>* %13, align 8, !dbg !308, !tbaa !73
  %15 = fmul <2 x double> %5, %14, !dbg !309
  call void @llvm.dbg.value(metadata double undef, metadata !278, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata i32 1, metadata !279, metadata !DIExpression()), !dbg !297
  %ARowStart.2140.us.us = getelementptr inbounds double, double* %ARowStart.1162.us.us, i64 1, !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !277, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !276, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !275, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !274, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !273, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !272, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !271, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double* %add.ptr.us.us, metadata !263, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double* %ARowStart.2140.us.us, metadata !262, metadata !DIExpression()), !dbg !284
  br label %for.body29.us.us, !dbg !310

for.body29.us.us:                                 ; preds = %for.body29.us.us, %for.body11.us.us
  %ARowStart.2152.us.us = phi double* [ %ARowStart.2140.us.us, %for.body11.us.us ], [ %ARowStart.2.us.us, %for.body29.us.us ]
  %Products.0151.us.us = phi i32 [ 1, %for.body11.us.us ], [ %inc.us.us, %for.body29.us.us ]
  %BColumnStart.0142.us.us = phi double* [ %add.ptr.us.us, %for.body11.us.us ], [ %22, %for.body29.us.us ]
  %16 = phi <2 x double> [ %6, %for.body11.us.us ], [ %27, %for.body29.us.us ]
  %17 = phi <2 x double> [ %9, %for.body11.us.us ], [ %30, %for.body29.us.us ]
  %18 = phi <2 x double> [ %12, %for.body11.us.us ], [ %33, %for.body29.us.us ]
  %19 = phi <2 x double> [ %15, %for.body11.us.us ], [ %36, %for.body29.us.us ]
  call void @llvm.dbg.value(metadata i32 %Products.0151.us.us, metadata !279, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !278, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !277, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !276, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !275, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !274, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !273, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !272, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !271, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double* %BColumnStart.0142.us.us, metadata !263, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double* %ARowStart.2152.us.us, metadata !262, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)), !dbg !284
  %20 = load double, double* %ARowStart.2152.us.us, align 8, !dbg !311, !tbaa !73
  call void @llvm.dbg.value(metadata double %20, metadata !280, metadata !DIExpression()), !dbg !312
  %21 = ptrtoint double* %BColumnStart.0142.us.us to i64, !dbg !313
  %add.us.us = add i64 %21, %conv, !dbg !314
  %22 = inttoptr i64 %add.us.us to double*, !dbg !315
  call void @llvm.dbg.value(metadata double* %22, metadata !263, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !271, metadata !DIExpression()), !dbg !297
  %23 = inttoptr i64 %add.us.us to <2 x double>*, !dbg !316
  %24 = load <2 x double>, <2 x double>* %23, align 8, !dbg !316, !tbaa !73
  %25 = insertelement <2 x double> poison, double %20, i64 0, !dbg !317
  %26 = shufflevector <2 x double> %25, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !317
  %27 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %26, <2 x double> %24, <2 x double> %16), !dbg !317
  call void @llvm.dbg.value(metadata double undef, metadata !272, metadata !DIExpression()), !dbg !297
  %add.ptr34.us.us = getelementptr inbounds double, double* %22, i64 2, !dbg !318
  call void @llvm.dbg.value(metadata double undef, metadata !273, metadata !DIExpression()), !dbg !297
  %28 = bitcast double* %add.ptr34.us.us to <2 x double>*, !dbg !319
  %29 = load <2 x double>, <2 x double>* %28, align 8, !dbg !319, !tbaa !73
  %30 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %26, <2 x double> %29, <2 x double> %17), !dbg !320
  call void @llvm.dbg.value(metadata double undef, metadata !274, metadata !DIExpression()), !dbg !297
  %add.ptr38.us.us = getelementptr inbounds double, double* %22, i64 4, !dbg !321
  call void @llvm.dbg.value(metadata double undef, metadata !275, metadata !DIExpression()), !dbg !297
  %31 = bitcast double* %add.ptr38.us.us to <2 x double>*, !dbg !322
  %32 = load <2 x double>, <2 x double>* %31, align 8, !dbg !322, !tbaa !73
  %33 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %26, <2 x double> %32, <2 x double> %18), !dbg !323
  call void @llvm.dbg.value(metadata double undef, metadata !276, metadata !DIExpression()), !dbg !297
  %add.ptr42.us.us = getelementptr inbounds double, double* %22, i64 6, !dbg !324
  call void @llvm.dbg.value(metadata double undef, metadata !277, metadata !DIExpression()), !dbg !297
  %34 = bitcast double* %add.ptr42.us.us to <2 x double>*, !dbg !325
  %35 = load <2 x double>, <2 x double>* %34, align 8, !dbg !325, !tbaa !73
  %36 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %26, <2 x double> %35, <2 x double> %19), !dbg !326
  call void @llvm.dbg.value(metadata double undef, metadata !278, metadata !DIExpression()), !dbg !297
  %inc.us.us = add nuw i32 %Products.0151.us.us, 1, !dbg !327
  call void @llvm.dbg.value(metadata i32 %inc.us.us, metadata !279, metadata !DIExpression()), !dbg !297
  %ARowStart.2.us.us = getelementptr inbounds double, double* %ARowStart.2152.us.us, i64 1, !dbg !297
  call void @llvm.dbg.value(metadata double* %ARowStart.2.us.us, metadata !262, metadata !DIExpression()), !dbg !284
  %exitcond.not = icmp eq i32 %inc.us.us, %MatrixSize, !dbg !328
  br i1 %exitcond.not, label %for.cond26.for.end_crit_edge.us.us, label %for.body29.us.us, !dbg !310, !llvm.loop !329

for.cond26.for.end_crit_edge.us.us:               ; preds = %for.body29.us.us
  %37 = ptrtoint double* %ARowStart.2.us.us to i64, !dbg !331
  %sub46.us.us = sub i64 %37, %conv4, !dbg !332
  %38 = inttoptr i64 %sub46.us.us to double*, !dbg !333
  call void @llvm.dbg.value(metadata double* %38, metadata !262, metadata !DIExpression()), !dbg !284
  %39 = bitcast double* %C.addr.1164.us.us to <2 x double>*, !dbg !334
  store <2 x double> %27, <2 x double>* %39, align 8, !dbg !334, !tbaa !73
  %add.ptr48.us.us = getelementptr inbounds double, double* %C.addr.1164.us.us, i64 2, !dbg !335
  %40 = bitcast double* %add.ptr48.us.us to <2 x double>*, !dbg !336
  store <2 x double> %30, <2 x double>* %40, align 8, !dbg !336, !tbaa !73
  %add.ptr50.us.us = getelementptr inbounds double, double* %C.addr.1164.us.us, i64 4, !dbg !337
  %41 = bitcast double* %add.ptr50.us.us to <2 x double>*, !dbg !338
  store <2 x double> %33, <2 x double>* %41, align 8, !dbg !338, !tbaa !73
  %add.ptr52.us.us = getelementptr inbounds double, double* %C.addr.1164.us.us, i64 6, !dbg !339
  %42 = bitcast double* %add.ptr52.us.us to <2 x double>*, !dbg !340
  store <2 x double> %36, <2 x double>* %42, align 8, !dbg !340, !tbaa !73
  %add.ptr54.us.us = getelementptr inbounds double, double* %C.addr.1164.us.us, i64 8, !dbg !341
  call void @llvm.dbg.value(metadata double* %add.ptr54.us.us, metadata !249, metadata !DIExpression()), !dbg !284
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 8, !dbg !342
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !260, metadata !DIExpression()), !dbg !284
  %cmp9.us.us = icmp ult i64 %indvars.iv.next, %0, !dbg !343
  br i1 %cmp9.us.us, label %for.body11.us.us, label %for.cond8.for.end57_crit_edge.split.us.us, !dbg !295, !llvm.loop !344

for.cond8.for.end57_crit_edge.split.us.us:        ; preds = %for.cond26.for.end_crit_edge.us.us
  %add58.us = add i64 %sub46.us.us, %conv2, !dbg !346
  %43 = inttoptr i64 %add58.us to double*, !dbg !347
  call void @llvm.dbg.value(metadata double* %43, metadata !262, metadata !DIExpression()), !dbg !284
  %44 = ptrtoint double* %add.ptr54.us.us to i64, !dbg !348
  %add59.us = add i64 %44, %conv6, !dbg !349
  %45 = inttoptr i64 %add59.us to double*, !dbg !350
  call void @llvm.dbg.value(metadata double* %45, metadata !249, metadata !DIExpression()), !dbg !284
  %inc61.us = add nuw i32 %Vertical.0169.us, 1, !dbg !351
  call void @llvm.dbg.value(metadata i32 %inc61.us, metadata !261, metadata !DIExpression()), !dbg !284
  %exitcond181.not = icmp eq i32 %inc61.us, %MatrixSize, !dbg !352
  br i1 %exitcond181.not, label %for.end62, label %for.cond8.preheader.us, !dbg !294, !llvm.loop !353

for.end62.loopexit:                               ; preds = %entry
  call void @llvm.dbg.value(metadata i32 undef, metadata !261, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata double* %C, metadata !249, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata i64 0, metadata !260, metadata !DIExpression()), !dbg !284
  call void @llvm.dbg.value(metadata double* %B, metadata !263, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double* %A, metadata !262, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)), !dbg !284
  %46 = load double, double* %A, align 8, !dbg !298, !tbaa !73
  call void @llvm.dbg.value(metadata double %46, metadata !270, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !271, metadata !DIExpression()), !dbg !297
  %47 = bitcast double* %B to <2 x double>*, !dbg !299
  %48 = load <2 x double>, <2 x double>* %47, align 8, !dbg !299, !tbaa !73
  %49 = insertelement <2 x double> poison, double %46, i64 0, !dbg !300
  %50 = shufflevector <2 x double> %49, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !300
  %51 = fmul <2 x double> %50, %48, !dbg !300
  call void @llvm.dbg.value(metadata double undef, metadata !272, metadata !DIExpression()), !dbg !297
  %add.ptr14 = getelementptr inbounds double, double* %B, i64 2, !dbg !301
  call void @llvm.dbg.value(metadata double undef, metadata !273, metadata !DIExpression()), !dbg !297
  %52 = bitcast double* %add.ptr14 to <2 x double>*, !dbg !302
  %53 = load <2 x double>, <2 x double>* %52, align 8, !dbg !302, !tbaa !73
  %54 = fmul <2 x double> %50, %53, !dbg !303
  call void @llvm.dbg.value(metadata double undef, metadata !274, metadata !DIExpression()), !dbg !297
  %add.ptr18 = getelementptr inbounds double, double* %B, i64 4, !dbg !304
  call void @llvm.dbg.value(metadata double undef, metadata !275, metadata !DIExpression()), !dbg !297
  %55 = bitcast double* %add.ptr18 to <2 x double>*, !dbg !305
  %56 = load <2 x double>, <2 x double>* %55, align 8, !dbg !305, !tbaa !73
  %57 = fmul <2 x double> %50, %56, !dbg !306
  call void @llvm.dbg.value(metadata double undef, metadata !276, metadata !DIExpression()), !dbg !297
  %add.ptr22 = getelementptr inbounds double, double* %B, i64 6, !dbg !307
  call void @llvm.dbg.value(metadata double undef, metadata !277, metadata !DIExpression()), !dbg !297
  %58 = bitcast double* %add.ptr22 to <2 x double>*, !dbg !308
  %59 = load <2 x double>, <2 x double>* %58, align 8, !dbg !308, !tbaa !73
  %60 = fmul <2 x double> %50, %59, !dbg !309
  call void @llvm.dbg.value(metadata double undef, metadata !278, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata i32 1, metadata !279, metadata !DIExpression()), !dbg !297
  call void @llvm.dbg.value(metadata !DIArgList(double* %A, i64 %conv4), metadata !262, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 8, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !284
  %61 = bitcast double* %C to <2 x double>*, !dbg !334
  store <2 x double> %51, <2 x double>* %61, align 8, !dbg !334, !tbaa !73
  %add.ptr48 = getelementptr inbounds double, double* %C, i64 2, !dbg !335
  %62 = bitcast double* %add.ptr48 to <2 x double>*, !dbg !336
  store <2 x double> %54, <2 x double>* %62, align 8, !dbg !336, !tbaa !73
  %add.ptr50 = getelementptr inbounds double, double* %C, i64 4, !dbg !337
  %63 = bitcast double* %add.ptr50 to <2 x double>*, !dbg !338
  store <2 x double> %57, <2 x double>* %63, align 8, !dbg !338, !tbaa !73
  %add.ptr52 = getelementptr inbounds double, double* %C, i64 6, !dbg !339
  %64 = bitcast double* %add.ptr52 to <2 x double>*, !dbg !340
  store <2 x double> %60, <2 x double>* %64, align 8, !dbg !340, !tbaa !73
  call void @llvm.dbg.value(metadata i64 0, metadata !260, metadata !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value)), !dbg !284
  call void @llvm.dbg.value(metadata !DIArgList(double* %A, i64 %conv2, i64 %conv4), metadata !262, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 8, DW_OP_LLVM_arg, 2, DW_OP_minus, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !284
  call void @llvm.dbg.value(metadata !DIArgList(double* %C, i64 %conv6), metadata !249, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 64, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !284
  call void @llvm.dbg.value(metadata i32 undef, metadata !261, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !284
  br label %for.end62, !dbg !355

for.end62:                                        ; preds = %for.end62.loopexit, %for.cond8.for.end57_crit_edge.split.us.us, %entry
  ret void, !dbg !355
}

; Function Attrs: nofree nosync nounwind uwtable
define dso_local void @FastAdditiveNaiveMatrixMultiply(double* noundef %C, double* noundef %A, double* noundef %B, i32 noundef %MatrixSize, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB) local_unnamed_addr #8 !dbg !356 {
entry:
  call void @llvm.dbg.value(metadata double* %C, metadata !358, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata double* %A, metadata !359, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata double* %B, metadata !360, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata i32 %MatrixSize, metadata !361, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata i32 %RowWidthC, metadata !362, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata i32 %RowWidthA, metadata !363, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata i32 %RowWidthB, metadata !364, metadata !DIExpression()), !dbg !392
  %shl = shl i32 %RowWidthB, 3, !dbg !393
  %conv = zext i32 %shl to i64, !dbg !394
  call void @llvm.dbg.value(metadata i64 %conv, metadata !365, metadata !DIExpression()), !dbg !392
  %shl1 = shl i32 %RowWidthA, 3, !dbg !395
  %conv2 = zext i32 %shl1 to i64, !dbg !396
  call void @llvm.dbg.value(metadata i64 %conv2, metadata !366, metadata !DIExpression()), !dbg !392
  %shl3 = shl i32 %MatrixSize, 3, !dbg !397
  %conv4 = zext i32 %shl3 to i64, !dbg !398
  call void @llvm.dbg.value(metadata i64 %conv4, metadata !367, metadata !DIExpression()), !dbg !392
  %sub = sub i32 %RowWidthC, %MatrixSize, !dbg !399
  %shl5 = shl i32 %sub, 3, !dbg !400
  %conv6 = zext i32 %shl5 to i64, !dbg !401
  call void @llvm.dbg.value(metadata i64 %conv6, metadata !368, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata double* %A, metadata !371, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata i32 0, metadata !370, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata double* %C, metadata !358, metadata !DIExpression()), !dbg !392
  %cmp141.not = icmp eq i32 %MatrixSize, 0, !dbg !402
  br i1 %cmp141.not, label %for.end46, label %for.cond8.preheader.preheader, !dbg !403

for.cond8.preheader.preheader:                    ; preds = %entry
  %0 = zext i32 %MatrixSize to i64, !dbg !403
  br label %for.cond8.preheader, !dbg !403

for.cond8.preheader:                              ; preds = %for.cond8.for.end41_crit_edge, %for.cond8.preheader.preheader
  %C.addr.0144 = phi double* [ %34, %for.cond8.for.end41_crit_edge ], [ %C, %for.cond8.preheader.preheader ]
  %ARowStart.0143 = phi double* [ %32, %for.cond8.for.end41_crit_edge ], [ %A, %for.cond8.preheader.preheader ]
  %Vertical.0142 = phi i32 [ %inc45, %for.cond8.for.end41_crit_edge ], [ 0, %for.cond8.preheader.preheader ]
  call void @llvm.dbg.value(metadata double* %C.addr.0144, metadata !358, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata double* %ARowStart.0143, metadata !371, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata i32 %Vertical.0142, metadata !370, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata double* %C.addr.0144, metadata !358, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata double* %ARowStart.0143, metadata !371, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata i32 0, metadata !369, metadata !DIExpression()), !dbg !392
  br label %for.body11, !dbg !404

for.body11:                                       ; preds = %for.cond19.for.end_crit_edge, %for.cond8.preheader
  %indvars.iv = phi i64 [ 0, %for.cond8.preheader ], [ %indvars.iv.next, %for.cond19.for.end_crit_edge ]
  %C.addr.1138 = phi double* [ %C.addr.0144, %for.cond8.preheader ], [ %add.ptr38, %for.cond19.for.end_crit_edge ]
  %ARowStart.1137 = phi double* [ %ARowStart.0143, %for.cond8.preheader ], [ %31, %for.cond19.for.end_crit_edge ]
  call void @llvm.dbg.value(metadata double* %C.addr.1138, metadata !358, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata double* %ARowStart.1137, metadata !371, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !369, metadata !DIExpression()), !dbg !392
  %add.ptr = getelementptr inbounds double, double* %B, i64 %indvars.iv, !dbg !405
  call void @llvm.dbg.value(metadata double* %add.ptr, metadata !372, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()), !dbg !406
  %1 = bitcast double* %C.addr.1138 to <2 x double>*, !dbg !407
  %2 = load <2 x double>, <2 x double>* %1, align 8, !dbg !407, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()), !dbg !406
  %add.ptr13 = getelementptr inbounds double, double* %C.addr.1138, i64 2, !dbg !408
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()), !dbg !406
  %3 = bitcast double* %add.ptr13 to <2 x double>*, !dbg !409
  %4 = load <2 x double>, <2 x double>* %3, align 8, !dbg !409, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()), !dbg !406
  %add.ptr15 = getelementptr inbounds double, double* %C.addr.1138, i64 4, !dbg !410
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()), !dbg !406
  %5 = bitcast double* %add.ptr15 to <2 x double>*, !dbg !411
  %6 = load <2 x double>, <2 x double>* %5, align 8, !dbg !411, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()), !dbg !406
  %add.ptr17 = getelementptr inbounds double, double* %C.addr.1138, i64 6, !dbg !412
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()), !dbg !406
  %7 = bitcast double* %add.ptr17 to <2 x double>*, !dbg !413
  %8 = load <2 x double>, <2 x double>* %7, align 8, !dbg !413, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double* %add.ptr, metadata !372, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double* %ARowStart.1137, metadata !371, metadata !DIExpression()), !dbg !392
  br label %for.body22, !dbg !414

for.body22:                                       ; preds = %for.body22, %for.body11
  %Products.0126 = phi i32 [ 0, %for.body11 ], [ %inc, %for.body22 ]
  %BColumnStart.0117 = phi double* [ %add.ptr, %for.body11 ], [ %29, %for.body22 ]
  %ARowStart.2116 = phi double* [ %ARowStart.1137, %for.body11 ], [ %incdec.ptr, %for.body22 ]
  %9 = phi <2 x double> [ %2, %for.body11 ], [ %18, %for.body22 ]
  %10 = phi <2 x double> [ %4, %for.body11 ], [ %21, %for.body22 ]
  %11 = phi <2 x double> [ %6, %for.body11 ], [ %24, %for.body22 ]
  %12 = phi <2 x double> [ %8, %for.body11 ], [ %27, %for.body22 ]
  call void @llvm.dbg.value(metadata i32 %Products.0126, metadata !387, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double* %BColumnStart.0117, metadata !372, metadata !DIExpression()), !dbg !406
  call void @llvm.dbg.value(metadata double* %ARowStart.2116, metadata !371, metadata !DIExpression()), !dbg !392
  %incdec.ptr = getelementptr inbounds double, double* %ARowStart.2116, i64 1, !dbg !415
  call void @llvm.dbg.value(metadata double* %incdec.ptr, metadata !371, metadata !DIExpression()), !dbg !392
  %13 = load double, double* %ARowStart.2116, align 8, !dbg !416, !tbaa !73
  call void @llvm.dbg.value(metadata double %13, metadata !388, metadata !DIExpression()), !dbg !417
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()), !dbg !406
  %14 = bitcast double* %BColumnStart.0117 to <2 x double>*, !dbg !418
  %15 = load <2 x double>, <2 x double>* %14, align 8, !dbg !418, !tbaa !73
  %16 = insertelement <2 x double> poison, double %13, i64 0, !dbg !419
  %17 = shufflevector <2 x double> %16, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !419
  %18 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %17, <2 x double> %15, <2 x double> %9), !dbg !419
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()), !dbg !406
  %add.ptr24 = getelementptr inbounds double, double* %BColumnStart.0117, i64 2, !dbg !420
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()), !dbg !406
  %19 = bitcast double* %add.ptr24 to <2 x double>*, !dbg !421
  %20 = load <2 x double>, <2 x double>* %19, align 8, !dbg !421, !tbaa !73
  %21 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %17, <2 x double> %20, <2 x double> %10), !dbg !422
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()), !dbg !406
  %add.ptr26 = getelementptr inbounds double, double* %BColumnStart.0117, i64 4, !dbg !423
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()), !dbg !406
  %22 = bitcast double* %add.ptr26 to <2 x double>*, !dbg !424
  %23 = load <2 x double>, <2 x double>* %22, align 8, !dbg !424, !tbaa !73
  %24 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %17, <2 x double> %23, <2 x double> %11), !dbg !425
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()), !dbg !406
  %add.ptr28 = getelementptr inbounds double, double* %BColumnStart.0117, i64 6, !dbg !426
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()), !dbg !406
  %25 = bitcast double* %add.ptr28 to <2 x double>*, !dbg !427
  %26 = load <2 x double>, <2 x double>* %25, align 8, !dbg !427, !tbaa !73
  %27 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %17, <2 x double> %26, <2 x double> %12), !dbg !428
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()), !dbg !406
  %28 = ptrtoint double* %BColumnStart.0117 to i64, !dbg !429
  %add = add i64 %28, %conv, !dbg !430
  %29 = inttoptr i64 %add to double*, !dbg !431
  call void @llvm.dbg.value(metadata double* %29, metadata !372, metadata !DIExpression()), !dbg !406
  %inc = add nuw i32 %Products.0126, 1, !dbg !432
  call void @llvm.dbg.value(metadata i32 %inc, metadata !387, metadata !DIExpression()), !dbg !406
  %exitcond.not = icmp eq i32 %inc, %MatrixSize, !dbg !433
  br i1 %exitcond.not, label %for.cond19.for.end_crit_edge, label %for.body22, !dbg !414, !llvm.loop !434

for.cond19.for.end_crit_edge:                     ; preds = %for.body22
  %30 = ptrtoint double* %incdec.ptr to i64, !dbg !436
  %sub30 = sub i64 %30, %conv4, !dbg !437
  %31 = inttoptr i64 %sub30 to double*, !dbg !438
  call void @llvm.dbg.value(metadata double* %31, metadata !371, metadata !DIExpression()), !dbg !392
  store <2 x double> %18, <2 x double>* %1, align 8, !dbg !439, !tbaa !73
  store <2 x double> %21, <2 x double>* %3, align 8, !dbg !440, !tbaa !73
  store <2 x double> %24, <2 x double>* %5, align 8, !dbg !441, !tbaa !73
  store <2 x double> %27, <2 x double>* %7, align 8, !dbg !442, !tbaa !73
  %add.ptr38 = getelementptr inbounds double, double* %C.addr.1138, i64 8, !dbg !443
  call void @llvm.dbg.value(metadata double* %add.ptr38, metadata !358, metadata !DIExpression()), !dbg !392
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 8, !dbg !444
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !369, metadata !DIExpression()), !dbg !392
  %cmp9 = icmp ult i64 %indvars.iv.next, %0, !dbg !445
  br i1 %cmp9, label %for.body11, label %for.cond8.for.end41_crit_edge, !dbg !404, !llvm.loop !446

for.cond8.for.end41_crit_edge:                    ; preds = %for.cond19.for.end_crit_edge
  %add42 = add i64 %sub30, %conv2, !dbg !448
  %32 = inttoptr i64 %add42 to double*, !dbg !449
  call void @llvm.dbg.value(metadata double* %32, metadata !371, metadata !DIExpression()), !dbg !392
  %33 = ptrtoint double* %add.ptr38 to i64, !dbg !450
  %add43 = add i64 %33, %conv6, !dbg !451
  %34 = inttoptr i64 %add43 to double*, !dbg !452
  call void @llvm.dbg.value(metadata double* %34, metadata !358, metadata !DIExpression()), !dbg !392
  %inc45 = add nuw i32 %Vertical.0142, 1, !dbg !453
  call void @llvm.dbg.value(metadata i32 %inc45, metadata !370, metadata !DIExpression()), !dbg !392
  %exitcond153.not = icmp eq i32 %inc45, %MatrixSize, !dbg !402
  br i1 %exitcond153.not, label %for.end46, label %for.cond8.preheader, !dbg !403, !llvm.loop !454

for.end46:                                        ; preds = %for.cond8.for.end41_crit_edge, %entry
  ret void, !dbg !456
}

; Function Attrs: nofree nosync nounwind uwtable
define dso_local void @MultiplyByDivideAndConquer(double* noundef %C, double* noundef %A, double* noundef %B, i32 noundef %MatrixSize, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef %AdditiveMode) local_unnamed_addr #8 !dbg !457 {
entry:
  call void @llvm.dbg.value(metadata double* %C, metadata !461, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %A, metadata !462, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %B, metadata !463, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %MatrixSize, metadata !464, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %RowWidthC, metadata !465, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %RowWidthA, metadata !466, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %RowWidthB, metadata !467, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %AdditiveMode, metadata !468, metadata !DIExpression()), !dbg !479
  %shr718 = lshr i32 %MatrixSize, 1, !dbg !480
  call void @llvm.dbg.value(metadata i32 %shr718, metadata !478, metadata !DIExpression()), !dbg !479
  %idx.ext719 = zext i32 %shr718 to i64, !dbg !481
  %add.ptr720 = getelementptr inbounds double, double* %A, i64 %idx.ext719, !dbg !481
  call void @llvm.dbg.value(metadata double* %add.ptr720, metadata !469, metadata !DIExpression()), !dbg !479
  %mul721 = mul i32 %shr718, %RowWidthA, !dbg !482
  %idx.ext1722 = zext i32 %mul721 to i64, !dbg !483
  %add.ptr2723 = getelementptr inbounds double, double* %A, i64 %idx.ext1722, !dbg !483
  call void @llvm.dbg.value(metadata double* %add.ptr2723, metadata !470, metadata !DIExpression()), !dbg !479
  %add.ptr4724 = getelementptr inbounds double, double* %add.ptr2723, i64 %idx.ext719, !dbg !484
  call void @llvm.dbg.value(metadata double* %add.ptr4724, metadata !471, metadata !DIExpression()), !dbg !479
  %add.ptr6725 = getelementptr inbounds double, double* %B, i64 %idx.ext719, !dbg !485
  call void @llvm.dbg.value(metadata double* %add.ptr6725, metadata !472, metadata !DIExpression()), !dbg !479
  %mul7726 = mul i32 %shr718, %RowWidthB, !dbg !486
  %idx.ext8727 = zext i32 %mul7726 to i64, !dbg !487
  %add.ptr9728 = getelementptr inbounds double, double* %B, i64 %idx.ext8727, !dbg !487
  call void @llvm.dbg.value(metadata double* %add.ptr9728, metadata !473, metadata !DIExpression()), !dbg !479
  %add.ptr11729 = getelementptr inbounds double, double* %add.ptr9728, i64 %idx.ext719, !dbg !488
  call void @llvm.dbg.value(metadata double* %add.ptr11729, metadata !474, metadata !DIExpression()), !dbg !479
  %add.ptr13730 = getelementptr inbounds double, double* %C, i64 %idx.ext719, !dbg !489
  call void @llvm.dbg.value(metadata double* %add.ptr13730, metadata !475, metadata !DIExpression()), !dbg !479
  %mul14731 = mul i32 %shr718, %RowWidthC, !dbg !490
  %idx.ext15732 = zext i32 %mul14731 to i64, !dbg !491
  %add.ptr16733 = getelementptr inbounds double, double* %C, i64 %idx.ext15732, !dbg !491
  call void @llvm.dbg.value(metadata double* %add.ptr16733, metadata !476, metadata !DIExpression()), !dbg !479
  %add.ptr18734 = getelementptr inbounds double, double* %add.ptr16733, i64 %idx.ext719, !dbg !492
  call void @llvm.dbg.value(metadata double* %add.ptr18734, metadata !477, metadata !DIExpression()), !dbg !479
  %cmp735 = icmp ugt i32 %MatrixSize, 33, !dbg !493
  br i1 %cmp735, label %if.then.preheader, label %if.else, !dbg !495

if.then.preheader:                                ; preds = %entry
  call void @llvm.dbg.value(metadata i32 %AdditiveMode, metadata !468, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %B, metadata !463, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %A, metadata !462, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %C, metadata !461, metadata !DIExpression()), !dbg !479
  tail call void @MultiplyByDivideAndConquer(double* noundef %C, double* noundef %A, double* noundef %B, i32 noundef %shr718, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef %AdditiveMode), !dbg !496
  tail call void @MultiplyByDivideAndConquer(double* noundef %add.ptr13730, double* noundef %A, double* noundef %add.ptr6725, i32 noundef %shr718, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef %AdditiveMode), !dbg !498
  tail call void @MultiplyByDivideAndConquer(double* noundef %add.ptr18734, double* noundef %add.ptr2723, double* noundef %add.ptr6725, i32 noundef %shr718, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef %AdditiveMode), !dbg !499
  tail call void @MultiplyByDivideAndConquer(double* noundef %add.ptr16733, double* noundef %add.ptr2723, double* noundef %B, i32 noundef %shr718, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef %AdditiveMode), !dbg !500
  tail call void @MultiplyByDivideAndConquer(double* noundef %C, double* noundef %add.ptr720, double* noundef %add.ptr9728, i32 noundef %shr718, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef 1), !dbg !501
  tail call void @MultiplyByDivideAndConquer(double* noundef %add.ptr13730, double* noundef %add.ptr720, double* noundef %add.ptr11729, i32 noundef %shr718, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef 1), !dbg !502
  tail call void @MultiplyByDivideAndConquer(double* noundef %add.ptr18734, double* noundef %add.ptr4724, double* noundef %add.ptr11729, i32 noundef %shr718, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef 1), !dbg !503
  call void @llvm.dbg.value(metadata double* %add.ptr16733, metadata !461, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %add.ptr4724, metadata !462, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %add.ptr9728, metadata !463, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %shr718, metadata !464, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %RowWidthC, metadata !465, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %RowWidthA, metadata !466, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %RowWidthB, metadata !467, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 1, metadata !468, metadata !DIExpression()), !dbg !479
  %shr.peel = lshr i32 %MatrixSize, 2, !dbg !480
  call void @llvm.dbg.value(metadata i32 %shr.peel, metadata !478, metadata !DIExpression()), !dbg !479
  %idx.ext.peel = zext i32 %shr.peel to i64, !dbg !481
  %add.ptr.peel = getelementptr inbounds double, double* %add.ptr4724, i64 %idx.ext.peel, !dbg !481
  call void @llvm.dbg.value(metadata double* %add.ptr.peel, metadata !469, metadata !DIExpression()), !dbg !479
  %mul.peel = mul i32 %shr.peel, %RowWidthA, !dbg !482
  %idx.ext1.peel = zext i32 %mul.peel to i64, !dbg !483
  %add.ptr2.peel = getelementptr inbounds double, double* %add.ptr4724, i64 %idx.ext1.peel, !dbg !483
  call void @llvm.dbg.value(metadata double* %add.ptr2.peel, metadata !470, metadata !DIExpression()), !dbg !479
  %add.ptr4.peel = getelementptr inbounds double, double* %add.ptr2.peel, i64 %idx.ext.peel, !dbg !484
  call void @llvm.dbg.value(metadata double* %add.ptr4.peel, metadata !471, metadata !DIExpression()), !dbg !479
  %add.ptr6.peel = getelementptr inbounds double, double* %add.ptr9728, i64 %idx.ext.peel, !dbg !485
  call void @llvm.dbg.value(metadata double* %add.ptr6.peel, metadata !472, metadata !DIExpression()), !dbg !479
  %mul7.peel = mul i32 %shr.peel, %RowWidthB, !dbg !486
  %idx.ext8.peel = zext i32 %mul7.peel to i64, !dbg !487
  %add.ptr9.peel = getelementptr inbounds double, double* %add.ptr9728, i64 %idx.ext8.peel, !dbg !487
  call void @llvm.dbg.value(metadata double* %add.ptr9.peel, metadata !473, metadata !DIExpression()), !dbg !479
  %add.ptr11.peel = getelementptr inbounds double, double* %add.ptr9.peel, i64 %idx.ext.peel, !dbg !488
  call void @llvm.dbg.value(metadata double* %add.ptr11.peel, metadata !474, metadata !DIExpression()), !dbg !479
  %add.ptr13.peel = getelementptr inbounds double, double* %add.ptr16733, i64 %idx.ext.peel, !dbg !489
  call void @llvm.dbg.value(metadata double* %add.ptr13.peel, metadata !475, metadata !DIExpression()), !dbg !479
  %mul14.peel = mul i32 %shr.peel, %RowWidthC, !dbg !490
  %idx.ext15.peel = zext i32 %mul14.peel to i64, !dbg !491
  %add.ptr16.peel = getelementptr inbounds double, double* %add.ptr16733, i64 %idx.ext15.peel, !dbg !491
  call void @llvm.dbg.value(metadata double* %add.ptr16.peel, metadata !476, metadata !DIExpression()), !dbg !479
  %add.ptr18.peel = getelementptr inbounds double, double* %add.ptr16.peel, i64 %idx.ext.peel, !dbg !492
  call void @llvm.dbg.value(metadata double* %add.ptr18.peel, metadata !477, metadata !DIExpression()), !dbg !479
  %cmp.peel = icmp ugt i32 %MatrixSize, 67, !dbg !493
  br i1 %cmp.peel, label %if.then, label %if.then19, !dbg !495

if.then:                                          ; preds = %if.then, %if.then.preheader
  %add.ptr18749 = phi double* [ %add.ptr18, %if.then ], [ %add.ptr18.peel, %if.then.preheader ]
  %add.ptr16748 = phi double* [ %add.ptr16, %if.then ], [ %add.ptr16.peel, %if.then.preheader ]
  %add.ptr13747 = phi double* [ %add.ptr13, %if.then ], [ %add.ptr13.peel, %if.then.preheader ]
  %add.ptr11746 = phi double* [ %add.ptr11, %if.then ], [ %add.ptr11.peel, %if.then.preheader ]
  %add.ptr9745 = phi double* [ %add.ptr9, %if.then ], [ %add.ptr9.peel, %if.then.preheader ]
  %add.ptr6744 = phi double* [ %add.ptr6, %if.then ], [ %add.ptr6.peel, %if.then.preheader ]
  %add.ptr4743 = phi double* [ %add.ptr4, %if.then ], [ %add.ptr4.peel, %if.then.preheader ]
  %add.ptr2742 = phi double* [ %add.ptr2, %if.then ], [ %add.ptr2.peel, %if.then.preheader ]
  %add.ptr741 = phi double* [ %add.ptr, %if.then ], [ %add.ptr.peel, %if.then.preheader ]
  %shr740 = phi i32 [ %shr, %if.then ], [ %shr.peel, %if.then.preheader ]
  %B.tr738 = phi double* [ %add.ptr9745, %if.then ], [ %add.ptr9728, %if.then.preheader ]
  %A.tr737 = phi double* [ %add.ptr4743, %if.then ], [ %add.ptr4724, %if.then.preheader ]
  %C.tr736 = phi double* [ %add.ptr16748, %if.then ], [ %add.ptr16733, %if.then.preheader ]
  call void @llvm.dbg.value(metadata i32 1, metadata !468, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %B.tr738, metadata !463, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %A.tr737, metadata !462, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %C.tr736, metadata !461, metadata !DIExpression()), !dbg !479
  tail call void @MultiplyByDivideAndConquer(double* noundef %C.tr736, double* noundef %A.tr737, double* noundef %B.tr738, i32 noundef %shr740, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef 1), !dbg !496
  tail call void @MultiplyByDivideAndConquer(double* noundef %add.ptr13747, double* noundef %A.tr737, double* noundef %add.ptr6744, i32 noundef %shr740, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef 1), !dbg !498
  tail call void @MultiplyByDivideAndConquer(double* noundef %add.ptr18749, double* noundef %add.ptr2742, double* noundef %add.ptr6744, i32 noundef %shr740, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef 1), !dbg !499
  tail call void @MultiplyByDivideAndConquer(double* noundef %add.ptr16748, double* noundef %add.ptr2742, double* noundef %B.tr738, i32 noundef %shr740, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef 1), !dbg !500
  tail call void @MultiplyByDivideAndConquer(double* noundef %C.tr736, double* noundef %add.ptr741, double* noundef %add.ptr9745, i32 noundef %shr740, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef 1), !dbg !501
  tail call void @MultiplyByDivideAndConquer(double* noundef %add.ptr13747, double* noundef %add.ptr741, double* noundef %add.ptr11746, i32 noundef %shr740, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef 1), !dbg !502
  tail call void @MultiplyByDivideAndConquer(double* noundef %add.ptr18749, double* noundef %add.ptr4743, double* noundef %add.ptr11746, i32 noundef %shr740, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef 1), !dbg !503
  call void @llvm.dbg.value(metadata double* %add.ptr16748, metadata !461, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %add.ptr4743, metadata !462, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata double* %add.ptr9745, metadata !463, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %shr740, metadata !464, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %RowWidthC, metadata !465, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %RowWidthA, metadata !466, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 %RowWidthB, metadata !467, metadata !DIExpression()), !dbg !479
  call void @llvm.dbg.value(metadata i32 1, metadata !468, metadata !DIExpression()), !dbg !479
  %shr = lshr i32 %shr740, 1, !dbg !480
  call void @llvm.dbg.value(metadata i32 %shr, metadata !478, metadata !DIExpression()), !dbg !479
  %idx.ext = zext i32 %shr to i64, !dbg !481
  %add.ptr = getelementptr inbounds double, double* %add.ptr4743, i64 %idx.ext, !dbg !481
  call void @llvm.dbg.value(metadata double* %add.ptr, metadata !469, metadata !DIExpression()), !dbg !479
  %mul = mul i32 %shr, %RowWidthA, !dbg !482
  %idx.ext1 = zext i32 %mul to i64, !dbg !483
  %add.ptr2 = getelementptr inbounds double, double* %add.ptr4743, i64 %idx.ext1, !dbg !483
  call void @llvm.dbg.value(metadata double* %add.ptr2, metadata !470, metadata !DIExpression()), !dbg !479
  %add.ptr4 = getelementptr inbounds double, double* %add.ptr2, i64 %idx.ext, !dbg !484
  call void @llvm.dbg.value(metadata double* %add.ptr4, metadata !471, metadata !DIExpression()), !dbg !479
  %add.ptr6 = getelementptr inbounds double, double* %add.ptr9745, i64 %idx.ext, !dbg !485
  call void @llvm.dbg.value(metadata double* %add.ptr6, metadata !472, metadata !DIExpression()), !dbg !479
  %mul7 = mul i32 %shr, %RowWidthB, !dbg !486
  %idx.ext8 = zext i32 %mul7 to i64, !dbg !487
  %add.ptr9 = getelementptr inbounds double, double* %add.ptr9745, i64 %idx.ext8, !dbg !487
  call void @llvm.dbg.value(metadata double* %add.ptr9, metadata !473, metadata !DIExpression()), !dbg !479
  %add.ptr11 = getelementptr inbounds double, double* %add.ptr9, i64 %idx.ext, !dbg !488
  call void @llvm.dbg.value(metadata double* %add.ptr11, metadata !474, metadata !DIExpression()), !dbg !479
  %add.ptr13 = getelementptr inbounds double, double* %add.ptr16748, i64 %idx.ext, !dbg !489
  call void @llvm.dbg.value(metadata double* %add.ptr13, metadata !475, metadata !DIExpression()), !dbg !479
  %mul14 = mul i32 %shr, %RowWidthC, !dbg !490
  %idx.ext15 = zext i32 %mul14 to i64, !dbg !491
  %add.ptr16 = getelementptr inbounds double, double* %add.ptr16748, i64 %idx.ext15, !dbg !491
  call void @llvm.dbg.value(metadata double* %add.ptr16, metadata !476, metadata !DIExpression()), !dbg !479
  %add.ptr18 = getelementptr inbounds double, double* %add.ptr16, i64 %idx.ext, !dbg !492
  call void @llvm.dbg.value(metadata double* %add.ptr18, metadata !477, metadata !DIExpression()), !dbg !479
  %cmp = icmp ugt i32 %shr740, 33, !dbg !493
  br i1 %cmp, label %if.then, label %if.then19.loopexit, !dbg !495, !llvm.loop !504

if.else:                                          ; preds = %entry
  %tobool.not = icmp eq i32 %AdditiveMode, 0, !dbg !506
  br i1 %tobool.not, label %if.else20, label %if.then19, !dbg !509

if.then19.loopexit:                               ; preds = %if.then
  %idx.ext.le = zext i32 %shr to i64, !dbg !481
  br label %if.then19, !dbg !510

if.then19:                                        ; preds = %if.then19.loopexit, %if.else, %if.then.preheader
  %add.ptr18.lcssa889 = phi double* [ %add.ptr18734, %if.else ], [ %add.ptr18.peel, %if.then.preheader ], [ %add.ptr18, %if.then19.loopexit ]
  %add.ptr16.lcssa887 = phi double* [ %add.ptr16733, %if.else ], [ %add.ptr16.peel, %if.then.preheader ], [ %add.ptr16, %if.then19.loopexit ]
  %add.ptr13.lcssa885 = phi double* [ %add.ptr13730, %if.else ], [ %add.ptr13.peel, %if.then.preheader ], [ %add.ptr13, %if.then19.loopexit ]
  %add.ptr11.lcssa883 = phi double* [ %add.ptr11729, %if.else ], [ %add.ptr11.peel, %if.then.preheader ], [ %add.ptr11, %if.then19.loopexit ]
  %add.ptr9.lcssa881 = phi double* [ %add.ptr9728, %if.else ], [ %add.ptr9.peel, %if.then.preheader ], [ %add.ptr9, %if.then19.loopexit ]
  %add.ptr6.lcssa879 = phi double* [ %add.ptr6725, %if.else ], [ %add.ptr6.peel, %if.then.preheader ], [ %add.ptr6, %if.then19.loopexit ]
  %add.ptr4.lcssa878 = phi double* [ %add.ptr4724, %if.else ], [ %add.ptr4.peel, %if.then.preheader ], [ %add.ptr4, %if.then19.loopexit ]
  %add.ptr2.lcssa876 = phi double* [ %add.ptr2723, %if.else ], [ %add.ptr2.peel, %if.then.preheader ], [ %add.ptr2, %if.then19.loopexit ]
  %add.ptr.lcssa875 = phi double* [ %add.ptr720, %if.else ], [ %add.ptr.peel, %if.then.preheader ], [ %add.ptr, %if.then19.loopexit ]
  %MatrixSize.tr.lcssa872 = phi i32 [ %MatrixSize, %if.else ], [ %shr718, %if.then.preheader ], [ %shr740, %if.then19.loopexit ]
  %B.tr.lcssa871 = phi double* [ %B, %if.else ], [ %add.ptr9728, %if.then.preheader ], [ %add.ptr9745, %if.then19.loopexit ]
  %A.tr.lcssa870 = phi double* [ %A, %if.else ], [ %add.ptr4724, %if.then.preheader ], [ %add.ptr4743, %if.then19.loopexit ]
  %C.tr.lcssa869 = phi double* [ %C, %if.else ], [ %add.ptr16733, %if.then.preheader ], [ %add.ptr16748, %if.then19.loopexit ]
  %shr.lcssa717866 = phi i32 [ %shr718, %if.else ], [ %shr.peel, %if.then.preheader ], [ %shr, %if.then19.loopexit ]
  %idx.ext.le.pre-phi864 = phi i64 [ %idx.ext719, %if.else ], [ %idx.ext.peel, %if.then.preheader ], [ %idx.ext.le, %if.then19.loopexit ]
  call void @llvm.dbg.value(metadata double* %C, metadata !358, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata double* %A, metadata !359, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata double* %B, metadata !360, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata i32 %shr718, metadata !361, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata i32 %RowWidthC, metadata !362, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata i32 %RowWidthA, metadata !363, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata i32 %RowWidthB, metadata !364, metadata !DIExpression()) #21, !dbg !513
  %shl.i = shl i32 %RowWidthB, 3, !dbg !510
  %conv.i = zext i32 %shl.i to i64, !dbg !514
  call void @llvm.dbg.value(metadata i64 %conv.i, metadata !365, metadata !DIExpression()) #21, !dbg !513
  %shl1.i = shl i32 %RowWidthA, 3, !dbg !515
  %conv2.i = zext i32 %shl1.i to i64, !dbg !516
  call void @llvm.dbg.value(metadata i64 %conv2.i, metadata !366, metadata !DIExpression()) #21, !dbg !513
  %shl3.i = shl i32 %shr.lcssa717866, 3, !dbg !517
  %conv4.i = zext i32 %shl3.i to i64, !dbg !518
  call void @llvm.dbg.value(metadata i64 %conv4.i, metadata !367, metadata !DIExpression()) #21, !dbg !513
  %sub.i = sub i32 %RowWidthC, %shr.lcssa717866, !dbg !519
  %shl5.i = shl i32 %sub.i, 3, !dbg !520
  %conv6.i = zext i32 %shl5.i to i64, !dbg !521
  call void @llvm.dbg.value(metadata i64 %conv6.i, metadata !368, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata double* %A, metadata !371, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata i32 0, metadata !370, metadata !DIExpression()) #21, !dbg !513
  %cmp141.not.i = icmp ult i32 %MatrixSize.tr.lcssa872, 2, !dbg !522
  br i1 %cmp141.not.i, label %if.end21, label %for.cond8.preheader.i, !dbg !523

for.cond8.preheader.i:                            ; preds = %for.cond8.for.end41_crit_edge.i, %if.then19
  %C.addr.0144.i = phi double* [ %33, %for.cond8.for.end41_crit_edge.i ], [ %C.tr.lcssa869, %if.then19 ]
  %ARowStart.0143.i = phi double* [ %31, %for.cond8.for.end41_crit_edge.i ], [ %A.tr.lcssa870, %if.then19 ]
  %Vertical.0142.i = phi i32 [ %inc45.i, %for.cond8.for.end41_crit_edge.i ], [ 0, %if.then19 ]
  call void @llvm.dbg.value(metadata i32 %Vertical.0142.i, metadata !370, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata double* %C.addr.0144.i, metadata !358, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata double* %ARowStart.0143.i, metadata !371, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata i32 0, metadata !369, metadata !DIExpression()) #21, !dbg !513
  br label %for.body11.i, !dbg !524

for.body11.i:                                     ; preds = %for.cond19.for.end_crit_edge.i, %for.cond8.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond8.preheader.i ], [ %indvars.iv.next.i, %for.cond19.for.end_crit_edge.i ]
  %C.addr.1138.i = phi double* [ %C.addr.0144.i, %for.cond8.preheader.i ], [ %add.ptr38.i, %for.cond19.for.end_crit_edge.i ]
  %ARowStart.1137.i = phi double* [ %ARowStart.0143.i, %for.cond8.preheader.i ], [ %30, %for.cond19.for.end_crit_edge.i ]
  call void @llvm.dbg.value(metadata double* %C.addr.1138.i, metadata !358, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata double* %ARowStart.1137.i, metadata !371, metadata !DIExpression()) #21, !dbg !513
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !369, metadata !DIExpression()) #21, !dbg !513
  %add.ptr.i = getelementptr inbounds double, double* %B.tr.lcssa871, i64 %indvars.iv.i, !dbg !525
  call void @llvm.dbg.value(metadata double* %add.ptr.i, metadata !372, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !526
  %0 = bitcast double* %C.addr.1138.i to <2 x double>*, !dbg !527
  %1 = load <2 x double>, <2 x double>* %0, align 8, !dbg !527, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !526
  %add.ptr13.i = getelementptr inbounds double, double* %C.addr.1138.i, i64 2, !dbg !528
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !526
  %2 = bitcast double* %add.ptr13.i to <2 x double>*, !dbg !529
  %3 = load <2 x double>, <2 x double>* %2, align 8, !dbg !529, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !526
  %add.ptr15.i = getelementptr inbounds double, double* %C.addr.1138.i, i64 4, !dbg !530
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !526
  %4 = bitcast double* %add.ptr15.i to <2 x double>*, !dbg !531
  %5 = load <2 x double>, <2 x double>* %4, align 8, !dbg !531, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !526
  %add.ptr17.i = getelementptr inbounds double, double* %C.addr.1138.i, i64 6, !dbg !532
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !526
  %6 = bitcast double* %add.ptr17.i to <2 x double>*, !dbg !533
  %7 = load <2 x double>, <2 x double>* %6, align 8, !dbg !533, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()) #21, !dbg !526
  br label %for.body22.i, !dbg !534

for.body22.i:                                     ; preds = %for.body22.i, %for.body11.i
  %Products.0126.i = phi i32 [ 0, %for.body11.i ], [ %inc.i, %for.body22.i ]
  %BColumnStart.0117.i = phi double* [ %add.ptr.i, %for.body11.i ], [ %28, %for.body22.i ]
  %ARowStart.2116.i = phi double* [ %ARowStart.1137.i, %for.body11.i ], [ %incdec.ptr.i, %for.body22.i ]
  %8 = phi <2 x double> [ %1, %for.body11.i ], [ %17, %for.body22.i ]
  %9 = phi <2 x double> [ %3, %for.body11.i ], [ %20, %for.body22.i ]
  %10 = phi <2 x double> [ %5, %for.body11.i ], [ %23, %for.body22.i ]
  %11 = phi <2 x double> [ %7, %for.body11.i ], [ %26, %for.body22.i ]
  call void @llvm.dbg.value(metadata i32 %Products.0126.i, metadata !387, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata double* %BColumnStart.0117.i, metadata !372, metadata !DIExpression()) #21, !dbg !526
  call void @llvm.dbg.value(metadata double* %ARowStart.2116.i, metadata !371, metadata !DIExpression()) #21, !dbg !513
  %incdec.ptr.i = getelementptr inbounds double, double* %ARowStart.2116.i, i64 1, !dbg !535
  call void @llvm.dbg.value(metadata double* %incdec.ptr.i, metadata !371, metadata !DIExpression()) #21, !dbg !513
  %12 = load double, double* %ARowStart.2116.i, align 8, !dbg !536, !tbaa !73
  call void @llvm.dbg.value(metadata double %12, metadata !388, metadata !DIExpression()) #21, !dbg !537
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !526
  %13 = bitcast double* %BColumnStart.0117.i to <2 x double>*, !dbg !538
  %14 = load <2 x double>, <2 x double>* %13, align 8, !dbg !538, !tbaa !73
  %15 = insertelement <2 x double> poison, double %12, i64 0, !dbg !539
  %16 = shufflevector <2 x double> %15, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !539
  %17 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %16, <2 x double> %14, <2 x double> %8), !dbg !539
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !526
  %add.ptr24.i = getelementptr inbounds double, double* %BColumnStart.0117.i, i64 2, !dbg !540
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !526
  %18 = bitcast double* %add.ptr24.i to <2 x double>*, !dbg !541
  %19 = load <2 x double>, <2 x double>* %18, align 8, !dbg !541, !tbaa !73
  %20 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %16, <2 x double> %19, <2 x double> %9), !dbg !542
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !526
  %add.ptr26.i = getelementptr inbounds double, double* %BColumnStart.0117.i, i64 4, !dbg !543
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !526
  %21 = bitcast double* %add.ptr26.i to <2 x double>*, !dbg !544
  %22 = load <2 x double>, <2 x double>* %21, align 8, !dbg !544, !tbaa !73
  %23 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %16, <2 x double> %22, <2 x double> %10), !dbg !545
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !526
  %add.ptr28.i = getelementptr inbounds double, double* %BColumnStart.0117.i, i64 6, !dbg !546
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !526
  %24 = bitcast double* %add.ptr28.i to <2 x double>*, !dbg !547
  %25 = load <2 x double>, <2 x double>* %24, align 8, !dbg !547, !tbaa !73
  %26 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %16, <2 x double> %25, <2 x double> %11), !dbg !548
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !526
  %27 = ptrtoint double* %BColumnStart.0117.i to i64, !dbg !549
  %add.i = add i64 %27, %conv.i, !dbg !550
  %28 = inttoptr i64 %add.i to double*, !dbg !551
  call void @llvm.dbg.value(metadata double* %28, metadata !372, metadata !DIExpression()) #21, !dbg !526
  %inc.i = add nuw i32 %Products.0126.i, 1, !dbg !552
  call void @llvm.dbg.value(metadata i32 %inc.i, metadata !387, metadata !DIExpression()) #21, !dbg !526
  %exitcond.not.i = icmp eq i32 %inc.i, %shr.lcssa717866, !dbg !553
  br i1 %exitcond.not.i, label %for.cond19.for.end_crit_edge.i, label %for.body22.i, !dbg !534, !llvm.loop !554

for.cond19.for.end_crit_edge.i:                   ; preds = %for.body22.i
  %29 = ptrtoint double* %incdec.ptr.i to i64, !dbg !556
  %sub30.i = sub i64 %29, %conv4.i, !dbg !557
  %30 = inttoptr i64 %sub30.i to double*, !dbg !558
  call void @llvm.dbg.value(metadata double* %30, metadata !371, metadata !DIExpression()) #21, !dbg !513
  store <2 x double> %17, <2 x double>* %0, align 8, !dbg !559, !tbaa !73
  store <2 x double> %20, <2 x double>* %2, align 8, !dbg !560, !tbaa !73
  store <2 x double> %23, <2 x double>* %4, align 8, !dbg !561, !tbaa !73
  store <2 x double> %26, <2 x double>* %6, align 8, !dbg !562, !tbaa !73
  %add.ptr38.i = getelementptr inbounds double, double* %C.addr.1138.i, i64 8, !dbg !563
  call void @llvm.dbg.value(metadata double* %add.ptr38.i, metadata !358, metadata !DIExpression()) #21, !dbg !513
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 8, !dbg !564
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !369, metadata !DIExpression()) #21, !dbg !513
  %cmp9.i = icmp ult i64 %indvars.iv.next.i, %idx.ext.le.pre-phi864, !dbg !565
  br i1 %cmp9.i, label %for.body11.i, label %for.cond8.for.end41_crit_edge.i, !dbg !524, !llvm.loop !566

for.cond8.for.end41_crit_edge.i:                  ; preds = %for.cond19.for.end_crit_edge.i
  %add42.i = add i64 %sub30.i, %conv2.i, !dbg !568
  %31 = inttoptr i64 %add42.i to double*, !dbg !569
  call void @llvm.dbg.value(metadata double* %31, metadata !371, metadata !DIExpression()) #21, !dbg !513
  %32 = ptrtoint double* %add.ptr38.i to i64, !dbg !570
  %add43.i = add i64 %32, %conv6.i, !dbg !571
  %33 = inttoptr i64 %add43.i to double*, !dbg !572
  call void @llvm.dbg.value(metadata double* %33, metadata !358, metadata !DIExpression()) #21, !dbg !513
  %inc45.i = add nuw i32 %Vertical.0142.i, 1, !dbg !573
  call void @llvm.dbg.value(metadata i32 %inc45.i, metadata !370, metadata !DIExpression()) #21, !dbg !513
  %exitcond153.not.i = icmp eq i32 %inc45.i, %shr.lcssa717866, !dbg !522
  br i1 %exitcond153.not.i, label %for.cond8.preheader.i196, label %for.cond8.preheader.i, !dbg !523, !llvm.loop !574

for.cond8.preheader.i196:                         ; preds = %for.cond8.for.end41_crit_edge.i241, %for.cond8.for.end41_crit_edge.i
  %C.addr.0144.i193 = phi double* [ %67, %for.cond8.for.end41_crit_edge.i241 ], [ %add.ptr13.lcssa885, %for.cond8.for.end41_crit_edge.i ]
  %ARowStart.0143.i194 = phi double* [ %65, %for.cond8.for.end41_crit_edge.i241 ], [ %A.tr.lcssa870, %for.cond8.for.end41_crit_edge.i ]
  %Vertical.0142.i195 = phi i32 [ %inc45.i239, %for.cond8.for.end41_crit_edge.i241 ], [ 0, %for.cond8.for.end41_crit_edge.i ]
  call void @llvm.dbg.value(metadata i32 %Vertical.0142.i195, metadata !370, metadata !DIExpression()) #21, !dbg !576
  call void @llvm.dbg.value(metadata double* %C.addr.0144.i193, metadata !358, metadata !DIExpression()) #21, !dbg !576
  call void @llvm.dbg.value(metadata double* %ARowStart.0143.i194, metadata !371, metadata !DIExpression()) #21, !dbg !576
  call void @llvm.dbg.value(metadata i32 0, metadata !369, metadata !DIExpression()) #21, !dbg !576
  br label %for.body11.i208, !dbg !578

for.body11.i208:                                  ; preds = %for.cond19.for.end_crit_edge.i236, %for.cond8.preheader.i196
  %indvars.iv.i197 = phi i64 [ 0, %for.cond8.preheader.i196 ], [ %indvars.iv.next.i234, %for.cond19.for.end_crit_edge.i236 ]
  %C.addr.1138.i198 = phi double* [ %C.addr.0144.i193, %for.cond8.preheader.i196 ], [ %add.ptr38.i233, %for.cond19.for.end_crit_edge.i236 ]
  %ARowStart.1137.i199 = phi double* [ %ARowStart.0143.i194, %for.cond8.preheader.i196 ], [ %64, %for.cond19.for.end_crit_edge.i236 ]
  call void @llvm.dbg.value(metadata double* %C.addr.1138.i198, metadata !358, metadata !DIExpression()) #21, !dbg !576
  call void @llvm.dbg.value(metadata double* %ARowStart.1137.i199, metadata !371, metadata !DIExpression()) #21, !dbg !576
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i197, metadata !369, metadata !DIExpression()) #21, !dbg !576
  %add.ptr.i200 = getelementptr inbounds double, double* %add.ptr6.lcssa879, i64 %indvars.iv.i197, !dbg !579
  call void @llvm.dbg.value(metadata double* %add.ptr.i200, metadata !372, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !580
  %34 = bitcast double* %C.addr.1138.i198 to <2 x double>*, !dbg !581
  %35 = load <2 x double>, <2 x double>* %34, align 8, !dbg !581, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !580
  %add.ptr13.i202 = getelementptr inbounds double, double* %C.addr.1138.i198, i64 2, !dbg !582
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !580
  %36 = bitcast double* %add.ptr13.i202 to <2 x double>*, !dbg !583
  %37 = load <2 x double>, <2 x double>* %36, align 8, !dbg !583, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !580
  %add.ptr15.i204 = getelementptr inbounds double, double* %C.addr.1138.i198, i64 4, !dbg !584
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !580
  %38 = bitcast double* %add.ptr15.i204 to <2 x double>*, !dbg !585
  %39 = load <2 x double>, <2 x double>* %38, align 8, !dbg !585, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !580
  %add.ptr17.i206 = getelementptr inbounds double, double* %C.addr.1138.i198, i64 6, !dbg !586
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !580
  %40 = bitcast double* %add.ptr17.i206 to <2 x double>*, !dbg !587
  %41 = load <2 x double>, <2 x double>* %40, align 8, !dbg !587, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()) #21, !dbg !580
  br label %for.body22.i231, !dbg !588

for.body22.i231:                                  ; preds = %for.body22.i231, %for.body11.i208
  %Products.0126.i209 = phi i32 [ 0, %for.body11.i208 ], [ %inc.i229, %for.body22.i231 ]
  %BColumnStart.0117.i218 = phi double* [ %add.ptr.i200, %for.body11.i208 ], [ %62, %for.body22.i231 ]
  %ARowStart.2116.i219 = phi double* [ %ARowStart.1137.i199, %for.body11.i208 ], [ %incdec.ptr.i220, %for.body22.i231 ]
  %42 = phi <2 x double> [ %35, %for.body11.i208 ], [ %51, %for.body22.i231 ]
  %43 = phi <2 x double> [ %37, %for.body11.i208 ], [ %54, %for.body22.i231 ]
  %44 = phi <2 x double> [ %39, %for.body11.i208 ], [ %57, %for.body22.i231 ]
  %45 = phi <2 x double> [ %41, %for.body11.i208 ], [ %60, %for.body22.i231 ]
  call void @llvm.dbg.value(metadata i32 %Products.0126.i209, metadata !387, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata double* %BColumnStart.0117.i218, metadata !372, metadata !DIExpression()) #21, !dbg !580
  call void @llvm.dbg.value(metadata double* %ARowStart.2116.i219, metadata !371, metadata !DIExpression()) #21, !dbg !576
  %incdec.ptr.i220 = getelementptr inbounds double, double* %ARowStart.2116.i219, i64 1, !dbg !589
  call void @llvm.dbg.value(metadata double* %incdec.ptr.i220, metadata !371, metadata !DIExpression()) #21, !dbg !576
  %46 = load double, double* %ARowStart.2116.i219, align 8, !dbg !590, !tbaa !73
  call void @llvm.dbg.value(metadata double %46, metadata !388, metadata !DIExpression()) #21, !dbg !591
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !580
  %47 = bitcast double* %BColumnStart.0117.i218 to <2 x double>*, !dbg !592
  %48 = load <2 x double>, <2 x double>* %47, align 8, !dbg !592, !tbaa !73
  %49 = insertelement <2 x double> poison, double %46, i64 0, !dbg !593
  %50 = shufflevector <2 x double> %49, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !593
  %51 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %50, <2 x double> %48, <2 x double> %42), !dbg !593
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !580
  %add.ptr24.i222 = getelementptr inbounds double, double* %BColumnStart.0117.i218, i64 2, !dbg !594
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !580
  %52 = bitcast double* %add.ptr24.i222 to <2 x double>*, !dbg !595
  %53 = load <2 x double>, <2 x double>* %52, align 8, !dbg !595, !tbaa !73
  %54 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %50, <2 x double> %53, <2 x double> %43), !dbg !596
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !580
  %add.ptr26.i224 = getelementptr inbounds double, double* %BColumnStart.0117.i218, i64 4, !dbg !597
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !580
  %55 = bitcast double* %add.ptr26.i224 to <2 x double>*, !dbg !598
  %56 = load <2 x double>, <2 x double>* %55, align 8, !dbg !598, !tbaa !73
  %57 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %50, <2 x double> %56, <2 x double> %44), !dbg !599
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !580
  %add.ptr28.i226 = getelementptr inbounds double, double* %BColumnStart.0117.i218, i64 6, !dbg !600
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !580
  %58 = bitcast double* %add.ptr28.i226 to <2 x double>*, !dbg !601
  %59 = load <2 x double>, <2 x double>* %58, align 8, !dbg !601, !tbaa !73
  %60 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %50, <2 x double> %59, <2 x double> %45), !dbg !602
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !580
  %61 = ptrtoint double* %BColumnStart.0117.i218 to i64, !dbg !603
  %add.i228 = add i64 %61, %conv.i, !dbg !604
  %62 = inttoptr i64 %add.i228 to double*, !dbg !605
  call void @llvm.dbg.value(metadata double* %62, metadata !372, metadata !DIExpression()) #21, !dbg !580
  %inc.i229 = add nuw i32 %Products.0126.i209, 1, !dbg !606
  call void @llvm.dbg.value(metadata i32 %inc.i229, metadata !387, metadata !DIExpression()) #21, !dbg !580
  %exitcond.not.i230 = icmp eq i32 %inc.i229, %shr.lcssa717866, !dbg !607
  br i1 %exitcond.not.i230, label %for.cond19.for.end_crit_edge.i236, label %for.body22.i231, !dbg !588, !llvm.loop !608

for.cond19.for.end_crit_edge.i236:                ; preds = %for.body22.i231
  %63 = ptrtoint double* %incdec.ptr.i220 to i64, !dbg !610
  %sub30.i232 = sub i64 %63, %conv4.i, !dbg !611
  %64 = inttoptr i64 %sub30.i232 to double*, !dbg !612
  call void @llvm.dbg.value(metadata double* %64, metadata !371, metadata !DIExpression()) #21, !dbg !576
  store <2 x double> %51, <2 x double>* %34, align 8, !dbg !613, !tbaa !73
  store <2 x double> %54, <2 x double>* %36, align 8, !dbg !614, !tbaa !73
  store <2 x double> %57, <2 x double>* %38, align 8, !dbg !615, !tbaa !73
  store <2 x double> %60, <2 x double>* %40, align 8, !dbg !616, !tbaa !73
  %add.ptr38.i233 = getelementptr inbounds double, double* %C.addr.1138.i198, i64 8, !dbg !617
  call void @llvm.dbg.value(metadata double* %add.ptr38.i233, metadata !358, metadata !DIExpression()) #21, !dbg !576
  %indvars.iv.next.i234 = add nuw nsw i64 %indvars.iv.i197, 8, !dbg !618
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i234, metadata !369, metadata !DIExpression()) #21, !dbg !576
  %cmp9.i235 = icmp ult i64 %indvars.iv.next.i234, %idx.ext.le.pre-phi864, !dbg !619
  br i1 %cmp9.i235, label %for.body11.i208, label %for.cond8.for.end41_crit_edge.i241, !dbg !578, !llvm.loop !620

for.cond8.for.end41_crit_edge.i241:               ; preds = %for.cond19.for.end_crit_edge.i236
  %add42.i237 = add i64 %sub30.i232, %conv2.i, !dbg !622
  %65 = inttoptr i64 %add42.i237 to double*, !dbg !623
  call void @llvm.dbg.value(metadata double* %65, metadata !371, metadata !DIExpression()) #21, !dbg !576
  %66 = ptrtoint double* %add.ptr38.i233 to i64, !dbg !624
  %add43.i238 = add i64 %66, %conv6.i, !dbg !625
  %67 = inttoptr i64 %add43.i238 to double*, !dbg !626
  call void @llvm.dbg.value(metadata double* %67, metadata !358, metadata !DIExpression()) #21, !dbg !576
  %inc45.i239 = add nuw i32 %Vertical.0142.i195, 1, !dbg !627
  call void @llvm.dbg.value(metadata i32 %inc45.i239, metadata !370, metadata !DIExpression()) #21, !dbg !576
  %exitcond153.not.i240 = icmp eq i32 %inc45.i239, %shr.lcssa717866, !dbg !628
  br i1 %exitcond153.not.i240, label %for.cond8.preheader.i257, label %for.cond8.preheader.i196, !dbg !629, !llvm.loop !630

for.cond8.preheader.i257:                         ; preds = %for.cond8.for.end41_crit_edge.i302, %for.cond8.for.end41_crit_edge.i241
  %C.addr.0144.i254 = phi double* [ %101, %for.cond8.for.end41_crit_edge.i302 ], [ %add.ptr18.lcssa889, %for.cond8.for.end41_crit_edge.i241 ]
  %ARowStart.0143.i255 = phi double* [ %99, %for.cond8.for.end41_crit_edge.i302 ], [ %add.ptr2.lcssa876, %for.cond8.for.end41_crit_edge.i241 ]
  %Vertical.0142.i256 = phi i32 [ %inc45.i300, %for.cond8.for.end41_crit_edge.i302 ], [ 0, %for.cond8.for.end41_crit_edge.i241 ]
  call void @llvm.dbg.value(metadata i32 %Vertical.0142.i256, metadata !370, metadata !DIExpression()) #21, !dbg !632
  call void @llvm.dbg.value(metadata double* %C.addr.0144.i254, metadata !358, metadata !DIExpression()) #21, !dbg !632
  call void @llvm.dbg.value(metadata double* %ARowStart.0143.i255, metadata !371, metadata !DIExpression()) #21, !dbg !632
  call void @llvm.dbg.value(metadata i32 0, metadata !369, metadata !DIExpression()) #21, !dbg !632
  br label %for.body11.i269, !dbg !634

for.body11.i269:                                  ; preds = %for.cond19.for.end_crit_edge.i297, %for.cond8.preheader.i257
  %indvars.iv.i258 = phi i64 [ 0, %for.cond8.preheader.i257 ], [ %indvars.iv.next.i295, %for.cond19.for.end_crit_edge.i297 ]
  %C.addr.1138.i259 = phi double* [ %C.addr.0144.i254, %for.cond8.preheader.i257 ], [ %add.ptr38.i294, %for.cond19.for.end_crit_edge.i297 ]
  %ARowStart.1137.i260 = phi double* [ %ARowStart.0143.i255, %for.cond8.preheader.i257 ], [ %98, %for.cond19.for.end_crit_edge.i297 ]
  call void @llvm.dbg.value(metadata double* %C.addr.1138.i259, metadata !358, metadata !DIExpression()) #21, !dbg !632
  call void @llvm.dbg.value(metadata double* %ARowStart.1137.i260, metadata !371, metadata !DIExpression()) #21, !dbg !632
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i258, metadata !369, metadata !DIExpression()) #21, !dbg !632
  %add.ptr.i261 = getelementptr inbounds double, double* %add.ptr6.lcssa879, i64 %indvars.iv.i258, !dbg !635
  call void @llvm.dbg.value(metadata double* %add.ptr.i261, metadata !372, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !636
  %68 = bitcast double* %C.addr.1138.i259 to <2 x double>*, !dbg !637
  %69 = load <2 x double>, <2 x double>* %68, align 8, !dbg !637, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !636
  %add.ptr13.i263 = getelementptr inbounds double, double* %C.addr.1138.i259, i64 2, !dbg !638
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !636
  %70 = bitcast double* %add.ptr13.i263 to <2 x double>*, !dbg !639
  %71 = load <2 x double>, <2 x double>* %70, align 8, !dbg !639, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !636
  %add.ptr15.i265 = getelementptr inbounds double, double* %C.addr.1138.i259, i64 4, !dbg !640
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !636
  %72 = bitcast double* %add.ptr15.i265 to <2 x double>*, !dbg !641
  %73 = load <2 x double>, <2 x double>* %72, align 8, !dbg !641, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !636
  %add.ptr17.i267 = getelementptr inbounds double, double* %C.addr.1138.i259, i64 6, !dbg !642
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !636
  %74 = bitcast double* %add.ptr17.i267 to <2 x double>*, !dbg !643
  %75 = load <2 x double>, <2 x double>* %74, align 8, !dbg !643, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()) #21, !dbg !636
  br label %for.body22.i292, !dbg !644

for.body22.i292:                                  ; preds = %for.body22.i292, %for.body11.i269
  %Products.0126.i270 = phi i32 [ 0, %for.body11.i269 ], [ %inc.i290, %for.body22.i292 ]
  %BColumnStart.0117.i279 = phi double* [ %add.ptr.i261, %for.body11.i269 ], [ %96, %for.body22.i292 ]
  %ARowStart.2116.i280 = phi double* [ %ARowStart.1137.i260, %for.body11.i269 ], [ %incdec.ptr.i281, %for.body22.i292 ]
  %76 = phi <2 x double> [ %69, %for.body11.i269 ], [ %85, %for.body22.i292 ]
  %77 = phi <2 x double> [ %71, %for.body11.i269 ], [ %88, %for.body22.i292 ]
  %78 = phi <2 x double> [ %73, %for.body11.i269 ], [ %91, %for.body22.i292 ]
  %79 = phi <2 x double> [ %75, %for.body11.i269 ], [ %94, %for.body22.i292 ]
  call void @llvm.dbg.value(metadata i32 %Products.0126.i270, metadata !387, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata double* %BColumnStart.0117.i279, metadata !372, metadata !DIExpression()) #21, !dbg !636
  call void @llvm.dbg.value(metadata double* %ARowStart.2116.i280, metadata !371, metadata !DIExpression()) #21, !dbg !632
  %incdec.ptr.i281 = getelementptr inbounds double, double* %ARowStart.2116.i280, i64 1, !dbg !645
  call void @llvm.dbg.value(metadata double* %incdec.ptr.i281, metadata !371, metadata !DIExpression()) #21, !dbg !632
  %80 = load double, double* %ARowStart.2116.i280, align 8, !dbg !646, !tbaa !73
  call void @llvm.dbg.value(metadata double %80, metadata !388, metadata !DIExpression()) #21, !dbg !647
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !636
  %81 = bitcast double* %BColumnStart.0117.i279 to <2 x double>*, !dbg !648
  %82 = load <2 x double>, <2 x double>* %81, align 8, !dbg !648, !tbaa !73
  %83 = insertelement <2 x double> poison, double %80, i64 0, !dbg !649
  %84 = shufflevector <2 x double> %83, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !649
  %85 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %84, <2 x double> %82, <2 x double> %76), !dbg !649
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !636
  %add.ptr24.i283 = getelementptr inbounds double, double* %BColumnStart.0117.i279, i64 2, !dbg !650
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !636
  %86 = bitcast double* %add.ptr24.i283 to <2 x double>*, !dbg !651
  %87 = load <2 x double>, <2 x double>* %86, align 8, !dbg !651, !tbaa !73
  %88 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %84, <2 x double> %87, <2 x double> %77), !dbg !652
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !636
  %add.ptr26.i285 = getelementptr inbounds double, double* %BColumnStart.0117.i279, i64 4, !dbg !653
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !636
  %89 = bitcast double* %add.ptr26.i285 to <2 x double>*, !dbg !654
  %90 = load <2 x double>, <2 x double>* %89, align 8, !dbg !654, !tbaa !73
  %91 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %84, <2 x double> %90, <2 x double> %78), !dbg !655
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !636
  %add.ptr28.i287 = getelementptr inbounds double, double* %BColumnStart.0117.i279, i64 6, !dbg !656
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !636
  %92 = bitcast double* %add.ptr28.i287 to <2 x double>*, !dbg !657
  %93 = load <2 x double>, <2 x double>* %92, align 8, !dbg !657, !tbaa !73
  %94 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %84, <2 x double> %93, <2 x double> %79), !dbg !658
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !636
  %95 = ptrtoint double* %BColumnStart.0117.i279 to i64, !dbg !659
  %add.i289 = add i64 %95, %conv.i, !dbg !660
  %96 = inttoptr i64 %add.i289 to double*, !dbg !661
  call void @llvm.dbg.value(metadata double* %96, metadata !372, metadata !DIExpression()) #21, !dbg !636
  %inc.i290 = add nuw i32 %Products.0126.i270, 1, !dbg !662
  call void @llvm.dbg.value(metadata i32 %inc.i290, metadata !387, metadata !DIExpression()) #21, !dbg !636
  %exitcond.not.i291 = icmp eq i32 %inc.i290, %shr.lcssa717866, !dbg !663
  br i1 %exitcond.not.i291, label %for.cond19.for.end_crit_edge.i297, label %for.body22.i292, !dbg !644, !llvm.loop !664

for.cond19.for.end_crit_edge.i297:                ; preds = %for.body22.i292
  %97 = ptrtoint double* %incdec.ptr.i281 to i64, !dbg !666
  %sub30.i293 = sub i64 %97, %conv4.i, !dbg !667
  %98 = inttoptr i64 %sub30.i293 to double*, !dbg !668
  call void @llvm.dbg.value(metadata double* %98, metadata !371, metadata !DIExpression()) #21, !dbg !632
  store <2 x double> %85, <2 x double>* %68, align 8, !dbg !669, !tbaa !73
  store <2 x double> %88, <2 x double>* %70, align 8, !dbg !670, !tbaa !73
  store <2 x double> %91, <2 x double>* %72, align 8, !dbg !671, !tbaa !73
  store <2 x double> %94, <2 x double>* %74, align 8, !dbg !672, !tbaa !73
  %add.ptr38.i294 = getelementptr inbounds double, double* %C.addr.1138.i259, i64 8, !dbg !673
  call void @llvm.dbg.value(metadata double* %add.ptr38.i294, metadata !358, metadata !DIExpression()) #21, !dbg !632
  %indvars.iv.next.i295 = add nuw nsw i64 %indvars.iv.i258, 8, !dbg !674
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i295, metadata !369, metadata !DIExpression()) #21, !dbg !632
  %cmp9.i296 = icmp ult i64 %indvars.iv.next.i295, %idx.ext.le.pre-phi864, !dbg !675
  br i1 %cmp9.i296, label %for.body11.i269, label %for.cond8.for.end41_crit_edge.i302, !dbg !634, !llvm.loop !676

for.cond8.for.end41_crit_edge.i302:               ; preds = %for.cond19.for.end_crit_edge.i297
  %add42.i298 = add i64 %sub30.i293, %conv2.i, !dbg !678
  %99 = inttoptr i64 %add42.i298 to double*, !dbg !679
  call void @llvm.dbg.value(metadata double* %99, metadata !371, metadata !DIExpression()) #21, !dbg !632
  %100 = ptrtoint double* %add.ptr38.i294 to i64, !dbg !680
  %add43.i299 = add i64 %100, %conv6.i, !dbg !681
  %101 = inttoptr i64 %add43.i299 to double*, !dbg !682
  call void @llvm.dbg.value(metadata double* %101, metadata !358, metadata !DIExpression()) #21, !dbg !632
  %inc45.i300 = add nuw i32 %Vertical.0142.i256, 1, !dbg !683
  call void @llvm.dbg.value(metadata i32 %inc45.i300, metadata !370, metadata !DIExpression()) #21, !dbg !632
  %exitcond153.not.i301 = icmp eq i32 %inc45.i300, %shr.lcssa717866, !dbg !684
  br i1 %exitcond153.not.i301, label %for.cond8.preheader.i318, label %for.cond8.preheader.i257, !dbg !685, !llvm.loop !686

for.cond8.preheader.i318:                         ; preds = %for.cond8.for.end41_crit_edge.i363, %for.cond8.for.end41_crit_edge.i302
  %C.addr.0144.i315 = phi double* [ %135, %for.cond8.for.end41_crit_edge.i363 ], [ %add.ptr16.lcssa887, %for.cond8.for.end41_crit_edge.i302 ]
  %ARowStart.0143.i316 = phi double* [ %133, %for.cond8.for.end41_crit_edge.i363 ], [ %add.ptr2.lcssa876, %for.cond8.for.end41_crit_edge.i302 ]
  %Vertical.0142.i317 = phi i32 [ %inc45.i361, %for.cond8.for.end41_crit_edge.i363 ], [ 0, %for.cond8.for.end41_crit_edge.i302 ]
  call void @llvm.dbg.value(metadata i32 %Vertical.0142.i317, metadata !370, metadata !DIExpression()) #21, !dbg !688
  call void @llvm.dbg.value(metadata double* %C.addr.0144.i315, metadata !358, metadata !DIExpression()) #21, !dbg !688
  call void @llvm.dbg.value(metadata double* %ARowStart.0143.i316, metadata !371, metadata !DIExpression()) #21, !dbg !688
  call void @llvm.dbg.value(metadata i32 0, metadata !369, metadata !DIExpression()) #21, !dbg !688
  br label %for.body11.i330, !dbg !690

for.body11.i330:                                  ; preds = %for.cond19.for.end_crit_edge.i358, %for.cond8.preheader.i318
  %indvars.iv.i319 = phi i64 [ 0, %for.cond8.preheader.i318 ], [ %indvars.iv.next.i356, %for.cond19.for.end_crit_edge.i358 ]
  %C.addr.1138.i320 = phi double* [ %C.addr.0144.i315, %for.cond8.preheader.i318 ], [ %add.ptr38.i355, %for.cond19.for.end_crit_edge.i358 ]
  %ARowStart.1137.i321 = phi double* [ %ARowStart.0143.i316, %for.cond8.preheader.i318 ], [ %132, %for.cond19.for.end_crit_edge.i358 ]
  call void @llvm.dbg.value(metadata double* %C.addr.1138.i320, metadata !358, metadata !DIExpression()) #21, !dbg !688
  call void @llvm.dbg.value(metadata double* %ARowStart.1137.i321, metadata !371, metadata !DIExpression()) #21, !dbg !688
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i319, metadata !369, metadata !DIExpression()) #21, !dbg !688
  %add.ptr.i322 = getelementptr inbounds double, double* %B.tr.lcssa871, i64 %indvars.iv.i319, !dbg !691
  call void @llvm.dbg.value(metadata double* %add.ptr.i322, metadata !372, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !692
  %102 = bitcast double* %C.addr.1138.i320 to <2 x double>*, !dbg !693
  %103 = load <2 x double>, <2 x double>* %102, align 8, !dbg !693, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !692
  %add.ptr13.i324 = getelementptr inbounds double, double* %C.addr.1138.i320, i64 2, !dbg !694
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !692
  %104 = bitcast double* %add.ptr13.i324 to <2 x double>*, !dbg !695
  %105 = load <2 x double>, <2 x double>* %104, align 8, !dbg !695, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !692
  %add.ptr15.i326 = getelementptr inbounds double, double* %C.addr.1138.i320, i64 4, !dbg !696
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !692
  %106 = bitcast double* %add.ptr15.i326 to <2 x double>*, !dbg !697
  %107 = load <2 x double>, <2 x double>* %106, align 8, !dbg !697, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !692
  %add.ptr17.i328 = getelementptr inbounds double, double* %C.addr.1138.i320, i64 6, !dbg !698
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !692
  %108 = bitcast double* %add.ptr17.i328 to <2 x double>*, !dbg !699
  %109 = load <2 x double>, <2 x double>* %108, align 8, !dbg !699, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()) #21, !dbg !692
  br label %for.body22.i353, !dbg !700

for.body22.i353:                                  ; preds = %for.body22.i353, %for.body11.i330
  %Products.0126.i331 = phi i32 [ 0, %for.body11.i330 ], [ %inc.i351, %for.body22.i353 ]
  %BColumnStart.0117.i340 = phi double* [ %add.ptr.i322, %for.body11.i330 ], [ %130, %for.body22.i353 ]
  %ARowStart.2116.i341 = phi double* [ %ARowStart.1137.i321, %for.body11.i330 ], [ %incdec.ptr.i342, %for.body22.i353 ]
  %110 = phi <2 x double> [ %103, %for.body11.i330 ], [ %119, %for.body22.i353 ]
  %111 = phi <2 x double> [ %105, %for.body11.i330 ], [ %122, %for.body22.i353 ]
  %112 = phi <2 x double> [ %107, %for.body11.i330 ], [ %125, %for.body22.i353 ]
  %113 = phi <2 x double> [ %109, %for.body11.i330 ], [ %128, %for.body22.i353 ]
  call void @llvm.dbg.value(metadata i32 %Products.0126.i331, metadata !387, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata double* %BColumnStart.0117.i340, metadata !372, metadata !DIExpression()) #21, !dbg !692
  call void @llvm.dbg.value(metadata double* %ARowStart.2116.i341, metadata !371, metadata !DIExpression()) #21, !dbg !688
  %incdec.ptr.i342 = getelementptr inbounds double, double* %ARowStart.2116.i341, i64 1, !dbg !701
  call void @llvm.dbg.value(metadata double* %incdec.ptr.i342, metadata !371, metadata !DIExpression()) #21, !dbg !688
  %114 = load double, double* %ARowStart.2116.i341, align 8, !dbg !702, !tbaa !73
  call void @llvm.dbg.value(metadata double %114, metadata !388, metadata !DIExpression()) #21, !dbg !703
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !692
  %115 = bitcast double* %BColumnStart.0117.i340 to <2 x double>*, !dbg !704
  %116 = load <2 x double>, <2 x double>* %115, align 8, !dbg !704, !tbaa !73
  %117 = insertelement <2 x double> poison, double %114, i64 0, !dbg !705
  %118 = shufflevector <2 x double> %117, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !705
  %119 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %118, <2 x double> %116, <2 x double> %110), !dbg !705
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !692
  %add.ptr24.i344 = getelementptr inbounds double, double* %BColumnStart.0117.i340, i64 2, !dbg !706
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !692
  %120 = bitcast double* %add.ptr24.i344 to <2 x double>*, !dbg !707
  %121 = load <2 x double>, <2 x double>* %120, align 8, !dbg !707, !tbaa !73
  %122 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %118, <2 x double> %121, <2 x double> %111), !dbg !708
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !692
  %add.ptr26.i346 = getelementptr inbounds double, double* %BColumnStart.0117.i340, i64 4, !dbg !709
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !692
  %123 = bitcast double* %add.ptr26.i346 to <2 x double>*, !dbg !710
  %124 = load <2 x double>, <2 x double>* %123, align 8, !dbg !710, !tbaa !73
  %125 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %118, <2 x double> %124, <2 x double> %112), !dbg !711
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !692
  %add.ptr28.i348 = getelementptr inbounds double, double* %BColumnStart.0117.i340, i64 6, !dbg !712
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !692
  %126 = bitcast double* %add.ptr28.i348 to <2 x double>*, !dbg !713
  %127 = load <2 x double>, <2 x double>* %126, align 8, !dbg !713, !tbaa !73
  %128 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %118, <2 x double> %127, <2 x double> %113), !dbg !714
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !692
  %129 = ptrtoint double* %BColumnStart.0117.i340 to i64, !dbg !715
  %add.i350 = add i64 %129, %conv.i, !dbg !716
  %130 = inttoptr i64 %add.i350 to double*, !dbg !717
  call void @llvm.dbg.value(metadata double* %130, metadata !372, metadata !DIExpression()) #21, !dbg !692
  %inc.i351 = add nuw i32 %Products.0126.i331, 1, !dbg !718
  call void @llvm.dbg.value(metadata i32 %inc.i351, metadata !387, metadata !DIExpression()) #21, !dbg !692
  %exitcond.not.i352 = icmp eq i32 %inc.i351, %shr.lcssa717866, !dbg !719
  br i1 %exitcond.not.i352, label %for.cond19.for.end_crit_edge.i358, label %for.body22.i353, !dbg !700, !llvm.loop !720

for.cond19.for.end_crit_edge.i358:                ; preds = %for.body22.i353
  %131 = ptrtoint double* %incdec.ptr.i342 to i64, !dbg !722
  %sub30.i354 = sub i64 %131, %conv4.i, !dbg !723
  %132 = inttoptr i64 %sub30.i354 to double*, !dbg !724
  call void @llvm.dbg.value(metadata double* %132, metadata !371, metadata !DIExpression()) #21, !dbg !688
  store <2 x double> %119, <2 x double>* %102, align 8, !dbg !725, !tbaa !73
  store <2 x double> %122, <2 x double>* %104, align 8, !dbg !726, !tbaa !73
  store <2 x double> %125, <2 x double>* %106, align 8, !dbg !727, !tbaa !73
  store <2 x double> %128, <2 x double>* %108, align 8, !dbg !728, !tbaa !73
  %add.ptr38.i355 = getelementptr inbounds double, double* %C.addr.1138.i320, i64 8, !dbg !729
  call void @llvm.dbg.value(metadata double* %add.ptr38.i355, metadata !358, metadata !DIExpression()) #21, !dbg !688
  %indvars.iv.next.i356 = add nuw nsw i64 %indvars.iv.i319, 8, !dbg !730
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i356, metadata !369, metadata !DIExpression()) #21, !dbg !688
  %cmp9.i357 = icmp ult i64 %indvars.iv.next.i356, %idx.ext.le.pre-phi864, !dbg !731
  br i1 %cmp9.i357, label %for.body11.i330, label %for.cond8.for.end41_crit_edge.i363, !dbg !690, !llvm.loop !732

for.cond8.for.end41_crit_edge.i363:               ; preds = %for.cond19.for.end_crit_edge.i358
  %add42.i359 = add i64 %sub30.i354, %conv2.i, !dbg !734
  %133 = inttoptr i64 %add42.i359 to double*, !dbg !735
  call void @llvm.dbg.value(metadata double* %133, metadata !371, metadata !DIExpression()) #21, !dbg !688
  %134 = ptrtoint double* %add.ptr38.i355 to i64, !dbg !736
  %add43.i360 = add i64 %134, %conv6.i, !dbg !737
  %135 = inttoptr i64 %add43.i360 to double*, !dbg !738
  call void @llvm.dbg.value(metadata double* %135, metadata !358, metadata !DIExpression()) #21, !dbg !688
  %inc45.i361 = add nuw i32 %Vertical.0142.i317, 1, !dbg !739
  call void @llvm.dbg.value(metadata i32 %inc45.i361, metadata !370, metadata !DIExpression()) #21, !dbg !688
  %exitcond153.not.i362 = icmp eq i32 %inc45.i361, %shr.lcssa717866, !dbg !740
  br i1 %exitcond153.not.i362, label %if.end, label %for.cond8.preheader.i318, !dbg !741, !llvm.loop !742

if.else20:                                        ; preds = %if.else
  tail call void @FastNaiveMatrixMultiply(double* noundef %C, double* noundef %A, double* noundef %B, i32 noundef %shr718, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB), !dbg !744
  tail call void @FastNaiveMatrixMultiply(double* noundef %add.ptr13730, double* noundef %A, double* noundef %add.ptr6725, i32 noundef %shr718, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB), !dbg !746
  tail call void @FastNaiveMatrixMultiply(double* noundef %add.ptr18734, double* noundef %add.ptr2723, double* noundef %add.ptr6725, i32 noundef %shr718, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB), !dbg !747
  tail call void @FastNaiveMatrixMultiply(double* noundef %add.ptr16733, double* noundef %add.ptr2723, double* noundef %B, i32 noundef %shr718, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB), !dbg !748
  %.pre838 = shl i32 %RowWidthB, 3, !dbg !749
  %.pre839 = zext i32 %.pre838 to i64, !dbg !751
  %.pre840 = shl i32 %RowWidthA, 3, !dbg !752
  %.pre841 = zext i32 %.pre840 to i64, !dbg !753
  %.pre842 = shl i32 %shr718, 3, !dbg !754
  %.pre843 = zext i32 %.pre842 to i64, !dbg !755
  %.pre844 = sub i32 %RowWidthC, %shr718, !dbg !756
  %.pre845 = shl i32 %.pre844, 3, !dbg !757
  %.pre846 = zext i32 %.pre845 to i64, !dbg !758
  br label %if.end

if.end:                                           ; preds = %if.else20, %for.cond8.for.end41_crit_edge.i363
  %add.ptr18.lcssa888 = phi double* [ %add.ptr18734, %if.else20 ], [ %add.ptr18.lcssa889, %for.cond8.for.end41_crit_edge.i363 ]
  %add.ptr16.lcssa886 = phi double* [ %add.ptr16733, %if.else20 ], [ %add.ptr16.lcssa887, %for.cond8.for.end41_crit_edge.i363 ]
  %add.ptr13.lcssa884 = phi double* [ %add.ptr13730, %if.else20 ], [ %add.ptr13.lcssa885, %for.cond8.for.end41_crit_edge.i363 ]
  %add.ptr11.lcssa882 = phi double* [ %add.ptr11729, %if.else20 ], [ %add.ptr11.lcssa883, %for.cond8.for.end41_crit_edge.i363 ]
  %add.ptr9.lcssa880 = phi double* [ %add.ptr9728, %if.else20 ], [ %add.ptr9.lcssa881, %for.cond8.for.end41_crit_edge.i363 ]
  %add.ptr4.lcssa877 = phi double* [ %add.ptr4724, %if.else20 ], [ %add.ptr4.lcssa878, %for.cond8.for.end41_crit_edge.i363 ]
  %add.ptr.lcssa874 = phi double* [ %add.ptr720, %if.else20 ], [ %add.ptr.lcssa875, %for.cond8.for.end41_crit_edge.i363 ]
  %MatrixSize.tr.lcssa873 = phi i32 [ %MatrixSize, %if.else20 ], [ %MatrixSize.tr.lcssa872, %for.cond8.for.end41_crit_edge.i363 ]
  %C.tr.lcssa868 = phi double* [ %C, %if.else20 ], [ %C.tr.lcssa869, %for.cond8.for.end41_crit_edge.i363 ]
  %shr.lcssa717867 = phi i32 [ %shr718, %if.else20 ], [ %shr.lcssa717866, %for.cond8.for.end41_crit_edge.i363 ]
  %idx.ext.le.pre-phi865 = phi i64 [ %idx.ext719, %if.else20 ], [ %idx.ext.le.pre-phi864, %for.cond8.for.end41_crit_edge.i363 ]
  %conv6.i373.pre-phi = phi i64 [ %.pre846, %if.else20 ], [ %conv6.i, %for.cond8.for.end41_crit_edge.i363 ], !dbg !758
  %conv4.i370.pre-phi = phi i64 [ %.pre843, %if.else20 ], [ %conv4.i, %for.cond8.for.end41_crit_edge.i363 ], !dbg !755
  %conv2.i368.pre-phi = phi i64 [ %.pre841, %if.else20 ], [ %conv2.i, %for.cond8.for.end41_crit_edge.i363 ], !dbg !753
  %conv.i366.pre-phi = phi i64 [ %.pre839, %if.else20 ], [ %conv.i, %for.cond8.for.end41_crit_edge.i363 ], !dbg !751
  call void @llvm.dbg.value(metadata double* %C, metadata !358, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata double* %add.ptr720, metadata !359, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata double* %add.ptr9728, metadata !360, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata i32 %shr718, metadata !361, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata i32 %RowWidthC, metadata !362, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata i32 %RowWidthA, metadata !363, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata i32 %RowWidthB, metadata !364, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata i64 %conv.i366.pre-phi, metadata !365, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata i64 %conv2.i368.pre-phi, metadata !366, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata i64 %conv4.i370.pre-phi, metadata !367, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata i64 %conv6.i373.pre-phi, metadata !368, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata double* %add.ptr720, metadata !371, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata i32 0, metadata !370, metadata !DIExpression()) #21, !dbg !759
  %cmp141.not.i374 = icmp ult i32 %MatrixSize.tr.lcssa873, 2, !dbg !760
  br i1 %cmp141.not.i374, label %if.end21, label %for.cond8.preheader.i379, !dbg !761

for.cond8.preheader.i379:                         ; preds = %for.cond8.for.end41_crit_edge.i424, %if.end
  %C.addr.0144.i376 = phi double* [ %169, %for.cond8.for.end41_crit_edge.i424 ], [ %C.tr.lcssa868, %if.end ]
  %ARowStart.0143.i377 = phi double* [ %167, %for.cond8.for.end41_crit_edge.i424 ], [ %add.ptr.lcssa874, %if.end ]
  %Vertical.0142.i378 = phi i32 [ %inc45.i422, %for.cond8.for.end41_crit_edge.i424 ], [ 0, %if.end ]
  call void @llvm.dbg.value(metadata i32 %Vertical.0142.i378, metadata !370, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata double* %C.addr.0144.i376, metadata !358, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata double* %ARowStart.0143.i377, metadata !371, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata i32 0, metadata !369, metadata !DIExpression()) #21, !dbg !759
  br label %for.body11.i391, !dbg !762

for.body11.i391:                                  ; preds = %for.cond19.for.end_crit_edge.i419, %for.cond8.preheader.i379
  %indvars.iv.i380 = phi i64 [ 0, %for.cond8.preheader.i379 ], [ %indvars.iv.next.i417, %for.cond19.for.end_crit_edge.i419 ]
  %C.addr.1138.i381 = phi double* [ %C.addr.0144.i376, %for.cond8.preheader.i379 ], [ %add.ptr38.i416, %for.cond19.for.end_crit_edge.i419 ]
  %ARowStart.1137.i382 = phi double* [ %ARowStart.0143.i377, %for.cond8.preheader.i379 ], [ %166, %for.cond19.for.end_crit_edge.i419 ]
  call void @llvm.dbg.value(metadata double* %C.addr.1138.i381, metadata !358, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata double* %ARowStart.1137.i382, metadata !371, metadata !DIExpression()) #21, !dbg !759
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i380, metadata !369, metadata !DIExpression()) #21, !dbg !759
  %add.ptr.i383 = getelementptr inbounds double, double* %add.ptr9.lcssa880, i64 %indvars.iv.i380, !dbg !763
  call void @llvm.dbg.value(metadata double* %add.ptr.i383, metadata !372, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !764
  %136 = bitcast double* %C.addr.1138.i381 to <2 x double>*, !dbg !765
  %137 = load <2 x double>, <2 x double>* %136, align 8, !dbg !765, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !764
  %add.ptr13.i385 = getelementptr inbounds double, double* %C.addr.1138.i381, i64 2, !dbg !766
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !764
  %138 = bitcast double* %add.ptr13.i385 to <2 x double>*, !dbg !767
  %139 = load <2 x double>, <2 x double>* %138, align 8, !dbg !767, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !764
  %add.ptr15.i387 = getelementptr inbounds double, double* %C.addr.1138.i381, i64 4, !dbg !768
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !764
  %140 = bitcast double* %add.ptr15.i387 to <2 x double>*, !dbg !769
  %141 = load <2 x double>, <2 x double>* %140, align 8, !dbg !769, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !764
  %add.ptr17.i389 = getelementptr inbounds double, double* %C.addr.1138.i381, i64 6, !dbg !770
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !764
  %142 = bitcast double* %add.ptr17.i389 to <2 x double>*, !dbg !771
  %143 = load <2 x double>, <2 x double>* %142, align 8, !dbg !771, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()) #21, !dbg !764
  br label %for.body22.i414, !dbg !772

for.body22.i414:                                  ; preds = %for.body22.i414, %for.body11.i391
  %Products.0126.i392 = phi i32 [ 0, %for.body11.i391 ], [ %inc.i412, %for.body22.i414 ]
  %BColumnStart.0117.i401 = phi double* [ %add.ptr.i383, %for.body11.i391 ], [ %164, %for.body22.i414 ]
  %ARowStart.2116.i402 = phi double* [ %ARowStart.1137.i382, %for.body11.i391 ], [ %incdec.ptr.i403, %for.body22.i414 ]
  %144 = phi <2 x double> [ %137, %for.body11.i391 ], [ %153, %for.body22.i414 ]
  %145 = phi <2 x double> [ %139, %for.body11.i391 ], [ %156, %for.body22.i414 ]
  %146 = phi <2 x double> [ %141, %for.body11.i391 ], [ %159, %for.body22.i414 ]
  %147 = phi <2 x double> [ %143, %for.body11.i391 ], [ %162, %for.body22.i414 ]
  call void @llvm.dbg.value(metadata i32 %Products.0126.i392, metadata !387, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata double* %BColumnStart.0117.i401, metadata !372, metadata !DIExpression()) #21, !dbg !764
  call void @llvm.dbg.value(metadata double* %ARowStart.2116.i402, metadata !371, metadata !DIExpression()) #21, !dbg !759
  %incdec.ptr.i403 = getelementptr inbounds double, double* %ARowStart.2116.i402, i64 1, !dbg !773
  call void @llvm.dbg.value(metadata double* %incdec.ptr.i403, metadata !371, metadata !DIExpression()) #21, !dbg !759
  %148 = load double, double* %ARowStart.2116.i402, align 8, !dbg !774, !tbaa !73
  call void @llvm.dbg.value(metadata double %148, metadata !388, metadata !DIExpression()) #21, !dbg !775
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !764
  %149 = bitcast double* %BColumnStart.0117.i401 to <2 x double>*, !dbg !776
  %150 = load <2 x double>, <2 x double>* %149, align 8, !dbg !776, !tbaa !73
  %151 = insertelement <2 x double> poison, double %148, i64 0, !dbg !777
  %152 = shufflevector <2 x double> %151, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !777
  %153 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %152, <2 x double> %150, <2 x double> %144), !dbg !777
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !764
  %add.ptr24.i405 = getelementptr inbounds double, double* %BColumnStart.0117.i401, i64 2, !dbg !778
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !764
  %154 = bitcast double* %add.ptr24.i405 to <2 x double>*, !dbg !779
  %155 = load <2 x double>, <2 x double>* %154, align 8, !dbg !779, !tbaa !73
  %156 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %152, <2 x double> %155, <2 x double> %145), !dbg !780
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !764
  %add.ptr26.i407 = getelementptr inbounds double, double* %BColumnStart.0117.i401, i64 4, !dbg !781
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !764
  %157 = bitcast double* %add.ptr26.i407 to <2 x double>*, !dbg !782
  %158 = load <2 x double>, <2 x double>* %157, align 8, !dbg !782, !tbaa !73
  %159 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %152, <2 x double> %158, <2 x double> %146), !dbg !783
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !764
  %add.ptr28.i409 = getelementptr inbounds double, double* %BColumnStart.0117.i401, i64 6, !dbg !784
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !764
  %160 = bitcast double* %add.ptr28.i409 to <2 x double>*, !dbg !785
  %161 = load <2 x double>, <2 x double>* %160, align 8, !dbg !785, !tbaa !73
  %162 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %152, <2 x double> %161, <2 x double> %147), !dbg !786
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !764
  %163 = ptrtoint double* %BColumnStart.0117.i401 to i64, !dbg !787
  %add.i411 = add i64 %conv.i366.pre-phi, %163, !dbg !788
  %164 = inttoptr i64 %add.i411 to double*, !dbg !789
  call void @llvm.dbg.value(metadata double* %164, metadata !372, metadata !DIExpression()) #21, !dbg !764
  %inc.i412 = add nuw i32 %Products.0126.i392, 1, !dbg !790
  call void @llvm.dbg.value(metadata i32 %inc.i412, metadata !387, metadata !DIExpression()) #21, !dbg !764
  %exitcond.not.i413 = icmp eq i32 %inc.i412, %shr.lcssa717867, !dbg !791
  br i1 %exitcond.not.i413, label %for.cond19.for.end_crit_edge.i419, label %for.body22.i414, !dbg !772, !llvm.loop !792

for.cond19.for.end_crit_edge.i419:                ; preds = %for.body22.i414
  %165 = ptrtoint double* %incdec.ptr.i403 to i64, !dbg !794
  %sub30.i415 = sub i64 %165, %conv4.i370.pre-phi, !dbg !795
  %166 = inttoptr i64 %sub30.i415 to double*, !dbg !796
  call void @llvm.dbg.value(metadata double* %166, metadata !371, metadata !DIExpression()) #21, !dbg !759
  store <2 x double> %153, <2 x double>* %136, align 8, !dbg !797, !tbaa !73
  store <2 x double> %156, <2 x double>* %138, align 8, !dbg !798, !tbaa !73
  store <2 x double> %159, <2 x double>* %140, align 8, !dbg !799, !tbaa !73
  store <2 x double> %162, <2 x double>* %142, align 8, !dbg !800, !tbaa !73
  %add.ptr38.i416 = getelementptr inbounds double, double* %C.addr.1138.i381, i64 8, !dbg !801
  call void @llvm.dbg.value(metadata double* %add.ptr38.i416, metadata !358, metadata !DIExpression()) #21, !dbg !759
  %indvars.iv.next.i417 = add nuw nsw i64 %indvars.iv.i380, 8, !dbg !802
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i417, metadata !369, metadata !DIExpression()) #21, !dbg !759
  %cmp9.i418 = icmp ult i64 %indvars.iv.next.i417, %idx.ext.le.pre-phi865, !dbg !803
  br i1 %cmp9.i418, label %for.body11.i391, label %for.cond8.for.end41_crit_edge.i424, !dbg !762, !llvm.loop !804

for.cond8.for.end41_crit_edge.i424:               ; preds = %for.cond19.for.end_crit_edge.i419
  %add42.i420 = add i64 %sub30.i415, %conv2.i368.pre-phi, !dbg !806
  %167 = inttoptr i64 %add42.i420 to double*, !dbg !807
  call void @llvm.dbg.value(metadata double* %167, metadata !371, metadata !DIExpression()) #21, !dbg !759
  %168 = ptrtoint double* %add.ptr38.i416 to i64, !dbg !808
  %add43.i421 = add i64 %conv6.i373.pre-phi, %168, !dbg !809
  %169 = inttoptr i64 %add43.i421 to double*, !dbg !810
  call void @llvm.dbg.value(metadata double* %169, metadata !358, metadata !DIExpression()) #21, !dbg !759
  %inc45.i422 = add nuw i32 %Vertical.0142.i378, 1, !dbg !811
  call void @llvm.dbg.value(metadata i32 %inc45.i422, metadata !370, metadata !DIExpression()) #21, !dbg !759
  %exitcond153.not.i423 = icmp eq i32 %inc45.i422, %shr.lcssa717867, !dbg !760
  br i1 %exitcond153.not.i423, label %for.cond8.preheader.i440, label %for.cond8.preheader.i379, !dbg !761, !llvm.loop !812

for.cond8.preheader.i440:                         ; preds = %for.cond8.for.end41_crit_edge.i485, %for.cond8.for.end41_crit_edge.i424
  %C.addr.0144.i437 = phi double* [ %203, %for.cond8.for.end41_crit_edge.i485 ], [ %add.ptr13.lcssa884, %for.cond8.for.end41_crit_edge.i424 ]
  %ARowStart.0143.i438 = phi double* [ %201, %for.cond8.for.end41_crit_edge.i485 ], [ %add.ptr.lcssa874, %for.cond8.for.end41_crit_edge.i424 ]
  %Vertical.0142.i439 = phi i32 [ %inc45.i483, %for.cond8.for.end41_crit_edge.i485 ], [ 0, %for.cond8.for.end41_crit_edge.i424 ]
  call void @llvm.dbg.value(metadata i32 %Vertical.0142.i439, metadata !370, metadata !DIExpression()) #21, !dbg !814
  call void @llvm.dbg.value(metadata double* %C.addr.0144.i437, metadata !358, metadata !DIExpression()) #21, !dbg !814
  call void @llvm.dbg.value(metadata double* %ARowStart.0143.i438, metadata !371, metadata !DIExpression()) #21, !dbg !814
  call void @llvm.dbg.value(metadata i32 0, metadata !369, metadata !DIExpression()) #21, !dbg !814
  br label %for.body11.i452, !dbg !816

for.body11.i452:                                  ; preds = %for.cond19.for.end_crit_edge.i480, %for.cond8.preheader.i440
  %indvars.iv.i441 = phi i64 [ 0, %for.cond8.preheader.i440 ], [ %indvars.iv.next.i478, %for.cond19.for.end_crit_edge.i480 ]
  %C.addr.1138.i442 = phi double* [ %C.addr.0144.i437, %for.cond8.preheader.i440 ], [ %add.ptr38.i477, %for.cond19.for.end_crit_edge.i480 ]
  %ARowStart.1137.i443 = phi double* [ %ARowStart.0143.i438, %for.cond8.preheader.i440 ], [ %200, %for.cond19.for.end_crit_edge.i480 ]
  call void @llvm.dbg.value(metadata double* %C.addr.1138.i442, metadata !358, metadata !DIExpression()) #21, !dbg !814
  call void @llvm.dbg.value(metadata double* %ARowStart.1137.i443, metadata !371, metadata !DIExpression()) #21, !dbg !814
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i441, metadata !369, metadata !DIExpression()) #21, !dbg !814
  %add.ptr.i444 = getelementptr inbounds double, double* %add.ptr11.lcssa882, i64 %indvars.iv.i441, !dbg !817
  call void @llvm.dbg.value(metadata double* %add.ptr.i444, metadata !372, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !818
  %170 = bitcast double* %C.addr.1138.i442 to <2 x double>*, !dbg !819
  %171 = load <2 x double>, <2 x double>* %170, align 8, !dbg !819, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !818
  %add.ptr13.i446 = getelementptr inbounds double, double* %C.addr.1138.i442, i64 2, !dbg !820
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !818
  %172 = bitcast double* %add.ptr13.i446 to <2 x double>*, !dbg !821
  %173 = load <2 x double>, <2 x double>* %172, align 8, !dbg !821, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !818
  %add.ptr15.i448 = getelementptr inbounds double, double* %C.addr.1138.i442, i64 4, !dbg !822
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !818
  %174 = bitcast double* %add.ptr15.i448 to <2 x double>*, !dbg !823
  %175 = load <2 x double>, <2 x double>* %174, align 8, !dbg !823, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !818
  %add.ptr17.i450 = getelementptr inbounds double, double* %C.addr.1138.i442, i64 6, !dbg !824
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !818
  %176 = bitcast double* %add.ptr17.i450 to <2 x double>*, !dbg !825
  %177 = load <2 x double>, <2 x double>* %176, align 8, !dbg !825, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()) #21, !dbg !818
  br label %for.body22.i475, !dbg !826

for.body22.i475:                                  ; preds = %for.body22.i475, %for.body11.i452
  %Products.0126.i453 = phi i32 [ 0, %for.body11.i452 ], [ %inc.i473, %for.body22.i475 ]
  %BColumnStart.0117.i462 = phi double* [ %add.ptr.i444, %for.body11.i452 ], [ %198, %for.body22.i475 ]
  %ARowStart.2116.i463 = phi double* [ %ARowStart.1137.i443, %for.body11.i452 ], [ %incdec.ptr.i464, %for.body22.i475 ]
  %178 = phi <2 x double> [ %171, %for.body11.i452 ], [ %187, %for.body22.i475 ]
  %179 = phi <2 x double> [ %173, %for.body11.i452 ], [ %190, %for.body22.i475 ]
  %180 = phi <2 x double> [ %175, %for.body11.i452 ], [ %193, %for.body22.i475 ]
  %181 = phi <2 x double> [ %177, %for.body11.i452 ], [ %196, %for.body22.i475 ]
  call void @llvm.dbg.value(metadata i32 %Products.0126.i453, metadata !387, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata double* %BColumnStart.0117.i462, metadata !372, metadata !DIExpression()) #21, !dbg !818
  call void @llvm.dbg.value(metadata double* %ARowStart.2116.i463, metadata !371, metadata !DIExpression()) #21, !dbg !814
  %incdec.ptr.i464 = getelementptr inbounds double, double* %ARowStart.2116.i463, i64 1, !dbg !827
  call void @llvm.dbg.value(metadata double* %incdec.ptr.i464, metadata !371, metadata !DIExpression()) #21, !dbg !814
  %182 = load double, double* %ARowStart.2116.i463, align 8, !dbg !828, !tbaa !73
  call void @llvm.dbg.value(metadata double %182, metadata !388, metadata !DIExpression()) #21, !dbg !829
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !818
  %183 = bitcast double* %BColumnStart.0117.i462 to <2 x double>*, !dbg !830
  %184 = load <2 x double>, <2 x double>* %183, align 8, !dbg !830, !tbaa !73
  %185 = insertelement <2 x double> poison, double %182, i64 0, !dbg !831
  %186 = shufflevector <2 x double> %185, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !831
  %187 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %186, <2 x double> %184, <2 x double> %178), !dbg !831
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !818
  %add.ptr24.i466 = getelementptr inbounds double, double* %BColumnStart.0117.i462, i64 2, !dbg !832
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !818
  %188 = bitcast double* %add.ptr24.i466 to <2 x double>*, !dbg !833
  %189 = load <2 x double>, <2 x double>* %188, align 8, !dbg !833, !tbaa !73
  %190 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %186, <2 x double> %189, <2 x double> %179), !dbg !834
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !818
  %add.ptr26.i468 = getelementptr inbounds double, double* %BColumnStart.0117.i462, i64 4, !dbg !835
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !818
  %191 = bitcast double* %add.ptr26.i468 to <2 x double>*, !dbg !836
  %192 = load <2 x double>, <2 x double>* %191, align 8, !dbg !836, !tbaa !73
  %193 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %186, <2 x double> %192, <2 x double> %180), !dbg !837
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !818
  %add.ptr28.i470 = getelementptr inbounds double, double* %BColumnStart.0117.i462, i64 6, !dbg !838
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !818
  %194 = bitcast double* %add.ptr28.i470 to <2 x double>*, !dbg !839
  %195 = load <2 x double>, <2 x double>* %194, align 8, !dbg !839, !tbaa !73
  %196 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %186, <2 x double> %195, <2 x double> %181), !dbg !840
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !818
  %197 = ptrtoint double* %BColumnStart.0117.i462 to i64, !dbg !841
  %add.i472 = add i64 %conv.i366.pre-phi, %197, !dbg !842
  %198 = inttoptr i64 %add.i472 to double*, !dbg !843
  call void @llvm.dbg.value(metadata double* %198, metadata !372, metadata !DIExpression()) #21, !dbg !818
  %inc.i473 = add nuw i32 %Products.0126.i453, 1, !dbg !844
  call void @llvm.dbg.value(metadata i32 %inc.i473, metadata !387, metadata !DIExpression()) #21, !dbg !818
  %exitcond.not.i474 = icmp eq i32 %inc.i473, %shr.lcssa717867, !dbg !845
  br i1 %exitcond.not.i474, label %for.cond19.for.end_crit_edge.i480, label %for.body22.i475, !dbg !826, !llvm.loop !846

for.cond19.for.end_crit_edge.i480:                ; preds = %for.body22.i475
  %199 = ptrtoint double* %incdec.ptr.i464 to i64, !dbg !848
  %sub30.i476 = sub i64 %199, %conv4.i370.pre-phi, !dbg !849
  %200 = inttoptr i64 %sub30.i476 to double*, !dbg !850
  call void @llvm.dbg.value(metadata double* %200, metadata !371, metadata !DIExpression()) #21, !dbg !814
  store <2 x double> %187, <2 x double>* %170, align 8, !dbg !851, !tbaa !73
  store <2 x double> %190, <2 x double>* %172, align 8, !dbg !852, !tbaa !73
  store <2 x double> %193, <2 x double>* %174, align 8, !dbg !853, !tbaa !73
  store <2 x double> %196, <2 x double>* %176, align 8, !dbg !854, !tbaa !73
  %add.ptr38.i477 = getelementptr inbounds double, double* %C.addr.1138.i442, i64 8, !dbg !855
  call void @llvm.dbg.value(metadata double* %add.ptr38.i477, metadata !358, metadata !DIExpression()) #21, !dbg !814
  %indvars.iv.next.i478 = add nuw nsw i64 %indvars.iv.i441, 8, !dbg !856
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i478, metadata !369, metadata !DIExpression()) #21, !dbg !814
  %cmp9.i479 = icmp ult i64 %indvars.iv.next.i478, %idx.ext.le.pre-phi865, !dbg !857
  br i1 %cmp9.i479, label %for.body11.i452, label %for.cond8.for.end41_crit_edge.i485, !dbg !816, !llvm.loop !858

for.cond8.for.end41_crit_edge.i485:               ; preds = %for.cond19.for.end_crit_edge.i480
  %add42.i481 = add i64 %sub30.i476, %conv2.i368.pre-phi, !dbg !860
  %201 = inttoptr i64 %add42.i481 to double*, !dbg !861
  call void @llvm.dbg.value(metadata double* %201, metadata !371, metadata !DIExpression()) #21, !dbg !814
  %202 = ptrtoint double* %add.ptr38.i477 to i64, !dbg !862
  %add43.i482 = add i64 %conv6.i373.pre-phi, %202, !dbg !863
  %203 = inttoptr i64 %add43.i482 to double*, !dbg !864
  call void @llvm.dbg.value(metadata double* %203, metadata !358, metadata !DIExpression()) #21, !dbg !814
  %inc45.i483 = add nuw i32 %Vertical.0142.i439, 1, !dbg !865
  call void @llvm.dbg.value(metadata i32 %inc45.i483, metadata !370, metadata !DIExpression()) #21, !dbg !814
  %exitcond153.not.i484 = icmp eq i32 %inc45.i483, %shr.lcssa717867, !dbg !866
  br i1 %exitcond153.not.i484, label %for.cond8.preheader.i501, label %for.cond8.preheader.i440, !dbg !867, !llvm.loop !868

for.cond8.preheader.i501:                         ; preds = %for.cond8.for.end41_crit_edge.i546, %for.cond8.for.end41_crit_edge.i485
  %C.addr.0144.i498 = phi double* [ %237, %for.cond8.for.end41_crit_edge.i546 ], [ %add.ptr18.lcssa888, %for.cond8.for.end41_crit_edge.i485 ]
  %ARowStart.0143.i499 = phi double* [ %235, %for.cond8.for.end41_crit_edge.i546 ], [ %add.ptr4.lcssa877, %for.cond8.for.end41_crit_edge.i485 ]
  %Vertical.0142.i500 = phi i32 [ %inc45.i544, %for.cond8.for.end41_crit_edge.i546 ], [ 0, %for.cond8.for.end41_crit_edge.i485 ]
  call void @llvm.dbg.value(metadata i32 %Vertical.0142.i500, metadata !370, metadata !DIExpression()) #21, !dbg !870
  call void @llvm.dbg.value(metadata double* %C.addr.0144.i498, metadata !358, metadata !DIExpression()) #21, !dbg !870
  call void @llvm.dbg.value(metadata double* %ARowStart.0143.i499, metadata !371, metadata !DIExpression()) #21, !dbg !870
  call void @llvm.dbg.value(metadata i32 0, metadata !369, metadata !DIExpression()) #21, !dbg !870
  br label %for.body11.i513, !dbg !872

for.body11.i513:                                  ; preds = %for.cond19.for.end_crit_edge.i541, %for.cond8.preheader.i501
  %indvars.iv.i502 = phi i64 [ 0, %for.cond8.preheader.i501 ], [ %indvars.iv.next.i539, %for.cond19.for.end_crit_edge.i541 ]
  %C.addr.1138.i503 = phi double* [ %C.addr.0144.i498, %for.cond8.preheader.i501 ], [ %add.ptr38.i538, %for.cond19.for.end_crit_edge.i541 ]
  %ARowStart.1137.i504 = phi double* [ %ARowStart.0143.i499, %for.cond8.preheader.i501 ], [ %234, %for.cond19.for.end_crit_edge.i541 ]
  call void @llvm.dbg.value(metadata double* %C.addr.1138.i503, metadata !358, metadata !DIExpression()) #21, !dbg !870
  call void @llvm.dbg.value(metadata double* %ARowStart.1137.i504, metadata !371, metadata !DIExpression()) #21, !dbg !870
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i502, metadata !369, metadata !DIExpression()) #21, !dbg !870
  %add.ptr.i505 = getelementptr inbounds double, double* %add.ptr11.lcssa882, i64 %indvars.iv.i502, !dbg !873
  call void @llvm.dbg.value(metadata double* %add.ptr.i505, metadata !372, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !874
  %204 = bitcast double* %C.addr.1138.i503 to <2 x double>*, !dbg !875
  %205 = load <2 x double>, <2 x double>* %204, align 8, !dbg !875, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !874
  %add.ptr13.i507 = getelementptr inbounds double, double* %C.addr.1138.i503, i64 2, !dbg !876
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !874
  %206 = bitcast double* %add.ptr13.i507 to <2 x double>*, !dbg !877
  %207 = load <2 x double>, <2 x double>* %206, align 8, !dbg !877, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !874
  %add.ptr15.i509 = getelementptr inbounds double, double* %C.addr.1138.i503, i64 4, !dbg !878
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !874
  %208 = bitcast double* %add.ptr15.i509 to <2 x double>*, !dbg !879
  %209 = load <2 x double>, <2 x double>* %208, align 8, !dbg !879, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !874
  %add.ptr17.i511 = getelementptr inbounds double, double* %C.addr.1138.i503, i64 6, !dbg !880
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !874
  %210 = bitcast double* %add.ptr17.i511 to <2 x double>*, !dbg !881
  %211 = load <2 x double>, <2 x double>* %210, align 8, !dbg !881, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()) #21, !dbg !874
  br label %for.body22.i536, !dbg !882

for.body22.i536:                                  ; preds = %for.body22.i536, %for.body11.i513
  %Products.0126.i514 = phi i32 [ 0, %for.body11.i513 ], [ %inc.i534, %for.body22.i536 ]
  %BColumnStart.0117.i523 = phi double* [ %add.ptr.i505, %for.body11.i513 ], [ %232, %for.body22.i536 ]
  %ARowStart.2116.i524 = phi double* [ %ARowStart.1137.i504, %for.body11.i513 ], [ %incdec.ptr.i525, %for.body22.i536 ]
  %212 = phi <2 x double> [ %205, %for.body11.i513 ], [ %221, %for.body22.i536 ]
  %213 = phi <2 x double> [ %207, %for.body11.i513 ], [ %224, %for.body22.i536 ]
  %214 = phi <2 x double> [ %209, %for.body11.i513 ], [ %227, %for.body22.i536 ]
  %215 = phi <2 x double> [ %211, %for.body11.i513 ], [ %230, %for.body22.i536 ]
  call void @llvm.dbg.value(metadata i32 %Products.0126.i514, metadata !387, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata double* %BColumnStart.0117.i523, metadata !372, metadata !DIExpression()) #21, !dbg !874
  call void @llvm.dbg.value(metadata double* %ARowStart.2116.i524, metadata !371, metadata !DIExpression()) #21, !dbg !870
  %incdec.ptr.i525 = getelementptr inbounds double, double* %ARowStart.2116.i524, i64 1, !dbg !883
  call void @llvm.dbg.value(metadata double* %incdec.ptr.i525, metadata !371, metadata !DIExpression()) #21, !dbg !870
  %216 = load double, double* %ARowStart.2116.i524, align 8, !dbg !884, !tbaa !73
  call void @llvm.dbg.value(metadata double %216, metadata !388, metadata !DIExpression()) #21, !dbg !885
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !874
  %217 = bitcast double* %BColumnStart.0117.i523 to <2 x double>*, !dbg !886
  %218 = load <2 x double>, <2 x double>* %217, align 8, !dbg !886, !tbaa !73
  %219 = insertelement <2 x double> poison, double %216, i64 0, !dbg !887
  %220 = shufflevector <2 x double> %219, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !887
  %221 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %220, <2 x double> %218, <2 x double> %212), !dbg !887
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !874
  %add.ptr24.i527 = getelementptr inbounds double, double* %BColumnStart.0117.i523, i64 2, !dbg !888
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !874
  %222 = bitcast double* %add.ptr24.i527 to <2 x double>*, !dbg !889
  %223 = load <2 x double>, <2 x double>* %222, align 8, !dbg !889, !tbaa !73
  %224 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %220, <2 x double> %223, <2 x double> %213), !dbg !890
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !874
  %add.ptr26.i529 = getelementptr inbounds double, double* %BColumnStart.0117.i523, i64 4, !dbg !891
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !874
  %225 = bitcast double* %add.ptr26.i529 to <2 x double>*, !dbg !892
  %226 = load <2 x double>, <2 x double>* %225, align 8, !dbg !892, !tbaa !73
  %227 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %220, <2 x double> %226, <2 x double> %214), !dbg !893
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !874
  %add.ptr28.i531 = getelementptr inbounds double, double* %BColumnStart.0117.i523, i64 6, !dbg !894
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !874
  %228 = bitcast double* %add.ptr28.i531 to <2 x double>*, !dbg !895
  %229 = load <2 x double>, <2 x double>* %228, align 8, !dbg !895, !tbaa !73
  %230 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %220, <2 x double> %229, <2 x double> %215), !dbg !896
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !874
  %231 = ptrtoint double* %BColumnStart.0117.i523 to i64, !dbg !897
  %add.i533 = add i64 %conv.i366.pre-phi, %231, !dbg !898
  %232 = inttoptr i64 %add.i533 to double*, !dbg !899
  call void @llvm.dbg.value(metadata double* %232, metadata !372, metadata !DIExpression()) #21, !dbg !874
  %inc.i534 = add nuw i32 %Products.0126.i514, 1, !dbg !900
  call void @llvm.dbg.value(metadata i32 %inc.i534, metadata !387, metadata !DIExpression()) #21, !dbg !874
  %exitcond.not.i535 = icmp eq i32 %inc.i534, %shr.lcssa717867, !dbg !901
  br i1 %exitcond.not.i535, label %for.cond19.for.end_crit_edge.i541, label %for.body22.i536, !dbg !882, !llvm.loop !902

for.cond19.for.end_crit_edge.i541:                ; preds = %for.body22.i536
  %233 = ptrtoint double* %incdec.ptr.i525 to i64, !dbg !904
  %sub30.i537 = sub i64 %233, %conv4.i370.pre-phi, !dbg !905
  %234 = inttoptr i64 %sub30.i537 to double*, !dbg !906
  call void @llvm.dbg.value(metadata double* %234, metadata !371, metadata !DIExpression()) #21, !dbg !870
  store <2 x double> %221, <2 x double>* %204, align 8, !dbg !907, !tbaa !73
  store <2 x double> %224, <2 x double>* %206, align 8, !dbg !908, !tbaa !73
  store <2 x double> %227, <2 x double>* %208, align 8, !dbg !909, !tbaa !73
  store <2 x double> %230, <2 x double>* %210, align 8, !dbg !910, !tbaa !73
  %add.ptr38.i538 = getelementptr inbounds double, double* %C.addr.1138.i503, i64 8, !dbg !911
  call void @llvm.dbg.value(metadata double* %add.ptr38.i538, metadata !358, metadata !DIExpression()) #21, !dbg !870
  %indvars.iv.next.i539 = add nuw nsw i64 %indvars.iv.i502, 8, !dbg !912
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i539, metadata !369, metadata !DIExpression()) #21, !dbg !870
  %cmp9.i540 = icmp ult i64 %indvars.iv.next.i539, %idx.ext.le.pre-phi865, !dbg !913
  br i1 %cmp9.i540, label %for.body11.i513, label %for.cond8.for.end41_crit_edge.i546, !dbg !872, !llvm.loop !914

for.cond8.for.end41_crit_edge.i546:               ; preds = %for.cond19.for.end_crit_edge.i541
  %add42.i542 = add i64 %sub30.i537, %conv2.i368.pre-phi, !dbg !916
  %235 = inttoptr i64 %add42.i542 to double*, !dbg !917
  call void @llvm.dbg.value(metadata double* %235, metadata !371, metadata !DIExpression()) #21, !dbg !870
  %236 = ptrtoint double* %add.ptr38.i538 to i64, !dbg !918
  %add43.i543 = add i64 %conv6.i373.pre-phi, %236, !dbg !919
  %237 = inttoptr i64 %add43.i543 to double*, !dbg !920
  call void @llvm.dbg.value(metadata double* %237, metadata !358, metadata !DIExpression()) #21, !dbg !870
  %inc45.i544 = add nuw i32 %Vertical.0142.i500, 1, !dbg !921
  call void @llvm.dbg.value(metadata i32 %inc45.i544, metadata !370, metadata !DIExpression()) #21, !dbg !870
  %exitcond153.not.i545 = icmp eq i32 %inc45.i544, %shr.lcssa717867, !dbg !922
  br i1 %exitcond153.not.i545, label %for.cond8.preheader.i562, label %for.cond8.preheader.i501, !dbg !923, !llvm.loop !924

for.cond8.preheader.i562:                         ; preds = %for.cond8.for.end41_crit_edge.i607, %for.cond8.for.end41_crit_edge.i546
  %C.addr.0144.i559 = phi double* [ %271, %for.cond8.for.end41_crit_edge.i607 ], [ %add.ptr16.lcssa886, %for.cond8.for.end41_crit_edge.i546 ]
  %ARowStart.0143.i560 = phi double* [ %269, %for.cond8.for.end41_crit_edge.i607 ], [ %add.ptr4.lcssa877, %for.cond8.for.end41_crit_edge.i546 ]
  %Vertical.0142.i561 = phi i32 [ %inc45.i605, %for.cond8.for.end41_crit_edge.i607 ], [ 0, %for.cond8.for.end41_crit_edge.i546 ]
  call void @llvm.dbg.value(metadata i32 %Vertical.0142.i561, metadata !370, metadata !DIExpression()) #21, !dbg !926
  call void @llvm.dbg.value(metadata double* %C.addr.0144.i559, metadata !358, metadata !DIExpression()) #21, !dbg !926
  call void @llvm.dbg.value(metadata double* %ARowStart.0143.i560, metadata !371, metadata !DIExpression()) #21, !dbg !926
  call void @llvm.dbg.value(metadata i32 0, metadata !369, metadata !DIExpression()) #21, !dbg !926
  br label %for.body11.i574, !dbg !928

for.body11.i574:                                  ; preds = %for.cond19.for.end_crit_edge.i602, %for.cond8.preheader.i562
  %indvars.iv.i563 = phi i64 [ 0, %for.cond8.preheader.i562 ], [ %indvars.iv.next.i600, %for.cond19.for.end_crit_edge.i602 ]
  %C.addr.1138.i564 = phi double* [ %C.addr.0144.i559, %for.cond8.preheader.i562 ], [ %add.ptr38.i599, %for.cond19.for.end_crit_edge.i602 ]
  %ARowStart.1137.i565 = phi double* [ %ARowStart.0143.i560, %for.cond8.preheader.i562 ], [ %268, %for.cond19.for.end_crit_edge.i602 ]
  call void @llvm.dbg.value(metadata double* %C.addr.1138.i564, metadata !358, metadata !DIExpression()) #21, !dbg !926
  call void @llvm.dbg.value(metadata double* %ARowStart.1137.i565, metadata !371, metadata !DIExpression()) #21, !dbg !926
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i563, metadata !369, metadata !DIExpression()) #21, !dbg !926
  %add.ptr.i566 = getelementptr inbounds double, double* %add.ptr9.lcssa880, i64 %indvars.iv.i563, !dbg !929
  call void @llvm.dbg.value(metadata double* %add.ptr.i566, metadata !372, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !930
  %238 = bitcast double* %C.addr.1138.i564 to <2 x double>*, !dbg !931
  %239 = load <2 x double>, <2 x double>* %238, align 8, !dbg !931, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !930
  %add.ptr13.i568 = getelementptr inbounds double, double* %C.addr.1138.i564, i64 2, !dbg !932
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !930
  %240 = bitcast double* %add.ptr13.i568 to <2 x double>*, !dbg !933
  %241 = load <2 x double>, <2 x double>* %240, align 8, !dbg !933, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !930
  %add.ptr15.i570 = getelementptr inbounds double, double* %C.addr.1138.i564, i64 4, !dbg !934
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !930
  %242 = bitcast double* %add.ptr15.i570 to <2 x double>*, !dbg !935
  %243 = load <2 x double>, <2 x double>* %242, align 8, !dbg !935, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !930
  %add.ptr17.i572 = getelementptr inbounds double, double* %C.addr.1138.i564, i64 6, !dbg !936
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !930
  %244 = bitcast double* %add.ptr17.i572 to <2 x double>*, !dbg !937
  %245 = load <2 x double>, <2 x double>* %244, align 8, !dbg !937, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()) #21, !dbg !930
  br label %for.body22.i597, !dbg !938

for.body22.i597:                                  ; preds = %for.body22.i597, %for.body11.i574
  %Products.0126.i575 = phi i32 [ 0, %for.body11.i574 ], [ %inc.i595, %for.body22.i597 ]
  %BColumnStart.0117.i584 = phi double* [ %add.ptr.i566, %for.body11.i574 ], [ %266, %for.body22.i597 ]
  %ARowStart.2116.i585 = phi double* [ %ARowStart.1137.i565, %for.body11.i574 ], [ %incdec.ptr.i586, %for.body22.i597 ]
  %246 = phi <2 x double> [ %239, %for.body11.i574 ], [ %255, %for.body22.i597 ]
  %247 = phi <2 x double> [ %241, %for.body11.i574 ], [ %258, %for.body22.i597 ]
  %248 = phi <2 x double> [ %243, %for.body11.i574 ], [ %261, %for.body22.i597 ]
  %249 = phi <2 x double> [ %245, %for.body11.i574 ], [ %264, %for.body22.i597 ]
  call void @llvm.dbg.value(metadata i32 %Products.0126.i575, metadata !387, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata double* %BColumnStart.0117.i584, metadata !372, metadata !DIExpression()) #21, !dbg !930
  call void @llvm.dbg.value(metadata double* %ARowStart.2116.i585, metadata !371, metadata !DIExpression()) #21, !dbg !926
  %incdec.ptr.i586 = getelementptr inbounds double, double* %ARowStart.2116.i585, i64 1, !dbg !939
  call void @llvm.dbg.value(metadata double* %incdec.ptr.i586, metadata !371, metadata !DIExpression()) #21, !dbg !926
  %250 = load double, double* %ARowStart.2116.i585, align 8, !dbg !940, !tbaa !73
  call void @llvm.dbg.value(metadata double %250, metadata !388, metadata !DIExpression()) #21, !dbg !941
  call void @llvm.dbg.value(metadata double undef, metadata !379, metadata !DIExpression()) #21, !dbg !930
  %251 = bitcast double* %BColumnStart.0117.i584 to <2 x double>*, !dbg !942
  %252 = load <2 x double>, <2 x double>* %251, align 8, !dbg !942, !tbaa !73
  %253 = insertelement <2 x double> poison, double %250, i64 0, !dbg !943
  %254 = shufflevector <2 x double> %253, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !943
  %255 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %254, <2 x double> %252, <2 x double> %246), !dbg !943
  call void @llvm.dbg.value(metadata double undef, metadata !380, metadata !DIExpression()) #21, !dbg !930
  %add.ptr24.i588 = getelementptr inbounds double, double* %BColumnStart.0117.i584, i64 2, !dbg !944
  call void @llvm.dbg.value(metadata double undef, metadata !381, metadata !DIExpression()) #21, !dbg !930
  %256 = bitcast double* %add.ptr24.i588 to <2 x double>*, !dbg !945
  %257 = load <2 x double>, <2 x double>* %256, align 8, !dbg !945, !tbaa !73
  %258 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %254, <2 x double> %257, <2 x double> %247), !dbg !946
  call void @llvm.dbg.value(metadata double undef, metadata !382, metadata !DIExpression()) #21, !dbg !930
  %add.ptr26.i590 = getelementptr inbounds double, double* %BColumnStart.0117.i584, i64 4, !dbg !947
  call void @llvm.dbg.value(metadata double undef, metadata !383, metadata !DIExpression()) #21, !dbg !930
  %259 = bitcast double* %add.ptr26.i590 to <2 x double>*, !dbg !948
  %260 = load <2 x double>, <2 x double>* %259, align 8, !dbg !948, !tbaa !73
  %261 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %254, <2 x double> %260, <2 x double> %248), !dbg !949
  call void @llvm.dbg.value(metadata double undef, metadata !384, metadata !DIExpression()) #21, !dbg !930
  %add.ptr28.i592 = getelementptr inbounds double, double* %BColumnStart.0117.i584, i64 6, !dbg !950
  call void @llvm.dbg.value(metadata double undef, metadata !385, metadata !DIExpression()) #21, !dbg !930
  %262 = bitcast double* %add.ptr28.i592 to <2 x double>*, !dbg !951
  %263 = load <2 x double>, <2 x double>* %262, align 8, !dbg !951, !tbaa !73
  %264 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %254, <2 x double> %263, <2 x double> %249), !dbg !952
  call void @llvm.dbg.value(metadata double undef, metadata !386, metadata !DIExpression()) #21, !dbg !930
  %265 = ptrtoint double* %BColumnStart.0117.i584 to i64, !dbg !953
  %add.i594 = add i64 %conv.i366.pre-phi, %265, !dbg !954
  %266 = inttoptr i64 %add.i594 to double*, !dbg !955
  call void @llvm.dbg.value(metadata double* %266, metadata !372, metadata !DIExpression()) #21, !dbg !930
  %inc.i595 = add nuw i32 %Products.0126.i575, 1, !dbg !956
  call void @llvm.dbg.value(metadata i32 %inc.i595, metadata !387, metadata !DIExpression()) #21, !dbg !930
  %exitcond.not.i596 = icmp eq i32 %inc.i595, %shr.lcssa717867, !dbg !957
  br i1 %exitcond.not.i596, label %for.cond19.for.end_crit_edge.i602, label %for.body22.i597, !dbg !938, !llvm.loop !958

for.cond19.for.end_crit_edge.i602:                ; preds = %for.body22.i597
  %267 = ptrtoint double* %incdec.ptr.i586 to i64, !dbg !960
  %sub30.i598 = sub i64 %267, %conv4.i370.pre-phi, !dbg !961
  %268 = inttoptr i64 %sub30.i598 to double*, !dbg !962
  call void @llvm.dbg.value(metadata double* %268, metadata !371, metadata !DIExpression()) #21, !dbg !926
  store <2 x double> %255, <2 x double>* %238, align 8, !dbg !963, !tbaa !73
  store <2 x double> %258, <2 x double>* %240, align 8, !dbg !964, !tbaa !73
  store <2 x double> %261, <2 x double>* %242, align 8, !dbg !965, !tbaa !73
  store <2 x double> %264, <2 x double>* %244, align 8, !dbg !966, !tbaa !73
  %add.ptr38.i599 = getelementptr inbounds double, double* %C.addr.1138.i564, i64 8, !dbg !967
  call void @llvm.dbg.value(metadata double* %add.ptr38.i599, metadata !358, metadata !DIExpression()) #21, !dbg !926
  %indvars.iv.next.i600 = add nuw nsw i64 %indvars.iv.i563, 8, !dbg !968
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i600, metadata !369, metadata !DIExpression()) #21, !dbg !926
  %cmp9.i601 = icmp ult i64 %indvars.iv.next.i600, %idx.ext.le.pre-phi865, !dbg !969
  br i1 %cmp9.i601, label %for.body11.i574, label %for.cond8.for.end41_crit_edge.i607, !dbg !928, !llvm.loop !970

for.cond8.for.end41_crit_edge.i607:               ; preds = %for.cond19.for.end_crit_edge.i602
  %add42.i603 = add i64 %sub30.i598, %conv2.i368.pre-phi, !dbg !972
  %269 = inttoptr i64 %add42.i603 to double*, !dbg !973
  call void @llvm.dbg.value(metadata double* %269, metadata !371, metadata !DIExpression()) #21, !dbg !926
  %270 = ptrtoint double* %add.ptr38.i599 to i64, !dbg !974
  %add43.i604 = add i64 %conv6.i373.pre-phi, %270, !dbg !975
  %271 = inttoptr i64 %add43.i604 to double*, !dbg !976
  call void @llvm.dbg.value(metadata double* %271, metadata !358, metadata !DIExpression()) #21, !dbg !926
  %inc45.i605 = add nuw i32 %Vertical.0142.i561, 1, !dbg !977
  call void @llvm.dbg.value(metadata i32 %inc45.i605, metadata !370, metadata !DIExpression()) #21, !dbg !926
  %exitcond153.not.i606 = icmp eq i32 %inc45.i605, %shr.lcssa717867, !dbg !978
  br i1 %exitcond153.not.i606, label %if.end21, label %for.cond8.preheader.i562, !dbg !979, !llvm.loop !980

if.end21:                                         ; preds = %for.cond8.for.end41_crit_edge.i607, %if.end, %if.then19
  ret void, !dbg !982
}

; Function Attrs: nounwind uwtable
define dso_local void @OptimizedStrassenMultiply(double* noundef %C, double* noundef %A, double* noundef %B, i32 noundef %MatrixSize, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB) local_unnamed_addr #9 !dbg !983 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !1048
  call void @llvm.dbg.value(metadata double* %C, metadata !985, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %A, metadata !986, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %B, metadata !987, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i32 %MatrixSize, metadata !988, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i32 %RowWidthC, metadata !989, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i32 %RowWidthA, metadata !990, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i32 %RowWidthB, metadata !991, metadata !DIExpression()), !dbg !1048
  %shr = lshr i32 %MatrixSize, 1, !dbg !1049
  call void @llvm.dbg.value(metadata i32 %shr, metadata !992, metadata !DIExpression()), !dbg !1048
  %conv = zext i32 %shr to i64, !dbg !1050
  %mul = shl i32 %shr, 3, !dbg !1051
  %mul2 = mul i32 %mul, %shr, !dbg !1052
  %add = add i32 %mul2, 32, !dbg !1053
  call void @llvm.dbg.value(metadata i32 %add, metadata !993, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 0, metadata !1016, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 0, metadata !1017, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 0, metadata !1018, metadata !DIExpression()), !dbg !1048
  %sub = sub i32 %RowWidthA, %shr, !dbg !1054
  %shl = shl i32 %sub, 3, !dbg !1055
  %conv4 = zext i32 %shl to i64, !dbg !1056
  call void @llvm.dbg.value(metadata i64 %conv4, metadata !1019, metadata !DIExpression()), !dbg !1048
  %sub5 = sub i32 %RowWidthB, %shr, !dbg !1057
  %shl6 = shl i32 %sub5, 3, !dbg !1058
  %conv7 = zext i32 %shl6 to i64, !dbg !1059
  call void @llvm.dbg.value(metadata i64 %conv7, metadata !1020, metadata !DIExpression()), !dbg !1048
  %sub8 = sub i32 %RowWidthC, %shr, !dbg !1060
  %shl9 = shl i32 %sub8, 3, !dbg !1061
  %conv10 = zext i32 %shl9 to i64, !dbg !1062
  call void @llvm.dbg.value(metadata i64 %conv10, metadata !1021, metadata !DIExpression()), !dbg !1048
  %cmp = icmp ult i32 %MatrixSize, 65, !dbg !1063
  br i1 %cmp, label %if.then, label %for.cond62.preheader.lr.ph, !dbg !1065

if.then:                                          ; preds = %entry
  tail call void @MultiplyByDivideAndConquer(double* noundef %C, double* noundef %A, double* noundef %B, i32 noundef %MatrixSize, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB, i32 noundef 0), !dbg !1066
  br label %cleanup, !dbg !1068

for.cond62.preheader.lr.ph:                       ; preds = %entry
  %add.ptr = getelementptr inbounds double, double* %A, i64 %conv, !dbg !1069
  call void @llvm.dbg.value(metadata double* %add.ptr, metadata !996, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata !DIArgList(double* %B, i64 %conv), metadata !997, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !1048
  %add.ptr15 = getelementptr inbounds double, double* %C, i64 %conv, !dbg !1070
  call void @llvm.dbg.value(metadata double* %add.ptr15, metadata !998, metadata !DIExpression()), !dbg !1048
  %mul16 = mul i32 %shr, %RowWidthA, !dbg !1071
  %idx.ext17 = zext i32 %mul16 to i64, !dbg !1072
  %add.ptr18 = getelementptr inbounds double, double* %A, i64 %idx.ext17, !dbg !1072
  call void @llvm.dbg.value(metadata double* %add.ptr18, metadata !999, metadata !DIExpression()), !dbg !1048
  %mul19 = mul i32 %shr, %RowWidthB, !dbg !1073
  %idx.ext20 = zext i32 %mul19 to i64, !dbg !1074
  %add.ptr21 = getelementptr inbounds double, double* %B, i64 %idx.ext20, !dbg !1074
  call void @llvm.dbg.value(metadata double* %add.ptr21, metadata !1000, metadata !DIExpression()), !dbg !1048
  %mul22 = mul i32 %shr, %RowWidthC, !dbg !1075
  %idx.ext23 = zext i32 %mul22 to i64, !dbg !1076
  %add.ptr24 = getelementptr inbounds double, double* %C, i64 %idx.ext23, !dbg !1076
  call void @llvm.dbg.value(metadata double* %add.ptr24, metadata !1001, metadata !DIExpression()), !dbg !1048
  %add.ptr26 = getelementptr inbounds double, double* %add.ptr18, i64 %conv, !dbg !1077
  call void @llvm.dbg.value(metadata double* %add.ptr26, metadata !1002, metadata !DIExpression()), !dbg !1048
  %add.ptr28 = getelementptr inbounds double, double* %add.ptr21, i64 %conv, !dbg !1078
  call void @llvm.dbg.value(metadata double* %add.ptr28, metadata !1003, metadata !DIExpression()), !dbg !1048
  %add.ptr30 = getelementptr inbounds double, double* %add.ptr24, i64 %conv, !dbg !1079
  call void @llvm.dbg.value(metadata double* %add.ptr30, metadata !1004, metadata !DIExpression()), !dbg !1048
  %mul31 = mul i32 %add, 11, !dbg !1080
  %conv32 = zext i32 %mul31 to i64, !dbg !1081
  %call = tail call noalias i8* @malloc(i64 noundef %conv32) #21, !dbg !1082
  call void @llvm.dbg.value(metadata i8* %call, metadata !1025, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i8* %call, metadata !1022, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i8* %call, metadata !1023, metadata !DIExpression()), !dbg !1048
  %0 = ptrtoint i8* %call to i64, !dbg !1083
  %and = and i64 %0, 31, !dbg !1085
  %tobool.not = icmp eq i64 %and, 0, !dbg !1085
  %add34 = add i64 %0, 32, !dbg !1086
  %sub36 = and i64 %add34, -32, !dbg !1086
  %1 = inttoptr i64 %sub36 to i8*, !dbg !1086
  %Heap.0 = select i1 %tobool.not, i8* %call, i8* %1, !dbg !1086
  call void @llvm.dbg.value(metadata i8* %Heap.0, metadata !1022, metadata !DIExpression()), !dbg !1048
  %2 = bitcast i8* %Heap.0 to double*, !dbg !1087
  call void @llvm.dbg.value(metadata double* %2, metadata !1005, metadata !DIExpression()), !dbg !1048
  %idx.ext38 = zext i32 %add to i64, !dbg !1088
  %add.ptr39 = getelementptr inbounds i8, i8* %Heap.0, i64 %idx.ext38, !dbg !1088
  call void @llvm.dbg.value(metadata i8* %add.ptr39, metadata !1022, metadata !DIExpression()), !dbg !1048
  %3 = bitcast i8* %add.ptr39 to double*, !dbg !1089
  call void @llvm.dbg.value(metadata double* %3, metadata !1006, metadata !DIExpression()), !dbg !1048
  %add.ptr41 = getelementptr inbounds i8, i8* %add.ptr39, i64 %idx.ext38, !dbg !1090
  call void @llvm.dbg.value(metadata i8* %add.ptr41, metadata !1022, metadata !DIExpression()), !dbg !1048
  %4 = bitcast i8* %add.ptr41 to double*, !dbg !1091
  call void @llvm.dbg.value(metadata double* %4, metadata !1007, metadata !DIExpression()), !dbg !1048
  %add.ptr43 = getelementptr inbounds i8, i8* %add.ptr41, i64 %idx.ext38, !dbg !1092
  call void @llvm.dbg.value(metadata i8* %add.ptr43, metadata !1022, metadata !DIExpression()), !dbg !1048
  %5 = bitcast i8* %add.ptr43 to double*, !dbg !1093
  call void @llvm.dbg.value(metadata double* %5, metadata !1008, metadata !DIExpression()), !dbg !1048
  %add.ptr45 = getelementptr inbounds i8, i8* %add.ptr43, i64 %idx.ext38, !dbg !1094
  call void @llvm.dbg.value(metadata i8* %add.ptr45, metadata !1022, metadata !DIExpression()), !dbg !1048
  %6 = bitcast i8* %add.ptr45 to double*, !dbg !1095
  call void @llvm.dbg.value(metadata double* %6, metadata !1009, metadata !DIExpression()), !dbg !1048
  %add.ptr47 = getelementptr inbounds i8, i8* %add.ptr45, i64 %idx.ext38, !dbg !1096
  call void @llvm.dbg.value(metadata i8* %add.ptr47, metadata !1022, metadata !DIExpression()), !dbg !1048
  %7 = bitcast i8* %add.ptr47 to double*, !dbg !1097
  call void @llvm.dbg.value(metadata double* %7, metadata !1010, metadata !DIExpression()), !dbg !1048
  %add.ptr49 = getelementptr inbounds i8, i8* %add.ptr47, i64 %idx.ext38, !dbg !1098
  call void @llvm.dbg.value(metadata i8* %add.ptr49, metadata !1022, metadata !DIExpression()), !dbg !1048
  %8 = bitcast i8* %add.ptr49 to double*, !dbg !1099
  call void @llvm.dbg.value(metadata double* %8, metadata !1011, metadata !DIExpression()), !dbg !1048
  %add.ptr51 = getelementptr inbounds i8, i8* %add.ptr49, i64 %idx.ext38, !dbg !1100
  call void @llvm.dbg.value(metadata i8* %add.ptr51, metadata !1022, metadata !DIExpression()), !dbg !1048
  %9 = bitcast i8* %add.ptr51 to double*, !dbg !1101
  call void @llvm.dbg.value(metadata double* %9, metadata !1012, metadata !DIExpression()), !dbg !1048
  %add.ptr53 = getelementptr inbounds i8, i8* %add.ptr51, i64 %idx.ext38, !dbg !1102
  call void @llvm.dbg.value(metadata i8* %add.ptr53, metadata !1022, metadata !DIExpression()), !dbg !1048
  %10 = bitcast i8* %add.ptr53 to double*, !dbg !1103
  call void @llvm.dbg.value(metadata double* %10, metadata !1013, metadata !DIExpression()), !dbg !1048
  %add.ptr55 = getelementptr inbounds i8, i8* %add.ptr53, i64 %idx.ext38, !dbg !1104
  call void @llvm.dbg.value(metadata i8* %add.ptr55, metadata !1022, metadata !DIExpression()), !dbg !1048
  %11 = bitcast i8* %add.ptr55 to double*, !dbg !1105
  call void @llvm.dbg.value(metadata double* %11, metadata !1014, metadata !DIExpression()), !dbg !1048
  %add.ptr57 = getelementptr inbounds i8, i8* %add.ptr55, i64 %idx.ext38, !dbg !1106
  call void @llvm.dbg.value(metadata i8* %add.ptr57, metadata !1022, metadata !DIExpression()), !dbg !1048
  %12 = bitcast i8* %add.ptr57 to double*, !dbg !1107
  call void @llvm.dbg.value(metadata double* %12, metadata !1015, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata !DIArgList(i8* %add.ptr57, i64 %idx.ext38), metadata !1022, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 1, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !1048
  call void @llvm.dbg.value(metadata i32 0, metadata !995, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 0, metadata !1016, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 0, metadata !1017, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 0, metadata !1018, metadata !DIExpression()), !dbg !1048
  %add.ptr13 = getelementptr inbounds double, double* %B, i64 %conv, !dbg !1108
  call void @llvm.dbg.value(metadata double* %add.ptr13, metadata !997, metadata !DIExpression()), !dbg !1048
  %13 = ptrtoint double* %add.ptr to i64
  %14 = ptrtoint double* %add.ptr18 to i64
  %15 = ptrtoint double* %add.ptr26 to i64
  %16 = ptrtoint i8* %Heap.0 to i64
  %17 = ptrtoint double* %A to i64
  %18 = ptrtoint i8* %add.ptr39 to i64
  %19 = ptrtoint i8* %add.ptr43 to i64
  %20 = ptrtoint double* %add.ptr28 to i64
  %21 = ptrtoint double* %add.ptr13 to i64
  %22 = ptrtoint double* %B to i64
  %23 = ptrtoint i8* %add.ptr45 to i64
  %24 = ptrtoint i8* %add.ptr47 to i64
  %25 = ptrtoint double* %add.ptr21 to i64
  %26 = ptrtoint i8* %add.ptr51 to i64
  %27 = ptrtoint i8* %add.ptr41 to i64
  %28 = ptrtoint i8* %add.ptr49 to i64
  %umax = call i32 @llvm.umax.i32(i32 %shr, i32 1), !dbg !1109
  br label %for.cond62.preheader.us, !dbg !1109

for.cond62.preheader.us:                          ; preds = %for.cond62.for.end_crit_edge.us, %for.cond62.preheader.lr.ph
  %Row.0498.us = phi i32 [ 0, %for.cond62.preheader.lr.ph ], [ %inc100.us, %for.cond62.for.end_crit_edge.us ]
  %TempMatrixOffset.0497.us = phi i64 [ 0, %for.cond62.preheader.lr.ph ], [ %add94.us, %for.cond62.for.end_crit_edge.us ]
  %MatrixOffsetA.0496.us = phi i64 [ 0, %for.cond62.preheader.lr.ph ], [ %add97.us, %for.cond62.for.end_crit_edge.us ]
  %MatrixOffsetB.0495.us = phi i64 [ 0, %for.cond62.preheader.lr.ph ], [ %add98.us, %for.cond62.for.end_crit_edge.us ]
  call void @llvm.dbg.value(metadata i32 %Row.0498.us, metadata !995, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i32 0, metadata !994, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 %TempMatrixOffset.0497.us, metadata !1016, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 %MatrixOffsetA.0496.us, metadata !1017, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 %MatrixOffsetB.0495.us, metadata !1018, metadata !DIExpression()), !dbg !1048
  br label %for.body65.us, !dbg !1111

for.body65.us:                                    ; preds = %for.body65.us, %for.cond62.preheader.us
  %Column.0491.us = phi i32 [ 0, %for.cond62.preheader.us ], [ %inc.us, %for.body65.us ]
  %TempMatrixOffset.1490.us = phi i64 [ %TempMatrixOffset.0497.us, %for.cond62.preheader.us ], [ %add94.us, %for.body65.us ]
  %MatrixOffsetA.1489.us = phi i64 [ %MatrixOffsetA.0496.us, %for.cond62.preheader.us ], [ %add95.us, %for.body65.us ]
  %MatrixOffsetB.1488.us = phi i64 [ %MatrixOffsetB.0495.us, %for.cond62.preheader.us ], [ %add96.us, %for.body65.us ]
  call void @llvm.dbg.value(metadata i32 %Column.0491.us, metadata !994, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 %TempMatrixOffset.1490.us, metadata !1016, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 %MatrixOffsetA.1489.us, metadata !1017, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 %MatrixOffsetB.1488.us, metadata !1018, metadata !DIExpression()), !dbg !1048
  %add66.us = add i64 %MatrixOffsetA.1489.us, %13, !dbg !1115
  %29 = inttoptr i64 %add66.us to double*, !dbg !1115
  %30 = load double, double* %29, align 8, !dbg !1115, !tbaa !73
  %add67.us = add i64 %MatrixOffsetA.1489.us, %14, !dbg !1118
  %31 = inttoptr i64 %add67.us to double*, !dbg !1118
  %32 = load double, double* %31, align 8, !dbg !1118, !tbaa !73
  %add68.us = add i64 %MatrixOffsetA.1489.us, %15, !dbg !1119
  %33 = inttoptr i64 %add68.us to double*, !dbg !1119
  %34 = load double, double* %33, align 8, !dbg !1119, !tbaa !73
  %add69.us = fadd double %32, %34, !dbg !1120
  %add70.us = add i64 %TempMatrixOffset.1490.us, %16, !dbg !1121
  %35 = inttoptr i64 %add70.us to double*, !dbg !1121
  store double %add69.us, double* %35, align 8, !dbg !1122, !tbaa !73
  %add71.us = add i64 %MatrixOffsetA.1489.us, %17, !dbg !1123
  %36 = inttoptr i64 %add71.us to double*, !dbg !1123
  %37 = load double, double* %36, align 8, !dbg !1123, !tbaa !73
  %sub72.us = fsub double %add69.us, %37, !dbg !1124
  %add73.us = add i64 %TempMatrixOffset.1490.us, %18, !dbg !1125
  %38 = inttoptr i64 %add73.us to double*, !dbg !1125
  store double %sub72.us, double* %38, align 8, !dbg !1126, !tbaa !73
  %sub74.us = fsub double %30, %sub72.us, !dbg !1127
  %add75.us = add i64 %TempMatrixOffset.1490.us, %19, !dbg !1128
  %39 = inttoptr i64 %add75.us to double*, !dbg !1128
  store double %sub74.us, double* %39, align 8, !dbg !1129, !tbaa !73
  %add76.us = add i64 %MatrixOffsetB.1488.us, %20, !dbg !1130
  %40 = inttoptr i64 %add76.us to double*, !dbg !1130
  %41 = load double, double* %40, align 8, !dbg !1130, !tbaa !73
  %add77.us = add i64 %MatrixOffsetB.1488.us, %21, !dbg !1131
  %42 = inttoptr i64 %add77.us to double*, !dbg !1131
  %43 = load double, double* %42, align 8, !dbg !1131, !tbaa !73
  %add78.us = add i64 %MatrixOffsetB.1488.us, %22, !dbg !1132
  %44 = inttoptr i64 %add78.us to double*, !dbg !1132
  %45 = load double, double* %44, align 8, !dbg !1132, !tbaa !73
  %sub79.us = fsub double %43, %45, !dbg !1133
  %add80.us = add i64 %TempMatrixOffset.1490.us, %23, !dbg !1134
  %46 = inttoptr i64 %add80.us to double*, !dbg !1134
  store double %sub79.us, double* %46, align 8, !dbg !1135, !tbaa !73
  %sub81.us = fsub double %41, %sub79.us, !dbg !1136
  %add82.us = add i64 %TempMatrixOffset.1490.us, %24, !dbg !1137
  %47 = inttoptr i64 %add82.us to double*, !dbg !1137
  store double %sub81.us, double* %47, align 8, !dbg !1138, !tbaa !73
  %add83.us = add i64 %MatrixOffsetB.1488.us, %25, !dbg !1139
  %48 = inttoptr i64 %add83.us to double*, !dbg !1139
  %49 = load double, double* %48, align 8, !dbg !1139, !tbaa !73
  %sub84.us = fsub double %sub81.us, %49, !dbg !1140
  %add85.us = add i64 %TempMatrixOffset.1490.us, %26, !dbg !1141
  %50 = inttoptr i64 %add85.us to double*, !dbg !1141
  store double %sub84.us, double* %50, align 8, !dbg !1142, !tbaa !73
  %51 = load double, double* %36, align 8, !dbg !1143, !tbaa !73
  %52 = load double, double* %31, align 8, !dbg !1144, !tbaa !73
  %sub88.us = fsub double %51, %52, !dbg !1145
  %add89.us = add i64 %TempMatrixOffset.1490.us, %27, !dbg !1146
  %53 = inttoptr i64 %add89.us to double*, !dbg !1146
  store double %sub88.us, double* %53, align 8, !dbg !1147, !tbaa !73
  %54 = load double, double* %40, align 8, !dbg !1148, !tbaa !73
  %55 = load double, double* %42, align 8, !dbg !1149, !tbaa !73
  %sub92.us = fsub double %54, %55, !dbg !1150
  %add93.us = add i64 %TempMatrixOffset.1490.us, %28, !dbg !1151
  %56 = inttoptr i64 %add93.us to double*, !dbg !1151
  store double %sub92.us, double* %56, align 8, !dbg !1152, !tbaa !73
  %add94.us = add i64 %TempMatrixOffset.1490.us, 8, !dbg !1153
  call void @llvm.dbg.value(metadata i64 %add94.us, metadata !1016, metadata !DIExpression()), !dbg !1048
  %add95.us = add i64 %MatrixOffsetA.1489.us, 8, !dbg !1154
  call void @llvm.dbg.value(metadata i64 %add95.us, metadata !1017, metadata !DIExpression()), !dbg !1048
  %add96.us = add i64 %MatrixOffsetB.1488.us, 8, !dbg !1155
  call void @llvm.dbg.value(metadata i64 %add96.us, metadata !1018, metadata !DIExpression()), !dbg !1048
  %inc.us = add nuw nsw i32 %Column.0491.us, 1, !dbg !1156
  call void @llvm.dbg.value(metadata i32 %inc.us, metadata !994, metadata !DIExpression()), !dbg !1048
  %exitcond.not = icmp eq i32 %inc.us, %umax, !dbg !1157
  br i1 %exitcond.not, label %for.cond62.for.end_crit_edge.us, label %for.body65.us, !dbg !1111, !llvm.loop !1158

for.cond62.for.end_crit_edge.us:                  ; preds = %for.body65.us
  %add97.us = add i64 %add95.us, %conv4, !dbg !1160
  call void @llvm.dbg.value(metadata i64 %add97.us, metadata !1017, metadata !DIExpression()), !dbg !1048
  %add98.us = add i64 %add96.us, %conv7, !dbg !1161
  call void @llvm.dbg.value(metadata i64 %add98.us, metadata !1018, metadata !DIExpression()), !dbg !1048
  %inc100.us = add nuw nsw i32 %Row.0498.us, 1, !dbg !1162
  call void @llvm.dbg.value(metadata i32 %inc100.us, metadata !995, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i64 undef, metadata !1016, metadata !DIExpression()), !dbg !1048
  %exitcond524.not = icmp eq i32 %inc100.us, %umax, !dbg !1163
  br i1 %exitcond524.not, label %for.end101.tf, label %for.cond62.preheader.us, !dbg !1109, !llvm.loop !1164

for.end101.tf:                                    ; preds = %for.cond62.for.end_crit_edge.us
  detach within %syncreg, label %det.achd, label %det.cont.tf, !dbg !1166

det.achd:                                         ; preds = %for.end101.tf
  tail call void @OptimizedStrassenMultiply(double* noundef %10, double* noundef %A, double* noundef %B, i32 noundef %shr, i32 noundef %shr, i32 noundef %RowWidthA, i32 noundef %RowWidthB), !dbg !1166
  reattach within %syncreg, label %det.cont.tf, !dbg !1166

det.cont.tf:                                      ; preds = %det.achd, %for.end101.tf
  detach within %syncreg, label %det.achd102, label %det.cont103.tf, !dbg !1167

det.achd102:                                      ; preds = %det.cont.tf
  tail call void @OptimizedStrassenMultiply(double* noundef %11, double* noundef %2, double* noundef %6, i32 noundef %shr, i32 noundef %shr, i32 noundef %shr, i32 noundef %shr), !dbg !1167
  reattach within %syncreg, label %det.cont103.tf, !dbg !1167

det.cont103.tf:                                   ; preds = %det.achd102, %det.cont.tf
  detach within %syncreg, label %det.achd104, label %det.cont105.tf, !dbg !1168

det.achd104:                                      ; preds = %det.cont103.tf
  tail call void @OptimizedStrassenMultiply(double* noundef %12, double* noundef %3, double* noundef %7, i32 noundef %shr, i32 noundef %shr, i32 noundef %shr, i32 noundef %shr), !dbg !1168
  reattach within %syncreg, label %det.cont105.tf, !dbg !1168

det.cont105.tf:                                   ; preds = %det.achd104, %det.cont103.tf
  detach within %syncreg, label %det.achd106, label %det.cont107.tf, !dbg !1169

det.achd106:                                      ; preds = %det.cont105.tf
  tail call void @OptimizedStrassenMultiply(double* noundef %add.ptr30, double* noundef %4, double* noundef %8, i32 noundef %shr, i32 noundef %RowWidthC, i32 noundef %shr, i32 noundef %shr), !dbg !1169
  reattach within %syncreg, label %det.cont107.tf, !dbg !1169

det.cont107.tf:                                   ; preds = %det.achd106, %det.cont105.tf
  detach within %syncreg, label %det.achd108, label %det.cont109.tf, !dbg !1170

det.achd108:                                      ; preds = %det.cont107.tf
  tail call void @OptimizedStrassenMultiply(double* noundef %C, double* noundef %add.ptr, double* noundef %add.ptr21, i32 noundef %shr, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %RowWidthB), !dbg !1170
  reattach within %syncreg, label %det.cont109.tf, !dbg !1170

det.cont109.tf:                                   ; preds = %det.achd108, %det.cont107.tf
  detach within %syncreg, label %det.achd110, label %det.cont111, !dbg !1171

det.achd110:                                      ; preds = %det.cont109.tf
  tail call void @OptimizedStrassenMultiply(double* noundef %add.ptr15, double* noundef %5, double* noundef %add.ptr28, i32 noundef %shr, i32 noundef %RowWidthC, i32 noundef %shr, i32 noundef %RowWidthB), !dbg !1171
  reattach within %syncreg, label %det.cont111, !dbg !1171

det.cont111:                                      ; preds = %det.achd110, %det.cont109.tf
  tail call void @OptimizedStrassenMultiply(double* noundef %add.ptr24, double* noundef %add.ptr26, double* noundef %9, i32 noundef %shr, i32 noundef %RowWidthC, i32 noundef %RowWidthA, i32 noundef %shr), !dbg !1172
  sync within %syncreg, label %det.cont111.split, !dbg !1173

det.cont111.split:                                ; preds = %det.cont111
  call void @llvm.dbg.value(metadata double* %C, metadata !985, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i32 0, metadata !995, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %add.ptr15, metadata !998, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %add.ptr24, metadata !1001, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %add.ptr30, metadata !1004, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %10, metadata !1013, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %11, metadata !1014, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %12, metadata !1015, metadata !DIExpression()), !dbg !1048
  %cmp113514.not = icmp ult i32 %MatrixSize, 2, !dbg !1174
  br i1 %cmp113514.not, label %for.end194, label %for.cond116.preheader.us, !dbg !1175

for.cond116.preheader.us:                         ; preds = %for.cond116.for.end187_crit_edge.us, %det.cont111.split
  %C.addr.0522.us = phi double* [ %100, %for.cond116.for.end187_crit_edge.us ], [ %C, %det.cont111.split ]
  %Row.1521.us = phi i32 [ %inc193.us, %for.cond116.for.end187_crit_edge.us ], [ 0, %det.cont111.split ]
  %C12.0520.us = phi double* [ %102, %for.cond116.for.end187_crit_edge.us ], [ %add.ptr15, %det.cont111.split ]
  %C21.0519.us = phi double* [ %104, %for.cond116.for.end187_crit_edge.us ], [ %add.ptr24, %det.cont111.split ]
  %C22.0518.us = phi double* [ %106, %for.cond116.for.end187_crit_edge.us ], [ %add.ptr30, %det.cont111.split ]
  %M2.0517.us = phi double* [ %add.ptr179.us, %for.cond116.for.end187_crit_edge.us ], [ %10, %det.cont111.split ]
  %M5.0516.us = phi double* [ %add.ptr178.us, %for.cond116.for.end187_crit_edge.us ], [ %11, %det.cont111.split ]
  %T1sMULT.0515.us = phi double* [ %add.ptr180.us, %for.cond116.for.end187_crit_edge.us ], [ %12, %det.cont111.split ]
  call void @llvm.dbg.value(metadata i32 %Row.1521.us, metadata !995, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %C.addr.0522.us, metadata !985, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i32 0, metadata !994, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %C12.0520.us, metadata !998, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %C21.0519.us, metadata !1001, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %C22.0518.us, metadata !1004, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %M2.0517.us, metadata !1013, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %M5.0516.us, metadata !1014, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %T1sMULT.0515.us, metadata !1015, metadata !DIExpression()), !dbg !1048
  br label %for.body119.us, !dbg !1176

for.body119.us:                                   ; preds = %for.body119.us, %for.cond116.preheader.us
  %C.addr.1507.us = phi double* [ %C.addr.0522.us, %for.cond116.preheader.us ], [ %add.ptr181.us, %for.body119.us ]
  %Column.1506.us = phi i32 [ 0, %for.cond116.preheader.us ], [ %add186.us, %for.body119.us ]
  %C12.1505.us = phi double* [ %C12.0520.us, %for.cond116.preheader.us ], [ %add.ptr182.us, %for.body119.us ]
  %C21.1504.us = phi double* [ %C21.0519.us, %for.cond116.preheader.us ], [ %add.ptr183.us, %for.body119.us ]
  %C22.1503.us = phi double* [ %C22.0518.us, %for.cond116.preheader.us ], [ %add.ptr184.us, %for.body119.us ]
  %M2.1502.us = phi double* [ %M2.0517.us, %for.cond116.preheader.us ], [ %add.ptr179.us, %for.body119.us ]
  %M5.1501.us = phi double* [ %M5.0516.us, %for.cond116.preheader.us ], [ %add.ptr178.us, %for.body119.us ]
  %T1sMULT.1500.us = phi double* [ %T1sMULT.0515.us, %for.cond116.preheader.us ], [ %add.ptr180.us, %for.body119.us ]
  call void @llvm.dbg.value(metadata double* %C.addr.1507.us, metadata !985, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata i32 %Column.1506.us, metadata !994, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %C12.1505.us, metadata !998, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %C21.1504.us, metadata !1001, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %C22.1503.us, metadata !1004, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %M2.1502.us, metadata !1013, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %M5.1501.us, metadata !1014, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* %T1sMULT.1500.us, metadata !1015, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double undef, metadata !1026, metadata !DIExpression()), !dbg !1177
  %57 = bitcast double* %M5.1501.us to <2 x double>*, !dbg !1178
  %58 = load <2 x double>, <2 x double>* %57, align 8, !dbg !1178, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !1033, metadata !DIExpression()), !dbg !1177
  %add.ptr121.us = getelementptr inbounds double, double* %M5.1501.us, i64 2, !dbg !1179
  call void @llvm.dbg.value(metadata double undef, metadata !1034, metadata !DIExpression()), !dbg !1177
  %59 = bitcast double* %add.ptr121.us to <2 x double>*, !dbg !1180
  %60 = load <2 x double>, <2 x double>* %59, align 8, !dbg !1180, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !1035, metadata !DIExpression()), !dbg !1177
  call void @llvm.dbg.value(metadata double undef, metadata !1036, metadata !DIExpression()), !dbg !1177
  %61 = bitcast double* %M2.1502.us to <2 x double>*, !dbg !1181
  %62 = load <2 x double>, <2 x double>* %61, align 8, !dbg !1181, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !1037, metadata !DIExpression()), !dbg !1177
  %add.ptr124.us = getelementptr inbounds double, double* %M2.1502.us, i64 2, !dbg !1182
  call void @llvm.dbg.value(metadata double undef, metadata !1038, metadata !DIExpression()), !dbg !1177
  %63 = bitcast double* %add.ptr124.us to <2 x double>*, !dbg !1183
  %64 = load <2 x double>, <2 x double>* %63, align 8, !dbg !1183, !tbaa !73
  call void @llvm.dbg.value(metadata double undef, metadata !1039, metadata !DIExpression()), !dbg !1177
  call void @llvm.dbg.value(metadata double undef, metadata !1040, metadata !DIExpression()), !dbg !1177
  %65 = bitcast double* %T1sMULT.1500.us to <2 x double>*, !dbg !1184
  %66 = load <2 x double>, <2 x double>* %65, align 8, !dbg !1184, !tbaa !73
  %67 = fadd <2 x double> %62, %66, !dbg !1185
  call void @llvm.dbg.value(metadata double undef, metadata !1041, metadata !DIExpression()), !dbg !1177
  %add.ptr129.us = getelementptr inbounds double, double* %T1sMULT.1500.us, i64 2, !dbg !1186
  call void @llvm.dbg.value(metadata double undef, metadata !1042, metadata !DIExpression()), !dbg !1177
  %68 = bitcast double* %add.ptr129.us to <2 x double>*, !dbg !1187
  %69 = load <2 x double>, <2 x double>* %68, align 8, !dbg !1187, !tbaa !73
  %70 = fadd <2 x double> %64, %69, !dbg !1188
  call void @llvm.dbg.value(metadata double undef, metadata !1043, metadata !DIExpression()), !dbg !1177
  call void @llvm.dbg.value(metadata double undef, metadata !1044, metadata !DIExpression()), !dbg !1177
  %71 = bitcast double* %C22.1503.us to <2 x double>*, !dbg !1189
  %72 = load <2 x double>, <2 x double>* %71, align 8, !dbg !1189, !tbaa !73
  %73 = fadd <2 x double> %67, %72, !dbg !1190
  call void @llvm.dbg.value(metadata double undef, metadata !1045, metadata !DIExpression()), !dbg !1177
  %add.ptr136.us = getelementptr inbounds double, double* %C22.1503.us, i64 2, !dbg !1191
  call void @llvm.dbg.value(metadata double undef, metadata !1046, metadata !DIExpression()), !dbg !1177
  %74 = bitcast double* %add.ptr136.us to <2 x double>*, !dbg !1192
  %75 = load <2 x double>, <2 x double>* %74, align 8, !dbg !1192, !tbaa !73
  %76 = fadd <2 x double> %70, %75, !dbg !1193
  call void @llvm.dbg.value(metadata double undef, metadata !1047, metadata !DIExpression()), !dbg !1177
  %77 = bitcast double* %C.addr.1507.us to <2 x double>*, !dbg !1194
  %78 = load <2 x double>, <2 x double>* %77, align 8, !dbg !1194, !tbaa !73
  %79 = fadd <2 x double> %62, %78, !dbg !1194
  store <2 x double> %79, <2 x double>* %77, align 8, !dbg !1194, !tbaa !73
  %add.ptr143.us = getelementptr inbounds double, double* %C.addr.1507.us, i64 2, !dbg !1195
  %80 = bitcast double* %add.ptr143.us to <2 x double>*, !dbg !1196
  %81 = load <2 x double>, <2 x double>* %80, align 8, !dbg !1196, !tbaa !73
  %82 = fadd <2 x double> %64, %81, !dbg !1196
  store <2 x double> %82, <2 x double>* %80, align 8, !dbg !1196, !tbaa !73
  %83 = fadd <2 x double> %58, %67, !dbg !1197
  %84 = bitcast double* %C12.1505.us to <2 x double>*, !dbg !1198
  %85 = load <2 x double>, <2 x double>* %84, align 8, !dbg !1198, !tbaa !73
  %86 = fadd <2 x double> %83, %85, !dbg !1198
  store <2 x double> %86, <2 x double>* %84, align 8, !dbg !1198, !tbaa !73
  %add.ptr153.us = getelementptr inbounds double, double* %C12.1505.us, i64 2, !dbg !1199
  %87 = fadd <2 x double> %60, %70, !dbg !1200
  %88 = bitcast double* %add.ptr153.us to <2 x double>*, !dbg !1201
  %89 = load <2 x double>, <2 x double>* %88, align 8, !dbg !1201, !tbaa !73
  %90 = fadd <2 x double> %87, %89, !dbg !1201
  store <2 x double> %90, <2 x double>* %88, align 8, !dbg !1201, !tbaa !73
  %91 = fadd <2 x double> %58, %73, !dbg !1202
  store <2 x double> %91, <2 x double>* %71, align 8, !dbg !1203, !tbaa !73
  %92 = fadd <2 x double> %60, %76, !dbg !1204
  store <2 x double> %92, <2 x double>* %74, align 8, !dbg !1205, !tbaa !73
  %93 = bitcast double* %C21.1504.us to <2 x double>*, !dbg !1206
  %94 = load <2 x double>, <2 x double>* %93, align 8, !dbg !1206, !tbaa !73
  %95 = fsub <2 x double> %73, %94, !dbg !1207
  store <2 x double> %95, <2 x double>* %93, align 8, !dbg !1208, !tbaa !73
  %add.ptr170.us = getelementptr inbounds double, double* %C21.1504.us, i64 2, !dbg !1209
  %96 = bitcast double* %add.ptr170.us to <2 x double>*, !dbg !1210
  %97 = load <2 x double>, <2 x double>* %96, align 8, !dbg !1210, !tbaa !73
  %98 = fsub <2 x double> %76, %97, !dbg !1211
  store <2 x double> %98, <2 x double>* %96, align 8, !dbg !1212, !tbaa !73
  %add.ptr178.us = getelementptr inbounds double, double* %M5.1501.us, i64 4, !dbg !1213
  call void @llvm.dbg.value(metadata double* %add.ptr178.us, metadata !1014, metadata !DIExpression()), !dbg !1048
  %add.ptr179.us = getelementptr inbounds double, double* %M2.1502.us, i64 4, !dbg !1214
  call void @llvm.dbg.value(metadata double* %add.ptr179.us, metadata !1013, metadata !DIExpression()), !dbg !1048
  %add.ptr180.us = getelementptr inbounds double, double* %T1sMULT.1500.us, i64 4, !dbg !1215
  call void @llvm.dbg.value(metadata double* %add.ptr180.us, metadata !1015, metadata !DIExpression()), !dbg !1048
  %add.ptr181.us = getelementptr inbounds double, double* %C.addr.1507.us, i64 4, !dbg !1216
  call void @llvm.dbg.value(metadata double* %add.ptr181.us, metadata !985, metadata !DIExpression()), !dbg !1048
  %add.ptr182.us = getelementptr inbounds double, double* %C12.1505.us, i64 4, !dbg !1217
  call void @llvm.dbg.value(metadata double* %add.ptr182.us, metadata !998, metadata !DIExpression()), !dbg !1048
  %add.ptr183.us = getelementptr inbounds double, double* %C21.1504.us, i64 4, !dbg !1218
  call void @llvm.dbg.value(metadata double* %add.ptr183.us, metadata !1001, metadata !DIExpression()), !dbg !1048
  %add.ptr184.us = getelementptr inbounds double, double* %C22.1503.us, i64 4, !dbg !1219
  call void @llvm.dbg.value(metadata double* %add.ptr184.us, metadata !1004, metadata !DIExpression()), !dbg !1048
  %add186.us = add nuw i32 %Column.1506.us, 4, !dbg !1220
  call void @llvm.dbg.value(metadata i32 %add186.us, metadata !994, metadata !DIExpression()), !dbg !1048
  %cmp117.us = icmp ult i32 %add186.us, %shr, !dbg !1221
  br i1 %cmp117.us, label %for.body119.us, label %for.cond116.for.end187_crit_edge.us, !dbg !1176, !llvm.loop !1222

for.cond116.for.end187_crit_edge.us:              ; preds = %for.body119.us
  %99 = ptrtoint double* %add.ptr181.us to i64, !dbg !1224
  %add188.us = add i64 %99, %conv10, !dbg !1225
  %100 = inttoptr i64 %add188.us to double*, !dbg !1226
  call void @llvm.dbg.value(metadata double* %100, metadata !985, metadata !DIExpression()), !dbg !1048
  %101 = ptrtoint double* %add.ptr182.us to i64, !dbg !1227
  %add189.us = add i64 %101, %conv10, !dbg !1228
  %102 = inttoptr i64 %add189.us to double*, !dbg !1229
  call void @llvm.dbg.value(metadata double* %102, metadata !998, metadata !DIExpression()), !dbg !1048
  %103 = ptrtoint double* %add.ptr183.us to i64, !dbg !1230
  %add190.us = add i64 %103, %conv10, !dbg !1231
  %104 = inttoptr i64 %add190.us to double*, !dbg !1232
  call void @llvm.dbg.value(metadata double* %104, metadata !1001, metadata !DIExpression()), !dbg !1048
  %105 = ptrtoint double* %add.ptr184.us to i64, !dbg !1233
  %add191.us = add i64 %105, %conv10, !dbg !1234
  %106 = inttoptr i64 %add191.us to double*, !dbg !1235
  call void @llvm.dbg.value(metadata double* %106, metadata !1004, metadata !DIExpression()), !dbg !1048
  %inc193.us = add nuw nsw i32 %Row.1521.us, 1, !dbg !1236
  call void @llvm.dbg.value(metadata i32 %inc193.us, metadata !995, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* undef, metadata !1013, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* undef, metadata !1014, metadata !DIExpression()), !dbg !1048
  call void @llvm.dbg.value(metadata double* undef, metadata !1015, metadata !DIExpression()), !dbg !1048
  %exitcond526.not = icmp eq i32 %inc193.us, %umax, !dbg !1174
  br i1 %exitcond526.not, label %for.end194, label %for.cond116.preheader.us, !dbg !1175, !llvm.loop !1237

for.end194:                                       ; preds = %for.cond116.for.end187_crit_edge.us, %det.cont111.split
  tail call void @free(i8* noundef %call) #21, !dbg !1239
  br label %cleanup

cleanup:                                          ; preds = %for.end194, %if.then
  ret void, !dbg !1240
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #10

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #11

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @init_vec(i32 noundef %n, double* nocapture noundef writeonly %V) local_unnamed_addr #12 !dbg !1241 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !1245, metadata !DIExpression()), !dbg !1248
  call void @llvm.dbg.value(metadata double* %V, metadata !1246, metadata !DIExpression()), !dbg !1248
  call void @llvm.dbg.value(metadata i32 0, metadata !1247, metadata !DIExpression()), !dbg !1248
  call void @llvm.dbg.value(metadata i32 0, metadata !1247, metadata !DIExpression()), !dbg !1248
  %cmp5 = icmp sgt i32 %n, 0, !dbg !1249
  br i1 %cmp5, label %for.body.preheader, label %for.end, !dbg !1252

for.body.preheader:                               ; preds = %entry
  %rand_nxt.promoted = load i64, i64* @rand_nxt, align 8, !tbaa !97
  %wide.trip.count = zext i32 %n to i64, !dbg !1249
  %xtraiter = and i64 %wide.trip.count, 1, !dbg !1252
  %0 = icmp eq i32 %n, 1, !dbg !1252
  br i1 %0, label %for.cond.for.end_crit_edge.unr-lcssa, label %for.body.preheader.new, !dbg !1252

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %wide.trip.count, 4294967294, !dbg !1252
  br label %for.body, !dbg !1252

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %indvars.iv = phi i64 [ 0, %for.body.preheader.new ], [ %indvars.iv.next.1, %for.body ]
  %add.i46 = phi i64 [ %rand_nxt.promoted, %for.body.preheader.new ], [ %add.i.1, %for.body ]
  %niter = phi i64 [ 0, %for.body.preheader.new ], [ %niter.next.1, %for.body ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1247, metadata !DIExpression()), !dbg !1248
  %mul.i = mul i64 %add.i46, 1103515245, !dbg !1253
  %add.i = add i64 %mul.i, 12345, !dbg !1256
  %shr.i = lshr i64 %add.i, 16, !dbg !1257
  %1 = trunc i64 %shr.i to i32, !dbg !1258
  %conv.i = and i32 %1, 2147483647, !dbg !1258
  call void @llvm.dbg.value(metadata i32 %conv.i, metadata !95, metadata !DIExpression()), !dbg !1259
  %conv = sitofp i32 %conv.i to double, !dbg !1260
  %div = fdiv double %conv, 0x41DFFFFFFFC00000, !dbg !1261
  %arrayidx = getelementptr inbounds double, double* %V, i64 %indvars.iv, !dbg !1262
  store double %div, double* %arrayidx, align 8, !dbg !1263, !tbaa !73
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !1264
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !1247, metadata !DIExpression()), !dbg !1248
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !1247, metadata !DIExpression()), !dbg !1248
  %mul.i.1 = mul i64 %add.i, 1103515245, !dbg !1253
  %add.i.1 = add i64 %mul.i.1, 12345, !dbg !1256
  %shr.i.1 = lshr i64 %add.i.1, 16, !dbg !1257
  %2 = trunc i64 %shr.i.1 to i32, !dbg !1258
  %conv.i.1 = and i32 %2, 2147483647, !dbg !1258
  call void @llvm.dbg.value(metadata i32 %conv.i.1, metadata !95, metadata !DIExpression()), !dbg !1259
  %conv.1 = sitofp i32 %conv.i.1 to double, !dbg !1260
  %div.1 = fdiv double %conv.1, 0x41DFFFFFFFC00000, !dbg !1261
  %arrayidx.1 = getelementptr inbounds double, double* %V, i64 %indvars.iv.next, !dbg !1262
  store double %div.1, double* %arrayidx.1, align 8, !dbg !1263, !tbaa !73
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !1264
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1, metadata !1247, metadata !DIExpression()), !dbg !1248
  %niter.next.1 = add i64 %niter, 2, !dbg !1252
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !1252
  br i1 %niter.ncmp.1, label %for.cond.for.end_crit_edge.unr-lcssa, label %for.body, !dbg !1252, !llvm.loop !1265

for.cond.for.end_crit_edge.unr-lcssa:             ; preds = %for.body, %for.body.preheader
  %add.i.lcssa.ph = phi i64 [ undef, %for.body.preheader ], [ %add.i.1, %for.body ]
  %indvars.iv.unr = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next.1, %for.body ]
  %add.i46.unr = phi i64 [ %rand_nxt.promoted, %for.body.preheader ], [ %add.i.1, %for.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !1252
  br i1 %lcmp.mod.not, label %for.cond.for.end_crit_edge, label %for.body.epil, !dbg !1252

for.body.epil:                                    ; preds = %for.cond.for.end_crit_edge.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !1247, metadata !DIExpression()), !dbg !1248
  %mul.i.epil = mul i64 %add.i46.unr, 1103515245, !dbg !1253
  %add.i.epil = add i64 %mul.i.epil, 12345, !dbg !1256
  %shr.i.epil = lshr i64 %add.i.epil, 16, !dbg !1257
  %3 = trunc i64 %shr.i.epil to i32, !dbg !1258
  %conv.i.epil = and i32 %3, 2147483647, !dbg !1258
  call void @llvm.dbg.value(metadata i32 %conv.i.epil, metadata !95, metadata !DIExpression()), !dbg !1259
  %conv.epil = sitofp i32 %conv.i.epil to double, !dbg !1260
  %div.epil = fdiv double %conv.epil, 0x41DFFFFFFFC00000, !dbg !1261
  %arrayidx.epil = getelementptr inbounds double, double* %V, i64 %indvars.iv.unr, !dbg !1262
  store double %div.epil, double* %arrayidx.epil, align 8, !dbg !1263, !tbaa !73
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !1247, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1248
  br label %for.cond.for.end_crit_edge, !dbg !1267

for.cond.for.end_crit_edge:                       ; preds = %for.body.epil, %for.cond.for.end_crit_edge.unr-lcssa
  %add.i.lcssa = phi i64 [ %add.i.lcssa.ph, %for.cond.for.end_crit_edge.unr-lcssa ], [ %add.i.epil, %for.body.epil ], !dbg !1256
  store i64 %add.i.lcssa, i64* @rand_nxt, align 8, !dbg !1267, !tbaa !97
  br label %for.end, !dbg !1252

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret void, !dbg !1268
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @compare_vec(i32 noundef %n, double* nocapture noundef readonly %V1, double* nocapture noundef readonly %V2) local_unnamed_addr #13 !dbg !1269 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !1273, metadata !DIExpression()), !dbg !1279
  call void @llvm.dbg.value(metadata double* %V1, metadata !1274, metadata !DIExpression()), !dbg !1279
  call void @llvm.dbg.value(metadata double* %V2, metadata !1275, metadata !DIExpression()), !dbg !1279
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !1278, metadata !DIExpression()), !dbg !1279
  call void @llvm.dbg.value(metadata i32 0, metadata !1276, metadata !DIExpression()), !dbg !1279
  %cmp20 = icmp sgt i32 %n, 0, !dbg !1280
  br i1 %cmp20, label %for.body.preheader, label %for.end, !dbg !1283

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64, !dbg !1280
  br label %for.body, !dbg !1283

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %sum.022 = phi double [ 0.000000e+00, %for.body.preheader ], [ %add, %for.inc ]
  call void @llvm.dbg.value(metadata double %sum.022, metadata !1278, metadata !DIExpression()), !dbg !1279
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1276, metadata !DIExpression()), !dbg !1279
  %arrayidx = getelementptr inbounds double, double* %V1, i64 %indvars.iv, !dbg !1284
  %0 = load double, double* %arrayidx, align 8, !dbg !1284, !tbaa !73
  %arrayidx2 = getelementptr inbounds double, double* %V2, i64 %indvars.iv, !dbg !1286
  %1 = load double, double* %arrayidx2, align 8, !dbg !1286, !tbaa !73
  %sub = fsub double %0, %1, !dbg !1287
  call void @llvm.dbg.value(metadata double %sub, metadata !1277, metadata !DIExpression()), !dbg !1279
  %cmp3 = fcmp olt double %sub, 0.000000e+00, !dbg !1288
  %fneg = fneg double %sub, !dbg !1290
  %c.0 = select i1 %cmp3, double %fneg, double %sub, !dbg !1290
  call void @llvm.dbg.value(metadata double %c.0, metadata !1277, metadata !DIExpression()), !dbg !1279
  call void @llvm.dbg.value(metadata double undef, metadata !1278, metadata !DIExpression()), !dbg !1279
  %cmp4 = fcmp ogt double %c.0, 0x3EB0C6F7A0B5ED8D, !dbg !1291
  br i1 %cmp4, label %cleanup, label %for.inc, !dbg !1293

for.inc:                                          ; preds = %for.body
  %add = fadd double %sum.022, %c.0, !dbg !1294
  call void @llvm.dbg.value(metadata double %add, metadata !1278, metadata !DIExpression()), !dbg !1279
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !1295
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !1276, metadata !DIExpression()), !dbg !1279
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !1280
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !1283, !llvm.loop !1296

for.end:                                          ; preds = %for.inc, %entry
  %sum.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ], !dbg !1279
  %call = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), double noundef %sum.0.lcssa), !dbg !1298
  br label %cleanup, !dbg !1299

cleanup:                                          ; preds = %for.end, %for.body
  %retval.0 = phi i32 [ 0, %for.end ], [ -1, %for.body ], !dbg !1279
  ret i32 %retval.0, !dbg !1300
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #14

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind uwtable willreturn
define dso_local noalias double* @alloc_vec(i32 noundef %n) local_unnamed_addr #15 !dbg !1301 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !1305, metadata !DIExpression()), !dbg !1306
  %conv = sext i32 %n to i64, !dbg !1307
  %mul = shl nsw i64 %conv, 3, !dbg !1308
  %call = tail call noalias i8* @malloc(i64 noundef %mul) #21, !dbg !1309
  %0 = bitcast i8* %call to double*, !dbg !1310
  ret double* %0, !dbg !1311
}

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind uwtable willreturn
define dso_local void @free_vec(double* nocapture noundef %V) local_unnamed_addr #16 !dbg !1312 {
entry:
  call void @llvm.dbg.value(metadata double* %V, metadata !1316, metadata !DIExpression()), !dbg !1317
  %0 = bitcast double* %V to i8*, !dbg !1318
  tail call void @free(i8* noundef %0) #21, !dbg !1319
  ret void, !dbg !1320
}

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @init_matrix(i32 noundef %n, double* nocapture noundef writeonly %A, i32 noundef %an) local_unnamed_addr #12 !dbg !1321 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !1325, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.value(metadata double* %A, metadata !1326, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.value(metadata i32 %an, metadata !1327, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.value(metadata i32 0, metadata !1328, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.value(metadata i32 0, metadata !1328, metadata !DIExpression()), !dbg !1330
  %cmp22 = icmp sgt i32 %n, 0, !dbg !1331
  br i1 %cmp22, label %for.cond1.preheader.us.preheader, label %for.end6, !dbg !1334

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %rand_nxt.promoted19 = load i64, i64* @rand_nxt, align 8, !tbaa !97
  %0 = sext i32 %an to i64, !dbg !1334
  %wide.trip.count32 = zext i32 %n to i64, !dbg !1331
  %xtraiter = and i64 %wide.trip.count32, 1
  %1 = icmp eq i32 %n, 1
  %unroll_iter = and i64 %wide.trip.count32, 4294967294
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for.cond1.preheader.us, !dbg !1334

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc4_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv28 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next29, %for.cond1.for.inc4_crit_edge.us ]
  %add.i.lcssa2123.us = phi i64 [ %rand_nxt.promoted19, %for.cond1.preheader.us.preheader ], [ %add.i.us.lcssa, %for.cond1.for.inc4_crit_edge.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv28, metadata !1328, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.value(metadata i32 0, metadata !1329, metadata !DIExpression()), !dbg !1330
  %2 = mul nsw i64 %indvars.iv28, %0
  br i1 %1, label %for.cond1.for.inc4_crit_edge.us.unr-lcssa, label %for.body3.us, !dbg !1335

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %add.i1416.us = phi i64 [ %add.i.us.1, %for.body3.us ], [ %add.i.lcssa2123.us, %for.cond1.preheader.us ]
  %niter = phi i64 [ %niter.next.1, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1329, metadata !DIExpression()), !dbg !1330
  %mul.i.us = mul i64 %add.i1416.us, 1103515245, !dbg !1337
  %add.i.us = add i64 %mul.i.us, 12345, !dbg !1340
  %shr.i.us = lshr i64 %add.i.us, 16, !dbg !1341
  %3 = trunc i64 %shr.i.us to i32, !dbg !1342
  %conv.i.us = and i32 %3, 2147483647, !dbg !1342
  call void @llvm.dbg.value(metadata i32 %conv.i.us, metadata !95, metadata !DIExpression()), !dbg !1343
  %conv.us = sitofp i32 %conv.i.us to double, !dbg !1344
  %div.us = fdiv double %conv.us, 0x41DFFFFFFFC00000, !dbg !1345
  %4 = add nsw i64 %indvars.iv, %2, !dbg !1346
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %4, !dbg !1346
  store double %div.us, double* %arrayidx.us, align 8, !dbg !1347, !tbaa !73
  %indvars.iv.next = or i64 %indvars.iv, 1, !dbg !1348
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !1329, metadata !DIExpression()), !dbg !1330
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !1329, metadata !DIExpression()), !dbg !1330
  %mul.i.us.1 = mul i64 %add.i.us, 1103515245, !dbg !1337
  %add.i.us.1 = add i64 %mul.i.us.1, 12345, !dbg !1340
  %shr.i.us.1 = lshr i64 %add.i.us.1, 16, !dbg !1341
  %5 = trunc i64 %shr.i.us.1 to i32, !dbg !1342
  %conv.i.us.1 = and i32 %5, 2147483647, !dbg !1342
  call void @llvm.dbg.value(metadata i32 %conv.i.us.1, metadata !95, metadata !DIExpression()), !dbg !1343
  %conv.us.1 = sitofp i32 %conv.i.us.1 to double, !dbg !1344
  %div.us.1 = fdiv double %conv.us.1, 0x41DFFFFFFFC00000, !dbg !1345
  %6 = add nsw i64 %indvars.iv.next, %2, !dbg !1346
  %arrayidx.us.1 = getelementptr inbounds double, double* %A, i64 %6, !dbg !1346
  store double %div.us.1, double* %arrayidx.us.1, align 8, !dbg !1347, !tbaa !73
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2, !dbg !1348
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1, metadata !1329, metadata !DIExpression()), !dbg !1330
  %niter.next.1 = add i64 %niter, 2, !dbg !1335
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !1335
  br i1 %niter.ncmp.1, label %for.cond1.for.inc4_crit_edge.us.unr-lcssa, label %for.body3.us, !dbg !1335, !llvm.loop !1349

for.cond1.for.inc4_crit_edge.us.unr-lcssa:        ; preds = %for.body3.us, %for.cond1.preheader.us
  %add.i.us.lcssa.ph = phi i64 [ undef, %for.cond1.preheader.us ], [ %add.i.us.1, %for.body3.us ]
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.1, %for.body3.us ]
  %add.i1416.us.unr = phi i64 [ %add.i.lcssa2123.us, %for.cond1.preheader.us ], [ %add.i.us.1, %for.body3.us ]
  br i1 %lcmp.mod.not, label %for.cond1.for.inc4_crit_edge.us, label %for.body3.us.epil, !dbg !1335

for.body3.us.epil:                                ; preds = %for.cond1.for.inc4_crit_edge.us.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !1329, metadata !DIExpression()), !dbg !1330
  %mul.i.us.epil = mul i64 %add.i1416.us.unr, 1103515245, !dbg !1337
  %add.i.us.epil = add i64 %mul.i.us.epil, 12345, !dbg !1340
  %shr.i.us.epil = lshr i64 %add.i.us.epil, 16, !dbg !1341
  %7 = trunc i64 %shr.i.us.epil to i32, !dbg !1342
  %conv.i.us.epil = and i32 %7, 2147483647, !dbg !1342
  call void @llvm.dbg.value(metadata i32 %conv.i.us.epil, metadata !95, metadata !DIExpression()), !dbg !1343
  %conv.us.epil = sitofp i32 %conv.i.us.epil to double, !dbg !1344
  %div.us.epil = fdiv double %conv.us.epil, 0x41DFFFFFFFC00000, !dbg !1345
  %8 = add nsw i64 %indvars.iv.unr, %2, !dbg !1346
  %arrayidx.us.epil = getelementptr inbounds double, double* %A, i64 %8, !dbg !1346
  store double %div.us.epil, double* %arrayidx.us.epil, align 8, !dbg !1347, !tbaa !73
  call void @llvm.dbg.value(metadata i64 %indvars.iv.unr, metadata !1329, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1330
  br label %for.cond1.for.inc4_crit_edge.us, !dbg !1351

for.cond1.for.inc4_crit_edge.us:                  ; preds = %for.body3.us.epil, %for.cond1.for.inc4_crit_edge.us.unr-lcssa
  %add.i.us.lcssa = phi i64 [ %add.i.us.lcssa.ph, %for.cond1.for.inc4_crit_edge.us.unr-lcssa ], [ %add.i.us.epil, %for.body3.us.epil ], !dbg !1340
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1, !dbg !1351
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next29, metadata !1328, metadata !DIExpression()), !dbg !1330
  %exitcond33.not = icmp eq i64 %indvars.iv.next29, %wide.trip.count32, !dbg !1331
  br i1 %exitcond33.not, label %for.cond.for.end6_crit_edge.split.us, label %for.cond1.preheader.us, !dbg !1334, !llvm.loop !1352

for.cond.for.end6_crit_edge.split.us:             ; preds = %for.cond1.for.inc4_crit_edge.us
  store i64 %add.i.us.lcssa, i64* @rand_nxt, align 8, !dbg !1354, !tbaa !97
  br label %for.end6, !dbg !1334

for.end6:                                         ; preds = %for.cond.for.end6_crit_edge.split.us, %entry
  ret void, !dbg !1355
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly uwtable
define dso_local i32 @compare_matrix(i32 noundef %n, double* nocapture noundef readonly %A, i32 noundef %an, double* nocapture noundef readonly %B, i32 noundef %bn) local_unnamed_addr #17 !dbg !1356 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !1360, metadata !DIExpression()), !dbg !1368
  call void @llvm.dbg.value(metadata double* %A, metadata !1361, metadata !DIExpression()), !dbg !1368
  call void @llvm.dbg.value(metadata i32 %an, metadata !1362, metadata !DIExpression()), !dbg !1368
  call void @llvm.dbg.value(metadata double* %B, metadata !1363, metadata !DIExpression()), !dbg !1368
  call void @llvm.dbg.value(metadata i32 %bn, metadata !1364, metadata !DIExpression()), !dbg !1368
  call void @llvm.dbg.value(metadata i32 0, metadata !1365, metadata !DIExpression()), !dbg !1368
  %cmp41 = icmp sgt i32 %n, 0, !dbg !1369
  br i1 %cmp41, label %for.cond1.preheader.us.preheader, label %cleanup, !dbg !1372

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = sext i32 %an to i64, !dbg !1372
  %1 = sext i32 %bn to i64, !dbg !1372
  %wide.trip.count53 = zext i32 %n to i64, !dbg !1369
  br label %for.cond1.preheader.us, !dbg !1372

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv48 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next49, %for.cond1.for.inc16_crit_edge.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv48, metadata !1365, metadata !DIExpression()), !dbg !1368
  call void @llvm.dbg.value(metadata i32 0, metadata !1366, metadata !DIExpression()), !dbg !1368
  %2 = mul nsw i64 %indvars.iv48, %0
  %3 = mul nsw i64 %indvars.iv48, %1
  br label %for.body3.us, !dbg !1373

for.cond1.us:                                     ; preds = %for.body3.us
  call void @llvm.dbg.value(metadata i32 undef, metadata !1366, metadata !DIExpression()), !dbg !1368
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count53, !dbg !1376
  br i1 %exitcond.not, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us, !dbg !1373, !llvm.loop !1378

for.body3.us:                                     ; preds = %for.cond1.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.cond1.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !1366, metadata !DIExpression()), !dbg !1368
  %4 = add nsw i64 %indvars.iv, %2, !dbg !1380
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %4, !dbg !1380
  %5 = load double, double* %arrayidx.us, align 8, !dbg !1380, !tbaa !73
  %6 = add nsw i64 %indvars.iv, %3, !dbg !1382
  %arrayidx7.us = getelementptr inbounds double, double* %B, i64 %6, !dbg !1382
  %7 = load double, double* %arrayidx7.us, align 8, !dbg !1382, !tbaa !73
  %sub.us = fsub double %5, %7, !dbg !1383
  call void @llvm.dbg.value(metadata double %sub.us, metadata !1367, metadata !DIExpression()), !dbg !1368
  %cmp8.us = fcmp olt double %sub.us, 0.000000e+00, !dbg !1384
  %fneg.us = fneg double %sub.us, !dbg !1386
  %c.0.us = select i1 %cmp8.us, double %fneg.us, double %sub.us, !dbg !1386
  call void @llvm.dbg.value(metadata double %c.0.us, metadata !1367, metadata !DIExpression()), !dbg !1368
  %div.us = fdiv double %c.0.us, %5, !dbg !1387
  call void @llvm.dbg.value(metadata double %div.us, metadata !1367, metadata !DIExpression()), !dbg !1368
  %cmp13.us = fcmp ogt double %div.us, 0x3EB0C6F7A0B5ED8D, !dbg !1388
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !1390
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !1366, metadata !DIExpression()), !dbg !1368
  br i1 %cmp13.us, label %cleanup, label %for.cond1.us, !dbg !1391

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.cond1.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1, !dbg !1392
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next49, metadata !1365, metadata !DIExpression()), !dbg !1368
  %exitcond54.not = icmp eq i64 %indvars.iv.next49, %wide.trip.count53, !dbg !1369
  br i1 %exitcond54.not, label %cleanup, label %for.cond1.preheader.us, !dbg !1372, !llvm.loop !1393

cleanup:                                          ; preds = %for.cond1.for.inc16_crit_edge.us, %for.body3.us, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ -1, %for.body3.us ], [ 0, %for.cond1.for.inc16_crit_edge.us ], !dbg !1368
  ret i32 %retval.0, !dbg !1395
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind uwtable willreturn
define dso_local noalias double* @alloc_matrix(i32 noundef %n) local_unnamed_addr #15 !dbg !1396 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !1398, metadata !DIExpression()), !dbg !1399
  %mul = mul nsw i32 %n, %n, !dbg !1400
  %conv = zext i32 %mul to i64, !dbg !1401
  %mul1 = shl nuw nsw i64 %conv, 3, !dbg !1402
  %call = tail call noalias i8* @malloc(i64 noundef %mul1) #21, !dbg !1403
  %0 = bitcast i8* %call to double*, !dbg !1404
  ret double* %0, !dbg !1405
}

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind uwtable willreturn
define dso_local void @free_matrix(double* nocapture noundef %A) local_unnamed_addr #16 !dbg !1406 {
entry:
  call void @llvm.dbg.value(metadata double* %A, metadata !1408, metadata !DIExpression()), !dbg !1409
  %0 = bitcast double* %A to i8*, !dbg !1410
  tail call void @free(i8* noundef %0) #21, !dbg !1411
  ret void, !dbg !1412
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @usage() local_unnamed_addr #13 !dbg !1413 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1415, !tbaa !1416
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([226 x i8], [226 x i8]* @.str.1, i64 0, i64 0), i64 225, i64 1, %struct._IO_FILE* %0) #22, !dbg !1418
  ret i32 1, !dbg !1419
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #14

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** noundef %argv) local_unnamed_addr #9 !dbg !1420 {
entry:
  %verify = alloca i32, align 4
  %rand_check = alloca i32, align 4
  %benchmark = alloca i32, align 4
  %help = alloca i32, align 4
  %n = alloca i32, align 4
  %round = alloca i32, align 4
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !1425, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i8** %argv, metadata !1426, metadata !DIExpression()), !dbg !1453
  %0 = bitcast i32* %verify to i8*, !dbg !1454
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #21, !dbg !1454
  %1 = bitcast i32* %rand_check to i8*, !dbg !1454
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #21, !dbg !1454
  %2 = bitcast i32* %benchmark to i8*, !dbg !1454
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #21, !dbg !1454
  %3 = bitcast i32* %help to i8*, !dbg !1454
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #21, !dbg !1454
  %4 = bitcast i32* %n to i8*, !dbg !1454
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #21, !dbg !1454
  %5 = bitcast i32* %round to i8*, !dbg !1454
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #21, !dbg !1454
  call void @llvm.dbg.value(metadata i32 512, metadata !1434, metadata !DIExpression()), !dbg !1453
  store i32 512, i32* %n, align 4, !dbg !1455, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 0, metadata !1430, metadata !DIExpression()), !dbg !1453
  store i32 0, i32* %verify, align 4, !dbg !1458, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 0, metadata !1431, metadata !DIExpression()), !dbg !1453
  store i32 0, i32* %rand_check, align 4, !dbg !1459, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 1, metadata !1435, metadata !DIExpression()), !dbg !1453
  store i32 1, i32* %round, align 4, !dbg !1460, !tbaa !1456
  call void @llvm.dbg.value(metadata i32* %verify, metadata !1430, metadata !DIExpression(DW_OP_deref)), !dbg !1453
  call void @llvm.dbg.value(metadata i32* %rand_check, metadata !1431, metadata !DIExpression(DW_OP_deref)), !dbg !1453
  call void @llvm.dbg.value(metadata i32* %benchmark, metadata !1432, metadata !DIExpression(DW_OP_deref)), !dbg !1453
  call void @llvm.dbg.value(metadata i32* %help, metadata !1433, metadata !DIExpression(DW_OP_deref)), !dbg !1453
  call void @llvm.dbg.value(metadata i32* %n, metadata !1434, metadata !DIExpression(DW_OP_deref)), !dbg !1453
  call void @llvm.dbg.value(metadata i32* %round, metadata !1435, metadata !DIExpression(DW_OP_deref)), !dbg !1453
  call void (i32, i8**, i8**, i32*, ...) @get_options(i32 noundef %argc, i8** noundef %argv, i8** noundef getelementptr inbounds ([7 x i8*], [7 x i8*]* @specifiers, i64 0, i64 0), i32* noundef getelementptr inbounds ([7 x i32], [7 x i32]* @opt_types, i64 0, i64 0), i32* noundef nonnull %n, i32* noundef nonnull %verify, i32* noundef nonnull %rand_check, i32* noundef nonnull %benchmark, i32* noundef nonnull %help, i32* noundef nonnull %round) #21, !dbg !1461
  %6 = load i32, i32* %help, align 4, !dbg !1462, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %6, metadata !1433, metadata !DIExpression()), !dbg !1453
  %tobool.not = icmp eq i32 %6, 0, !dbg !1462
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !1464

if.then:                                          ; preds = %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1465, !tbaa !1416
  %8 = call i64 @fwrite(i8* getelementptr inbounds ([226 x i8], [226 x i8]* @.str.1, i64 0, i64 0), i64 225, i64 1, %struct._IO_FILE* %7) #23, !dbg !1467
  br label %cleanup, !dbg !1468

if.end:                                           ; preds = %entry
  %9 = load i32, i32* %benchmark, align 4, !dbg !1469, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %9, metadata !1432, metadata !DIExpression()), !dbg !1453
  switch i32 %9, label %if.end.if.end5_crit_edge [
    i32 3, label %sw.bb4
    i32 1, label %sw.bb
    i32 2, label %sw.bb3
  ], !dbg !1471

if.end.if.end5_crit_edge:                         ; preds = %if.end
  %.pre = load i32, i32* %n, align 4, !dbg !1472, !tbaa !1456
  br label %if.end5, !dbg !1471

sw.bb:                                            ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 512, metadata !1434, metadata !DIExpression()), !dbg !1453
  store i32 512, i32* %n, align 4, !dbg !1474, !tbaa !1456
  br label %if.end5, !dbg !1477

sw.bb3:                                           ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 2048, metadata !1434, metadata !DIExpression()), !dbg !1453
  store i32 2048, i32* %n, align 4, !dbg !1478, !tbaa !1456
  br label %if.end5, !dbg !1479

sw.bb4:                                           ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 4096, metadata !1434, metadata !DIExpression()), !dbg !1453
  store i32 4096, i32* %n, align 4, !dbg !1480, !tbaa !1456
  br label %if.end5, !dbg !1481

if.end5:                                          ; preds = %sw.bb4, %sw.bb3, %sw.bb, %if.end.if.end5_crit_edge
  %10 = phi i32 [ %.pre, %if.end.if.end5_crit_edge ], [ 512, %sw.bb ], [ 2048, %sw.bb3 ], [ 4096, %sw.bb4 ], !dbg !1472
  call void @llvm.dbg.value(metadata i32 %10, metadata !1434, metadata !DIExpression()), !dbg !1453
  %11 = call i32 @llvm.ctpop.i32(i32 %10), !dbg !1482, !range !1483
  %cmp.not = icmp ult i32 %11, 2, !dbg !1482
  %12 = and i32 %10, 15
  %cmp6.not = icmp eq i32 %12, 0
  %or.cond84 = and i1 %cmp.not, %cmp6.not, !dbg !1484
  br i1 %or.cond84, label %if.end9, label %if.then7, !dbg !1484

if.then7:                                         ; preds = %if.end5
  call void @llvm.dbg.value(metadata i32 %10, metadata !1434, metadata !DIExpression()), !dbg !1453
  %call8 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([59 x i8], [59 x i8]* @.str.8, i64 0, i64 0), i32 noundef %10, i32 noundef 16), !dbg !1485
  br label %cleanup, !dbg !1487

if.end9:                                          ; preds = %if.end5
  call void @startup_cilk(), !dbg !1488
  %13 = load i32, i32* %n, align 4, !dbg !1489, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %13, metadata !1434, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 %13, metadata !1398, metadata !DIExpression()) #21, !dbg !1490
  %mul.i = mul nsw i32 %13, %13, !dbg !1492
  %conv.i = zext i32 %mul.i to i64, !dbg !1493
  %mul1.i = shl nuw nsw i64 %conv.i, 3, !dbg !1494
  %call.i = call noalias i8* @malloc(i64 noundef %mul1.i) #21, !dbg !1495
  %14 = bitcast i8* %call.i to double*, !dbg !1496
  call void @llvm.dbg.value(metadata double* %14, metadata !1427, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 %13, metadata !1434, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 %13, metadata !1398, metadata !DIExpression()) #21, !dbg !1497
  %call.i88 = call noalias i8* @malloc(i64 noundef %mul1.i) #21, !dbg !1499
  %15 = bitcast i8* %call.i88 to double*, !dbg !1500
  call void @llvm.dbg.value(metadata double* %15, metadata !1428, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 %13, metadata !1434, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 %13, metadata !1398, metadata !DIExpression()) #21, !dbg !1501
  %call.i92 = call noalias i8* @malloc(i64 noundef %mul1.i) #21, !dbg !1503
  %16 = bitcast i8* %call.i92 to double*, !dbg !1504
  call void @llvm.dbg.value(metadata double* %16, metadata !1429, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 %13, metadata !1434, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 %13, metadata !1325, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.value(metadata double* %14, metadata !1326, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.value(metadata i32 %13, metadata !1327, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.value(metadata i32 0, metadata !1328, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.value(metadata i32 0, metadata !1328, metadata !DIExpression()), !dbg !1505
  %cmp22.i = icmp sgt i32 %13, 0, !dbg !1507
  br i1 %cmp22.i, label %for.cond1.preheader.us.preheader.i, label %init_matrix.exit116, !dbg !1508

for.cond1.preheader.us.preheader.i:               ; preds = %if.end9
  %rand_nxt.promoted19.i = load i64, i64* @rand_nxt, align 8, !tbaa !97
  %17 = zext i32 %13 to i64, !dbg !1508
  %18 = add nsw i64 %17, -1, !dbg !1508
  %xtraiter = and i64 %17, 1
  %19 = icmp eq i64 %18, 0
  %unroll_iter = and i64 %17, 4294967294
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br label %for.cond1.preheader.us.i, !dbg !1508

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc4_crit_edge.us.i, %for.cond1.preheader.us.preheader.i
  %indvars.iv28.i = phi i64 [ 0, %for.cond1.preheader.us.preheader.i ], [ %indvars.iv.next29.i, %for.cond1.for.inc4_crit_edge.us.i ]
  %add.i.lcssa2123.us.i = phi i64 [ %rand_nxt.promoted19.i, %for.cond1.preheader.us.preheader.i ], [ %add.i.us.i.lcssa, %for.cond1.for.inc4_crit_edge.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv28.i, metadata !1328, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.value(metadata i32 0, metadata !1329, metadata !DIExpression()), !dbg !1505
  %20 = mul nuw nsw i64 %indvars.iv28.i, %17
  br i1 %19, label %for.cond1.for.inc4_crit_edge.us.i.unr-lcssa, label %for.body3.us.i, !dbg !1509

for.body3.us.i:                                   ; preds = %for.body3.us.i, %for.cond1.preheader.us.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i.1, %for.body3.us.i ], [ 0, %for.cond1.preheader.us.i ]
  %add.i1416.us.i = phi i64 [ %add.i.us.i.1, %for.body3.us.i ], [ %add.i.lcssa2123.us.i, %for.cond1.preheader.us.i ]
  %niter = phi i64 [ %niter.next.1, %for.body3.us.i ], [ 0, %for.cond1.preheader.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !1329, metadata !DIExpression()), !dbg !1505
  %mul.i.us.i = mul i64 %add.i1416.us.i, 1103515245, !dbg !1510
  %add.i.us.i = add i64 %mul.i.us.i, 12345, !dbg !1512
  %shr.i.us.i = lshr i64 %add.i.us.i, 16, !dbg !1513
  %21 = trunc i64 %shr.i.us.i to i32, !dbg !1514
  %conv.i.us.i = and i32 %21, 2147483647, !dbg !1514
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i, metadata !95, metadata !DIExpression()), !dbg !1515
  %conv.us.i = sitofp i32 %conv.i.us.i to double, !dbg !1516
  %div.us.i = fdiv double %conv.us.i, 0x41DFFFFFFFC00000, !dbg !1517
  %22 = add nuw nsw i64 %indvars.iv.i, %20, !dbg !1518
  %arrayidx.us.i = getelementptr inbounds double, double* %14, i64 %22, !dbg !1518
  store double %div.us.i, double* %arrayidx.us.i, align 8, !dbg !1519, !tbaa !73
  %indvars.iv.next.i = or i64 %indvars.iv.i, 1, !dbg !1520
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !1329, metadata !DIExpression()), !dbg !1505
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !1329, metadata !DIExpression()), !dbg !1505
  %mul.i.us.i.1 = mul i64 %add.i.us.i, 1103515245, !dbg !1510
  %add.i.us.i.1 = add i64 %mul.i.us.i.1, 12345, !dbg !1512
  %shr.i.us.i.1 = lshr i64 %add.i.us.i.1, 16, !dbg !1513
  %23 = trunc i64 %shr.i.us.i.1 to i32, !dbg !1514
  %conv.i.us.i.1 = and i32 %23, 2147483647, !dbg !1514
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i.1, metadata !95, metadata !DIExpression()), !dbg !1515
  %conv.us.i.1 = sitofp i32 %conv.i.us.i.1 to double, !dbg !1516
  %div.us.i.1 = fdiv double %conv.us.i.1, 0x41DFFFFFFFC00000, !dbg !1517
  %24 = add nuw nsw i64 %indvars.iv.next.i, %20, !dbg !1518
  %arrayidx.us.i.1 = getelementptr inbounds double, double* %14, i64 %24, !dbg !1518
  store double %div.us.i.1, double* %arrayidx.us.i.1, align 8, !dbg !1519, !tbaa !73
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2, !dbg !1520
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.1, metadata !1329, metadata !DIExpression()), !dbg !1505
  %niter.next.1 = add i64 %niter, 2, !dbg !1509
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !1509
  br i1 %niter.ncmp.1, label %for.cond1.for.inc4_crit_edge.us.i.unr-lcssa, label %for.body3.us.i, !dbg !1509, !llvm.loop !1521

for.cond1.for.inc4_crit_edge.us.i.unr-lcssa:      ; preds = %for.body3.us.i, %for.cond1.preheader.us.i
  %add.i.us.i.lcssa.ph = phi i64 [ undef, %for.cond1.preheader.us.i ], [ %add.i.us.i.1, %for.body3.us.i ]
  %indvars.iv.i.unr = phi i64 [ 0, %for.cond1.preheader.us.i ], [ %indvars.iv.next.i.1, %for.body3.us.i ]
  %add.i1416.us.i.unr = phi i64 [ %add.i.lcssa2123.us.i, %for.cond1.preheader.us.i ], [ %add.i.us.i.1, %for.body3.us.i ]
  br i1 %lcmp.mod.not, label %for.cond1.for.inc4_crit_edge.us.i, label %for.body3.us.i.epil, !dbg !1509

for.body3.us.i.epil:                              ; preds = %for.cond1.for.inc4_crit_edge.us.i.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i.unr, metadata !1329, metadata !DIExpression()), !dbg !1505
  %mul.i.us.i.epil = mul i64 %add.i1416.us.i.unr, 1103515245, !dbg !1510
  %add.i.us.i.epil = add i64 %mul.i.us.i.epil, 12345, !dbg !1512
  %shr.i.us.i.epil = lshr i64 %add.i.us.i.epil, 16, !dbg !1513
  %25 = trunc i64 %shr.i.us.i.epil to i32, !dbg !1514
  %conv.i.us.i.epil = and i32 %25, 2147483647, !dbg !1514
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i.epil, metadata !95, metadata !DIExpression()), !dbg !1515
  %conv.us.i.epil = sitofp i32 %conv.i.us.i.epil to double, !dbg !1516
  %div.us.i.epil = fdiv double %conv.us.i.epil, 0x41DFFFFFFFC00000, !dbg !1517
  %26 = add nuw nsw i64 %indvars.iv.i.unr, %20, !dbg !1518
  %arrayidx.us.i.epil = getelementptr inbounds double, double* %14, i64 %26, !dbg !1518
  store double %div.us.i.epil, double* %arrayidx.us.i.epil, align 8, !dbg !1519, !tbaa !73
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i.unr, metadata !1329, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1505
  br label %for.cond1.for.inc4_crit_edge.us.i, !dbg !1523

for.cond1.for.inc4_crit_edge.us.i:                ; preds = %for.body3.us.i.epil, %for.cond1.for.inc4_crit_edge.us.i.unr-lcssa
  %add.i.us.i.lcssa = phi i64 [ %add.i.us.i.lcssa.ph, %for.cond1.for.inc4_crit_edge.us.i.unr-lcssa ], [ %add.i.us.i.epil, %for.body3.us.i.epil ], !dbg !1512
  %indvars.iv.next29.i = add nuw nsw i64 %indvars.iv28.i, 1, !dbg !1523
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next29.i, metadata !1328, metadata !DIExpression()), !dbg !1505
  %exitcond33.not.i = icmp eq i64 %indvars.iv.next29.i, %17, !dbg !1507
  br i1 %exitcond33.not.i, label %for.cond1.preheader.us.i99.preheader, label %for.cond1.preheader.us.i, !dbg !1508, !llvm.loop !1524

for.cond1.preheader.us.i99.preheader:             ; preds = %for.cond1.for.inc4_crit_edge.us.i
  %xtraiter163 = and i64 %17, 1
  %27 = icmp eq i64 %18, 0
  %unroll_iter166 = and i64 %17, 4294967294
  %lcmp.mod164.not = icmp eq i64 %xtraiter163, 0
  br label %for.cond1.preheader.us.i99, !dbg !1526

for.cond1.preheader.us.i99:                       ; preds = %for.cond1.for.inc4_crit_edge.us.i114, %for.cond1.preheader.us.i99.preheader
  %indvars.iv28.i97 = phi i64 [ %indvars.iv.next29.i112, %for.cond1.for.inc4_crit_edge.us.i114 ], [ 0, %for.cond1.preheader.us.i99.preheader ]
  %add.i.lcssa2123.us.i98 = phi i64 [ %add.i.us.i103.lcssa, %for.cond1.for.inc4_crit_edge.us.i114 ], [ %add.i.us.i.lcssa, %for.cond1.preheader.us.i99.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv28.i97, metadata !1328, metadata !DIExpression()), !dbg !1528
  call void @llvm.dbg.value(metadata i32 0, metadata !1329, metadata !DIExpression()), !dbg !1528
  %28 = mul nuw nsw i64 %indvars.iv28.i97, %17
  br i1 %27, label %for.cond1.for.inc4_crit_edge.us.i114.unr-lcssa, label %for.body3.us.i111, !dbg !1529

for.body3.us.i111:                                ; preds = %for.body3.us.i111, %for.cond1.preheader.us.i99
  %indvars.iv.i100 = phi i64 [ %indvars.iv.next.i109.1, %for.body3.us.i111 ], [ 0, %for.cond1.preheader.us.i99 ]
  %add.i1416.us.i101 = phi i64 [ %add.i.us.i103.1, %for.body3.us.i111 ], [ %add.i.lcssa2123.us.i98, %for.cond1.preheader.us.i99 ]
  %niter167 = phi i64 [ %niter167.next.1, %for.body3.us.i111 ], [ 0, %for.cond1.preheader.us.i99 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i100, metadata !1329, metadata !DIExpression()), !dbg !1528
  %mul.i.us.i102 = mul i64 %add.i1416.us.i101, 1103515245, !dbg !1530
  %add.i.us.i103 = add i64 %mul.i.us.i102, 12345, !dbg !1532
  %shr.i.us.i104 = lshr i64 %add.i.us.i103, 16, !dbg !1533
  %29 = trunc i64 %shr.i.us.i104 to i32, !dbg !1534
  %conv.i.us.i105 = and i32 %29, 2147483647, !dbg !1534
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i105, metadata !95, metadata !DIExpression()), !dbg !1535
  %conv.us.i106 = sitofp i32 %conv.i.us.i105 to double, !dbg !1536
  %div.us.i107 = fdiv double %conv.us.i106, 0x41DFFFFFFFC00000, !dbg !1537
  %30 = add nuw nsw i64 %indvars.iv.i100, %28, !dbg !1538
  %arrayidx.us.i108 = getelementptr inbounds double, double* %15, i64 %30, !dbg !1538
  store double %div.us.i107, double* %arrayidx.us.i108, align 8, !dbg !1539, !tbaa !73
  %indvars.iv.next.i109 = or i64 %indvars.iv.i100, 1, !dbg !1540
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i109, metadata !1329, metadata !DIExpression()), !dbg !1528
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i109, metadata !1329, metadata !DIExpression()), !dbg !1528
  %mul.i.us.i102.1 = mul i64 %add.i.us.i103, 1103515245, !dbg !1530
  %add.i.us.i103.1 = add i64 %mul.i.us.i102.1, 12345, !dbg !1532
  %shr.i.us.i104.1 = lshr i64 %add.i.us.i103.1, 16, !dbg !1533
  %31 = trunc i64 %shr.i.us.i104.1 to i32, !dbg !1534
  %conv.i.us.i105.1 = and i32 %31, 2147483647, !dbg !1534
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i105.1, metadata !95, metadata !DIExpression()), !dbg !1535
  %conv.us.i106.1 = sitofp i32 %conv.i.us.i105.1 to double, !dbg !1536
  %div.us.i107.1 = fdiv double %conv.us.i106.1, 0x41DFFFFFFFC00000, !dbg !1537
  %32 = add nuw nsw i64 %indvars.iv.next.i109, %28, !dbg !1538
  %arrayidx.us.i108.1 = getelementptr inbounds double, double* %15, i64 %32, !dbg !1538
  store double %div.us.i107.1, double* %arrayidx.us.i108.1, align 8, !dbg !1539, !tbaa !73
  %indvars.iv.next.i109.1 = add nuw nsw i64 %indvars.iv.i100, 2, !dbg !1540
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i109.1, metadata !1329, metadata !DIExpression()), !dbg !1528
  %niter167.next.1 = add i64 %niter167, 2, !dbg !1529
  %niter167.ncmp.1 = icmp eq i64 %niter167.next.1, %unroll_iter166, !dbg !1529
  br i1 %niter167.ncmp.1, label %for.cond1.for.inc4_crit_edge.us.i114.unr-lcssa, label %for.body3.us.i111, !dbg !1529, !llvm.loop !1541

for.cond1.for.inc4_crit_edge.us.i114.unr-lcssa:   ; preds = %for.body3.us.i111, %for.cond1.preheader.us.i99
  %add.i.us.i103.lcssa.ph = phi i64 [ undef, %for.cond1.preheader.us.i99 ], [ %add.i.us.i103.1, %for.body3.us.i111 ]
  %indvars.iv.i100.unr = phi i64 [ 0, %for.cond1.preheader.us.i99 ], [ %indvars.iv.next.i109.1, %for.body3.us.i111 ]
  %add.i1416.us.i101.unr = phi i64 [ %add.i.lcssa2123.us.i98, %for.cond1.preheader.us.i99 ], [ %add.i.us.i103.1, %for.body3.us.i111 ]
  br i1 %lcmp.mod164.not, label %for.cond1.for.inc4_crit_edge.us.i114, label %for.body3.us.i111.epil, !dbg !1529

for.body3.us.i111.epil:                           ; preds = %for.cond1.for.inc4_crit_edge.us.i114.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i100.unr, metadata !1329, metadata !DIExpression()), !dbg !1528
  %mul.i.us.i102.epil = mul i64 %add.i1416.us.i101.unr, 1103515245, !dbg !1530
  %add.i.us.i103.epil = add i64 %mul.i.us.i102.epil, 12345, !dbg !1532
  %shr.i.us.i104.epil = lshr i64 %add.i.us.i103.epil, 16, !dbg !1533
  %33 = trunc i64 %shr.i.us.i104.epil to i32, !dbg !1534
  %conv.i.us.i105.epil = and i32 %33, 2147483647, !dbg !1534
  call void @llvm.dbg.value(metadata i32 %conv.i.us.i105.epil, metadata !95, metadata !DIExpression()), !dbg !1535
  %conv.us.i106.epil = sitofp i32 %conv.i.us.i105.epil to double, !dbg !1536
  %div.us.i107.epil = fdiv double %conv.us.i106.epil, 0x41DFFFFFFFC00000, !dbg !1537
  %34 = add nuw nsw i64 %indvars.iv.i100.unr, %28, !dbg !1538
  %arrayidx.us.i108.epil = getelementptr inbounds double, double* %15, i64 %34, !dbg !1538
  store double %div.us.i107.epil, double* %arrayidx.us.i108.epil, align 8, !dbg !1539, !tbaa !73
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i100.unr, metadata !1329, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !1528
  br label %for.cond1.for.inc4_crit_edge.us.i114, !dbg !1543

for.cond1.for.inc4_crit_edge.us.i114:             ; preds = %for.body3.us.i111.epil, %for.cond1.for.inc4_crit_edge.us.i114.unr-lcssa
  %add.i.us.i103.lcssa = phi i64 [ %add.i.us.i103.lcssa.ph, %for.cond1.for.inc4_crit_edge.us.i114.unr-lcssa ], [ %add.i.us.i103.epil, %for.body3.us.i111.epil ], !dbg !1532
  %indvars.iv.next29.i112 = add nuw nsw i64 %indvars.iv28.i97, 1, !dbg !1543
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next29.i112, metadata !1328, metadata !DIExpression()), !dbg !1528
  %exitcond33.not.i113 = icmp eq i64 %indvars.iv.next29.i112, %17, !dbg !1544
  br i1 %exitcond33.not.i113, label %for.cond.for.end6_crit_edge.split.us.i115, label %for.cond1.preheader.us.i99, !dbg !1526, !llvm.loop !1545

for.cond.for.end6_crit_edge.split.us.i115:        ; preds = %for.cond1.for.inc4_crit_edge.us.i114
  store i64 %add.i.us.i103.lcssa, i64* @rand_nxt, align 8, !dbg !1547, !tbaa !97
  br label %init_matrix.exit116, !dbg !1526

init_matrix.exit116:                              ; preds = %for.cond.for.end6_crit_edge.split.us.i115, %if.end9
  %35 = load i32, i32* %rand_check, align 4, !dbg !1548, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %35, metadata !1431, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 %35, metadata !1436, metadata !DIExpression()), !dbg !1453
  %36 = load i32, i32* %verify, align 4, !dbg !1549, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %36, metadata !1430, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 %36, metadata !1437, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 0, metadata !1438, metadata !DIExpression()), !dbg !1550
  %37 = load i32, i32* %round, align 4, !dbg !1551, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %37, metadata !1435, metadata !DIExpression()), !dbg !1453
  %cmp13153 = icmp sgt i32 %37, 0, !dbg !1552
  br i1 %cmp13153, label %for.body.lr.ph, label %for.cond.cleanup, !dbg !1553

for.body.lr.ph:                                   ; preds = %init_matrix.exit116
  %38 = bitcast %struct.timeval* %t1 to i8*
  %39 = bitcast %struct.timeval* %t2 to i8*
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1
  %tv_sec.i118 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0
  %tv_usec.i120 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1
  br label %for.body, !dbg !1553

for.cond.cleanup:                                 ; preds = %if.end42, %init_matrix.exit116
  call void @llvm.dbg.value(metadata double* %14, metadata !1408, metadata !DIExpression()) #21, !dbg !1554
  call void @free(i8* noundef %call.i) #21, !dbg !1556
  call void @llvm.dbg.value(metadata double* %15, metadata !1408, metadata !DIExpression()) #21, !dbg !1557
  call void @free(i8* noundef %call.i88) #21, !dbg !1559
  call void @llvm.dbg.value(metadata double* %16, metadata !1408, metadata !DIExpression()) #21, !dbg !1560
  call void @free(i8* noundef %call.i92) #21, !dbg !1562
  br label %cleanup

for.body:                                         ; preds = %if.end42, %for.body.lr.ph
  %r.0154 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %if.end42 ]
  call void @llvm.dbg.value(metadata i32 %r.0154, metadata !1438, metadata !DIExpression()), !dbg !1550
  call void @llvm.dbg.value(metadata i32 %35, metadata !1431, metadata !DIExpression()), !dbg !1453
  store i32 %35, i32* %rand_check, align 4, !dbg !1563, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %36, metadata !1430, metadata !DIExpression()), !dbg !1453
  store i32 %36, i32* %verify, align 4, !dbg !1564, !tbaa !1456
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %38) #21, !dbg !1565
  call void @llvm.dbg.declare(metadata %struct.timeval* %t1, metadata !1440, metadata !DIExpression()), !dbg !1566
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %39) #21, !dbg !1565
  call void @llvm.dbg.declare(metadata %struct.timeval* %t2, metadata !1443, metadata !DIExpression()), !dbg !1567
  %call14 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #21, !dbg !1568
  %40 = load i32, i32* %n, align 4, !dbg !1569, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %40, metadata !1434, metadata !DIExpression()), !dbg !1453
  call void @OptimizedStrassenMultiply(double* noundef %16, double* noundef %14, double* noundef %15, i32 noundef %40, i32 noundef %40, i32 noundef %40, i32 noundef %40), !dbg !1569
  %call15 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #21, !dbg !1570
  call void @llvm.dbg.value(metadata %struct.timeval* %t2, metadata !45, metadata !DIExpression()), !dbg !1571
  %41 = load i64, i64* %tv_sec.i, align 8, !dbg !1573, !tbaa !48
  %42 = load i64, i64* %tv_usec.i, align 8, !dbg !1574, !tbaa !55
  call void @llvm.dbg.value(metadata %struct.timeval* %t1, metadata !45, metadata !DIExpression()), !dbg !1575
  %43 = load i64, i64* %tv_sec.i118, align 8, !dbg !1577, !tbaa !48
  %44 = load i64, i64* %tv_usec.i120, align 8, !dbg !1578, !tbaa !55
  %reass.add = sub i64 %41, %43
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i = sub i64 %42, %44, !dbg !1579
  %sub18 = add i64 %add.i, %reass.mul, !dbg !1580
  %div = udiv i64 %sub18, 1000, !dbg !1581
  call void @llvm.dbg.value(metadata i64 %div, metadata !1444, metadata !DIExpression()), !dbg !1582
  %conv = uitofp i64 %div to double, !dbg !1583
  %div19 = fdiv double %conv, 1.000000e+03, !dbg !1584
  %call20 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i64 0, i64 0), double noundef %div19), !dbg !1585
  %45 = load i32, i32* %rand_check, align 4, !dbg !1586, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %45, metadata !1431, metadata !DIExpression()), !dbg !1453
  %tobool21.not = icmp eq i32 %45, 0, !dbg !1586
  br i1 %tobool21.not, label %if.else, label %if.then22, !dbg !1587

if.then22:                                        ; preds = %for.body
  %46 = load i32, i32* %n, align 4, !dbg !1588, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %46, metadata !1434, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 %46, metadata !1305, metadata !DIExpression()) #21, !dbg !1589
  %conv.i122 = sext i32 %46 to i64, !dbg !1591
  %mul.i123 = shl nsw i64 %conv.i122, 3, !dbg !1592
  %call.i124 = call noalias i8* @malloc(i64 noundef %mul.i123) #21, !dbg !1593
  %47 = bitcast i8* %call.i124 to double*, !dbg !1594
  call void @llvm.dbg.value(metadata double* %47, metadata !1445, metadata !DIExpression()), !dbg !1595
  call void @llvm.dbg.value(metadata i32 %46, metadata !1305, metadata !DIExpression()) #21, !dbg !1596
  %call.i127 = call noalias i8* @malloc(i64 noundef %mul.i123) #21, !dbg !1598
  %48 = bitcast i8* %call.i127 to double*, !dbg !1599
  call void @llvm.dbg.value(metadata double* %48, metadata !1448, metadata !DIExpression()), !dbg !1595
  call void @llvm.dbg.value(metadata i32 %46, metadata !1305, metadata !DIExpression()) #21, !dbg !1600
  %call.i130 = call noalias i8* @malloc(i64 noundef %mul.i123) #21, !dbg !1602
  %49 = bitcast i8* %call.i130 to double*, !dbg !1603
  call void @llvm.dbg.value(metadata double* %49, metadata !1449, metadata !DIExpression()), !dbg !1595
  call void @mat_vec_mul(i32 noundef %46, i32 noundef %46, i32 noundef %46, double* noundef %15, double* noundef %47, double* noundef %48, i32 noundef 0), !dbg !1604
  call void @mat_vec_mul(i32 noundef %46, i32 noundef %46, i32 noundef %46, double* noundef %14, double* noundef %48, double* noundef %49, i32 noundef 0), !dbg !1605
  call void @mat_vec_mul(i32 noundef %46, i32 noundef %46, i32 noundef %46, double* noundef %16, double* noundef %47, double* noundef %48, i32 noundef 0), !dbg !1606
  call void @llvm.dbg.value(metadata i32 %46, metadata !1273, metadata !DIExpression()) #21, !dbg !1607
  call void @llvm.dbg.value(metadata double* %48, metadata !1274, metadata !DIExpression()) #21, !dbg !1607
  call void @llvm.dbg.value(metadata double* %49, metadata !1275, metadata !DIExpression()) #21, !dbg !1607
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !1278, metadata !DIExpression()) #21, !dbg !1607
  call void @llvm.dbg.value(metadata i32 0, metadata !1276, metadata !DIExpression()) #21, !dbg !1607
  %cmp20.i = icmp sgt i32 %46, 0, !dbg !1609
  br i1 %cmp20.i, label %for.body.preheader.i, label %for.end.i, !dbg !1610

for.body.preheader.i:                             ; preds = %if.then22
  %wide.trip.count.i = zext i32 %46 to i64, !dbg !1609
  br label %for.body.i, !dbg !1610

for.body.i:                                       ; preds = %for.inc.i, %for.body.preheader.i
  %indvars.iv.i131 = phi i64 [ 0, %for.body.preheader.i ], [ %indvars.iv.next.i133, %for.inc.i ]
  %sum.022.i = phi double [ 0.000000e+00, %for.body.preheader.i ], [ %add.i132, %for.inc.i ]
  call void @llvm.dbg.value(metadata double %sum.022.i, metadata !1278, metadata !DIExpression()) #21, !dbg !1607
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i131, metadata !1276, metadata !DIExpression()) #21, !dbg !1607
  %arrayidx.i = getelementptr inbounds double, double* %48, i64 %indvars.iv.i131, !dbg !1611
  %50 = load double, double* %arrayidx.i, align 8, !dbg !1611, !tbaa !73
  %arrayidx2.i = getelementptr inbounds double, double* %49, i64 %indvars.iv.i131, !dbg !1612
  %51 = load double, double* %arrayidx2.i, align 8, !dbg !1612, !tbaa !73
  %sub.i = fsub double %50, %51, !dbg !1613
  call void @llvm.dbg.value(metadata double %sub.i, metadata !1277, metadata !DIExpression()) #21, !dbg !1607
  %cmp3.i = fcmp olt double %sub.i, 0.000000e+00, !dbg !1614
  %fneg.i = fneg double %sub.i, !dbg !1615
  %c.0.i = select i1 %cmp3.i, double %fneg.i, double %sub.i, !dbg !1615
  call void @llvm.dbg.value(metadata double %c.0.i, metadata !1277, metadata !DIExpression()) #21, !dbg !1607
  call void @llvm.dbg.value(metadata double undef, metadata !1278, metadata !DIExpression()) #21, !dbg !1607
  %cmp4.i = fcmp ogt double %c.0.i, 0x3EB0C6F7A0B5ED8D, !dbg !1616
  br i1 %cmp4.i, label %compare_vec.exit, label %for.inc.i, !dbg !1617

for.inc.i:                                        ; preds = %for.body.i
  %add.i132 = fadd double %sum.022.i, %c.0.i, !dbg !1618
  call void @llvm.dbg.value(metadata double %add.i132, metadata !1278, metadata !DIExpression()) #21, !dbg !1607
  %indvars.iv.next.i133 = add nuw nsw i64 %indvars.iv.i131, 1, !dbg !1619
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i133, metadata !1276, metadata !DIExpression()) #21, !dbg !1607
  %exitcond.not.i134 = icmp eq i64 %indvars.iv.next.i133, %wide.trip.count.i, !dbg !1609
  br i1 %exitcond.not.i134, label %for.end.i, label %for.body.i, !dbg !1610, !llvm.loop !1620

for.end.i:                                        ; preds = %for.inc.i, %if.then22
  %sum.0.lcssa.i = phi double [ 0.000000e+00, %if.then22 ], [ %add.i132, %for.inc.i ], !dbg !1607
  %call.i135 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), double noundef %sum.0.lcssa.i) #21, !dbg !1622
  br label %compare_vec.exit, !dbg !1623

compare_vec.exit:                                 ; preds = %for.end.i, %for.body.i
  %retval.0.i = phi i32 [ 0, %for.end.i ], [ -1, %for.body.i ], !dbg !1607
  call void @llvm.dbg.value(metadata i32 %retval.0.i, metadata !1431, metadata !DIExpression()), !dbg !1453
  store i32 %retval.0.i, i32* %rand_check, align 4, !dbg !1624, !tbaa !1456
  call void @llvm.dbg.value(metadata double* %47, metadata !1316, metadata !DIExpression()) #21, !dbg !1625
  call void @free(i8* noundef %call.i124) #21, !dbg !1627
  call void @llvm.dbg.value(metadata double* %48, metadata !1316, metadata !DIExpression()) #21, !dbg !1628
  call void @free(i8* noundef %call.i127) #21, !dbg !1630
  call void @llvm.dbg.value(metadata double* %49, metadata !1316, metadata !DIExpression()) #21, !dbg !1631
  call void @free(i8* noundef %call.i130) #21, !dbg !1633
  %.pre157 = load i32, i32* %verify, align 4
  br label %if.end33, !dbg !1634

if.else:                                          ; preds = %for.body
  %52 = load i32, i32* %verify, align 4, !dbg !1635, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %52, metadata !1430, metadata !DIExpression()), !dbg !1453
  %tobool27.not = icmp eq i32 %52, 0, !dbg !1635
  br i1 %tobool27.not, label %if.end33, label %if.then28, !dbg !1636

if.then28:                                        ; preds = %if.else
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1637, !tbaa !1416
  %54 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.10, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %53) #22, !dbg !1638
  %55 = load i32, i32* %n, align 4, !dbg !1639, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %55, metadata !1434, metadata !DIExpression()), !dbg !1453
  call void @llvm.dbg.value(metadata i32 %55, metadata !1398, metadata !DIExpression()) #21, !dbg !1640
  %mul.i136 = mul nsw i32 %55, %55, !dbg !1642
  %conv.i137 = zext i32 %mul.i136 to i64, !dbg !1643
  %mul1.i138 = shl nuw nsw i64 %conv.i137, 3, !dbg !1644
  %call.i139 = call noalias i8* @malloc(i64 noundef %mul1.i138) #21, !dbg !1645
  %56 = bitcast i8* %call.i139 to double*, !dbg !1646
  call void @llvm.dbg.value(metadata double* %56, metadata !1450, metadata !DIExpression()), !dbg !1647
  call void @llvm.dbg.value(metadata i32 %55, metadata !206, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata double* %14, metadata !207, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata i32 %55, metadata !208, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata double* %15, metadata !209, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata i32 %55, metadata !210, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata double* %56, metadata !211, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata i32 %55, metadata !212, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata i32 0, metadata !213, metadata !DIExpression()) #21, !dbg !1648
  %cmp44.i = icmp sgt i32 %55, 0, !dbg !1650
  br i1 %cmp44.i, label %for.cond1.preheader.us.us.preheader.i, label %compare_matrix.exit, !dbg !1651

for.cond1.preheader.us.us.preheader.i:            ; preds = %if.then28
  %57 = zext i32 %55 to i64, !dbg !1651
  %xtraiter168 = and i64 %57, 1
  %58 = icmp eq i32 %55, 1
  %unroll_iter171 = and i64 %57, 4294967294
  %lcmp.mod169.not = icmp eq i64 %xtraiter168, 0
  br label %for.cond1.preheader.us.us.i, !dbg !1651

for.cond1.preheader.us.us.i:                      ; preds = %for.cond1.for.inc19_crit_edge.split.us.us.us.i, %for.cond1.preheader.us.us.preheader.i
  %indvars.iv66.i = phi i64 [ 0, %for.cond1.preheader.us.us.preheader.i ], [ %indvars.iv.next67.i, %for.cond1.for.inc19_crit_edge.split.us.us.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv66.i, metadata !213, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata i32 0, metadata !214, metadata !DIExpression()) #21, !dbg !1648
  %59 = mul nuw nsw i64 %indvars.iv66.i, %57
  br label %for.cond4.preheader.us.us.us.i, !dbg !1652

for.cond4.preheader.us.us.us.i:                   ; preds = %for.cond4.for.end_crit_edge.us.us.us.i, %for.cond1.preheader.us.us.i
  %indvars.iv60.i = phi i64 [ %indvars.iv.next61.i, %for.cond4.for.end_crit_edge.us.us.us.i ], [ 0, %for.cond1.preheader.us.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv60.i, metadata !214, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !216, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata i32 0, metadata !215, metadata !DIExpression()) #21, !dbg !1648
  br i1 %58, label %for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa, label %for.body6.us.us.us.i, !dbg !1653

for.body6.us.us.us.i:                             ; preds = %for.body6.us.us.us.i, %for.cond4.preheader.us.us.us.i
  %indvars.iv.i140 = phi i64 [ %indvars.iv.next.i141.1, %for.body6.us.us.us.i ], [ 0, %for.cond4.preheader.us.us.us.i ]
  %s.040.us.us.us.i = phi double [ %71, %for.body6.us.us.us.i ], [ 0.000000e+00, %for.cond4.preheader.us.us.us.i ]
  %niter172 = phi i64 [ %niter172.next.1, %for.body6.us.us.us.i ], [ 0, %for.cond4.preheader.us.us.us.i ]
  call void @llvm.dbg.value(metadata double %s.040.us.us.us.i, metadata !216, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i140, metadata !215, metadata !DIExpression()) #21, !dbg !1648
  %60 = add nuw nsw i64 %indvars.iv.i140, %59, !dbg !1654
  %arrayidx.us.us.us.i = getelementptr inbounds double, double* %14, i64 %60, !dbg !1654
  %61 = load double, double* %arrayidx.us.us.us.i, align 8, !dbg !1654, !tbaa !73
  %62 = mul nuw nsw i64 %indvars.iv.i140, %57, !dbg !1655
  %63 = add nuw nsw i64 %62, %indvars.iv60.i, !dbg !1655
  %arrayidx10.us.us.us.i = getelementptr inbounds double, double* %15, i64 %63, !dbg !1655
  %64 = load double, double* %arrayidx10.us.us.us.i, align 8, !dbg !1655, !tbaa !73
  %65 = call double @llvm.fmuladd.f64(double %61, double %64, double %s.040.us.us.us.i) #21, !dbg !1656
  call void @llvm.dbg.value(metadata double %65, metadata !216, metadata !DIExpression()) #21, !dbg !1648
  %indvars.iv.next.i141 = or i64 %indvars.iv.i140, 1, !dbg !1657
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i141, metadata !215, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata double %65, metadata !216, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i141, metadata !215, metadata !DIExpression()) #21, !dbg !1648
  %66 = add nuw nsw i64 %indvars.iv.next.i141, %59, !dbg !1654
  %arrayidx.us.us.us.i.1 = getelementptr inbounds double, double* %14, i64 %66, !dbg !1654
  %67 = load double, double* %arrayidx.us.us.us.i.1, align 8, !dbg !1654, !tbaa !73
  %68 = mul nuw nsw i64 %indvars.iv.next.i141, %57, !dbg !1655
  %69 = add nuw nsw i64 %68, %indvars.iv60.i, !dbg !1655
  %arrayidx10.us.us.us.i.1 = getelementptr inbounds double, double* %15, i64 %69, !dbg !1655
  %70 = load double, double* %arrayidx10.us.us.us.i.1, align 8, !dbg !1655, !tbaa !73
  %71 = call double @llvm.fmuladd.f64(double %67, double %70, double %65) #21, !dbg !1656
  call void @llvm.dbg.value(metadata double %71, metadata !216, metadata !DIExpression()) #21, !dbg !1648
  %indvars.iv.next.i141.1 = add nuw nsw i64 %indvars.iv.i140, 2, !dbg !1657
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i141.1, metadata !215, metadata !DIExpression()) #21, !dbg !1648
  %niter172.next.1 = add i64 %niter172, 2, !dbg !1653
  %niter172.ncmp.1 = icmp eq i64 %niter172.next.1, %unroll_iter171, !dbg !1653
  br i1 %niter172.ncmp.1, label %for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa, label %for.body6.us.us.us.i, !dbg !1653, !llvm.loop !1658

for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa: ; preds = %for.body6.us.us.us.i, %for.cond4.preheader.us.us.us.i
  %.lcssa.ph = phi double [ undef, %for.cond4.preheader.us.us.us.i ], [ %71, %for.body6.us.us.us.i ]
  %indvars.iv.i140.unr = phi i64 [ 0, %for.cond4.preheader.us.us.us.i ], [ %indvars.iv.next.i141.1, %for.body6.us.us.us.i ]
  %s.040.us.us.us.i.unr = phi double [ 0.000000e+00, %for.cond4.preheader.us.us.us.i ], [ %71, %for.body6.us.us.us.i ]
  br i1 %lcmp.mod169.not, label %for.cond4.for.end_crit_edge.us.us.us.i, label %for.body6.us.us.us.i.epil, !dbg !1653

for.body6.us.us.us.i.epil:                        ; preds = %for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa
  call void @llvm.dbg.value(metadata double %s.040.us.us.us.i.unr, metadata !216, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i140.unr, metadata !215, metadata !DIExpression()) #21, !dbg !1648
  %72 = add nuw nsw i64 %indvars.iv.i140.unr, %59, !dbg !1654
  %arrayidx.us.us.us.i.epil = getelementptr inbounds double, double* %14, i64 %72, !dbg !1654
  %73 = load double, double* %arrayidx.us.us.us.i.epil, align 8, !dbg !1654, !tbaa !73
  %74 = mul nuw nsw i64 %indvars.iv.i140.unr, %57, !dbg !1655
  %75 = add nuw nsw i64 %74, %indvars.iv60.i, !dbg !1655
  %arrayidx10.us.us.us.i.epil = getelementptr inbounds double, double* %15, i64 %75, !dbg !1655
  %76 = load double, double* %arrayidx10.us.us.us.i.epil, align 8, !dbg !1655, !tbaa !73
  %77 = call double @llvm.fmuladd.f64(double %73, double %76, double %s.040.us.us.us.i.unr) #21, !dbg !1656
  call void @llvm.dbg.value(metadata double %77, metadata !216, metadata !DIExpression()) #21, !dbg !1648
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i140.unr, metadata !215, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #21, !dbg !1648
  br label %for.cond4.for.end_crit_edge.us.us.us.i, !dbg !1660

for.cond4.for.end_crit_edge.us.us.us.i:           ; preds = %for.body6.us.us.us.i.epil, %for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa
  %.lcssa = phi double [ %.lcssa.ph, %for.cond4.for.end_crit_edge.us.us.us.i.unr-lcssa ], [ %77, %for.body6.us.us.us.i.epil ], !dbg !1656
  %78 = add nuw nsw i64 %indvars.iv60.i, %59, !dbg !1660
  %arrayidx15.us.us.us.i = getelementptr inbounds double, double* %56, i64 %78, !dbg !1660
  store double %.lcssa, double* %arrayidx15.us.us.us.i, align 8, !dbg !1661, !tbaa !73
  %indvars.iv.next61.i = add nuw nsw i64 %indvars.iv60.i, 1, !dbg !1662
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next61.i, metadata !214, metadata !DIExpression()) #21, !dbg !1648
  %exitcond65.not.i = icmp eq i64 %indvars.iv.next61.i, %57, !dbg !1663
  br i1 %exitcond65.not.i, label %for.cond1.for.inc19_crit_edge.split.us.us.us.i, label %for.cond4.preheader.us.us.us.i, !dbg !1652, !llvm.loop !1664

for.cond1.for.inc19_crit_edge.split.us.us.us.i:   ; preds = %for.cond4.for.end_crit_edge.us.us.us.i
  %indvars.iv.next67.i = add nuw nsw i64 %indvars.iv66.i, 1, !dbg !1666
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next67.i, metadata !213, metadata !DIExpression()) #21, !dbg !1648
  %exitcond72.not.i = icmp eq i64 %indvars.iv.next67.i, %57, !dbg !1650
  br i1 %exitcond72.not.i, label %for.cond1.preheader.us.i144, label %for.cond1.preheader.us.us.i, !dbg !1651, !llvm.loop !1667

for.cond1.preheader.us.i144:                      ; preds = %for.cond1.for.inc16_crit_edge.us.i, %for.cond1.for.inc19_crit_edge.split.us.us.us.i
  %indvars.iv48.i = phi i64 [ %indvars.iv.next49.i, %for.cond1.for.inc16_crit_edge.us.i ], [ 0, %for.cond1.for.inc19_crit_edge.split.us.us.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv48.i, metadata !1365, metadata !DIExpression()), !dbg !1669
  call void @llvm.dbg.value(metadata i32 0, metadata !1366, metadata !DIExpression()), !dbg !1669
  %79 = mul nuw nsw i64 %indvars.iv48.i, %57
  br label %for.body3.us.i150, !dbg !1671

for.cond1.us.i:                                   ; preds = %for.body3.us.i150
  call void @llvm.dbg.value(metadata i32 undef, metadata !1366, metadata !DIExpression()), !dbg !1669
  %exitcond.not.i145 = icmp eq i64 %indvars.iv.next.i149, %57, !dbg !1672
  br i1 %exitcond.not.i145, label %for.cond1.for.inc16_crit_edge.us.i, label %for.body3.us.i150, !dbg !1671, !llvm.loop !1673

for.body3.us.i150:                                ; preds = %for.cond1.us.i, %for.cond1.preheader.us.i144
  %indvars.iv.i146 = phi i64 [ 0, %for.cond1.preheader.us.i144 ], [ %indvars.iv.next.i149, %for.cond1.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i146, metadata !1366, metadata !DIExpression()), !dbg !1669
  %80 = add nuw nsw i64 %indvars.iv.i146, %79, !dbg !1675
  %arrayidx.us.i147 = getelementptr inbounds double, double* %16, i64 %80, !dbg !1675
  %81 = load double, double* %arrayidx.us.i147, align 8, !dbg !1675, !tbaa !73
  %arrayidx7.us.i = getelementptr inbounds double, double* %56, i64 %80, !dbg !1676
  %82 = load double, double* %arrayidx7.us.i, align 8, !dbg !1676, !tbaa !73
  %sub.us.i = fsub double %81, %82, !dbg !1677
  call void @llvm.dbg.value(metadata double %sub.us.i, metadata !1367, metadata !DIExpression()), !dbg !1669
  %cmp8.us.i = fcmp olt double %sub.us.i, 0.000000e+00, !dbg !1678
  %fneg.us.i = fneg double %sub.us.i, !dbg !1679
  %c.0.us.i = select i1 %cmp8.us.i, double %fneg.us.i, double %sub.us.i, !dbg !1679
  call void @llvm.dbg.value(metadata double %c.0.us.i, metadata !1367, metadata !DIExpression()), !dbg !1669
  %div.us.i148 = fdiv double %c.0.us.i, %81, !dbg !1680
  call void @llvm.dbg.value(metadata double %div.us.i148, metadata !1367, metadata !DIExpression()), !dbg !1669
  %cmp13.us.i = fcmp ogt double %div.us.i148, 0x3EB0C6F7A0B5ED8D, !dbg !1681
  %indvars.iv.next.i149 = add nuw nsw i64 %indvars.iv.i146, 1, !dbg !1682
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i149, metadata !1366, metadata !DIExpression()), !dbg !1669
  br i1 %cmp13.us.i, label %compare_matrix.exit, label %for.cond1.us.i, !dbg !1683

for.cond1.for.inc16_crit_edge.us.i:               ; preds = %for.cond1.us.i
  %indvars.iv.next49.i = add nuw nsw i64 %indvars.iv48.i, 1, !dbg !1684
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next49.i, metadata !1365, metadata !DIExpression()), !dbg !1669
  %exitcond54.not.i = icmp eq i64 %indvars.iv.next49.i, %57, !dbg !1685
  br i1 %exitcond54.not.i, label %compare_matrix.exit, label %for.cond1.preheader.us.i144, !dbg !1686, !llvm.loop !1687

compare_matrix.exit:                              ; preds = %for.cond1.for.inc16_crit_edge.us.i, %for.body3.us.i150, %if.then28
  %retval.0.i151 = phi i32 [ 0, %if.then28 ], [ -1, %for.body3.us.i150 ], [ 0, %for.cond1.for.inc16_crit_edge.us.i ], !dbg !1669
  call void @llvm.dbg.value(metadata i32 %retval.0.i151, metadata !1430, metadata !DIExpression()), !dbg !1453
  store i32 %retval.0.i151, i32* %verify, align 4, !dbg !1689, !tbaa !1456
  call void @llvm.dbg.value(metadata double* %56, metadata !1408, metadata !DIExpression()) #21, !dbg !1690
  call void @free(i8* noundef %call.i139) #21, !dbg !1692
  %.pre156 = load i32, i32* %rand_check, align 4, !dbg !1693, !tbaa !1456
  br label %if.end33, !dbg !1695

if.end33:                                         ; preds = %compare_matrix.exit, %if.else, %compare_vec.exit
  %83 = phi i32 [ 0, %if.else ], [ %retval.0.i151, %compare_matrix.exit ], [ %.pre157, %compare_vec.exit ]
  %84 = phi i32 [ 0, %if.else ], [ %.pre156, %compare_matrix.exit ], [ %retval.0.i, %compare_vec.exit ], !dbg !1693
  call void @llvm.dbg.value(metadata i32 %84, metadata !1431, metadata !DIExpression()), !dbg !1453
  %tobool34 = icmp ne i32 %84, 0, !dbg !1693
  call void @llvm.dbg.value(metadata i32 %83, metadata !1430, metadata !DIExpression()), !dbg !1453
  %tobool36 = icmp ne i32 %83, 0
  %or.cond = select i1 %tobool34, i1 true, i1 %tobool36, !dbg !1696
  %85 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1697, !tbaa !1416
  br i1 %or.cond, label %if.then37, label %if.else39, !dbg !1696

if.then37:                                        ; preds = %if.end33
  %86 = call i64 @fwrite(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.11, i64 0, i64 0), i64 14, i64 1, %struct._IO_FILE* %85) #22, !dbg !1698
  br label %if.end42, !dbg !1700

if.else39:                                        ; preds = %if.end33
  %87 = call i64 @fwrite(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.12, i64 0, i64 0), i64 24, i64 1, %struct._IO_FILE* %85) #22, !dbg !1701
  %88 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1703, !tbaa !1416
  %89 = load i32, i32* %n, align 4, !dbg !1704, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %89, metadata !1434, metadata !DIExpression()), !dbg !1453
  %call41 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %88, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.13, i64 0, i64 0), i32 noundef %89) #22, !dbg !1705
  br label %if.end42

if.end42:                                         ; preds = %if.else39, %if.then37
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %39) #21, !dbg !1706
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %38) #21, !dbg !1706
  %inc = add nuw nsw i32 %r.0154, 1, !dbg !1707
  call void @llvm.dbg.value(metadata i32 %inc, metadata !1438, metadata !DIExpression()), !dbg !1550
  %90 = load i32, i32* %round, align 4, !dbg !1551, !tbaa !1456
  call void @llvm.dbg.value(metadata i32 %90, metadata !1435, metadata !DIExpression()), !dbg !1453
  %cmp13 = icmp slt i32 %inc, %90, !dbg !1552
  br i1 %cmp13, label %for.body, label %for.cond.cleanup, !dbg !1553, !llvm.loop !1708

cleanup:                                          ; preds = %for.cond.cleanup, %if.then7, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 1, %if.then7 ], [ 0, %for.cond.cleanup ], !dbg !1453
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #21, !dbg !1710
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #21, !dbg !1710
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #21, !dbg !1710
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #21, !dbg !1710
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #21, !dbg !1710
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #21, !dbg !1710
  ret i32 %retval.0, !dbg !1710
}

declare !dbg !1711 dso_local void @get_options(i32 noundef, i8** noundef, i8** noundef, i32* noundef, ...) local_unnamed_addr #18

; Function Attrs: nofree nounwind
declare !dbg !1717 dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #14

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #19

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctpop.i32(i32) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #20

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umax.i32(i32, i32) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { mustprogress nofree nounwind willreturn writeonly "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { inaccessiblememonly mustprogress nofree nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { inaccessiblemem_or_argmemonly mustprogress nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { argmemonly nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #18 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #19 = { nofree nounwind }
attributes #20 = { argmemonly nofree nounwind willreturn writeonly }
attributes #21 = { nounwind }
attributes #22 = { cold }
attributes #23 = { cold nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "rand_nxt", scope: !2, file: !3, line: 78, type: !10, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "strassen.c", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "4b7e3135c6d5653247a4f18a43ba4db1")
!4 = !{!5, !6, !9, !11, !8}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "REAL", file: !3, line: 64, baseType: !8)
!8 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "PTR", file: !3, line: 65, baseType: !10)
!10 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !{!0, !14, !21}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "specifiers", scope: !2, file: !3, line: 809, type: !16, isLocal: false, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 448, elements: !19)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!19 = !{!20}
!20 = !DISubrange(count: 7)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "opt_types", scope: !2, file: !3, line: 810, type: !23, isLocal: false, isDefinition: true)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 224, elements: !19)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{i32 7, !"Dwarf Version", i32 5}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{i32 7, !"uwtable", i32 1}
!29 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)"}
!30 = distinct !DISubprogram(name: "todval", scope: !3, file: !3, line: 43, type: !31, scopeLine: 43, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !44)
!31 = !DISubroutineType(types: !32)
!32 = !{!33, !34}
!33 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !36, line: 30, size: 128, elements: !37)
!36 = !DIFile(filename: "/usr/include/bits/time.h", directory: "", checksumkind: CSK_MD5, checksum: "7275d681a2390320bc78ae3cf595b8d2")
!37 = !{!38, !42}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !35, file: !36, line: 32, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !40, line: 148, baseType: !41)
!40 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "77efac6352c67c8f56830ba4c854379f")
!41 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !35, file: !36, line: 33, baseType: !43, size: 64, offset: 64)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !40, line: 150, baseType: !41)
!44 = !{!45}
!45 = !DILocalVariable(name: "tp", arg: 1, scope: !30, file: !3, line: 43, type: !34)
!46 = !DILocation(line: 0, scope: !30)
!47 = !DILocation(line: 44, column: 16, scope: !30)
!48 = !{!49, !50, i64 0}
!49 = !{!"timeval", !50, i64 0, !50, i64 8}
!50 = !{!"long", !51, i64 0}
!51 = !{!"omnipotent char", !52, i64 0}
!52 = !{!"Simple C/C++ TBAA"}
!53 = !DILocation(line: 44, column: 30, scope: !30)
!54 = !DILocation(line: 44, column: 43, scope: !30)
!55 = !{!49, !50, i64 8}
!56 = !DILocation(line: 44, column: 37, scope: !30)
!57 = !DILocation(line: 44, column: 5, scope: !30)
!58 = distinct !DISubprogram(name: "startup_cilk", scope: !3, file: !3, line: 48, type: !59, scopeLine: 48, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !61)
!59 = !DISubroutineType(types: !60)
!60 = !{null}
!61 = !{!62, !63, !65, !66, !67, !68}
!62 = !DILocalVariable(name: "g", scope: !58, file: !3, line: 49, type: !8)
!63 = !DILocalVariable(name: "__init", scope: !64, type: !24, flags: DIFlagArtificial)
!64 = distinct !DILexicalBlock(scope: !58, file: !3, line: 50, column: 3)
!65 = !DILocalVariable(name: "__limit", scope: !64, type: !24, flags: DIFlagArtificial)
!66 = !DILocalVariable(name: "__begin", scope: !64, type: !24, flags: DIFlagArtificial)
!67 = !DILocalVariable(name: "__end", scope: !64, type: !24, flags: DIFlagArtificial)
!68 = !DILocalVariable(name: "i", scope: !69, file: !3, line: 50, type: !24)
!69 = distinct !DILexicalBlock(scope: !64, file: !3, line: 50, column: 3)
!70 = !DILocation(line: 0, scope: !58)
!71 = !DILocation(line: 49, column: 3, scope: !58)
!72 = !DILocation(line: 49, column: 10, scope: !58)
!73 = !{!74, !74, i64 0}
!74 = !{!"double", !51, i64 0}
!75 = !DILocation(line: 0, scope: !64)
!76 = !DILocation(line: 50, column: 24, scope: !64)
!77 = !DILocation(line: 50, column: 3, scope: !64)
!78 = !DILocation(line: 0, scope: !69)
!79 = !DILocation(line: 51, column: 14, scope: !80)
!80 = distinct !DILexicalBlock(scope: !69, file: !3, line: 50, column: 36)
!81 = !DILocation(line: 51, column: 10, scope: !80)
!82 = !DILocation(line: 51, column: 7, scope: !80)
!83 = !DILocation(line: 52, column: 3, scope: !80)
!84 = !DILocation(line: 50, column: 32, scope: !69)
!85 = !DILocation(line: 50, column: 24, scope: !69)
!86 = !DILocation(line: 50, column: 3, scope: !69)
!87 = distinct !{!87, !77, !88, !89}
!88 = !DILocation(line: 52, column: 3, scope: !64)
!89 = !{!"tapir.loop.spawn.strategy", i32 1}
!90 = !DILocation(line: 53, column: 1, scope: !58)
!91 = distinct !DISubprogram(name: "cilk_rand", scope: !3, file: !3, line: 80, type: !92, scopeLine: 80, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !94)
!92 = !DISubroutineType(types: !93)
!93 = !{!24}
!94 = !{!95}
!95 = !DILocalVariable(name: "result", scope: !91, file: !3, line: 81, type: !24)
!96 = !DILocation(line: 82, column: 14, scope: !91)
!97 = !{!50, !50, i64 0}
!98 = !DILocation(line: 82, column: 23, scope: !91)
!99 = !DILocation(line: 82, column: 36, scope: !91)
!100 = !DILocation(line: 82, column: 12, scope: !91)
!101 = !DILocation(line: 83, column: 22, scope: !91)
!102 = !DILocation(line: 83, column: 12, scope: !91)
!103 = !DILocation(line: 0, scope: !91)
!104 = !DILocation(line: 84, column: 3, scope: !91)
!105 = distinct !DISubprogram(name: "mat_vec_mul", scope: !3, file: !3, line: 93, type: !106, scopeLine: 93, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !108)
!106 = !DISubroutineType(types: !107)
!107 = !{null, !24, !24, !24, !6, !6, !6, !24}
!108 = !{!109, !110, !111, !112, !113, !114, !115, !116, !119, !120, !126, !131, !134}
!109 = !DILocalVariable(name: "m", arg: 1, scope: !105, file: !3, line: 93, type: !24)
!110 = !DILocalVariable(name: "n", arg: 2, scope: !105, file: !3, line: 93, type: !24)
!111 = !DILocalVariable(name: "rw", arg: 3, scope: !105, file: !3, line: 93, type: !24)
!112 = !DILocalVariable(name: "A", arg: 4, scope: !105, file: !3, line: 93, type: !6)
!113 = !DILocalVariable(name: "V", arg: 5, scope: !105, file: !3, line: 93, type: !6)
!114 = !DILocalVariable(name: "P", arg: 6, scope: !105, file: !3, line: 93, type: !6)
!115 = !DILocalVariable(name: "add", arg: 7, scope: !105, file: !3, line: 93, type: !24)
!116 = !DILocalVariable(name: "i", scope: !117, file: !3, line: 96, type: !24)
!117 = distinct !DILexicalBlock(scope: !118, file: !3, line: 95, column: 21)
!118 = distinct !DILexicalBlock(scope: !105, file: !3, line: 95, column: 6)
!119 = !DILocalVariable(name: "j", scope: !117, file: !3, line: 96, type: !24)
!120 = !DILocalVariable(name: "c", scope: !121, file: !3, line: 100, type: !7)
!121 = distinct !DILexicalBlock(scope: !122, file: !3, line: 99, column: 30)
!122 = distinct !DILexicalBlock(scope: !123, file: !3, line: 99, column: 7)
!123 = distinct !DILexicalBlock(scope: !124, file: !3, line: 99, column: 7)
!124 = distinct !DILexicalBlock(scope: !125, file: !3, line: 98, column: 13)
!125 = distinct !DILexicalBlock(scope: !117, file: !3, line: 98, column: 8)
!126 = !DILocalVariable(name: "c", scope: !127, file: !3, line: 108, type: !7)
!127 = distinct !DILexicalBlock(scope: !128, file: !3, line: 107, column: 30)
!128 = distinct !DILexicalBlock(scope: !129, file: !3, line: 107, column: 7)
!129 = distinct !DILexicalBlock(scope: !130, file: !3, line: 107, column: 7)
!130 = distinct !DILexicalBlock(scope: !125, file: !3, line: 106, column: 12)
!131 = !DILocalVariable(name: "m1", scope: !132, file: !3, line: 117, type: !24)
!132 = distinct !DILexicalBlock(scope: !133, file: !3, line: 116, column: 23)
!133 = distinct !DILexicalBlock(scope: !118, file: !3, line: 116, column: 14)
!134 = !DILocalVariable(name: "n1", scope: !135, file: !3, line: 122, type: !24)
!135 = distinct !DILexicalBlock(scope: !133, file: !3, line: 121, column: 10)
!136 = !DILocation(line: 0, scope: !105)
!137 = !DILocation(line: 95, column: 9, scope: !118)
!138 = !DILocation(line: 95, column: 14, scope: !118)
!139 = !DILocation(line: 95, column: 6, scope: !105)
!140 = !DILocation(line: 98, column: 8, scope: !125)
!141 = !DILocation(line: 98, column: 8, scope: !117)
!142 = !DILocation(line: 0, scope: !117)
!143 = !DILocation(line: 99, column: 20, scope: !122)
!144 = !DILocation(line: 99, column: 7, scope: !123)
!145 = !DILocation(line: 101, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !121, file: !3, line: 101, column: 9)
!147 = !DILocation(line: 99, column: 26, scope: !122)
!148 = !DILocation(line: 104, column: 14, scope: !121)
!149 = distinct !{!149, !144, !150, !151, !152}
!150 = !DILocation(line: 105, column: 7, scope: !123)
!151 = !{!"llvm.loop.mustprogress"}
!152 = !{!"llvm.loop.isvectorized", i32 1}
!153 = !DILocation(line: 0, scope: !121)
!154 = !DILocation(line: 102, column: 16, scope: !155)
!155 = distinct !DILexicalBlock(scope: !156, file: !3, line: 101, column: 32)
!156 = distinct !DILexicalBlock(scope: !146, file: !3, line: 101, column: 9)
!157 = !DILocation(line: 102, column: 36, scope: !155)
!158 = !DILocation(line: 102, column: 13, scope: !155)
!159 = !DILocation(line: 101, column: 28, scope: !156)
!160 = distinct !{!160, !145, !161, !151}
!161 = !DILocation(line: 103, column: 9, scope: !146)
!162 = distinct !{!162, !163}
!163 = !{!"llvm.loop.unroll.disable"}
!164 = !DILocation(line: 104, column: 9, scope: !121)
!165 = distinct !{!165, !144, !150, !151}
!166 = !DILocation(line: 107, column: 20, scope: !128)
!167 = !DILocation(line: 107, column: 7, scope: !129)
!168 = !DILocation(line: 109, column: 9, scope: !169)
!169 = distinct !DILexicalBlock(scope: !127, file: !3, line: 109, column: 9)
!170 = !DILocation(line: 112, column: 14, scope: !127)
!171 = !DILocation(line: 0, scope: !127)
!172 = !DILocation(line: 127, column: 1, scope: !105)
!173 = !DILocation(line: 110, column: 16, scope: !174)
!174 = distinct !DILexicalBlock(scope: !175, file: !3, line: 109, column: 32)
!175 = distinct !DILexicalBlock(scope: !169, file: !3, line: 109, column: 9)
!176 = !DILocation(line: 110, column: 36, scope: !174)
!177 = !DILocation(line: 110, column: 13, scope: !174)
!178 = !DILocation(line: 109, column: 28, scope: !175)
!179 = distinct !{!179, !168, !180, !151}
!180 = !DILocation(line: 111, column: 9, scope: !169)
!181 = distinct !{!181, !163}
!182 = !DILocation(line: 112, column: 9, scope: !127)
!183 = !DILocation(line: 107, column: 26, scope: !128)
!184 = distinct !{!184, !167, !185, !151}
!185 = !DILocation(line: 113, column: 7, scope: !129)
!186 = distinct !{!186, !144, !150, !151, !187, !152}
!187 = !{!"llvm.loop.unroll.runtime.disable"}
!188 = !DILocation(line: 116, column: 16, scope: !133)
!189 = !DILocation(line: 116, column: 14, scope: !118)
!190 = !DILocation(line: 117, column: 16, scope: !132)
!191 = !DILocation(line: 0, scope: !132)
!192 = !DILocation(line: 118, column: 5, scope: !132)
!193 = !DILocation(line: 119, column: 19, scope: !132)
!194 = !DILocation(line: 119, column: 33, scope: !132)
!195 = !DILocation(line: 119, column: 58, scope: !132)
!196 = !DILocation(line: 122, column: 16, scope: !135)
!197 = !DILocation(line: 0, scope: !135)
!198 = !DILocation(line: 123, column: 5, scope: !135)
!199 = !DILocation(line: 125, column: 22, scope: !135)
!200 = !DILocation(line: 125, column: 33, scope: !135)
!201 = !DILocation(line: 125, column: 55, scope: !135)
!202 = distinct !DISubprogram(name: "matrixmul", scope: !3, file: !3, line: 132, type: !203, scopeLine: 132, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !205)
!203 = !DISubroutineType(types: !204)
!204 = !{null, !24, !6, !24, !6, !24, !6, !24}
!205 = !{!206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216}
!206 = !DILocalVariable(name: "n", arg: 1, scope: !202, file: !3, line: 132, type: !24)
!207 = !DILocalVariable(name: "A", arg: 2, scope: !202, file: !3, line: 132, type: !6)
!208 = !DILocalVariable(name: "an", arg: 3, scope: !202, file: !3, line: 132, type: !24)
!209 = !DILocalVariable(name: "B", arg: 4, scope: !202, file: !3, line: 132, type: !6)
!210 = !DILocalVariable(name: "bn", arg: 5, scope: !202, file: !3, line: 132, type: !24)
!211 = !DILocalVariable(name: "C", arg: 6, scope: !202, file: !3, line: 132, type: !6)
!212 = !DILocalVariable(name: "cn", arg: 7, scope: !202, file: !3, line: 132, type: !24)
!213 = !DILocalVariable(name: "i", scope: !202, file: !3, line: 134, type: !24)
!214 = !DILocalVariable(name: "j", scope: !202, file: !3, line: 134, type: !24)
!215 = !DILocalVariable(name: "k", scope: !202, file: !3, line: 134, type: !24)
!216 = !DILocalVariable(name: "s", scope: !202, file: !3, line: 135, type: !7)
!217 = !DILocation(line: 0, scope: !202)
!218 = !DILocation(line: 137, column: 17, scope: !219)
!219 = distinct !DILexicalBlock(scope: !220, file: !3, line: 137, column: 3)
!220 = distinct !DILexicalBlock(scope: !202, file: !3, line: 137, column: 3)
!221 = !DILocation(line: 137, column: 3, scope: !220)
!222 = !DILocation(line: 138, column: 5, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !3, line: 138, column: 5)
!224 = !DILocation(line: 140, column: 7, scope: !225)
!225 = distinct !DILexicalBlock(scope: !226, file: !3, line: 140, column: 7)
!226 = distinct !DILexicalBlock(scope: !227, file: !3, line: 138, column: 29)
!227 = distinct !DILexicalBlock(scope: !223, file: !3, line: 138, column: 5)
!228 = !DILocation(line: 141, column: 14, scope: !229)
!229 = distinct !DILexicalBlock(scope: !225, file: !3, line: 140, column: 7)
!230 = !DILocation(line: 141, column: 34, scope: !229)
!231 = !DILocation(line: 141, column: 11, scope: !229)
!232 = !DILocation(line: 140, column: 26, scope: !229)
!233 = distinct !{!233, !224, !234, !151}
!234 = !DILocation(line: 141, column: 34, scope: !225)
!235 = !DILocation(line: 143, column: 7, scope: !226)
!236 = !DILocation(line: 143, column: 25, scope: !226)
!237 = !DILocation(line: 138, column: 24, scope: !227)
!238 = !DILocation(line: 138, column: 19, scope: !227)
!239 = distinct !{!239, !222, !240, !151}
!240 = !DILocation(line: 144, column: 5, scope: !223)
!241 = !DILocation(line: 137, column: 22, scope: !219)
!242 = distinct !{!242, !221, !243, !151}
!243 = !DILocation(line: 144, column: 5, scope: !220)
!244 = !DILocation(line: 145, column: 1, scope: !202)
!245 = distinct !DISubprogram(name: "FastNaiveMatrixMultiply", scope: !3, file: !3, line: 172, type: !246, scopeLine: 174, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !248)
!246 = !DISubroutineType(types: !247)
!247 = !{null, !6, !6, !6, !5, !5, !5, !5}
!248 = !{!249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280}
!249 = !DILocalVariable(name: "C", arg: 1, scope: !245, file: !3, line: 172, type: !6)
!250 = !DILocalVariable(name: "A", arg: 2, scope: !245, file: !3, line: 172, type: !6)
!251 = !DILocalVariable(name: "B", arg: 3, scope: !245, file: !3, line: 172, type: !6)
!252 = !DILocalVariable(name: "MatrixSize", arg: 4, scope: !245, file: !3, line: 173, type: !5)
!253 = !DILocalVariable(name: "RowWidthC", arg: 5, scope: !245, file: !3, line: 173, type: !5)
!254 = !DILocalVariable(name: "RowWidthA", arg: 6, scope: !245, file: !3, line: 174, type: !5)
!255 = !DILocalVariable(name: "RowWidthB", arg: 7, scope: !245, file: !3, line: 174, type: !5)
!256 = !DILocalVariable(name: "RowWidthBInBytes", scope: !245, file: !3, line: 177, type: !9)
!257 = !DILocalVariable(name: "RowWidthAInBytes", scope: !245, file: !3, line: 178, type: !9)
!258 = !DILocalVariable(name: "MatrixWidthInBytes", scope: !245, file: !3, line: 179, type: !9)
!259 = !DILocalVariable(name: "RowIncrementC", scope: !245, file: !3, line: 180, type: !9)
!260 = !DILocalVariable(name: "Horizontal", scope: !245, file: !3, line: 181, type: !5)
!261 = !DILocalVariable(name: "Vertical", scope: !245, file: !3, line: 181, type: !5)
!262 = !DILocalVariable(name: "ARowStart", scope: !245, file: !3, line: 187, type: !6)
!263 = !DILocalVariable(name: "BColumnStart", scope: !264, file: !3, line: 190, type: !6)
!264 = distinct !DILexicalBlock(scope: !265, file: !3, line: 189, column: 68)
!265 = distinct !DILexicalBlock(scope: !266, file: !3, line: 189, column: 5)
!266 = distinct !DILexicalBlock(scope: !267, file: !3, line: 189, column: 5)
!267 = distinct !DILexicalBlock(scope: !268, file: !3, line: 188, column: 57)
!268 = distinct !DILexicalBlock(scope: !269, file: !3, line: 188, column: 3)
!269 = distinct !DILexicalBlock(scope: !245, file: !3, line: 188, column: 3)
!270 = !DILocalVariable(name: "FirstARowValue", scope: !264, file: !3, line: 191, type: !7)
!271 = !DILocalVariable(name: "Sum0", scope: !264, file: !3, line: 193, type: !7)
!272 = !DILocalVariable(name: "Sum1", scope: !264, file: !3, line: 194, type: !7)
!273 = !DILocalVariable(name: "Sum2", scope: !264, file: !3, line: 195, type: !7)
!274 = !DILocalVariable(name: "Sum3", scope: !264, file: !3, line: 196, type: !7)
!275 = !DILocalVariable(name: "Sum4", scope: !264, file: !3, line: 197, type: !7)
!276 = !DILocalVariable(name: "Sum5", scope: !264, file: !3, line: 198, type: !7)
!277 = !DILocalVariable(name: "Sum6", scope: !264, file: !3, line: 199, type: !7)
!278 = !DILocalVariable(name: "Sum7", scope: !264, file: !3, line: 200, type: !7)
!279 = !DILocalVariable(name: "Products", scope: !264, file: !3, line: 202, type: !5)
!280 = !DILocalVariable(name: "ARowValue", scope: !281, file: !3, line: 204, type: !7)
!281 = distinct !DILexicalBlock(scope: !282, file: !3, line: 203, column: 61)
!282 = distinct !DILexicalBlock(scope: !283, file: !3, line: 203, column: 7)
!283 = distinct !DILexicalBlock(scope: !264, file: !3, line: 203, column: 7)
!284 = !DILocation(line: 0, scope: !245)
!285 = !DILocation(line: 177, column: 37, scope: !245)
!286 = !DILocation(line: 177, column: 26, scope: !245)
!287 = !DILocation(line: 178, column: 36, scope: !245)
!288 = !DILocation(line: 178, column: 26, scope: !245)
!289 = !DILocation(line: 179, column: 39, scope: !245)
!290 = !DILocation(line: 179, column: 28, scope: !245)
!291 = !DILocation(line: 180, column: 35, scope: !245)
!292 = !DILocation(line: 180, column: 49, scope: !245)
!293 = !DILocation(line: 180, column: 23, scope: !245)
!294 = !DILocation(line: 188, column: 3, scope: !269)
!295 = !DILocation(line: 189, column: 5, scope: !266)
!296 = !DILocation(line: 190, column: 30, scope: !264)
!297 = !DILocation(line: 0, scope: !264)
!298 = !DILocation(line: 191, column: 29, scope: !264)
!299 = !DILocation(line: 193, column: 37, scope: !264)
!300 = !DILocation(line: 193, column: 34, scope: !264)
!301 = !DILocation(line: 195, column: 51, scope: !264)
!302 = !DILocation(line: 195, column: 37, scope: !264)
!303 = !DILocation(line: 195, column: 34, scope: !264)
!304 = !DILocation(line: 197, column: 51, scope: !264)
!305 = !DILocation(line: 197, column: 37, scope: !264)
!306 = !DILocation(line: 197, column: 34, scope: !264)
!307 = !DILocation(line: 199, column: 51, scope: !264)
!308 = !DILocation(line: 199, column: 37, scope: !264)
!309 = !DILocation(line: 199, column: 34, scope: !264)
!310 = !DILocation(line: 203, column: 7, scope: !283)
!311 = !DILocation(line: 204, column: 26, scope: !281)
!312 = !DILocation(line: 0, scope: !281)
!313 = !DILocation(line: 205, column: 34, scope: !281)
!314 = !DILocation(line: 205, column: 54, scope: !281)
!315 = !DILocation(line: 205, column: 24, scope: !281)
!316 = !DILocation(line: 207, column: 30, scope: !281)
!317 = !DILocation(line: 207, column: 14, scope: !281)
!318 = !DILocation(line: 209, column: 44, scope: !281)
!319 = !DILocation(line: 209, column: 30, scope: !281)
!320 = !DILocation(line: 209, column: 14, scope: !281)
!321 = !DILocation(line: 211, column: 44, scope: !281)
!322 = !DILocation(line: 211, column: 30, scope: !281)
!323 = !DILocation(line: 211, column: 14, scope: !281)
!324 = !DILocation(line: 213, column: 44, scope: !281)
!325 = !DILocation(line: 213, column: 30, scope: !281)
!326 = !DILocation(line: 213, column: 14, scope: !281)
!327 = !DILocation(line: 203, column: 57, scope: !282)
!328 = !DILocation(line: 203, column: 35, scope: !282)
!329 = distinct !{!329, !310, !330, !151}
!330 = !DILocation(line: 215, column: 7, scope: !283)
!331 = !DILocation(line: 216, column: 30, scope: !264)
!332 = !DILocation(line: 216, column: 47, scope: !264)
!333 = !DILocation(line: 216, column: 19, scope: !264)
!334 = !DILocation(line: 218, column: 12, scope: !264)
!335 = !DILocation(line: 220, column: 10, scope: !264)
!336 = !DILocation(line: 220, column: 14, scope: !264)
!337 = !DILocation(line: 222, column: 10, scope: !264)
!338 = !DILocation(line: 222, column: 14, scope: !264)
!339 = !DILocation(line: 224, column: 10, scope: !264)
!340 = !DILocation(line: 224, column: 14, scope: !264)
!341 = !DILocation(line: 226, column: 8, scope: !264)
!342 = !DILocation(line: 189, column: 62, scope: !265)
!343 = !DILocation(line: 189, column: 37, scope: !265)
!344 = distinct !{!344, !295, !345, !151}
!345 = !DILocation(line: 227, column: 5, scope: !266)
!346 = !DILocation(line: 229, column: 45, scope: !267)
!347 = !DILocation(line: 229, column: 17, scope: !267)
!348 = !DILocation(line: 230, column: 20, scope: !267)
!349 = !DILocation(line: 230, column: 29, scope: !267)
!350 = !DILocation(line: 230, column: 9, scope: !267)
!351 = !DILocation(line: 188, column: 53, scope: !268)
!352 = !DILocation(line: 188, column: 31, scope: !268)
!353 = distinct !{!353, !294, !354, !151}
!354 = !DILocation(line: 231, column: 3, scope: !269)
!355 = !DILocation(line: 233, column: 1, scope: !245)
!356 = distinct !DISubprogram(name: "FastAdditiveNaiveMatrixMultiply", scope: !3, file: !3, line: 259, type: !246, scopeLine: 261, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !357)
!357 = !{!358, !359, !360, !361, !362, !363, !364, !365, !366, !367, !368, !369, !370, !371, !372, !379, !380, !381, !382, !383, !384, !385, !386, !387, !388}
!358 = !DILocalVariable(name: "C", arg: 1, scope: !356, file: !3, line: 259, type: !6)
!359 = !DILocalVariable(name: "A", arg: 2, scope: !356, file: !3, line: 259, type: !6)
!360 = !DILocalVariable(name: "B", arg: 3, scope: !356, file: !3, line: 259, type: !6)
!361 = !DILocalVariable(name: "MatrixSize", arg: 4, scope: !356, file: !3, line: 260, type: !5)
!362 = !DILocalVariable(name: "RowWidthC", arg: 5, scope: !356, file: !3, line: 260, type: !5)
!363 = !DILocalVariable(name: "RowWidthA", arg: 6, scope: !356, file: !3, line: 261, type: !5)
!364 = !DILocalVariable(name: "RowWidthB", arg: 7, scope: !356, file: !3, line: 261, type: !5)
!365 = !DILocalVariable(name: "RowWidthBInBytes", scope: !356, file: !3, line: 264, type: !9)
!366 = !DILocalVariable(name: "RowWidthAInBytes", scope: !356, file: !3, line: 265, type: !9)
!367 = !DILocalVariable(name: "MatrixWidthInBytes", scope: !356, file: !3, line: 266, type: !9)
!368 = !DILocalVariable(name: "RowIncrementC", scope: !356, file: !3, line: 267, type: !9)
!369 = !DILocalVariable(name: "Horizontal", scope: !356, file: !3, line: 268, type: !5)
!370 = !DILocalVariable(name: "Vertical", scope: !356, file: !3, line: 268, type: !5)
!371 = !DILocalVariable(name: "ARowStart", scope: !356, file: !3, line: 270, type: !6)
!372 = !DILocalVariable(name: "BColumnStart", scope: !373, file: !3, line: 273, type: !6)
!373 = distinct !DILexicalBlock(scope: !374, file: !3, line: 272, column: 68)
!374 = distinct !DILexicalBlock(scope: !375, file: !3, line: 272, column: 5)
!375 = distinct !DILexicalBlock(scope: !376, file: !3, line: 272, column: 5)
!376 = distinct !DILexicalBlock(scope: !377, file: !3, line: 271, column: 57)
!377 = distinct !DILexicalBlock(scope: !378, file: !3, line: 271, column: 3)
!378 = distinct !DILexicalBlock(scope: !356, file: !3, line: 271, column: 3)
!379 = !DILocalVariable(name: "Sum0", scope: !373, file: !3, line: 275, type: !7)
!380 = !DILocalVariable(name: "Sum1", scope: !373, file: !3, line: 276, type: !7)
!381 = !DILocalVariable(name: "Sum2", scope: !373, file: !3, line: 277, type: !7)
!382 = !DILocalVariable(name: "Sum3", scope: !373, file: !3, line: 278, type: !7)
!383 = !DILocalVariable(name: "Sum4", scope: !373, file: !3, line: 279, type: !7)
!384 = !DILocalVariable(name: "Sum5", scope: !373, file: !3, line: 280, type: !7)
!385 = !DILocalVariable(name: "Sum6", scope: !373, file: !3, line: 281, type: !7)
!386 = !DILocalVariable(name: "Sum7", scope: !373, file: !3, line: 282, type: !7)
!387 = !DILocalVariable(name: "Products", scope: !373, file: !3, line: 284, type: !5)
!388 = !DILocalVariable(name: "ARowValue", scope: !389, file: !3, line: 286, type: !7)
!389 = distinct !DILexicalBlock(scope: !390, file: !3, line: 285, column: 61)
!390 = distinct !DILexicalBlock(scope: !391, file: !3, line: 285, column: 7)
!391 = distinct !DILexicalBlock(scope: !373, file: !3, line: 285, column: 7)
!392 = !DILocation(line: 0, scope: !356)
!393 = !DILocation(line: 264, column: 37, scope: !356)
!394 = !DILocation(line: 264, column: 26, scope: !356)
!395 = !DILocation(line: 265, column: 36, scope: !356)
!396 = !DILocation(line: 265, column: 26, scope: !356)
!397 = !DILocation(line: 266, column: 39, scope: !356)
!398 = !DILocation(line: 266, column: 28, scope: !356)
!399 = !DILocation(line: 267, column: 35, scope: !356)
!400 = !DILocation(line: 267, column: 49, scope: !356)
!401 = !DILocation(line: 267, column: 23, scope: !356)
!402 = !DILocation(line: 271, column: 31, scope: !377)
!403 = !DILocation(line: 271, column: 3, scope: !378)
!404 = !DILocation(line: 272, column: 5, scope: !375)
!405 = !DILocation(line: 273, column: 30, scope: !373)
!406 = !DILocation(line: 0, scope: !373)
!407 = !DILocation(line: 275, column: 19, scope: !373)
!408 = !DILocation(line: 277, column: 22, scope: !373)
!409 = !DILocation(line: 277, column: 19, scope: !373)
!410 = !DILocation(line: 279, column: 22, scope: !373)
!411 = !DILocation(line: 279, column: 19, scope: !373)
!412 = !DILocation(line: 281, column: 22, scope: !373)
!413 = !DILocation(line: 281, column: 19, scope: !373)
!414 = !DILocation(line: 285, column: 7, scope: !391)
!415 = !DILocation(line: 286, column: 36, scope: !389)
!416 = !DILocation(line: 286, column: 26, scope: !389)
!417 = !DILocation(line: 0, scope: !389)
!418 = !DILocation(line: 288, column: 30, scope: !389)
!419 = !DILocation(line: 288, column: 14, scope: !389)
!420 = !DILocation(line: 290, column: 44, scope: !389)
!421 = !DILocation(line: 290, column: 30, scope: !389)
!422 = !DILocation(line: 290, column: 14, scope: !389)
!423 = !DILocation(line: 292, column: 44, scope: !389)
!424 = !DILocation(line: 292, column: 30, scope: !389)
!425 = !DILocation(line: 292, column: 14, scope: !389)
!426 = !DILocation(line: 294, column: 44, scope: !389)
!427 = !DILocation(line: 294, column: 30, scope: !389)
!428 = !DILocation(line: 294, column: 14, scope: !389)
!429 = !DILocation(line: 297, column: 34, scope: !389)
!430 = !DILocation(line: 297, column: 54, scope: !389)
!431 = !DILocation(line: 297, column: 24, scope: !389)
!432 = !DILocation(line: 285, column: 57, scope: !390)
!433 = !DILocation(line: 285, column: 35, scope: !390)
!434 = distinct !{!434, !414, !435, !151}
!435 = !DILocation(line: 299, column: 7, scope: !391)
!436 = !DILocation(line: 300, column: 30, scope: !373)
!437 = !DILocation(line: 300, column: 47, scope: !373)
!438 = !DILocation(line: 300, column: 19, scope: !373)
!439 = !DILocation(line: 302, column: 12, scope: !373)
!440 = !DILocation(line: 304, column: 14, scope: !373)
!441 = !DILocation(line: 306, column: 14, scope: !373)
!442 = !DILocation(line: 308, column: 14, scope: !373)
!443 = !DILocation(line: 310, column: 8, scope: !373)
!444 = !DILocation(line: 272, column: 62, scope: !374)
!445 = !DILocation(line: 272, column: 37, scope: !374)
!446 = distinct !{!446, !404, !447, !151}
!447 = !DILocation(line: 311, column: 5, scope: !375)
!448 = !DILocation(line: 313, column: 45, scope: !376)
!449 = !DILocation(line: 313, column: 17, scope: !376)
!450 = !DILocation(line: 314, column: 20, scope: !376)
!451 = !DILocation(line: 314, column: 29, scope: !376)
!452 = !DILocation(line: 314, column: 9, scope: !376)
!453 = !DILocation(line: 271, column: 53, scope: !377)
!454 = distinct !{!454, !403, !455, !151}
!455 = !DILocation(line: 315, column: 3, scope: !378)
!456 = !DILocation(line: 316, column: 1, scope: !356)
!457 = distinct !DISubprogram(name: "MultiplyByDivideAndConquer", scope: !3, file: !3, line: 345, type: !458, scopeLine: 348, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !460)
!458 = !DISubroutineType(types: !459)
!459 = !{null, !6, !6, !6, !5, !5, !5, !5, !24}
!460 = !{!461, !462, !463, !464, !465, !466, !467, !468, !469, !470, !471, !472, !473, !474, !475, !476, !477, !478}
!461 = !DILocalVariable(name: "C", arg: 1, scope: !457, file: !3, line: 345, type: !6)
!462 = !DILocalVariable(name: "A", arg: 2, scope: !457, file: !3, line: 345, type: !6)
!463 = !DILocalVariable(name: "B", arg: 3, scope: !457, file: !3, line: 345, type: !6)
!464 = !DILocalVariable(name: "MatrixSize", arg: 4, scope: !457, file: !3, line: 346, type: !5)
!465 = !DILocalVariable(name: "RowWidthC", arg: 5, scope: !457, file: !3, line: 346, type: !5)
!466 = !DILocalVariable(name: "RowWidthA", arg: 6, scope: !457, file: !3, line: 347, type: !5)
!467 = !DILocalVariable(name: "RowWidthB", arg: 7, scope: !457, file: !3, line: 347, type: !5)
!468 = !DILocalVariable(name: "AdditiveMode", arg: 8, scope: !457, file: !3, line: 348, type: !24)
!469 = !DILocalVariable(name: "A01", scope: !457, file: !3, line: 354, type: !6)
!470 = !DILocalVariable(name: "A10", scope: !457, file: !3, line: 354, type: !6)
!471 = !DILocalVariable(name: "A11", scope: !457, file: !3, line: 354, type: !6)
!472 = !DILocalVariable(name: "B01", scope: !457, file: !3, line: 354, type: !6)
!473 = !DILocalVariable(name: "B10", scope: !457, file: !3, line: 354, type: !6)
!474 = !DILocalVariable(name: "B11", scope: !457, file: !3, line: 354, type: !6)
!475 = !DILocalVariable(name: "C01", scope: !457, file: !3, line: 354, type: !6)
!476 = !DILocalVariable(name: "C10", scope: !457, file: !3, line: 354, type: !6)
!477 = !DILocalVariable(name: "C11", scope: !457, file: !3, line: 354, type: !6)
!478 = !DILocalVariable(name: "QuadrantSize", scope: !457, file: !3, line: 355, type: !5)
!479 = !DILocation(line: 0, scope: !457)
!480 = !DILocation(line: 355, column: 38, scope: !457)
!481 = !DILocation(line: 358, column: 13, scope: !457)
!482 = !DILocation(line: 359, column: 25, scope: !457)
!483 = !DILocation(line: 359, column: 13, scope: !457)
!484 = !DILocation(line: 360, column: 13, scope: !457)
!485 = !DILocation(line: 362, column: 13, scope: !457)
!486 = !DILocation(line: 363, column: 25, scope: !457)
!487 = !DILocation(line: 363, column: 13, scope: !457)
!488 = !DILocation(line: 364, column: 13, scope: !457)
!489 = !DILocation(line: 366, column: 13, scope: !457)
!490 = !DILocation(line: 367, column: 25, scope: !457)
!491 = !DILocation(line: 367, column: 13, scope: !457)
!492 = !DILocation(line: 368, column: 13, scope: !457)
!493 = !DILocation(line: 370, column: 20, scope: !494)
!494 = distinct !DILexicalBlock(scope: !457, file: !3, line: 370, column: 7)
!495 = !DILocation(line: 370, column: 7, scope: !457)
!496 = !DILocation(line: 372, column: 5, scope: !497)
!497 = distinct !DILexicalBlock(scope: !494, file: !3, line: 370, column: 64)
!498 = !DILocation(line: 375, column: 5, scope: !497)
!499 = !DILocation(line: 378, column: 5, scope: !497)
!500 = !DILocation(line: 381, column: 5, scope: !497)
!501 = !DILocation(line: 384, column: 5, scope: !497)
!502 = !DILocation(line: 387, column: 5, scope: !497)
!503 = !DILocation(line: 390, column: 5, scope: !497)
!504 = distinct !{!504, !505}
!505 = !{!"llvm.loop.peeled.count", i32 1}
!506 = !DILocation(line: 398, column: 9, scope: !507)
!507 = distinct !DILexicalBlock(scope: !508, file: !3, line: 398, column: 9)
!508 = distinct !DILexicalBlock(scope: !494, file: !3, line: 396, column: 10)
!509 = !DILocation(line: 398, column: 9, scope: !508)
!510 = !DILocation(line: 264, column: 37, scope: !356, inlinedAt: !511)
!511 = distinct !DILocation(line: 399, column: 7, scope: !512)
!512 = distinct !DILexicalBlock(scope: !507, file: !3, line: 398, column: 23)
!513 = !DILocation(line: 0, scope: !356, inlinedAt: !511)
!514 = !DILocation(line: 264, column: 26, scope: !356, inlinedAt: !511)
!515 = !DILocation(line: 265, column: 36, scope: !356, inlinedAt: !511)
!516 = !DILocation(line: 265, column: 26, scope: !356, inlinedAt: !511)
!517 = !DILocation(line: 266, column: 39, scope: !356, inlinedAt: !511)
!518 = !DILocation(line: 266, column: 28, scope: !356, inlinedAt: !511)
!519 = !DILocation(line: 267, column: 35, scope: !356, inlinedAt: !511)
!520 = !DILocation(line: 267, column: 49, scope: !356, inlinedAt: !511)
!521 = !DILocation(line: 267, column: 23, scope: !356, inlinedAt: !511)
!522 = !DILocation(line: 271, column: 31, scope: !377, inlinedAt: !511)
!523 = !DILocation(line: 271, column: 3, scope: !378, inlinedAt: !511)
!524 = !DILocation(line: 272, column: 5, scope: !375, inlinedAt: !511)
!525 = !DILocation(line: 273, column: 30, scope: !373, inlinedAt: !511)
!526 = !DILocation(line: 0, scope: !373, inlinedAt: !511)
!527 = !DILocation(line: 275, column: 19, scope: !373, inlinedAt: !511)
!528 = !DILocation(line: 277, column: 22, scope: !373, inlinedAt: !511)
!529 = !DILocation(line: 277, column: 19, scope: !373, inlinedAt: !511)
!530 = !DILocation(line: 279, column: 22, scope: !373, inlinedAt: !511)
!531 = !DILocation(line: 279, column: 19, scope: !373, inlinedAt: !511)
!532 = !DILocation(line: 281, column: 22, scope: !373, inlinedAt: !511)
!533 = !DILocation(line: 281, column: 19, scope: !373, inlinedAt: !511)
!534 = !DILocation(line: 285, column: 7, scope: !391, inlinedAt: !511)
!535 = !DILocation(line: 286, column: 36, scope: !389, inlinedAt: !511)
!536 = !DILocation(line: 286, column: 26, scope: !389, inlinedAt: !511)
!537 = !DILocation(line: 0, scope: !389, inlinedAt: !511)
!538 = !DILocation(line: 288, column: 30, scope: !389, inlinedAt: !511)
!539 = !DILocation(line: 288, column: 14, scope: !389, inlinedAt: !511)
!540 = !DILocation(line: 290, column: 44, scope: !389, inlinedAt: !511)
!541 = !DILocation(line: 290, column: 30, scope: !389, inlinedAt: !511)
!542 = !DILocation(line: 290, column: 14, scope: !389, inlinedAt: !511)
!543 = !DILocation(line: 292, column: 44, scope: !389, inlinedAt: !511)
!544 = !DILocation(line: 292, column: 30, scope: !389, inlinedAt: !511)
!545 = !DILocation(line: 292, column: 14, scope: !389, inlinedAt: !511)
!546 = !DILocation(line: 294, column: 44, scope: !389, inlinedAt: !511)
!547 = !DILocation(line: 294, column: 30, scope: !389, inlinedAt: !511)
!548 = !DILocation(line: 294, column: 14, scope: !389, inlinedAt: !511)
!549 = !DILocation(line: 297, column: 34, scope: !389, inlinedAt: !511)
!550 = !DILocation(line: 297, column: 54, scope: !389, inlinedAt: !511)
!551 = !DILocation(line: 297, column: 24, scope: !389, inlinedAt: !511)
!552 = !DILocation(line: 285, column: 57, scope: !390, inlinedAt: !511)
!553 = !DILocation(line: 285, column: 35, scope: !390, inlinedAt: !511)
!554 = distinct !{!554, !534, !555, !151}
!555 = !DILocation(line: 299, column: 7, scope: !391, inlinedAt: !511)
!556 = !DILocation(line: 300, column: 30, scope: !373, inlinedAt: !511)
!557 = !DILocation(line: 300, column: 47, scope: !373, inlinedAt: !511)
!558 = !DILocation(line: 300, column: 19, scope: !373, inlinedAt: !511)
!559 = !DILocation(line: 302, column: 12, scope: !373, inlinedAt: !511)
!560 = !DILocation(line: 304, column: 14, scope: !373, inlinedAt: !511)
!561 = !DILocation(line: 306, column: 14, scope: !373, inlinedAt: !511)
!562 = !DILocation(line: 308, column: 14, scope: !373, inlinedAt: !511)
!563 = !DILocation(line: 310, column: 8, scope: !373, inlinedAt: !511)
!564 = !DILocation(line: 272, column: 62, scope: !374, inlinedAt: !511)
!565 = !DILocation(line: 272, column: 37, scope: !374, inlinedAt: !511)
!566 = distinct !{!566, !524, !567, !151}
!567 = !DILocation(line: 311, column: 5, scope: !375, inlinedAt: !511)
!568 = !DILocation(line: 313, column: 45, scope: !376, inlinedAt: !511)
!569 = !DILocation(line: 313, column: 17, scope: !376, inlinedAt: !511)
!570 = !DILocation(line: 314, column: 20, scope: !376, inlinedAt: !511)
!571 = !DILocation(line: 314, column: 29, scope: !376, inlinedAt: !511)
!572 = !DILocation(line: 314, column: 9, scope: !376, inlinedAt: !511)
!573 = !DILocation(line: 271, column: 53, scope: !377, inlinedAt: !511)
!574 = distinct !{!574, !523, !575, !151}
!575 = !DILocation(line: 315, column: 3, scope: !378, inlinedAt: !511)
!576 = !DILocation(line: 0, scope: !356, inlinedAt: !577)
!577 = distinct !DILocation(line: 402, column: 7, scope: !512)
!578 = !DILocation(line: 272, column: 5, scope: !375, inlinedAt: !577)
!579 = !DILocation(line: 273, column: 30, scope: !373, inlinedAt: !577)
!580 = !DILocation(line: 0, scope: !373, inlinedAt: !577)
!581 = !DILocation(line: 275, column: 19, scope: !373, inlinedAt: !577)
!582 = !DILocation(line: 277, column: 22, scope: !373, inlinedAt: !577)
!583 = !DILocation(line: 277, column: 19, scope: !373, inlinedAt: !577)
!584 = !DILocation(line: 279, column: 22, scope: !373, inlinedAt: !577)
!585 = !DILocation(line: 279, column: 19, scope: !373, inlinedAt: !577)
!586 = !DILocation(line: 281, column: 22, scope: !373, inlinedAt: !577)
!587 = !DILocation(line: 281, column: 19, scope: !373, inlinedAt: !577)
!588 = !DILocation(line: 285, column: 7, scope: !391, inlinedAt: !577)
!589 = !DILocation(line: 286, column: 36, scope: !389, inlinedAt: !577)
!590 = !DILocation(line: 286, column: 26, scope: !389, inlinedAt: !577)
!591 = !DILocation(line: 0, scope: !389, inlinedAt: !577)
!592 = !DILocation(line: 288, column: 30, scope: !389, inlinedAt: !577)
!593 = !DILocation(line: 288, column: 14, scope: !389, inlinedAt: !577)
!594 = !DILocation(line: 290, column: 44, scope: !389, inlinedAt: !577)
!595 = !DILocation(line: 290, column: 30, scope: !389, inlinedAt: !577)
!596 = !DILocation(line: 290, column: 14, scope: !389, inlinedAt: !577)
!597 = !DILocation(line: 292, column: 44, scope: !389, inlinedAt: !577)
!598 = !DILocation(line: 292, column: 30, scope: !389, inlinedAt: !577)
!599 = !DILocation(line: 292, column: 14, scope: !389, inlinedAt: !577)
!600 = !DILocation(line: 294, column: 44, scope: !389, inlinedAt: !577)
!601 = !DILocation(line: 294, column: 30, scope: !389, inlinedAt: !577)
!602 = !DILocation(line: 294, column: 14, scope: !389, inlinedAt: !577)
!603 = !DILocation(line: 297, column: 34, scope: !389, inlinedAt: !577)
!604 = !DILocation(line: 297, column: 54, scope: !389, inlinedAt: !577)
!605 = !DILocation(line: 297, column: 24, scope: !389, inlinedAt: !577)
!606 = !DILocation(line: 285, column: 57, scope: !390, inlinedAt: !577)
!607 = !DILocation(line: 285, column: 35, scope: !390, inlinedAt: !577)
!608 = distinct !{!608, !588, !609, !151}
!609 = !DILocation(line: 299, column: 7, scope: !391, inlinedAt: !577)
!610 = !DILocation(line: 300, column: 30, scope: !373, inlinedAt: !577)
!611 = !DILocation(line: 300, column: 47, scope: !373, inlinedAt: !577)
!612 = !DILocation(line: 300, column: 19, scope: !373, inlinedAt: !577)
!613 = !DILocation(line: 302, column: 12, scope: !373, inlinedAt: !577)
!614 = !DILocation(line: 304, column: 14, scope: !373, inlinedAt: !577)
!615 = !DILocation(line: 306, column: 14, scope: !373, inlinedAt: !577)
!616 = !DILocation(line: 308, column: 14, scope: !373, inlinedAt: !577)
!617 = !DILocation(line: 310, column: 8, scope: !373, inlinedAt: !577)
!618 = !DILocation(line: 272, column: 62, scope: !374, inlinedAt: !577)
!619 = !DILocation(line: 272, column: 37, scope: !374, inlinedAt: !577)
!620 = distinct !{!620, !578, !621, !151}
!621 = !DILocation(line: 311, column: 5, scope: !375, inlinedAt: !577)
!622 = !DILocation(line: 313, column: 45, scope: !376, inlinedAt: !577)
!623 = !DILocation(line: 313, column: 17, scope: !376, inlinedAt: !577)
!624 = !DILocation(line: 314, column: 20, scope: !376, inlinedAt: !577)
!625 = !DILocation(line: 314, column: 29, scope: !376, inlinedAt: !577)
!626 = !DILocation(line: 314, column: 9, scope: !376, inlinedAt: !577)
!627 = !DILocation(line: 271, column: 53, scope: !377, inlinedAt: !577)
!628 = !DILocation(line: 271, column: 31, scope: !377, inlinedAt: !577)
!629 = !DILocation(line: 271, column: 3, scope: !378, inlinedAt: !577)
!630 = distinct !{!630, !629, !631, !151}
!631 = !DILocation(line: 315, column: 3, scope: !378, inlinedAt: !577)
!632 = !DILocation(line: 0, scope: !356, inlinedAt: !633)
!633 = distinct !DILocation(line: 405, column: 7, scope: !512)
!634 = !DILocation(line: 272, column: 5, scope: !375, inlinedAt: !633)
!635 = !DILocation(line: 273, column: 30, scope: !373, inlinedAt: !633)
!636 = !DILocation(line: 0, scope: !373, inlinedAt: !633)
!637 = !DILocation(line: 275, column: 19, scope: !373, inlinedAt: !633)
!638 = !DILocation(line: 277, column: 22, scope: !373, inlinedAt: !633)
!639 = !DILocation(line: 277, column: 19, scope: !373, inlinedAt: !633)
!640 = !DILocation(line: 279, column: 22, scope: !373, inlinedAt: !633)
!641 = !DILocation(line: 279, column: 19, scope: !373, inlinedAt: !633)
!642 = !DILocation(line: 281, column: 22, scope: !373, inlinedAt: !633)
!643 = !DILocation(line: 281, column: 19, scope: !373, inlinedAt: !633)
!644 = !DILocation(line: 285, column: 7, scope: !391, inlinedAt: !633)
!645 = !DILocation(line: 286, column: 36, scope: !389, inlinedAt: !633)
!646 = !DILocation(line: 286, column: 26, scope: !389, inlinedAt: !633)
!647 = !DILocation(line: 0, scope: !389, inlinedAt: !633)
!648 = !DILocation(line: 288, column: 30, scope: !389, inlinedAt: !633)
!649 = !DILocation(line: 288, column: 14, scope: !389, inlinedAt: !633)
!650 = !DILocation(line: 290, column: 44, scope: !389, inlinedAt: !633)
!651 = !DILocation(line: 290, column: 30, scope: !389, inlinedAt: !633)
!652 = !DILocation(line: 290, column: 14, scope: !389, inlinedAt: !633)
!653 = !DILocation(line: 292, column: 44, scope: !389, inlinedAt: !633)
!654 = !DILocation(line: 292, column: 30, scope: !389, inlinedAt: !633)
!655 = !DILocation(line: 292, column: 14, scope: !389, inlinedAt: !633)
!656 = !DILocation(line: 294, column: 44, scope: !389, inlinedAt: !633)
!657 = !DILocation(line: 294, column: 30, scope: !389, inlinedAt: !633)
!658 = !DILocation(line: 294, column: 14, scope: !389, inlinedAt: !633)
!659 = !DILocation(line: 297, column: 34, scope: !389, inlinedAt: !633)
!660 = !DILocation(line: 297, column: 54, scope: !389, inlinedAt: !633)
!661 = !DILocation(line: 297, column: 24, scope: !389, inlinedAt: !633)
!662 = !DILocation(line: 285, column: 57, scope: !390, inlinedAt: !633)
!663 = !DILocation(line: 285, column: 35, scope: !390, inlinedAt: !633)
!664 = distinct !{!664, !644, !665, !151}
!665 = !DILocation(line: 299, column: 7, scope: !391, inlinedAt: !633)
!666 = !DILocation(line: 300, column: 30, scope: !373, inlinedAt: !633)
!667 = !DILocation(line: 300, column: 47, scope: !373, inlinedAt: !633)
!668 = !DILocation(line: 300, column: 19, scope: !373, inlinedAt: !633)
!669 = !DILocation(line: 302, column: 12, scope: !373, inlinedAt: !633)
!670 = !DILocation(line: 304, column: 14, scope: !373, inlinedAt: !633)
!671 = !DILocation(line: 306, column: 14, scope: !373, inlinedAt: !633)
!672 = !DILocation(line: 308, column: 14, scope: !373, inlinedAt: !633)
!673 = !DILocation(line: 310, column: 8, scope: !373, inlinedAt: !633)
!674 = !DILocation(line: 272, column: 62, scope: !374, inlinedAt: !633)
!675 = !DILocation(line: 272, column: 37, scope: !374, inlinedAt: !633)
!676 = distinct !{!676, !634, !677, !151}
!677 = !DILocation(line: 311, column: 5, scope: !375, inlinedAt: !633)
!678 = !DILocation(line: 313, column: 45, scope: !376, inlinedAt: !633)
!679 = !DILocation(line: 313, column: 17, scope: !376, inlinedAt: !633)
!680 = !DILocation(line: 314, column: 20, scope: !376, inlinedAt: !633)
!681 = !DILocation(line: 314, column: 29, scope: !376, inlinedAt: !633)
!682 = !DILocation(line: 314, column: 9, scope: !376, inlinedAt: !633)
!683 = !DILocation(line: 271, column: 53, scope: !377, inlinedAt: !633)
!684 = !DILocation(line: 271, column: 31, scope: !377, inlinedAt: !633)
!685 = !DILocation(line: 271, column: 3, scope: !378, inlinedAt: !633)
!686 = distinct !{!686, !685, !687, !151}
!687 = !DILocation(line: 315, column: 3, scope: !378, inlinedAt: !633)
!688 = !DILocation(line: 0, scope: !356, inlinedAt: !689)
!689 = distinct !DILocation(line: 408, column: 7, scope: !512)
!690 = !DILocation(line: 272, column: 5, scope: !375, inlinedAt: !689)
!691 = !DILocation(line: 273, column: 30, scope: !373, inlinedAt: !689)
!692 = !DILocation(line: 0, scope: !373, inlinedAt: !689)
!693 = !DILocation(line: 275, column: 19, scope: !373, inlinedAt: !689)
!694 = !DILocation(line: 277, column: 22, scope: !373, inlinedAt: !689)
!695 = !DILocation(line: 277, column: 19, scope: !373, inlinedAt: !689)
!696 = !DILocation(line: 279, column: 22, scope: !373, inlinedAt: !689)
!697 = !DILocation(line: 279, column: 19, scope: !373, inlinedAt: !689)
!698 = !DILocation(line: 281, column: 22, scope: !373, inlinedAt: !689)
!699 = !DILocation(line: 281, column: 19, scope: !373, inlinedAt: !689)
!700 = !DILocation(line: 285, column: 7, scope: !391, inlinedAt: !689)
!701 = !DILocation(line: 286, column: 36, scope: !389, inlinedAt: !689)
!702 = !DILocation(line: 286, column: 26, scope: !389, inlinedAt: !689)
!703 = !DILocation(line: 0, scope: !389, inlinedAt: !689)
!704 = !DILocation(line: 288, column: 30, scope: !389, inlinedAt: !689)
!705 = !DILocation(line: 288, column: 14, scope: !389, inlinedAt: !689)
!706 = !DILocation(line: 290, column: 44, scope: !389, inlinedAt: !689)
!707 = !DILocation(line: 290, column: 30, scope: !389, inlinedAt: !689)
!708 = !DILocation(line: 290, column: 14, scope: !389, inlinedAt: !689)
!709 = !DILocation(line: 292, column: 44, scope: !389, inlinedAt: !689)
!710 = !DILocation(line: 292, column: 30, scope: !389, inlinedAt: !689)
!711 = !DILocation(line: 292, column: 14, scope: !389, inlinedAt: !689)
!712 = !DILocation(line: 294, column: 44, scope: !389, inlinedAt: !689)
!713 = !DILocation(line: 294, column: 30, scope: !389, inlinedAt: !689)
!714 = !DILocation(line: 294, column: 14, scope: !389, inlinedAt: !689)
!715 = !DILocation(line: 297, column: 34, scope: !389, inlinedAt: !689)
!716 = !DILocation(line: 297, column: 54, scope: !389, inlinedAt: !689)
!717 = !DILocation(line: 297, column: 24, scope: !389, inlinedAt: !689)
!718 = !DILocation(line: 285, column: 57, scope: !390, inlinedAt: !689)
!719 = !DILocation(line: 285, column: 35, scope: !390, inlinedAt: !689)
!720 = distinct !{!720, !700, !721, !151}
!721 = !DILocation(line: 299, column: 7, scope: !391, inlinedAt: !689)
!722 = !DILocation(line: 300, column: 30, scope: !373, inlinedAt: !689)
!723 = !DILocation(line: 300, column: 47, scope: !373, inlinedAt: !689)
!724 = !DILocation(line: 300, column: 19, scope: !373, inlinedAt: !689)
!725 = !DILocation(line: 302, column: 12, scope: !373, inlinedAt: !689)
!726 = !DILocation(line: 304, column: 14, scope: !373, inlinedAt: !689)
!727 = !DILocation(line: 306, column: 14, scope: !373, inlinedAt: !689)
!728 = !DILocation(line: 308, column: 14, scope: !373, inlinedAt: !689)
!729 = !DILocation(line: 310, column: 8, scope: !373, inlinedAt: !689)
!730 = !DILocation(line: 272, column: 62, scope: !374, inlinedAt: !689)
!731 = !DILocation(line: 272, column: 37, scope: !374, inlinedAt: !689)
!732 = distinct !{!732, !690, !733, !151}
!733 = !DILocation(line: 311, column: 5, scope: !375, inlinedAt: !689)
!734 = !DILocation(line: 313, column: 45, scope: !376, inlinedAt: !689)
!735 = !DILocation(line: 313, column: 17, scope: !376, inlinedAt: !689)
!736 = !DILocation(line: 314, column: 20, scope: !376, inlinedAt: !689)
!737 = !DILocation(line: 314, column: 29, scope: !376, inlinedAt: !689)
!738 = !DILocation(line: 314, column: 9, scope: !376, inlinedAt: !689)
!739 = !DILocation(line: 271, column: 53, scope: !377, inlinedAt: !689)
!740 = !DILocation(line: 271, column: 31, scope: !377, inlinedAt: !689)
!741 = !DILocation(line: 271, column: 3, scope: !378, inlinedAt: !689)
!742 = distinct !{!742, !741, !743, !151}
!743 = !DILocation(line: 315, column: 3, scope: !378, inlinedAt: !689)
!744 = !DILocation(line: 413, column: 7, scope: !745)
!745 = distinct !DILexicalBlock(scope: !507, file: !3, line: 411, column: 12)
!746 = !DILocation(line: 416, column: 7, scope: !745)
!747 = !DILocation(line: 419, column: 7, scope: !745)
!748 = !DILocation(line: 422, column: 7, scope: !745)
!749 = !DILocation(line: 264, column: 37, scope: !356, inlinedAt: !750)
!750 = distinct !DILocation(line: 426, column: 5, scope: !508)
!751 = !DILocation(line: 264, column: 26, scope: !356, inlinedAt: !750)
!752 = !DILocation(line: 265, column: 36, scope: !356, inlinedAt: !750)
!753 = !DILocation(line: 265, column: 26, scope: !356, inlinedAt: !750)
!754 = !DILocation(line: 266, column: 39, scope: !356, inlinedAt: !750)
!755 = !DILocation(line: 266, column: 28, scope: !356, inlinedAt: !750)
!756 = !DILocation(line: 267, column: 35, scope: !356, inlinedAt: !750)
!757 = !DILocation(line: 267, column: 49, scope: !356, inlinedAt: !750)
!758 = !DILocation(line: 267, column: 23, scope: !356, inlinedAt: !750)
!759 = !DILocation(line: 0, scope: !356, inlinedAt: !750)
!760 = !DILocation(line: 271, column: 31, scope: !377, inlinedAt: !750)
!761 = !DILocation(line: 271, column: 3, scope: !378, inlinedAt: !750)
!762 = !DILocation(line: 272, column: 5, scope: !375, inlinedAt: !750)
!763 = !DILocation(line: 273, column: 30, scope: !373, inlinedAt: !750)
!764 = !DILocation(line: 0, scope: !373, inlinedAt: !750)
!765 = !DILocation(line: 275, column: 19, scope: !373, inlinedAt: !750)
!766 = !DILocation(line: 277, column: 22, scope: !373, inlinedAt: !750)
!767 = !DILocation(line: 277, column: 19, scope: !373, inlinedAt: !750)
!768 = !DILocation(line: 279, column: 22, scope: !373, inlinedAt: !750)
!769 = !DILocation(line: 279, column: 19, scope: !373, inlinedAt: !750)
!770 = !DILocation(line: 281, column: 22, scope: !373, inlinedAt: !750)
!771 = !DILocation(line: 281, column: 19, scope: !373, inlinedAt: !750)
!772 = !DILocation(line: 285, column: 7, scope: !391, inlinedAt: !750)
!773 = !DILocation(line: 286, column: 36, scope: !389, inlinedAt: !750)
!774 = !DILocation(line: 286, column: 26, scope: !389, inlinedAt: !750)
!775 = !DILocation(line: 0, scope: !389, inlinedAt: !750)
!776 = !DILocation(line: 288, column: 30, scope: !389, inlinedAt: !750)
!777 = !DILocation(line: 288, column: 14, scope: !389, inlinedAt: !750)
!778 = !DILocation(line: 290, column: 44, scope: !389, inlinedAt: !750)
!779 = !DILocation(line: 290, column: 30, scope: !389, inlinedAt: !750)
!780 = !DILocation(line: 290, column: 14, scope: !389, inlinedAt: !750)
!781 = !DILocation(line: 292, column: 44, scope: !389, inlinedAt: !750)
!782 = !DILocation(line: 292, column: 30, scope: !389, inlinedAt: !750)
!783 = !DILocation(line: 292, column: 14, scope: !389, inlinedAt: !750)
!784 = !DILocation(line: 294, column: 44, scope: !389, inlinedAt: !750)
!785 = !DILocation(line: 294, column: 30, scope: !389, inlinedAt: !750)
!786 = !DILocation(line: 294, column: 14, scope: !389, inlinedAt: !750)
!787 = !DILocation(line: 297, column: 34, scope: !389, inlinedAt: !750)
!788 = !DILocation(line: 297, column: 54, scope: !389, inlinedAt: !750)
!789 = !DILocation(line: 297, column: 24, scope: !389, inlinedAt: !750)
!790 = !DILocation(line: 285, column: 57, scope: !390, inlinedAt: !750)
!791 = !DILocation(line: 285, column: 35, scope: !390, inlinedAt: !750)
!792 = distinct !{!792, !772, !793, !151}
!793 = !DILocation(line: 299, column: 7, scope: !391, inlinedAt: !750)
!794 = !DILocation(line: 300, column: 30, scope: !373, inlinedAt: !750)
!795 = !DILocation(line: 300, column: 47, scope: !373, inlinedAt: !750)
!796 = !DILocation(line: 300, column: 19, scope: !373, inlinedAt: !750)
!797 = !DILocation(line: 302, column: 12, scope: !373, inlinedAt: !750)
!798 = !DILocation(line: 304, column: 14, scope: !373, inlinedAt: !750)
!799 = !DILocation(line: 306, column: 14, scope: !373, inlinedAt: !750)
!800 = !DILocation(line: 308, column: 14, scope: !373, inlinedAt: !750)
!801 = !DILocation(line: 310, column: 8, scope: !373, inlinedAt: !750)
!802 = !DILocation(line: 272, column: 62, scope: !374, inlinedAt: !750)
!803 = !DILocation(line: 272, column: 37, scope: !374, inlinedAt: !750)
!804 = distinct !{!804, !762, !805, !151}
!805 = !DILocation(line: 311, column: 5, scope: !375, inlinedAt: !750)
!806 = !DILocation(line: 313, column: 45, scope: !376, inlinedAt: !750)
!807 = !DILocation(line: 313, column: 17, scope: !376, inlinedAt: !750)
!808 = !DILocation(line: 314, column: 20, scope: !376, inlinedAt: !750)
!809 = !DILocation(line: 314, column: 29, scope: !376, inlinedAt: !750)
!810 = !DILocation(line: 314, column: 9, scope: !376, inlinedAt: !750)
!811 = !DILocation(line: 271, column: 53, scope: !377, inlinedAt: !750)
!812 = distinct !{!812, !761, !813, !151}
!813 = !DILocation(line: 315, column: 3, scope: !378, inlinedAt: !750)
!814 = !DILocation(line: 0, scope: !356, inlinedAt: !815)
!815 = distinct !DILocation(line: 429, column: 5, scope: !508)
!816 = !DILocation(line: 272, column: 5, scope: !375, inlinedAt: !815)
!817 = !DILocation(line: 273, column: 30, scope: !373, inlinedAt: !815)
!818 = !DILocation(line: 0, scope: !373, inlinedAt: !815)
!819 = !DILocation(line: 275, column: 19, scope: !373, inlinedAt: !815)
!820 = !DILocation(line: 277, column: 22, scope: !373, inlinedAt: !815)
!821 = !DILocation(line: 277, column: 19, scope: !373, inlinedAt: !815)
!822 = !DILocation(line: 279, column: 22, scope: !373, inlinedAt: !815)
!823 = !DILocation(line: 279, column: 19, scope: !373, inlinedAt: !815)
!824 = !DILocation(line: 281, column: 22, scope: !373, inlinedAt: !815)
!825 = !DILocation(line: 281, column: 19, scope: !373, inlinedAt: !815)
!826 = !DILocation(line: 285, column: 7, scope: !391, inlinedAt: !815)
!827 = !DILocation(line: 286, column: 36, scope: !389, inlinedAt: !815)
!828 = !DILocation(line: 286, column: 26, scope: !389, inlinedAt: !815)
!829 = !DILocation(line: 0, scope: !389, inlinedAt: !815)
!830 = !DILocation(line: 288, column: 30, scope: !389, inlinedAt: !815)
!831 = !DILocation(line: 288, column: 14, scope: !389, inlinedAt: !815)
!832 = !DILocation(line: 290, column: 44, scope: !389, inlinedAt: !815)
!833 = !DILocation(line: 290, column: 30, scope: !389, inlinedAt: !815)
!834 = !DILocation(line: 290, column: 14, scope: !389, inlinedAt: !815)
!835 = !DILocation(line: 292, column: 44, scope: !389, inlinedAt: !815)
!836 = !DILocation(line: 292, column: 30, scope: !389, inlinedAt: !815)
!837 = !DILocation(line: 292, column: 14, scope: !389, inlinedAt: !815)
!838 = !DILocation(line: 294, column: 44, scope: !389, inlinedAt: !815)
!839 = !DILocation(line: 294, column: 30, scope: !389, inlinedAt: !815)
!840 = !DILocation(line: 294, column: 14, scope: !389, inlinedAt: !815)
!841 = !DILocation(line: 297, column: 34, scope: !389, inlinedAt: !815)
!842 = !DILocation(line: 297, column: 54, scope: !389, inlinedAt: !815)
!843 = !DILocation(line: 297, column: 24, scope: !389, inlinedAt: !815)
!844 = !DILocation(line: 285, column: 57, scope: !390, inlinedAt: !815)
!845 = !DILocation(line: 285, column: 35, scope: !390, inlinedAt: !815)
!846 = distinct !{!846, !826, !847, !151}
!847 = !DILocation(line: 299, column: 7, scope: !391, inlinedAt: !815)
!848 = !DILocation(line: 300, column: 30, scope: !373, inlinedAt: !815)
!849 = !DILocation(line: 300, column: 47, scope: !373, inlinedAt: !815)
!850 = !DILocation(line: 300, column: 19, scope: !373, inlinedAt: !815)
!851 = !DILocation(line: 302, column: 12, scope: !373, inlinedAt: !815)
!852 = !DILocation(line: 304, column: 14, scope: !373, inlinedAt: !815)
!853 = !DILocation(line: 306, column: 14, scope: !373, inlinedAt: !815)
!854 = !DILocation(line: 308, column: 14, scope: !373, inlinedAt: !815)
!855 = !DILocation(line: 310, column: 8, scope: !373, inlinedAt: !815)
!856 = !DILocation(line: 272, column: 62, scope: !374, inlinedAt: !815)
!857 = !DILocation(line: 272, column: 37, scope: !374, inlinedAt: !815)
!858 = distinct !{!858, !816, !859, !151}
!859 = !DILocation(line: 311, column: 5, scope: !375, inlinedAt: !815)
!860 = !DILocation(line: 313, column: 45, scope: !376, inlinedAt: !815)
!861 = !DILocation(line: 313, column: 17, scope: !376, inlinedAt: !815)
!862 = !DILocation(line: 314, column: 20, scope: !376, inlinedAt: !815)
!863 = !DILocation(line: 314, column: 29, scope: !376, inlinedAt: !815)
!864 = !DILocation(line: 314, column: 9, scope: !376, inlinedAt: !815)
!865 = !DILocation(line: 271, column: 53, scope: !377, inlinedAt: !815)
!866 = !DILocation(line: 271, column: 31, scope: !377, inlinedAt: !815)
!867 = !DILocation(line: 271, column: 3, scope: !378, inlinedAt: !815)
!868 = distinct !{!868, !867, !869, !151}
!869 = !DILocation(line: 315, column: 3, scope: !378, inlinedAt: !815)
!870 = !DILocation(line: 0, scope: !356, inlinedAt: !871)
!871 = distinct !DILocation(line: 432, column: 5, scope: !508)
!872 = !DILocation(line: 272, column: 5, scope: !375, inlinedAt: !871)
!873 = !DILocation(line: 273, column: 30, scope: !373, inlinedAt: !871)
!874 = !DILocation(line: 0, scope: !373, inlinedAt: !871)
!875 = !DILocation(line: 275, column: 19, scope: !373, inlinedAt: !871)
!876 = !DILocation(line: 277, column: 22, scope: !373, inlinedAt: !871)
!877 = !DILocation(line: 277, column: 19, scope: !373, inlinedAt: !871)
!878 = !DILocation(line: 279, column: 22, scope: !373, inlinedAt: !871)
!879 = !DILocation(line: 279, column: 19, scope: !373, inlinedAt: !871)
!880 = !DILocation(line: 281, column: 22, scope: !373, inlinedAt: !871)
!881 = !DILocation(line: 281, column: 19, scope: !373, inlinedAt: !871)
!882 = !DILocation(line: 285, column: 7, scope: !391, inlinedAt: !871)
!883 = !DILocation(line: 286, column: 36, scope: !389, inlinedAt: !871)
!884 = !DILocation(line: 286, column: 26, scope: !389, inlinedAt: !871)
!885 = !DILocation(line: 0, scope: !389, inlinedAt: !871)
!886 = !DILocation(line: 288, column: 30, scope: !389, inlinedAt: !871)
!887 = !DILocation(line: 288, column: 14, scope: !389, inlinedAt: !871)
!888 = !DILocation(line: 290, column: 44, scope: !389, inlinedAt: !871)
!889 = !DILocation(line: 290, column: 30, scope: !389, inlinedAt: !871)
!890 = !DILocation(line: 290, column: 14, scope: !389, inlinedAt: !871)
!891 = !DILocation(line: 292, column: 44, scope: !389, inlinedAt: !871)
!892 = !DILocation(line: 292, column: 30, scope: !389, inlinedAt: !871)
!893 = !DILocation(line: 292, column: 14, scope: !389, inlinedAt: !871)
!894 = !DILocation(line: 294, column: 44, scope: !389, inlinedAt: !871)
!895 = !DILocation(line: 294, column: 30, scope: !389, inlinedAt: !871)
!896 = !DILocation(line: 294, column: 14, scope: !389, inlinedAt: !871)
!897 = !DILocation(line: 297, column: 34, scope: !389, inlinedAt: !871)
!898 = !DILocation(line: 297, column: 54, scope: !389, inlinedAt: !871)
!899 = !DILocation(line: 297, column: 24, scope: !389, inlinedAt: !871)
!900 = !DILocation(line: 285, column: 57, scope: !390, inlinedAt: !871)
!901 = !DILocation(line: 285, column: 35, scope: !390, inlinedAt: !871)
!902 = distinct !{!902, !882, !903, !151}
!903 = !DILocation(line: 299, column: 7, scope: !391, inlinedAt: !871)
!904 = !DILocation(line: 300, column: 30, scope: !373, inlinedAt: !871)
!905 = !DILocation(line: 300, column: 47, scope: !373, inlinedAt: !871)
!906 = !DILocation(line: 300, column: 19, scope: !373, inlinedAt: !871)
!907 = !DILocation(line: 302, column: 12, scope: !373, inlinedAt: !871)
!908 = !DILocation(line: 304, column: 14, scope: !373, inlinedAt: !871)
!909 = !DILocation(line: 306, column: 14, scope: !373, inlinedAt: !871)
!910 = !DILocation(line: 308, column: 14, scope: !373, inlinedAt: !871)
!911 = !DILocation(line: 310, column: 8, scope: !373, inlinedAt: !871)
!912 = !DILocation(line: 272, column: 62, scope: !374, inlinedAt: !871)
!913 = !DILocation(line: 272, column: 37, scope: !374, inlinedAt: !871)
!914 = distinct !{!914, !872, !915, !151}
!915 = !DILocation(line: 311, column: 5, scope: !375, inlinedAt: !871)
!916 = !DILocation(line: 313, column: 45, scope: !376, inlinedAt: !871)
!917 = !DILocation(line: 313, column: 17, scope: !376, inlinedAt: !871)
!918 = !DILocation(line: 314, column: 20, scope: !376, inlinedAt: !871)
!919 = !DILocation(line: 314, column: 29, scope: !376, inlinedAt: !871)
!920 = !DILocation(line: 314, column: 9, scope: !376, inlinedAt: !871)
!921 = !DILocation(line: 271, column: 53, scope: !377, inlinedAt: !871)
!922 = !DILocation(line: 271, column: 31, scope: !377, inlinedAt: !871)
!923 = !DILocation(line: 271, column: 3, scope: !378, inlinedAt: !871)
!924 = distinct !{!924, !923, !925, !151}
!925 = !DILocation(line: 315, column: 3, scope: !378, inlinedAt: !871)
!926 = !DILocation(line: 0, scope: !356, inlinedAt: !927)
!927 = distinct !DILocation(line: 435, column: 5, scope: !508)
!928 = !DILocation(line: 272, column: 5, scope: !375, inlinedAt: !927)
!929 = !DILocation(line: 273, column: 30, scope: !373, inlinedAt: !927)
!930 = !DILocation(line: 0, scope: !373, inlinedAt: !927)
!931 = !DILocation(line: 275, column: 19, scope: !373, inlinedAt: !927)
!932 = !DILocation(line: 277, column: 22, scope: !373, inlinedAt: !927)
!933 = !DILocation(line: 277, column: 19, scope: !373, inlinedAt: !927)
!934 = !DILocation(line: 279, column: 22, scope: !373, inlinedAt: !927)
!935 = !DILocation(line: 279, column: 19, scope: !373, inlinedAt: !927)
!936 = !DILocation(line: 281, column: 22, scope: !373, inlinedAt: !927)
!937 = !DILocation(line: 281, column: 19, scope: !373, inlinedAt: !927)
!938 = !DILocation(line: 285, column: 7, scope: !391, inlinedAt: !927)
!939 = !DILocation(line: 286, column: 36, scope: !389, inlinedAt: !927)
!940 = !DILocation(line: 286, column: 26, scope: !389, inlinedAt: !927)
!941 = !DILocation(line: 0, scope: !389, inlinedAt: !927)
!942 = !DILocation(line: 288, column: 30, scope: !389, inlinedAt: !927)
!943 = !DILocation(line: 288, column: 14, scope: !389, inlinedAt: !927)
!944 = !DILocation(line: 290, column: 44, scope: !389, inlinedAt: !927)
!945 = !DILocation(line: 290, column: 30, scope: !389, inlinedAt: !927)
!946 = !DILocation(line: 290, column: 14, scope: !389, inlinedAt: !927)
!947 = !DILocation(line: 292, column: 44, scope: !389, inlinedAt: !927)
!948 = !DILocation(line: 292, column: 30, scope: !389, inlinedAt: !927)
!949 = !DILocation(line: 292, column: 14, scope: !389, inlinedAt: !927)
!950 = !DILocation(line: 294, column: 44, scope: !389, inlinedAt: !927)
!951 = !DILocation(line: 294, column: 30, scope: !389, inlinedAt: !927)
!952 = !DILocation(line: 294, column: 14, scope: !389, inlinedAt: !927)
!953 = !DILocation(line: 297, column: 34, scope: !389, inlinedAt: !927)
!954 = !DILocation(line: 297, column: 54, scope: !389, inlinedAt: !927)
!955 = !DILocation(line: 297, column: 24, scope: !389, inlinedAt: !927)
!956 = !DILocation(line: 285, column: 57, scope: !390, inlinedAt: !927)
!957 = !DILocation(line: 285, column: 35, scope: !390, inlinedAt: !927)
!958 = distinct !{!958, !938, !959, !151}
!959 = !DILocation(line: 299, column: 7, scope: !391, inlinedAt: !927)
!960 = !DILocation(line: 300, column: 30, scope: !373, inlinedAt: !927)
!961 = !DILocation(line: 300, column: 47, scope: !373, inlinedAt: !927)
!962 = !DILocation(line: 300, column: 19, scope: !373, inlinedAt: !927)
!963 = !DILocation(line: 302, column: 12, scope: !373, inlinedAt: !927)
!964 = !DILocation(line: 304, column: 14, scope: !373, inlinedAt: !927)
!965 = !DILocation(line: 306, column: 14, scope: !373, inlinedAt: !927)
!966 = !DILocation(line: 308, column: 14, scope: !373, inlinedAt: !927)
!967 = !DILocation(line: 310, column: 8, scope: !373, inlinedAt: !927)
!968 = !DILocation(line: 272, column: 62, scope: !374, inlinedAt: !927)
!969 = !DILocation(line: 272, column: 37, scope: !374, inlinedAt: !927)
!970 = distinct !{!970, !928, !971, !151}
!971 = !DILocation(line: 311, column: 5, scope: !375, inlinedAt: !927)
!972 = !DILocation(line: 313, column: 45, scope: !376, inlinedAt: !927)
!973 = !DILocation(line: 313, column: 17, scope: !376, inlinedAt: !927)
!974 = !DILocation(line: 314, column: 20, scope: !376, inlinedAt: !927)
!975 = !DILocation(line: 314, column: 29, scope: !376, inlinedAt: !927)
!976 = !DILocation(line: 314, column: 9, scope: !376, inlinedAt: !927)
!977 = !DILocation(line: 271, column: 53, scope: !377, inlinedAt: !927)
!978 = !DILocation(line: 271, column: 31, scope: !377, inlinedAt: !927)
!979 = !DILocation(line: 271, column: 3, scope: !378, inlinedAt: !927)
!980 = distinct !{!980, !979, !981, !151}
!981 = !DILocation(line: 315, column: 3, scope: !378, inlinedAt: !927)
!982 = !DILocation(line: 440, column: 1, scope: !457)
!983 = distinct !DISubprogram(name: "OptimizedStrassenMultiply", scope: !3, file: !3, line: 465, type: !246, scopeLine: 467, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !984)
!984 = !{!985, !986, !987, !988, !989, !990, !991, !992, !993, !994, !995, !996, !997, !998, !999, !1000, !1001, !1002, !1003, !1004, !1005, !1006, !1007, !1008, !1009, !1010, !1011, !1012, !1013, !1014, !1015, !1016, !1017, !1018, !1019, !1020, !1021, !1022, !1023, !1025, !1026, !1033, !1034, !1035, !1036, !1037, !1038, !1039, !1040, !1041, !1042, !1043, !1044, !1045, !1046, !1047}
!985 = !DILocalVariable(name: "C", arg: 1, scope: !983, file: !3, line: 465, type: !6)
!986 = !DILocalVariable(name: "A", arg: 2, scope: !983, file: !3, line: 465, type: !6)
!987 = !DILocalVariable(name: "B", arg: 3, scope: !983, file: !3, line: 465, type: !6)
!988 = !DILocalVariable(name: "MatrixSize", arg: 4, scope: !983, file: !3, line: 466, type: !5)
!989 = !DILocalVariable(name: "RowWidthC", arg: 5, scope: !983, file: !3, line: 466, type: !5)
!990 = !DILocalVariable(name: "RowWidthA", arg: 6, scope: !983, file: !3, line: 467, type: !5)
!991 = !DILocalVariable(name: "RowWidthB", arg: 7, scope: !983, file: !3, line: 467, type: !5)
!992 = !DILocalVariable(name: "QuadrantSize", scope: !983, file: !3, line: 469, type: !5)
!993 = !DILocalVariable(name: "QuadrantSizeInBytes", scope: !983, file: !3, line: 470, type: !5)
!994 = !DILocalVariable(name: "Column", scope: !983, file: !3, line: 472, type: !5)
!995 = !DILocalVariable(name: "Row", scope: !983, file: !3, line: 472, type: !5)
!996 = !DILocalVariable(name: "A12", scope: !983, file: !3, line: 483, type: !6)
!997 = !DILocalVariable(name: "B12", scope: !983, file: !3, line: 483, type: !6)
!998 = !DILocalVariable(name: "C12", scope: !983, file: !3, line: 483, type: !6)
!999 = !DILocalVariable(name: "A21", scope: !983, file: !3, line: 484, type: !6)
!1000 = !DILocalVariable(name: "B21", scope: !983, file: !3, line: 484, type: !6)
!1001 = !DILocalVariable(name: "C21", scope: !983, file: !3, line: 484, type: !6)
!1002 = !DILocalVariable(name: "A22", scope: !983, file: !3, line: 484, type: !6)
!1003 = !DILocalVariable(name: "B22", scope: !983, file: !3, line: 484, type: !6)
!1004 = !DILocalVariable(name: "C22", scope: !983, file: !3, line: 484, type: !6)
!1005 = !DILocalVariable(name: "S1", scope: !983, file: !3, line: 486, type: !6)
!1006 = !DILocalVariable(name: "S2", scope: !983, file: !3, line: 486, type: !6)
!1007 = !DILocalVariable(name: "S3", scope: !983, file: !3, line: 486, type: !6)
!1008 = !DILocalVariable(name: "S4", scope: !983, file: !3, line: 486, type: !6)
!1009 = !DILocalVariable(name: "S5", scope: !983, file: !3, line: 486, type: !6)
!1010 = !DILocalVariable(name: "S6", scope: !983, file: !3, line: 486, type: !6)
!1011 = !DILocalVariable(name: "S7", scope: !983, file: !3, line: 486, type: !6)
!1012 = !DILocalVariable(name: "S8", scope: !983, file: !3, line: 486, type: !6)
!1013 = !DILocalVariable(name: "M2", scope: !983, file: !3, line: 486, type: !6)
!1014 = !DILocalVariable(name: "M5", scope: !983, file: !3, line: 486, type: !6)
!1015 = !DILocalVariable(name: "T1sMULT", scope: !983, file: !3, line: 486, type: !6)
!1016 = !DILocalVariable(name: "TempMatrixOffset", scope: !983, file: !3, line: 490, type: !9)
!1017 = !DILocalVariable(name: "MatrixOffsetA", scope: !983, file: !3, line: 491, type: !9)
!1018 = !DILocalVariable(name: "MatrixOffsetB", scope: !983, file: !3, line: 492, type: !9)
!1019 = !DILocalVariable(name: "RowIncrementA", scope: !983, file: !3, line: 495, type: !9)
!1020 = !DILocalVariable(name: "RowIncrementB", scope: !983, file: !3, line: 496, type: !9)
!1021 = !DILocalVariable(name: "RowIncrementC", scope: !983, file: !3, line: 497, type: !9)
!1022 = !DILocalVariable(name: "Heap", scope: !983, file: !3, line: 499, type: !11)
!1023 = !DILocalVariable(name: "StartHeap", scope: !983, file: !3, line: 500, type: !1024)
!1024 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!1025 = !DILocalVariable(name: "_tmp", scope: !983, file: !3, line: 525, type: !11)
!1026 = !DILocalVariable(name: "LocalM5_0", scope: !1027, file: !3, line: 637, type: !7)
!1027 = distinct !DILexicalBlock(scope: !1028, file: !3, line: 636, column: 58)
!1028 = distinct !DILexicalBlock(scope: !1029, file: !3, line: 636, column: 5)
!1029 = distinct !DILexicalBlock(scope: !1030, file: !3, line: 636, column: 5)
!1030 = distinct !DILexicalBlock(scope: !1031, file: !3, line: 630, column: 44)
!1031 = distinct !DILexicalBlock(scope: !1032, file: !3, line: 630, column: 3)
!1032 = distinct !DILexicalBlock(scope: !983, file: !3, line: 630, column: 3)
!1033 = !DILocalVariable(name: "LocalM5_1", scope: !1027, file: !3, line: 638, type: !7)
!1034 = !DILocalVariable(name: "LocalM5_2", scope: !1027, file: !3, line: 639, type: !7)
!1035 = !DILocalVariable(name: "LocalM5_3", scope: !1027, file: !3, line: 640, type: !7)
!1036 = !DILocalVariable(name: "LocalM2_0", scope: !1027, file: !3, line: 641, type: !7)
!1037 = !DILocalVariable(name: "LocalM2_1", scope: !1027, file: !3, line: 642, type: !7)
!1038 = !DILocalVariable(name: "LocalM2_2", scope: !1027, file: !3, line: 643, type: !7)
!1039 = !DILocalVariable(name: "LocalM2_3", scope: !1027, file: !3, line: 644, type: !7)
!1040 = !DILocalVariable(name: "T1_0", scope: !1027, file: !3, line: 645, type: !7)
!1041 = !DILocalVariable(name: "T1_1", scope: !1027, file: !3, line: 646, type: !7)
!1042 = !DILocalVariable(name: "T1_2", scope: !1027, file: !3, line: 647, type: !7)
!1043 = !DILocalVariable(name: "T1_3", scope: !1027, file: !3, line: 648, type: !7)
!1044 = !DILocalVariable(name: "T2_0", scope: !1027, file: !3, line: 649, type: !7)
!1045 = !DILocalVariable(name: "T2_1", scope: !1027, file: !3, line: 650, type: !7)
!1046 = !DILocalVariable(name: "T2_2", scope: !1027, file: !3, line: 651, type: !7)
!1047 = !DILocalVariable(name: "T2_3", scope: !1027, file: !3, line: 652, type: !7)
!1048 = !DILocation(line: 0, scope: !983)
!1049 = !DILocation(line: 469, column: 38, scope: !983)
!1050 = !DILocation(line: 471, column: 20, scope: !983)
!1051 = !DILocation(line: 471, column: 18, scope: !983)
!1052 = !DILocation(line: 471, column: 33, scope: !983)
!1053 = !DILocation(line: 471, column: 48, scope: !983)
!1054 = !DILocation(line: 495, column: 35, scope: !983)
!1055 = !DILocation(line: 495, column: 52, scope: !983)
!1056 = !DILocation(line: 495, column: 23, scope: !983)
!1057 = !DILocation(line: 496, column: 35, scope: !983)
!1058 = !DILocation(line: 496, column: 52, scope: !983)
!1059 = !DILocation(line: 496, column: 23, scope: !983)
!1060 = !DILocation(line: 497, column: 35, scope: !983)
!1061 = !DILocation(line: 497, column: 52, scope: !983)
!1062 = !DILocation(line: 497, column: 23, scope: !983)
!1063 = !DILocation(line: 502, column: 18, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !983, file: !3, line: 502, column: 7)
!1065 = !DILocation(line: 502, column: 7, scope: !983)
!1066 = !DILocation(line: 503, column: 5, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1064, file: !3, line: 502, column: 65)
!1068 = !DILocation(line: 506, column: 5, scope: !1067)
!1069 = !DILocation(line: 514, column: 13, scope: !983)
!1070 = !DILocation(line: 516, column: 13, scope: !983)
!1071 = !DILocation(line: 517, column: 24, scope: !983)
!1072 = !DILocation(line: 517, column: 11, scope: !983)
!1073 = !DILocation(line: 518, column: 24, scope: !983)
!1074 = !DILocation(line: 518, column: 11, scope: !983)
!1075 = !DILocation(line: 519, column: 24, scope: !983)
!1076 = !DILocation(line: 519, column: 11, scope: !983)
!1077 = !DILocation(line: 520, column: 13, scope: !983)
!1078 = !DILocation(line: 521, column: 13, scope: !983)
!1079 = !DILocation(line: 522, column: 13, scope: !983)
!1080 = !DILocation(line: 525, column: 52, scope: !983)
!1081 = !DILocation(line: 525, column: 32, scope: !983)
!1082 = !DILocation(line: 525, column: 25, scope: !983)
!1083 = !DILocation(line: 528, column: 9, scope: !1084)
!1084 = distinct !DILexicalBlock(scope: !983, file: !3, line: 528, column: 8)
!1085 = !DILocation(line: 528, column: 21, scope: !1084)
!1086 = !DILocation(line: 528, column: 8, scope: !983)
!1087 = !DILocation(line: 532, column: 8, scope: !983)
!1088 = !DILocation(line: 532, column: 27, scope: !983)
!1089 = !DILocation(line: 533, column: 8, scope: !983)
!1090 = !DILocation(line: 533, column: 27, scope: !983)
!1091 = !DILocation(line: 534, column: 8, scope: !983)
!1092 = !DILocation(line: 534, column: 27, scope: !983)
!1093 = !DILocation(line: 535, column: 8, scope: !983)
!1094 = !DILocation(line: 535, column: 27, scope: !983)
!1095 = !DILocation(line: 536, column: 8, scope: !983)
!1096 = !DILocation(line: 536, column: 27, scope: !983)
!1097 = !DILocation(line: 537, column: 8, scope: !983)
!1098 = !DILocation(line: 537, column: 27, scope: !983)
!1099 = !DILocation(line: 538, column: 8, scope: !983)
!1100 = !DILocation(line: 538, column: 27, scope: !983)
!1101 = !DILocation(line: 539, column: 8, scope: !983)
!1102 = !DILocation(line: 539, column: 27, scope: !983)
!1103 = !DILocation(line: 540, column: 8, scope: !983)
!1104 = !DILocation(line: 540, column: 27, scope: !983)
!1105 = !DILocation(line: 541, column: 8, scope: !983)
!1106 = !DILocation(line: 541, column: 27, scope: !983)
!1107 = !DILocation(line: 542, column: 13, scope: !983)
!1108 = !DILocation(line: 515, column: 13, scope: !983)
!1109 = !DILocation(line: 549, column: 3, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !983, file: !3, line: 549, column: 3)
!1111 = !DILocation(line: 555, column: 5, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1113, file: !3, line: 555, column: 5)
!1113 = distinct !DILexicalBlock(scope: !1114, file: !3, line: 549, column: 44)
!1114 = distinct !DILexicalBlock(scope: !1110, file: !3, line: 549, column: 3)
!1115 = !DILocation(line: 569, column: 15, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1117, file: !3, line: 555, column: 55)
!1117 = distinct !DILexicalBlock(scope: !1112, file: !3, line: 555, column: 5)
!1118 = !DILocation(line: 569, column: 45, scope: !1116)
!1119 = !DILocation(line: 569, column: 55, scope: !1116)
!1120 = !DILocation(line: 569, column: 53, scope: !1116)
!1121 = !DILocation(line: 569, column: 37, scope: !1116)
!1122 = !DILocation(line: 569, column: 43, scope: !1116)
!1123 = !DILocation(line: 569, column: 67, scope: !1116)
!1124 = !DILocation(line: 569, column: 65, scope: !1116)
!1125 = !DILocation(line: 569, column: 27, scope: !1116)
!1126 = !DILocation(line: 569, column: 33, scope: !1116)
!1127 = !DILocation(line: 569, column: 23, scope: !1116)
!1128 = !DILocation(line: 569, column: 7, scope: !1116)
!1129 = !DILocation(line: 569, column: 13, scope: !1116)
!1130 = !DILocation(line: 572, column: 25, scope: !1116)
!1131 = !DILocation(line: 572, column: 45, scope: !1116)
!1132 = !DILocation(line: 572, column: 55, scope: !1116)
!1133 = !DILocation(line: 572, column: 53, scope: !1116)
!1134 = !DILocation(line: 572, column: 37, scope: !1116)
!1135 = !DILocation(line: 572, column: 43, scope: !1116)
!1136 = !DILocation(line: 572, column: 33, scope: !1116)
!1137 = !DILocation(line: 572, column: 17, scope: !1116)
!1138 = !DILocation(line: 572, column: 23, scope: !1116)
!1139 = !DILocation(line: 572, column: 69, scope: !1116)
!1140 = !DILocation(line: 572, column: 67, scope: !1116)
!1141 = !DILocation(line: 572, column: 7, scope: !1116)
!1142 = !DILocation(line: 572, column: 13, scope: !1116)
!1143 = !DILocation(line: 575, column: 15, scope: !1116)
!1144 = !DILocation(line: 575, column: 25, scope: !1116)
!1145 = !DILocation(line: 575, column: 23, scope: !1116)
!1146 = !DILocation(line: 575, column: 7, scope: !1116)
!1147 = !DILocation(line: 575, column: 13, scope: !1116)
!1148 = !DILocation(line: 578, column: 15, scope: !1116)
!1149 = !DILocation(line: 578, column: 25, scope: !1116)
!1150 = !DILocation(line: 578, column: 23, scope: !1116)
!1151 = !DILocation(line: 578, column: 7, scope: !1116)
!1152 = !DILocation(line: 578, column: 13, scope: !1116)
!1153 = !DILocation(line: 580, column: 24, scope: !1116)
!1154 = !DILocation(line: 581, column: 21, scope: !1116)
!1155 = !DILocation(line: 582, column: 21, scope: !1116)
!1156 = !DILocation(line: 555, column: 51, scope: !1117)
!1157 = !DILocation(line: 555, column: 29, scope: !1117)
!1158 = distinct !{!1158, !1111, !1159, !151}
!1159 = !DILocation(line: 583, column: 5, scope: !1112)
!1160 = !DILocation(line: 585, column: 19, scope: !1113)
!1161 = !DILocation(line: 586, column: 19, scope: !1113)
!1162 = !DILocation(line: 549, column: 40, scope: !1114)
!1163 = !DILocation(line: 549, column: 21, scope: !1114)
!1164 = distinct !{!1164, !1109, !1165, !151}
!1165 = !DILocation(line: 587, column: 3, scope: !1110)
!1166 = !DILocation(line: 590, column: 14, scope: !983)
!1167 = !DILocation(line: 594, column: 14, scope: !983)
!1168 = !DILocation(line: 599, column: 14, scope: !983)
!1169 = !DILocation(line: 604, column: 14, scope: !983)
!1170 = !DILocation(line: 609, column: 14, scope: !983)
!1171 = !DILocation(line: 613, column: 14, scope: !983)
!1172 = !DILocation(line: 617, column: 3, scope: !983)
!1173 = !DILocation(line: 623, column: 3, scope: !983)
!1174 = !DILocation(line: 630, column: 21, scope: !1031)
!1175 = !DILocation(line: 630, column: 3, scope: !1032)
!1176 = !DILocation(line: 636, column: 5, scope: !1029)
!1177 = !DILocation(line: 0, scope: !1027)
!1178 = !DILocation(line: 637, column: 24, scope: !1027)
!1179 = !DILocation(line: 639, column: 28, scope: !1027)
!1180 = !DILocation(line: 639, column: 24, scope: !1027)
!1181 = !DILocation(line: 641, column: 24, scope: !1027)
!1182 = !DILocation(line: 643, column: 28, scope: !1027)
!1183 = !DILocation(line: 643, column: 24, scope: !1027)
!1184 = !DILocation(line: 645, column: 19, scope: !1027)
!1185 = !DILocation(line: 645, column: 30, scope: !1027)
!1186 = !DILocation(line: 647, column: 28, scope: !1027)
!1187 = !DILocation(line: 647, column: 19, scope: !1027)
!1188 = !DILocation(line: 647, column: 32, scope: !1027)
!1189 = !DILocation(line: 649, column: 19, scope: !1027)
!1190 = !DILocation(line: 649, column: 26, scope: !1027)
!1191 = !DILocation(line: 651, column: 24, scope: !1027)
!1192 = !DILocation(line: 651, column: 19, scope: !1027)
!1193 = !DILocation(line: 651, column: 28, scope: !1027)
!1194 = !DILocation(line: 653, column: 18, scope: !1027)
!1195 = !DILocation(line: 655, column: 13, scope: !1027)
!1196 = !DILocation(line: 655, column: 18, scope: !1027)
!1197 = !DILocation(line: 657, column: 31, scope: !1027)
!1198 = !DILocation(line: 657, column: 18, scope: !1027)
!1199 = !DILocation(line: 659, column: 13, scope: !1027)
!1200 = !DILocation(line: 659, column: 31, scope: !1027)
!1201 = !DILocation(line: 659, column: 18, scope: !1027)
!1202 = !DILocation(line: 661, column: 30, scope: !1027)
!1203 = !DILocation(line: 661, column: 18, scope: !1027)
!1204 = !DILocation(line: 663, column: 30, scope: !1027)
!1205 = !DILocation(line: 663, column: 18, scope: !1027)
!1206 = !DILocation(line: 665, column: 23, scope: !1027)
!1207 = !DILocation(line: 665, column: 33, scope: !1027)
!1208 = !DILocation(line: 665, column: 18, scope: !1027)
!1209 = !DILocation(line: 667, column: 28, scope: !1027)
!1210 = !DILocation(line: 667, column: 23, scope: !1027)
!1211 = !DILocation(line: 667, column: 33, scope: !1027)
!1212 = !DILocation(line: 667, column: 18, scope: !1027)
!1213 = !DILocation(line: 669, column: 10, scope: !1027)
!1214 = !DILocation(line: 670, column: 10, scope: !1027)
!1215 = !DILocation(line: 671, column: 15, scope: !1027)
!1216 = !DILocation(line: 672, column: 11, scope: !1027)
!1217 = !DILocation(line: 673, column: 11, scope: !1027)
!1218 = !DILocation(line: 674, column: 11, scope: !1027)
!1219 = !DILocation(line: 675, column: 11, scope: !1027)
!1220 = !DILocation(line: 636, column: 52, scope: !1028)
!1221 = !DILocation(line: 636, column: 29, scope: !1028)
!1222 = distinct !{!1222, !1176, !1223, !151}
!1223 = !DILocation(line: 676, column: 5, scope: !1029)
!1224 = !DILocation(line: 678, column: 22, scope: !1030)
!1225 = !DILocation(line: 678, column: 34, scope: !1030)
!1226 = !DILocation(line: 678, column: 11, scope: !1030)
!1227 = !DILocation(line: 679, column: 22, scope: !1030)
!1228 = !DILocation(line: 679, column: 34, scope: !1030)
!1229 = !DILocation(line: 679, column: 11, scope: !1030)
!1230 = !DILocation(line: 680, column: 22, scope: !1030)
!1231 = !DILocation(line: 680, column: 34, scope: !1030)
!1232 = !DILocation(line: 680, column: 11, scope: !1030)
!1233 = !DILocation(line: 681, column: 22, scope: !1030)
!1234 = !DILocation(line: 681, column: 34, scope: !1030)
!1235 = !DILocation(line: 681, column: 11, scope: !1030)
!1236 = !DILocation(line: 630, column: 40, scope: !1031)
!1237 = distinct !{!1237, !1175, !1238, !151}
!1238 = !DILocation(line: 682, column: 3, scope: !1032)
!1239 = !DILocation(line: 683, column: 3, scope: !983)
!1240 = !DILocation(line: 686, column: 1, scope: !983)
!1241 = distinct !DISubprogram(name: "init_vec", scope: !3, file: !3, line: 691, type: !1242, scopeLine: 691, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1244)
!1242 = !DISubroutineType(types: !1243)
!1243 = !{null, !24, !6}
!1244 = !{!1245, !1246, !1247}
!1245 = !DILocalVariable(name: "n", arg: 1, scope: !1241, file: !3, line: 691, type: !24)
!1246 = !DILocalVariable(name: "V", arg: 2, scope: !1241, file: !3, line: 691, type: !6)
!1247 = !DILocalVariable(name: "i", scope: !1241, file: !3, line: 692, type: !24)
!1248 = !DILocation(line: 0, scope: !1241)
!1249 = !DILocation(line: 694, column: 14, scope: !1250)
!1250 = distinct !DILexicalBlock(scope: !1251, file: !3, line: 694, column: 3)
!1251 = distinct !DILexicalBlock(scope: !1241, file: !3, line: 694, column: 3)
!1252 = !DILocation(line: 694, column: 3, scope: !1251)
!1253 = !DILocation(line: 82, column: 23, scope: !91, inlinedAt: !1254)
!1254 = distinct !DILocation(line: 695, column: 22, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1250, file: !3, line: 694, column: 24)
!1256 = !DILocation(line: 82, column: 36, scope: !91, inlinedAt: !1254)
!1257 = !DILocation(line: 83, column: 22, scope: !91, inlinedAt: !1254)
!1258 = !DILocation(line: 83, column: 12, scope: !91, inlinedAt: !1254)
!1259 = !DILocation(line: 0, scope: !91, inlinedAt: !1254)
!1260 = !DILocation(line: 695, column: 13, scope: !1255)
!1261 = !DILocation(line: 695, column: 35, scope: !1255)
!1262 = !DILocation(line: 695, column: 5, scope: !1255)
!1263 = !DILocation(line: 695, column: 10, scope: !1255)
!1264 = !DILocation(line: 694, column: 20, scope: !1250)
!1265 = distinct !{!1265, !1252, !1266, !151}
!1266 = !DILocation(line: 696, column: 3, scope: !1251)
!1267 = !DILocation(line: 82, column: 12, scope: !91, inlinedAt: !1254)
!1268 = !DILocation(line: 697, column: 1, scope: !1241)
!1269 = distinct !DISubprogram(name: "compare_vec", scope: !3, file: !3, line: 702, type: !1270, scopeLine: 702, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1272)
!1270 = !DISubroutineType(types: !1271)
!1271 = !{!24, !24, !6, !6}
!1272 = !{!1273, !1274, !1275, !1276, !1277, !1278}
!1273 = !DILocalVariable(name: "n", arg: 1, scope: !1269, file: !3, line: 702, type: !24)
!1274 = !DILocalVariable(name: "V1", arg: 2, scope: !1269, file: !3, line: 702, type: !6)
!1275 = !DILocalVariable(name: "V2", arg: 3, scope: !1269, file: !3, line: 702, type: !6)
!1276 = !DILocalVariable(name: "i", scope: !1269, file: !3, line: 703, type: !24)
!1277 = !DILocalVariable(name: "c", scope: !1269, file: !3, line: 704, type: !7)
!1278 = !DILocalVariable(name: "sum", scope: !1269, file: !3, line: 704, type: !7)
!1279 = !DILocation(line: 0, scope: !1269)
!1280 = !DILocation(line: 706, column: 16, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1282, file: !3, line: 706, column: 3)
!1282 = distinct !DILexicalBlock(scope: !1269, file: !3, line: 706, column: 3)
!1283 = !DILocation(line: 706, column: 3, scope: !1282)
!1284 = !DILocation(line: 707, column: 9, scope: !1285)
!1285 = distinct !DILexicalBlock(scope: !1281, file: !3, line: 706, column: 26)
!1286 = !DILocation(line: 707, column: 17, scope: !1285)
!1287 = !DILocation(line: 707, column: 15, scope: !1285)
!1288 = !DILocation(line: 708, column: 11, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1285, file: !3, line: 708, column: 9)
!1290 = !DILocation(line: 708, column: 9, scope: !1285)
!1291 = !DILocation(line: 714, column: 11, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1285, file: !3, line: 714, column: 9)
!1293 = !DILocation(line: 714, column: 9, scope: !1285)
!1294 = !DILocation(line: 711, column: 9, scope: !1285)
!1295 = !DILocation(line: 706, column: 21, scope: !1281)
!1296 = distinct !{!1296, !1283, !1297, !151}
!1297 = !DILocation(line: 717, column: 3, scope: !1282)
!1298 = !DILocation(line: 719, column: 3, scope: !1269)
!1299 = !DILocation(line: 720, column: 3, scope: !1269)
!1300 = !DILocation(line: 721, column: 1, scope: !1269)
!1301 = distinct !DISubprogram(name: "alloc_vec", scope: !3, file: !3, line: 726, type: !1302, scopeLine: 726, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1304)
!1302 = !DISubroutineType(types: !1303)
!1303 = !{!6, !24}
!1304 = !{!1305}
!1305 = !DILocalVariable(name: "n", arg: 1, scope: !1301, file: !3, line: 726, type: !24)
!1306 = !DILocation(line: 0, scope: !1301)
!1307 = !DILocation(line: 728, column: 26, scope: !1301)
!1308 = !DILocation(line: 728, column: 28, scope: !1301)
!1309 = !DILocation(line: 728, column: 19, scope: !1301)
!1310 = !DILocation(line: 728, column: 10, scope: !1301)
!1311 = !DILocation(line: 728, column: 3, scope: !1301)
!1312 = distinct !DISubprogram(name: "free_vec", scope: !3, file: !3, line: 734, type: !1313, scopeLine: 734, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1315)
!1313 = !DISubroutineType(types: !1314)
!1314 = !{null, !6}
!1315 = !{!1316}
!1316 = !DILocalVariable(name: "V", arg: 1, scope: !1312, file: !3, line: 734, type: !6)
!1317 = !DILocation(line: 0, scope: !1312)
!1318 = !DILocation(line: 736, column: 8, scope: !1312)
!1319 = !DILocation(line: 736, column: 3, scope: !1312)
!1320 = !DILocation(line: 737, column: 1, scope: !1312)
!1321 = distinct !DISubprogram(name: "init_matrix", scope: !3, file: !3, line: 743, type: !1322, scopeLine: 743, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1324)
!1322 = !DISubroutineType(types: !1323)
!1323 = !{null, !24, !6, !24}
!1324 = !{!1325, !1326, !1327, !1328, !1329}
!1325 = !DILocalVariable(name: "n", arg: 1, scope: !1321, file: !3, line: 743, type: !24)
!1326 = !DILocalVariable(name: "A", arg: 2, scope: !1321, file: !3, line: 743, type: !6)
!1327 = !DILocalVariable(name: "an", arg: 3, scope: !1321, file: !3, line: 743, type: !24)
!1328 = !DILocalVariable(name: "i", scope: !1321, file: !3, line: 745, type: !24)
!1329 = !DILocalVariable(name: "j", scope: !1321, file: !3, line: 745, type: !24)
!1330 = !DILocation(line: 0, scope: !1321)
!1331 = !DILocation(line: 747, column: 17, scope: !1332)
!1332 = distinct !DILexicalBlock(scope: !1333, file: !3, line: 747, column: 3)
!1333 = distinct !DILexicalBlock(scope: !1321, file: !3, line: 747, column: 3)
!1334 = !DILocation(line: 747, column: 3, scope: !1333)
!1335 = !DILocation(line: 748, column: 5, scope: !1336)
!1336 = distinct !DILexicalBlock(scope: !1332, file: !3, line: 748, column: 5)
!1337 = !DILocation(line: 82, column: 23, scope: !91, inlinedAt: !1338)
!1338 = distinct !DILocation(line: 749, column: 37, scope: !1339)
!1339 = distinct !DILexicalBlock(scope: !1336, file: !3, line: 748, column: 5)
!1340 = !DILocation(line: 82, column: 36, scope: !91, inlinedAt: !1338)
!1341 = !DILocation(line: 83, column: 22, scope: !91, inlinedAt: !1338)
!1342 = !DILocation(line: 83, column: 12, scope: !91, inlinedAt: !1338)
!1343 = !DILocation(line: 0, scope: !91, inlinedAt: !1338)
!1344 = !DILocation(line: 749, column: 28, scope: !1339)
!1345 = !DILocation(line: 749, column: 50, scope: !1339)
!1346 = !DILocation(line: 749, column: 7, scope: !1339)
!1347 = !DILocation(line: 749, column: 25, scope: !1339)
!1348 = !DILocation(line: 748, column: 24, scope: !1339)
!1349 = distinct !{!1349, !1335, !1350, !151}
!1350 = !DILocation(line: 749, column: 61, scope: !1336)
!1351 = !DILocation(line: 747, column: 22, scope: !1332)
!1352 = distinct !{!1352, !1334, !1353, !151}
!1353 = !DILocation(line: 749, column: 61, scope: !1333)
!1354 = !DILocation(line: 82, column: 12, scope: !91, inlinedAt: !1338)
!1355 = !DILocation(line: 750, column: 1, scope: !1321)
!1356 = distinct !DISubprogram(name: "compare_matrix", scope: !3, file: !3, line: 756, type: !1357, scopeLine: 756, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1359)
!1357 = !DISubroutineType(types: !1358)
!1358 = !{!24, !24, !6, !24, !6, !24}
!1359 = !{!1360, !1361, !1362, !1363, !1364, !1365, !1366, !1367}
!1360 = !DILocalVariable(name: "n", arg: 1, scope: !1356, file: !3, line: 756, type: !24)
!1361 = !DILocalVariable(name: "A", arg: 2, scope: !1356, file: !3, line: 756, type: !6)
!1362 = !DILocalVariable(name: "an", arg: 3, scope: !1356, file: !3, line: 756, type: !24)
!1363 = !DILocalVariable(name: "B", arg: 4, scope: !1356, file: !3, line: 756, type: !6)
!1364 = !DILocalVariable(name: "bn", arg: 5, scope: !1356, file: !3, line: 756, type: !24)
!1365 = !DILocalVariable(name: "i", scope: !1356, file: !3, line: 758, type: !24)
!1366 = !DILocalVariable(name: "j", scope: !1356, file: !3, line: 758, type: !24)
!1367 = !DILocalVariable(name: "c", scope: !1356, file: !3, line: 759, type: !7)
!1368 = !DILocation(line: 0, scope: !1356)
!1369 = !DILocation(line: 761, column: 17, scope: !1370)
!1370 = distinct !DILexicalBlock(scope: !1371, file: !3, line: 761, column: 3)
!1371 = distinct !DILexicalBlock(scope: !1356, file: !3, line: 761, column: 3)
!1372 = !DILocation(line: 761, column: 3, scope: !1371)
!1373 = !DILocation(line: 762, column: 5, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1375, file: !3, line: 762, column: 5)
!1375 = distinct !DILexicalBlock(scope: !1370, file: !3, line: 761, column: 27)
!1376 = !DILocation(line: 762, column: 19, scope: !1377)
!1377 = distinct !DILexicalBlock(scope: !1374, file: !3, line: 762, column: 5)
!1378 = distinct !{!1378, !1373, !1379, !151}
!1379 = !DILocation(line: 772, column: 5, scope: !1374)
!1380 = !DILocation(line: 764, column: 11, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1377, file: !3, line: 762, column: 29)
!1382 = !DILocation(line: 764, column: 31, scope: !1381)
!1383 = !DILocation(line: 764, column: 29, scope: !1381)
!1384 = !DILocation(line: 765, column: 13, scope: !1385)
!1385 = distinct !DILexicalBlock(scope: !1381, file: !3, line: 765, column: 11)
!1386 = !DILocation(line: 765, column: 11, scope: !1381)
!1387 = !DILocation(line: 768, column: 13, scope: !1381)
!1388 = !DILocation(line: 769, column: 13, scope: !1389)
!1389 = distinct !DILexicalBlock(scope: !1381, file: !3, line: 769, column: 11)
!1390 = !DILocation(line: 762, column: 24, scope: !1377)
!1391 = !DILocation(line: 769, column: 11, scope: !1381)
!1392 = !DILocation(line: 761, column: 22, scope: !1370)
!1393 = distinct !{!1393, !1372, !1394, !151}
!1394 = !DILocation(line: 773, column: 3, scope: !1371)
!1395 = !DILocation(line: 776, column: 1, scope: !1356)
!1396 = distinct !DISubprogram(name: "alloc_matrix", scope: !3, file: !3, line: 783, type: !1302, scopeLine: 783, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1397)
!1397 = !{!1398}
!1398 = !DILocalVariable(name: "n", arg: 1, scope: !1396, file: !3, line: 783, type: !24)
!1399 = !DILocation(line: 0, scope: !1396)
!1400 = !DILocation(line: 784, column: 28, scope: !1396)
!1401 = !DILocation(line: 784, column: 26, scope: !1396)
!1402 = !DILocation(line: 784, column: 32, scope: !1396)
!1403 = !DILocation(line: 784, column: 19, scope: !1396)
!1404 = !DILocation(line: 784, column: 10, scope: !1396)
!1405 = !DILocation(line: 784, column: 3, scope: !1396)
!1406 = distinct !DISubprogram(name: "free_matrix", scope: !3, file: !3, line: 791, type: !1313, scopeLine: 791, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1407)
!1407 = !{!1408}
!1408 = !DILocalVariable(name: "A", arg: 1, scope: !1406, file: !3, line: 791, type: !6)
!1409 = !DILocation(line: 0, scope: !1406)
!1410 = !DILocation(line: 792, column: 8, scope: !1406)
!1411 = !DILocation(line: 792, column: 3, scope: !1406)
!1412 = !DILocation(line: 793, column: 1, scope: !1406)
!1413 = distinct !DISubprogram(name: "usage", scope: !3, file: !3, line: 799, type: !92, scopeLine: 799, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1414)
!1414 = !{}
!1415 = !DILocation(line: 800, column: 11, scope: !1413)
!1416 = !{!1417, !1417, i64 0}
!1417 = !{!"any pointer", !51, i64 0}
!1418 = !DILocation(line: 800, column: 3, scope: !1413)
!1419 = !DILocation(line: 806, column: 3, scope: !1413)
!1420 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 812, type: !1421, scopeLine: 812, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1424)
!1421 = !DISubroutineType(types: !1422)
!1422 = !{!24, !24, !1423}
!1423 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!1424 = !{!1425, !1426, !1427, !1428, !1429, !1430, !1431, !1432, !1433, !1434, !1435, !1436, !1437, !1438, !1440, !1443, !1444, !1445, !1448, !1449, !1450}
!1425 = !DILocalVariable(name: "argc", arg: 1, scope: !1420, file: !3, line: 812, type: !24)
!1426 = !DILocalVariable(name: "argv", arg: 2, scope: !1420, file: !3, line: 812, type: !1423)
!1427 = !DILocalVariable(name: "A", scope: !1420, file: !3, line: 814, type: !6)
!1428 = !DILocalVariable(name: "B", scope: !1420, file: !3, line: 814, type: !6)
!1429 = !DILocalVariable(name: "C", scope: !1420, file: !3, line: 814, type: !6)
!1430 = !DILocalVariable(name: "verify", scope: !1420, file: !3, line: 815, type: !24)
!1431 = !DILocalVariable(name: "rand_check", scope: !1420, file: !3, line: 815, type: !24)
!1432 = !DILocalVariable(name: "benchmark", scope: !1420, file: !3, line: 815, type: !24)
!1433 = !DILocalVariable(name: "help", scope: !1420, file: !3, line: 815, type: !24)
!1434 = !DILocalVariable(name: "n", scope: !1420, file: !3, line: 815, type: !24)
!1435 = !DILocalVariable(name: "round", scope: !1420, file: !3, line: 815, type: !24)
!1436 = !DILocalVariable(name: "old_rand_check", scope: !1420, file: !3, line: 858, type: !24)
!1437 = !DILocalVariable(name: "old_verify", scope: !1420, file: !3, line: 859, type: !24)
!1438 = !DILocalVariable(name: "r", scope: !1439, file: !3, line: 860, type: !24)
!1439 = distinct !DILexicalBlock(scope: !1420, file: !3, line: 860, column: 3)
!1440 = !DILocalVariable(name: "t1", scope: !1441, file: !3, line: 863, type: !35)
!1441 = distinct !DILexicalBlock(scope: !1442, file: !3, line: 860, column: 30)
!1442 = distinct !DILexicalBlock(scope: !1439, file: !3, line: 860, column: 3)
!1443 = !DILocalVariable(name: "t2", scope: !1441, file: !3, line: 863, type: !35)
!1444 = !DILocalVariable(name: "runtime_ms", scope: !1441, file: !3, line: 869, type: !33)
!1445 = !DILocalVariable(name: "R", scope: !1446, file: !3, line: 873, type: !6)
!1446 = distinct !DILexicalBlock(scope: !1447, file: !3, line: 872, column: 20)
!1447 = distinct !DILexicalBlock(scope: !1441, file: !3, line: 872, column: 8)
!1448 = !DILocalVariable(name: "V1", scope: !1446, file: !3, line: 873, type: !6)
!1449 = !DILocalVariable(name: "V2", scope: !1446, file: !3, line: 873, type: !6)
!1450 = !DILocalVariable(name: "C2", scope: !1451, file: !3, line: 889, type: !6)
!1451 = distinct !DILexicalBlock(scope: !1452, file: !3, line: 887, column: 24)
!1452 = distinct !DILexicalBlock(scope: !1447, file: !3, line: 887, column: 16)
!1453 = !DILocation(line: 0, scope: !1420)
!1454 = !DILocation(line: 815, column: 3, scope: !1420)
!1455 = !DILocation(line: 818, column: 5, scope: !1420)
!1456 = !{!1457, !1457, i64 0}
!1457 = !{!"int", !51, i64 0}
!1458 = !DILocation(line: 819, column: 10, scope: !1420)
!1459 = !DILocation(line: 820, column: 14, scope: !1420)
!1460 = !DILocation(line: 821, column: 9, scope: !1420)
!1461 = !DILocation(line: 823, column: 3, scope: !1420)
!1462 = !DILocation(line: 826, column: 7, scope: !1463)
!1463 = distinct !DILexicalBlock(scope: !1420, file: !3, line: 826, column: 7)
!1464 = !DILocation(line: 826, column: 7, scope: !1420)
!1465 = !DILocation(line: 800, column: 11, scope: !1413, inlinedAt: !1466)
!1466 = distinct !DILocation(line: 826, column: 20, scope: !1463)
!1467 = !DILocation(line: 800, column: 3, scope: !1413, inlinedAt: !1466)
!1468 = !DILocation(line: 826, column: 13, scope: !1463)
!1469 = !DILocation(line: 828, column: 7, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1420, file: !3, line: 828, column: 7)
!1471 = !DILocation(line: 828, column: 7, scope: !1420)
!1472 = !DILocation(line: 842, column: 7, scope: !1473)
!1473 = distinct !DILexicalBlock(scope: !1420, file: !3, line: 842, column: 6)
!1474 = !DILocation(line: 831, column: 11, scope: !1475)
!1475 = distinct !DILexicalBlock(scope: !1476, file: !3, line: 829, column: 24)
!1476 = distinct !DILexicalBlock(scope: !1470, file: !3, line: 828, column: 18)
!1477 = !DILocation(line: 832, column: 9, scope: !1475)
!1478 = !DILocation(line: 834, column: 11, scope: !1475)
!1479 = !DILocation(line: 835, column: 9, scope: !1475)
!1480 = !DILocation(line: 837, column: 11, scope: !1475)
!1481 = !DILocation(line: 838, column: 9, scope: !1475)
!1482 = !DILocation(line: 842, column: 20, scope: !1473)
!1483 = !{i32 0, i32 33}
!1484 = !DILocation(line: 842, column: 25, scope: !1473)
!1485 = !DILocation(line: 843, column: 5, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1473, file: !3, line: 842, column: 43)
!1487 = !DILocation(line: 845, column: 5, scope: !1486)
!1488 = !DILocation(line: 849, column: 3, scope: !1420)
!1489 = !DILocation(line: 851, column: 20, scope: !1420)
!1490 = !DILocation(line: 0, scope: !1396, inlinedAt: !1491)
!1491 = distinct !DILocation(line: 851, column: 7, scope: !1420)
!1492 = !DILocation(line: 784, column: 28, scope: !1396, inlinedAt: !1491)
!1493 = !DILocation(line: 784, column: 26, scope: !1396, inlinedAt: !1491)
!1494 = !DILocation(line: 784, column: 32, scope: !1396, inlinedAt: !1491)
!1495 = !DILocation(line: 784, column: 19, scope: !1396, inlinedAt: !1491)
!1496 = !DILocation(line: 784, column: 10, scope: !1396, inlinedAt: !1491)
!1497 = !DILocation(line: 0, scope: !1396, inlinedAt: !1498)
!1498 = distinct !DILocation(line: 852, column: 7, scope: !1420)
!1499 = !DILocation(line: 784, column: 19, scope: !1396, inlinedAt: !1498)
!1500 = !DILocation(line: 784, column: 10, scope: !1396, inlinedAt: !1498)
!1501 = !DILocation(line: 0, scope: !1396, inlinedAt: !1502)
!1502 = distinct !DILocation(line: 853, column: 7, scope: !1420)
!1503 = !DILocation(line: 784, column: 19, scope: !1396, inlinedAt: !1502)
!1504 = !DILocation(line: 784, column: 10, scope: !1396, inlinedAt: !1502)
!1505 = !DILocation(line: 0, scope: !1321, inlinedAt: !1506)
!1506 = distinct !DILocation(line: 855, column: 3, scope: !1420)
!1507 = !DILocation(line: 747, column: 17, scope: !1332, inlinedAt: !1506)
!1508 = !DILocation(line: 747, column: 3, scope: !1333, inlinedAt: !1506)
!1509 = !DILocation(line: 748, column: 5, scope: !1336, inlinedAt: !1506)
!1510 = !DILocation(line: 82, column: 23, scope: !91, inlinedAt: !1511)
!1511 = distinct !DILocation(line: 749, column: 37, scope: !1339, inlinedAt: !1506)
!1512 = !DILocation(line: 82, column: 36, scope: !91, inlinedAt: !1511)
!1513 = !DILocation(line: 83, column: 22, scope: !91, inlinedAt: !1511)
!1514 = !DILocation(line: 83, column: 12, scope: !91, inlinedAt: !1511)
!1515 = !DILocation(line: 0, scope: !91, inlinedAt: !1511)
!1516 = !DILocation(line: 749, column: 28, scope: !1339, inlinedAt: !1506)
!1517 = !DILocation(line: 749, column: 50, scope: !1339, inlinedAt: !1506)
!1518 = !DILocation(line: 749, column: 7, scope: !1339, inlinedAt: !1506)
!1519 = !DILocation(line: 749, column: 25, scope: !1339, inlinedAt: !1506)
!1520 = !DILocation(line: 748, column: 24, scope: !1339, inlinedAt: !1506)
!1521 = distinct !{!1521, !1509, !1522, !151}
!1522 = !DILocation(line: 749, column: 61, scope: !1336, inlinedAt: !1506)
!1523 = !DILocation(line: 747, column: 22, scope: !1332, inlinedAt: !1506)
!1524 = distinct !{!1524, !1508, !1525, !151}
!1525 = !DILocation(line: 749, column: 61, scope: !1333, inlinedAt: !1506)
!1526 = !DILocation(line: 747, column: 3, scope: !1333, inlinedAt: !1527)
!1527 = distinct !DILocation(line: 856, column: 3, scope: !1420)
!1528 = !DILocation(line: 0, scope: !1321, inlinedAt: !1527)
!1529 = !DILocation(line: 748, column: 5, scope: !1336, inlinedAt: !1527)
!1530 = !DILocation(line: 82, column: 23, scope: !91, inlinedAt: !1531)
!1531 = distinct !DILocation(line: 749, column: 37, scope: !1339, inlinedAt: !1527)
!1532 = !DILocation(line: 82, column: 36, scope: !91, inlinedAt: !1531)
!1533 = !DILocation(line: 83, column: 22, scope: !91, inlinedAt: !1531)
!1534 = !DILocation(line: 83, column: 12, scope: !91, inlinedAt: !1531)
!1535 = !DILocation(line: 0, scope: !91, inlinedAt: !1531)
!1536 = !DILocation(line: 749, column: 28, scope: !1339, inlinedAt: !1527)
!1537 = !DILocation(line: 749, column: 50, scope: !1339, inlinedAt: !1527)
!1538 = !DILocation(line: 749, column: 7, scope: !1339, inlinedAt: !1527)
!1539 = !DILocation(line: 749, column: 25, scope: !1339, inlinedAt: !1527)
!1540 = !DILocation(line: 748, column: 24, scope: !1339, inlinedAt: !1527)
!1541 = distinct !{!1541, !1529, !1542, !151}
!1542 = !DILocation(line: 749, column: 61, scope: !1336, inlinedAt: !1527)
!1543 = !DILocation(line: 747, column: 22, scope: !1332, inlinedAt: !1527)
!1544 = !DILocation(line: 747, column: 17, scope: !1332, inlinedAt: !1527)
!1545 = distinct !{!1545, !1526, !1546, !151}
!1546 = !DILocation(line: 749, column: 61, scope: !1333, inlinedAt: !1527)
!1547 = !DILocation(line: 82, column: 12, scope: !91, inlinedAt: !1531)
!1548 = !DILocation(line: 858, column: 24, scope: !1420)
!1549 = !DILocation(line: 859, column: 20, scope: !1420)
!1550 = !DILocation(line: 0, scope: !1439)
!1551 = !DILocation(line: 860, column: 18, scope: !1442)
!1552 = !DILocation(line: 860, column: 17, scope: !1442)
!1553 = !DILocation(line: 860, column: 3, scope: !1439)
!1554 = !DILocation(line: 0, scope: !1406, inlinedAt: !1555)
!1555 = distinct !DILocation(line: 904, column: 3, scope: !1420)
!1556 = !DILocation(line: 792, column: 3, scope: !1406, inlinedAt: !1555)
!1557 = !DILocation(line: 0, scope: !1406, inlinedAt: !1558)
!1558 = distinct !DILocation(line: 905, column: 3, scope: !1420)
!1559 = !DILocation(line: 792, column: 3, scope: !1406, inlinedAt: !1558)
!1560 = !DILocation(line: 0, scope: !1406, inlinedAt: !1561)
!1561 = distinct !DILocation(line: 906, column: 3, scope: !1420)
!1562 = !DILocation(line: 792, column: 3, scope: !1406, inlinedAt: !1561)
!1563 = !DILocation(line: 861, column: 16, scope: !1441)
!1564 = !DILocation(line: 862, column: 12, scope: !1441)
!1565 = !DILocation(line: 863, column: 5, scope: !1441)
!1566 = !DILocation(line: 863, column: 20, scope: !1441)
!1567 = !DILocation(line: 863, column: 24, scope: !1441)
!1568 = !DILocation(line: 864, column: 5, scope: !1441)
!1569 = !DILocation(line: 866, column: 5, scope: !1441)
!1570 = !DILocation(line: 868, column: 5, scope: !1441)
!1571 = !DILocation(line: 0, scope: !30, inlinedAt: !1572)
!1572 = distinct !DILocation(line: 869, column: 38, scope: !1441)
!1573 = !DILocation(line: 44, column: 16, scope: !30, inlinedAt: !1572)
!1574 = !DILocation(line: 44, column: 43, scope: !30, inlinedAt: !1572)
!1575 = !DILocation(line: 0, scope: !30, inlinedAt: !1576)
!1576 = distinct !DILocation(line: 869, column: 50, scope: !1441)
!1577 = !DILocation(line: 44, column: 16, scope: !30, inlinedAt: !1576)
!1578 = !DILocation(line: 44, column: 43, scope: !30, inlinedAt: !1576)
!1579 = !DILocation(line: 44, column: 37, scope: !30, inlinedAt: !1572)
!1580 = !DILocation(line: 869, column: 49, scope: !1441)
!1581 = !DILocation(line: 869, column: 62, scope: !1441)
!1582 = !DILocation(line: 0, scope: !1441)
!1583 = !DILocation(line: 870, column: 31, scope: !1441)
!1584 = !DILocation(line: 870, column: 41, scope: !1441)
!1585 = !DILocation(line: 870, column: 5, scope: !1441)
!1586 = !DILocation(line: 872, column: 8, scope: !1447)
!1587 = !DILocation(line: 872, column: 8, scope: !1441)
!1588 = !DILocation(line: 874, column: 21, scope: !1446)
!1589 = !DILocation(line: 0, scope: !1301, inlinedAt: !1590)
!1590 = distinct !DILocation(line: 874, column: 11, scope: !1446)
!1591 = !DILocation(line: 728, column: 26, scope: !1301, inlinedAt: !1590)
!1592 = !DILocation(line: 728, column: 28, scope: !1301, inlinedAt: !1590)
!1593 = !DILocation(line: 728, column: 19, scope: !1301, inlinedAt: !1590)
!1594 = !DILocation(line: 728, column: 10, scope: !1301, inlinedAt: !1590)
!1595 = !DILocation(line: 0, scope: !1446)
!1596 = !DILocation(line: 0, scope: !1301, inlinedAt: !1597)
!1597 = distinct !DILocation(line: 875, column: 12, scope: !1446)
!1598 = !DILocation(line: 728, column: 19, scope: !1301, inlinedAt: !1597)
!1599 = !DILocation(line: 728, column: 10, scope: !1301, inlinedAt: !1597)
!1600 = !DILocation(line: 0, scope: !1301, inlinedAt: !1601)
!1601 = distinct !DILocation(line: 876, column: 12, scope: !1446)
!1602 = !DILocation(line: 728, column: 19, scope: !1301, inlinedAt: !1601)
!1603 = !DILocation(line: 728, column: 10, scope: !1301, inlinedAt: !1601)
!1604 = !DILocation(line: 878, column: 7, scope: !1446)
!1605 = !DILocation(line: 879, column: 7, scope: !1446)
!1606 = !DILocation(line: 880, column: 7, scope: !1446)
!1607 = !DILocation(line: 0, scope: !1269, inlinedAt: !1608)
!1608 = distinct !DILocation(line: 881, column: 20, scope: !1446)
!1609 = !DILocation(line: 706, column: 16, scope: !1281, inlinedAt: !1608)
!1610 = !DILocation(line: 706, column: 3, scope: !1282, inlinedAt: !1608)
!1611 = !DILocation(line: 707, column: 9, scope: !1285, inlinedAt: !1608)
!1612 = !DILocation(line: 707, column: 17, scope: !1285, inlinedAt: !1608)
!1613 = !DILocation(line: 707, column: 15, scope: !1285, inlinedAt: !1608)
!1614 = !DILocation(line: 708, column: 11, scope: !1289, inlinedAt: !1608)
!1615 = !DILocation(line: 708, column: 9, scope: !1285, inlinedAt: !1608)
!1616 = !DILocation(line: 714, column: 11, scope: !1292, inlinedAt: !1608)
!1617 = !DILocation(line: 714, column: 9, scope: !1285, inlinedAt: !1608)
!1618 = !DILocation(line: 711, column: 9, scope: !1285, inlinedAt: !1608)
!1619 = !DILocation(line: 706, column: 21, scope: !1281, inlinedAt: !1608)
!1620 = distinct !{!1620, !1610, !1621, !151}
!1621 = !DILocation(line: 717, column: 3, scope: !1282, inlinedAt: !1608)
!1622 = !DILocation(line: 719, column: 3, scope: !1269, inlinedAt: !1608)
!1623 = !DILocation(line: 720, column: 3, scope: !1269, inlinedAt: !1608)
!1624 = !DILocation(line: 881, column: 18, scope: !1446)
!1625 = !DILocation(line: 0, scope: !1312, inlinedAt: !1626)
!1626 = distinct !DILocation(line: 883, column: 7, scope: !1446)
!1627 = !DILocation(line: 736, column: 3, scope: !1312, inlinedAt: !1626)
!1628 = !DILocation(line: 0, scope: !1312, inlinedAt: !1629)
!1629 = distinct !DILocation(line: 884, column: 7, scope: !1446)
!1630 = !DILocation(line: 736, column: 3, scope: !1312, inlinedAt: !1629)
!1631 = !DILocation(line: 0, scope: !1312, inlinedAt: !1632)
!1632 = distinct !DILocation(line: 885, column: 7, scope: !1446)
!1633 = !DILocation(line: 736, column: 3, scope: !1312, inlinedAt: !1632)
!1634 = !DILocation(line: 887, column: 5, scope: !1446)
!1635 = !DILocation(line: 887, column: 16, scope: !1452)
!1636 = !DILocation(line: 887, column: 16, scope: !1447)
!1637 = !DILocation(line: 888, column: 15, scope: !1451)
!1638 = !DILocation(line: 888, column: 7, scope: !1451)
!1639 = !DILocation(line: 889, column: 31, scope: !1451)
!1640 = !DILocation(line: 0, scope: !1396, inlinedAt: !1641)
!1641 = distinct !DILocation(line: 889, column: 18, scope: !1451)
!1642 = !DILocation(line: 784, column: 28, scope: !1396, inlinedAt: !1641)
!1643 = !DILocation(line: 784, column: 26, scope: !1396, inlinedAt: !1641)
!1644 = !DILocation(line: 784, column: 32, scope: !1396, inlinedAt: !1641)
!1645 = !DILocation(line: 784, column: 19, scope: !1396, inlinedAt: !1641)
!1646 = !DILocation(line: 784, column: 10, scope: !1396, inlinedAt: !1641)
!1647 = !DILocation(line: 0, scope: !1451)
!1648 = !DILocation(line: 0, scope: !202, inlinedAt: !1649)
!1649 = distinct !DILocation(line: 890, column: 7, scope: !1451)
!1650 = !DILocation(line: 137, column: 17, scope: !219, inlinedAt: !1649)
!1651 = !DILocation(line: 137, column: 3, scope: !220, inlinedAt: !1649)
!1652 = !DILocation(line: 138, column: 5, scope: !223, inlinedAt: !1649)
!1653 = !DILocation(line: 140, column: 7, scope: !225, inlinedAt: !1649)
!1654 = !DILocation(line: 141, column: 14, scope: !229, inlinedAt: !1649)
!1655 = !DILocation(line: 141, column: 34, scope: !229, inlinedAt: !1649)
!1656 = !DILocation(line: 141, column: 11, scope: !229, inlinedAt: !1649)
!1657 = !DILocation(line: 140, column: 26, scope: !229, inlinedAt: !1649)
!1658 = distinct !{!1658, !1653, !1659, !151}
!1659 = !DILocation(line: 141, column: 34, scope: !225, inlinedAt: !1649)
!1660 = !DILocation(line: 143, column: 7, scope: !226, inlinedAt: !1649)
!1661 = !DILocation(line: 143, column: 25, scope: !226, inlinedAt: !1649)
!1662 = !DILocation(line: 138, column: 24, scope: !227, inlinedAt: !1649)
!1663 = !DILocation(line: 138, column: 19, scope: !227, inlinedAt: !1649)
!1664 = distinct !{!1664, !1652, !1665, !151}
!1665 = !DILocation(line: 144, column: 5, scope: !223, inlinedAt: !1649)
!1666 = !DILocation(line: 137, column: 22, scope: !219, inlinedAt: !1649)
!1667 = distinct !{!1667, !1651, !1668, !151}
!1668 = !DILocation(line: 144, column: 5, scope: !220, inlinedAt: !1649)
!1669 = !DILocation(line: 0, scope: !1356, inlinedAt: !1670)
!1670 = distinct !DILocation(line: 891, column: 16, scope: !1451)
!1671 = !DILocation(line: 762, column: 5, scope: !1374, inlinedAt: !1670)
!1672 = !DILocation(line: 762, column: 19, scope: !1377, inlinedAt: !1670)
!1673 = distinct !{!1673, !1671, !1674, !151}
!1674 = !DILocation(line: 772, column: 5, scope: !1374, inlinedAt: !1670)
!1675 = !DILocation(line: 764, column: 11, scope: !1381, inlinedAt: !1670)
!1676 = !DILocation(line: 764, column: 31, scope: !1381, inlinedAt: !1670)
!1677 = !DILocation(line: 764, column: 29, scope: !1381, inlinedAt: !1670)
!1678 = !DILocation(line: 765, column: 13, scope: !1385, inlinedAt: !1670)
!1679 = !DILocation(line: 765, column: 11, scope: !1381, inlinedAt: !1670)
!1680 = !DILocation(line: 768, column: 13, scope: !1381, inlinedAt: !1670)
!1681 = !DILocation(line: 769, column: 13, scope: !1389, inlinedAt: !1670)
!1682 = !DILocation(line: 762, column: 24, scope: !1377, inlinedAt: !1670)
!1683 = !DILocation(line: 769, column: 11, scope: !1381, inlinedAt: !1670)
!1684 = !DILocation(line: 761, column: 22, scope: !1370, inlinedAt: !1670)
!1685 = !DILocation(line: 761, column: 17, scope: !1370, inlinedAt: !1670)
!1686 = !DILocation(line: 761, column: 3, scope: !1371, inlinedAt: !1670)
!1687 = distinct !{!1687, !1686, !1688, !151}
!1688 = !DILocation(line: 773, column: 3, scope: !1371, inlinedAt: !1670)
!1689 = !DILocation(line: 891, column: 14, scope: !1451)
!1690 = !DILocation(line: 0, scope: !1406, inlinedAt: !1691)
!1691 = distinct !DILocation(line: 892, column: 7, scope: !1451)
!1692 = !DILocation(line: 792, column: 3, scope: !1406, inlinedAt: !1691)
!1693 = !DILocation(line: 895, column: 8, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1441, file: !3, line: 895, column: 8)
!1695 = !DILocation(line: 893, column: 5, scope: !1451)
!1696 = !DILocation(line: 895, column: 19, scope: !1694)
!1697 = !DILocation(line: 0, scope: !1694)
!1698 = !DILocation(line: 896, column: 7, scope: !1699)
!1699 = distinct !DILexicalBlock(scope: !1694, file: !3, line: 895, column: 30)
!1700 = !DILocation(line: 898, column: 5, scope: !1699)
!1701 = !DILocation(line: 899, column: 7, scope: !1702)
!1702 = distinct !DILexicalBlock(scope: !1694, file: !3, line: 898, column: 12)
!1703 = !DILocation(line: 900, column: 15, scope: !1702)
!1704 = !DILocation(line: 900, column: 46, scope: !1702)
!1705 = !DILocation(line: 900, column: 7, scope: !1702)
!1706 = !DILocation(line: 902, column: 3, scope: !1442)
!1707 = !DILocation(line: 860, column: 26, scope: !1442)
!1708 = distinct !{!1708, !1553, !1709, !151}
!1709 = !DILocation(line: 902, column: 3, scope: !1439)
!1710 = !DILocation(line: 909, column: 1, scope: !1420)
!1711 = !DISubprogram(name: "get_options", scope: !1712, file: !1712, line: 20, type: !1713, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1414)
!1712 = !DIFile(filename: "./getoptions.h", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "bf060e74fdb298e4a85522e522cd3a24")
!1713 = !DISubroutineType(types: !1714)
!1714 = !{null, !24, !1423, !1715, !1716, null}
!1715 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!1716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!1717 = !DISubprogram(name: "gettimeofday", scope: !1718, file: !1718, line: 72, type: !1719, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1414)
!1718 = !DIFile(filename: "/usr/include/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b3cbcac52b1954fa045aa74bfcd1a38")
!1719 = !DISubroutineType(types: !1720)
!1720 = !{!24, !1721, !1722}
!1721 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !34)
!1722 = !DIDerivedType(tag: DW_TAG_typedef, name: "__timezone_ptr_t", file: !1718, line: 62, baseType: !1723)
!1723 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1724)
!1724 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1725, size: 64)
!1725 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !1718, line: 56, size: 64, elements: !1726)
!1726 = !{!1727, !1728}
!1727 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !1725, file: !1718, line: 58, baseType: !24, size: 32)
!1728 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !1725, file: !1718, line: 59, baseType: !24, size: 32, offset: 32)
