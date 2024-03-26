; ModuleID = './lu.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@nBlocks = internal unnamed_addr global i32 0, align 4, !dbg !0
@.str.5 = private unnamed_addr constant [20 x i8] c"Default: lu -n %d\0A\0A\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"-n\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"-o\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@.str.9 = private unnamed_addr constant [11 x i8] c"-benchmark\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"-h\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"-r\00", align 1
@specifiers = dso_local global [7 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* null], align 16, !dbg !15
@opt_types = dso_local global [7 x i32] [i32 1, i32 4, i32 4, i32 6, i32 4, i32 1, i32 0], align 16, !dbg !23
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.12 = private unnamed_addr constant [20 x i8] c"Allocation failed.\0A\00", align 1
@.str.13 = private unnamed_addr constant [15 x i8] c"PBBS-time: %f\0A\00", align 1
@.str.15 = private unnamed_addr constant [19 x i8] c"\0ACilk Example: lu\0A\00", align 1
@.str.16 = private unnamed_addr constant [33 x i8] c"Options: (n x n matrix) n = %d\0A\0A\00", align 1
@.str.17 = private unnamed_addr constant [7 x i8] c" %6.4f\00", align 1
@str = private unnamed_addr constant [22 x i8] c"\0AUsage: lu <options>\0A\00", align 1
@str.20 = private unnamed_addr constant [9 x i8] c"Options:\00", align 1
@str.21 = private unnamed_addr constant [70 x i8] c"  -n N : Decompose NxN matrix, where N is at least 16 and power of 2.\00", align 1
@str.22 = private unnamed_addr constant [50 x i8] c"  -o   : Print matrix before and after decompose.\00", align 1
@str.23 = private unnamed_addr constant [24 x i8] c"  -c   : Check result.\0A\00", align 1
@str.24 = private unnamed_addr constant [14 x i8] c"WRONG ANSWER!\00", align 1
@str.25 = private unnamed_addr constant [21 x i8] c"Now check result ...\00", align 1

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i64 @todval(%struct.timeval* nocapture noundef readonly %tp) local_unnamed_addr #0 !dbg !32 {
entry:
  call void @llvm.dbg.value(metadata %struct.timeval* %tp, metadata !47, metadata !DIExpression()), !dbg !48
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 0, !dbg !49
  %0 = load i64, i64* %tv_sec, align 8, !dbg !49, !tbaa !50
  %mul1 = mul i64 %0, 1000000, !dbg !55
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 1, !dbg !56
  %1 = load i64, i64* %tv_usec, align 8, !dbg !56, !tbaa !57
  %add = add nsw i64 %mul1, %1, !dbg !58
  ret i64 %add, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable writeonly
define dso_local void @startup_cilk() local_unnamed_addr #2 !dbg !60 {
entry:
  %g = alloca double, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !72
  %g.0.g.0.g.0..sroa_cast = bitcast double* %g to i8*, !dbg !73
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !73
  call void @llvm.dbg.value(metadata double 2.000000e+00, metadata !64, metadata !DIExpression()), !dbg !72
  store double 2.000000e+00, double* %g, align 8, !dbg !74, !tbaa !75
  call void @llvm.dbg.value(metadata i32 0, metadata !65, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.value(metadata i32 1000, metadata !67, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.value(metadata i32 0, metadata !68, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.value(metadata i32 1000, metadata !69, metadata !DIExpression()), !dbg !77
  br label %pfor.cond, !dbg !78

pfor.cond:                                        ; preds = %pfor.inc, %entry
  %__begin.0 = phi i32 [ 0, %entry ], [ %inc, %pfor.inc ], !dbg !77
  call void @llvm.dbg.value(metadata i32 %__begin.0, metadata !68, metadata !DIExpression()), !dbg !77
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc, !dbg !79

pfor.body.entry:                                  ; preds = %pfor.cond
  call void @llvm.dbg.value(metadata !DIArgList(i32 0, i32 %__begin.0), metadata !70, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !80
  %g.0.g.0.g.0. = load double, double* %g, align 8, !dbg !81, !tbaa !75
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !64, metadata !DIExpression()), !dbg !72
  %call = tail call double @sin(double noundef %g.0.g.0.g.0.) #17, !dbg !83
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !64, metadata !DIExpression()), !dbg !72
  %div3 = fdiv double %g.0.g.0.g.0., %call, !dbg !84
  call void @llvm.dbg.value(metadata double %div3, metadata !64, metadata !DIExpression()), !dbg !72
  store double %div3, double* %g, align 8, !dbg !84, !tbaa !75
  reattach within %syncreg, label %pfor.inc, !dbg !85

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %inc = add nuw nsw i32 %__begin.0, 1, !dbg !86
  call void @llvm.dbg.value(metadata i32 %inc, metadata !68, metadata !DIExpression()), !dbg !77
  %exitcond.not = icmp eq i32 %inc, 1000, !dbg !87
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !dbg !88, !llvm.loop !89

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %cleanup, !dbg !88

cleanup:                                          ; preds = %pfor.cond.cleanup
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !92
  ret void, !dbg !92
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare token @llvm.syncregion.start() #4

; Function Attrs: mustprogress nofree nounwind willreturn writeonly
declare dso_local double @sin(double noundef) local_unnamed_addr #5

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define dso_local void @schur([16 x [16 x double]]* noundef %M, [16 x [16 x double]]* noundef %V, [16 x [16 x double]]* noundef %W, i32 noundef %nb) local_unnamed_addr #6 !dbg !93 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !114
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %M, metadata !97, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %V, metadata !98, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %W, metadata !99, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata i32 %nb, metadata !100, metadata !DIExpression()), !dbg !114
  %cmp = icmp eq i32 %nb, 1, !dbg !115
  br i1 %cmp, label %for.cond1.preheader.i, label %if.end, !dbg !117

for.cond1.preheader.i:                            ; preds = %for.inc12.i, %entry
  %indvars.iv26.i = phi i64 [ %indvars.iv.next27.i, %for.inc12.i ], [ 0, %entry ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv26.i, metadata !118, metadata !DIExpression()) #17, !dbg !130
  call void @llvm.dbg.value(metadata i32 0, metadata !129, metadata !DIExpression()) #17, !dbg !130
  %arrayidx2.i.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 15
  %.pre.i = load double, double* %arrayidx2.i.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.1.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 14
  %.pre30.i = load double, double* %arrayidx2.i.1.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.2.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 13
  %.pre31.i = load double, double* %arrayidx2.i.2.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.3.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 12
  %.pre32.i = load double, double* %arrayidx2.i.3.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.4.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 11
  %.pre33.i = load double, double* %arrayidx2.i.4.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.5.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 10
  %.pre34.i = load double, double* %arrayidx2.i.5.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.6.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 9
  %.pre35.i = load double, double* %arrayidx2.i.6.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.7.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 8
  %.pre36.i = load double, double* %arrayidx2.i.7.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.8.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 7
  %.pre37.i = load double, double* %arrayidx2.i.8.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.9.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 6
  %.pre38.i = load double, double* %arrayidx2.i.9.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.10.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 5
  %.pre39.i = load double, double* %arrayidx2.i.10.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.11.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 4
  %.pre40.i = load double, double* %arrayidx2.i.11.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.12.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 3
  %.pre41.i = load double, double* %arrayidx2.i.12.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.13.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 2
  %.pre42.i = load double, double* %arrayidx2.i.13.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.14.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 1
  %.pre43.i = load double, double* %arrayidx2.i.14.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  %arrayidx2.i.15.phi.trans.insert.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv26.i, i64 0
  %.pre44.i = load double, double* %arrayidx2.i.15.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  br label %for.body3.i, !dbg !150

for.body3.i:                                      ; preds = %for.body3.i, %for.cond1.preheader.i
  %0 = phi double [ %.pre44.i, %for.cond1.preheader.i ], [ %48, %for.body3.i ], !dbg !133
  %1 = phi double [ %.pre43.i, %for.cond1.preheader.i ], [ %46, %for.body3.i ], !dbg !133
  %2 = phi double [ %.pre42.i, %for.cond1.preheader.i ], [ %44, %for.body3.i ], !dbg !133
  %3 = phi double [ %.pre41.i, %for.cond1.preheader.i ], [ %42, %for.body3.i ], !dbg !133
  %4 = phi double [ %.pre40.i, %for.cond1.preheader.i ], [ %40, %for.body3.i ], !dbg !133
  %5 = phi double [ %.pre39.i, %for.cond1.preheader.i ], [ %38, %for.body3.i ], !dbg !133
  %6 = phi double [ %.pre38.i, %for.cond1.preheader.i ], [ %36, %for.body3.i ], !dbg !133
  %7 = phi double [ %.pre37.i, %for.cond1.preheader.i ], [ %34, %for.body3.i ], !dbg !133
  %8 = phi double [ %.pre36.i, %for.cond1.preheader.i ], [ %32, %for.body3.i ], !dbg !133
  %9 = phi double [ %.pre35.i, %for.cond1.preheader.i ], [ %30, %for.body3.i ], !dbg !133
  %10 = phi double [ %.pre34.i, %for.cond1.preheader.i ], [ %28, %for.body3.i ], !dbg !133
  %11 = phi double [ %.pre33.i, %for.cond1.preheader.i ], [ %26, %for.body3.i ], !dbg !133
  %12 = phi double [ %.pre32.i, %for.cond1.preheader.i ], [ %24, %for.body3.i ], !dbg !133
  %13 = phi double [ %.pre31.i, %for.cond1.preheader.i ], [ %22, %for.body3.i ], !dbg !133
  %14 = phi double [ %.pre30.i, %for.cond1.preheader.i ], [ %20, %for.body3.i ], !dbg !133
  %15 = phi double [ %.pre.i, %for.cond1.preheader.i ], [ %18, %for.body3.i ], !dbg !133
  %indvars.iv.i = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i, %for.body3.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !129, metadata !DIExpression()) #17, !dbg !130
  %arrayidx5.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %V, i64 0, i64 %indvars.iv26.i, i64 %indvars.iv.i, !dbg !151
  %16 = load double, double* %arrayidx5.i, align 8, !dbg !151, !tbaa !75
  call void @llvm.dbg.value(metadata double %16, metadata !141, metadata !DIExpression()) #17, !dbg !152
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %W, i64 %indvars.iv.i), metadata !142, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %M, i64 %indvars.iv26.i), metadata !143, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i32 16, metadata !144, metadata !DIExpression()) #17, !dbg !152
  call void @llvm.dbg.value(metadata i32 16, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i32 16, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i32 16, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %neg.i.i = fneg double %16
  %arrayidx.i.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 15, !dbg !153
  %17 = load double, double* %arrayidx.i.i, align 8, !dbg !153, !tbaa !75
  %18 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %17, double %15) #17, !dbg !133
  store double %18, double* %arrayidx2.i.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 15, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 15, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.1.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 14, !dbg !153
  %19 = load double, double* %arrayidx.i.1.i, align 8, !dbg !153, !tbaa !75
  %20 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %19, double %14) #17, !dbg !133
  store double %20, double* %arrayidx2.i.1.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 14, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 14, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.2.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 13, !dbg !153
  %21 = load double, double* %arrayidx.i.2.i, align 8, !dbg !153, !tbaa !75
  %22 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %21, double %13) #17, !dbg !133
  store double %22, double* %arrayidx2.i.2.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 13, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 13, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.3.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 12, !dbg !153
  %23 = load double, double* %arrayidx.i.3.i, align 8, !dbg !153, !tbaa !75
  %24 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %23, double %12) #17, !dbg !133
  store double %24, double* %arrayidx2.i.3.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 12, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 12, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.4.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 11, !dbg !153
  %25 = load double, double* %arrayidx.i.4.i, align 8, !dbg !153, !tbaa !75
  %26 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %25, double %11) #17, !dbg !133
  store double %26, double* %arrayidx2.i.4.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 11, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 11, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.5.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 10, !dbg !153
  %27 = load double, double* %arrayidx.i.5.i, align 8, !dbg !153, !tbaa !75
  %28 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %27, double %10) #17, !dbg !133
  store double %28, double* %arrayidx2.i.5.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 10, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 10, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.6.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 9, !dbg !153
  %29 = load double, double* %arrayidx.i.6.i, align 8, !dbg !153, !tbaa !75
  %30 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %29, double %9) #17, !dbg !133
  store double %30, double* %arrayidx2.i.6.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 9, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 9, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.7.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 8, !dbg !153
  %31 = load double, double* %arrayidx.i.7.i, align 8, !dbg !153, !tbaa !75
  %32 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %31, double %8) #17, !dbg !133
  store double %32, double* %arrayidx2.i.7.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 8, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 8, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.8.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 7, !dbg !153
  %33 = load double, double* %arrayidx.i.8.i, align 8, !dbg !153, !tbaa !75
  %34 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %33, double %7) #17, !dbg !133
  store double %34, double* %arrayidx2.i.8.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 7, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 7, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.9.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 6, !dbg !153
  %35 = load double, double* %arrayidx.i.9.i, align 8, !dbg !153, !tbaa !75
  %36 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %35, double %6) #17, !dbg !133
  store double %36, double* %arrayidx2.i.9.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 6, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 6, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.10.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 5, !dbg !153
  %37 = load double, double* %arrayidx.i.10.i, align 8, !dbg !153, !tbaa !75
  %38 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %37, double %5) #17, !dbg !133
  store double %38, double* %arrayidx2.i.10.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 5, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 5, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.11.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 4, !dbg !153
  %39 = load double, double* %arrayidx.i.11.i, align 8, !dbg !153, !tbaa !75
  %40 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %39, double %4) #17, !dbg !133
  store double %40, double* %arrayidx2.i.11.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 4, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 4, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.12.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 3, !dbg !153
  %41 = load double, double* %arrayidx.i.12.i, align 8, !dbg !153, !tbaa !75
  %42 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %41, double %3) #17, !dbg !133
  store double %42, double* %arrayidx2.i.12.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 3, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 3, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.13.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 2, !dbg !153
  %43 = load double, double* %arrayidx.i.13.i, align 8, !dbg !153, !tbaa !75
  %44 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %43, double %2) #17, !dbg !133
  store double %44, double* %arrayidx2.i.13.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 2, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 2, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.14.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 1, !dbg !153
  %45 = load double, double* %arrayidx.i.14.i, align 8, !dbg !153, !tbaa !75
  %46 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %45, double %1) #17, !dbg !133
  store double %46, double* %arrayidx2.i.14.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 1, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 1, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %arrayidx.i.15.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 0, i64 %indvars.iv.i, i64 0, !dbg !153
  %47 = load double, double* %arrayidx.i.15.i, align 8, !dbg !153, !tbaa !75
  %48 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %47, double %0) #17, !dbg !133
  store double %48, double* %arrayidx2.i.15.phi.trans.insert.i, align 8, !dbg !133, !tbaa !75
  call void @llvm.dbg.value(metadata i64 0, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  call void @llvm.dbg.value(metadata i64 0, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !152
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !154
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !129, metadata !DIExpression()) #17, !dbg !130
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 16, !dbg !155
  br i1 %exitcond.not.i, label %for.inc12.i, label %for.body3.i, !dbg !150, !llvm.loop !156

for.inc12.i:                                      ; preds = %for.body3.i
  %indvars.iv.next27.i = add nuw nsw i64 %indvars.iv26.i, 1, !dbg !159
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next27.i, metadata !118, metadata !DIExpression()) #17, !dbg !130
  %exitcond29.not.i = icmp eq i64 %indvars.iv.next27.i, 16, !dbg !160
  br i1 %exitcond29.not.i, label %cleanup, label %for.cond1.preheader.i, !dbg !161, !llvm.loop !162

if.end:                                           ; preds = %entry
  %div = sdiv i32 %nb, 2, !dbg !164
  call void @llvm.dbg.value(metadata i32 %div, metadata !113, metadata !DIExpression()), !dbg !114
  %49 = load i32, i32* @nBlocks, align 4, !dbg !165, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %M, metadata !101, metadata !DIExpression()), !dbg !114
  %idxprom5 = sext i32 %div to i64, !dbg !168
  %arrayidx6 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 %idxprom5, !dbg !168
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx6, metadata !102, metadata !DIExpression()), !dbg !114
  %mul7 = mul nsw i32 %49, %div, !dbg !169
  %idxprom9 = sext i32 %mul7 to i64, !dbg !169
  %arrayidx10 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 %idxprom9, !dbg !169
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx10, metadata !103, metadata !DIExpression()), !dbg !114
  %add12 = add nsw i32 %mul7, %div, !dbg !170
  %idxprom13 = sext i32 %add12 to i64, !dbg !170
  %arrayidx14 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 %idxprom13, !dbg !170
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx14, metadata !104, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %V, metadata !105, metadata !DIExpression()), !dbg !114
  %arrayidx22 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %V, i64 %idxprom5, !dbg !171
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx22, metadata !106, metadata !DIExpression()), !dbg !114
  %arrayidx26 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %V, i64 %idxprom9, !dbg !172
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx26, metadata !107, metadata !DIExpression()), !dbg !114
  %arrayidx30 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %V, i64 %idxprom13, !dbg !173
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx30, metadata !108, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %W, metadata !109, metadata !DIExpression()), !dbg !114
  %arrayidx38 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 %idxprom5, !dbg !174
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx38, metadata !110, metadata !DIExpression()), !dbg !114
  %arrayidx42 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 %idxprom9, !dbg !175
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx42, metadata !111, metadata !DIExpression()), !dbg !114
  %arrayidx46 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %W, i64 %idxprom13, !dbg !176
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx46, metadata !112, metadata !DIExpression()), !dbg !114
  detach within %syncreg, label %det.achd, label %det.cont.tf, !dbg !177

det.achd:                                         ; preds = %if.end
  tail call void @schur([16 x [16 x double]]* noundef %M, [16 x [16 x double]]* noundef %V, [16 x [16 x double]]* noundef %W, i32 noundef %div), !dbg !177
  reattach within %syncreg, label %det.cont.tf, !dbg !177

det.cont.tf:                                      ; preds = %det.achd, %if.end
  detach within %syncreg, label %det.achd47, label %det.cont48.tf, !dbg !178

det.achd47:                                       ; preds = %det.cont.tf
  tail call void @schur([16 x [16 x double]]* noundef %arrayidx6, [16 x [16 x double]]* noundef %V, [16 x [16 x double]]* noundef %arrayidx38, i32 noundef %div), !dbg !178
  reattach within %syncreg, label %det.cont48.tf, !dbg !178

det.cont48.tf:                                    ; preds = %det.achd47, %det.cont.tf
  detach within %syncreg, label %det.achd49, label %det.cont50, !dbg !179

det.achd49:                                       ; preds = %det.cont48.tf
  tail call void @schur([16 x [16 x double]]* noundef %arrayidx10, [16 x [16 x double]]* noundef %arrayidx26, [16 x [16 x double]]* noundef %W, i32 noundef %div), !dbg !179
  reattach within %syncreg, label %det.cont50, !dbg !179

det.cont50:                                       ; preds = %det.achd49, %det.cont48.tf
  tail call void @schur([16 x [16 x double]]* noundef %arrayidx14, [16 x [16 x double]]* noundef %arrayidx26, [16 x [16 x double]]* noundef %arrayidx38, i32 noundef %div), !dbg !180
  sync within %syncreg, label %sync.continue.tf, !dbg !181

sync.continue.tf:                                 ; preds = %det.cont50
  detach within %syncreg, label %det.achd51, label %det.cont52.tf, !dbg !182

det.achd51:                                       ; preds = %sync.continue.tf
  tail call void @schur([16 x [16 x double]]* noundef %M, [16 x [16 x double]]* noundef %arrayidx22, [16 x [16 x double]]* noundef %arrayidx42, i32 noundef %div), !dbg !182
  reattach within %syncreg, label %det.cont52.tf, !dbg !182

det.cont52.tf:                                    ; preds = %det.achd51, %sync.continue.tf
  detach within %syncreg, label %det.achd53, label %det.cont54.tf, !dbg !183

det.achd53:                                       ; preds = %det.cont52.tf
  tail call void @schur([16 x [16 x double]]* noundef %arrayidx6, [16 x [16 x double]]* noundef %arrayidx22, [16 x [16 x double]]* noundef %arrayidx46, i32 noundef %div), !dbg !183
  reattach within %syncreg, label %det.cont54.tf, !dbg !183

det.cont54.tf:                                    ; preds = %det.achd53, %det.cont52.tf
  detach within %syncreg, label %det.achd55, label %det.cont56, !dbg !184

det.achd55:                                       ; preds = %det.cont54.tf
  tail call void @schur([16 x [16 x double]]* noundef %arrayidx10, [16 x [16 x double]]* noundef %arrayidx30, [16 x [16 x double]]* noundef %arrayidx42, i32 noundef %div), !dbg !184
  reattach within %syncreg, label %det.cont56, !dbg !184

det.cont56:                                       ; preds = %det.achd55, %det.cont54.tf
  tail call void @schur([16 x [16 x double]]* noundef %arrayidx14, [16 x [16 x double]]* noundef %arrayidx30, [16 x [16 x double]]* noundef %arrayidx46, i32 noundef %div), !dbg !185
  sync within %syncreg, label %cleanup, !dbg !186

cleanup:                                          ; preds = %det.cont56, %for.inc12.i
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @aux_lower_solve([16 x [16 x double]]* noundef %Ma, [16 x [16 x double]]* noundef %Mb, [16 x [16 x double]]* noundef %L, i32 noundef %nb) local_unnamed_addr #7 !dbg !188 {
entry:
  %syncreg.i = tail call token @llvm.syncregion.start(), !dbg !198
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Ma, metadata !190, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Mb, metadata !191, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %L, metadata !192, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata i32 %nb, metadata !193, metadata !DIExpression()), !dbg !212
  %0 = load i32, i32* @nBlocks, align 4, !dbg !213, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %L, metadata !194, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %L, i32 %nb), metadata !195, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !212
  %mul5 = mul nsw i32 %0, %nb, !dbg !214
  %idxprom7 = sext i32 %mul5 to i64, !dbg !214
  %arrayidx8 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %L, i64 %idxprom7, !dbg !214
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx8, metadata !196, metadata !DIExpression()), !dbg !212
  %add10 = add nsw i32 %mul5, %nb, !dbg !215
  %idxprom11 = sext i32 %add10 to i64, !dbg !215
  %arrayidx12 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %L, i64 %idxprom11, !dbg !215
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx12, metadata !197, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Ma, metadata !203, metadata !DIExpression()) #17, !dbg !198
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %L, metadata !204, metadata !DIExpression()) #17, !dbg !198
  call void @llvm.dbg.value(metadata i32 %nb, metadata !205, metadata !DIExpression()) #17, !dbg !198
  %cmp.i = icmp eq i32 %nb, 1, !dbg !216
  br i1 %cmp.i, label %if.then.i32, label %if.end.i, !dbg !218

if.end.i:                                         ; preds = %entry
  %div.i = sdiv i32 %nb, 2, !dbg !219
  call void @llvm.dbg.value(metadata i32 %div.i, metadata !210, metadata !DIExpression()) #17, !dbg !198
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Ma, metadata !206, metadata !DIExpression()) #17, !dbg !198
  %idxprom4.i = sext i32 %div.i to i64, !dbg !220
  %arrayidx5.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Ma, i64 %idxprom4.i, !dbg !220
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx5.i, metadata !207, metadata !DIExpression()) #17, !dbg !198
  %mul6.i = mul nsw i32 %0, %div.i, !dbg !221
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Ma, i32 %mul6.i), metadata !208, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !198
  %add11.i = add nsw i32 %mul6.i, %div.i, !dbg !222
  %idxprom12.i = sext i32 %add11.i to i64, !dbg !222
  %arrayidx13.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Ma, i64 %idxprom12.i, !dbg !222
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx13.i, metadata !209, metadata !DIExpression()) #17, !dbg !198
  detach within %syncreg.i, label %det.achd.i, label %det.cont.i, !dbg !223

det.achd.i:                                       ; preds = %if.end.i
  %idxprom8.i = sext i32 %mul6.i to i64, !dbg !221
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Ma, i64 %idxprom8.i), metadata !208, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !198
  %arrayidx9.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Ma, i64 %idxprom8.i, !dbg !221
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx9.i, metadata !208, metadata !DIExpression()) #17, !dbg !198
  tail call void @aux_lower_solve([16 x [16 x double]]* noundef %Ma, [16 x [16 x double]]* noundef %arrayidx9.i, [16 x [16 x double]]* noundef %L, i32 noundef %div.i) #17, !dbg !223
  reattach within %syncreg.i, label %det.cont.i, !dbg !223

det.cont.i:                                       ; preds = %det.achd.i, %if.end.i
  tail call void @aux_lower_solve([16 x [16 x double]]* noundef %arrayidx5.i, [16 x [16 x double]]* noundef %arrayidx13.i, [16 x [16 x double]]* noundef %L, i32 noundef %div.i) #17, !dbg !224
  sync within %syncreg.i, label %if.end.i40, !dbg !225

if.then.i32:                                      ; preds = %entry
  %arraydecay.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Ma, i64 0, i64 0, !dbg !226
  %arraydecay1.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %L, i64 0, i64 0, !dbg !228
  tail call fastcc void @block_lower_solve([16 x double]* noundef %arraydecay.i, [16 x double]* noundef %arraydecay1.i) #17, !dbg !229
  tail call void @schur([16 x [16 x double]]* noundef %Mb, [16 x [16 x double]]* noundef %arrayidx8, [16 x [16 x double]]* noundef %Ma, i32 noundef 1), !dbg !230
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Mb, metadata !203, metadata !DIExpression()) #17, !dbg !231
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx12, metadata !204, metadata !DIExpression()) #17, !dbg !231
  call void @llvm.dbg.value(metadata i32 %nb, metadata !205, metadata !DIExpression()) #17, !dbg !231
  %arraydecay.i30 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Mb, i64 0, i64 0, !dbg !233
  %arraydecay1.i31 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %arrayidx12, i64 0, i64 0, !dbg !234
  tail call fastcc void @block_lower_solve([16 x double]* noundef %arraydecay.i30, [16 x double]* noundef %arraydecay1.i31) #17, !dbg !235
  br label %lower_solve.exit45.tfend, !dbg !236

if.end.i40:                                       ; preds = %det.cont.i
  tail call void @schur([16 x [16 x double]]* noundef %Mb, [16 x [16 x double]]* noundef %arrayidx8, [16 x [16 x double]]* noundef %Ma, i32 noundef %nb), !dbg !230
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Mb, metadata !203, metadata !DIExpression()) #17, !dbg !231
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx12, metadata !204, metadata !DIExpression()) #17, !dbg !231
  call void @llvm.dbg.value(metadata i32 %nb, metadata !205, metadata !DIExpression()) #17, !dbg !231
  call void @llvm.dbg.value(metadata i32 %div.i, metadata !210, metadata !DIExpression()) #17, !dbg !231
  %1 = load i32, i32* @nBlocks, align 4, !dbg !237, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Mb, metadata !206, metadata !DIExpression()) #17, !dbg !231
  %arrayidx5.i35 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Mb, i64 %idxprom4.i, !dbg !238
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx5.i35, metadata !207, metadata !DIExpression()) #17, !dbg !231
  %mul6.i36 = mul nsw i32 %1, %div.i, !dbg !239
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Mb, i32 %mul6.i36), metadata !208, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !231
  %add11.i37 = add nsw i32 %mul6.i36, %div.i, !dbg !240
  %idxprom12.i38 = sext i32 %add11.i37 to i64, !dbg !240
  %arrayidx13.i39 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Mb, i64 %idxprom12.i38, !dbg !240
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx13.i39, metadata !209, metadata !DIExpression()) #17, !dbg !231
  detach within %syncreg.i, label %det.achd.i43, label %det.cont.i44, !dbg !241

det.achd.i43:                                     ; preds = %if.end.i40
  %idxprom8.i41 = sext i32 %mul6.i36 to i64, !dbg !239
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Mb, i64 %idxprom8.i41), metadata !208, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !231
  %arrayidx9.i42 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Mb, i64 %idxprom8.i41, !dbg !239
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx9.i42, metadata !208, metadata !DIExpression()) #17, !dbg !231
  tail call void @aux_lower_solve([16 x [16 x double]]* noundef %Mb, [16 x [16 x double]]* noundef %arrayidx9.i42, [16 x [16 x double]]* noundef %arrayidx12, i32 noundef %div.i) #17, !dbg !241
  reattach within %syncreg.i, label %det.cont.i44, !dbg !241

det.cont.i44:                                     ; preds = %det.achd.i43, %if.end.i40
  tail call void @aux_lower_solve([16 x [16 x double]]* noundef %arrayidx5.i35, [16 x [16 x double]]* noundef %arrayidx13.i39, [16 x [16 x double]]* noundef %arrayidx12, i32 noundef %div.i) #17, !dbg !242
  sync within %syncreg.i, label %lower_solve.exit45.tfend, !dbg !243

lower_solve.exit45.tfend:                         ; preds = %det.cont.i44, %if.then.i32
  ret void, !dbg !244
}

; Function Attrs: nounwind uwtable
define dso_local void @lower_solve([16 x [16 x double]]* noundef %M, [16 x [16 x double]]* noundef %L, i32 noundef %nb) local_unnamed_addr #6 !dbg !199 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !245
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %M, metadata !203, metadata !DIExpression()), !dbg !245
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %L, metadata !204, metadata !DIExpression()), !dbg !245
  call void @llvm.dbg.value(metadata i32 %nb, metadata !205, metadata !DIExpression()), !dbg !245
  %cmp = icmp eq i32 %nb, 1, !dbg !246
  br i1 %cmp, label %if.then, label %if.end, !dbg !247

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 0, !dbg !248
  %arraydecay1 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %L, i64 0, i64 0, !dbg !249
  tail call fastcc void @block_lower_solve([16 x double]* noundef %arraydecay, [16 x double]* noundef %arraydecay1), !dbg !250
  br label %cleanup, !dbg !251

if.end:                                           ; preds = %entry
  %div = sdiv i32 %nb, 2, !dbg !252
  call void @llvm.dbg.value(metadata i32 %div, metadata !210, metadata !DIExpression()), !dbg !245
  %0 = load i32, i32* @nBlocks, align 4, !dbg !253, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %M, metadata !206, metadata !DIExpression()), !dbg !245
  %idxprom4 = sext i32 %div to i64, !dbg !254
  %arrayidx5 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 %idxprom4, !dbg !254
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx5, metadata !207, metadata !DIExpression()), !dbg !245
  %mul6 = mul nsw i32 %0, %div, !dbg !255
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %M, i32 %mul6), metadata !208, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !245
  %add11 = add nsw i32 %mul6, %div, !dbg !256
  %idxprom12 = sext i32 %add11 to i64, !dbg !256
  %arrayidx13 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 %idxprom12, !dbg !256
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx13, metadata !209, metadata !DIExpression()), !dbg !245
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !257

det.achd:                                         ; preds = %if.end
  %idxprom8 = sext i32 %mul6 to i64, !dbg !255
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %M, i64 %idxprom8), metadata !208, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !245
  %arrayidx9 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 %idxprom8, !dbg !255
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx9, metadata !208, metadata !DIExpression()), !dbg !245
  tail call void @aux_lower_solve([16 x [16 x double]]* noundef %M, [16 x [16 x double]]* noundef %arrayidx9, [16 x [16 x double]]* noundef %L, i32 noundef %div), !dbg !257
  reattach within %syncreg, label %det.cont, !dbg !257

det.cont:                                         ; preds = %det.achd, %if.end
  tail call void @aux_lower_solve([16 x [16 x double]]* noundef %arrayidx5, [16 x [16 x double]]* noundef %arrayidx13, [16 x [16 x double]]* noundef %L, i32 noundef %div), !dbg !258
  sync within %syncreg, label %cleanup, !dbg !259

cleanup:                                          ; preds = %det.cont, %if.then
  ret void, !dbg !260
}

; Function Attrs: argmemonly nofree nosync nounwind uwtable
define internal fastcc void @block_lower_solve([16 x double]* nocapture noundef %B, [16 x double]* nocapture noundef readonly %L) unnamed_addr #8 !dbg !261 {
entry:
  call void @llvm.dbg.value(metadata [16 x double]* %B, metadata !265, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.value(metadata [16 x double]* %L, metadata !266, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.value(metadata i32 1, metadata !267, metadata !DIExpression()), !dbg !269
  br label %for.cond1.preheader, !dbg !270

for.cond1.preheader:                              ; preds = %for.inc12, %entry
  %indvars.iv28 = phi i64 [ 1, %entry ], [ %indvars.iv.next29, %for.inc12 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv28, metadata !267, metadata !DIExpression()), !dbg !269
  call void @llvm.dbg.value(metadata i32 0, metadata !268, metadata !DIExpression()), !dbg !269
  %arrayidx2.i.1.phi.trans.insert = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv28, i64 14
  %0 = bitcast double* %arrayidx2.i.1.phi.trans.insert to <2 x double>*, !dbg !272
  %1 = load <2 x double>, <2 x double>* %0, align 8, !dbg !272, !tbaa !75
  %arrayidx2.i.3.phi.trans.insert = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv28, i64 12
  %2 = bitcast double* %arrayidx2.i.3.phi.trans.insert to <2 x double>*, !dbg !272
  %3 = load <2 x double>, <2 x double>* %2, align 8, !dbg !272, !tbaa !75
  %arrayidx2.i.5.phi.trans.insert = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv28, i64 10
  %4 = bitcast double* %arrayidx2.i.5.phi.trans.insert to <2 x double>*, !dbg !272
  %5 = load <2 x double>, <2 x double>* %4, align 8, !dbg !272, !tbaa !75
  %arrayidx2.i.7.phi.trans.insert = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv28, i64 8
  %6 = bitcast double* %arrayidx2.i.7.phi.trans.insert to <2 x double>*, !dbg !272
  %7 = load <2 x double>, <2 x double>* %6, align 8, !dbg !272, !tbaa !75
  %arrayidx2.i.9.phi.trans.insert = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv28, i64 6
  %8 = bitcast double* %arrayidx2.i.9.phi.trans.insert to <2 x double>*, !dbg !272
  %9 = load <2 x double>, <2 x double>* %8, align 8, !dbg !272, !tbaa !75
  %arrayidx2.i.11.phi.trans.insert = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv28, i64 4
  %10 = bitcast double* %arrayidx2.i.11.phi.trans.insert to <2 x double>*, !dbg !272
  %11 = load <2 x double>, <2 x double>* %10, align 8, !dbg !272, !tbaa !75
  %arrayidx2.i.13.phi.trans.insert = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv28, i64 2
  %12 = bitcast double* %arrayidx2.i.13.phi.trans.insert to <2 x double>*, !dbg !272
  %13 = load <2 x double>, <2 x double>* %12, align 8, !dbg !272, !tbaa !75
  %arrayidx2.i.15.phi.trans.insert = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv28, i64 0
  %14 = bitcast double* %arrayidx2.i.15.phi.trans.insert to <2 x double>*, !dbg !272
  %15 = load <2 x double>, <2 x double>* %14, align 8, !dbg !272, !tbaa !75
  br label %for.body3, !dbg !277

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %16 = phi <2 x double> [ %15, %for.cond1.preheader ], [ %50, %for.body3 ], !dbg !272
  %17 = phi <2 x double> [ %13, %for.cond1.preheader ], [ %47, %for.body3 ], !dbg !272
  %18 = phi <2 x double> [ %11, %for.cond1.preheader ], [ %44, %for.body3 ], !dbg !272
  %19 = phi <2 x double> [ %9, %for.cond1.preheader ], [ %41, %for.body3 ], !dbg !272
  %20 = phi <2 x double> [ %7, %for.cond1.preheader ], [ %38, %for.body3 ], !dbg !272
  %21 = phi <2 x double> [ %5, %for.cond1.preheader ], [ %35, %for.body3 ], !dbg !272
  %22 = phi <2 x double> [ %3, %for.cond1.preheader ], [ %32, %for.body3 ], !dbg !272
  %23 = phi <2 x double> [ %1, %for.cond1.preheader ], [ %29, %for.body3 ], !dbg !272
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !268, metadata !DIExpression()), !dbg !269
  %arrayidx5 = getelementptr inbounds [16 x double], [16 x double]* %L, i64 %indvars.iv28, i64 %indvars.iv, !dbg !278
  %24 = load double, double* %arrayidx5, align 8, !dbg !278, !tbaa !75
  call void @llvm.dbg.value(metadata double %24, metadata !141, metadata !DIExpression()) #17, !dbg !279
  call void @llvm.dbg.value(metadata !DIArgList([16 x double]* %B, i64 %indvars.iv), metadata !142, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata !DIArgList([16 x double]* %B, i64 %indvars.iv28), metadata !143, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i32 16, metadata !144, metadata !DIExpression()) #17, !dbg !279
  call void @llvm.dbg.value(metadata i32 16, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i32 16, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i32 16, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  %neg.i = fneg double %24
  call void @llvm.dbg.value(metadata i64 15, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 15, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  %arrayidx.i.1 = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv, i64 14, !dbg !280
  %25 = bitcast double* %arrayidx.i.1 to <2 x double>*, !dbg !280
  %26 = load <2 x double>, <2 x double>* %25, align 8, !dbg !280, !tbaa !75
  %27 = insertelement <2 x double> poison, double %neg.i, i64 0, !dbg !272
  %28 = shufflevector <2 x double> %27, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !272
  %29 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %28, <2 x double> %26, <2 x double> %23), !dbg !272
  store <2 x double> %29, <2 x double>* %0, align 8, !dbg !272, !tbaa !75
  call void @llvm.dbg.value(metadata i64 14, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 14, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 13, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 13, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  %arrayidx.i.3 = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv, i64 12, !dbg !280
  %30 = bitcast double* %arrayidx.i.3 to <2 x double>*, !dbg !280
  %31 = load <2 x double>, <2 x double>* %30, align 8, !dbg !280, !tbaa !75
  %32 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %28, <2 x double> %31, <2 x double> %22), !dbg !272
  store <2 x double> %32, <2 x double>* %2, align 8, !dbg !272, !tbaa !75
  call void @llvm.dbg.value(metadata i64 12, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 12, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 11, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 11, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  %arrayidx.i.5 = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv, i64 10, !dbg !280
  %33 = bitcast double* %arrayidx.i.5 to <2 x double>*, !dbg !280
  %34 = load <2 x double>, <2 x double>* %33, align 8, !dbg !280, !tbaa !75
  %35 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %28, <2 x double> %34, <2 x double> %21), !dbg !272
  store <2 x double> %35, <2 x double>* %4, align 8, !dbg !272, !tbaa !75
  call void @llvm.dbg.value(metadata i64 10, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 10, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 9, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 9, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  %arrayidx.i.7 = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv, i64 8, !dbg !280
  %36 = bitcast double* %arrayidx.i.7 to <2 x double>*, !dbg !280
  %37 = load <2 x double>, <2 x double>* %36, align 8, !dbg !280, !tbaa !75
  %38 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %28, <2 x double> %37, <2 x double> %20), !dbg !272
  store <2 x double> %38, <2 x double>* %6, align 8, !dbg !272, !tbaa !75
  call void @llvm.dbg.value(metadata i64 8, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 8, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 7, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 7, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  %arrayidx.i.9 = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv, i64 6, !dbg !280
  %39 = bitcast double* %arrayidx.i.9 to <2 x double>*, !dbg !280
  %40 = load <2 x double>, <2 x double>* %39, align 8, !dbg !280, !tbaa !75
  %41 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %28, <2 x double> %40, <2 x double> %19), !dbg !272
  store <2 x double> %41, <2 x double>* %8, align 8, !dbg !272, !tbaa !75
  call void @llvm.dbg.value(metadata i64 6, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 6, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 5, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 5, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  %arrayidx.i.11 = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv, i64 4, !dbg !280
  %42 = bitcast double* %arrayidx.i.11 to <2 x double>*, !dbg !280
  %43 = load <2 x double>, <2 x double>* %42, align 8, !dbg !280, !tbaa !75
  %44 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %28, <2 x double> %43, <2 x double> %18), !dbg !272
  store <2 x double> %44, <2 x double>* %10, align 8, !dbg !272, !tbaa !75
  call void @llvm.dbg.value(metadata i64 4, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 4, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 3, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 3, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  %arrayidx.i.13 = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv, i64 2, !dbg !280
  %45 = bitcast double* %arrayidx.i.13 to <2 x double>*, !dbg !280
  %46 = load <2 x double>, <2 x double>* %45, align 8, !dbg !280, !tbaa !75
  %47 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %28, <2 x double> %46, <2 x double> %17), !dbg !272
  store <2 x double> %47, <2 x double>* %12, align 8, !dbg !272, !tbaa !75
  call void @llvm.dbg.value(metadata i64 2, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 2, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 1, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 1, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  %arrayidx.i.15 = getelementptr inbounds [16 x double], [16 x double]* %B, i64 %indvars.iv, i64 0, !dbg !280
  %48 = bitcast double* %arrayidx.i.15 to <2 x double>*, !dbg !280
  %49 = load <2 x double>, <2 x double>* %48, align 8, !dbg !280, !tbaa !75
  %50 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %28, <2 x double> %49, <2 x double> %16), !dbg !272
  store <2 x double> %50, <2 x double>* %14, align 8, !dbg !272, !tbaa !75
  call void @llvm.dbg.value(metadata i64 0, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  call void @llvm.dbg.value(metadata i64 0, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !279
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !281
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !268, metadata !DIExpression()), !dbg !269
  %exitcond.not = icmp eq i64 %indvars.iv.next, %indvars.iv28, !dbg !282
  br i1 %exitcond.not, label %for.inc12, label %for.body3, !dbg !277, !llvm.loop !283

for.inc12:                                        ; preds = %for.body3
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1, !dbg !285
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next29, metadata !267, metadata !DIExpression()), !dbg !269
  %exitcond31.not = icmp eq i64 %indvars.iv.next29, 16, !dbg !286
  br i1 %exitcond31.not, label %for.end14, label %for.cond1.preheader, !dbg !270, !llvm.loop !287

for.end14:                                        ; preds = %for.inc12
  ret void, !dbg !289
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @aux_upper_solve([16 x [16 x double]]* noundef %Ma, [16 x [16 x double]]* noundef %Mb, [16 x [16 x double]]* noundef %U, i32 noundef %nb) local_unnamed_addr #7 !dbg !290 {
entry:
  %syncreg.i = tail call token @llvm.syncregion.start(), !dbg !300
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Ma, metadata !292, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Mb, metadata !293, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %U, metadata !294, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i32 %nb, metadata !295, metadata !DIExpression()), !dbg !312
  %0 = load i32, i32* @nBlocks, align 4, !dbg !313, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %U, metadata !296, metadata !DIExpression()), !dbg !312
  %idxprom3 = sext i32 %nb to i64, !dbg !314
  %arrayidx4 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 %idxprom3, !dbg !314
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx4, metadata !297, metadata !DIExpression()), !dbg !312
  %mul5 = mul nsw i32 %0, %nb, !dbg !315
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %U, i32 %mul5), metadata !298, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !312
  %add10 = add nsw i32 %mul5, %nb, !dbg !316
  %idxprom11 = sext i32 %add10 to i64, !dbg !316
  %arrayidx12 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 %idxprom11, !dbg !316
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx12, metadata !299, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Ma, metadata !303, metadata !DIExpression()) #17, !dbg !300
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %U, metadata !304, metadata !DIExpression()) #17, !dbg !300
  call void @llvm.dbg.value(metadata i32 %nb, metadata !305, metadata !DIExpression()) #17, !dbg !300
  %cmp.i = icmp eq i32 %nb, 1, !dbg !317
  br i1 %cmp.i, label %for.cond1.preheader.i.preheader, label %if.end.i, !dbg !319

for.cond1.preheader.i.preheader:                  ; preds = %entry
  %arrayidx5.i4675 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 0, i64 0, i64 0
  %arrayidx17.i78 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 0, i64 0, i64 1
  br label %for.cond1.preheader.i, !dbg !320

for.cond1.preheader.i:                            ; preds = %for.inc24.i, %for.cond1.preheader.i.preheader
  %indvars.iv49.i = phi i64 [ %indvars.iv.next50.i, %for.inc24.i ], [ 0, %for.cond1.preheader.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv49.i, metadata !326, metadata !DIExpression()) #17, !dbg !330
  call void @llvm.dbg.value(metadata i32 0, metadata !327, metadata !DIExpression()) #17, !dbg !330
  call void @llvm.dbg.value(metadata i64 0, metadata !327, metadata !DIExpression()) #17, !dbg !330
  %1 = load double, double* %arrayidx5.i4675, align 8, !dbg !331, !tbaa !75
  %arrayidx9.i4776 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Ma, i64 0, i64 %indvars.iv49.i, i64 0, !dbg !336
  %2 = load double, double* %arrayidx9.i4776, align 8, !dbg !337, !tbaa !75
  %div.i4877 = fdiv double %2, %1, !dbg !337
  store double %div.i4877, double* %arrayidx9.i4776, align 8, !dbg !337, !tbaa !75
  call void @llvm.dbg.value(metadata double %div.i4877, metadata !141, metadata !DIExpression()) #17, !dbg !338
  call void @llvm.dbg.value(metadata double* %arrayidx17.i78, metadata !142, metadata !DIExpression()) #17, !dbg !338
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Ma, i64 %indvars.iv49.i), metadata !143, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst, 8, DW_OP_stack_value)) #17, !dbg !338
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 0), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !338
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 0), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !338
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 0), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !338
  br label %for.body.lr.ph.i.i, !dbg !340

for.body3.i.loopexit:                             ; preds = %for.body.i.i, %for.body.i.i.prol.loopexit
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i82, metadata !327, metadata !DIExpression()) #17, !dbg !330
  %arrayidx5.i46 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 0, i64 %indvars.iv.next.i82, i64 %indvars.iv.next.i82, !dbg !331
  %3 = load double, double* %arrayidx5.i46, align 8, !dbg !331, !tbaa !75
  %4 = load double, double* %7, align 8, !dbg !337, !tbaa !75
  %div.i48 = fdiv double %4, %3, !dbg !337
  store double %div.i48, double* %7, align 8, !dbg !337, !tbaa !75
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.next.i82, 1, !dbg !341
  %arrayidx17.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 0, i64 %indvars.iv.next.i82, i64 %indvars.iv.next.i, !dbg !341
  call void @llvm.dbg.value(metadata double %div.i48, metadata !141, metadata !DIExpression()) #17, !dbg !338
  call void @llvm.dbg.value(metadata double* %arrayidx17.i, metadata !142, metadata !DIExpression()) #17, !dbg !338
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Ma, i64 %indvars.iv49.i, i64 %indvars.iv.next.i), metadata !143, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg, 2, DW_OP_constu, 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !338
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 %indvars.iv.next.i82), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !338
  %cmp10.i.not.i = icmp eq i64 %indvars.iv.next.i82, 15, !dbg !342
  %indvar.next = add i64 %indvar, 1, !dbg !340
  br i1 %cmp10.i.not.i, label %for.inc24.i, label %for.body.lr.ph.i.i, !dbg !340, !llvm.loop !343

for.body.lr.ph.i.i:                               ; preds = %for.body3.i.loopexit, %for.cond1.preheader.i
  %indvar = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvar.next, %for.body3.i.loopexit ]
  %arrayidx17.i83 = phi double* [ %arrayidx17.i78, %for.cond1.preheader.i ], [ %arrayidx17.i, %for.body3.i.loopexit ]
  %indvars.iv.next.i82 = phi i64 [ 1, %for.cond1.preheader.i ], [ %indvars.iv.next.i, %for.body3.i.loopexit ]
  %div.i4881 = phi double [ %div.i4877, %for.cond1.preheader.i ], [ %div.i48, %for.body3.i.loopexit ]
  %indvars.iv.i80 = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i82, %for.body3.i.loopexit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i80, metadata !327, metadata !DIExpression()) #17, !dbg !330
  %5 = sub i64 1, %indvar, !dbg !346
  %6 = sub nuw nsw i64 15, %indvars.iv.i80, !dbg !346
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 %indvars.iv.i80), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !338
  %neg.i.i = fneg double %div.i4881
  %7 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Ma, i64 0, i64 %indvars.iv49.i, i64 %indvars.iv.next.i82
  %xtraiter = and i64 %5, 1, !dbg !340
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !340
  br i1 %lcmp.mod.not, label %for.body.i.i.prol.loopexit, label %for.body.i.i.prol, !dbg !340

for.body.i.i.prol:                                ; preds = %for.body.lr.ph.i.i
  %indvars.iv.next.i.i.prol = sub nsw i64 14, %indvars.iv.i80, !dbg !347
  %idxprom8.i.i.prol = and i64 %indvars.iv.next.i.i.prol, 4294967295, !dbg !348
  %arrayidx.i.i.prol = getelementptr inbounds double, double* %arrayidx17.i83, i64 %idxprom8.i.i.prol, !dbg !348
  %8 = load double, double* %arrayidx.i.i.prol, align 8, !dbg !348, !tbaa !75
  %arrayidx2.i.i.prol = getelementptr inbounds double, double* %7, i64 %idxprom8.i.i.prol, !dbg !349
  %9 = load double, double* %arrayidx2.i.i.prol, align 8, !dbg !350, !tbaa !75
  %10 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %8, double %9) #17, !dbg !350
  store double %10, double* %arrayidx2.i.i.prol, align 8, !dbg !350, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i.prol, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !338
  br label %for.body.i.i.prol.loopexit, !dbg !340

for.body.i.i.prol.loopexit:                       ; preds = %for.body.i.i.prol, %for.body.lr.ph.i.i
  %indvars.iv.i.i.unr = phi i64 [ %6, %for.body.lr.ph.i.i ], [ %indvars.iv.next.i.i.prol, %for.body.i.i.prol ]
  %11 = icmp eq i64 %indvar, 14, !dbg !340
  br i1 %11, label %for.body3.i.loopexit, label %for.body.i.i, !dbg !340

for.body.i.i:                                     ; preds = %for.body.i.i, %for.body.i.i.prol.loopexit
  %indvars.iv.i.i = phi i64 [ %indvars.iv.next.i.i.1, %for.body.i.i ], [ %indvars.iv.i.i.unr, %for.body.i.i.prol.loopexit ]
  %indvars.iv.next.i.i = add nsw i64 %indvars.iv.i.i, -1, !dbg !347
  %idxprom8.i.i = and i64 %indvars.iv.next.i.i, 4294967295, !dbg !348
  %arrayidx.i.i = getelementptr inbounds double, double* %arrayidx17.i83, i64 %idxprom8.i.i, !dbg !348
  %12 = load double, double* %arrayidx.i.i, align 8, !dbg !348, !tbaa !75
  %arrayidx2.i.i = getelementptr inbounds double, double* %7, i64 %idxprom8.i.i, !dbg !349
  %13 = load double, double* %arrayidx2.i.i, align 8, !dbg !350, !tbaa !75
  %14 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %12, double %13) #17, !dbg !350
  store double %14, double* %arrayidx2.i.i, align 8, !dbg !350, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !338
  %indvars.iv.next.i.i.1 = add nsw i64 %indvars.iv.i.i, -2, !dbg !347
  %idxprom8.i.i.1 = and i64 %indvars.iv.next.i.i.1, 4294967295, !dbg !348
  %arrayidx.i.i.1 = getelementptr inbounds double, double* %arrayidx17.i83, i64 %idxprom8.i.i.1, !dbg !348
  %15 = load double, double* %arrayidx.i.i.1, align 8, !dbg !348, !tbaa !75
  %arrayidx2.i.i.1 = getelementptr inbounds double, double* %7, i64 %idxprom8.i.i.1, !dbg !349
  %16 = load double, double* %arrayidx2.i.i.1, align 8, !dbg !350, !tbaa !75
  %17 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %15, double %16) #17, !dbg !350
  store double %17, double* %arrayidx2.i.i.1, align 8, !dbg !350, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i.1, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !338
  %cmp.i.i.1 = icmp ugt i64 %indvars.iv.next.i.i, 1, !dbg !342
  br i1 %cmp.i.i.1, label %for.body.i.i, label %for.body3.i.loopexit, !dbg !340

for.inc24.i:                                      ; preds = %for.body3.i.loopexit
  %indvars.iv.next50.i = add nuw nsw i64 %indvars.iv49.i, 1, !dbg !351
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next50.i, metadata !326, metadata !DIExpression()) #17, !dbg !330
  %exitcond52.not.i = icmp eq i64 %indvars.iv.next50.i, 16, !dbg !352
  br i1 %exitcond52.not.i, label %for.cond1.preheader.i50.preheader, label %for.cond1.preheader.i, !dbg !320, !llvm.loop !353

if.end.i:                                         ; preds = %entry
  %div.i = sdiv i32 %nb, 2, !dbg !355
  call void @llvm.dbg.value(metadata i32 %div.i, metadata !310, metadata !DIExpression()) #17, !dbg !300
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Ma, metadata !306, metadata !DIExpression()) #17, !dbg !300
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Ma, i32 %div.i), metadata !307, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !300
  %mul6.i = mul nsw i32 %0, %div.i, !dbg !356
  %idxprom8.i = sext i32 %mul6.i to i64, !dbg !356
  %arrayidx9.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Ma, i64 %idxprom8.i, !dbg !356
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx9.i, metadata !308, metadata !DIExpression()) #17, !dbg !300
  %add11.i = add nsw i32 %mul6.i, %div.i, !dbg !357
  %idxprom12.i = sext i32 %add11.i to i64, !dbg !357
  %arrayidx13.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Ma, i64 %idxprom12.i, !dbg !357
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx13.i, metadata !309, metadata !DIExpression()) #17, !dbg !300
  detach within %syncreg.i, label %det.achd.i, label %det.cont.i, !dbg !358

det.achd.i:                                       ; preds = %if.end.i
  %idxprom4.i = sext i32 %div.i to i64, !dbg !359
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Ma, i64 %idxprom4.i), metadata !307, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !300
  %arrayidx5.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Ma, i64 %idxprom4.i, !dbg !359
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx5.i, metadata !307, metadata !DIExpression()) #17, !dbg !300
  tail call void @aux_upper_solve([16 x [16 x double]]* noundef %Ma, [16 x [16 x double]]* noundef %arrayidx5.i, [16 x [16 x double]]* noundef %U, i32 noundef %div.i) #17, !dbg !358
  reattach within %syncreg.i, label %det.cont.i, !dbg !358

det.cont.i:                                       ; preds = %det.achd.i, %if.end.i
  tail call void @aux_upper_solve([16 x [16 x double]]* noundef %arrayidx9.i, [16 x [16 x double]]* noundef %arrayidx13.i, [16 x [16 x double]]* noundef %U, i32 noundef %div.i) #17, !dbg !360
  sync within %syncreg.i, label %if.end.i40, !dbg !361

for.cond1.preheader.i50.preheader:                ; preds = %for.inc24.i
  tail call void @schur([16 x [16 x double]]* noundef %Mb, [16 x [16 x double]]* noundef nonnull %Ma, [16 x [16 x double]]* noundef nonnull %arrayidx4, i32 noundef 1), !dbg !362
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Mb, metadata !303, metadata !DIExpression()) #17, !dbg !363
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx12, metadata !304, metadata !DIExpression()) #17, !dbg !363
  call void @llvm.dbg.value(metadata i32 %nb, metadata !305, metadata !DIExpression()) #17, !dbg !363
  %arrayidx5.i5285 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 %idxprom11, i64 0, i64 0
  %arrayidx17.i5688 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 %idxprom11, i64 0, i64 1
  br label %for.cond1.preheader.i50, !dbg !365

for.cond1.preheader.i50:                          ; preds = %for.inc24.i73, %for.cond1.preheader.i50.preheader
  %indvars.iv49.i49 = phi i64 [ %indvars.iv.next50.i71, %for.inc24.i73 ], [ 0, %for.cond1.preheader.i50.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv49.i49, metadata !326, metadata !DIExpression()) #17, !dbg !367
  call void @llvm.dbg.value(metadata i64 0, metadata !327, metadata !DIExpression()) #17, !dbg !367
  %18 = load double, double* %arrayidx5.i5285, align 8, !dbg !368, !tbaa !75
  %arrayidx9.i5386 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Mb, i64 0, i64 %indvars.iv49.i49, i64 0, !dbg !369
  %19 = load double, double* %arrayidx9.i5386, align 8, !dbg !370, !tbaa !75
  %div.i5487 = fdiv double %19, %18, !dbg !370
  store double %div.i5487, double* %arrayidx9.i5386, align 8, !dbg !370, !tbaa !75
  call void @llvm.dbg.value(metadata double %div.i5487, metadata !141, metadata !DIExpression()) #17, !dbg !371
  call void @llvm.dbg.value(metadata double* %arrayidx17.i5688, metadata !142, metadata !DIExpression()) #17, !dbg !371
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Mb, i64 %indvars.iv49.i49), metadata !143, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst, 8, DW_OP_stack_value)) #17, !dbg !371
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 0), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !371
  br label %for.body.lr.ph.i.i61, !dbg !373

for.body3.i59.loopexit:                           ; preds = %for.body.i.i68, %for.body.i.i68.prol.loopexit
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i5592, metadata !327, metadata !DIExpression()) #17, !dbg !367
  %arrayidx5.i52 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 %idxprom11, i64 %indvars.iv.next.i5592, i64 %indvars.iv.next.i5592, !dbg !368
  %20 = load double, double* %arrayidx5.i52, align 8, !dbg !368, !tbaa !75
  %21 = load double, double* %24, align 8, !dbg !370, !tbaa !75
  %div.i54 = fdiv double %21, %20, !dbg !370
  store double %div.i54, double* %24, align 8, !dbg !370, !tbaa !75
  %indvars.iv.next.i55 = add nuw nsw i64 %indvars.iv.next.i5592, 1, !dbg !374
  %arrayidx17.i56 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 %idxprom11, i64 %indvars.iv.next.i5592, i64 %indvars.iv.next.i55, !dbg !374
  call void @llvm.dbg.value(metadata double %div.i54, metadata !141, metadata !DIExpression()) #17, !dbg !371
  call void @llvm.dbg.value(metadata double* %arrayidx17.i56, metadata !142, metadata !DIExpression()) #17, !dbg !371
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Mb, i64 %indvars.iv49.i49, i64 %indvars.iv.next.i55), metadata !143, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg, 2, DW_OP_constu, 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !371
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 %indvars.iv.next.i5592), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !371
  %cmp10.i.not.i58 = icmp eq i64 %indvars.iv.next.i5592, 15, !dbg !375
  %indvar.next97 = add i64 %indvar96, 1, !dbg !373
  br i1 %cmp10.i.not.i58, label %for.inc24.i73, label %for.body.lr.ph.i.i61, !dbg !373, !llvm.loop !376

for.body.lr.ph.i.i61:                             ; preds = %for.body3.i59.loopexit, %for.cond1.preheader.i50
  %indvar96 = phi i64 [ 0, %for.cond1.preheader.i50 ], [ %indvar.next97, %for.body3.i59.loopexit ]
  %arrayidx17.i5693 = phi double* [ %arrayidx17.i5688, %for.cond1.preheader.i50 ], [ %arrayidx17.i56, %for.body3.i59.loopexit ]
  %indvars.iv.next.i5592 = phi i64 [ 1, %for.cond1.preheader.i50 ], [ %indvars.iv.next.i55, %for.body3.i59.loopexit ]
  %div.i5491 = phi double [ %div.i5487, %for.cond1.preheader.i50 ], [ %div.i54, %for.body3.i59.loopexit ]
  %indvars.iv.i5190 = phi i64 [ 0, %for.cond1.preheader.i50 ], [ %indvars.iv.next.i5592, %for.body3.i59.loopexit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i5190, metadata !327, metadata !DIExpression()) #17, !dbg !367
  %22 = sub i64 1, %indvar96, !dbg !379
  %23 = sub nuw nsw i64 15, %indvars.iv.i5190, !dbg !379
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 %indvars.iv.i5190), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !371
  %neg.i.i60 = fneg double %div.i5491
  %24 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Mb, i64 0, i64 %indvars.iv49.i49, i64 %indvars.iv.next.i5592
  %xtraiter98 = and i64 %22, 1, !dbg !373
  %lcmp.mod99.not = icmp eq i64 %xtraiter98, 0, !dbg !373
  br i1 %lcmp.mod99.not, label %for.body.i.i68.prol.loopexit, label %for.body.i.i68.prol, !dbg !373

for.body.i.i68.prol:                              ; preds = %for.body.lr.ph.i.i61
  %indvars.iv.next.i.i63.prol = sub nsw i64 14, %indvars.iv.i5190, !dbg !380
  %idxprom8.i.i64.prol = and i64 %indvars.iv.next.i.i63.prol, 4294967295, !dbg !381
  %arrayidx.i.i65.prol = getelementptr inbounds double, double* %arrayidx17.i5693, i64 %idxprom8.i.i64.prol, !dbg !381
  %25 = load double, double* %arrayidx.i.i65.prol, align 8, !dbg !381, !tbaa !75
  %arrayidx2.i.i66.prol = getelementptr inbounds double, double* %24, i64 %idxprom8.i.i64.prol, !dbg !382
  %26 = load double, double* %arrayidx2.i.i66.prol, align 8, !dbg !383, !tbaa !75
  %27 = tail call double @llvm.fmuladd.f64(double %neg.i.i60, double %25, double %26) #17, !dbg !383
  store double %27, double* %arrayidx2.i.i66.prol, align 8, !dbg !383, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i63.prol, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !371
  br label %for.body.i.i68.prol.loopexit, !dbg !373

for.body.i.i68.prol.loopexit:                     ; preds = %for.body.i.i68.prol, %for.body.lr.ph.i.i61
  %indvars.iv.i.i62.unr = phi i64 [ %23, %for.body.lr.ph.i.i61 ], [ %indvars.iv.next.i.i63.prol, %for.body.i.i68.prol ]
  %28 = icmp eq i64 %indvar96, 14, !dbg !373
  br i1 %28, label %for.body3.i59.loopexit, label %for.body.i.i68, !dbg !373

for.body.i.i68:                                   ; preds = %for.body.i.i68, %for.body.i.i68.prol.loopexit
  %indvars.iv.i.i62 = phi i64 [ %indvars.iv.next.i.i63.1, %for.body.i.i68 ], [ %indvars.iv.i.i62.unr, %for.body.i.i68.prol.loopexit ]
  %indvars.iv.next.i.i63 = add nsw i64 %indvars.iv.i.i62, -1, !dbg !380
  %idxprom8.i.i64 = and i64 %indvars.iv.next.i.i63, 4294967295, !dbg !381
  %arrayidx.i.i65 = getelementptr inbounds double, double* %arrayidx17.i5693, i64 %idxprom8.i.i64, !dbg !381
  %29 = load double, double* %arrayidx.i.i65, align 8, !dbg !381, !tbaa !75
  %arrayidx2.i.i66 = getelementptr inbounds double, double* %24, i64 %idxprom8.i.i64, !dbg !382
  %30 = load double, double* %arrayidx2.i.i66, align 8, !dbg !383, !tbaa !75
  %31 = tail call double @llvm.fmuladd.f64(double %neg.i.i60, double %29, double %30) #17, !dbg !383
  store double %31, double* %arrayidx2.i.i66, align 8, !dbg !383, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i63, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !371
  %indvars.iv.next.i.i63.1 = add nsw i64 %indvars.iv.i.i62, -2, !dbg !380
  %idxprom8.i.i64.1 = and i64 %indvars.iv.next.i.i63.1, 4294967295, !dbg !381
  %arrayidx.i.i65.1 = getelementptr inbounds double, double* %arrayidx17.i5693, i64 %idxprom8.i.i64.1, !dbg !381
  %32 = load double, double* %arrayidx.i.i65.1, align 8, !dbg !381, !tbaa !75
  %arrayidx2.i.i66.1 = getelementptr inbounds double, double* %24, i64 %idxprom8.i.i64.1, !dbg !382
  %33 = load double, double* %arrayidx2.i.i66.1, align 8, !dbg !383, !tbaa !75
  %34 = tail call double @llvm.fmuladd.f64(double %neg.i.i60, double %32, double %33) #17, !dbg !383
  store double %34, double* %arrayidx2.i.i66.1, align 8, !dbg !383, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i63.1, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !371
  %cmp.i.i67.1 = icmp ugt i64 %indvars.iv.next.i.i63, 1, !dbg !375
  br i1 %cmp.i.i67.1, label %for.body.i.i68, label %for.body3.i59.loopexit, !dbg !373

for.inc24.i73:                                    ; preds = %for.body3.i59.loopexit
  %indvars.iv.next50.i71 = add nuw nsw i64 %indvars.iv49.i49, 1, !dbg !384
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next50.i71, metadata !326, metadata !DIExpression()) #17, !dbg !367
  %exitcond52.not.i72 = icmp eq i64 %indvars.iv.next50.i71, 16, !dbg !385
  br i1 %exitcond52.not.i72, label %upper_solve.exit45.tfend.tfend, label %for.cond1.preheader.i50, !dbg !365, !llvm.loop !386

if.end.i40:                                       ; preds = %det.cont.i
  tail call void @schur([16 x [16 x double]]* noundef %Mb, [16 x [16 x double]]* noundef %Ma, [16 x [16 x double]]* noundef %arrayidx4, i32 noundef %nb), !dbg !362
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Mb, metadata !303, metadata !DIExpression()) #17, !dbg !363
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx12, metadata !304, metadata !DIExpression()) #17, !dbg !363
  call void @llvm.dbg.value(metadata i32 %nb, metadata !305, metadata !DIExpression()) #17, !dbg !363
  call void @llvm.dbg.value(metadata i32 %div.i, metadata !310, metadata !DIExpression()) #17, !dbg !363
  %35 = load i32, i32* @nBlocks, align 4, !dbg !388, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %Mb, metadata !306, metadata !DIExpression()) #17, !dbg !363
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Mb, i32 %div.i), metadata !307, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !363
  %mul6.i34 = mul nsw i32 %35, %div.i, !dbg !389
  %idxprom8.i35 = sext i32 %mul6.i34 to i64, !dbg !389
  %arrayidx9.i36 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Mb, i64 %idxprom8.i35, !dbg !389
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx9.i36, metadata !308, metadata !DIExpression()) #17, !dbg !363
  %add11.i37 = add nsw i32 %mul6.i34, %div.i, !dbg !390
  %idxprom12.i38 = sext i32 %add11.i37 to i64, !dbg !390
  %arrayidx13.i39 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Mb, i64 %idxprom12.i38, !dbg !390
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx13.i39, metadata !309, metadata !DIExpression()) #17, !dbg !363
  detach within %syncreg.i, label %det.achd.i43, label %det.cont.i44, !dbg !391

det.achd.i43:                                     ; preds = %if.end.i40
  %idxprom4.i41 = sext i32 %div.i to i64, !dbg !392
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %Mb, i64 %idxprom4.i41), metadata !307, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !363
  %arrayidx5.i42 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %Mb, i64 %idxprom4.i41, !dbg !392
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx5.i42, metadata !307, metadata !DIExpression()) #17, !dbg !363
  tail call void @aux_upper_solve([16 x [16 x double]]* noundef %Mb, [16 x [16 x double]]* noundef %arrayidx5.i42, [16 x [16 x double]]* noundef %arrayidx12, i32 noundef %div.i) #17, !dbg !391
  reattach within %syncreg.i, label %det.cont.i44, !dbg !391

det.cont.i44:                                     ; preds = %det.achd.i43, %if.end.i40
  tail call void @aux_upper_solve([16 x [16 x double]]* noundef %arrayidx9.i36, [16 x [16 x double]]* noundef %arrayidx13.i39, [16 x [16 x double]]* noundef %arrayidx12, i32 noundef %div.i) #17, !dbg !393
  sync within %syncreg.i, label %upper_solve.exit45.tfend.tfend, !dbg !394

upper_solve.exit45.tfend.tfend:                   ; preds = %det.cont.i44, %for.inc24.i73
  ret void, !dbg !395
}

; Function Attrs: nounwind uwtable
define dso_local void @upper_solve([16 x [16 x double]]* noundef %M, [16 x [16 x double]]* noundef %U, i32 noundef %nb) local_unnamed_addr #6 !dbg !301 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !396
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %M, metadata !303, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %U, metadata !304, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i32 %nb, metadata !305, metadata !DIExpression()), !dbg !396
  %cmp = icmp eq i32 %nb, 1, !dbg !397
  br i1 %cmp, label %for.cond1.preheader.i.preheader, label %if.end, !dbg !398

for.cond1.preheader.i.preheader:                  ; preds = %entry
  %arrayidx5.i35 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 0, i64 0, i64 0
  %arrayidx17.i38 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 0, i64 0, i64 1
  br label %for.cond1.preheader.i, !dbg !399

for.cond1.preheader.i:                            ; preds = %for.inc24.i, %for.cond1.preheader.i.preheader
  %indvars.iv49.i = phi i64 [ %indvars.iv.next50.i, %for.inc24.i ], [ 0, %for.cond1.preheader.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv49.i, metadata !326, metadata !DIExpression()) #17, !dbg !401
  call void @llvm.dbg.value(metadata i32 0, metadata !327, metadata !DIExpression()) #17, !dbg !401
  call void @llvm.dbg.value(metadata i64 0, metadata !327, metadata !DIExpression()) #17, !dbg !401
  %0 = load double, double* %arrayidx5.i35, align 8, !dbg !402, !tbaa !75
  %arrayidx9.i36 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv49.i, i64 0, !dbg !403
  %1 = load double, double* %arrayidx9.i36, align 8, !dbg !404, !tbaa !75
  %div.i37 = fdiv double %1, %0, !dbg !404
  store double %div.i37, double* %arrayidx9.i36, align 8, !dbg !404, !tbaa !75
  call void @llvm.dbg.value(metadata double %div.i37, metadata !141, metadata !DIExpression()) #17, !dbg !405
  call void @llvm.dbg.value(metadata double* %arrayidx17.i38, metadata !142, metadata !DIExpression()) #17, !dbg !405
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %M, i64 %indvars.iv49.i), metadata !143, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst, 8, DW_OP_stack_value)) #17, !dbg !405
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 0), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !405
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 0), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !405
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 0), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !405
  br label %for.body.lr.ph.i.i, !dbg !407

for.body3.i.loopexit:                             ; preds = %for.body.i.i, %for.body.i.i.prol.loopexit
  %.lcssa = phi double* [ %.lcssa.unr, %for.body.i.i.prol.loopexit ], [ %12, %for.body.i.i ], !dbg !408
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i42, metadata !327, metadata !DIExpression()) #17, !dbg !401
  %arrayidx5.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 0, i64 %indvars.iv.next.i42, i64 %indvars.iv.next.i42, !dbg !402
  %2 = load double, double* %arrayidx5.i, align 8, !dbg !402, !tbaa !75
  %3 = load double, double* %.lcssa, align 8, !dbg !404, !tbaa !75
  %div.i = fdiv double %3, %2, !dbg !404
  store double %div.i, double* %.lcssa, align 8, !dbg !404, !tbaa !75
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.next.i42, 1, !dbg !409
  %arrayidx17.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %U, i64 0, i64 %indvars.iv.next.i42, i64 %indvars.iv.next.i, !dbg !409
  call void @llvm.dbg.value(metadata double %div.i, metadata !141, metadata !DIExpression()) #17, !dbg !405
  call void @llvm.dbg.value(metadata double* %arrayidx17.i, metadata !142, metadata !DIExpression()) #17, !dbg !405
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %M, i64 %indvars.iv49.i, i64 %indvars.iv.next.i), metadata !143, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg, 2, DW_OP_constu, 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !405
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 %indvars.iv.next.i42), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !405
  %cmp10.i.not.i = icmp eq i64 %indvars.iv.next.i42, 15, !dbg !410
  %indvar.next = add i64 %indvar, 1, !dbg !407
  br i1 %cmp10.i.not.i, label %for.inc24.i, label %for.body.lr.ph.i.i, !dbg !407, !llvm.loop !411

for.body.lr.ph.i.i:                               ; preds = %for.body3.i.loopexit, %for.cond1.preheader.i
  %indvar = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvar.next, %for.body3.i.loopexit ]
  %arrayidx17.i43 = phi double* [ %arrayidx17.i38, %for.cond1.preheader.i ], [ %arrayidx17.i, %for.body3.i.loopexit ]
  %indvars.iv.next.i42 = phi i64 [ 1, %for.cond1.preheader.i ], [ %indvars.iv.next.i, %for.body3.i.loopexit ]
  %div.i41 = phi double [ %div.i37, %for.cond1.preheader.i ], [ %div.i, %for.body3.i.loopexit ]
  %indvars.iv.i40 = phi i64 [ 0, %for.cond1.preheader.i ], [ %indvars.iv.next.i42, %for.body3.i.loopexit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i40, metadata !327, metadata !DIExpression()) #17, !dbg !401
  %4 = sub i64 1, %indvar, !dbg !414
  %5 = sub nuw nsw i64 15, %indvars.iv.i40, !dbg !414
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 %indvars.iv.i40), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !405
  %neg.i.i = fneg double %div.i41
  %xtraiter = and i64 %4, 1, !dbg !407
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !407
  br i1 %lcmp.mod.not, label %for.body.i.i.prol.loopexit, label %for.body.i.i.prol, !dbg !407

for.body.i.i.prol:                                ; preds = %for.body.lr.ph.i.i
  %6 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv49.i, i64 %indvars.iv.next.i42, !dbg !408
  %indvars.iv.next.i.i.prol = sub nsw i64 14, %indvars.iv.i40, !dbg !415
  %idxprom8.i.i.prol = and i64 %indvars.iv.next.i.i.prol, 4294967295, !dbg !416
  %arrayidx.i.i.prol = getelementptr inbounds double, double* %arrayidx17.i43, i64 %idxprom8.i.i.prol, !dbg !416
  %7 = load double, double* %arrayidx.i.i.prol, align 8, !dbg !416, !tbaa !75
  %arrayidx2.i.i.prol = getelementptr inbounds double, double* %6, i64 %idxprom8.i.i.prol, !dbg !417
  %8 = load double, double* %arrayidx2.i.i.prol, align 8, !dbg !418, !tbaa !75
  %9 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %7, double %8) #17, !dbg !418
  store double %9, double* %arrayidx2.i.i.prol, align 8, !dbg !418, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i.prol, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !405
  br label %for.body.i.i.prol.loopexit, !dbg !407

for.body.i.i.prol.loopexit:                       ; preds = %for.body.i.i.prol, %for.body.lr.ph.i.i
  %indvars.iv.i.i.unr = phi i64 [ %5, %for.body.lr.ph.i.i ], [ %indvars.iv.next.i.i.prol, %for.body.i.i.prol ]
  %.lcssa.unr = phi double* [ undef, %for.body.lr.ph.i.i ], [ %6, %for.body.i.i.prol ]
  %10 = icmp eq i64 %indvar, 14, !dbg !407
  br i1 %10, label %for.body3.i.loopexit, label %for.body.lr.ph.i.i.new, !dbg !407

for.body.lr.ph.i.i.new:                           ; preds = %for.body.i.i.prol.loopexit
  %11 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv49.i, i64 %indvars.iv.next.i42
  %12 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 0, i64 %indvars.iv49.i, i64 %indvars.iv.next.i42
  br label %for.body.i.i, !dbg !407

for.body.i.i:                                     ; preds = %for.body.i.i, %for.body.lr.ph.i.i.new
  %indvars.iv.i.i = phi i64 [ %indvars.iv.i.i.unr, %for.body.lr.ph.i.i.new ], [ %indvars.iv.next.i.i.1, %for.body.i.i ]
  %indvars.iv.next.i.i = add nsw i64 %indvars.iv.i.i, -1, !dbg !415
  %idxprom8.i.i = and i64 %indvars.iv.next.i.i, 4294967295, !dbg !416
  %arrayidx.i.i = getelementptr inbounds double, double* %arrayidx17.i43, i64 %idxprom8.i.i, !dbg !416
  %13 = load double, double* %arrayidx.i.i, align 8, !dbg !416, !tbaa !75
  %arrayidx2.i.i = getelementptr inbounds double, double* %11, i64 %idxprom8.i.i, !dbg !417
  %14 = load double, double* %arrayidx2.i.i, align 8, !dbg !418, !tbaa !75
  %15 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %13, double %14) #17, !dbg !418
  store double %15, double* %arrayidx2.i.i, align 8, !dbg !418, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !405
  %indvars.iv.next.i.i.1 = add nsw i64 %indvars.iv.i.i, -2, !dbg !415
  %idxprom8.i.i.1 = and i64 %indvars.iv.next.i.i.1, 4294967295, !dbg !416
  %arrayidx.i.i.1 = getelementptr inbounds double, double* %arrayidx17.i43, i64 %idxprom8.i.i.1, !dbg !416
  %16 = load double, double* %arrayidx.i.i.1, align 8, !dbg !416, !tbaa !75
  %arrayidx2.i.i.1 = getelementptr inbounds double, double* %12, i64 %idxprom8.i.i.1, !dbg !417
  %17 = load double, double* %arrayidx2.i.i.1, align 8, !dbg !418, !tbaa !75
  %18 = tail call double @llvm.fmuladd.f64(double %neg.i.i, double %16, double %17) #17, !dbg !418
  store double %18, double* %arrayidx2.i.i.1, align 8, !dbg !418, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i.1, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !405
  %cmp.i.i.1 = icmp ugt i64 %indvars.iv.next.i.i, 1, !dbg !410
  br i1 %cmp.i.i.1, label %for.body.i.i, label %for.body3.i.loopexit, !dbg !407

for.inc24.i:                                      ; preds = %for.body3.i.loopexit
  %indvars.iv.next50.i = add nuw nsw i64 %indvars.iv49.i, 1, !dbg !419
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next50.i, metadata !326, metadata !DIExpression()) #17, !dbg !401
  %exitcond52.not.i = icmp eq i64 %indvars.iv.next50.i, 16, !dbg !420
  br i1 %exitcond52.not.i, label %cleanup, label %for.cond1.preheader.i, !dbg !399, !llvm.loop !421

if.end:                                           ; preds = %entry
  %div = sdiv i32 %nb, 2, !dbg !423
  call void @llvm.dbg.value(metadata i32 %div, metadata !310, metadata !DIExpression()), !dbg !396
  %19 = load i32, i32* @nBlocks, align 4, !dbg !424, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %M, metadata !306, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %M, i32 %div), metadata !307, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !396
  %mul6 = mul nsw i32 %19, %div, !dbg !425
  %idxprom8 = sext i32 %mul6 to i64, !dbg !425
  %arrayidx9 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 %idxprom8, !dbg !425
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx9, metadata !308, metadata !DIExpression()), !dbg !396
  %add11 = add nsw i32 %mul6, %div, !dbg !426
  %idxprom12 = sext i32 %add11 to i64, !dbg !426
  %arrayidx13 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 %idxprom12, !dbg !426
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx13, metadata !309, metadata !DIExpression()), !dbg !396
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !427

det.achd:                                         ; preds = %if.end
  %idxprom4 = sext i32 %div to i64, !dbg !428
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %M, i64 %idxprom4), metadata !307, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !396
  %arrayidx5 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M, i64 %idxprom4, !dbg !428
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx5, metadata !307, metadata !DIExpression()), !dbg !396
  tail call void @aux_upper_solve([16 x [16 x double]]* noundef %M, [16 x [16 x double]]* noundef %arrayidx5, [16 x [16 x double]]* noundef %U, i32 noundef %div), !dbg !427
  reattach within %syncreg, label %det.cont, !dbg !427

det.cont:                                         ; preds = %det.achd, %if.end
  tail call void @aux_upper_solve([16 x [16 x double]]* noundef %arrayidx9, [16 x [16 x double]]* noundef %arrayidx13, [16 x [16 x double]]* noundef %U, i32 noundef %div), !dbg !429
  sync within %syncreg, label %cleanup, !dbg !430

cleanup:                                          ; preds = %det.cont, %for.inc24.i
  ret void, !dbg !431
}

; Function Attrs: nounwind uwtable
define dso_local void @lu([16 x [16 x double]]* noundef %M, i32 noundef %nb) local_unnamed_addr #6 !dbg !432 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !443
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %M, metadata !436, metadata !DIExpression()), !dbg !443
  call void @llvm.dbg.value(metadata i32 %nb, metadata !437, metadata !DIExpression()), !dbg !443
  %cmp65 = icmp eq i32 %nb, 1, !dbg !444
  br i1 %cmp65, label %for.body.i.preheader, label %if.end, !dbg !446

for.body.i.preheader:                             ; preds = %sync.continue, %entry
  %M.tr.lcssa = phi [16 x [16 x double]]* [ %M, %entry ], [ %arrayidx12, %sync.continue ]
  br label %for.body.i, !dbg !447

for.cond.loopexit.i:                              ; preds = %elem_daxmy.exit.loopexit.us.i, %for.body.i
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next56.i, metadata !455, metadata !DIExpression()) #17, !dbg !458
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !447
  %exitcond59.not.i = icmp eq i64 %indvars.iv.next56.i, 16, !dbg !459
  br i1 %exitcond59.not.i, label %cleanup, label %for.body.i, !dbg !447, !llvm.loop !461

for.body.i:                                       ; preds = %for.cond.loopexit.i, %for.body.i.preheader
  %indvars.iv55.i = phi i64 [ %indvars.iv.next56.i, %for.cond.loopexit.i ], [ 0, %for.body.i.preheader ]
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.cond.loopexit.i ], [ 1, %for.body.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv55.i, metadata !455, metadata !DIExpression()) #17, !dbg !458
  %0 = sub nsw i64 1, %indvars.iv55.i, !dbg !463
  %indvars.iv.next56.i = add nuw nsw i64 %indvars.iv55.i, 1, !dbg !463
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next56.i, metadata !454, metadata !DIExpression()) #17, !dbg !458
  %cmp248.i = icmp ult i64 %indvars.iv55.i, 15, !dbg !465
  br i1 %cmp248.i, label %for.body3.us.preheader.i, label %for.cond.loopexit.i, !dbg !467

for.body3.us.preheader.i:                         ; preds = %for.body.i
  %arrayidx5.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr.lcssa, i64 0, i64 %indvars.iv55.i, i64 %indvars.iv55.i
  %arrayidx18.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr.lcssa, i64 0, i64 %indvars.iv55.i, i64 %indvars.iv.next56.i
  %1 = sub nuw nsw i64 15, %indvars.iv55.i
  %xtraiter68 = and i64 %0, 1
  %lcmp.mod69.not = icmp eq i64 %xtraiter68, 0
  %indvars.iv.next.i.us.i.prol = sub nsw i64 14, %indvars.iv55.i
  %idxprom8.i.us.i.prol = and i64 %indvars.iv.next.i.us.i.prol, 4294967295
  %arrayidx.i.us.i.prol = getelementptr inbounds double, double* %arrayidx18.i, i64 %idxprom8.i.us.i.prol
  %2 = icmp eq i64 %indvars.iv55.i, 14
  br label %for.body3.us.i, !dbg !467

for.body3.us.i:                                   ; preds = %elem_daxmy.exit.loopexit.us.i, %for.body3.us.preheader.i
  %indvars.iv52.i = phi i64 [ %indvars.iv.i, %for.body3.us.preheader.i ], [ %indvars.iv.next53.i, %elem_daxmy.exit.loopexit.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv52.i, metadata !454, metadata !DIExpression()) #17, !dbg !458
  %3 = load double, double* %arrayidx5.i, align 8, !dbg !468, !tbaa !75
  %arrayidx9.us.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr.lcssa, i64 0, i64 %indvars.iv52.i, i64 %indvars.iv55.i, !dbg !470
  %4 = load double, double* %arrayidx9.us.i, align 8, !dbg !471, !tbaa !75
  %div.us.i = fdiv double %4, %3, !dbg !471
  store double %div.us.i, double* %arrayidx9.us.i, align 8, !dbg !471, !tbaa !75
  %arrayidx23.us.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr.lcssa, i64 0, i64 %indvars.iv52.i, i64 %indvars.iv.next56.i, !dbg !472
  call void @llvm.dbg.value(metadata double %div.us.i, metadata !141, metadata !DIExpression()) #17, !dbg !473
  call void @llvm.dbg.value(metadata double* %arrayidx18.i, metadata !142, metadata !DIExpression()) #17, !dbg !473
  call void @llvm.dbg.value(metadata double* %arrayidx23.us.i, metadata !143, metadata !DIExpression()) #17, !dbg !473
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i32 undef), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !473
  %neg.i.us.i = fneg double %div.us.i
  br i1 %lcmp.mod69.not, label %for.body.i.us.i.prol.loopexit, label %for.body.i.us.i.prol, !dbg !475

for.body.i.us.i.prol:                             ; preds = %for.body3.us.i
  %5 = load double, double* %arrayidx.i.us.i.prol, align 8, !dbg !476, !tbaa !75
  %arrayidx2.i.us.i.prol = getelementptr inbounds double, double* %arrayidx23.us.i, i64 %idxprom8.i.us.i.prol, !dbg !477
  %6 = load double, double* %arrayidx2.i.us.i.prol, align 8, !dbg !478, !tbaa !75
  %7 = tail call double @llvm.fmuladd.f64(double %neg.i.us.i, double %5, double %6) #17, !dbg !478
  store double %7, double* %arrayidx2.i.us.i.prol, align 8, !dbg !478, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.us.i.prol, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !473
  br label %for.body.i.us.i.prol.loopexit, !dbg !475

for.body.i.us.i.prol.loopexit:                    ; preds = %for.body.i.us.i.prol, %for.body3.us.i
  %indvars.iv.i.us.i.unr = phi i64 [ %1, %for.body3.us.i ], [ %indvars.iv.next.i.us.i.prol, %for.body.i.us.i.prol ]
  br i1 %2, label %elem_daxmy.exit.loopexit.us.i, label %for.body.i.us.i, !dbg !475

for.body.i.us.i:                                  ; preds = %for.body.i.us.i, %for.body.i.us.i.prol.loopexit
  %indvars.iv.i.us.i = phi i64 [ %indvars.iv.next.i.us.i.1, %for.body.i.us.i ], [ %indvars.iv.i.us.i.unr, %for.body.i.us.i.prol.loopexit ]
  %indvars.iv.next.i.us.i = add nsw i64 %indvars.iv.i.us.i, -1, !dbg !479
  %idxprom8.i.us.i = and i64 %indvars.iv.next.i.us.i, 4294967295, !dbg !476
  %arrayidx.i.us.i = getelementptr inbounds double, double* %arrayidx18.i, i64 %idxprom8.i.us.i, !dbg !476
  %8 = load double, double* %arrayidx.i.us.i, align 8, !dbg !476, !tbaa !75
  %arrayidx2.i.us.i = getelementptr inbounds double, double* %arrayidx23.us.i, i64 %idxprom8.i.us.i, !dbg !477
  %9 = load double, double* %arrayidx2.i.us.i, align 8, !dbg !478, !tbaa !75
  %10 = tail call double @llvm.fmuladd.f64(double %neg.i.us.i, double %8, double %9) #17, !dbg !478
  store double %10, double* %arrayidx2.i.us.i, align 8, !dbg !478, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.us.i, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !473
  %indvars.iv.next.i.us.i.1 = add nsw i64 %indvars.iv.i.us.i, -2, !dbg !479
  %idxprom8.i.us.i.1 = and i64 %indvars.iv.next.i.us.i.1, 4294967295, !dbg !476
  %arrayidx.i.us.i.1 = getelementptr inbounds double, double* %arrayidx18.i, i64 %idxprom8.i.us.i.1, !dbg !476
  %11 = load double, double* %arrayidx.i.us.i.1, align 8, !dbg !476, !tbaa !75
  %arrayidx2.i.us.i.1 = getelementptr inbounds double, double* %arrayidx23.us.i, i64 %idxprom8.i.us.i.1, !dbg !477
  %12 = load double, double* %arrayidx2.i.us.i.1, align 8, !dbg !478, !tbaa !75
  %13 = tail call double @llvm.fmuladd.f64(double %neg.i.us.i, double %11, double %12) #17, !dbg !478
  store double %13, double* %arrayidx2.i.us.i.1, align 8, !dbg !478, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.us.i.1, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !473
  %cmp.i.us.i.1 = icmp ugt i64 %indvars.iv.next.i.us.i, 1, !dbg !480
  br i1 %cmp.i.us.i.1, label %for.body.i.us.i, label %elem_daxmy.exit.loopexit.us.i, !dbg !475, !llvm.loop !481

elem_daxmy.exit.loopexit.us.i:                    ; preds = %for.body.i.us.i, %for.body.i.us.i.prol.loopexit
  %indvars.iv.next53.i = add nuw nsw i64 %indvars.iv52.i, 1, !dbg !483
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next53.i, metadata !454, metadata !DIExpression()) #17, !dbg !458
  %exitcond.not.i = icmp eq i64 %indvars.iv.next53.i, 16, !dbg !465
  br i1 %exitcond.not.i, label %for.cond.loopexit.i, label %for.body3.us.i, !dbg !467, !llvm.loop !484

if.end:                                           ; preds = %sync.continue, %entry
  %nb.tr67 = phi i32 [ %div, %sync.continue ], [ %nb, %entry ]
  %M.tr66 = phi [16 x [16 x double]]* [ %arrayidx12, %sync.continue ], [ %M, %entry ]
  call void @llvm.dbg.value(metadata i32 %nb.tr67, metadata !437, metadata !DIExpression()), !dbg !443
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %M.tr66, metadata !436, metadata !DIExpression()), !dbg !443
  %div = sdiv i32 %nb.tr67, 2, !dbg !486
  call void @llvm.dbg.value(metadata i32 %div, metadata !442, metadata !DIExpression()), !dbg !443
  %14 = load i32, i32* @nBlocks, align 4, !dbg !487, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %M.tr66, metadata !438, metadata !DIExpression()), !dbg !443
  %idxprom3 = sext i32 %div to i64, !dbg !488
  %arrayidx4 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr66, i64 %idxprom3, !dbg !488
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx4, metadata !439, metadata !DIExpression()), !dbg !443
  %mul5 = mul nsw i32 %14, %div, !dbg !489
  %idxprom7 = sext i32 %mul5 to i64, !dbg !489
  %arrayidx8 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr66, i64 %idxprom7, !dbg !489
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx8, metadata !440, metadata !DIExpression()), !dbg !443
  %add10 = add nsw i32 %mul5, %div, !dbg !490
  %idxprom11 = sext i32 %add10 to i64, !dbg !490
  %arrayidx12 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr66, i64 %idxprom11, !dbg !490
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx12, metadata !441, metadata !DIExpression()), !dbg !443
  tail call void @lu([16 x [16 x double]]* noundef %M.tr66, i32 noundef %div), !dbg !491
  detach within %syncreg, label %det.achd, label %det.cont.tf, !dbg !492

det.achd:                                         ; preds = %if.end
  %syncreg.i = tail call token @llvm.syncregion.start(), !dbg !493
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx4, metadata !203, metadata !DIExpression()) #17, !dbg !493
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %M.tr66, metadata !204, metadata !DIExpression()) #17, !dbg !493
  call void @llvm.dbg.value(metadata i32 %div, metadata !205, metadata !DIExpression()) #17, !dbg !493
  %15 = and i32 %nb.tr67, -2, !dbg !495
  %16 = icmp eq i32 %15, 2, !dbg !495
  br i1 %16, label %if.then.i, label %if.end.i, !dbg !496

if.then.i:                                        ; preds = %det.achd
  %arraydecay.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %arrayidx4, i64 0, i64 0, !dbg !497
  %arraydecay1.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr66, i64 0, i64 0, !dbg !498
  tail call fastcc void @block_lower_solve([16 x double]* noundef %arraydecay.i, [16 x double]* noundef %arraydecay1.i) #17, !dbg !499
  br label %lower_solve.exit, !dbg !500

if.end.i:                                         ; preds = %det.achd
  %div.i = sdiv i32 %nb.tr67, 4, !dbg !501
  call void @llvm.dbg.value(metadata i32 %div.i, metadata !210, metadata !DIExpression()) #17, !dbg !493
  %17 = load i32, i32* @nBlocks, align 4, !dbg !502, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx4, metadata !206, metadata !DIExpression()) #17, !dbg !493
  %idxprom4.i = sext i32 %div.i to i64, !dbg !503
  %arrayidx5.i40 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %arrayidx4, i64 %idxprom4.i, !dbg !503
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx5.i40, metadata !207, metadata !DIExpression()) #17, !dbg !493
  %mul6.i = mul nsw i32 %17, %div.i, !dbg !504
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %arrayidx4, i32 %mul6.i), metadata !208, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !493
  %add11.i = add nsw i32 %mul6.i, %div.i, !dbg !505
  %idxprom12.i = sext i32 %add11.i to i64, !dbg !505
  %arrayidx13.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %arrayidx4, i64 %idxprom12.i, !dbg !505
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx13.i, metadata !209, metadata !DIExpression()) #17, !dbg !493
  detach within %syncreg.i, label %det.achd.i, label %det.cont.i, !dbg !506

det.achd.i:                                       ; preds = %if.end.i
  %idxprom8.i = sext i32 %mul6.i to i64, !dbg !504
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %arrayidx4, i64 %idxprom8.i), metadata !208, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !493
  %arrayidx9.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %arrayidx4, i64 %idxprom8.i, !dbg !504
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx9.i, metadata !208, metadata !DIExpression()) #17, !dbg !493
  tail call void @aux_lower_solve([16 x [16 x double]]* noundef %arrayidx4, [16 x [16 x double]]* noundef %arrayidx9.i, [16 x [16 x double]]* noundef %M.tr66, i32 noundef %div.i) #17, !dbg !506
  reattach within %syncreg.i, label %det.cont.i, !dbg !506

det.cont.i:                                       ; preds = %det.achd.i, %if.end.i
  tail call void @aux_lower_solve([16 x [16 x double]]* noundef %arrayidx5.i40, [16 x [16 x double]]* noundef %arrayidx13.i, [16 x [16 x double]]* noundef %M.tr66, i32 noundef %div.i) #17, !dbg !507
  sync within %syncreg.i, label %lower_solve.exit, !dbg !508

lower_solve.exit:                                 ; preds = %det.cont.i, %if.then.i
  reattach within %syncreg, label %det.cont.tf, !dbg !492

det.cont.tf:                                      ; preds = %lower_solve.exit, %if.end
  %syncreg.i41 = tail call token @llvm.syncregion.start() #17, !dbg !509
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx8, metadata !303, metadata !DIExpression()) #17, !dbg !509
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %M.tr66, metadata !304, metadata !DIExpression()) #17, !dbg !509
  call void @llvm.dbg.value(metadata i32 %div, metadata !305, metadata !DIExpression()) #17, !dbg !509
  %18 = and i32 %nb.tr67, -2, !dbg !511
  %19 = icmp eq i32 %18, 2, !dbg !511
  br i1 %19, label %for.cond1.preheader.i.i.preheader, label %if.end.i50, !dbg !512

for.cond1.preheader.i.i.preheader:                ; preds = %det.cont.tf
  %arrayidx5.i.i55 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr66, i64 0, i64 0, i64 0
  %arrayidx17.i.i58 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr66, i64 0, i64 0, i64 1
  br label %for.cond1.preheader.i.i, !dbg !513

for.cond1.preheader.i.i:                          ; preds = %for.inc24.i.i, %for.cond1.preheader.i.i.preheader
  %indvars.iv49.i.i = phi i64 [ %indvars.iv.next50.i.i, %for.inc24.i.i ], [ 0, %for.cond1.preheader.i.i.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv49.i.i, metadata !326, metadata !DIExpression()) #17, !dbg !515
  call void @llvm.dbg.value(metadata i64 0, metadata !327, metadata !DIExpression()) #17, !dbg !515
  %20 = load double, double* %arrayidx5.i.i55, align 8, !dbg !516, !tbaa !75
  %arrayidx9.i.i56 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr66, i64 %idxprom7, i64 %indvars.iv49.i.i, i64 0, !dbg !517
  %21 = load double, double* %arrayidx9.i.i56, align 8, !dbg !518, !tbaa !75
  %div.i.i57 = fdiv double %21, %20, !dbg !518
  store double %div.i.i57, double* %arrayidx9.i.i56, align 8, !dbg !518, !tbaa !75
  call void @llvm.dbg.value(metadata double %div.i.i57, metadata !141, metadata !DIExpression()) #17, !dbg !519
  call void @llvm.dbg.value(metadata double* %arrayidx17.i.i58, metadata !142, metadata !DIExpression()) #17, !dbg !519
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %M.tr66, i64 %idxprom7, i64 %indvars.iv49.i.i), metadata !143, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg, 2, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_plus_uconst, 8, DW_OP_stack_value)) #17, !dbg !519
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 0), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !519
  br label %for.body.lr.ph.i.i.i, !dbg !521

for.body3.i.i.loopexit:                           ; preds = %for.body.i.i.i, %for.body.i.i.i.prol.loopexit
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i62, metadata !327, metadata !DIExpression()) #17, !dbg !515
  %arrayidx5.i.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr66, i64 0, i64 %indvars.iv.next.i.i62, i64 %indvars.iv.next.i.i62, !dbg !516
  %22 = load double, double* %arrayidx5.i.i, align 8, !dbg !516, !tbaa !75
  %23 = load double, double* %26, align 8, !dbg !518, !tbaa !75
  %div.i.i = fdiv double %23, %22, !dbg !518
  store double %div.i.i, double* %26, align 8, !dbg !518, !tbaa !75
  %indvars.iv.next.i.i = add nuw nsw i64 %indvars.iv.next.i.i62, 1, !dbg !522
  %arrayidx17.i.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr66, i64 0, i64 %indvars.iv.next.i.i62, i64 %indvars.iv.next.i.i, !dbg !522
  call void @llvm.dbg.value(metadata double %div.i.i, metadata !141, metadata !DIExpression()) #17, !dbg !519
  call void @llvm.dbg.value(metadata double* %arrayidx17.i.i, metadata !142, metadata !DIExpression()) #17, !dbg !519
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %M.tr66, i64 %idxprom7, i64 %indvars.iv49.i.i, i64 %indvars.iv.next.i.i), metadata !143, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg, 2, DW_OP_constu, 128, DW_OP_mul, DW_OP_plus, DW_OP_LLVM_arg, 3, DW_OP_constu, 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !519
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 %indvars.iv.next.i.i62), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !519
  %cmp10.i.not.i.i = icmp eq i64 %indvars.iv.next.i.i62, 15, !dbg !523
  %indvar.next = add i64 %indvar, 1, !dbg !521
  br i1 %cmp10.i.not.i.i, label %for.inc24.i.i, label %for.body.lr.ph.i.i.i, !dbg !521, !llvm.loop !524

for.body.lr.ph.i.i.i:                             ; preds = %for.body3.i.i.loopexit, %for.cond1.preheader.i.i
  %indvar = phi i64 [ 0, %for.cond1.preheader.i.i ], [ %indvar.next, %for.body3.i.i.loopexit ]
  %arrayidx17.i.i63 = phi double* [ %arrayidx17.i.i58, %for.cond1.preheader.i.i ], [ %arrayidx17.i.i, %for.body3.i.i.loopexit ]
  %indvars.iv.next.i.i62 = phi i64 [ 1, %for.cond1.preheader.i.i ], [ %indvars.iv.next.i.i, %for.body3.i.i.loopexit ]
  %div.i.i61 = phi double [ %div.i.i57, %for.cond1.preheader.i.i ], [ %div.i.i, %for.body3.i.i.loopexit ]
  %indvars.iv.i.i60 = phi i64 [ 0, %for.cond1.preheader.i.i ], [ %indvars.iv.next.i.i62, %for.body3.i.i.loopexit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i.i60, metadata !327, metadata !DIExpression()) #17, !dbg !515
  %24 = sub i64 1, %indvar, !dbg !527
  %25 = sub nuw nsw i64 15, %indvars.iv.i.i60, !dbg !527
  call void @llvm.dbg.value(metadata !DIArgList(i32 15, i64 %indvars.iv.i.i60), metadata !144, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !519
  %neg.i.i.i = fneg double %div.i.i61
  %26 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %M.tr66, i64 %idxprom7, i64 %indvars.iv49.i.i, i64 %indvars.iv.next.i.i62
  %xtraiter = and i64 %24, 1, !dbg !521
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !521
  br i1 %lcmp.mod.not, label %for.body.i.i.i.prol.loopexit, label %for.body.i.i.i.prol, !dbg !521

for.body.i.i.i.prol:                              ; preds = %for.body.lr.ph.i.i.i
  %indvars.iv.next.i.i.i.prol = sub nsw i64 14, %indvars.iv.i.i60, !dbg !528
  %idxprom8.i.i.i.prol = and i64 %indvars.iv.next.i.i.i.prol, 4294967295, !dbg !529
  %arrayidx.i.i.i.prol = getelementptr inbounds double, double* %arrayidx17.i.i63, i64 %idxprom8.i.i.i.prol, !dbg !529
  %27 = load double, double* %arrayidx.i.i.i.prol, align 8, !dbg !529, !tbaa !75
  %arrayidx2.i.i.i.prol = getelementptr inbounds double, double* %26, i64 %idxprom8.i.i.i.prol, !dbg !530
  %28 = load double, double* %arrayidx2.i.i.i.prol, align 8, !dbg !531, !tbaa !75
  %29 = tail call double @llvm.fmuladd.f64(double %neg.i.i.i, double %27, double %28) #17, !dbg !531
  store double %29, double* %arrayidx2.i.i.i.prol, align 8, !dbg !531, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i.i.prol, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !519
  br label %for.body.i.i.i.prol.loopexit, !dbg !521

for.body.i.i.i.prol.loopexit:                     ; preds = %for.body.i.i.i.prol, %for.body.lr.ph.i.i.i
  %indvars.iv.i.i.i.unr = phi i64 [ %25, %for.body.lr.ph.i.i.i ], [ %indvars.iv.next.i.i.i.prol, %for.body.i.i.i.prol ]
  %30 = icmp eq i64 %indvar, 14, !dbg !521
  br i1 %30, label %for.body3.i.i.loopexit, label %for.body.i.i.i, !dbg !521

for.body.i.i.i:                                   ; preds = %for.body.i.i.i, %for.body.i.i.i.prol.loopexit
  %indvars.iv.i.i.i = phi i64 [ %indvars.iv.next.i.i.i.1, %for.body.i.i.i ], [ %indvars.iv.i.i.i.unr, %for.body.i.i.i.prol.loopexit ]
  %indvars.iv.next.i.i.i = add nsw i64 %indvars.iv.i.i.i, -1, !dbg !528
  %idxprom8.i.i.i = and i64 %indvars.iv.next.i.i.i, 4294967295, !dbg !529
  %arrayidx.i.i.i = getelementptr inbounds double, double* %arrayidx17.i.i63, i64 %idxprom8.i.i.i, !dbg !529
  %31 = load double, double* %arrayidx.i.i.i, align 8, !dbg !529, !tbaa !75
  %arrayidx2.i.i.i = getelementptr inbounds double, double* %26, i64 %idxprom8.i.i.i, !dbg !530
  %32 = load double, double* %arrayidx2.i.i.i, align 8, !dbg !531, !tbaa !75
  %33 = tail call double @llvm.fmuladd.f64(double %neg.i.i.i, double %31, double %32) #17, !dbg !531
  store double %33, double* %arrayidx2.i.i.i, align 8, !dbg !531, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i.i, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !519
  %indvars.iv.next.i.i.i.1 = add nsw i64 %indvars.iv.i.i.i, -2, !dbg !528
  %idxprom8.i.i.i.1 = and i64 %indvars.iv.next.i.i.i.1, 4294967295, !dbg !529
  %arrayidx.i.i.i.1 = getelementptr inbounds double, double* %arrayidx17.i.i63, i64 %idxprom8.i.i.i.1, !dbg !529
  %34 = load double, double* %arrayidx.i.i.i.1, align 8, !dbg !529, !tbaa !75
  %arrayidx2.i.i.i.1 = getelementptr inbounds double, double* %26, i64 %idxprom8.i.i.i.1, !dbg !530
  %35 = load double, double* %arrayidx2.i.i.i.1, align 8, !dbg !531, !tbaa !75
  %36 = tail call double @llvm.fmuladd.f64(double %neg.i.i.i, double %34, double %35) #17, !dbg !531
  store double %36, double* %arrayidx2.i.i.i.1, align 8, !dbg !531, !tbaa !75
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i.i.i.1, metadata !144, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)) #17, !dbg !519
  %cmp.i.i.i.1 = icmp ugt i64 %indvars.iv.next.i.i.i, 1, !dbg !523
  br i1 %cmp.i.i.i.1, label %for.body.i.i.i, label %for.body3.i.i.loopexit, !dbg !521

for.inc24.i.i:                                    ; preds = %for.body3.i.i.loopexit
  %indvars.iv.next50.i.i = add nuw nsw i64 %indvars.iv49.i.i, 1, !dbg !532
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next50.i.i, metadata !326, metadata !DIExpression()) #17, !dbg !515
  %exitcond52.not.i.i = icmp eq i64 %indvars.iv.next50.i.i, 16, !dbg !533
  br i1 %exitcond52.not.i.i, label %upper_solve.exit.tfend, label %for.cond1.preheader.i.i, !dbg !513, !llvm.loop !534

if.end.i50:                                       ; preds = %det.cont.tf
  %div.i43 = sdiv i32 %nb.tr67, 4, !dbg !536
  call void @llvm.dbg.value(metadata i32 %div.i43, metadata !310, metadata !DIExpression()) #17, !dbg !509
  %37 = load i32, i32* @nBlocks, align 4, !dbg !537, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx8, metadata !306, metadata !DIExpression()) #17, !dbg !509
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %arrayidx8, i32 %div.i43), metadata !307, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !509
  %mul6.i44 = mul nsw i32 %37, %div.i43, !dbg !538
  %idxprom8.i45 = sext i32 %mul6.i44 to i64, !dbg !538
  %arrayidx9.i46 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %arrayidx8, i64 %idxprom8.i45, !dbg !538
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx9.i46, metadata !308, metadata !DIExpression()) #17, !dbg !509
  %add11.i47 = add nsw i32 %mul6.i44, %div.i43, !dbg !539
  %idxprom12.i48 = sext i32 %add11.i47 to i64, !dbg !539
  %arrayidx13.i49 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %arrayidx8, i64 %idxprom12.i48, !dbg !539
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx13.i49, metadata !309, metadata !DIExpression()) #17, !dbg !509
  detach within %syncreg.i41, label %det.achd.i53, label %det.cont.i54, !dbg !540

det.achd.i53:                                     ; preds = %if.end.i50
  %idxprom4.i51 = sext i32 %div.i43 to i64, !dbg !541
  call void @llvm.dbg.value(metadata !DIArgList([16 x [16 x double]]* %arrayidx8, i64 %idxprom4.i51), metadata !307, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 2048, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #17, !dbg !509
  %arrayidx5.i52 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %arrayidx8, i64 %idxprom4.i51, !dbg !541
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx5.i52, metadata !307, metadata !DIExpression()) #17, !dbg !509
  tail call void @aux_upper_solve([16 x [16 x double]]* noundef %arrayidx8, [16 x [16 x double]]* noundef %arrayidx5.i52, [16 x [16 x double]]* noundef %M.tr66, i32 noundef %div.i43) #17, !dbg !540
  reattach within %syncreg.i41, label %det.cont.i54, !dbg !540

det.cont.i54:                                     ; preds = %det.achd.i53, %if.end.i50
  tail call void @aux_upper_solve([16 x [16 x double]]* noundef %arrayidx9.i46, [16 x [16 x double]]* noundef %arrayidx13.i49, [16 x [16 x double]]* noundef %M.tr66, i32 noundef %div.i43) #17, !dbg !542
  sync within %syncreg.i41, label %upper_solve.exit.tfend, !dbg !543

upper_solve.exit.tfend:                           ; preds = %det.cont.i54, %for.inc24.i.i
  sync within %syncreg, label %sync.continue, !dbg !544

sync.continue:                                    ; preds = %upper_solve.exit.tfend
  tail call void @schur([16 x [16 x double]]* noundef %arrayidx12, [16 x [16 x double]]* noundef %arrayidx8, [16 x [16 x double]]* noundef %arrayidx4, i32 noundef %div), !dbg !545
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %arrayidx12, metadata !436, metadata !DIExpression()), !dbg !443
  call void @llvm.dbg.value(metadata i32 %div, metadata !437, metadata !DIExpression()), !dbg !443
  br i1 %19, label %for.body.i.preheader, label %if.end, !dbg !446

cleanup:                                          ; preds = %for.cond.loopexit.i
  ret void, !dbg !546
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @usage() local_unnamed_addr #9 !dbg !547 {
entry:
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @str, i64 0, i64 0)), !dbg !551
  %puts6 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([9 x i8], [9 x i8]* @str.20, i64 0, i64 0)), !dbg !552
  %puts7 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([70 x i8], [70 x i8]* @str.21, i64 0, i64 0)), !dbg !553
  %puts8 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([50 x i8], [50 x i8]* @str.22, i64 0, i64 0)), !dbg !554
  %puts9 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @str.23, i64 0, i64 0)), !dbg !555
  %call5 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i32 noundef 256), !dbg !556
  ret i32 1, !dbg !557
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #10

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @invalid_input(i32 noundef %n) local_unnamed_addr #9 !dbg !558 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !562, metadata !DIExpression()), !dbg !564
  call void @llvm.dbg.value(metadata i32 %n, metadata !563, metadata !DIExpression()), !dbg !564
  %cmp = icmp slt i32 %n, 16, !dbg !565
  br i1 %cmp, label %cleanup.sink.split, label %while.cond, !dbg !567

while.cond:                                       ; preds = %while.cond, %entry
  %v.0 = phi i32 [ %shr, %while.cond ], [ %n, %entry ], !dbg !564
  call void @llvm.dbg.value(metadata i32 %v.0, metadata !563, metadata !DIExpression()), !dbg !564
  %and = and i32 %v.0, 1, !dbg !568
  %tobool.not = icmp eq i32 %and, 0, !dbg !569
  %shr = ashr i32 %v.0, 1, !dbg !570
  call void @llvm.dbg.value(metadata i32 %shr, metadata !563, metadata !DIExpression()), !dbg !564
  br i1 %tobool.not, label %while.cond, label %while.end, !dbg !571, !llvm.loop !572

while.end:                                        ; preds = %while.cond
  %cmp1.not = icmp eq i32 %v.0, 1, !dbg !574
  br i1 %cmp1.not, label %cleanup, label %cleanup.sink.split, !dbg !576

cleanup.sink.split:                               ; preds = %while.end, %entry
  %puts.i9 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @str, i64 0, i64 0)) #17, !dbg !564
  %puts6.i10 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([9 x i8], [9 x i8]* @str.20, i64 0, i64 0)) #17, !dbg !564
  %puts7.i11 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([70 x i8], [70 x i8]* @str.21, i64 0, i64 0)) #17, !dbg !564
  %puts8.i12 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([50 x i8], [50 x i8]* @str.22, i64 0, i64 0)) #17, !dbg !564
  %puts9.i13 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @str.23, i64 0, i64 0)) #17, !dbg !564
  %call5.i14 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i32 noundef 256) #17, !dbg !564
  br label %cleanup, !dbg !577

cleanup:                                          ; preds = %cleanup.sink.split, %while.end
  %retval.0 = phi i32 [ 0, %while.end ], [ 1, %cleanup.sink.split ], !dbg !564
  ret i32 %retval.0, !dbg !577
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** noundef %argv) local_unnamed_addr #6 !dbg !578 {
entry:
  %print = alloca i32, align 4
  %test = alloca i32, align 4
  %n = alloca i32, align 4
  %benchmark = alloca i32, align 4
  %help = alloca i32, align 4
  %round = alloca i32, align 4
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !584, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata i8** %argv, metadata !585, metadata !DIExpression()), !dbg !602
  %0 = bitcast i32* %print to i8*, !dbg !603
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #17, !dbg !603
  %1 = bitcast i32* %test to i8*, !dbg !603
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #17, !dbg !603
  %2 = bitcast i32* %n to i8*, !dbg !603
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #17, !dbg !603
  %3 = bitcast i32* %benchmark to i8*, !dbg !603
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #17, !dbg !603
  %4 = bitcast i32* %help to i8*, !dbg !603
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #17, !dbg !603
  %5 = bitcast i32* %round to i8*, !dbg !603
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #17, !dbg !603
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* null, metadata !594, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata i32 256, metadata !588, metadata !DIExpression()), !dbg !602
  store i32 256, i32* %n, align 4, !dbg !604, !tbaa !166
  call void @llvm.dbg.value(metadata i32 0, metadata !586, metadata !DIExpression()), !dbg !602
  store i32 0, i32* %print, align 4, !dbg !605, !tbaa !166
  call void @llvm.dbg.value(metadata i32 0, metadata !587, metadata !DIExpression()), !dbg !602
  store i32 0, i32* %test, align 4, !dbg !606, !tbaa !166
  call void @llvm.dbg.value(metadata i32 1, metadata !592, metadata !DIExpression()), !dbg !602
  store i32 1, i32* %round, align 4, !dbg !607, !tbaa !166
  call void @llvm.dbg.value(metadata i32* %print, metadata !586, metadata !DIExpression(DW_OP_deref)), !dbg !602
  call void @llvm.dbg.value(metadata i32* %test, metadata !587, metadata !DIExpression(DW_OP_deref)), !dbg !602
  call void @llvm.dbg.value(metadata i32* %n, metadata !588, metadata !DIExpression(DW_OP_deref)), !dbg !602
  call void @llvm.dbg.value(metadata i32* %benchmark, metadata !589, metadata !DIExpression(DW_OP_deref)), !dbg !602
  call void @llvm.dbg.value(metadata i32* %help, metadata !590, metadata !DIExpression(DW_OP_deref)), !dbg !602
  call void @llvm.dbg.value(metadata i32* %round, metadata !592, metadata !DIExpression(DW_OP_deref)), !dbg !602
  call void (i32, i8**, i8**, i32*, ...) @get_options(i32 noundef %argc, i8** noundef %argv, i8** noundef getelementptr inbounds ([7 x i8*], [7 x i8*]* @specifiers, i64 0, i64 0), i32* noundef getelementptr inbounds ([7 x i32], [7 x i32]* @opt_types, i64 0, i64 0), i32* noundef nonnull %n, i32* noundef nonnull %print, i32* noundef nonnull %test, i32* noundef nonnull %benchmark, i32* noundef nonnull %help, i32* noundef nonnull %round) #17, !dbg !608
  %6 = load i32, i32* %help, align 4, !dbg !609, !tbaa !166
  call void @llvm.dbg.value(metadata i32 %6, metadata !590, metadata !DIExpression()), !dbg !602
  %tobool.not = icmp eq i32 %6, 0, !dbg !609
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !611

if.then:                                          ; preds = %entry
  %puts.i = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @str, i64 0, i64 0)) #17, !dbg !612
  %puts6.i = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([9 x i8], [9 x i8]* @str.20, i64 0, i64 0)) #17, !dbg !614
  %puts7.i = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([70 x i8], [70 x i8]* @str.21, i64 0, i64 0)) #17, !dbg !615
  %puts8.i = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([50 x i8], [50 x i8]* @str.22, i64 0, i64 0)) #17, !dbg !616
  %puts9.i = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @str.23, i64 0, i64 0)) #17, !dbg !617
  %call5.i = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i32 noundef 256) #17, !dbg !618
  br label %cleanup51, !dbg !619

if.end:                                           ; preds = %entry
  %7 = load i32, i32* %benchmark, align 4, !dbg !620, !tbaa !166
  call void @llvm.dbg.value(metadata i32 %7, metadata !589, metadata !DIExpression()), !dbg !602
  switch i32 %7, label %if.end5 [
    i32 3, label %sw.bb4
    i32 1, label %sw.bb
    i32 2, label %sw.bb3
  ], !dbg !622

sw.bb:                                            ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 16, metadata !588, metadata !DIExpression()), !dbg !602
  store i32 16, i32* %n, align 4, !dbg !623, !tbaa !166
  br label %if.end5, !dbg !626

sw.bb3:                                           ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 256, metadata !588, metadata !DIExpression()), !dbg !602
  store i32 256, i32* %n, align 4, !dbg !627, !tbaa !166
  br label %if.end5, !dbg !628

sw.bb4:                                           ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 2048, metadata !588, metadata !DIExpression()), !dbg !602
  store i32 2048, i32* %n, align 4, !dbg !629, !tbaa !166
  br label %if.end5, !dbg !630

if.end5:                                          ; preds = %sw.bb4, %sw.bb3, %sw.bb, %if.end
  call void @startup_cilk(), !dbg !631
  %8 = load i32, i32* %n, align 4, !dbg !632, !tbaa !166
  call void @llvm.dbg.value(metadata i32 %8, metadata !588, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.value(metadata i32 %8, metadata !562, metadata !DIExpression()) #17, !dbg !634
  call void @llvm.dbg.value(metadata i32 %8, metadata !563, metadata !DIExpression()) #17, !dbg !634
  %cmp.i = icmp slt i32 %8, 16, !dbg !636
  br i1 %cmp.i, label %invalid_input.exit, label %while.cond.i, !dbg !637

while.cond.i:                                     ; preds = %while.cond.i, %if.end5
  %v.0.i = phi i32 [ %shr.i, %while.cond.i ], [ %8, %if.end5 ], !dbg !634
  call void @llvm.dbg.value(metadata i32 %v.0.i, metadata !563, metadata !DIExpression()) #17, !dbg !634
  %and.i = and i32 %v.0.i, 1, !dbg !638
  %tobool.not.i = icmp eq i32 %and.i, 0, !dbg !639
  %shr.i = ashr i32 %v.0.i, 1, !dbg !640
  call void @llvm.dbg.value(metadata i32 %shr.i, metadata !563, metadata !DIExpression()) #17, !dbg !634
  br i1 %tobool.not.i, label %while.cond.i, label %while.end.i, !dbg !641, !llvm.loop !642

while.end.i:                                      ; preds = %while.cond.i
  %cmp1.not.i = icmp eq i32 %v.0.i, 1, !dbg !644
  br i1 %cmp1.not.i, label %if.end9, label %invalid_input.exit, !dbg !645

invalid_input.exit:                               ; preds = %while.end.i, %if.end5
  %puts.i9.i = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @str, i64 0, i64 0)) #17, !dbg !634
  %puts6.i10.i = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([9 x i8], [9 x i8]* @str.20, i64 0, i64 0)) #17, !dbg !634
  %puts7.i11.i = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([70 x i8], [70 x i8]* @str.21, i64 0, i64 0)) #17, !dbg !634
  %puts8.i12.i = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([50 x i8], [50 x i8]* @str.22, i64 0, i64 0)) #17, !dbg !634
  %puts9.i13.i = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([24 x i8], [24 x i8]* @str.23, i64 0, i64 0)) #17, !dbg !634
  %call5.i14.i = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([20 x i8], [20 x i8]* @.str.5, i64 0, i64 0), i32 noundef 256) #17, !dbg !634
  br label %cleanup51, !dbg !646

if.end9:                                          ; preds = %while.end.i
  call void @llvm.dbg.value(metadata i32 %8, metadata !588, metadata !DIExpression()), !dbg !602
  %div = sdiv i32 %8, 16, !dbg !647
  store i32 %div, i32* @nBlocks, align 4, !dbg !648, !tbaa !166
  %mul = mul nsw i32 %8, %8, !dbg !649
  %conv = zext i32 %mul to i64, !dbg !650
  %mul10 = shl nuw nsw i64 %conv, 3, !dbg !651
  %call11 = call noalias i8* @malloc(i64 noundef %mul10) #17, !dbg !652
  %9 = bitcast i8* %call11 to [16 x [16 x double]]*, !dbg !653
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %9, metadata !593, metadata !DIExpression()), !dbg !602
  %tobool12.not = icmp eq i8* %call11, null, !dbg !654
  br i1 %tobool12.not, label %if.then13, label %for.cond.preheader, !dbg !656

for.cond.preheader:                               ; preds = %if.end9
  call void @llvm.dbg.value(metadata i32 0, metadata !595, metadata !DIExpression()), !dbg !657
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* undef, metadata !594, metadata !DIExpression()), !dbg !602
  %10 = load i32, i32* %round, align 4, !dbg !658, !tbaa !166
  call void @llvm.dbg.value(metadata i32 %10, metadata !592, metadata !DIExpression()), !dbg !602
  %cmp133 = icmp sgt i32 %10, 0, !dbg !659
  br i1 %cmp133, label %for.body.lr.ph, label %for.end, !dbg !660

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %11 = bitcast %struct.timeval* %t1 to i8*
  %12 = bitcast %struct.timeval* %t2 to i8*
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1
  %tv_sec.i84 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0
  %tv_usec.i86 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1
  br label %for.body, !dbg !660

if.then13:                                        ; preds = %if.end9
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !661, !tbaa !663
  %14 = call i64 @fwrite(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i64 0, i64 0), i64 19, i64 1, %struct._IO_FILE* %13) #18, !dbg !665
  br label %cleanup51, !dbg !666

for.body:                                         ; preds = %if.end50.for.body_crit_edge, %for.body.lr.ph
  %15 = phi i32 [ %.pre, %if.end50.for.body_crit_edge ], [ %div, %for.body.lr.ph ], !dbg !667
  %r.0134 = phi i32 [ %inc, %if.end50.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  call void @llvm.dbg.value(metadata i32 %r.0134, metadata !595, metadata !DIExpression()), !dbg !657
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %9, metadata !668, metadata !DIExpression()) #17, !dbg !678
  call void @llvm.dbg.value(metadata i32 %15, metadata !671, metadata !DIExpression()) #17, !dbg !678
  call void @srand(i32 noundef 1) #17, !dbg !680
  call void @llvm.dbg.value(metadata i32 0, metadata !672, metadata !DIExpression()) #17, !dbg !678
  %cmp73.i = icmp sgt i32 %15, 0, !dbg !681
  br i1 %cmp73.i, label %for.cond1.preheader.us.i, label %init_matrix.exit, !dbg !684

for.cond1.preheader.us.i:                         ; preds = %for.cond1.for.inc20_crit_edge.us.i, %for.body
  %I.074.us.i = phi i32 [ %inc21.us.i, %for.cond1.for.inc20_crit_edge.us.i ], [ 0, %for.body ]
  call void @llvm.dbg.value(metadata i32 %I.074.us.i, metadata !672, metadata !DIExpression()) #17, !dbg !678
  call void @llvm.dbg.value(metadata i32 0, metadata !673, metadata !DIExpression()) #17, !dbg !678
  br label %for.cond4.preheader.us.i, !dbg !685

for.inc17.us.i:                                   ; preds = %for.cond7.preheader.us.i
  %inc18.us.i = add nuw nsw i32 %J.072.us.i, 1, !dbg !687
  call void @llvm.dbg.value(metadata i32 %inc18.us.i, metadata !673, metadata !DIExpression()) #17, !dbg !678
  %exitcond81.not.i = icmp eq i32 %inc18.us.i, %15, !dbg !689
  br i1 %exitcond81.not.i, label %for.cond1.for.inc20_crit_edge.us.i, label %for.cond4.preheader.us.i, !dbg !685, !llvm.loop !690

for.cond7.preheader.us.i:                         ; preds = %for.cond4.preheader.us.i, %for.cond7.preheader.us.i
  %indvars.iv.i = phi i64 [ 0, %for.cond4.preheader.us.i ], [ %indvars.iv.next.i, %for.cond7.preheader.us.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !675, metadata !DIExpression()) #17, !dbg !678
  call void @llvm.dbg.value(metadata i64 0, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.i = call i32 @rand() #17, !dbg !692
  %conv.us.i = sitofp i32 %call.us.i to double, !dbg !697
  %div.us.i = fdiv double %conv.us.i, 0x41DFFFFFFFC00000, !dbg !698
  %16 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.i = mul nsw i32 %16, %I.074.us.i, !dbg !699
  %add.us.i = add nsw i32 %mul.us.i, %J.072.us.i, !dbg !699
  %idxprom.us.i = sext i32 %add.us.i to i64, !dbg !699
  %arrayidx13.us.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.i, i64 %indvars.iv.i, i64 0, !dbg !699
  store double %div.us.i, double* %arrayidx13.us.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 1, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.1.i = call i32 @rand() #17, !dbg !692
  %conv.us.1.i = sitofp i32 %call.us.1.i to double, !dbg !697
  %div.us.1.i = fdiv double %conv.us.1.i, 0x41DFFFFFFFC00000, !dbg !698
  %17 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.1.i = mul nsw i32 %17, %I.074.us.i, !dbg !699
  %add.us.1.i = add nsw i32 %mul.us.1.i, %J.072.us.i, !dbg !699
  %idxprom.us.1.i = sext i32 %add.us.1.i to i64, !dbg !699
  %arrayidx13.us.1.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.1.i, i64 %indvars.iv.i, i64 1, !dbg !699
  store double %div.us.1.i, double* %arrayidx13.us.1.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 2, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.2.i = call i32 @rand() #17, !dbg !692
  %conv.us.2.i = sitofp i32 %call.us.2.i to double, !dbg !697
  %div.us.2.i = fdiv double %conv.us.2.i, 0x41DFFFFFFFC00000, !dbg !698
  %18 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.2.i = mul nsw i32 %18, %I.074.us.i, !dbg !699
  %add.us.2.i = add nsw i32 %mul.us.2.i, %J.072.us.i, !dbg !699
  %idxprom.us.2.i = sext i32 %add.us.2.i to i64, !dbg !699
  %arrayidx13.us.2.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.2.i, i64 %indvars.iv.i, i64 2, !dbg !699
  store double %div.us.2.i, double* %arrayidx13.us.2.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 3, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.3.i = call i32 @rand() #17, !dbg !692
  %conv.us.3.i = sitofp i32 %call.us.3.i to double, !dbg !697
  %div.us.3.i = fdiv double %conv.us.3.i, 0x41DFFFFFFFC00000, !dbg !698
  %19 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.3.i = mul nsw i32 %19, %I.074.us.i, !dbg !699
  %add.us.3.i = add nsw i32 %mul.us.3.i, %J.072.us.i, !dbg !699
  %idxprom.us.3.i = sext i32 %add.us.3.i to i64, !dbg !699
  %arrayidx13.us.3.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.3.i, i64 %indvars.iv.i, i64 3, !dbg !699
  store double %div.us.3.i, double* %arrayidx13.us.3.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 4, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.4.i = call i32 @rand() #17, !dbg !692
  %conv.us.4.i = sitofp i32 %call.us.4.i to double, !dbg !697
  %div.us.4.i = fdiv double %conv.us.4.i, 0x41DFFFFFFFC00000, !dbg !698
  %20 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.4.i = mul nsw i32 %20, %I.074.us.i, !dbg !699
  %add.us.4.i = add nsw i32 %mul.us.4.i, %J.072.us.i, !dbg !699
  %idxprom.us.4.i = sext i32 %add.us.4.i to i64, !dbg !699
  %arrayidx13.us.4.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.4.i, i64 %indvars.iv.i, i64 4, !dbg !699
  store double %div.us.4.i, double* %arrayidx13.us.4.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 5, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.5.i = call i32 @rand() #17, !dbg !692
  %conv.us.5.i = sitofp i32 %call.us.5.i to double, !dbg !697
  %div.us.5.i = fdiv double %conv.us.5.i, 0x41DFFFFFFFC00000, !dbg !698
  %21 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.5.i = mul nsw i32 %21, %I.074.us.i, !dbg !699
  %add.us.5.i = add nsw i32 %mul.us.5.i, %J.072.us.i, !dbg !699
  %idxprom.us.5.i = sext i32 %add.us.5.i to i64, !dbg !699
  %arrayidx13.us.5.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.5.i, i64 %indvars.iv.i, i64 5, !dbg !699
  store double %div.us.5.i, double* %arrayidx13.us.5.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 6, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.6.i = call i32 @rand() #17, !dbg !692
  %conv.us.6.i = sitofp i32 %call.us.6.i to double, !dbg !697
  %div.us.6.i = fdiv double %conv.us.6.i, 0x41DFFFFFFFC00000, !dbg !698
  %22 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.6.i = mul nsw i32 %22, %I.074.us.i, !dbg !699
  %add.us.6.i = add nsw i32 %mul.us.6.i, %J.072.us.i, !dbg !699
  %idxprom.us.6.i = sext i32 %add.us.6.i to i64, !dbg !699
  %arrayidx13.us.6.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.6.i, i64 %indvars.iv.i, i64 6, !dbg !699
  store double %div.us.6.i, double* %arrayidx13.us.6.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 7, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.7.i = call i32 @rand() #17, !dbg !692
  %conv.us.7.i = sitofp i32 %call.us.7.i to double, !dbg !697
  %div.us.7.i = fdiv double %conv.us.7.i, 0x41DFFFFFFFC00000, !dbg !698
  %23 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.7.i = mul nsw i32 %23, %I.074.us.i, !dbg !699
  %add.us.7.i = add nsw i32 %mul.us.7.i, %J.072.us.i, !dbg !699
  %idxprom.us.7.i = sext i32 %add.us.7.i to i64, !dbg !699
  %arrayidx13.us.7.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.7.i, i64 %indvars.iv.i, i64 7, !dbg !699
  store double %div.us.7.i, double* %arrayidx13.us.7.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 8, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.8.i = call i32 @rand() #17, !dbg !692
  %conv.us.8.i = sitofp i32 %call.us.8.i to double, !dbg !697
  %div.us.8.i = fdiv double %conv.us.8.i, 0x41DFFFFFFFC00000, !dbg !698
  %24 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.8.i = mul nsw i32 %24, %I.074.us.i, !dbg !699
  %add.us.8.i = add nsw i32 %mul.us.8.i, %J.072.us.i, !dbg !699
  %idxprom.us.8.i = sext i32 %add.us.8.i to i64, !dbg !699
  %arrayidx13.us.8.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.8.i, i64 %indvars.iv.i, i64 8, !dbg !699
  store double %div.us.8.i, double* %arrayidx13.us.8.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 9, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.9.i = call i32 @rand() #17, !dbg !692
  %conv.us.9.i = sitofp i32 %call.us.9.i to double, !dbg !697
  %div.us.9.i = fdiv double %conv.us.9.i, 0x41DFFFFFFFC00000, !dbg !698
  %25 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.9.i = mul nsw i32 %25, %I.074.us.i, !dbg !699
  %add.us.9.i = add nsw i32 %mul.us.9.i, %J.072.us.i, !dbg !699
  %idxprom.us.9.i = sext i32 %add.us.9.i to i64, !dbg !699
  %arrayidx13.us.9.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.9.i, i64 %indvars.iv.i, i64 9, !dbg !699
  store double %div.us.9.i, double* %arrayidx13.us.9.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 10, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.10.i = call i32 @rand() #17, !dbg !692
  %conv.us.10.i = sitofp i32 %call.us.10.i to double, !dbg !697
  %div.us.10.i = fdiv double %conv.us.10.i, 0x41DFFFFFFFC00000, !dbg !698
  %26 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.10.i = mul nsw i32 %26, %I.074.us.i, !dbg !699
  %add.us.10.i = add nsw i32 %mul.us.10.i, %J.072.us.i, !dbg !699
  %idxprom.us.10.i = sext i32 %add.us.10.i to i64, !dbg !699
  %arrayidx13.us.10.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.10.i, i64 %indvars.iv.i, i64 10, !dbg !699
  store double %div.us.10.i, double* %arrayidx13.us.10.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 11, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.11.i = call i32 @rand() #17, !dbg !692
  %conv.us.11.i = sitofp i32 %call.us.11.i to double, !dbg !697
  %div.us.11.i = fdiv double %conv.us.11.i, 0x41DFFFFFFFC00000, !dbg !698
  %27 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.11.i = mul nsw i32 %27, %I.074.us.i, !dbg !699
  %add.us.11.i = add nsw i32 %mul.us.11.i, %J.072.us.i, !dbg !699
  %idxprom.us.11.i = sext i32 %add.us.11.i to i64, !dbg !699
  %arrayidx13.us.11.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.11.i, i64 %indvars.iv.i, i64 11, !dbg !699
  store double %div.us.11.i, double* %arrayidx13.us.11.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 12, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.12.i = call i32 @rand() #17, !dbg !692
  %conv.us.12.i = sitofp i32 %call.us.12.i to double, !dbg !697
  %div.us.12.i = fdiv double %conv.us.12.i, 0x41DFFFFFFFC00000, !dbg !698
  %28 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.12.i = mul nsw i32 %28, %I.074.us.i, !dbg !699
  %add.us.12.i = add nsw i32 %mul.us.12.i, %J.072.us.i, !dbg !699
  %idxprom.us.12.i = sext i32 %add.us.12.i to i64, !dbg !699
  %arrayidx13.us.12.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.12.i, i64 %indvars.iv.i, i64 12, !dbg !699
  store double %div.us.12.i, double* %arrayidx13.us.12.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 13, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.13.i = call i32 @rand() #17, !dbg !692
  %conv.us.13.i = sitofp i32 %call.us.13.i to double, !dbg !697
  %div.us.13.i = fdiv double %conv.us.13.i, 0x41DFFFFFFFC00000, !dbg !698
  %29 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.13.i = mul nsw i32 %29, %I.074.us.i, !dbg !699
  %add.us.13.i = add nsw i32 %mul.us.13.i, %J.072.us.i, !dbg !699
  %idxprom.us.13.i = sext i32 %add.us.13.i to i64, !dbg !699
  %arrayidx13.us.13.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.13.i, i64 %indvars.iv.i, i64 13, !dbg !699
  store double %div.us.13.i, double* %arrayidx13.us.13.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 14, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.14.i = call i32 @rand() #17, !dbg !692
  %conv.us.14.i = sitofp i32 %call.us.14.i to double, !dbg !697
  %div.us.14.i = fdiv double %conv.us.14.i, 0x41DFFFFFFFC00000, !dbg !698
  %30 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.14.i = mul nsw i32 %30, %I.074.us.i, !dbg !699
  %add.us.14.i = add nsw i32 %mul.us.14.i, %J.072.us.i, !dbg !699
  %idxprom.us.14.i = sext i32 %add.us.14.i to i64, !dbg !699
  %arrayidx13.us.14.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.14.i, i64 %indvars.iv.i, i64 14, !dbg !699
  store double %div.us.14.i, double* %arrayidx13.us.14.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 15, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %call.us.15.i = call i32 @rand() #17, !dbg !692
  %conv.us.15.i = sitofp i32 %call.us.15.i to double, !dbg !697
  %div.us.15.i = fdiv double %conv.us.15.i, 0x41DFFFFFFFC00000, !dbg !698
  %31 = load i32, i32* @nBlocks, align 4, !dbg !699, !tbaa !166
  %mul.us.15.i = mul nsw i32 %31, %I.074.us.i, !dbg !699
  %add.us.15.i = add nsw i32 %mul.us.15.i, %J.072.us.i, !dbg !699
  %idxprom.us.15.i = sext i32 %add.us.15.i to i64, !dbg !699
  %arrayidx13.us.15.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.15.i, i64 %indvars.iv.i, i64 15, !dbg !699
  store double %div.us.15.i, double* %arrayidx13.us.15.i, align 8, !dbg !700, !tbaa !75
  call void @llvm.dbg.value(metadata i64 16, metadata !676, metadata !DIExpression()) #17, !dbg !678
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !701
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !675, metadata !DIExpression()) #17, !dbg !678
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 16, !dbg !702
  br i1 %exitcond.not.i, label %for.inc17.us.i, label %for.cond7.preheader.us.i, !dbg !703, !llvm.loop !704

for.cond4.preheader.us.i:                         ; preds = %for.inc17.us.i, %for.cond1.preheader.us.i
  %J.072.us.i = phi i32 [ 0, %for.cond1.preheader.us.i ], [ %inc18.us.i, %for.inc17.us.i ]
  call void @llvm.dbg.value(metadata i32 %J.072.us.i, metadata !673, metadata !DIExpression()) #17, !dbg !678
  call void @llvm.dbg.value(metadata i32 0, metadata !675, metadata !DIExpression()) #17, !dbg !678
  br label %for.cond7.preheader.us.i, !dbg !703

for.cond1.for.inc20_crit_edge.us.i:               ; preds = %for.inc17.us.i
  %inc21.us.i = add nuw nsw i32 %I.074.us.i, 1, !dbg !706
  call void @llvm.dbg.value(metadata i32 %inc21.us.i, metadata !672, metadata !DIExpression()) #17, !dbg !678
  %exitcond82.not.i = icmp eq i32 %inc21.us.i, %15, !dbg !681
  br i1 %exitcond82.not.i, label %for.cond27.preheader.lr.ph.i, label %for.cond1.preheader.us.i, !dbg !684, !llvm.loop !707

for.cond27.preheader.lr.ph.i:                     ; preds = %for.cond1.for.inc20_crit_edge.us.i
  call void @llvm.dbg.value(metadata i32 0, metadata !674, metadata !DIExpression()) #17, !dbg !678
  %wide.trip.count.i = zext i32 %15 to i64, !dbg !709
  br label %for.cond27.preheader.i, !dbg !712

for.cond27.preheader.i:                           ; preds = %for.cond27.preheader.i, %for.cond27.preheader.lr.ph.i
  %indvars.iv87.i = phi i64 [ 0, %for.cond27.preheader.lr.ph.i ], [ %indvars.iv.next88.i, %for.cond27.preheader.i ]
  %indvars91.i = trunc i64 %indvars.iv87.i to i32
  call void @llvm.dbg.value(metadata i64 %indvars.iv87.i, metadata !674, metadata !DIExpression()) #17, !dbg !678
  %mul31.i = mul nsw i32 %31, %indvars91.i
  %32 = sext i32 %mul31.i to i64
  %33 = add nsw i64 %indvars.iv87.i, %32
  call void @llvm.dbg.value(metadata i64 0, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 0, i64 0, !dbg !713
  %34 = load double, double* %arrayidx38.i, align 8, !dbg !716, !tbaa !75
  %mul39.i = fmul double %34, 1.000000e+01, !dbg !716
  store double %mul39.i, double* %arrayidx38.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 1, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.1.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 1, i64 1, !dbg !713
  %35 = load double, double* %arrayidx38.1.i, align 8, !dbg !716, !tbaa !75
  %mul39.1.i = fmul double %35, 1.000000e+01, !dbg !716
  store double %mul39.1.i, double* %arrayidx38.1.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 2, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.2.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 2, i64 2, !dbg !713
  %36 = load double, double* %arrayidx38.2.i, align 8, !dbg !716, !tbaa !75
  %mul39.2.i = fmul double %36, 1.000000e+01, !dbg !716
  store double %mul39.2.i, double* %arrayidx38.2.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 3, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.3.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 3, i64 3, !dbg !713
  %37 = load double, double* %arrayidx38.3.i, align 8, !dbg !716, !tbaa !75
  %mul39.3.i = fmul double %37, 1.000000e+01, !dbg !716
  store double %mul39.3.i, double* %arrayidx38.3.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 4, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.4.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 4, i64 4, !dbg !713
  %38 = load double, double* %arrayidx38.4.i, align 8, !dbg !716, !tbaa !75
  %mul39.4.i = fmul double %38, 1.000000e+01, !dbg !716
  store double %mul39.4.i, double* %arrayidx38.4.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 5, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.5.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 5, i64 5, !dbg !713
  %39 = load double, double* %arrayidx38.5.i, align 8, !dbg !716, !tbaa !75
  %mul39.5.i = fmul double %39, 1.000000e+01, !dbg !716
  store double %mul39.5.i, double* %arrayidx38.5.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 6, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.6.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 6, i64 6, !dbg !713
  %40 = load double, double* %arrayidx38.6.i, align 8, !dbg !716, !tbaa !75
  %mul39.6.i = fmul double %40, 1.000000e+01, !dbg !716
  store double %mul39.6.i, double* %arrayidx38.6.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 7, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.7.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 7, i64 7, !dbg !713
  %41 = load double, double* %arrayidx38.7.i, align 8, !dbg !716, !tbaa !75
  %mul39.7.i = fmul double %41, 1.000000e+01, !dbg !716
  store double %mul39.7.i, double* %arrayidx38.7.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 8, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.8.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 8, i64 8, !dbg !713
  %42 = load double, double* %arrayidx38.8.i, align 8, !dbg !716, !tbaa !75
  %mul39.8.i = fmul double %42, 1.000000e+01, !dbg !716
  store double %mul39.8.i, double* %arrayidx38.8.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 9, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.9.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 9, i64 9, !dbg !713
  %43 = load double, double* %arrayidx38.9.i, align 8, !dbg !716, !tbaa !75
  %mul39.9.i = fmul double %43, 1.000000e+01, !dbg !716
  store double %mul39.9.i, double* %arrayidx38.9.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 10, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.10.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 10, i64 10, !dbg !713
  %44 = load double, double* %arrayidx38.10.i, align 8, !dbg !716, !tbaa !75
  %mul39.10.i = fmul double %44, 1.000000e+01, !dbg !716
  store double %mul39.10.i, double* %arrayidx38.10.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 11, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.11.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 11, i64 11, !dbg !713
  %45 = load double, double* %arrayidx38.11.i, align 8, !dbg !716, !tbaa !75
  %mul39.11.i = fmul double %45, 1.000000e+01, !dbg !716
  store double %mul39.11.i, double* %arrayidx38.11.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 12, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.12.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 12, i64 12, !dbg !713
  %46 = load double, double* %arrayidx38.12.i, align 8, !dbg !716, !tbaa !75
  %mul39.12.i = fmul double %46, 1.000000e+01, !dbg !716
  store double %mul39.12.i, double* %arrayidx38.12.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 13, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.13.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 13, i64 13, !dbg !713
  %47 = load double, double* %arrayidx38.13.i, align 8, !dbg !716, !tbaa !75
  %mul39.13.i = fmul double %47, 1.000000e+01, !dbg !716
  store double %mul39.13.i, double* %arrayidx38.13.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 14, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.14.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 14, i64 14, !dbg !713
  %48 = load double, double* %arrayidx38.14.i, align 8, !dbg !716, !tbaa !75
  %mul39.14.i = fmul double %48, 1.000000e+01, !dbg !716
  store double %mul39.14.i, double* %arrayidx38.14.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 15, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %arrayidx38.15.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %33, i64 15, i64 15, !dbg !713
  %49 = load double, double* %arrayidx38.15.i, align 8, !dbg !716, !tbaa !75
  %mul39.15.i = fmul double %49, 1.000000e+01, !dbg !716
  store double %mul39.15.i, double* %arrayidx38.15.i, align 8, !dbg !716, !tbaa !75
  call void @llvm.dbg.value(metadata i64 16, metadata !677, metadata !DIExpression()) #17, !dbg !678
  %indvars.iv.next88.i = add nuw nsw i64 %indvars.iv87.i, 1, !dbg !717
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next88.i, metadata !674, metadata !DIExpression()) #17, !dbg !678
  %exitcond92.not.i = icmp eq i64 %indvars.iv.next88.i, %wide.trip.count.i, !dbg !709
  br i1 %exitcond92.not.i, label %init_matrix.exit, label %for.cond27.preheader.i, !dbg !712, !llvm.loop !718

init_matrix.exit:                                 ; preds = %for.cond27.preheader.i, %for.body
  %50 = load i32, i32* %print, align 4, !dbg !720, !tbaa !166
  call void @llvm.dbg.value(metadata i32 %50, metadata !586, metadata !DIExpression()), !dbg !602
  %tobool17.not = icmp eq i32 %50, 0, !dbg !720
  br i1 %tobool17.not, label %if.end19, label %if.then18, !dbg !722

if.then18:                                        ; preds = %init_matrix.exit
  %51 = load i32, i32* @nBlocks, align 4, !dbg !723, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %9, metadata !724, metadata !DIExpression()) #17, !dbg !730
  call void @llvm.dbg.value(metadata i32 %51, metadata !727, metadata !DIExpression()) #17, !dbg !730
  call void @llvm.dbg.value(metadata i32 0, metadata !728, metadata !DIExpression()) #17, !dbg !730
  %cmp27.i = icmp sgt i32 %51, 0, !dbg !732
  br i1 %cmp27.i, label %for.cond1.preheader.us.preheader.i, label %if.end19, !dbg !735

for.cond1.preheader.us.preheader.i:               ; preds = %if.then18
  %mul.i = shl i32 %51, 4
  %smax.i = call i32 @llvm.smax.i32(i32 %mul.i, i32 1) #17, !dbg !735
  br label %for.cond1.preheader.us.i79, !dbg !735

for.cond1.preheader.us.i79:                       ; preds = %for.cond1.for.end_crit_edge.us.i, %for.cond1.preheader.us.preheader.i
  %i.028.us.i = phi i32 [ %inc14.us.i, %for.cond1.for.end_crit_edge.us.i ], [ 0, %for.cond1.preheader.us.preheader.i ]
  call void @llvm.dbg.value(metadata i32 %i.028.us.i, metadata !728, metadata !DIExpression()) #17, !dbg !730
  call void @llvm.dbg.value(metadata i32 0, metadata !729, metadata !DIExpression()) #17, !dbg !730
  %div.us.i78 = lshr i32 %i.028.us.i, 4
  %rem.us.i = and i32 %i.028.us.i, 15
  %idxprom7.us.i = zext i32 %rem.us.i to i64
  br label %for.body4.us.i, !dbg !736

for.body4.us.i:                                   ; preds = %for.body4.us.i, %for.cond1.preheader.us.i79
  %j.026.us.i = phi i32 [ 0, %for.cond1.preheader.us.i79 ], [ %inc.us.i, %for.body4.us.i ]
  call void @llvm.dbg.value(metadata i32 %j.026.us.i, metadata !729, metadata !DIExpression()) #17, !dbg !730
  %52 = load i32, i32* @nBlocks, align 4, !dbg !739, !tbaa !166
  %mul5.us.i = mul nsw i32 %52, %div.us.i78, !dbg !739
  %div6.us.i = lshr i32 %j.026.us.i, 4, !dbg !739
  %add.us.i80 = add nsw i32 %mul5.us.i, %div6.us.i, !dbg !739
  %idxprom.us.i81 = sext i32 %add.us.i80 to i64, !dbg !739
  %rem9.us.i = and i32 %j.026.us.i, 15, !dbg !739
  %idxprom10.us.i = zext i32 %rem9.us.i to i64, !dbg !739
  %arrayidx11.us.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.i81, i64 %idxprom7.us.i, i64 %idxprom10.us.i, !dbg !739
  %53 = load double, double* %arrayidx11.us.i, align 8, !dbg !739, !tbaa !75
  %call.us.i82 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i64 0, i64 0), double noundef %53) #17, !dbg !741
  %inc.us.i = add nuw nsw i32 %j.026.us.i, 1, !dbg !742
  call void @llvm.dbg.value(metadata i32 %inc.us.i, metadata !729, metadata !DIExpression()) #17, !dbg !730
  %exitcond.not.i83 = icmp eq i32 %inc.us.i, %smax.i, !dbg !743
  br i1 %exitcond.not.i83, label %for.cond1.for.end_crit_edge.us.i, label %for.body4.us.i, !dbg !736, !llvm.loop !744

for.cond1.for.end_crit_edge.us.i:                 ; preds = %for.body4.us.i
  %putchar.us.i = call i32 @putchar(i32 10) #17, !dbg !746
  %inc14.us.i = add nuw nsw i32 %i.028.us.i, 1, !dbg !747
  call void @llvm.dbg.value(metadata i32 %inc14.us.i, metadata !728, metadata !DIExpression()) #17, !dbg !730
  %exitcond30.not.i = icmp eq i32 %inc14.us.i, %smax.i, !dbg !732
  br i1 %exitcond30.not.i, label %if.end19, label %for.cond1.preheader.us.i79, !dbg !735, !llvm.loop !748

if.end19:                                         ; preds = %for.cond1.for.end_crit_edge.us.i, %if.then18, %init_matrix.exit
  %54 = load i32, i32* %n, align 4, !dbg !750, !tbaa !166
  call void @llvm.dbg.value(metadata i32 %54, metadata !588, metadata !DIExpression()), !dbg !602
  %mul20 = mul nsw i32 %54, %54, !dbg !751
  %conv21 = zext i32 %mul20 to i64, !dbg !750
  %mul22 = shl nuw nsw i64 %conv21, 3, !dbg !752
  %call23 = call noalias i8* @malloc(i64 noundef %mul22) #17, !dbg !753
  %55 = bitcast i8* %call23 to [16 x [16 x double]]*, !dbg !754
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %55, metadata !594, metadata !DIExpression()), !dbg !602
  %tobool24.not = icmp eq i8* %call23, null, !dbg !755
  br i1 %tobool24.not, label %cleanup, label %if.end27, !dbg !757

if.end27:                                         ; preds = %if.end19
  call void @llvm.dbg.value(metadata i32 %54, metadata !588, metadata !DIExpression()), !dbg !602
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %call23, i8* nonnull align 1 %call11, i64 %mul22, i1 false), !dbg !758
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %11) #17, !dbg !759
  call void @llvm.dbg.declare(metadata %struct.timeval* %t1, metadata !597, metadata !DIExpression()), !dbg !760
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %12) #17, !dbg !759
  call void @llvm.dbg.declare(metadata %struct.timeval* %t2, metadata !600, metadata !DIExpression()), !dbg !761
  %call31 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #17, !dbg !762
  %56 = load i32, i32* @nBlocks, align 4, !dbg !763, !tbaa !166
  call void @lu([16 x [16 x double]]* noundef nonnull %9, i32 noundef %56), !dbg !764
  %call32 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #17, !dbg !765
  call void @llvm.dbg.value(metadata %struct.timeval* %t2, metadata !47, metadata !DIExpression()), !dbg !766
  %57 = load i64, i64* %tv_sec.i, align 8, !dbg !768, !tbaa !50
  %58 = load i64, i64* %tv_usec.i, align 8, !dbg !769, !tbaa !57
  call void @llvm.dbg.value(metadata %struct.timeval* %t1, metadata !47, metadata !DIExpression()), !dbg !770
  %59 = load i64, i64* %tv_sec.i84, align 8, !dbg !772, !tbaa !50
  %60 = load i64, i64* %tv_usec.i86, align 8, !dbg !773, !tbaa !57
  %reass.add = sub i64 %57, %59
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i = sub i64 %58, %60, !dbg !774
  %sub = add i64 %add.i, %reass.mul, !dbg !775
  %div35 = udiv i64 %sub, 1000, !dbg !776
  call void @llvm.dbg.value(metadata i64 %div35, metadata !601, metadata !DIExpression()), !dbg !777
  %conv36 = uitofp i64 %div35 to double, !dbg !778
  %div37 = fdiv double %conv36, 1.000000e+03, !dbg !779
  %call38 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.13, i64 0, i64 0), double noundef %div37), !dbg !780
  %61 = load i32, i32* %print, align 4, !dbg !781, !tbaa !166
  call void @llvm.dbg.value(metadata i32 %61, metadata !586, metadata !DIExpression()), !dbg !602
  %tobool39.not = icmp eq i32 %61, 0, !dbg !781
  br i1 %tobool39.not, label %if.end41, label %if.then40, !dbg !783

if.then40:                                        ; preds = %if.end27
  %62 = load i32, i32* @nBlocks, align 4, !dbg !784, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %9, metadata !724, metadata !DIExpression()) #17, !dbg !785
  call void @llvm.dbg.value(metadata i32 %62, metadata !727, metadata !DIExpression()) #17, !dbg !785
  call void @llvm.dbg.value(metadata i32 0, metadata !728, metadata !DIExpression()) #17, !dbg !785
  %cmp27.i88 = icmp sgt i32 %62, 0, !dbg !787
  br i1 %cmp27.i88, label %for.cond1.preheader.us.preheader.i91, label %if.end41, !dbg !788

for.cond1.preheader.us.preheader.i91:             ; preds = %if.then40
  %mul.i89 = shl i32 %62, 4
  %smax.i90 = call i32 @llvm.smax.i32(i32 %mul.i89, i32 1) #17, !dbg !788
  br label %for.cond1.preheader.us.i96, !dbg !788

for.cond1.preheader.us.i96:                       ; preds = %for.cond1.for.end_crit_edge.us.i112, %for.cond1.preheader.us.preheader.i91
  %i.028.us.i92 = phi i32 [ %inc14.us.i110, %for.cond1.for.end_crit_edge.us.i112 ], [ 0, %for.cond1.preheader.us.preheader.i91 ]
  call void @llvm.dbg.value(metadata i32 %i.028.us.i92, metadata !728, metadata !DIExpression()) #17, !dbg !785
  call void @llvm.dbg.value(metadata i32 0, metadata !729, metadata !DIExpression()) #17, !dbg !785
  %div.us.i93 = lshr i32 %i.028.us.i92, 4
  %rem.us.i94 = and i32 %i.028.us.i92, 15
  %idxprom7.us.i95 = zext i32 %rem.us.i94 to i64
  br label %for.body4.us.i108, !dbg !789

for.body4.us.i108:                                ; preds = %for.body4.us.i108, %for.cond1.preheader.us.i96
  %j.026.us.i97 = phi i32 [ 0, %for.cond1.preheader.us.i96 ], [ %inc.us.i106, %for.body4.us.i108 ]
  call void @llvm.dbg.value(metadata i32 %j.026.us.i97, metadata !729, metadata !DIExpression()) #17, !dbg !785
  %63 = load i32, i32* @nBlocks, align 4, !dbg !790, !tbaa !166
  %mul5.us.i98 = mul nsw i32 %63, %div.us.i93, !dbg !790
  %div6.us.i99 = lshr i32 %j.026.us.i97, 4, !dbg !790
  %add.us.i100 = add nsw i32 %mul5.us.i98, %div6.us.i99, !dbg !790
  %idxprom.us.i101 = sext i32 %add.us.i100 to i64, !dbg !790
  %rem9.us.i102 = and i32 %j.026.us.i97, 15, !dbg !790
  %idxprom10.us.i103 = zext i32 %rem9.us.i102 to i64, !dbg !790
  %arrayidx11.us.i104 = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.i101, i64 %idxprom7.us.i95, i64 %idxprom10.us.i103, !dbg !790
  %64 = load double, double* %arrayidx11.us.i104, align 8, !dbg !790, !tbaa !75
  %call.us.i105 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.17, i64 0, i64 0), double noundef %64) #17, !dbg !791
  %inc.us.i106 = add nuw nsw i32 %j.026.us.i97, 1, !dbg !792
  call void @llvm.dbg.value(metadata i32 %inc.us.i106, metadata !729, metadata !DIExpression()) #17, !dbg !785
  %exitcond.not.i107 = icmp eq i32 %inc.us.i106, %smax.i90, !dbg !793
  br i1 %exitcond.not.i107, label %for.cond1.for.end_crit_edge.us.i112, label %for.body4.us.i108, !dbg !789, !llvm.loop !794

for.cond1.for.end_crit_edge.us.i112:              ; preds = %for.body4.us.i108
  %putchar.us.i109 = call i32 @putchar(i32 10) #17, !dbg !796
  %inc14.us.i110 = add nuw nsw i32 %i.028.us.i92, 1, !dbg !797
  call void @llvm.dbg.value(metadata i32 %inc14.us.i110, metadata !728, metadata !DIExpression()) #17, !dbg !785
  %exitcond30.not.i111 = icmp eq i32 %inc14.us.i110, %smax.i90, !dbg !787
  br i1 %exitcond30.not.i111, label %if.end41, label %for.cond1.preheader.us.i96, !dbg !788, !llvm.loop !798

if.end41:                                         ; preds = %for.cond1.for.end_crit_edge.us.i112, %if.then40, %if.end27
  %65 = load i32, i32* %test, align 4, !dbg !800, !tbaa !166
  call void @llvm.dbg.value(metadata i32 %65, metadata !587, metadata !DIExpression()), !dbg !602
  %tobool42.not = icmp eq i32 %65, 0, !dbg !801
  br i1 %tobool42.not, label %if.else, label %land.rhs, !dbg !802

land.rhs:                                         ; preds = %if.end41
  %66 = load i32, i32* @nBlocks, align 4, !dbg !803, !tbaa !166
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %9, metadata !804, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* %55, metadata !809, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata i32 %66, metadata !810, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !818, metadata !DIExpression()) #17, !dbg !820
  %puts.i114 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([21 x i8], [21 x i8]* @str.25, i64 0, i64 0)) #17, !dbg !822
  call void @llvm.dbg.value(metadata i32 0, metadata !814, metadata !DIExpression()) #17, !dbg !820
  %cmp135.i = icmp sgt i32 %66, 0, !dbg !823
  br i1 %cmp135.i, label %for.cond1.preheader.lr.ph.i, label %if.else, !dbg !826

for.cond1.preheader.lr.ph.i:                      ; preds = %land.rhs
  %mul.i115 = shl i32 %66, 4
  %67 = load i32, i32* @nBlocks, align 4
  %smax.i116 = call i32 @llvm.smax.i32(i32 %mul.i115, i32 1) #17, !dbg !826
  br label %for.cond1.preheader.us.i119, !dbg !826

for.cond1.preheader.us.i119:                      ; preds = %for.cond1.for.inc58_crit_edge.us.i, %for.cond1.preheader.lr.ph.i
  %i.0136.us.i = phi i32 [ 0, %for.cond1.preheader.lr.ph.i ], [ %inc59.us.i, %for.cond1.for.inc58_crit_edge.us.i ]
  call void @llvm.dbg.value(metadata i32 %i.0136.us.i, metadata !814, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata i32 0, metadata !815, metadata !DIExpression()) #17, !dbg !820
  %div.us.i117 = lshr i32 %i.0136.us.i, 4
  %cmp7111.us.not.i = icmp eq i32 %i.0136.us.i, 0
  %mul11.us.i = mul nsw i32 %div.us.i117, %67
  %rem.us.i118 = and i32 %i.0136.us.i, 15
  %idxprom12.us.i = zext i32 %rem.us.i118 to i64
  br i1 %cmp7111.us.not.i, label %for.body4.us141.i, label %for.body4.us.us.i, !dbg !827

for.cond1.us139.i:                                ; preds = %for.body4.us141.i
  call void @llvm.dbg.value(metadata i32 undef, metadata !815, metadata !DIExpression()) #17, !dbg !820
  %exitcond168.not.i = icmp eq i32 %inc56.us156.i, %smax.i116, !dbg !832
  br i1 %exitcond168.not.i, label %for.cond1.for.inc58_crit_edge.us.i, label %for.body4.us141.i, !dbg !833, !llvm.loop !834

for.body4.us141.i:                                ; preds = %for.cond1.us139.i, %for.cond1.preheader.us.i119
  %j.0117.us142.i = phi i32 [ %inc56.us156.i, %for.cond1.us139.i ], [ 0, %for.cond1.preheader.us.i119 ]
  call void @llvm.dbg.value(metadata i32 %j.0117.us142.i, metadata !815, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata i32 %div.us.i117, metadata !811, metadata !DIExpression()) #17, !dbg !820
  %div5.us143.i = lshr i32 %j.0117.us142.i, 4, !dbg !836
  call void @llvm.dbg.value(metadata i32 %div5.us143.i, metadata !812, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !819, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata i32 0, metadata !816, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata i32 0, metadata !813, metadata !DIExpression(DW_OP_constu, 4, DW_OP_shr, DW_OP_stack_value)) #17, !dbg !820
  %idxprom33.us144.i = zext i32 %div5.us143.i to i64, !dbg !837
  %rem38.us145.i = and i32 %j.0117.us142.i, 15, !dbg !837
  %idxprom39.us146.i = zext i32 %rem38.us145.i to i64, !dbg !837
  %arrayidx40.us147.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom33.us144.i, i64 0, i64 %idxprom39.us146.i, !dbg !837
  %68 = load double, double* %arrayidx40.us147.i, align 8, !dbg !837, !tbaa !75
  %add41.us148.i = fadd double %68, 0.000000e+00, !dbg !840
  call void @llvm.dbg.value(metadata double undef, metadata !819, metadata !DIExpression()) #17, !dbg !820
  %add43.us149.i = add nsw i32 %div5.us143.i, %mul11.us.i, !dbg !841
  %idxprom44.us150.i = sext i32 %add43.us149.i to i64, !dbg !841
  %arrayidx51.us153.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %55, i64 %idxprom44.us150.i, i64 %idxprom12.us.i, i64 %idxprom39.us146.i, !dbg !841
  %69 = load double, double* %arrayidx51.us153.i, align 8, !dbg !841, !tbaa !75
  %sub.us154.i = fsub double %69, %add41.us148.i, !dbg !842
  %70 = call double @llvm.fabs.f64(double %sub.us154.i) #17, !dbg !843
  call void @llvm.dbg.value(metadata double %70, metadata !817, metadata !DIExpression()) #17, !dbg !820
  %cmp52.us155.i = fcmp ogt double %70, 0x3EB0C6F7A0B5ED8D, !dbg !844
  %inc56.us156.i = add nuw nsw i32 %j.0117.us142.i, 1, !dbg !846
  call void @llvm.dbg.value(metadata i32 %inc56.us156.i, metadata !815, metadata !DIExpression()) #17, !dbg !820
  br i1 %cmp52.us155.i, label %if.then46, label %for.cond1.us139.i, !dbg !847

for.cond1.for.inc58_crit_edge.us.i:               ; preds = %for.cond1.us.us.i, %for.cond1.us139.i
  %inc59.us.i = add nuw nsw i32 %i.0136.us.i, 1, !dbg !848
  call void @llvm.dbg.value(metadata i32 %inc59.us.i, metadata !814, metadata !DIExpression()) #17, !dbg !820
  %exitcond170.not.i = icmp eq i32 %inc59.us.i, %smax.i116, !dbg !823
  br i1 %exitcond170.not.i, label %if.else, label %for.cond1.preheader.us.i119, !dbg !826, !llvm.loop !849

for.body4.us.us.i:                                ; preds = %for.cond1.us.us.i, %for.cond1.preheader.us.i119
  %j.0117.us.us.i = phi i32 [ %inc56.us.us.i, %for.cond1.us.us.i ], [ 0, %for.cond1.preheader.us.i119 ]
  call void @llvm.dbg.value(metadata i32 %j.0117.us.us.i, metadata !815, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata i32 %div.us.i117, metadata !811, metadata !DIExpression()) #17, !dbg !820
  %div5.us.us.i = lshr i32 %j.0117.us.us.i, 4, !dbg !836
  call void @llvm.dbg.value(metadata i32 %div5.us.us.i, metadata !812, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !819, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata i32 0, metadata !816, metadata !DIExpression()) #17, !dbg !820
  %rem24.us.us.i = and i32 %j.0117.us.us.i, 15
  %idxprom25.us.us.i = zext i32 %rem24.us.us.i to i64
  br label %for.body9.us.us.i, !dbg !827

for.cond1.us.us.i:                                ; preds = %if.end.us.us.i
  call void @llvm.dbg.value(metadata i32 undef, metadata !815, metadata !DIExpression()) #17, !dbg !820
  %exitcond.not.i120 = icmp eq i32 %inc56.us.us.i, %smax.i116, !dbg !832
  br i1 %exitcond.not.i120, label %for.cond1.for.inc58_crit_edge.us.i, label %for.body4.us.us.i, !dbg !833, !llvm.loop !851

if.then.us.us.i:                                  ; preds = %for.cond6.for.end_crit_edge.us.us.i
  call void @llvm.dbg.value(metadata i32 %div.us.i117, metadata !813, metadata !DIExpression()) #17, !dbg !820
  %arrayidx40.us.us.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %.pre171.i, i64 %idxprom12.us.i, i64 %idxprom25.us.us.i, !dbg !837
  %71 = load double, double* %arrayidx40.us.us.i, align 8, !dbg !837, !tbaa !75
  %add41.us.us.i = fadd double %76, %71, !dbg !840
  call void @llvm.dbg.value(metadata double %add41.us.us.i, metadata !819, metadata !DIExpression()) #17, !dbg !820
  br label %if.end.us.us.i, !dbg !852

if.end.us.us.i:                                   ; preds = %for.cond6.for.end_crit_edge.us.us.i, %if.then.us.us.i
  %v.1.us.us.i = phi double [ %add41.us.us.i, %if.then.us.us.i ], [ %76, %for.cond6.for.end_crit_edge.us.us.i ], !dbg !853
  call void @llvm.dbg.value(metadata double %v.1.us.us.i, metadata !819, metadata !DIExpression()) #17, !dbg !820
  %arrayidx51.us.us.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %55, i64 %.pre171.i, i64 %idxprom12.us.i, i64 %idxprom25.us.us.i, !dbg !841
  %72 = load double, double* %arrayidx51.us.us.i, align 8, !dbg !841, !tbaa !75
  %sub.us.us.i = fsub double %72, %v.1.us.us.i, !dbg !842
  %73 = call double @llvm.fabs.f64(double %sub.us.us.i) #17, !dbg !843
  call void @llvm.dbg.value(metadata double %73, metadata !817, metadata !DIExpression()) #17, !dbg !820
  %cmp52.us.us.i = fcmp ogt double %73, 0x3EB0C6F7A0B5ED8D, !dbg !844
  %inc56.us.us.i = add nuw nsw i32 %j.0117.us.us.i, 1, !dbg !846
  call void @llvm.dbg.value(metadata i32 %inc56.us.us.i, metadata !815, metadata !DIExpression()) #17, !dbg !820
  br i1 %cmp52.us.us.i, label %if.then46, label %for.cond1.us.us.i, !dbg !847

for.body9.us.us.i:                                ; preds = %for.body9.us.us.i, %for.body4.us.us.i
  %v.0113.us.us.i = phi double [ 0.000000e+00, %for.body4.us.us.i ], [ %76, %for.body9.us.us.i ]
  %k.0112.us.us.i = phi i32 [ 0, %for.body4.us.us.i ], [ %inc.us.us.i, %for.body9.us.us.i ]
  call void @llvm.dbg.value(metadata double %v.0113.us.us.i, metadata !819, metadata !DIExpression()) #17, !dbg !820
  call void @llvm.dbg.value(metadata i32 %k.0112.us.us.i, metadata !816, metadata !DIExpression()) #17, !dbg !820
  %div10.us.us.i = lshr i32 %k.0112.us.us.i, 4, !dbg !854
  call void @llvm.dbg.value(metadata i32 %div10.us.us.i, metadata !813, metadata !DIExpression()) #17, !dbg !820
  %add.us.us.i = add nsw i32 %div10.us.us.i, %mul11.us.i, !dbg !857
  %idxprom.us.us.i = sext i32 %add.us.us.i to i64, !dbg !857
  %rem14.us.us.i = and i32 %k.0112.us.us.i, 15, !dbg !857
  %idxprom15.us.us.i = zext i32 %rem14.us.us.i to i64, !dbg !857
  %arrayidx16.us.us.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom.us.us.i, i64 %idxprom12.us.i, i64 %idxprom15.us.us.i, !dbg !857
  %74 = load double, double* %arrayidx16.us.us.i, align 8, !dbg !857, !tbaa !75
  %mul17.us.us.i = mul nsw i32 %div10.us.us.i, %67, !dbg !858
  %add18.us.us.i = add nsw i32 %mul17.us.us.i, %div5.us.us.i, !dbg !858
  %idxprom19.us.us.i = sext i32 %add18.us.us.i to i64, !dbg !858
  %arrayidx26.us.us.i = getelementptr inbounds [16 x [16 x double]], [16 x [16 x double]]* %9, i64 %idxprom19.us.us.i, i64 %idxprom15.us.us.i, i64 %idxprom25.us.us.i, !dbg !858
  %75 = load double, double* %arrayidx26.us.us.i, align 8, !dbg !858, !tbaa !75
  %76 = call double @llvm.fmuladd.f64(double %74, double %75, double %v.0113.us.us.i) #17, !dbg !859
  call void @llvm.dbg.value(metadata double %76, metadata !819, metadata !DIExpression()) #17, !dbg !820
  %inc.us.us.i = add nuw nsw i32 %k.0112.us.us.i, 1, !dbg !860
  call void @llvm.dbg.value(metadata i32 %inc.us.us.i, metadata !816, metadata !DIExpression()) #17, !dbg !820
  %cmp7.us.us.i = icmp ult i32 %inc.us.us.i, %i.0136.us.i, !dbg !861
  %cmp8.us.us.i = icmp ult i32 %k.0112.us.us.i, %j.0117.us.us.i, !dbg !862
  %77 = select i1 %cmp7.us.us.i, i1 %cmp8.us.us.i, i1 false, !dbg !862
  br i1 %77, label %for.body9.us.us.i, label %for.cond6.for.end_crit_edge.us.us.i, !dbg !827, !llvm.loop !863

for.cond6.for.end_crit_edge.us.us.i:              ; preds = %for.body9.us.us.i
  %cmp28.us.us.i = icmp ne i32 %inc.us.us.i, %i.0136.us.i, !dbg !865
  %cmp8.not.us.us.i = xor i1 %cmp8.us.us.i, true, !dbg !866
  %brmerge.us.us.i = select i1 %cmp28.us.us.i, i1 true, i1 %cmp8.not.us.us.i, !dbg !866
  %.pre.i = add nsw i32 %div5.us.us.i, %mul11.us.i, !dbg !853
  %.pre171.i = sext i32 %.pre.i to i64, !dbg !853
  br i1 %brmerge.us.us.i, label %if.end.us.us.i, label %if.then.us.us.i, !dbg !866

if.then46:                                        ; preds = %if.end.us.us.i, %for.body4.us141.i
  call void @llvm.dbg.value(metadata i1 undef, metadata !591, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !602
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([14 x i8], [14 x i8]* @str.24, i64 0, i64 0)), !dbg !867
  br label %if.end50, !dbg !867

if.else:                                          ; preds = %for.cond1.for.inc58_crit_edge.us.i, %land.rhs, %if.end41
  %78 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !869, !tbaa !663
  %79 = call i64 @fwrite(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.15, i64 0, i64 0), i64 18, i64 1, %struct._IO_FILE* %78) #18, !dbg !871
  %80 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !872, !tbaa !663
  %81 = load i32, i32* %n, align 4, !dbg !873, !tbaa !166
  call void @llvm.dbg.value(metadata i32 %81, metadata !588, metadata !DIExpression()), !dbg !602
  %call49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %80, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.16, i64 0, i64 0), i32 noundef %81) #18, !dbg !874
  br label %if.end50

if.end50:                                         ; preds = %if.else, %if.then46
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %12) #17, !dbg !875
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %11) #17, !dbg !875
  %inc = add nuw nsw i32 %r.0134, 1, !dbg !876
  call void @llvm.dbg.value(metadata i32 %inc, metadata !595, metadata !DIExpression()), !dbg !657
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* undef, metadata !594, metadata !DIExpression()), !dbg !602
  %82 = load i32, i32* %round, align 4, !dbg !658, !tbaa !166
  call void @llvm.dbg.value(metadata i32 %82, metadata !592, metadata !DIExpression()), !dbg !602
  %cmp = icmp slt i32 %inc, %82, !dbg !659
  br i1 %cmp, label %if.end50.for.body_crit_edge, label %for.end, !dbg !660, !llvm.loop !877

if.end50.for.body_crit_edge:                      ; preds = %if.end50
  %.pre = load i32, i32* @nBlocks, align 4, !dbg !667, !tbaa !166
  br label %for.body, !dbg !660

cleanup:                                          ; preds = %if.end19
  %83 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !879, !tbaa !663
  %84 = call i64 @fwrite(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.12, i64 0, i64 0), i64 19, i64 1, %struct._IO_FILE* %83) #18, !dbg !881
  call void @llvm.dbg.value(metadata [16 x [16 x double]]* undef, metadata !594, metadata !DIExpression()), !dbg !602
  br label %cleanup51

for.end:                                          ; preds = %if.end50, %for.cond.preheader
  %85 = phi i8* [ null, %for.cond.preheader ], [ %call23, %if.end50 ]
  call void @free(i8* noundef %call11) #17, !dbg !882
  call void @free(i8* noundef %85) #17, !dbg !883
  br label %cleanup51, !dbg !884

cleanup51:                                        ; preds = %for.end, %cleanup, %if.then13, %invalid_input.exit, %if.then
  %retval.1 = phi i32 [ 1, %if.then ], [ 0, %for.end ], [ 1, %cleanup ], [ 1, %if.then13 ], [ 1, %invalid_input.exit ], !dbg !602
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #17, !dbg !885
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #17, !dbg !885
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #17, !dbg !885
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #17, !dbg !885
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #17, !dbg !885
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #17, !dbg !885
  ret i32 %retval.1, !dbg !885
}

declare !dbg !886 dso_local void @get_options(i32 noundef, i8** noundef, i8** noundef, i32* noundef, ...) local_unnamed_addr #11

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #10

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #13

; Function Attrs: nofree nounwind
declare !dbg !892 dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #10

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #14

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nounwind
declare !dbg !904 dso_local void @srand(i32 noundef) local_unnamed_addr #15

; Function Attrs: nounwind
declare !dbg !908 dso_local i32 @rand() local_unnamed_addr #15

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #16

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #16

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #16

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { mustprogress nofree nounwind willreturn writeonly "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noinline nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { argmemonly nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { argmemonly nofree nounwind willreturn }
attributes #14 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { nofree nounwind }
attributes #17 = { nounwind }
attributes #18 = { cold }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "nBlocks", scope: !2, file: !3, line: 72, type: !26, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "lu.c", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "9a7a9404353ce93d1914fdccd829fcb7")
!4 = !{!5, !6, !13, !10}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "Matrix", file: !3, line: 68, baseType: !7)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "Block", file: !3, line: 64, baseType: !9)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 16384, elements: !11)
!10 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!11 = !{!12, !12}
!12 = !DISubrange(count: 16)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!14 = !{!15, !23, !0}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "specifiers", scope: !2, file: !3, line: 507, type: !17, isLocal: false, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 448, elements: !21)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !20)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !{!22}
!22 = !DISubrange(count: 7)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "opt_types", scope: !2, file: !3, line: 508, type: !25, isLocal: false, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 224, elements: !21)
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !{i32 7, !"Dwarf Version", i32 5}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"uwtable", i32 1}
!31 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)"}
!32 = distinct !DISubprogram(name: "todval", scope: !3, file: !3, line: 32, type: !33, scopeLine: 32, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !46)
!33 = !DISubroutineType(types: !34)
!34 = !{!35, !36}
!35 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !38, line: 30, size: 128, elements: !39)
!38 = !DIFile(filename: "/usr/include/bits/time.h", directory: "", checksumkind: CSK_MD5, checksum: "7275d681a2390320bc78ae3cf595b8d2")
!39 = !{!40, !44}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !37, file: !38, line: 32, baseType: !41, size: 64)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !42, line: 148, baseType: !43)
!42 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "77efac6352c67c8f56830ba4c854379f")
!43 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !37, file: !38, line: 33, baseType: !45, size: 64, offset: 64)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !42, line: 150, baseType: !43)
!46 = !{!47}
!47 = !DILocalVariable(name: "tp", arg: 1, scope: !32, file: !3, line: 32, type: !36)
!48 = !DILocation(line: 0, scope: !32)
!49 = !DILocation(line: 33, column: 16, scope: !32)
!50 = !{!51, !52, i64 0}
!51 = !{!"timeval", !52, i64 0, !52, i64 8}
!52 = !{!"long", !53, i64 0}
!53 = !{!"omnipotent char", !54, i64 0}
!54 = !{!"Simple C/C++ TBAA"}
!55 = !DILocation(line: 33, column: 30, scope: !32)
!56 = !DILocation(line: 33, column: 43, scope: !32)
!57 = !{!51, !52, i64 8}
!58 = !DILocation(line: 33, column: 37, scope: !32)
!59 = !DILocation(line: 33, column: 5, scope: !32)
!60 = distinct !DISubprogram(name: "startup_cilk", scope: !3, file: !3, line: 37, type: !61, scopeLine: 37, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !63)
!61 = !DISubroutineType(types: !62)
!62 = !{null}
!63 = !{!64, !65, !67, !68, !69, !70}
!64 = !DILocalVariable(name: "g", scope: !60, file: !3, line: 38, type: !10)
!65 = !DILocalVariable(name: "__init", scope: !66, type: !26, flags: DIFlagArtificial)
!66 = distinct !DILexicalBlock(scope: !60, file: !3, line: 39, column: 3)
!67 = !DILocalVariable(name: "__limit", scope: !66, type: !26, flags: DIFlagArtificial)
!68 = !DILocalVariable(name: "__begin", scope: !66, type: !26, flags: DIFlagArtificial)
!69 = !DILocalVariable(name: "__end", scope: !66, type: !26, flags: DIFlagArtificial)
!70 = !DILocalVariable(name: "i", scope: !71, file: !3, line: 39, type: !26)
!71 = distinct !DILexicalBlock(scope: !66, file: !3, line: 39, column: 3)
!72 = !DILocation(line: 0, scope: !60)
!73 = !DILocation(line: 38, column: 3, scope: !60)
!74 = !DILocation(line: 38, column: 10, scope: !60)
!75 = !{!76, !76, i64 0}
!76 = !{!"double", !53, i64 0}
!77 = !DILocation(line: 0, scope: !66)
!78 = !DILocation(line: 39, column: 24, scope: !66)
!79 = !DILocation(line: 39, column: 3, scope: !66)
!80 = !DILocation(line: 0, scope: !71)
!81 = !DILocation(line: 40, column: 14, scope: !82)
!82 = distinct !DILexicalBlock(scope: !71, file: !3, line: 39, column: 36)
!83 = !DILocation(line: 40, column: 10, scope: !82)
!84 = !DILocation(line: 40, column: 7, scope: !82)
!85 = !DILocation(line: 41, column: 3, scope: !82)
!86 = !DILocation(line: 39, column: 32, scope: !71)
!87 = !DILocation(line: 39, column: 24, scope: !71)
!88 = !DILocation(line: 39, column: 3, scope: !71)
!89 = distinct !{!89, !79, !90, !91}
!90 = !DILocation(line: 41, column: 3, scope: !66)
!91 = !{!"tapir.loop.spawn.strategy", i32 1}
!92 = !DILocation(line: 42, column: 1, scope: !60)
!93 = distinct !DISubprogram(name: "schur", scope: !3, file: !3, line: 256, type: !94, scopeLine: 256, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !96)
!94 = !DISubroutineType(types: !95)
!95 = !{null, !6, !6, !6, !26}
!96 = !{!97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113}
!97 = !DILocalVariable(name: "M", arg: 1, scope: !93, file: !3, line: 256, type: !6)
!98 = !DILocalVariable(name: "V", arg: 2, scope: !93, file: !3, line: 256, type: !6)
!99 = !DILocalVariable(name: "W", arg: 3, scope: !93, file: !3, line: 256, type: !6)
!100 = !DILocalVariable(name: "nb", arg: 4, scope: !93, file: !3, line: 256, type: !26)
!101 = !DILocalVariable(name: "M00", scope: !93, file: !3, line: 258, type: !6)
!102 = !DILocalVariable(name: "M01", scope: !93, file: !3, line: 258, type: !6)
!103 = !DILocalVariable(name: "M10", scope: !93, file: !3, line: 258, type: !6)
!104 = !DILocalVariable(name: "M11", scope: !93, file: !3, line: 258, type: !6)
!105 = !DILocalVariable(name: "V00", scope: !93, file: !3, line: 259, type: !6)
!106 = !DILocalVariable(name: "V01", scope: !93, file: !3, line: 259, type: !6)
!107 = !DILocalVariable(name: "V10", scope: !93, file: !3, line: 259, type: !6)
!108 = !DILocalVariable(name: "V11", scope: !93, file: !3, line: 259, type: !6)
!109 = !DILocalVariable(name: "W00", scope: !93, file: !3, line: 260, type: !6)
!110 = !DILocalVariable(name: "W01", scope: !93, file: !3, line: 260, type: !6)
!111 = !DILocalVariable(name: "W10", scope: !93, file: !3, line: 260, type: !6)
!112 = !DILocalVariable(name: "W11", scope: !93, file: !3, line: 260, type: !6)
!113 = !DILocalVariable(name: "hnb", scope: !93, file: !3, line: 261, type: !26)
!114 = !DILocation(line: 0, scope: !93)
!115 = !DILocation(line: 266, column: 10, scope: !116)
!116 = distinct !DILexicalBlock(scope: !93, file: !3, line: 266, column: 7)
!117 = !DILocation(line: 266, column: 7, scope: !93)
!118 = !DILocalVariable(name: "i", scope: !119, file: !3, line: 238, type: !26)
!119 = distinct !DISubprogram(name: "block_schur", scope: !3, file: !3, line: 236, type: !120, scopeLine: 236, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !125)
!120 = !DISubroutineType(types: !121)
!121 = !{null, !122, !122, !122}
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!123 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 1024, elements: !124)
!124 = !{!12}
!125 = !{!126, !127, !128, !118, !129}
!126 = !DILocalVariable(name: "B", arg: 1, scope: !119, file: !3, line: 236, type: !122)
!127 = !DILocalVariable(name: "A", arg: 2, scope: !119, file: !3, line: 236, type: !122)
!128 = !DILocalVariable(name: "C", arg: 3, scope: !119, file: !3, line: 236, type: !122)
!129 = !DILocalVariable(name: "k", scope: !119, file: !3, line: 238, type: !26)
!130 = !DILocation(line: 0, scope: !119, inlinedAt: !131)
!131 = distinct !DILocation(line: 267, column: 5, scope: !132)
!132 = distinct !DILexicalBlock(scope: !116, file: !3, line: 266, column: 16)
!133 = !DILocation(line: 178, column: 10, scope: !134, inlinedAt: !145)
!134 = distinct !DILexicalBlock(scope: !135, file: !3, line: 177, column: 3)
!135 = distinct !DILexicalBlock(scope: !136, file: !3, line: 177, column: 3)
!136 = distinct !DISubprogram(name: "elem_daxmy", scope: !3, file: !3, line: 175, type: !137, scopeLine: 175, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !140)
!137 = !DISubroutineType(types: !138)
!138 = !{null, !10, !139, !139, !26}
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!140 = !{!141, !142, !143, !144}
!141 = !DILocalVariable(name: "a", arg: 1, scope: !136, file: !3, line: 175, type: !10)
!142 = !DILocalVariable(name: "x", arg: 2, scope: !136, file: !3, line: 175, type: !139)
!143 = !DILocalVariable(name: "y", arg: 3, scope: !136, file: !3, line: 175, type: !139)
!144 = !DILocalVariable(name: "n", arg: 4, scope: !136, file: !3, line: 175, type: !26)
!145 = distinct !DILocation(line: 243, column: 7, scope: !146, inlinedAt: !131)
!146 = distinct !DILexicalBlock(scope: !147, file: !3, line: 242, column: 5)
!147 = distinct !DILexicalBlock(scope: !148, file: !3, line: 242, column: 5)
!148 = distinct !DILexicalBlock(scope: !149, file: !3, line: 241, column: 3)
!149 = distinct !DILexicalBlock(scope: !119, file: !3, line: 241, column: 3)
!150 = !DILocation(line: 242, column: 5, scope: !147, inlinedAt: !131)
!151 = !DILocation(line: 243, column: 18, scope: !146, inlinedAt: !131)
!152 = !DILocation(line: 0, scope: !136, inlinedAt: !145)
!153 = !DILocation(line: 178, column: 17, scope: !134, inlinedAt: !145)
!154 = !DILocation(line: 242, column: 34, scope: !146, inlinedAt: !131)
!155 = !DILocation(line: 242, column: 19, scope: !146, inlinedAt: !131)
!156 = distinct !{!156, !150, !157, !158}
!157 = !DILocation(line: 244, column: 38, scope: !147, inlinedAt: !131)
!158 = !{!"llvm.loop.mustprogress"}
!159 = !DILocation(line: 241, column: 32, scope: !148, inlinedAt: !131)
!160 = !DILocation(line: 241, column: 17, scope: !148, inlinedAt: !131)
!161 = !DILocation(line: 241, column: 3, scope: !149, inlinedAt: !131)
!162 = distinct !{!162, !161, !163, !158}
!163 = !DILocation(line: 244, column: 38, scope: !149, inlinedAt: !131)
!164 = !DILocation(line: 272, column: 12, scope: !93)
!165 = !DILocation(line: 273, column: 10, scope: !93)
!166 = !{!167, !167, i64 0}
!167 = !{!"int", !53, i64 0}
!168 = !DILocation(line: 274, column: 10, scope: !93)
!169 = !DILocation(line: 275, column: 10, scope: !93)
!170 = !DILocation(line: 276, column: 10, scope: !93)
!171 = !DILocation(line: 278, column: 10, scope: !93)
!172 = !DILocation(line: 279, column: 10, scope: !93)
!173 = !DILocation(line: 280, column: 10, scope: !93)
!174 = !DILocation(line: 282, column: 10, scope: !93)
!175 = !DILocation(line: 283, column: 10, scope: !93)
!176 = !DILocation(line: 284, column: 10, scope: !93)
!177 = !DILocation(line: 290, column: 14, scope: !93)
!178 = !DILocation(line: 291, column: 14, scope: !93)
!179 = !DILocation(line: 292, column: 14, scope: !93)
!180 = !DILocation(line: 293, column: 3, scope: !93)
!181 = !DILocation(line: 295, column: 3, scope: !93)
!182 = !DILocation(line: 301, column: 14, scope: !93)
!183 = !DILocation(line: 302, column: 14, scope: !93)
!184 = !DILocation(line: 303, column: 14, scope: !93)
!185 = !DILocation(line: 304, column: 3, scope: !93)
!186 = !DILocation(line: 306, column: 3, scope: !93)
!187 = !DILocation(line: 309, column: 1, scope: !93)
!188 = distinct !DISubprogram(name: "aux_lower_solve", scope: !3, file: !3, line: 318, type: !94, scopeLine: 318, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !189)
!189 = !{!190, !191, !192, !193, !194, !195, !196, !197}
!190 = !DILocalVariable(name: "Ma", arg: 1, scope: !188, file: !3, line: 318, type: !6)
!191 = !DILocalVariable(name: "Mb", arg: 2, scope: !188, file: !3, line: 318, type: !6)
!192 = !DILocalVariable(name: "L", arg: 3, scope: !188, file: !3, line: 318, type: !6)
!193 = !DILocalVariable(name: "nb", arg: 4, scope: !188, file: !3, line: 318, type: !26)
!194 = !DILocalVariable(name: "L00", scope: !188, file: !3, line: 320, type: !6)
!195 = !DILocalVariable(name: "L01", scope: !188, file: !3, line: 320, type: !6)
!196 = !DILocalVariable(name: "L10", scope: !188, file: !3, line: 320, type: !6)
!197 = !DILocalVariable(name: "L11", scope: !188, file: !3, line: 320, type: !6)
!198 = !DILocation(line: 0, scope: !199, inlinedAt: !211)
!199 = distinct !DISubprogram(name: "lower_solve", scope: !3, file: !3, line: 336, type: !200, scopeLine: 336, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !202)
!200 = !DISubroutineType(types: !201)
!201 = !{null, !6, !6, !26}
!202 = !{!203, !204, !205, !206, !207, !208, !209, !210}
!203 = !DILocalVariable(name: "M", arg: 1, scope: !199, file: !3, line: 336, type: !6)
!204 = !DILocalVariable(name: "L", arg: 2, scope: !199, file: !3, line: 336, type: !6)
!205 = !DILocalVariable(name: "nb", arg: 3, scope: !199, file: !3, line: 336, type: !26)
!206 = !DILocalVariable(name: "M00", scope: !199, file: !3, line: 338, type: !6)
!207 = !DILocalVariable(name: "M01", scope: !199, file: !3, line: 338, type: !6)
!208 = !DILocalVariable(name: "M10", scope: !199, file: !3, line: 338, type: !6)
!209 = !DILocalVariable(name: "M11", scope: !199, file: !3, line: 338, type: !6)
!210 = !DILocalVariable(name: "hnb", scope: !199, file: !3, line: 339, type: !26)
!211 = distinct !DILocation(line: 329, column: 3, scope: !188)
!212 = !DILocation(line: 0, scope: !188)
!213 = !DILocation(line: 323, column: 10, scope: !188)
!214 = !DILocation(line: 325, column: 10, scope: !188)
!215 = !DILocation(line: 326, column: 10, scope: !188)
!216 = !DILocation(line: 344, column: 10, scope: !217, inlinedAt: !211)
!217 = distinct !DILexicalBlock(scope: !199, file: !3, line: 344, column: 7)
!218 = !DILocation(line: 344, column: 7, scope: !199, inlinedAt: !211)
!219 = !DILocation(line: 350, column: 12, scope: !199, inlinedAt: !211)
!220 = !DILocation(line: 352, column: 10, scope: !199, inlinedAt: !211)
!221 = !DILocation(line: 353, column: 10, scope: !199, inlinedAt: !211)
!222 = !DILocation(line: 354, column: 10, scope: !199, inlinedAt: !211)
!223 = !DILocation(line: 358, column: 14, scope: !199, inlinedAt: !211)
!224 = !DILocation(line: 359, column: 3, scope: !199, inlinedAt: !211)
!225 = !DILocation(line: 361, column: 3, scope: !199, inlinedAt: !211)
!226 = !DILocation(line: 345, column: 23, scope: !227, inlinedAt: !211)
!227 = distinct !DILexicalBlock(scope: !217, file: !3, line: 344, column: 16)
!228 = !DILocation(line: 345, column: 27, scope: !227, inlinedAt: !211)
!229 = !DILocation(line: 345, column: 5, scope: !227, inlinedAt: !211)
!230 = !DILocation(line: 331, column: 3, scope: !188)
!231 = !DILocation(line: 0, scope: !199, inlinedAt: !232)
!232 = distinct !DILocation(line: 333, column: 3, scope: !188)
!233 = !DILocation(line: 345, column: 23, scope: !227, inlinedAt: !232)
!234 = !DILocation(line: 345, column: 27, scope: !227, inlinedAt: !232)
!235 = !DILocation(line: 345, column: 5, scope: !227, inlinedAt: !232)
!236 = !DILocation(line: 346, column: 5, scope: !227, inlinedAt: !232)
!237 = !DILocation(line: 351, column: 10, scope: !199, inlinedAt: !232)
!238 = !DILocation(line: 352, column: 10, scope: !199, inlinedAt: !232)
!239 = !DILocation(line: 353, column: 10, scope: !199, inlinedAt: !232)
!240 = !DILocation(line: 354, column: 10, scope: !199, inlinedAt: !232)
!241 = !DILocation(line: 358, column: 14, scope: !199, inlinedAt: !232)
!242 = !DILocation(line: 359, column: 3, scope: !199, inlinedAt: !232)
!243 = !DILocation(line: 361, column: 3, scope: !199, inlinedAt: !232)
!244 = !DILocation(line: 334, column: 1, scope: !188)
!245 = !DILocation(line: 0, scope: !199)
!246 = !DILocation(line: 344, column: 10, scope: !217)
!247 = !DILocation(line: 344, column: 7, scope: !199)
!248 = !DILocation(line: 345, column: 23, scope: !227)
!249 = !DILocation(line: 345, column: 27, scope: !227)
!250 = !DILocation(line: 345, column: 5, scope: !227)
!251 = !DILocation(line: 346, column: 5, scope: !227)
!252 = !DILocation(line: 350, column: 12, scope: !199)
!253 = !DILocation(line: 351, column: 10, scope: !199)
!254 = !DILocation(line: 352, column: 10, scope: !199)
!255 = !DILocation(line: 353, column: 10, scope: !199)
!256 = !DILocation(line: 354, column: 10, scope: !199)
!257 = !DILocation(line: 358, column: 14, scope: !199)
!258 = !DILocation(line: 359, column: 3, scope: !199)
!259 = !DILocation(line: 361, column: 3, scope: !199)
!260 = !DILocation(line: 364, column: 1, scope: !199)
!261 = distinct !DISubprogram(name: "block_lower_solve", scope: !3, file: !3, line: 205, type: !262, scopeLine: 205, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !264)
!262 = !DISubroutineType(types: !263)
!263 = !{null, !122, !122}
!264 = !{!265, !266, !267, !268}
!265 = !DILocalVariable(name: "B", arg: 1, scope: !261, file: !3, line: 205, type: !122)
!266 = !DILocalVariable(name: "L", arg: 2, scope: !261, file: !3, line: 205, type: !122)
!267 = !DILocalVariable(name: "i", scope: !261, file: !3, line: 207, type: !26)
!268 = !DILocalVariable(name: "k", scope: !261, file: !3, line: 207, type: !26)
!269 = !DILocation(line: 0, scope: !261)
!270 = !DILocation(line: 210, column: 3, scope: !271)
!271 = distinct !DILexicalBlock(scope: !261, file: !3, line: 210, column: 3)
!272 = !DILocation(line: 178, column: 10, scope: !134, inlinedAt: !273)
!273 = distinct !DILocation(line: 212, column: 7, scope: !274)
!274 = distinct !DILexicalBlock(scope: !275, file: !3, line: 211, column: 5)
!275 = distinct !DILexicalBlock(scope: !276, file: !3, line: 211, column: 5)
!276 = distinct !DILexicalBlock(scope: !271, file: !3, line: 210, column: 3)
!277 = !DILocation(line: 211, column: 5, scope: !275)
!278 = !DILocation(line: 212, column: 18, scope: !274)
!279 = !DILocation(line: 0, scope: !136, inlinedAt: !273)
!280 = !DILocation(line: 178, column: 17, scope: !134, inlinedAt: !273)
!281 = !DILocation(line: 211, column: 25, scope: !274)
!282 = !DILocation(line: 211, column: 19, scope: !274)
!283 = distinct !{!283, !277, !284, !158}
!284 = !DILocation(line: 213, column: 38, scope: !275)
!285 = !DILocation(line: 210, column: 32, scope: !276)
!286 = !DILocation(line: 210, column: 17, scope: !276)
!287 = distinct !{!287, !270, !288, !158}
!288 = !DILocation(line: 213, column: 38, scope: !271)
!289 = !DILocation(line: 214, column: 1, scope: !261)
!290 = distinct !DISubprogram(name: "aux_upper_solve", scope: !3, file: !3, line: 373, type: !94, scopeLine: 373, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !291)
!291 = !{!292, !293, !294, !295, !296, !297, !298, !299}
!292 = !DILocalVariable(name: "Ma", arg: 1, scope: !290, file: !3, line: 373, type: !6)
!293 = !DILocalVariable(name: "Mb", arg: 2, scope: !290, file: !3, line: 373, type: !6)
!294 = !DILocalVariable(name: "U", arg: 3, scope: !290, file: !3, line: 373, type: !6)
!295 = !DILocalVariable(name: "nb", arg: 4, scope: !290, file: !3, line: 373, type: !26)
!296 = !DILocalVariable(name: "U00", scope: !290, file: !3, line: 375, type: !6)
!297 = !DILocalVariable(name: "U01", scope: !290, file: !3, line: 375, type: !6)
!298 = !DILocalVariable(name: "U10", scope: !290, file: !3, line: 375, type: !6)
!299 = !DILocalVariable(name: "U11", scope: !290, file: !3, line: 375, type: !6)
!300 = !DILocation(line: 0, scope: !301, inlinedAt: !311)
!301 = distinct !DISubprogram(name: "upper_solve", scope: !3, file: !3, line: 393, type: !200, scopeLine: 393, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !302)
!302 = !{!303, !304, !305, !306, !307, !308, !309, !310}
!303 = !DILocalVariable(name: "M", arg: 1, scope: !301, file: !3, line: 393, type: !6)
!304 = !DILocalVariable(name: "U", arg: 2, scope: !301, file: !3, line: 393, type: !6)
!305 = !DILocalVariable(name: "nb", arg: 3, scope: !301, file: !3, line: 393, type: !26)
!306 = !DILocalVariable(name: "M00", scope: !301, file: !3, line: 395, type: !6)
!307 = !DILocalVariable(name: "M01", scope: !301, file: !3, line: 395, type: !6)
!308 = !DILocalVariable(name: "M10", scope: !301, file: !3, line: 395, type: !6)
!309 = !DILocalVariable(name: "M11", scope: !301, file: !3, line: 395, type: !6)
!310 = !DILocalVariable(name: "hnb", scope: !301, file: !3, line: 396, type: !26)
!311 = distinct !DILocation(line: 384, column: 3, scope: !290)
!312 = !DILocation(line: 0, scope: !290)
!313 = !DILocation(line: 378, column: 10, scope: !290)
!314 = !DILocation(line: 379, column: 10, scope: !290)
!315 = !DILocation(line: 380, column: 10, scope: !290)
!316 = !DILocation(line: 381, column: 10, scope: !290)
!317 = !DILocation(line: 401, column: 10, scope: !318, inlinedAt: !311)
!318 = distinct !DILexicalBlock(scope: !301, file: !3, line: 401, column: 7)
!319 = !DILocation(line: 401, column: 7, scope: !301, inlinedAt: !311)
!320 = !DILocation(line: 225, column: 3, scope: !321, inlinedAt: !328)
!321 = distinct !DILexicalBlock(scope: !322, file: !3, line: 225, column: 3)
!322 = distinct !DISubprogram(name: "block_upper_solve", scope: !3, file: !3, line: 220, type: !262, scopeLine: 220, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !323)
!323 = !{!324, !325, !326, !327}
!324 = !DILocalVariable(name: "B", arg: 1, scope: !322, file: !3, line: 220, type: !122)
!325 = !DILocalVariable(name: "U", arg: 2, scope: !322, file: !3, line: 220, type: !122)
!326 = !DILocalVariable(name: "i", scope: !322, file: !3, line: 222, type: !26)
!327 = !DILocalVariable(name: "k", scope: !322, file: !3, line: 222, type: !26)
!328 = distinct !DILocation(line: 402, column: 5, scope: !329, inlinedAt: !311)
!329 = distinct !DILexicalBlock(scope: !318, file: !3, line: 401, column: 16)
!330 = !DILocation(line: 0, scope: !322, inlinedAt: !328)
!331 = !DILocation(line: 227, column: 25, scope: !332, inlinedAt: !328)
!332 = distinct !DILexicalBlock(scope: !333, file: !3, line: 226, column: 38)
!333 = distinct !DILexicalBlock(scope: !334, file: !3, line: 226, column: 5)
!334 = distinct !DILexicalBlock(scope: !335, file: !3, line: 226, column: 5)
!335 = distinct !DILexicalBlock(scope: !321, file: !3, line: 225, column: 3)
!336 = !DILocation(line: 227, column: 7, scope: !332, inlinedAt: !328)
!337 = !DILocation(line: 227, column: 22, scope: !332, inlinedAt: !328)
!338 = !DILocation(line: 0, scope: !136, inlinedAt: !339)
!339 = distinct !DILocation(line: 228, column: 7, scope: !332, inlinedAt: !328)
!340 = !DILocation(line: 177, column: 3, scope: !135, inlinedAt: !339)
!341 = !DILocation(line: 228, column: 35, scope: !332, inlinedAt: !328)
!342 = !DILocation(line: 177, column: 15, scope: !134, inlinedAt: !339)
!343 = distinct !{!343, !344, !345, !158}
!344 = !DILocation(line: 226, column: 5, scope: !334, inlinedAt: !328)
!345 = !DILocation(line: 230, column: 5, scope: !334, inlinedAt: !328)
!346 = !DILocation(line: 229, column: 47, scope: !332, inlinedAt: !328)
!347 = !DILocation(line: 0, scope: !135, inlinedAt: !339)
!348 = !DILocation(line: 178, column: 17, scope: !134, inlinedAt: !339)
!349 = !DILocation(line: 178, column: 5, scope: !134, inlinedAt: !339)
!350 = !DILocation(line: 178, column: 10, scope: !134, inlinedAt: !339)
!351 = !DILocation(line: 225, column: 32, scope: !335, inlinedAt: !328)
!352 = !DILocation(line: 225, column: 17, scope: !335, inlinedAt: !328)
!353 = distinct !{!353, !320, !354, !158}
!354 = !DILocation(line: 230, column: 5, scope: !321, inlinedAt: !328)
!355 = !DILocation(line: 407, column: 12, scope: !301, inlinedAt: !311)
!356 = !DILocation(line: 410, column: 10, scope: !301, inlinedAt: !311)
!357 = !DILocation(line: 411, column: 10, scope: !301, inlinedAt: !311)
!358 = !DILocation(line: 415, column: 14, scope: !301, inlinedAt: !311)
!359 = !DILocation(line: 409, column: 10, scope: !301, inlinedAt: !311)
!360 = !DILocation(line: 416, column: 3, scope: !301, inlinedAt: !311)
!361 = !DILocation(line: 418, column: 3, scope: !301, inlinedAt: !311)
!362 = !DILocation(line: 386, column: 3, scope: !290)
!363 = !DILocation(line: 0, scope: !301, inlinedAt: !364)
!364 = distinct !DILocation(line: 388, column: 3, scope: !290)
!365 = !DILocation(line: 225, column: 3, scope: !321, inlinedAt: !366)
!366 = distinct !DILocation(line: 402, column: 5, scope: !329, inlinedAt: !364)
!367 = !DILocation(line: 0, scope: !322, inlinedAt: !366)
!368 = !DILocation(line: 227, column: 25, scope: !332, inlinedAt: !366)
!369 = !DILocation(line: 227, column: 7, scope: !332, inlinedAt: !366)
!370 = !DILocation(line: 227, column: 22, scope: !332, inlinedAt: !366)
!371 = !DILocation(line: 0, scope: !136, inlinedAt: !372)
!372 = distinct !DILocation(line: 228, column: 7, scope: !332, inlinedAt: !366)
!373 = !DILocation(line: 177, column: 3, scope: !135, inlinedAt: !372)
!374 = !DILocation(line: 228, column: 35, scope: !332, inlinedAt: !366)
!375 = !DILocation(line: 177, column: 15, scope: !134, inlinedAt: !372)
!376 = distinct !{!376, !377, !378, !158}
!377 = !DILocation(line: 226, column: 5, scope: !334, inlinedAt: !366)
!378 = !DILocation(line: 230, column: 5, scope: !334, inlinedAt: !366)
!379 = !DILocation(line: 229, column: 47, scope: !332, inlinedAt: !366)
!380 = !DILocation(line: 0, scope: !135, inlinedAt: !372)
!381 = !DILocation(line: 178, column: 17, scope: !134, inlinedAt: !372)
!382 = !DILocation(line: 178, column: 5, scope: !134, inlinedAt: !372)
!383 = !DILocation(line: 178, column: 10, scope: !134, inlinedAt: !372)
!384 = !DILocation(line: 225, column: 32, scope: !335, inlinedAt: !366)
!385 = !DILocation(line: 225, column: 17, scope: !335, inlinedAt: !366)
!386 = distinct !{!386, !365, !387, !158}
!387 = !DILocation(line: 230, column: 5, scope: !321, inlinedAt: !366)
!388 = !DILocation(line: 408, column: 10, scope: !301, inlinedAt: !364)
!389 = !DILocation(line: 410, column: 10, scope: !301, inlinedAt: !364)
!390 = !DILocation(line: 411, column: 10, scope: !301, inlinedAt: !364)
!391 = !DILocation(line: 415, column: 14, scope: !301, inlinedAt: !364)
!392 = !DILocation(line: 409, column: 10, scope: !301, inlinedAt: !364)
!393 = !DILocation(line: 416, column: 3, scope: !301, inlinedAt: !364)
!394 = !DILocation(line: 418, column: 3, scope: !301, inlinedAt: !364)
!395 = !DILocation(line: 391, column: 1, scope: !290)
!396 = !DILocation(line: 0, scope: !301)
!397 = !DILocation(line: 401, column: 10, scope: !318)
!398 = !DILocation(line: 401, column: 7, scope: !301)
!399 = !DILocation(line: 225, column: 3, scope: !321, inlinedAt: !400)
!400 = distinct !DILocation(line: 402, column: 5, scope: !329)
!401 = !DILocation(line: 0, scope: !322, inlinedAt: !400)
!402 = !DILocation(line: 227, column: 25, scope: !332, inlinedAt: !400)
!403 = !DILocation(line: 227, column: 7, scope: !332, inlinedAt: !400)
!404 = !DILocation(line: 227, column: 22, scope: !332, inlinedAt: !400)
!405 = !DILocation(line: 0, scope: !136, inlinedAt: !406)
!406 = distinct !DILocation(line: 228, column: 7, scope: !332, inlinedAt: !400)
!407 = !DILocation(line: 177, column: 3, scope: !135, inlinedAt: !406)
!408 = !DILocation(line: 229, column: 12, scope: !332, inlinedAt: !400)
!409 = !DILocation(line: 228, column: 35, scope: !332, inlinedAt: !400)
!410 = !DILocation(line: 177, column: 15, scope: !134, inlinedAt: !406)
!411 = distinct !{!411, !412, !413, !158}
!412 = !DILocation(line: 226, column: 5, scope: !334, inlinedAt: !400)
!413 = !DILocation(line: 230, column: 5, scope: !334, inlinedAt: !400)
!414 = !DILocation(line: 229, column: 47, scope: !332, inlinedAt: !400)
!415 = !DILocation(line: 0, scope: !135, inlinedAt: !406)
!416 = !DILocation(line: 178, column: 17, scope: !134, inlinedAt: !406)
!417 = !DILocation(line: 178, column: 5, scope: !134, inlinedAt: !406)
!418 = !DILocation(line: 178, column: 10, scope: !134, inlinedAt: !406)
!419 = !DILocation(line: 225, column: 32, scope: !335, inlinedAt: !400)
!420 = !DILocation(line: 225, column: 17, scope: !335, inlinedAt: !400)
!421 = distinct !{!421, !399, !422, !158}
!422 = !DILocation(line: 230, column: 5, scope: !321, inlinedAt: !400)
!423 = !DILocation(line: 407, column: 12, scope: !301)
!424 = !DILocation(line: 408, column: 10, scope: !301)
!425 = !DILocation(line: 410, column: 10, scope: !301)
!426 = !DILocation(line: 411, column: 10, scope: !301)
!427 = !DILocation(line: 415, column: 14, scope: !301)
!428 = !DILocation(line: 409, column: 10, scope: !301)
!429 = !DILocation(line: 416, column: 3, scope: !301)
!430 = !DILocation(line: 418, column: 3, scope: !301)
!431 = !DILocation(line: 421, column: 1, scope: !301)
!432 = distinct !DISubprogram(name: "lu", scope: !3, file: !3, line: 427, type: !433, scopeLine: 427, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !435)
!433 = !DISubroutineType(types: !434)
!434 = !{null, !6, !26}
!435 = !{!436, !437, !438, !439, !440, !441, !442}
!436 = !DILocalVariable(name: "M", arg: 1, scope: !432, file: !3, line: 427, type: !6)
!437 = !DILocalVariable(name: "nb", arg: 2, scope: !432, file: !3, line: 427, type: !26)
!438 = !DILocalVariable(name: "M00", scope: !432, file: !3, line: 429, type: !6)
!439 = !DILocalVariable(name: "M01", scope: !432, file: !3, line: 429, type: !6)
!440 = !DILocalVariable(name: "M10", scope: !432, file: !3, line: 429, type: !6)
!441 = !DILocalVariable(name: "M11", scope: !432, file: !3, line: 429, type: !6)
!442 = !DILocalVariable(name: "hnb", scope: !432, file: !3, line: 430, type: !26)
!443 = !DILocation(line: 0, scope: !432)
!444 = !DILocation(line: 436, column: 10, scope: !445)
!445 = distinct !DILexicalBlock(scope: !432, file: !3, line: 436, column: 7)
!446 = !DILocation(line: 436, column: 7, scope: !432)
!447 = !DILocation(line: 193, column: 3, scope: !448, inlinedAt: !456)
!448 = distinct !DILexicalBlock(scope: !449, file: !3, line: 193, column: 3)
!449 = distinct !DISubprogram(name: "block_lu", scope: !3, file: !3, line: 188, type: !450, scopeLine: 188, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !452)
!450 = !DISubroutineType(types: !451)
!451 = !{null, !122}
!452 = !{!453, !454, !455}
!453 = !DILocalVariable(name: "B", arg: 1, scope: !449, file: !3, line: 188, type: !122)
!454 = !DILocalVariable(name: "i", scope: !449, file: !3, line: 190, type: !26)
!455 = !DILocalVariable(name: "k", scope: !449, file: !3, line: 190, type: !26)
!456 = distinct !DILocation(line: 437, column: 5, scope: !457)
!457 = distinct !DILexicalBlock(scope: !445, file: !3, line: 436, column: 16)
!458 = !DILocation(line: 0, scope: !449, inlinedAt: !456)
!459 = !DILocation(line: 193, column: 17, scope: !460, inlinedAt: !456)
!460 = distinct !DILexicalBlock(scope: !448, file: !3, line: 193, column: 3)
!461 = distinct !{!461, !447, !462, !158}
!462 = !DILocation(line: 198, column: 5, scope: !448, inlinedAt: !456)
!463 = !DILocation(line: 194, column: 16, scope: !464, inlinedAt: !456)
!464 = distinct !DILexicalBlock(scope: !460, file: !3, line: 194, column: 5)
!465 = !DILocation(line: 194, column: 23, scope: !466, inlinedAt: !456)
!466 = distinct !DILexicalBlock(scope: !464, file: !3, line: 194, column: 5)
!467 = !DILocation(line: 194, column: 5, scope: !464, inlinedAt: !456)
!468 = !DILocation(line: 195, column: 25, scope: !469, inlinedAt: !456)
!469 = distinct !DILexicalBlock(scope: !466, file: !3, line: 194, column: 42)
!470 = !DILocation(line: 195, column: 7, scope: !469, inlinedAt: !456)
!471 = !DILocation(line: 195, column: 22, scope: !469, inlinedAt: !456)
!472 = !DILocation(line: 197, column: 12, scope: !469, inlinedAt: !456)
!473 = !DILocation(line: 0, scope: !136, inlinedAt: !474)
!474 = distinct !DILocation(line: 196, column: 7, scope: !469, inlinedAt: !456)
!475 = !DILocation(line: 177, column: 3, scope: !135, inlinedAt: !474)
!476 = !DILocation(line: 178, column: 17, scope: !134, inlinedAt: !474)
!477 = !DILocation(line: 178, column: 5, scope: !134, inlinedAt: !474)
!478 = !DILocation(line: 178, column: 10, scope: !134, inlinedAt: !474)
!479 = !DILocation(line: 0, scope: !135, inlinedAt: !474)
!480 = !DILocation(line: 177, column: 15, scope: !134, inlinedAt: !474)
!481 = distinct !{!481, !475, !482, !158}
!482 = !DILocation(line: 178, column: 20, scope: !135, inlinedAt: !474)
!483 = !DILocation(line: 194, column: 38, scope: !466, inlinedAt: !456)
!484 = distinct !{!484, !467, !485, !158}
!485 = !DILocation(line: 198, column: 5, scope: !464, inlinedAt: !456)
!486 = !DILocation(line: 443, column: 12, scope: !432)
!487 = !DILocation(line: 444, column: 10, scope: !432)
!488 = !DILocation(line: 445, column: 10, scope: !432)
!489 = !DILocation(line: 446, column: 10, scope: !432)
!490 = !DILocation(line: 447, column: 10, scope: !432)
!491 = !DILocation(line: 450, column: 3, scope: !432)
!492 = !DILocation(line: 452, column: 14, scope: !432)
!493 = !DILocation(line: 0, scope: !199, inlinedAt: !494)
!494 = distinct !DILocation(line: 452, column: 14, scope: !432)
!495 = !DILocation(line: 344, column: 10, scope: !217, inlinedAt: !494)
!496 = !DILocation(line: 344, column: 7, scope: !199, inlinedAt: !494)
!497 = !DILocation(line: 345, column: 23, scope: !227, inlinedAt: !494)
!498 = !DILocation(line: 345, column: 27, scope: !227, inlinedAt: !494)
!499 = !DILocation(line: 345, column: 5, scope: !227, inlinedAt: !494)
!500 = !DILocation(line: 346, column: 5, scope: !227, inlinedAt: !494)
!501 = !DILocation(line: 350, column: 12, scope: !199, inlinedAt: !494)
!502 = !DILocation(line: 351, column: 10, scope: !199, inlinedAt: !494)
!503 = !DILocation(line: 352, column: 10, scope: !199, inlinedAt: !494)
!504 = !DILocation(line: 353, column: 10, scope: !199, inlinedAt: !494)
!505 = !DILocation(line: 354, column: 10, scope: !199, inlinedAt: !494)
!506 = !DILocation(line: 358, column: 14, scope: !199, inlinedAt: !494)
!507 = !DILocation(line: 359, column: 3, scope: !199, inlinedAt: !494)
!508 = !DILocation(line: 361, column: 3, scope: !199, inlinedAt: !494)
!509 = !DILocation(line: 0, scope: !301, inlinedAt: !510)
!510 = distinct !DILocation(line: 453, column: 3, scope: !432)
!511 = !DILocation(line: 401, column: 10, scope: !318, inlinedAt: !510)
!512 = !DILocation(line: 401, column: 7, scope: !301, inlinedAt: !510)
!513 = !DILocation(line: 225, column: 3, scope: !321, inlinedAt: !514)
!514 = distinct !DILocation(line: 402, column: 5, scope: !329, inlinedAt: !510)
!515 = !DILocation(line: 0, scope: !322, inlinedAt: !514)
!516 = !DILocation(line: 227, column: 25, scope: !332, inlinedAt: !514)
!517 = !DILocation(line: 227, column: 7, scope: !332, inlinedAt: !514)
!518 = !DILocation(line: 227, column: 22, scope: !332, inlinedAt: !514)
!519 = !DILocation(line: 0, scope: !136, inlinedAt: !520)
!520 = distinct !DILocation(line: 228, column: 7, scope: !332, inlinedAt: !514)
!521 = !DILocation(line: 177, column: 3, scope: !135, inlinedAt: !520)
!522 = !DILocation(line: 228, column: 35, scope: !332, inlinedAt: !514)
!523 = !DILocation(line: 177, column: 15, scope: !134, inlinedAt: !520)
!524 = distinct !{!524, !525, !526, !158}
!525 = !DILocation(line: 226, column: 5, scope: !334, inlinedAt: !514)
!526 = !DILocation(line: 230, column: 5, scope: !334, inlinedAt: !514)
!527 = !DILocation(line: 229, column: 47, scope: !332, inlinedAt: !514)
!528 = !DILocation(line: 0, scope: !135, inlinedAt: !520)
!529 = !DILocation(line: 178, column: 17, scope: !134, inlinedAt: !520)
!530 = !DILocation(line: 178, column: 5, scope: !134, inlinedAt: !520)
!531 = !DILocation(line: 178, column: 10, scope: !134, inlinedAt: !520)
!532 = !DILocation(line: 225, column: 32, scope: !335, inlinedAt: !514)
!533 = !DILocation(line: 225, column: 17, scope: !335, inlinedAt: !514)
!534 = distinct !{!534, !513, !535, !158}
!535 = !DILocation(line: 230, column: 5, scope: !321, inlinedAt: !514)
!536 = !DILocation(line: 407, column: 12, scope: !301, inlinedAt: !510)
!537 = !DILocation(line: 408, column: 10, scope: !301, inlinedAt: !510)
!538 = !DILocation(line: 410, column: 10, scope: !301, inlinedAt: !510)
!539 = !DILocation(line: 411, column: 10, scope: !301, inlinedAt: !510)
!540 = !DILocation(line: 415, column: 14, scope: !301, inlinedAt: !510)
!541 = !DILocation(line: 409, column: 10, scope: !301, inlinedAt: !510)
!542 = !DILocation(line: 416, column: 3, scope: !301, inlinedAt: !510)
!543 = !DILocation(line: 418, column: 3, scope: !301, inlinedAt: !510)
!544 = !DILocation(line: 455, column: 3, scope: !432)
!545 = !DILocation(line: 458, column: 3, scope: !432)
!546 = !DILocation(line: 464, column: 1, scope: !432)
!547 = distinct !DISubprogram(name: "usage", scope: !3, file: !3, line: 473, type: !548, scopeLine: 473, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !550)
!548 = !DISubroutineType(types: !549)
!549 = !{!26}
!550 = !{}
!551 = !DILocation(line: 475, column: 3, scope: !547)
!552 = !DILocation(line: 476, column: 3, scope: !547)
!553 = !DILocation(line: 477, column: 3, scope: !547)
!554 = !DILocation(line: 479, column: 3, scope: !547)
!555 = !DILocation(line: 480, column: 3, scope: !547)
!556 = !DILocation(line: 481, column: 3, scope: !547)
!557 = !DILocation(line: 483, column: 3, scope: !547)
!558 = distinct !DISubprogram(name: "invalid_input", scope: !3, file: !3, line: 486, type: !559, scopeLine: 486, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !561)
!559 = !DISubroutineType(types: !560)
!560 = !{!26, !26}
!561 = !{!562, !563}
!562 = !DILocalVariable(name: "n", arg: 1, scope: !558, file: !3, line: 486, type: !26)
!563 = !DILocalVariable(name: "v", scope: !558, file: !3, line: 488, type: !26)
!564 = !DILocation(line: 0, scope: !558)
!565 = !DILocation(line: 491, column: 9, scope: !566)
!566 = distinct !DILexicalBlock(scope: !558, file: !3, line: 491, column: 7)
!567 = !DILocation(line: 491, column: 7, scope: !558)
!568 = !DILocation(line: 495, column: 25, scope: !558)
!569 = !DILocation(line: 495, column: 10, scope: !558)
!570 = !DILocation(line: 496, column: 7, scope: !558)
!571 = !DILocation(line: 495, column: 3, scope: !558)
!572 = distinct !{!572, !571, !573, !158}
!573 = !DILocation(line: 496, column: 11, scope: !558)
!574 = !DILocation(line: 497, column: 9, scope: !575)
!575 = distinct !DILexicalBlock(scope: !558, file: !3, line: 497, column: 7)
!576 = !DILocation(line: 497, column: 7, scope: !558)
!577 = !DILocation(line: 501, column: 1, scope: !558)
!578 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 510, type: !579, scopeLine: 510, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !583)
!579 = !DISubroutineType(types: !580)
!580 = !{!26, !26, !581}
!581 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !582, size: 64)
!582 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!583 = !{!584, !585, !586, !587, !588, !589, !590, !591, !592, !593, !594, !595, !597, !600, !601}
!584 = !DILocalVariable(name: "argc", arg: 1, scope: !578, file: !3, line: 510, type: !26)
!585 = !DILocalVariable(name: "argv", arg: 2, scope: !578, file: !3, line: 510, type: !581)
!586 = !DILocalVariable(name: "print", scope: !578, file: !3, line: 512, type: !26)
!587 = !DILocalVariable(name: "test", scope: !578, file: !3, line: 512, type: !26)
!588 = !DILocalVariable(name: "n", scope: !578, file: !3, line: 512, type: !26)
!589 = !DILocalVariable(name: "benchmark", scope: !578, file: !3, line: 512, type: !26)
!590 = !DILocalVariable(name: "help", scope: !578, file: !3, line: 512, type: !26)
!591 = !DILocalVariable(name: "failed", scope: !578, file: !3, line: 512, type: !26)
!592 = !DILocalVariable(name: "round", scope: !578, file: !3, line: 512, type: !26)
!593 = !DILocalVariable(name: "M", scope: !578, file: !3, line: 513, type: !6)
!594 = !DILocalVariable(name: "Msave", scope: !578, file: !3, line: 513, type: !6)
!595 = !DILocalVariable(name: "r", scope: !596, file: !3, line: 555, type: !26)
!596 = distinct !DILexicalBlock(scope: !578, file: !3, line: 555, column: 3)
!597 = !DILocalVariable(name: "t1", scope: !598, file: !3, line: 568, type: !37)
!598 = distinct !DILexicalBlock(scope: !599, file: !3, line: 555, column: 31)
!599 = distinct !DILexicalBlock(scope: !596, file: !3, line: 555, column: 3)
!600 = !DILocalVariable(name: "t2", scope: !598, file: !3, line: 568, type: !37)
!601 = !DILocalVariable(name: "runtime_ms", scope: !598, file: !3, line: 573, type: !35)
!602 = !DILocation(line: 0, scope: !578)
!603 = !DILocation(line: 512, column: 3, scope: !578)
!604 = !DILocation(line: 515, column: 5, scope: !578)
!605 = !DILocation(line: 516, column: 9, scope: !578)
!606 = !DILocation(line: 517, column: 8, scope: !578)
!607 = !DILocation(line: 518, column: 9, scope: !578)
!608 = !DILocation(line: 521, column: 3, scope: !578)
!609 = !DILocation(line: 524, column: 7, scope: !610)
!610 = distinct !DILexicalBlock(scope: !578, file: !3, line: 524, column: 7)
!611 = !DILocation(line: 524, column: 7, scope: !578)
!612 = !DILocation(line: 475, column: 3, scope: !547, inlinedAt: !613)
!613 = distinct !DILocation(line: 525, column: 12, scope: !610)
!614 = !DILocation(line: 476, column: 3, scope: !547, inlinedAt: !613)
!615 = !DILocation(line: 477, column: 3, scope: !547, inlinedAt: !613)
!616 = !DILocation(line: 479, column: 3, scope: !547, inlinedAt: !613)
!617 = !DILocation(line: 480, column: 3, scope: !547, inlinedAt: !613)
!618 = !DILocation(line: 481, column: 3, scope: !547, inlinedAt: !613)
!619 = !DILocation(line: 525, column: 5, scope: !610)
!620 = !DILocation(line: 527, column: 7, scope: !621)
!621 = distinct !DILexicalBlock(scope: !578, file: !3, line: 527, column: 7)
!622 = !DILocation(line: 527, column: 7, scope: !578)
!623 = !DILocation(line: 530, column: 11, scope: !624)
!624 = distinct !DILexicalBlock(scope: !625, file: !3, line: 528, column: 24)
!625 = distinct !DILexicalBlock(scope: !621, file: !3, line: 527, column: 18)
!626 = !DILocation(line: 531, column: 9, scope: !624)
!627 = !DILocation(line: 533, column: 11, scope: !624)
!628 = !DILocation(line: 534, column: 9, scope: !624)
!629 = !DILocation(line: 536, column: 11, scope: !624)
!630 = !DILocation(line: 537, column: 9, scope: !624)
!631 = !DILocation(line: 542, column: 3, scope: !578)
!632 = !DILocation(line: 544, column: 21, scope: !633)
!633 = distinct !DILexicalBlock(scope: !578, file: !3, line: 544, column: 7)
!634 = !DILocation(line: 0, scope: !558, inlinedAt: !635)
!635 = distinct !DILocation(line: 544, column: 7, scope: !633)
!636 = !DILocation(line: 491, column: 9, scope: !566, inlinedAt: !635)
!637 = !DILocation(line: 491, column: 7, scope: !558, inlinedAt: !635)
!638 = !DILocation(line: 495, column: 25, scope: !558, inlinedAt: !635)
!639 = !DILocation(line: 495, column: 10, scope: !558, inlinedAt: !635)
!640 = !DILocation(line: 496, column: 7, scope: !558, inlinedAt: !635)
!641 = !DILocation(line: 495, column: 3, scope: !558, inlinedAt: !635)
!642 = distinct !{!642, !641, !643, !158}
!643 = !DILocation(line: 496, column: 11, scope: !558, inlinedAt: !635)
!644 = !DILocation(line: 497, column: 9, scope: !575, inlinedAt: !635)
!645 = !DILocation(line: 497, column: 7, scope: !558, inlinedAt: !635)
!646 = !DILocation(line: 544, column: 7, scope: !578)
!647 = !DILocation(line: 546, column: 15, scope: !578)
!648 = !DILocation(line: 546, column: 11, scope: !578)
!649 = !DILocation(line: 549, column: 25, scope: !578)
!650 = !DILocation(line: 549, column: 23, scope: !578)
!651 = !DILocation(line: 549, column: 29, scope: !578)
!652 = !DILocation(line: 549, column: 16, scope: !578)
!653 = !DILocation(line: 549, column: 7, scope: !578)
!654 = !DILocation(line: 550, column: 8, scope: !655)
!655 = distinct !DILexicalBlock(scope: !578, file: !3, line: 550, column: 7)
!656 = !DILocation(line: 550, column: 7, scope: !578)
!657 = !DILocation(line: 0, scope: !596)
!658 = !DILocation(line: 555, column: 19, scope: !599)
!659 = !DILocation(line: 555, column: 18, scope: !599)
!660 = !DILocation(line: 555, column: 3, scope: !596)
!661 = !DILocation(line: 551, column: 13, scope: !662)
!662 = distinct !DILexicalBlock(scope: !655, file: !3, line: 550, column: 11)
!663 = !{!664, !664, i64 0}
!664 = !{!"any pointer", !53, i64 0}
!665 = !DILocation(line: 551, column: 5, scope: !662)
!666 = !DILocation(line: 552, column: 5, scope: !662)
!667 = !DILocation(line: 557, column: 20, scope: !598)
!668 = !DILocalVariable(name: "M", arg: 1, scope: !669, file: !3, line: 81, type: !6)
!669 = distinct !DISubprogram(name: "init_matrix", scope: !3, file: !3, line: 81, type: !433, scopeLine: 81, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !670)
!670 = !{!668, !671, !672, !673, !674, !675, !676, !677}
!671 = !DILocalVariable(name: "nb", arg: 2, scope: !669, file: !3, line: 81, type: !26)
!672 = !DILocalVariable(name: "I", scope: !669, file: !3, line: 83, type: !26)
!673 = !DILocalVariable(name: "J", scope: !669, file: !3, line: 83, type: !26)
!674 = !DILocalVariable(name: "K", scope: !669, file: !3, line: 83, type: !26)
!675 = !DILocalVariable(name: "i", scope: !669, file: !3, line: 83, type: !26)
!676 = !DILocalVariable(name: "j", scope: !669, file: !3, line: 83, type: !26)
!677 = !DILocalVariable(name: "k", scope: !669, file: !3, line: 83, type: !26)
!678 = !DILocation(line: 0, scope: !669, inlinedAt: !679)
!679 = distinct !DILocation(line: 557, column: 5, scope: !598)
!680 = !DILocation(line: 86, column: 3, scope: !669, inlinedAt: !679)
!681 = !DILocation(line: 89, column: 17, scope: !682, inlinedAt: !679)
!682 = distinct !DILexicalBlock(scope: !683, file: !3, line: 89, column: 3)
!683 = distinct !DILexicalBlock(scope: !669, file: !3, line: 89, column: 3)
!684 = !DILocation(line: 89, column: 3, scope: !683, inlinedAt: !679)
!685 = !DILocation(line: 90, column: 5, scope: !686, inlinedAt: !679)
!686 = distinct !DILexicalBlock(scope: !682, file: !3, line: 90, column: 5)
!687 = !DILocation(line: 90, column: 26, scope: !688, inlinedAt: !679)
!688 = distinct !DILexicalBlock(scope: !686, file: !3, line: 90, column: 5)
!689 = !DILocation(line: 90, column: 19, scope: !688, inlinedAt: !679)
!690 = distinct !{!690, !685, !691, !158}
!691 = !DILocation(line: 94, column: 40, scope: !686, inlinedAt: !679)
!692 = !DILocation(line: 94, column: 22, scope: !693, inlinedAt: !679)
!693 = distinct !DILexicalBlock(scope: !694, file: !3, line: 92, column: 9)
!694 = distinct !DILexicalBlock(scope: !695, file: !3, line: 92, column: 9)
!695 = distinct !DILexicalBlock(scope: !696, file: !3, line: 91, column: 7)
!696 = distinct !DILexicalBlock(scope: !688, file: !3, line: 91, column: 7)
!697 = !DILocation(line: 94, column: 14, scope: !693, inlinedAt: !679)
!698 = !DILocation(line: 94, column: 30, scope: !693, inlinedAt: !679)
!699 = !DILocation(line: 93, column: 11, scope: !693, inlinedAt: !679)
!700 = !DILocation(line: 93, column: 40, scope: !693, inlinedAt: !679)
!701 = !DILocation(line: 91, column: 36, scope: !695, inlinedAt: !679)
!702 = !DILocation(line: 91, column: 21, scope: !695, inlinedAt: !679)
!703 = !DILocation(line: 91, column: 7, scope: !696, inlinedAt: !679)
!704 = distinct !{!704, !703, !705, !158}
!705 = !DILocation(line: 94, column: 40, scope: !696, inlinedAt: !679)
!706 = !DILocation(line: 89, column: 24, scope: !682, inlinedAt: !679)
!707 = distinct !{!707, !684, !708, !158}
!708 = !DILocation(line: 94, column: 40, scope: !683, inlinedAt: !679)
!709 = !DILocation(line: 97, column: 17, scope: !710, inlinedAt: !679)
!710 = distinct !DILexicalBlock(scope: !711, file: !3, line: 97, column: 3)
!711 = distinct !DILexicalBlock(scope: !669, file: !3, line: 97, column: 3)
!712 = !DILocation(line: 97, column: 3, scope: !711, inlinedAt: !679)
!713 = !DILocation(line: 99, column: 7, scope: !714, inlinedAt: !679)
!714 = distinct !DILexicalBlock(scope: !715, file: !3, line: 98, column: 5)
!715 = distinct !DILexicalBlock(scope: !710, file: !3, line: 98, column: 5)
!716 = !DILocation(line: 99, column: 36, scope: !714, inlinedAt: !679)
!717 = !DILocation(line: 97, column: 24, scope: !710, inlinedAt: !679)
!718 = distinct !{!718, !712, !719, !158}
!719 = !DILocation(line: 99, column: 39, scope: !711, inlinedAt: !679)
!720 = !DILocation(line: 559, column: 9, scope: !721)
!721 = distinct !DILexicalBlock(scope: !598, file: !3, line: 559, column: 9)
!722 = !DILocation(line: 559, column: 9, scope: !598)
!723 = !DILocation(line: 560, column: 23, scope: !721)
!724 = !DILocalVariable(name: "M", arg: 1, scope: !725, file: !3, line: 105, type: !6)
!725 = distinct !DISubprogram(name: "print_matrix", scope: !3, file: !3, line: 105, type: !433, scopeLine: 105, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !726)
!726 = !{!724, !727, !728, !729}
!727 = !DILocalVariable(name: "nb", arg: 2, scope: !725, file: !3, line: 105, type: !26)
!728 = !DILocalVariable(name: "i", scope: !725, file: !3, line: 107, type: !26)
!729 = !DILocalVariable(name: "j", scope: !725, file: !3, line: 107, type: !26)
!730 = !DILocation(line: 0, scope: !725, inlinedAt: !731)
!731 = distinct !DILocation(line: 560, column: 7, scope: !721)
!732 = !DILocation(line: 110, column: 17, scope: !733, inlinedAt: !731)
!733 = distinct !DILexicalBlock(scope: !734, file: !3, line: 110, column: 3)
!734 = distinct !DILexicalBlock(scope: !725, file: !3, line: 110, column: 3)
!735 = !DILocation(line: 110, column: 3, scope: !734, inlinedAt: !731)
!736 = !DILocation(line: 111, column: 5, scope: !737, inlinedAt: !731)
!737 = distinct !DILexicalBlock(scope: !738, file: !3, line: 111, column: 5)
!738 = distinct !DILexicalBlock(scope: !733, file: !3, line: 110, column: 41)
!739 = !DILocation(line: 113, column: 11, scope: !740, inlinedAt: !731)
!740 = distinct !DILexicalBlock(scope: !737, file: !3, line: 111, column: 5)
!741 = !DILocation(line: 112, column: 7, scope: !740, inlinedAt: !731)
!742 = !DILocation(line: 111, column: 39, scope: !740, inlinedAt: !731)
!743 = !DILocation(line: 111, column: 19, scope: !740, inlinedAt: !731)
!744 = distinct !{!744, !736, !745, !158}
!745 = !DILocation(line: 114, column: 44, scope: !737, inlinedAt: !731)
!746 = !DILocation(line: 115, column: 5, scope: !738, inlinedAt: !731)
!747 = !DILocation(line: 110, column: 37, scope: !733, inlinedAt: !731)
!748 = distinct !{!748, !735, !749, !158}
!749 = !DILocation(line: 116, column: 3, scope: !734, inlinedAt: !731)
!750 = !DILocation(line: 562, column: 29, scope: !598)
!751 = !DILocation(line: 562, column: 31, scope: !598)
!752 = !DILocation(line: 562, column: 35, scope: !598)
!753 = !DILocation(line: 562, column: 22, scope: !598)
!754 = !DILocation(line: 562, column: 13, scope: !598)
!755 = !DILocation(line: 563, column: 10, scope: !756)
!756 = distinct !DILexicalBlock(scope: !598, file: !3, line: 563, column: 9)
!757 = !DILocation(line: 563, column: 9, scope: !598)
!758 = !DILocation(line: 567, column: 5, scope: !598)
!759 = !DILocation(line: 568, column: 5, scope: !598)
!760 = !DILocation(line: 568, column: 20, scope: !598)
!761 = !DILocation(line: 568, column: 24, scope: !598)
!762 = !DILocation(line: 569, column: 5, scope: !598)
!763 = !DILocation(line: 570, column: 11, scope: !598)
!764 = !DILocation(line: 570, column: 5, scope: !598)
!765 = !DILocation(line: 572, column: 5, scope: !598)
!766 = !DILocation(line: 0, scope: !32, inlinedAt: !767)
!767 = distinct !DILocation(line: 573, column: 38, scope: !598)
!768 = !DILocation(line: 33, column: 16, scope: !32, inlinedAt: !767)
!769 = !DILocation(line: 33, column: 43, scope: !32, inlinedAt: !767)
!770 = !DILocation(line: 0, scope: !32, inlinedAt: !771)
!771 = distinct !DILocation(line: 573, column: 50, scope: !598)
!772 = !DILocation(line: 33, column: 16, scope: !32, inlinedAt: !771)
!773 = !DILocation(line: 33, column: 43, scope: !32, inlinedAt: !771)
!774 = !DILocation(line: 33, column: 37, scope: !32, inlinedAt: !767)
!775 = !DILocation(line: 573, column: 49, scope: !598)
!776 = !DILocation(line: 573, column: 62, scope: !598)
!777 = !DILocation(line: 0, scope: !598)
!778 = !DILocation(line: 574, column: 31, scope: !598)
!779 = !DILocation(line: 574, column: 41, scope: !598)
!780 = !DILocation(line: 574, column: 5, scope: !598)
!781 = !DILocation(line: 578, column: 8, scope: !782)
!782 = distinct !DILexicalBlock(scope: !598, file: !3, line: 578, column: 8)
!783 = !DILocation(line: 578, column: 8, scope: !598)
!784 = !DILocation(line: 579, column: 23, scope: !782)
!785 = !DILocation(line: 0, scope: !725, inlinedAt: !786)
!786 = distinct !DILocation(line: 579, column: 7, scope: !782)
!787 = !DILocation(line: 110, column: 17, scope: !733, inlinedAt: !786)
!788 = !DILocation(line: 110, column: 3, scope: !734, inlinedAt: !786)
!789 = !DILocation(line: 111, column: 5, scope: !737, inlinedAt: !786)
!790 = !DILocation(line: 113, column: 11, scope: !740, inlinedAt: !786)
!791 = !DILocation(line: 112, column: 7, scope: !740, inlinedAt: !786)
!792 = !DILocation(line: 111, column: 39, scope: !740, inlinedAt: !786)
!793 = !DILocation(line: 111, column: 19, scope: !740, inlinedAt: !786)
!794 = distinct !{!794, !789, !795, !158}
!795 = !DILocation(line: 114, column: 44, scope: !737, inlinedAt: !786)
!796 = !DILocation(line: 115, column: 5, scope: !738, inlinedAt: !786)
!797 = !DILocation(line: 110, column: 37, scope: !733, inlinedAt: !786)
!798 = distinct !{!798, !788, !799, !158}
!799 = !DILocation(line: 116, column: 3, scope: !734, inlinedAt: !786)
!800 = !DILocation(line: 581, column: 16, scope: !598)
!801 = !DILocation(line: 581, column: 15, scope: !598)
!802 = !DILocation(line: 581, column: 22, scope: !598)
!803 = !DILocation(line: 581, column: 50, scope: !598)
!804 = !DILocalVariable(name: "LU", arg: 1, scope: !805, file: !3, line: 122, type: !6)
!805 = distinct !DISubprogram(name: "test_result", scope: !3, file: !3, line: 122, type: !806, scopeLine: 122, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !808)
!806 = !DISubroutineType(types: !807)
!807 = !{!26, !6, !6, !26}
!808 = !{!804, !809, !810, !811, !812, !813, !814, !815, !816, !817, !818, !819}
!809 = !DILocalVariable(name: "M", arg: 2, scope: !805, file: !3, line: 122, type: !6)
!810 = !DILocalVariable(name: "nb", arg: 3, scope: !805, file: !3, line: 122, type: !26)
!811 = !DILocalVariable(name: "I", scope: !805, file: !3, line: 124, type: !26)
!812 = !DILocalVariable(name: "J", scope: !805, file: !3, line: 124, type: !26)
!813 = !DILocalVariable(name: "K", scope: !805, file: !3, line: 124, type: !26)
!814 = !DILocalVariable(name: "i", scope: !805, file: !3, line: 124, type: !26)
!815 = !DILocalVariable(name: "j", scope: !805, file: !3, line: 124, type: !26)
!816 = !DILocalVariable(name: "k", scope: !805, file: !3, line: 124, type: !26)
!817 = !DILocalVariable(name: "diff", scope: !805, file: !3, line: 125, type: !10)
!818 = !DILocalVariable(name: "max_diff", scope: !805, file: !3, line: 125, type: !10)
!819 = !DILocalVariable(name: "v", scope: !805, file: !3, line: 126, type: !10)
!820 = !DILocation(line: 0, scope: !805, inlinedAt: !821)
!821 = distinct !DILocation(line: 581, column: 28, scope: !598)
!822 = !DILocation(line: 131, column: 3, scope: !805, inlinedAt: !821)
!823 = !DILocation(line: 134, column: 17, scope: !824, inlinedAt: !821)
!824 = distinct !DILexicalBlock(scope: !825, file: !3, line: 134, column: 3)
!825 = distinct !DILexicalBlock(scope: !805, file: !3, line: 134, column: 3)
!826 = !DILocation(line: 134, column: 3, scope: !825, inlinedAt: !821)
!827 = !DILocation(line: 139, column: 7, scope: !828, inlinedAt: !821)
!828 = distinct !DILexicalBlock(scope: !829, file: !3, line: 139, column: 7)
!829 = distinct !DILexicalBlock(scope: !830, file: !3, line: 135, column: 43)
!830 = distinct !DILexicalBlock(scope: !831, file: !3, line: 135, column: 5)
!831 = distinct !DILexicalBlock(scope: !824, file: !3, line: 135, column: 5)
!832 = !DILocation(line: 135, column: 19, scope: !830, inlinedAt: !821)
!833 = !DILocation(line: 135, column: 5, scope: !831, inlinedAt: !821)
!834 = distinct !{!834, !833, !835, !158}
!835 = !DILocation(line: 155, column: 5, scope: !831, inlinedAt: !821)
!836 = !DILocation(line: 137, column: 13, scope: !829, inlinedAt: !821)
!837 = !DILocation(line: 148, column: 14, scope: !838, inlinedAt: !821)
!838 = distinct !DILexicalBlock(scope: !839, file: !3, line: 146, column: 29)
!839 = distinct !DILexicalBlock(scope: !829, file: !3, line: 146, column: 11)
!840 = !DILocation(line: 148, column: 11, scope: !838, inlinedAt: !821)
!841 = !DILocation(line: 151, column: 19, scope: !829, inlinedAt: !821)
!842 = !DILocation(line: 152, column: 29, scope: !829, inlinedAt: !821)
!843 = !DILocation(line: 151, column: 14, scope: !829, inlinedAt: !821)
!844 = !DILocation(line: 153, column: 16, scope: !845, inlinedAt: !821)
!845 = distinct !DILexicalBlock(scope: !829, file: !3, line: 153, column: 11)
!846 = !DILocation(line: 135, column: 39, scope: !830, inlinedAt: !821)
!847 = !DILocation(line: 153, column: 11, scope: !829, inlinedAt: !821)
!848 = !DILocation(line: 134, column: 37, scope: !824, inlinedAt: !821)
!849 = distinct !{!849, !826, !850, !158}
!850 = !DILocation(line: 155, column: 5, scope: !825, inlinedAt: !821)
!851 = distinct !{!851, !833, !835, !158}
!852 = !DILocation(line: 150, column: 7, scope: !838, inlinedAt: !821)
!853 = !DILocation(line: 0, scope: !829, inlinedAt: !821)
!854 = !DILocation(line: 140, column: 15, scope: !855, inlinedAt: !821)
!855 = distinct !DILexicalBlock(scope: !856, file: !3, line: 139, column: 41)
!856 = distinct !DILexicalBlock(scope: !828, file: !3, line: 139, column: 7)
!857 = !DILocation(line: 141, column: 14, scope: !855, inlinedAt: !821)
!858 = !DILocation(line: 143, column: 11, scope: !855, inlinedAt: !821)
!859 = !DILocation(line: 141, column: 11, scope: !855, inlinedAt: !821)
!860 = !DILocation(line: 139, column: 37, scope: !856, inlinedAt: !821)
!861 = !DILocation(line: 139, column: 21, scope: !856, inlinedAt: !821)
!862 = !DILocation(line: 139, column: 25, scope: !856, inlinedAt: !821)
!863 = distinct !{!863, !827, !864, !158}
!864 = !DILocation(line: 145, column: 7, scope: !828, inlinedAt: !821)
!865 = !DILocation(line: 146, column: 13, scope: !839, inlinedAt: !821)
!866 = !DILocation(line: 146, column: 18, scope: !839, inlinedAt: !821)
!867 = !DILocation(line: 584, column: 7, scope: !868)
!868 = distinct !DILexicalBlock(scope: !598, file: !3, line: 583, column: 8)
!869 = !DILocation(line: 586, column: 15, scope: !870)
!870 = distinct !DILexicalBlock(scope: !868, file: !3, line: 585, column: 10)
!871 = !DILocation(line: 586, column: 7, scope: !870)
!872 = !DILocation(line: 587, column: 15, scope: !870)
!873 = !DILocation(line: 587, column: 61, scope: !870)
!874 = !DILocation(line: 587, column: 7, scope: !870)
!875 = !DILocation(line: 589, column: 3, scope: !599)
!876 = !DILocation(line: 555, column: 27, scope: !599)
!877 = distinct !{!877, !660, !878, !158}
!878 = !DILocation(line: 589, column: 3, scope: !596)
!879 = !DILocation(line: 564, column: 15, scope: !880)
!880 = distinct !DILexicalBlock(scope: !756, file: !3, line: 563, column: 17)
!881 = !DILocation(line: 564, column: 7, scope: !880)
!882 = !DILocation(line: 591, column: 3, scope: !578)
!883 = !DILocation(line: 592, column: 3, scope: !578)
!884 = !DILocation(line: 594, column: 3, scope: !578)
!885 = !DILocation(line: 595, column: 1, scope: !578)
!886 = !DISubprogram(name: "get_options", scope: !887, file: !887, line: 20, type: !888, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !550)
!887 = !DIFile(filename: "./getoptions.h", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "bf060e74fdb298e4a85522e522cd3a24")
!888 = !DISubroutineType(types: !889)
!889 = !{null, !26, !581, !890, !891, null}
!890 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!891 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!892 = !DISubprogram(name: "gettimeofday", scope: !893, file: !893, line: 72, type: !894, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !550)
!893 = !DIFile(filename: "/usr/include/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b3cbcac52b1954fa045aa74bfcd1a38")
!894 = !DISubroutineType(types: !895)
!895 = !{!26, !896, !897}
!896 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !36)
!897 = !DIDerivedType(tag: DW_TAG_typedef, name: "__timezone_ptr_t", file: !893, line: 62, baseType: !898)
!898 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !899)
!899 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !900, size: 64)
!900 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !893, line: 56, size: 64, elements: !901)
!901 = !{!902, !903}
!902 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !900, file: !893, line: 58, baseType: !26, size: 32)
!903 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !900, file: !893, line: 59, baseType: !26, size: 32, offset: 32)
!904 = !DISubprogram(name: "srand", scope: !905, file: !905, line: 376, type: !906, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !550)
!905 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f7a1412d75d9e3df251dfc21b02d59ef")
!906 = !DISubroutineType(types: !907)
!907 = !{null, !5}
!908 = !DISubprogram(name: "rand", scope: !905, file: !905, line: 374, type: !548, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !550)
