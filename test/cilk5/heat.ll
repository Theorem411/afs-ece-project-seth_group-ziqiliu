; ModuleID = 'heat.c'
source_filename = "heat.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@ny = dso_local global i32 0, align 4, !dbg !0
@nx = dso_local global i32 0, align 4, !dbg !22
@xu = dso_local global double 0.000000e+00, align 8, !dbg !26
@dx = dso_local local_unnamed_addr global double 0.000000e+00, align 8, !dbg !38
@yu = dso_local global double 0.000000e+00, align 8, !dbg !30
@dy = dso_local local_unnamed_addr global double 0.000000e+00, align 8, !dbg !40
@dtdxsq = dso_local local_unnamed_addr global double 0.000000e+00, align 8, !dbg !44
@dtdysq = dso_local local_unnamed_addr global double 0.000000e+00, align 8, !dbg !46
@t = dso_local local_unnamed_addr global double 0.000000e+00, align 8, !dbg !48
@leafmaxcol = dso_local global i32 0, align 4, !dbg !50
@nt = dso_local global i32 0, align 4, !dbg !24
@tu = dso_local global double 0.000000e+00, align 8, !dbg !34
@dt = dso_local local_unnamed_addr global double 0.000000e+00, align 8, !dbg !42
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [44 x i8] c"\0AUsage: heat [<cilk-options>] [<options>}\0A\0A\00", align 1
@.str.1 = private unnamed_addr constant [72 x i8] c"This program uses a Jacobi-type iteration to solve a finite-difference\0A\00", align 1
@.str.2 = private unnamed_addr constant [71 x i8] c"approximation of parabolic partial differential equations that models\0A\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"for example the heat diffusion problem.\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"Optional parameter: \0A\00", align 1
@.str.5 = private unnamed_addr constant [62 x i8] c"   -g #     granularity (columns per partition)  default: 10\0A\00", align 1
@.str.6 = private unnamed_addr constant [64 x i8] c"   -nx #    total number of columns              default: 4096\0A\00", align 1
@.str.7 = private unnamed_addr constant [63 x i8] c"   -ny #    total number of rows                 default: 512\0A\00", align 1
@.str.8 = private unnamed_addr constant [63 x i8] c"   -nt #    total time steps                     default: 100\0A\00", align 1
@.str.9 = private unnamed_addr constant [50 x i8] c"   -f filename    parameter file for nx, ny, ...\0A\00", align 1
@.str.10 = private unnamed_addr constant [33 x i8] c"   -benchmark short/medium/long\0A\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.12 = private unnamed_addr constant [17 x i8] c"\0A Can't open %s\0A\00", align 1
@.str.13 = private unnamed_addr constant [33 x i8] c"%d %d %d %lf %lf %lf %lf %lf %lf\00", align 1
@xo = dso_local global double 0.000000e+00, align 8, !dbg !28
@yo = dso_local global double 0.000000e+00, align 8, !dbg !32
@to = dso_local global double 0.000000e+00, align 8, !dbg !36
@.str.14 = private unnamed_addr constant [27 x i8] c"\0A Warning: fscanf errno %d\00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"-g\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"-nx\00", align 1
@.str.17 = private unnamed_addr constant [4 x i8] c"-ny\00", align 1
@.str.18 = private unnamed_addr constant [4 x i8] c"-nt\00", align 1
@.str.19 = private unnamed_addr constant [4 x i8] c"-xu\00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c"-xo\00", align 1
@.str.21 = private unnamed_addr constant [4 x i8] c"-yu\00", align 1
@.str.22 = private unnamed_addr constant [4 x i8] c"-yo\00", align 1
@.str.23 = private unnamed_addr constant [4 x i8] c"-tu\00", align 1
@.str.24 = private unnamed_addr constant [4 x i8] c"-to\00", align 1
@.str.25 = private unnamed_addr constant [3 x i8] c"-f\00", align 1
@.str.26 = private unnamed_addr constant [11 x i8] c"-benchmark\00", align 1
@.str.27 = private unnamed_addr constant [3 x i8] c"-h\00", align 1
@.str.28 = private unnamed_addr constant [3 x i8] c"-r\00", align 1
@specifiers = dso_local global [15 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.28, i32 0, i32 0), i8* null], align 16, !dbg !10
@opt_types = dso_local global [15 x i32] [i32 1, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 5, i32 6, i32 4, i32 1, i32 0], align 16, !dbg !18
@.str.29 = private unnamed_addr constant [17 x i8] c"Testing exp: %f\0A\00", align 1
@.str.30 = private unnamed_addr constant [15 x i8] c"PBBS-time: %f\0A\00", align 1
@.str.31 = private unnamed_addr constant [21 x i8] c"\0ACilk Example: heat\0A\00", align 1
@.str.32 = private unnamed_addr constant [12 x i8] c"\0A   dx = %f\00", align 1
@.str.33 = private unnamed_addr constant [12 x i8] c"\0A   dy = %f\00", align 1
@.str.34 = private unnamed_addr constant [12 x i8] c"\0A   dt = %f\00", align 1
@.str.35 = private unnamed_addr constant [58 x i8] c"\0A\0A Stability Value for explicit method must be > 0:  %f\0A\0A\00", align 1
@.str.36 = private unnamed_addr constant [27 x i8] c"Options: granularity = %d\0A\00", align 1
@.str.37 = private unnamed_addr constant [27 x i8] c"         nx          = %d\0A\00", align 1
@.str.38 = private unnamed_addr constant [27 x i8] c"         ny          = %d\0A\00", align 1
@.str.39 = private unnamed_addr constant [27 x i8] c"         nt          = %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i64 @todval(%struct.timeval* nocapture noundef readonly %tp) local_unnamed_addr #0 !dbg !57 {
entry:
  call void @llvm.dbg.value(metadata %struct.timeval* %tp, metadata !72, metadata !DIExpression()), !dbg !73
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 0, !dbg !74
  %0 = load i64, i64* %tv_sec, align 8, !dbg !74, !tbaa !75
  %mul1 = mul i64 %0, 1000000, !dbg !80
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 1, !dbg !81
  %1 = load i64, i64* %tv_usec, align 8, !dbg !81, !tbaa !82
  %add = add nsw i64 %mul1, %1, !dbg !83
  ret i64 %add, !dbg !84
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable writeonly
define dso_local void @startup_cilk() local_unnamed_addr #2 !dbg !85 {
entry:
  %g = alloca double, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !97
  %g.0.g.0.g.0..sroa_cast = bitcast double* %g to i8*, !dbg !98
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !98
  call void @llvm.dbg.value(metadata double 2.000000e+00, metadata !89, metadata !DIExpression()), !dbg !97
  store double 2.000000e+00, double* %g, align 8, !dbg !99, !tbaa !100
  call void @llvm.dbg.value(metadata i32 0, metadata !90, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i32 1000, metadata !92, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i32 0, metadata !93, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i32 1000, metadata !94, metadata !DIExpression()), !dbg !102
  br label %pfor.cond, !dbg !103

pfor.cond:                                        ; preds = %pfor.inc, %entry
  %__begin.0 = phi i32 [ 0, %entry ], [ %inc, %pfor.inc ], !dbg !102
  call void @llvm.dbg.value(metadata i32 %__begin.0, metadata !93, metadata !DIExpression()), !dbg !102
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc, !dbg !104

pfor.body.entry:                                  ; preds = %pfor.cond
  call void @llvm.dbg.value(metadata !DIArgList(i32 0, i32 %__begin.0), metadata !95, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !105
  %g.0.g.0.g.0. = load double, double* %g, align 8, !dbg !106, !tbaa !100
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !89, metadata !DIExpression()), !dbg !97
  %call = tail call double @sin(double noundef %g.0.g.0.g.0.) #16, !dbg !108
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !89, metadata !DIExpression()), !dbg !97
  %div3 = fdiv double %g.0.g.0.g.0., %call, !dbg !109
  call void @llvm.dbg.value(metadata double %div3, metadata !89, metadata !DIExpression()), !dbg !97
  store double %div3, double* %g, align 8, !dbg !109, !tbaa !100
  reattach within %syncreg, label %pfor.inc, !dbg !110

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %inc = add nuw nsw i32 %__begin.0, 1, !dbg !111
  call void @llvm.dbg.value(metadata i32 %inc, metadata !93, metadata !DIExpression()), !dbg !102
  %exitcond.not = icmp eq i32 %inc, 1000, !dbg !112
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !dbg !113, !llvm.loop !114

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %cleanup, !dbg !113

cleanup:                                          ; preds = %pfor.cond.cleanup
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !117
  ret void, !dbg !117
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare token @llvm.syncregion.start() #4

; Function Attrs: mustprogress nofree nounwind willreturn writeonly
declare dso_local double @sin(double noundef) local_unnamed_addr #5

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nofree nounwind uwtable
define dso_local void @allcgrid(double** nocapture noundef writeonly %neww, double** nocapture noundef writeonly %old, i32 noundef %lb, i32 noundef %ub) local_unnamed_addr #6 !dbg !118 {
entry:
  call void @llvm.dbg.value(metadata double** %neww, metadata !122, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata double** %old, metadata !123, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 %lb, metadata !124, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 %ub, metadata !125, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 %lb, metadata !126, metadata !DIExpression()), !dbg !129
  %idx.ext = sext i32 %lb to i64, !dbg !130
  call void @llvm.dbg.value(metadata !DIArgList(double** %old, i64 %idx.ext), metadata !128, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !129
  call void @llvm.dbg.value(metadata !DIArgList(double** %neww, i64 %idx.ext), metadata !127, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !129
  call void @llvm.dbg.value(metadata !DIArgList(double** %old, i64 %idx.ext), metadata !128, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)), !dbg !129
  call void @llvm.dbg.value(metadata i32 %lb, metadata !126, metadata !DIExpression()), !dbg !129
  %cmp15 = icmp slt i32 %lb, %ub, !dbg !132
  br i1 %cmp15, label %for.body.lr.ph, label %for.end, !dbg !134

for.body.lr.ph:                                   ; preds = %entry
  %add.ptr2 = getelementptr inbounds double*, double** %neww, i64 %idx.ext, !dbg !135
  call void @llvm.dbg.value(metadata double** %add.ptr2, metadata !127, metadata !DIExpression()), !dbg !129
  %add.ptr = getelementptr inbounds double*, double** %old, i64 %idx.ext, !dbg !130
  call void @llvm.dbg.value(metadata double** %add.ptr, metadata !128, metadata !DIExpression()), !dbg !129
  %0 = load i32, i32* @ny, align 4, !tbaa !136
  %conv = sext i32 %0 to i64
  %mul = shl nsw i64 %conv, 3
  br label %for.body, !dbg !134

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %rol.018 = phi double** [ %add.ptr, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %rne.017 = phi double** [ %add.ptr2, %for.body.lr.ph ], [ %incdec.ptr6, %for.body ]
  %j.016 = phi i32 [ %lb, %for.body.lr.ph ], [ %inc, %for.body ]
  call void @llvm.dbg.value(metadata double** %rol.018, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata double** %rne.017, metadata !127, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.value(metadata i32 %j.016, metadata !126, metadata !DIExpression()), !dbg !129
  %call = tail call noalias i8* @malloc(i64 noundef %mul) #16, !dbg !138
  %1 = bitcast double** %rol.018 to i8**, !dbg !140
  store i8* %call, i8** %1, align 8, !dbg !140, !tbaa !141
  %call5 = tail call noalias i8* @malloc(i64 noundef %mul) #16, !dbg !143
  %2 = bitcast double** %rne.017 to i8**, !dbg !144
  store i8* %call5, i8** %2, align 8, !dbg !144, !tbaa !141
  %inc = add nsw i32 %j.016, 1, !dbg !145
  call void @llvm.dbg.value(metadata i32 %inc, metadata !126, metadata !DIExpression()), !dbg !129
  %incdec.ptr = getelementptr inbounds double*, double** %rol.018, i64 1, !dbg !146
  call void @llvm.dbg.value(metadata double** %incdec.ptr, metadata !128, metadata !DIExpression()), !dbg !129
  %incdec.ptr6 = getelementptr inbounds double*, double** %rne.017, i64 1, !dbg !147
  call void @llvm.dbg.value(metadata double** %incdec.ptr6, metadata !127, metadata !DIExpression()), !dbg !129
  %exitcond.not = icmp eq i32 %inc, %ub, !dbg !132
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !134, !llvm.loop !148

for.end:                                          ; preds = %for.body, %entry
  ret void, !dbg !151
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #7

; Function Attrs: nofree nounwind uwtable
define dso_local void @initgrid(double** nocapture noundef readonly %old, i32 noundef %lb, i32 noundef %ub) local_unnamed_addr #6 !dbg !152 {
entry:
  call void @llvm.dbg.value(metadata double** %old, metadata !156, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i32 %lb, metadata !157, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i32 %ub, metadata !158, metadata !DIExpression()), !dbg !163
  %cmp = icmp eq i32 %lb, 0, !dbg !164
  %cond = select i1 %cmp, i32 1, i32 %lb, !dbg !165
  call void @llvm.dbg.value(metadata i32 %cond, metadata !161, metadata !DIExpression()), !dbg !163
  %0 = load i32, i32* @nx, align 4, !dbg !166, !tbaa !136
  %cmp1 = icmp eq i32 %0, %ub, !dbg !167
  %sub = add nsw i32 %0, -1, !dbg !168
  %cond5 = select i1 %cmp1, i32 %sub, i32 %ub, !dbg !168
  call void @llvm.dbg.value(metadata i32 %cond5, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i32 %cond, metadata !159, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i32 0, metadata !160, metadata !DIExpression()), !dbg !163
  %cmp6121 = icmp slt i32 %cond, %cond5, !dbg !169
  br i1 %cmp6121, label %for.body.preheader, label %for.end20, !dbg !172

for.body.preheader:                               ; preds = %entry
  %1 = sext i32 %cond to i64, !dbg !172
  %wide.trip.count = sext i32 %cond5 to i64, !dbg !169
  %2 = sub nsw i64 %wide.trip.count, %1, !dbg !172
  %3 = xor i64 %1, -1, !dbg !172
  %4 = add nsw i64 %3, %wide.trip.count, !dbg !172
  %xtraiter = and i64 %2, 7, !dbg !172
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !172
  br i1 %lcmp.mod.not, label %for.body.prol.loopexit, label %for.body.prol, !dbg !172

for.body.prol:                                    ; preds = %for.body.preheader, %for.body.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body.prol ], [ %1, %for.body.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body.prol ], [ 0, %for.body.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.prol, metadata !159, metadata !DIExpression()), !dbg !163
  %arrayidx.prol = getelementptr inbounds double*, double** %old, i64 %indvars.iv.prol, !dbg !173
  %5 = load double*, double** %arrayidx.prol, align 8, !dbg !173, !tbaa !141
  store double 0.000000e+00, double* %5, align 8, !dbg !174, !tbaa !100
  %indvars.iv.next.prol = add nsw i64 %indvars.iv.prol, 1, !dbg !175
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.prol, metadata !159, metadata !DIExpression()), !dbg !163
  %prol.iter.next = add i64 %prol.iter, 1, !dbg !172
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter, !dbg !172
  br i1 %prol.iter.cmp.not, label %for.body.prol.loopexit, label %for.body.prol, !dbg !172, !llvm.loop !176

for.body.prol.loopexit:                           ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv.unr = phi i64 [ %1, %for.body.preheader ], [ %indvars.iv.next.prol, %for.body.prol ]
  %6 = icmp ult i64 %4, 7, !dbg !172
  br i1 %6, label %for.body12.lr.ph, label %for.body, !dbg !172

for.body:                                         ; preds = %for.body.prol.loopexit, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %for.body ], [ %indvars.iv.unr, %for.body.prol.loopexit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !159, metadata !DIExpression()), !dbg !163
  %arrayidx = getelementptr inbounds double*, double** %old, i64 %indvars.iv, !dbg !173
  %7 = load double*, double** %arrayidx, align 8, !dbg !173, !tbaa !141
  store double 0.000000e+00, double* %7, align 8, !dbg !174, !tbaa !100
  %indvars.iv.next = add nsw i64 %indvars.iv, 1, !dbg !175
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !159, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !159, metadata !DIExpression()), !dbg !163
  %arrayidx.1 = getelementptr inbounds double*, double** %old, i64 %indvars.iv.next, !dbg !173
  %8 = load double*, double** %arrayidx.1, align 8, !dbg !173, !tbaa !141
  store double 0.000000e+00, double* %8, align 8, !dbg !174, !tbaa !100
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2, !dbg !175
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1, metadata !159, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1, metadata !159, metadata !DIExpression()), !dbg !163
  %arrayidx.2 = getelementptr inbounds double*, double** %old, i64 %indvars.iv.next.1, !dbg !173
  %9 = load double*, double** %arrayidx.2, align 8, !dbg !173, !tbaa !141
  store double 0.000000e+00, double* %9, align 8, !dbg !174, !tbaa !100
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3, !dbg !175
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.2, metadata !159, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.2, metadata !159, metadata !DIExpression()), !dbg !163
  %arrayidx.3 = getelementptr inbounds double*, double** %old, i64 %indvars.iv.next.2, !dbg !173
  %10 = load double*, double** %arrayidx.3, align 8, !dbg !173, !tbaa !141
  store double 0.000000e+00, double* %10, align 8, !dbg !174, !tbaa !100
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4, !dbg !175
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.3, metadata !159, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.3, metadata !159, metadata !DIExpression()), !dbg !163
  %arrayidx.4 = getelementptr inbounds double*, double** %old, i64 %indvars.iv.next.3, !dbg !173
  %11 = load double*, double** %arrayidx.4, align 8, !dbg !173, !tbaa !141
  store double 0.000000e+00, double* %11, align 8, !dbg !174, !tbaa !100
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5, !dbg !175
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.4, metadata !159, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.4, metadata !159, metadata !DIExpression()), !dbg !163
  %arrayidx.5 = getelementptr inbounds double*, double** %old, i64 %indvars.iv.next.4, !dbg !173
  %12 = load double*, double** %arrayidx.5, align 8, !dbg !173, !tbaa !141
  store double 0.000000e+00, double* %12, align 8, !dbg !174, !tbaa !100
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6, !dbg !175
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.5, metadata !159, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.5, metadata !159, metadata !DIExpression()), !dbg !163
  %arrayidx.6 = getelementptr inbounds double*, double** %old, i64 %indvars.iv.next.5, !dbg !173
  %13 = load double*, double** %arrayidx.6, align 8, !dbg !173, !tbaa !141
  store double 0.000000e+00, double* %13, align 8, !dbg !174, !tbaa !100
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7, !dbg !175
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.6, metadata !159, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.6, metadata !159, metadata !DIExpression()), !dbg !163
  %arrayidx.7 = getelementptr inbounds double*, double** %old, i64 %indvars.iv.next.6, !dbg !173
  %14 = load double*, double** %arrayidx.7, align 8, !dbg !173, !tbaa !141
  store double 0.000000e+00, double* %14, align 8, !dbg !174, !tbaa !100
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8, !dbg !175
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.7, metadata !159, metadata !DIExpression()), !dbg !163
  %exitcond.not.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count, !dbg !169
  br i1 %exitcond.not.7, label %for.body12.lr.ph, label %for.body, !dbg !172, !llvm.loop !178

for.body12.lr.ph:                                 ; preds = %for.body.prol.loopexit, %for.body
  call void @llvm.dbg.value(metadata i32 undef, metadata !160, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !163
  call void @llvm.dbg.value(metadata i32 %cond, metadata !159, metadata !DIExpression()), !dbg !163
  %15 = load i32, i32* @ny, align 4, !dbg !180, !tbaa !136
  call void @llvm.dbg.value(metadata i32 %15, metadata !160, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !163
  %sub9 = add nsw i32 %15, -1, !dbg !182
  call void @llvm.dbg.value(metadata i32 %sub9, metadata !160, metadata !DIExpression()), !dbg !163
  %idxprom16 = sext i32 %sub9 to i64
  %xtraiter155 = and i64 %2, 1, !dbg !183
  %lcmp.mod156.not = icmp eq i64 %xtraiter155, 0, !dbg !183
  br i1 %lcmp.mod156.not, label %for.body12.prol.loopexit, label %for.body12.prol, !dbg !183

for.body12.prol:                                  ; preds = %for.body12.lr.ph
  call void @llvm.dbg.value(metadata i64 %1, metadata !159, metadata !DIExpression()), !dbg !163
  %16 = load double, double* @xu, align 8, !dbg !184, !tbaa !100
  %conv.prol = sitofp i32 %cond to double, !dbg !184
  %17 = load double, double* @dx, align 8, !dbg !184, !tbaa !100
  %18 = tail call double @llvm.fmuladd.f64(double %conv.prol, double %17, double %16), !dbg !184
  %call13.prol = tail call double @sin(double noundef %18) #16, !dbg !184
  %arrayidx15.prol = getelementptr inbounds double*, double** %old, i64 %1, !dbg !186
  %19 = load double*, double** %arrayidx15.prol, align 8, !dbg !186, !tbaa !141
  %arrayidx17.prol = getelementptr inbounds double, double* %19, i64 %idxprom16, !dbg !186
  store double %call13.prol, double* %arrayidx17.prol, align 8, !dbg !187, !tbaa !100
  %indvars.iv.next137.prol = add nsw i64 %1, 1, !dbg !188
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next137.prol, metadata !159, metadata !DIExpression()), !dbg !163
  br label %for.body12.prol.loopexit, !dbg !183

for.body12.prol.loopexit:                         ; preds = %for.body12.prol, %for.body12.lr.ph
  %indvars.iv136.unr = phi i64 [ %1, %for.body12.lr.ph ], [ %indvars.iv.next137.prol, %for.body12.prol ]
  %20 = icmp eq i64 %4, 0, !dbg !183
  br i1 %20, label %for.end20, label %for.body12, !dbg !183

for.body12:                                       ; preds = %for.body12.prol.loopexit, %for.body12
  %indvars.iv136 = phi i64 [ %indvars.iv.next137.1, %for.body12 ], [ %indvars.iv136.unr, %for.body12.prol.loopexit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv136, metadata !159, metadata !DIExpression()), !dbg !163
  %21 = load double, double* @xu, align 8, !dbg !184, !tbaa !100
  %22 = trunc i64 %indvars.iv136 to i32, !dbg !184
  %conv = sitofp i32 %22 to double, !dbg !184
  %23 = load double, double* @dx, align 8, !dbg !184, !tbaa !100
  %24 = tail call double @llvm.fmuladd.f64(double %conv, double %23, double %21), !dbg !184
  %call13 = tail call double @sin(double noundef %24) #16, !dbg !184
  %arrayidx15 = getelementptr inbounds double*, double** %old, i64 %indvars.iv136, !dbg !186
  %25 = load double*, double** %arrayidx15, align 8, !dbg !186, !tbaa !141
  %arrayidx17 = getelementptr inbounds double, double* %25, i64 %idxprom16, !dbg !186
  store double %call13, double* %arrayidx17, align 8, !dbg !187, !tbaa !100
  %indvars.iv.next137 = add nsw i64 %indvars.iv136, 1, !dbg !188
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next137, metadata !159, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next137, metadata !159, metadata !DIExpression()), !dbg !163
  %26 = load double, double* @xu, align 8, !dbg !184, !tbaa !100
  %27 = trunc i64 %indvars.iv.next137 to i32, !dbg !184
  %conv.1 = sitofp i32 %27 to double, !dbg !184
  %28 = load double, double* @dx, align 8, !dbg !184, !tbaa !100
  %29 = tail call double @llvm.fmuladd.f64(double %conv.1, double %28, double %26), !dbg !184
  %call13.1 = tail call double @sin(double noundef %29) #16, !dbg !184
  %arrayidx15.1 = getelementptr inbounds double*, double** %old, i64 %indvars.iv.next137, !dbg !186
  %30 = load double*, double** %arrayidx15.1, align 8, !dbg !186, !tbaa !141
  %arrayidx17.1 = getelementptr inbounds double, double* %30, i64 %idxprom16, !dbg !186
  store double %call13.1, double* %arrayidx17.1, align 8, !dbg !187, !tbaa !100
  %indvars.iv.next137.1 = add nsw i64 %indvars.iv136, 2, !dbg !188
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next137.1, metadata !159, metadata !DIExpression()), !dbg !163
  %exitcond140.not.1 = icmp eq i64 %indvars.iv.next137.1, %wide.trip.count, !dbg !189
  br i1 %exitcond140.not.1, label %for.end20, label %for.body12, !dbg !183, !llvm.loop !190

for.end20:                                        ; preds = %for.body12.prol.loopexit, %for.body12, %entry
  br i1 %cmp, label %for.cond23.preheader, label %if.end, !dbg !192

for.cond23.preheader:                             ; preds = %for.end20
  %31 = load i32, i32* @ny, align 4, !tbaa !136
  call void @llvm.dbg.value(metadata i32 0, metadata !160, metadata !DIExpression()), !dbg !163
  %cmp24125 = icmp sgt i32 %31, 0, !dbg !193
  br i1 %cmp24125, label %for.body26.lr.ph, label %if.end, !dbg !198

for.body26.lr.ph:                                 ; preds = %for.cond23.preheader
  %32 = bitcast double** %old to i8**
  %33 = load i8*, i8** %32, align 8, !tbaa !141
  %34 = zext i32 %31 to i64, !dbg !198
  %35 = shl nuw nsw i64 %34, 3, !dbg !198
  call void @llvm.memset.p0i8.i64(i8* align 8 %33, i8 0, i64 %35, i1 false), !dbg !199, !tbaa !100
  call void @llvm.dbg.value(metadata i32 undef, metadata !160, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !163
  br label %if.end, !dbg !200

if.end:                                           ; preds = %for.body26.lr.ph, %for.cond23.preheader, %for.end20
  %36 = load i32, i32* @nx, align 4, !dbg !200, !tbaa !136
  %cmp34 = icmp eq i32 %36, %ub, !dbg !202
  %37 = load i32, i32* @ny, align 4
  %cmp39127 = icmp sgt i32 %37, 0
  %or.cond = select i1 %cmp34, i1 %cmp39127, i1 false, !dbg !203
  call void @llvm.dbg.value(metadata i32 %36, metadata !159, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !163
  call void @llvm.dbg.value(metadata i32 0, metadata !160, metadata !DIExpression()), !dbg !163
  br i1 %or.cond, label %for.body41.lr.ph, label %if.end54, !dbg !203

for.body41.lr.ph:                                 ; preds = %if.end
  %sub37 = add nsw i32 %ub, -1, !dbg !204
  call void @llvm.dbg.value(metadata i32 %sub37, metadata !159, metadata !DIExpression()), !dbg !163
  %idxprom47 = sext i32 %sub37 to i64
  %arrayidx48 = getelementptr inbounds double*, double** %old, i64 %idxprom47
  br label %for.body41, !dbg !207

for.body41:                                       ; preds = %for.body41.lr.ph, %for.body41
  %indvars.iv144 = phi i64 [ 0, %for.body41.lr.ph ], [ %indvars.iv.next145, %for.body41 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv144, metadata !160, metadata !DIExpression()), !dbg !163
  %38 = load double, double* @yu, align 8, !dbg !208, !tbaa !100
  %39 = trunc i64 %indvars.iv144 to i32, !dbg !208
  %conv43 = sitofp i32 %39 to double, !dbg !208
  %40 = load double, double* @dy, align 8, !dbg !208, !tbaa !100
  %41 = tail call double @llvm.fmuladd.f64(double %conv43, double %40, double %38), !dbg !208
  %call45 = tail call double @sin(double noundef %41) #16, !dbg !208
  %42 = load double*, double** %arrayidx48, align 8, !dbg !210, !tbaa !141
  %arrayidx50 = getelementptr inbounds double, double* %42, i64 %indvars.iv144, !dbg !210
  store double %call45, double* %arrayidx50, align 8, !dbg !211, !tbaa !100
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1, !dbg !212
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next145, metadata !160, metadata !DIExpression()), !dbg !163
  %43 = load i32, i32* @ny, align 4, !dbg !213, !tbaa !136
  %44 = sext i32 %43 to i64, !dbg !214
  %cmp39 = icmp slt i64 %indvars.iv.next145, %44, !dbg !214
  br i1 %cmp39, label %for.body41, label %if.end54, !dbg !207, !llvm.loop !215

if.end54:                                         ; preds = %for.body41, %if.end
  call void @llvm.dbg.value(metadata i32 %cond, metadata !159, metadata !DIExpression()), !dbg !163
  br i1 %cmp6121, label %for.cond59.preheader.preheader, label %for.end80, !dbg !217

for.cond59.preheader.preheader:                   ; preds = %if.end54
  %45 = sext i32 %cond to i64, !dbg !217
  %wide.trip.count153 = sext i32 %cond5 to i64, !dbg !219
  %.pre = load i32, i32* @ny, align 4, !dbg !221, !tbaa !136
  br label %for.cond59.preheader, !dbg !217

for.cond59.preheader:                             ; preds = %for.cond59.preheader.preheader, %for.inc78
  %46 = phi i32 [ %.pre, %for.cond59.preheader.preheader ], [ %58, %for.inc78 ], !dbg !221
  %indvars.iv150 = phi i64 [ %45, %for.cond59.preheader.preheader ], [ %indvars.iv.next151, %for.inc78 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv150, metadata !159, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i32 1, metadata !160, metadata !DIExpression()), !dbg !163
  %cmp61130 = icmp sgt i32 %46, 2, !dbg !225
  br i1 %cmp61130, label %for.body63.lr.ph, label %for.inc78, !dbg !226

for.body63.lr.ph:                                 ; preds = %for.cond59.preheader
  %47 = trunc i64 %indvars.iv150 to i32
  %conv64 = sitofp i32 %47 to double
  %arrayidx72 = getelementptr inbounds double*, double** %old, i64 %indvars.iv150
  br label %for.body63, !dbg !226

for.body63:                                       ; preds = %for.body63.lr.ph, %for.body63
  %indvars.iv147 = phi i64 [ 1, %for.body63.lr.ph ], [ %indvars.iv.next148, %for.body63 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv147, metadata !160, metadata !DIExpression()), !dbg !163
  %48 = load double, double* @xu, align 8, !dbg !227, !tbaa !100
  %49 = load double, double* @dx, align 8, !dbg !227, !tbaa !100
  %50 = tail call double @llvm.fmuladd.f64(double %conv64, double %49, double %48), !dbg !227
  %call66 = tail call double @sin(double noundef %50) #16, !dbg !227
  %51 = load double, double* @yu, align 8, !dbg !227, !tbaa !100
  %52 = trunc i64 %indvars.iv147 to i32, !dbg !227
  %conv67 = sitofp i32 %52 to double, !dbg !227
  %53 = load double, double* @dy, align 8, !dbg !227, !tbaa !100
  %54 = tail call double @llvm.fmuladd.f64(double %conv67, double %53, double %51), !dbg !227
  %call69 = tail call double @sin(double noundef %54) #16, !dbg !227
  %mul70 = fmul double %call66, %call69, !dbg !227
  %55 = load double*, double** %arrayidx72, align 8, !dbg !229, !tbaa !141
  %arrayidx74 = getelementptr inbounds double, double* %55, i64 %indvars.iv147, !dbg !229
  store double %mul70, double* %arrayidx74, align 8, !dbg !230, !tbaa !100
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1, !dbg !231
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next148, metadata !160, metadata !DIExpression()), !dbg !163
  %56 = load i32, i32* @ny, align 4, !dbg !221, !tbaa !136
  %sub60 = add nsw i32 %56, -1, !dbg !232
  %57 = sext i32 %sub60 to i64, !dbg !225
  %cmp61 = icmp slt i64 %indvars.iv.next148, %57, !dbg !225
  br i1 %cmp61, label %for.body63, label %for.inc78, !dbg !226, !llvm.loop !233

for.inc78:                                        ; preds = %for.body63, %for.cond59.preheader
  %58 = phi i32 [ %46, %for.cond59.preheader ], [ %56, %for.body63 ]
  %indvars.iv.next151 = add nsw i64 %indvars.iv150, 1, !dbg !235
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next151, metadata !159, metadata !DIExpression()), !dbg !163
  %exitcond154.not = icmp eq i64 %indvars.iv.next151, %wide.trip.count153, !dbg !219
  br i1 %exitcond154.not, label %for.end80, label %for.cond59.preheader, !dbg !217, !llvm.loop !236

for.end80:                                        ; preds = %for.inc78, %if.end54
  ret void, !dbg !238
}

; Function Attrs: mustprogress nofree nounwind willreturn writeonly
declare dso_local double @exp(double noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nofree nounwind uwtable
define dso_local void @compstripe(double** nocapture noundef readonly %neww, double** nocapture noundef readonly %old, i32 noundef %lb, i32 noundef %ub) local_unnamed_addr #6 !dbg !239 {
entry:
  call void @llvm.dbg.value(metadata double** %neww, metadata !241, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata double** %old, metadata !242, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i32 %lb, metadata !243, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i32 %ub, metadata !244, metadata !DIExpression()), !dbg !249
  %cmp = icmp eq i32 %lb, 0, !dbg !250
  %cond = select i1 %cmp, i32 1, i32 %lb, !dbg !251
  call void @llvm.dbg.value(metadata i32 %cond, metadata !247, metadata !DIExpression()), !dbg !249
  %0 = load i32, i32* @nx, align 4, !dbg !252, !tbaa !136
  %cmp1 = icmp eq i32 %0, %ub, !dbg !253
  %sub = add nsw i32 %0, -1, !dbg !254
  %cond5 = select i1 %cmp1, i32 %sub, i32 %ub, !dbg !254
  call void @llvm.dbg.value(metadata i32 %cond5, metadata !248, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i32 %cond, metadata !245, metadata !DIExpression()), !dbg !249
  %cmp6172 = icmp slt i32 %cond, %cond5, !dbg !255
  br i1 %cmp6172, label %for.cond7.preheader.lr.ph, label %for.end76, !dbg !258

for.cond7.preheader.lr.ph:                        ; preds = %entry
  %1 = load i32, i32* @ny, align 4, !tbaa !136
  %cmp9170 = icmp sgt i32 %1, 2
  br i1 %cmp9170, label %for.cond7.preheader.us.preheader, label %for.body55.lr.ph, !dbg !259

for.cond7.preheader.us.preheader:                 ; preds = %for.cond7.preheader.lr.ph
  %sub8 = add nsw i32 %1, -1
  %2 = sext i32 %cond to i64, !dbg !258
  %wide.trip.count190 = sext i32 %cond5 to i64, !dbg !255
  %arrayidx14.us.phi.trans.insert = getelementptr inbounds double*, double** %old, i64 %2
  %.pre = load double*, double** %arrayidx14.us.phi.trans.insert, align 8, !tbaa !141
  %wide.trip.count = zext i32 %sub8 to i64
  %3 = add nuw nsw i64 %wide.trip.count, 1, !dbg !258
  %4 = add nsw i64 %wide.trip.count, -1, !dbg !258
  %min.iters.check = icmp ult i64 %4, 2
  %n.vec = and i64 %4, -2
  %ind.end = or i64 %4, 1
  %cmp.n = icmp eq i64 %4, %n.vec
  br label %for.cond7.preheader.us, !dbg !258

for.cond7.preheader.us:                           ; preds = %for.cond7.preheader.us.preheader, %for.cond7.for.inc49_crit_edge.us
  %5 = phi double* [ %.pre, %for.cond7.preheader.us.preheader ], [ %6, %for.cond7.for.inc49_crit_edge.us ]
  %indvars.iv186 = phi i64 [ %2, %for.cond7.preheader.us.preheader ], [ %indvars.iv.next187, %for.cond7.for.inc49_crit_edge.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv186, metadata !245, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i32 1, metadata !246, metadata !DIExpression()), !dbg !249
  %indvars.iv.next187 = add nsw i64 %indvars.iv186, 1, !dbg !262
  %arrayidx.us = getelementptr inbounds double*, double** %old, i64 %indvars.iv.next187
  %6 = load double*, double** %arrayidx.us, align 8, !tbaa !141
  %7 = add nsw i64 %indvars.iv186, -1
  %arrayidx19.us = getelementptr inbounds double*, double** %old, i64 %7
  %8 = load double*, double** %arrayidx19.us, align 8, !tbaa !141
  %arrayidx46.us = getelementptr inbounds double*, double** %neww, i64 %indvars.iv186
  %9 = load double*, double** %arrayidx46.us, align 8, !tbaa !141
  br i1 %min.iters.check, label %for.body10.us.preheader, label %vector.memcheck, !dbg !259

vector.memcheck:                                  ; preds = %for.cond7.preheader.us
  %scevgep = getelementptr double, double* %9, i64 1, !dbg !259
  %scevgep210 = getelementptr double, double* %9, i64 %wide.trip.count, !dbg !259
  %scevgep212 = getelementptr double, double* %6, i64 1, !dbg !259
  %scevgep214 = getelementptr double, double* %6, i64 %wide.trip.count, !dbg !259
  %scevgep216 = getelementptr double, double* %5, i64 1, !dbg !259
  %scevgep218 = getelementptr double, double* %5, i64 %wide.trip.count, !dbg !259
  %scevgep220 = getelementptr double, double* %8, i64 1, !dbg !259
  %scevgep222 = getelementptr double, double* %8, i64 %wide.trip.count, !dbg !259
  %scevgep224 = getelementptr double, double* %5, i64 2, !dbg !259
  %scevgep226 = getelementptr double, double* %5, i64 %3, !dbg !259
  %scevgep228 = getelementptr double, double* %5, i64 %4, !dbg !259
  %bound0 = icmp ult double* %9, @dtdxsq, !dbg !259
  %bound1 = icmp ugt double* %scevgep210, @dtdxsq, !dbg !259
  %found.conflict = and i1 %bound0, %bound1, !dbg !259
  %bound0230 = icmp ult double* %scevgep, %scevgep214, !dbg !259
  %bound1231 = icmp ult double* %scevgep212, %scevgep210, !dbg !259
  %found.conflict232 = and i1 %bound0230, %bound1231, !dbg !259
  %conflict.rdx = or i1 %found.conflict, %found.conflict232, !dbg !259
  %bound0233 = icmp ult double* %scevgep, %scevgep218, !dbg !259
  %bound1234 = icmp ult double* %scevgep216, %scevgep210, !dbg !259
  %found.conflict235 = and i1 %bound0233, %bound1234, !dbg !259
  %conflict.rdx236 = or i1 %conflict.rdx, %found.conflict235, !dbg !259
  %bound0237 = icmp ult double* %scevgep, %scevgep222, !dbg !259
  %bound1238 = icmp ult double* %scevgep220, %scevgep210, !dbg !259
  %found.conflict239 = and i1 %bound0237, %bound1238, !dbg !259
  %conflict.rdx240 = or i1 %conflict.rdx236, %found.conflict239, !dbg !259
  %bound0241 = icmp ult double* %9, @dtdysq, !dbg !259
  %bound1242 = icmp ugt double* %scevgep210, @dtdysq, !dbg !259
  %found.conflict243 = and i1 %bound0241, %bound1242, !dbg !259
  %conflict.rdx244 = or i1 %conflict.rdx240, %found.conflict243, !dbg !259
  %bound0245 = icmp ult double* %scevgep, %scevgep226, !dbg !259
  %bound1246 = icmp ult double* %scevgep224, %scevgep210, !dbg !259
  %found.conflict247 = and i1 %bound0245, %bound1246, !dbg !259
  %conflict.rdx248 = or i1 %conflict.rdx244, %found.conflict247, !dbg !259
  %bound0249 = icmp ult double* %scevgep, %scevgep228, !dbg !259
  %bound1250 = icmp ult double* %5, %scevgep210, !dbg !259
  %found.conflict251 = and i1 %bound0249, %bound1250, !dbg !259
  %conflict.rdx252 = or i1 %conflict.rdx248, %found.conflict251, !dbg !259
  br i1 %conflict.rdx252, label %for.body10.us.preheader, label %vector.ph, !dbg !259

vector.ph:                                        ; preds = %vector.memcheck
  %10 = load double, double* @dtdxsq, align 8, !tbaa !100, !alias.scope !263
  %broadcast.splatinsert257 = insertelement <2 x double> poison, double %10, i64 0
  %broadcast.splat258 = shufflevector <2 x double> %broadcast.splatinsert257, <2 x double> poison, <2 x i32> zeroinitializer
  %11 = load double, double* @dtdysq, align 8, !tbaa !100, !alias.scope !266
  %broadcast.splatinsert = insertelement <2 x double> poison, double %11, i64 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> poison, <2 x i32> zeroinitializer
  br label %vector.body, !dbg !259

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %20, %vector.body ]
  %offset.idx = or i64 %index, 1
  %12 = getelementptr inbounds double, double* %6, i64 %offset.idx, !dbg !268
  %13 = bitcast double* %12 to <2 x double>*, !dbg !268
  %wide.load = load <2 x double>, <2 x double>* %13, align 8, !dbg !268, !tbaa !100, !alias.scope !271
  %14 = getelementptr inbounds double, double* %5, i64 %offset.idx, !dbg !273
  %15 = bitcast double* %14 to <2 x double>*, !dbg !273
  %wide.load253 = load <2 x double>, <2 x double>* %15, align 8, !dbg !273, !tbaa !100, !alias.scope !274
  %16 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %wide.load253, <2 x double> <double -2.000000e+00, double -2.000000e+00>, <2 x double> %wide.load), !dbg !276
  %17 = getelementptr inbounds double, double* %8, i64 %offset.idx, !dbg !277
  %18 = bitcast double* %17 to <2 x double>*, !dbg !277
  %wide.load254 = load <2 x double>, <2 x double>* %18, align 8, !dbg !277, !tbaa !100, !alias.scope !278
  %19 = fadd <2 x double> %16, %wide.load254, !dbg !280
  %20 = add i64 %index, 2, !dbg !281
  %21 = getelementptr inbounds double, double* %5, i64 %20, !dbg !282
  %22 = bitcast double* %21 to <2 x double>*, !dbg !282
  %wide.load255 = load <2 x double>, <2 x double>* %22, align 8, !dbg !282, !tbaa !100, !alias.scope !283
  %23 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %wide.load253, <2 x double> <double -2.000000e+00, double -2.000000e+00>, <2 x double> %wide.load255), !dbg !285
  %24 = getelementptr inbounds double, double* %5, i64 %index, !dbg !286
  %25 = bitcast double* %24 to <2 x double>*, !dbg !286
  %wide.load256 = load <2 x double>, <2 x double>* %25, align 8, !dbg !286, !tbaa !100, !alias.scope !287
  %26 = fadd <2 x double> %23, %wide.load256, !dbg !289
  %27 = fmul <2 x double> %broadcast.splat, %26
  %28 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %broadcast.splat258, <2 x double> %19, <2 x double> %27)
  %29 = fadd <2 x double> %wide.load253, %28, !dbg !290
  %30 = getelementptr inbounds double, double* %9, i64 %offset.idx, !dbg !291
  %31 = bitcast double* %30 to <2 x double>*, !dbg !292
  store <2 x double> %29, <2 x double>* %31, align 8, !dbg !292, !tbaa !100, !alias.scope !293, !noalias !295
  %32 = icmp eq i64 %20, %n.vec
  br i1 %32, label %middle.block, label %vector.body, !llvm.loop !296

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond7.for.inc49_crit_edge.us, label %for.body10.us.preheader, !dbg !259

for.body10.us.preheader:                          ; preds = %vector.memcheck, %for.cond7.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %for.cond7.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.body10.us, !dbg !259

for.body10.us:                                    ; preds = %for.body10.us.preheader, %for.body10.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body10.us ], [ %indvars.iv.ph, %for.body10.us.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !246, metadata !DIExpression()), !dbg !249
  %33 = load double, double* @dtdxsq, align 8, !dbg !299, !tbaa !100
  %arrayidx12.us = getelementptr inbounds double, double* %6, i64 %indvars.iv, !dbg !268
  %34 = load double, double* %arrayidx12.us, align 8, !dbg !268, !tbaa !100
  %arrayidx16.us = getelementptr inbounds double, double* %5, i64 %indvars.iv, !dbg !273
  %35 = load double, double* %arrayidx16.us, align 8, !dbg !273, !tbaa !100
  %36 = tail call double @llvm.fmuladd.f64(double %35, double -2.000000e+00, double %34), !dbg !276
  %arrayidx21.us = getelementptr inbounds double, double* %8, i64 %indvars.iv, !dbg !277
  %37 = load double, double* %arrayidx21.us, align 8, !dbg !277, !tbaa !100
  %add22.us = fadd double %36, %37, !dbg !280
  %38 = load double, double* @dtdysq, align 8, !dbg !300, !tbaa !100
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !281
  %arrayidx27.us = getelementptr inbounds double, double* %5, i64 %indvars.iv.next, !dbg !282
  %39 = load double, double* %arrayidx27.us, align 8, !dbg !282, !tbaa !100
  %40 = tail call double @llvm.fmuladd.f64(double %35, double -2.000000e+00, double %39), !dbg !285
  %41 = add nsw i64 %indvars.iv, -1, !dbg !301
  %arrayidx37.us = getelementptr inbounds double, double* %5, i64 %41, !dbg !286
  %42 = load double, double* %arrayidx37.us, align 8, !dbg !286, !tbaa !100
  %add38.us = fadd double %40, %42, !dbg !289
  %mul39.us = fmul double %38, %add38.us, !dbg !302
  %43 = tail call double @llvm.fmuladd.f64(double %33, double %add22.us, double %mul39.us), !dbg !303
  %add44.us = fadd double %35, %43, !dbg !290
  %arrayidx48.us = getelementptr inbounds double, double* %9, i64 %indvars.iv, !dbg !291
  store double %add44.us, double* %arrayidx48.us, align 8, !dbg !292, !tbaa !100
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !246, metadata !DIExpression()), !dbg !249
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count, !dbg !304
  br i1 %exitcond.not, label %for.cond7.for.inc49_crit_edge.us, label %for.body10.us, !dbg !259, !llvm.loop !305

for.cond7.for.inc49_crit_edge.us:                 ; preds = %for.body10.us, %middle.block
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next187, metadata !245, metadata !DIExpression()), !dbg !249
  %exitcond191.not = icmp eq i64 %indvars.iv.next187, %wide.trip.count190, !dbg !255
  br i1 %exitcond191.not, label %for.body55.lr.ph, label %for.cond7.preheader.us, !dbg !258, !llvm.loop !306

for.body55.lr.ph:                                 ; preds = %for.cond7.for.inc49_crit_edge.us, %for.cond7.preheader.lr.ph
  call void @llvm.dbg.value(metadata i32 %1, metadata !246, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !249
  %sub52 = add nsw i32 %1, -1, !dbg !308
  call void @llvm.dbg.value(metadata i32 %sub52, metadata !246, metadata !DIExpression()), !dbg !249
  %idxprom61 = sext i32 %sub52 to i64
  %44 = sext i32 %cond to i64, !dbg !310
  %wide.trip.count195 = sext i32 %cond5 to i64, !dbg !311
  br label %for.body55, !dbg !310

for.body69.preheader:                             ; preds = %for.body55
  call void @llvm.dbg.value(metadata i32 %cond, metadata !245, metadata !DIExpression()), !dbg !249
  %45 = sub nsw i64 %wide.trip.count195, %44, !dbg !313
  %46 = xor i64 %44, -1, !dbg !313
  %47 = add nsw i64 %46, %wide.trip.count195, !dbg !313
  %xtraiter = and i64 %45, 7, !dbg !313
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !313
  br i1 %lcmp.mod.not, label %for.body69.prol.loopexit, label %for.body69.prol, !dbg !313

for.body69.prol:                                  ; preds = %for.body69.preheader, %for.body69.prol
  %indvars.iv197.prol = phi i64 [ %indvars.iv.next198.prol, %for.body69.prol ], [ %44, %for.body69.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body69.prol ], [ 0, %for.body69.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv197.prol, metadata !245, metadata !DIExpression()), !dbg !249
  %arrayidx71.prol = getelementptr inbounds double*, double** %neww, i64 %indvars.iv197.prol, !dbg !315
  %48 = load double*, double** %arrayidx71.prol, align 8, !dbg !315, !tbaa !141
  store double 0.000000e+00, double* %48, align 8, !dbg !317, !tbaa !100
  %indvars.iv.next198.prol = add nsw i64 %indvars.iv197.prol, 1, !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.prol, metadata !245, metadata !DIExpression()), !dbg !249
  %prol.iter.next = add i64 %prol.iter, 1, !dbg !313
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter, !dbg !313
  br i1 %prol.iter.cmp.not, label %for.body69.prol.loopexit, label %for.body69.prol, !dbg !313, !llvm.loop !319

for.body69.prol.loopexit:                         ; preds = %for.body69.prol, %for.body69.preheader
  %indvars.iv197.unr = phi i64 [ %44, %for.body69.preheader ], [ %indvars.iv.next198.prol, %for.body69.prol ]
  %49 = icmp ult i64 %47, 7, !dbg !313
  br i1 %49, label %for.end76, label %for.body69, !dbg !313

for.body55:                                       ; preds = %for.body55.lr.ph, %for.body55
  %indvars.iv192 = phi i64 [ %44, %for.body55.lr.ph ], [ %indvars.iv.next193, %for.body55 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv192, metadata !245, metadata !DIExpression()), !dbg !249
  %50 = load double, double* @t, align 8, !dbg !320, !tbaa !100
  %mul = fmul double %50, -2.000000e+00, !dbg !320
  %call = tail call double @exp(double noundef %mul) #16, !dbg !320
  %51 = load double, double* @xu, align 8, !dbg !320, !tbaa !100
  %52 = trunc i64 %indvars.iv192 to i32, !dbg !320
  %conv = sitofp i32 %52 to double, !dbg !320
  %53 = load double, double* @dx, align 8, !dbg !320, !tbaa !100
  %54 = tail call double @llvm.fmuladd.f64(double %conv, double %53, double %51), !dbg !320
  %call57 = tail call double @sin(double noundef %54) #16, !dbg !320
  %mul58 = fmul double %call, %call57, !dbg !320
  %arrayidx60 = getelementptr inbounds double*, double** %neww, i64 %indvars.iv192, !dbg !321
  %55 = load double*, double** %arrayidx60, align 8, !dbg !321, !tbaa !141
  %arrayidx62 = getelementptr inbounds double, double* %55, i64 %idxprom61, !dbg !321
  store double %mul58, double* %arrayidx62, align 8, !dbg !322, !tbaa !100
  %indvars.iv.next193 = add nsw i64 %indvars.iv192, 1, !dbg !323
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next193, metadata !245, metadata !DIExpression()), !dbg !249
  %exitcond196.not = icmp eq i64 %indvars.iv.next193, %wide.trip.count195, !dbg !311
  br i1 %exitcond196.not, label %for.body69.preheader, label %for.body55, !dbg !310, !llvm.loop !324

for.body69:                                       ; preds = %for.body69.prol.loopexit, %for.body69
  %indvars.iv197 = phi i64 [ %indvars.iv.next198.7, %for.body69 ], [ %indvars.iv197.unr, %for.body69.prol.loopexit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv197, metadata !245, metadata !DIExpression()), !dbg !249
  %arrayidx71 = getelementptr inbounds double*, double** %neww, i64 %indvars.iv197, !dbg !315
  %56 = load double*, double** %arrayidx71, align 8, !dbg !315, !tbaa !141
  store double 0.000000e+00, double* %56, align 8, !dbg !317, !tbaa !100
  %indvars.iv.next198 = add nsw i64 %indvars.iv197, 1, !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198, metadata !245, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198, metadata !245, metadata !DIExpression()), !dbg !249
  %arrayidx71.1 = getelementptr inbounds double*, double** %neww, i64 %indvars.iv.next198, !dbg !315
  %57 = load double*, double** %arrayidx71.1, align 8, !dbg !315, !tbaa !141
  store double 0.000000e+00, double* %57, align 8, !dbg !317, !tbaa !100
  %indvars.iv.next198.1 = add nsw i64 %indvars.iv197, 2, !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.1, metadata !245, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.1, metadata !245, metadata !DIExpression()), !dbg !249
  %arrayidx71.2 = getelementptr inbounds double*, double** %neww, i64 %indvars.iv.next198.1, !dbg !315
  %58 = load double*, double** %arrayidx71.2, align 8, !dbg !315, !tbaa !141
  store double 0.000000e+00, double* %58, align 8, !dbg !317, !tbaa !100
  %indvars.iv.next198.2 = add nsw i64 %indvars.iv197, 3, !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.2, metadata !245, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.2, metadata !245, metadata !DIExpression()), !dbg !249
  %arrayidx71.3 = getelementptr inbounds double*, double** %neww, i64 %indvars.iv.next198.2, !dbg !315
  %59 = load double*, double** %arrayidx71.3, align 8, !dbg !315, !tbaa !141
  store double 0.000000e+00, double* %59, align 8, !dbg !317, !tbaa !100
  %indvars.iv.next198.3 = add nsw i64 %indvars.iv197, 4, !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.3, metadata !245, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.3, metadata !245, metadata !DIExpression()), !dbg !249
  %arrayidx71.4 = getelementptr inbounds double*, double** %neww, i64 %indvars.iv.next198.3, !dbg !315
  %60 = load double*, double** %arrayidx71.4, align 8, !dbg !315, !tbaa !141
  store double 0.000000e+00, double* %60, align 8, !dbg !317, !tbaa !100
  %indvars.iv.next198.4 = add nsw i64 %indvars.iv197, 5, !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.4, metadata !245, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.4, metadata !245, metadata !DIExpression()), !dbg !249
  %arrayidx71.5 = getelementptr inbounds double*, double** %neww, i64 %indvars.iv.next198.4, !dbg !315
  %61 = load double*, double** %arrayidx71.5, align 8, !dbg !315, !tbaa !141
  store double 0.000000e+00, double* %61, align 8, !dbg !317, !tbaa !100
  %indvars.iv.next198.5 = add nsw i64 %indvars.iv197, 6, !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.5, metadata !245, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.5, metadata !245, metadata !DIExpression()), !dbg !249
  %arrayidx71.6 = getelementptr inbounds double*, double** %neww, i64 %indvars.iv.next198.5, !dbg !315
  %62 = load double*, double** %arrayidx71.6, align 8, !dbg !315, !tbaa !141
  store double 0.000000e+00, double* %62, align 8, !dbg !317, !tbaa !100
  %indvars.iv.next198.6 = add nsw i64 %indvars.iv197, 7, !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.6, metadata !245, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.6, metadata !245, metadata !DIExpression()), !dbg !249
  %arrayidx71.7 = getelementptr inbounds double*, double** %neww, i64 %indvars.iv.next198.6, !dbg !315
  %63 = load double*, double** %arrayidx71.7, align 8, !dbg !315, !tbaa !141
  store double 0.000000e+00, double* %63, align 8, !dbg !317, !tbaa !100
  %indvars.iv.next198.7 = add nsw i64 %indvars.iv197, 8, !dbg !318
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next198.7, metadata !245, metadata !DIExpression()), !dbg !249
  %exitcond201.not.7 = icmp eq i64 %indvars.iv.next198.7, %wide.trip.count195, !dbg !326
  br i1 %exitcond201.not.7, label %for.end76, label %for.body69, !dbg !313, !llvm.loop !327

for.end76:                                        ; preds = %for.body69.prol.loopexit, %for.body69, %entry
  br i1 %cmp, label %for.cond79.preheader, label %if.end, !dbg !329

for.cond79.preheader:                             ; preds = %for.end76
  %64 = load i32, i32* @ny, align 4, !tbaa !136
  call void @llvm.dbg.value(metadata i32 0, metadata !246, metadata !DIExpression()), !dbg !249
  %cmp80179 = icmp sgt i32 %64, 0, !dbg !330
  br i1 %cmp80179, label %for.body82.lr.ph, label %if.end, !dbg !335

for.body82.lr.ph:                                 ; preds = %for.cond79.preheader
  %65 = bitcast double** %neww to i8**
  %66 = load i8*, i8** %65, align 8, !tbaa !141
  %67 = zext i32 %64 to i64, !dbg !335
  %68 = shl nuw nsw i64 %67, 3, !dbg !335
  call void @llvm.memset.p0i8.i64(i8* align 8 %66, i8 0, i64 %68, i1 false), !dbg !336, !tbaa !100
  call void @llvm.dbg.value(metadata i32 undef, metadata !246, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !249
  br label %if.end, !dbg !337

if.end:                                           ; preds = %for.body82.lr.ph, %for.cond79.preheader, %for.end76
  %69 = load i32, i32* @nx, align 4, !dbg !337, !tbaa !136
  %cmp90 = icmp eq i32 %69, %ub, !dbg !339
  %70 = load i32, i32* @ny, align 4
  %cmp95181 = icmp sgt i32 %70, 0
  %or.cond = select i1 %cmp90, i1 %cmp95181, i1 false, !dbg !340
  call void @llvm.dbg.value(metadata i32 %69, metadata !245, metadata !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value)), !dbg !249
  call void @llvm.dbg.value(metadata i32 0, metadata !246, metadata !DIExpression()), !dbg !249
  br i1 %or.cond, label %for.body97.lr.ph, label %if.end111, !dbg !340

for.body97.lr.ph:                                 ; preds = %if.end
  %sub93 = add nsw i32 %ub, -1, !dbg !341
  call void @llvm.dbg.value(metadata i32 %sub93, metadata !245, metadata !DIExpression()), !dbg !249
  %idxprom104 = sext i32 %sub93 to i64
  %arrayidx105 = getelementptr inbounds double*, double** %neww, i64 %idxprom104
  br label %for.body97, !dbg !344

for.body97:                                       ; preds = %for.body97.lr.ph, %for.body97
  %indvars.iv205 = phi i64 [ 0, %for.body97.lr.ph ], [ %indvars.iv.next206, %for.body97 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv205, metadata !246, metadata !DIExpression()), !dbg !249
  %71 = load double, double* @t, align 8, !dbg !345, !tbaa !100
  %mul98 = fmul double %71, -2.000000e+00, !dbg !345
  %call99 = tail call double @exp(double noundef %mul98) #16, !dbg !345
  %72 = load double, double* @yu, align 8, !dbg !345, !tbaa !100
  %73 = trunc i64 %indvars.iv205 to i32, !dbg !345
  %conv100 = sitofp i32 %73 to double, !dbg !345
  %74 = load double, double* @dy, align 8, !dbg !345, !tbaa !100
  %75 = tail call double @llvm.fmuladd.f64(double %conv100, double %74, double %72), !dbg !345
  %call102 = tail call double @sin(double noundef %75) #16, !dbg !345
  %mul103 = fmul double %call99, %call102, !dbg !345
  %76 = load double*, double** %arrayidx105, align 8, !dbg !347, !tbaa !141
  %arrayidx107 = getelementptr inbounds double, double* %76, i64 %indvars.iv205, !dbg !347
  store double %mul103, double* %arrayidx107, align 8, !dbg !348, !tbaa !100
  %indvars.iv.next206 = add nuw nsw i64 %indvars.iv205, 1, !dbg !349
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next206, metadata !246, metadata !DIExpression()), !dbg !249
  %77 = load i32, i32* @ny, align 4, !dbg !350, !tbaa !136
  %78 = sext i32 %77 to i64, !dbg !351
  %cmp95 = icmp slt i64 %indvars.iv.next206, %78, !dbg !351
  br i1 %cmp95, label %for.body97, label %if.end111, !dbg !344, !llvm.loop !352

if.end111:                                        ; preds = %for.body97, %if.end
  ret void, !dbg !354
}

; Function Attrs: nounwind uwtable
define dso_local i32 @divide(i32 noundef %lb, i32 noundef %ub, double** noundef %neww, double** noundef %old, i32 noundef %mode, i32 noundef %timestep) local_unnamed_addr #8 !dbg !355 {
entry:
  %l = alloca i32, align 4
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !370
  call void @llvm.dbg.value(metadata i32 %lb, metadata !359, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.value(metadata i32 %ub, metadata !360, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.value(metadata double** %neww, metadata !361, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.value(metadata double** %old, metadata !362, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.value(metadata i32 %mode, metadata !363, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.value(metadata i32 %timestep, metadata !364, metadata !DIExpression()), !dbg !371
  %sub = sub nsw i32 %ub, %lb, !dbg !372
  %0 = load i32, i32* @leafmaxcol, align 4, !dbg !373, !tbaa !136
  %cmp = icmp sgt i32 %sub, %0, !dbg !374
  br i1 %cmp, label %if.then, label %if.else, !dbg !375

if.then:                                          ; preds = %entry
  %l.0.l.0.l.0..sroa_cast = bitcast i32* %l to i8*, !dbg !376
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %l.0.l.0.l.0..sroa_cast), !dbg !376
  call void @llvm.dbg.value(metadata i32 0, metadata !368, metadata !DIExpression()), !dbg !370
  store i32 0, i32* %l, align 4, !dbg !377, !tbaa !136
  %add = add nsw i32 %ub, %lb, !dbg !378
  %div = sdiv i32 %add, 2, !dbg !379
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !380

det.achd:                                         ; preds = %if.then
  %call = tail call i32 @divide(i32 noundef %lb, i32 noundef %div, double** noundef %neww, double** noundef %old, i32 noundef %mode, i32 noundef %timestep), !dbg !380
  call void @llvm.dbg.value(metadata i32 %call, metadata !368, metadata !DIExpression()), !dbg !370
  store i32 %call, i32* %l, align 4, !dbg !381, !tbaa !136
  reattach within %syncreg, label %det.cont, !dbg !381

det.cont:                                         ; preds = %det.achd, %if.then
  %call3 = tail call i32 @divide(i32 noundef %div, i32 noundef %ub, double** noundef %neww, double** noundef %old, i32 noundef %mode, i32 noundef %timestep), !dbg !382
  call void @llvm.dbg.value(metadata i32 %call3, metadata !369, metadata !DIExpression()), !dbg !370
  sync within %syncreg, label %sync.continue, !dbg !383

sync.continue:                                    ; preds = %det.cont
  %l.0.load = load i32, i32* %l, align 4, !dbg !384
  call void @llvm.dbg.value(metadata i32 %l.0.load, metadata !368, metadata !DIExpression()), !dbg !370
  %add4 = add nsw i32 %l.0.load, %call3, !dbg !385
  call void @llvm.dbg.value(metadata i32 %add4, metadata !365, metadata !DIExpression()), !dbg !370
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %l.0.l.0.l.0..sroa_cast), !dbg !386
  br label %return

if.else:                                          ; preds = %entry
  switch i32 %mode, label %return [
    i32 2, label %sw.bb
    i32 0, label %sw.bb7
    i32 1, label %sw.bb8
  ], !dbg !387

sw.bb:                                            ; preds = %if.else
  %1 = and i32 %timestep, 1, !dbg !389
  %tobool.not = icmp eq i32 %1, 0, !dbg !389
  br i1 %tobool.not, label %if.else6, label %if.then5, !dbg !392

if.then5:                                         ; preds = %sw.bb
  tail call void @compstripe(double** noundef %neww, double** noundef %old, i32 noundef %lb, i32 noundef %ub), !dbg !393
  br label %return, !dbg !393

if.else6:                                         ; preds = %sw.bb
  tail call void @compstripe(double** noundef %old, double** noundef %neww, i32 noundef %lb, i32 noundef %ub), !dbg !394
  br label %return

sw.bb7:                                           ; preds = %if.else
  call void @llvm.dbg.value(metadata double** %neww, metadata !122, metadata !DIExpression()) #16, !dbg !395
  call void @llvm.dbg.value(metadata double** %old, metadata !123, metadata !DIExpression()) #16, !dbg !395
  call void @llvm.dbg.value(metadata i32 %lb, metadata !124, metadata !DIExpression()) #16, !dbg !395
  call void @llvm.dbg.value(metadata i32 %ub, metadata !125, metadata !DIExpression()) #16, !dbg !395
  call void @llvm.dbg.value(metadata i32 %lb, metadata !126, metadata !DIExpression()) #16, !dbg !395
  %idx.ext.i = sext i32 %lb to i64, !dbg !397
  call void @llvm.dbg.value(metadata !DIArgList(double** %old, i64 %idx.ext.i), metadata !128, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #16, !dbg !395
  call void @llvm.dbg.value(metadata !DIArgList(double** %neww, i64 %idx.ext.i), metadata !127, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #16, !dbg !395
  call void @llvm.dbg.value(metadata !DIArgList(double** %old, i64 %idx.ext.i), metadata !128, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_constu, 8, DW_OP_mul, DW_OP_plus, DW_OP_stack_value)) #16, !dbg !395
  call void @llvm.dbg.value(metadata i32 %lb, metadata !126, metadata !DIExpression()) #16, !dbg !395
  %cmp15.i = icmp sgt i32 %ub, %lb, !dbg !398
  br i1 %cmp15.i, label %for.body.lr.ph.i, label %return, !dbg !399

for.body.lr.ph.i:                                 ; preds = %sw.bb7
  %add.ptr2.i = getelementptr inbounds double*, double** %neww, i64 %idx.ext.i, !dbg !400
  call void @llvm.dbg.value(metadata double** %add.ptr2.i, metadata !127, metadata !DIExpression()) #16, !dbg !395
  %add.ptr.i = getelementptr inbounds double*, double** %old, i64 %idx.ext.i, !dbg !397
  call void @llvm.dbg.value(metadata double** %add.ptr.i, metadata !128, metadata !DIExpression()) #16, !dbg !395
  %2 = load i32, i32* @ny, align 4, !tbaa !136
  %conv.i = sext i32 %2 to i64
  %mul.i = shl nsw i64 %conv.i, 3
  br label %for.body.i, !dbg !399

for.body.i:                                       ; preds = %for.body.i, %for.body.lr.ph.i
  %rol.018.i = phi double** [ %add.ptr.i, %for.body.lr.ph.i ], [ %incdec.ptr.i, %for.body.i ]
  %rne.017.i = phi double** [ %add.ptr2.i, %for.body.lr.ph.i ], [ %incdec.ptr6.i, %for.body.i ]
  %j.016.i = phi i32 [ %lb, %for.body.lr.ph.i ], [ %inc.i, %for.body.i ]
  call void @llvm.dbg.value(metadata double** %rol.018.i, metadata !128, metadata !DIExpression()) #16, !dbg !395
  call void @llvm.dbg.value(metadata double** %rne.017.i, metadata !127, metadata !DIExpression()) #16, !dbg !395
  call void @llvm.dbg.value(metadata i32 %j.016.i, metadata !126, metadata !DIExpression()) #16, !dbg !395
  %call.i = tail call noalias i8* @malloc(i64 noundef %mul.i) #16, !dbg !401
  %3 = bitcast double** %rol.018.i to i8**, !dbg !402
  store i8* %call.i, i8** %3, align 8, !dbg !402, !tbaa !141
  %call5.i = tail call noalias i8* @malloc(i64 noundef %mul.i) #16, !dbg !403
  %4 = bitcast double** %rne.017.i to i8**, !dbg !404
  store i8* %call5.i, i8** %4, align 8, !dbg !404, !tbaa !141
  %inc.i = add nsw i32 %j.016.i, 1, !dbg !405
  call void @llvm.dbg.value(metadata i32 %inc.i, metadata !126, metadata !DIExpression()) #16, !dbg !395
  %incdec.ptr.i = getelementptr inbounds double*, double** %rol.018.i, i64 1, !dbg !406
  call void @llvm.dbg.value(metadata double** %incdec.ptr.i, metadata !128, metadata !DIExpression()) #16, !dbg !395
  %incdec.ptr6.i = getelementptr inbounds double*, double** %rne.017.i, i64 1, !dbg !407
  call void @llvm.dbg.value(metadata double** %incdec.ptr6.i, metadata !127, metadata !DIExpression()) #16, !dbg !395
  %exitcond.not.i = icmp eq i32 %inc.i, %ub, !dbg !398
  br i1 %exitcond.not.i, label %return, label %for.body.i, !dbg !399, !llvm.loop !408

sw.bb8:                                           ; preds = %if.else
  tail call void @initgrid(double** noundef %old, i32 noundef %lb, i32 noundef %ub), !dbg !410
  br label %return, !dbg !411

return:                                           ; preds = %for.body.i, %sw.bb7, %if.else, %if.then5, %if.else6, %sw.bb8, %sync.continue
  %retval.0 = phi i32 [ %add4, %sync.continue ], [ 1, %sw.bb8 ], [ 1, %if.else6 ], [ 1, %if.then5 ], [ 0, %if.else ], [ 1, %sw.bb7 ], [ 1, %for.body.i ], !dbg !412
  ret i32 %retval.0, !dbg !413
}

; Function Attrs: nounwind uwtable
define dso_local i32 @heat() local_unnamed_addr #8 !dbg !414 {
entry:
  %0 = load i32, i32* @nx, align 4, !dbg !422, !tbaa !136
  %conv = sext i32 %0 to i64, !dbg !422
  %mul = shl nsw i64 %conv, 3, !dbg !423
  %call = tail call noalias i8* @malloc(i64 noundef %mul) #16, !dbg !424
  %1 = bitcast i8* %call to double**, !dbg !425
  call void @llvm.dbg.value(metadata double** %1, metadata !418, metadata !DIExpression()), !dbg !426
  %call3 = tail call noalias i8* @malloc(i64 noundef %mul) #16, !dbg !427
  %2 = bitcast i8* %call3 to double**, !dbg !428
  call void @llvm.dbg.value(metadata double** %2, metadata !419, metadata !DIExpression()), !dbg !426
  %call4 = tail call i32 @divide(i32 noundef 0, i32 noundef %0, double** noundef %2, double** noundef %1, i32 noundef 0, i32 noundef 0), !dbg !429
  call void @llvm.dbg.value(metadata i32 %call4, metadata !421, metadata !DIExpression()), !dbg !426
  %3 = load i32, i32* @nx, align 4, !dbg !430, !tbaa !136
  %call5 = tail call i32 @divide(i32 noundef 0, i32 noundef %3, double** noundef %2, double** noundef %1, i32 noundef 1, i32 noundef 0), !dbg !431
  call void @llvm.dbg.value(metadata i32 %call5, metadata !421, metadata !DIExpression()), !dbg !426
  call void @llvm.dbg.value(metadata i32 1, metadata !420, metadata !DIExpression()), !dbg !426
  %4 = load i32, i32* @nt, align 4, !dbg !432, !tbaa !136
  %cmp.not21 = icmp slt i32 %4, 1, !dbg !435
  br i1 %cmp.not21, label %for.end, label %for.body, !dbg !436

for.body:                                         ; preds = %entry, %for.body
  %c.022 = phi i32 [ %inc, %for.body ], [ 1, %entry ]
  call void @llvm.dbg.value(metadata i32 %c.022, metadata !420, metadata !DIExpression()), !dbg !426
  %5 = load double, double* @tu, align 8, !dbg !437, !tbaa !100
  %conv7 = sitofp i32 %c.022 to double, !dbg !439
  %6 = load double, double* @dt, align 8, !dbg !440, !tbaa !100
  %7 = tail call double @llvm.fmuladd.f64(double %conv7, double %6, double %5), !dbg !441
  store double %7, double* @t, align 8, !dbg !442, !tbaa !100
  %8 = load i32, i32* @nx, align 4, !dbg !443, !tbaa !136
  %call9 = tail call i32 @divide(i32 noundef 0, i32 noundef %8, double** noundef %2, double** noundef %1, i32 noundef 2, i32 noundef %c.022), !dbg !444
  call void @llvm.dbg.value(metadata i32 %call9, metadata !421, metadata !DIExpression()), !dbg !426
  %inc = add nuw nsw i32 %c.022, 1, !dbg !445
  call void @llvm.dbg.value(metadata i32 %inc, metadata !420, metadata !DIExpression()), !dbg !426
  %9 = load i32, i32* @nt, align 4, !dbg !432, !tbaa !136
  %cmp.not.not = icmp slt i32 %c.022, %9, !dbg !435
  br i1 %cmp.not.not, label %for.body, label %for.end, !dbg !436, !llvm.loop !446

for.end:                                          ; preds = %for.body, %entry
  ret i32 0, !dbg !448
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @usage() local_unnamed_addr #6 !dbg !449 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !451, !tbaa !141
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i64 0, i64 0), i64 43, i64 1, %struct._IO_FILE* %0) #17, !dbg !452
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !453, !tbaa !141
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.1, i64 0, i64 0), i64 71, i64 1, %struct._IO_FILE* %2) #17, !dbg !454
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !455, !tbaa !141
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.2, i64 0, i64 0), i64 70, i64 1, %struct._IO_FILE* %4) #17, !dbg !456
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !457, !tbaa !141
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i64 0, i64 0), i64 41, i64 1, %struct._IO_FILE* %6) #17, !dbg !458
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !459, !tbaa !141
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i64 0, i64 0), i64 21, i64 1, %struct._IO_FILE* %8) #17, !dbg !460
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !461, !tbaa !141
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.5, i64 0, i64 0), i64 61, i64 1, %struct._IO_FILE* %10) #17, !dbg !462
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !463, !tbaa !141
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str.6, i64 0, i64 0), i64 63, i64 1, %struct._IO_FILE* %12) #17, !dbg !464
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !465, !tbaa !141
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.7, i64 0, i64 0), i64 62, i64 1, %struct._IO_FILE* %14) #17, !dbg !466
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !467, !tbaa !141
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str.8, i64 0, i64 0), i64 62, i64 1, %struct._IO_FILE* %16) #17, !dbg !468
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !469, !tbaa !141
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.9, i64 0, i64 0), i64 49, i64 1, %struct._IO_FILE* %18) #17, !dbg !470
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !471, !tbaa !141
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i64 0, i64 0), i64 32, i64 1, %struct._IO_FILE* %20) #17, !dbg !472
  ret i32 1, !dbg !473
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #9

; Function Attrs: nounwind uwtable
define dso_local void @read_heatparams(i8* noundef %filefn) local_unnamed_addr #8 !dbg !474 {
entry:
  call void @llvm.dbg.value(metadata i8* %filefn, metadata !479, metadata !DIExpression()), !dbg !539
  %call = tail call %struct._IO_FILE* @fopen(i8* noundef %filefn, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i64 0, i64 0)), !dbg !540
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !480, metadata !DIExpression()), !dbg !539
  %cmp = icmp eq %struct._IO_FILE* %call, null, !dbg !542
  br i1 %cmp, label %if.then, label %if.end, !dbg !543

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([17 x i8], [17 x i8]* @.str.12, i64 0, i64 0), i8* noundef %filefn), !dbg !544
  tail call void @exit(i32 noundef 0) #18, !dbg !546
  unreachable, !dbg !546

if.end:                                           ; preds = %entry
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* noundef nonnull %call, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.13, i64 0, i64 0), i32* noundef nonnull @nx, i32* noundef nonnull @ny, i32* noundef nonnull @nt, double* noundef nonnull @xu, double* noundef nonnull @xo, double* noundef nonnull @yu, double* noundef nonnull @yo, double* noundef nonnull @tu, double* noundef nonnull @to) #16, !dbg !547
  call void @llvm.dbg.value(metadata i32 %call2, metadata !538, metadata !DIExpression()), !dbg !539
  %cmp3.not = icmp eq i32 %call2, 9, !dbg !548
  br i1 %cmp3.not, label %if.end7, label %if.then4, !dbg !550

if.then4:                                         ; preds = %if.end
  %call5 = tail call i32* @__errno_location() #19, !dbg !551
  %0 = load i32, i32* %call5, align 4, !dbg !551, !tbaa !136
  %call6 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([27 x i8], [27 x i8]* @.str.14, i64 0, i64 0), i32 noundef %0), !dbg !552
  br label %if.end7, !dbg !552

if.end7:                                          ; preds = %if.then4, %if.end
  %call8 = tail call i32 @fclose(%struct._IO_FILE* noundef nonnull %call), !dbg !553
  ret void, !dbg !554
}

; Function Attrs: nofree nounwind
declare dso_local noalias noundef %struct._IO_FILE* @fopen(i8* nocapture noundef readonly, i8* nocapture noundef readonly) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #9

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #10

declare dso_local i32 @__isoc99_fscanf(%struct._IO_FILE* noundef, i8* noundef, ...) local_unnamed_addr #11

; Function Attrs: mustprogress nofree nosync nounwind readnone willreturn
declare dso_local i32* @__errno_location() local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare !dbg !555 dso_local noundef i32 @fclose(%struct._IO_FILE* nocapture noundef) local_unnamed_addr #9

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** noundef %argv) local_unnamed_addr #8 !dbg !558 {
entry:
  %benchmark = alloca i32, align 4
  %help = alloca i32, align 4
  %round = alloca i32, align 4
  %filename = alloca [100 x i8], align 16
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !563, metadata !DIExpression()), !dbg !580
  call void @llvm.dbg.value(metadata i8** %argv, metadata !564, metadata !DIExpression()), !dbg !580
  %0 = bitcast i32* %benchmark to i8*, !dbg !581
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #16, !dbg !581
  %1 = bitcast i32* %help to i8*, !dbg !581
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #16, !dbg !581
  %2 = bitcast i32* %round to i8*, !dbg !581
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #16, !dbg !581
  %3 = getelementptr inbounds [100 x i8], [100 x i8]* %filename, i64 0, i64 0, !dbg !582
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %3) #16, !dbg !582
  call void @llvm.dbg.declare(metadata [100 x i8]* %filename, metadata !569, metadata !DIExpression()), !dbg !583
  store i32 512, i32* @nx, align 4, !dbg !584, !tbaa !136
  store i32 512, i32* @ny, align 4, !dbg !585, !tbaa !136
  store i32 100, i32* @nt, align 4, !dbg !586, !tbaa !136
  store double 0.000000e+00, double* @xu, align 8, !dbg !587, !tbaa !100
  store double 0x3FF921FB54442D18, double* @xo, align 8, !dbg !588, !tbaa !100
  store double 0.000000e+00, double* @yu, align 8, !dbg !589, !tbaa !100
  store double 0x3FF921FB54442D18, double* @yo, align 8, !dbg !590, !tbaa !100
  store double 0.000000e+00, double* @tu, align 8, !dbg !591, !tbaa !100
  store double 0x3E7AD7F29ABCAF48, double* @to, align 8, !dbg !592, !tbaa !100
  store i32 10, i32* @leafmaxcol, align 4, !dbg !593, !tbaa !136
  store i8 0, i8* %3, align 16, !dbg !594, !tbaa !595
  call void @llvm.dbg.value(metadata i32 1, metadata !568, metadata !DIExpression()), !dbg !580
  store i32 1, i32* %round, align 4, !dbg !596, !tbaa !136
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !597, !tbaa !141
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %4, i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.29, i64 0, i64 0), double noundef 0x2DAC0552ED6FE79F) #17, !dbg !598
  call void @llvm.dbg.value(metadata i32* %benchmark, metadata !566, metadata !DIExpression(DW_OP_deref)), !dbg !580
  call void @llvm.dbg.value(metadata i32* %help, metadata !567, metadata !DIExpression(DW_OP_deref)), !dbg !580
  call void @llvm.dbg.value(metadata i32* %round, metadata !568, metadata !DIExpression(DW_OP_deref)), !dbg !580
  call void (i32, i8**, i8**, i32*, ...) @get_options(i32 noundef %argc, i8** noundef %argv, i8** noundef getelementptr inbounds ([15 x i8*], [15 x i8*]* @specifiers, i64 0, i64 0), i32* noundef getelementptr inbounds ([15 x i32], [15 x i32]* @opt_types, i64 0, i64 0), i32* noundef nonnull @leafmaxcol, i32* noundef nonnull @nx, i32* noundef nonnull @ny, i32* noundef nonnull @nt, double* noundef nonnull @xu, double* noundef nonnull @xo, double* noundef nonnull @yu, double* noundef nonnull @yo, double* noundef nonnull @tu, double* noundef nonnull @to, i8* noundef nonnull %3, i32* noundef nonnull %benchmark, i32* noundef nonnull %help, i32* noundef nonnull %round) #16, !dbg !599
  %5 = load i32, i32* %help, align 4, !dbg !600, !tbaa !136
  call void @llvm.dbg.value(metadata i32 %5, metadata !567, metadata !DIExpression()), !dbg !580
  %tobool.not = icmp eq i32 %5, 0, !dbg !600
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !602

if.then:                                          ; preds = %entry
  %call5 = call i32 @usage(), !dbg !603
  br label %cleanup, !dbg !604

if.end:                                           ; preds = %entry
  %6 = load i32, i32* %benchmark, align 4, !dbg !605, !tbaa !136
  call void @llvm.dbg.value(metadata i32 %6, metadata !566, metadata !DIExpression()), !dbg !580
  switch i32 %6, label %if.end13 [
    i32 3, label %sw.bb11
    i32 1, label %sw.bb
    i32 2, label %sw.bb9
  ], !dbg !607

sw.bb:                                            ; preds = %if.end
  store i32 512, i32* @nx, align 4, !dbg !608, !tbaa !136
  store i32 512, i32* @ny, align 4, !dbg !611, !tbaa !136
  store i32 1, i32* @nt, align 4, !dbg !612, !tbaa !136
  store double 0.000000e+00, double* @xu, align 8, !dbg !613, !tbaa !100
  store double 0x3FF921FB54442D18, double* @xo, align 8, !dbg !614, !tbaa !100
  store double 0.000000e+00, double* @yu, align 8, !dbg !615, !tbaa !100
  store double 0x3FF921FB54442D18, double* @yo, align 8, !dbg !616, !tbaa !100
  store double 0.000000e+00, double* @tu, align 8, !dbg !617, !tbaa !100
  store double 0x3E7AD7F29ABCAF48, double* @to, align 8, !dbg !618, !tbaa !100
  store i32 10, i32* @leafmaxcol, align 4, !dbg !619, !tbaa !136
  store i8 0, i8* %3, align 16, !dbg !620, !tbaa !595
  br label %if.end13, !dbg !621

sw.bb9:                                           ; preds = %if.end
  store i32 4096, i32* @nx, align 4, !dbg !622, !tbaa !136
  store i32 512, i32* @ny, align 4, !dbg !623, !tbaa !136
  store i32 40, i32* @nt, align 4, !dbg !624, !tbaa !136
  store double 0.000000e+00, double* @xu, align 8, !dbg !625, !tbaa !100
  store double 0x3FF921FB54442D18, double* @xo, align 8, !dbg !626, !tbaa !100
  store double 0.000000e+00, double* @yu, align 8, !dbg !627, !tbaa !100
  store double 0x3FF921FB54442D18, double* @yo, align 8, !dbg !628, !tbaa !100
  store double 0.000000e+00, double* @tu, align 8, !dbg !629, !tbaa !100
  store double 0x3E7AD7F29ABCAF48, double* @to, align 8, !dbg !630, !tbaa !100
  store i32 10, i32* @leafmaxcol, align 4, !dbg !631, !tbaa !136
  store i8 0, i8* %3, align 16, !dbg !632, !tbaa !595
  br label %if.end13, !dbg !633

sw.bb11:                                          ; preds = %if.end
  store i32 4096, i32* @nx, align 4, !dbg !634, !tbaa !136
  store i32 1024, i32* @ny, align 4, !dbg !635, !tbaa !136
  store i32 100, i32* @nt, align 4, !dbg !636, !tbaa !136
  store double 0.000000e+00, double* @xu, align 8, !dbg !637, !tbaa !100
  store double 0x3FF921FB54442D18, double* @xo, align 8, !dbg !638, !tbaa !100
  store double 0.000000e+00, double* @yu, align 8, !dbg !639, !tbaa !100
  store double 0x3FF921FB54442D18, double* @yo, align 8, !dbg !640, !tbaa !100
  store double 0.000000e+00, double* @tu, align 8, !dbg !641, !tbaa !100
  store double 0x3E7AD7F29ABCAF48, double* @to, align 8, !dbg !642, !tbaa !100
  store i32 1, i32* @leafmaxcol, align 4, !dbg !643, !tbaa !136
  store i8 0, i8* %3, align 16, !dbg !644, !tbaa !595
  br label %if.end13, !dbg !645

if.end13:                                         ; preds = %if.end, %sw.bb, %sw.bb9, %sw.bb11
  call void @startup_cilk(), !dbg !646
  call void @llvm.dbg.value(metadata i32 0, metadata !573, metadata !DIExpression()), !dbg !647
  %7 = load i32, i32* %round, align 4, !dbg !648, !tbaa !136
  call void @llvm.dbg.value(metadata i32 %7, metadata !568, metadata !DIExpression()), !dbg !580
  %cmp69 = icmp sgt i32 %7, 0, !dbg !649
  br i1 %cmp69, label %for.body.lr.ph, label %cleanup, !dbg !650

for.body.lr.ph:                                   ; preds = %if.end13
  %8 = bitcast %struct.timeval* %t1 to i8*
  %9 = bitcast %struct.timeval* %t2 to i8*
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1
  %tv_sec.i65 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0
  %tv_usec.i67 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1
  br label %for.body, !dbg !650

for.body:                                         ; preds = %for.body.lr.ph, %if.end19
  %r.070 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %if.end19 ]
  call void @llvm.dbg.value(metadata i32 %r.070, metadata !573, metadata !DIExpression()), !dbg !647
  %10 = load i8, i8* %3, align 16, !dbg !651, !tbaa !595
  %tobool16.not = icmp eq i8 %10, 0, !dbg !651
  br i1 %tobool16.not, label %if.end19, label %if.then17, !dbg !653

if.then17:                                        ; preds = %for.body
  call void @read_heatparams(i8* noundef nonnull %3), !dbg !654
  br label %if.end19, !dbg !654

if.end19:                                         ; preds = %if.then17, %for.body
  %11 = load double, double* @xo, align 8, !dbg !655, !tbaa !100
  %12 = load double, double* @xu, align 8, !dbg !656, !tbaa !100
  %sub = fsub double %11, %12, !dbg !657
  %13 = load i32, i32* @nx, align 4, !dbg !658, !tbaa !136
  %sub20 = add nsw i32 %13, -1, !dbg !659
  %conv21 = sitofp i32 %sub20 to double, !dbg !660
  %div = fdiv double %sub, %conv21, !dbg !661
  store double %div, double* @dx, align 8, !dbg !662, !tbaa !100
  %14 = load double, double* @yo, align 8, !dbg !663, !tbaa !100
  %15 = load double, double* @yu, align 8, !dbg !664, !tbaa !100
  %sub22 = fsub double %14, %15, !dbg !665
  %16 = load i32, i32* @ny, align 4, !dbg !666, !tbaa !136
  %sub23 = add nsw i32 %16, -1, !dbg !667
  %conv24 = sitofp i32 %sub23 to double, !dbg !668
  %div25 = fdiv double %sub22, %conv24, !dbg !669
  store double %div25, double* @dy, align 8, !dbg !670, !tbaa !100
  %17 = load double, double* @to, align 8, !dbg !671, !tbaa !100
  %18 = load double, double* @tu, align 8, !dbg !672, !tbaa !100
  %sub26 = fsub double %17, %18, !dbg !673
  %19 = load i32, i32* @nt, align 4, !dbg !674, !tbaa !136
  %conv27 = sitofp i32 %19 to double, !dbg !674
  %div28 = fdiv double %sub26, %conv27, !dbg !675
  store double %div28, double* @dt, align 8, !dbg !676, !tbaa !100
  %mul29 = fmul double %div, %div, !dbg !677
  %div30 = fdiv double %div28, %mul29, !dbg !678
  store double %div30, double* @dtdxsq, align 8, !dbg !679, !tbaa !100
  %mul31 = fmul double %div25, %div25, !dbg !680
  %div32 = fdiv double %div28, %mul31, !dbg !681
  store double %div32, double* @dtdysq, align 8, !dbg !682, !tbaa !100
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %8) #16, !dbg !683
  call void @llvm.dbg.declare(metadata %struct.timeval* %t1, metadata !575, metadata !DIExpression()), !dbg !684
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %9) #16, !dbg !683
  call void @llvm.dbg.declare(metadata %struct.timeval* %t2, metadata !578, metadata !DIExpression()), !dbg !685
  %call33 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #16, !dbg !686
  %call34 = call i32 @heat(), !dbg !687
  call void @llvm.dbg.value(metadata i32 0, metadata !565, metadata !DIExpression()), !dbg !580
  %call35 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #16, !dbg !688
  call void @llvm.dbg.value(metadata %struct.timeval* %t2, metadata !72, metadata !DIExpression()), !dbg !689
  %20 = load i64, i64* %tv_sec.i, align 8, !dbg !691, !tbaa !75
  %21 = load i64, i64* %tv_usec.i, align 8, !dbg !692, !tbaa !82
  call void @llvm.dbg.value(metadata %struct.timeval* %t1, metadata !72, metadata !DIExpression()), !dbg !693
  %22 = load i64, i64* %tv_sec.i65, align 8, !dbg !695, !tbaa !75
  %23 = load i64, i64* %tv_usec.i67, align 8, !dbg !696, !tbaa !82
  %reass.add = sub i64 %20, %22
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i = sub i64 %21, %23, !dbg !697
  %sub38 = add i64 %add.i, %reass.mul, !dbg !698
  %div39 = udiv i64 %sub38, 1000, !dbg !699
  call void @llvm.dbg.value(metadata i64 %div39, metadata !579, metadata !DIExpression()), !dbg !700
  %conv40 = uitofp i64 %div39 to double, !dbg !701
  %div41 = fdiv double %conv40, 1.000000e+03, !dbg !702
  %call42 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.30, i64 0, i64 0), double noundef %div41), !dbg !703
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !704, !tbaa !141
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.31, i64 0, i64 0), i64 20, i64 1, %struct._IO_FILE* %24) #17, !dbg !705
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !706, !tbaa !141
  %27 = load double, double* @dx, align 8, !dbg !707, !tbaa !100
  %call44 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %26, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.32, i64 0, i64 0), double noundef %27) #17, !dbg !708
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !709, !tbaa !141
  %29 = load double, double* @dy, align 8, !dbg !710, !tbaa !100
  %call45 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %28, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.33, i64 0, i64 0), double noundef %29) #17, !dbg !711
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !712, !tbaa !141
  %31 = load double, double* @dt, align 8, !dbg !713, !tbaa !100
  %call46 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %30, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.34, i64 0, i64 0), double noundef %31) #17, !dbg !714
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !715, !tbaa !141
  %33 = load double, double* @dt, align 8, !dbg !716, !tbaa !100
  %34 = load double, double* @dx, align 8, !dbg !717, !tbaa !100
  %35 = load double, double* @dy, align 8, !dbg !718, !tbaa !100
  %36 = insertelement <2 x double> poison, double %34, i64 0, !dbg !719
  %37 = insertelement <2 x double> %36, double %35, i64 1, !dbg !719
  %38 = fmul <2 x double> %37, %37, !dbg !719
  %39 = insertelement <2 x double> poison, double %33, i64 0, !dbg !720
  %40 = shufflevector <2 x double> %39, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !720
  %41 = fdiv <2 x double> %40, %38, !dbg !720
  %shift = shufflevector <2 x double> %41, <2 x double> poison, <2 x i32> <i32 1, i32 undef>, !dbg !721
  %42 = fadd <2 x double> %41, %shift, !dbg !721
  %add = extractelement <2 x double> %42, i64 0, !dbg !721
  %sub51 = fsub double 5.000000e-01, %add, !dbg !722
  %call52 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %32, i8* noundef getelementptr inbounds ([58 x i8], [58 x i8]* @.str.35, i64 0, i64 0), double noundef %sub51) #17, !dbg !723
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !724, !tbaa !141
  %44 = load i32, i32* @leafmaxcol, align 4, !dbg !725, !tbaa !136
  %call53 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %43, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.36, i64 0, i64 0), i32 noundef %44) #17, !dbg !726
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !727, !tbaa !141
  %46 = load i32, i32* @nx, align 4, !dbg !728, !tbaa !136
  %call54 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %45, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.37, i64 0, i64 0), i32 noundef %46) #17, !dbg !729
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !730, !tbaa !141
  %48 = load i32, i32* @ny, align 4, !dbg !731, !tbaa !136
  %call55 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %47, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.38, i64 0, i64 0), i32 noundef %48) #17, !dbg !732
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !733, !tbaa !141
  %50 = load i32, i32* @nt, align 4, !dbg !734, !tbaa !136
  %call56 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %49, i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.39, i64 0, i64 0), i32 noundef %50) #17, !dbg !735
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %9) #16, !dbg !736
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %8) #16, !dbg !736
  %inc = add nuw nsw i32 %r.070, 1, !dbg !737
  call void @llvm.dbg.value(metadata i32 %inc, metadata !573, metadata !DIExpression()), !dbg !647
  %51 = load i32, i32* %round, align 4, !dbg !648, !tbaa !136
  call void @llvm.dbg.value(metadata i32 %51, metadata !568, metadata !DIExpression()), !dbg !580
  %cmp = icmp slt i32 %inc, %51, !dbg !649
  br i1 %cmp, label %for.body, label %cleanup, !dbg !650, !llvm.loop !738

cleanup:                                          ; preds = %if.end19, %if.end13, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.end13 ], [ 0, %if.end19 ], !dbg !580
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %3) #16, !dbg !740
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #16, !dbg !740
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #16, !dbg !740
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #16, !dbg !740
  ret i32 %retval.0, !dbg !740
}

declare !dbg !741 dso_local void @get_options(i32 noundef, i8** noundef, i8** noundef, i32* noundef, ...) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare !dbg !747 dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #9

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #13

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #14

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #15

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #13

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { argmemonly mustprogress nounwind willreturn }
attributes #5 = { mustprogress nofree nounwind willreturn writeonly "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { noreturn nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nofree nosync nounwind readnone willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #14 = { nofree nounwind }
attributes #15 = { argmemonly nofree nounwind willreturn writeonly }
attributes #16 = { nounwind }
attributes #17 = { cold }
attributes #18 = { noreturn nounwind }
attributes #19 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!52, !53, !54, !55}
!llvm.ident = !{!56}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "ny", scope: !2, file: !3, line: 67, type: !21, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "heat.c", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "b72599dc1c74f97ddcb465dbfe1586de")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !{!10, !18, !22, !0, !24, !26, !28, !30, !32, !34, !36, !38, !40, !42, !44, !46, !48, !50}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "specifiers", scope: !2, file: !3, line: 317, type: !12, isLocal: false, isDefinition: true)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 960, elements: !16)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !{!17}
!17 = !DISubrange(count: 15)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "opt_types", scope: !2, file: !3, line: 318, type: !20, isLocal: false, isDefinition: true)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 480, elements: !16)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "nx", scope: !2, file: !3, line: 67, type: !21, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "nt", scope: !2, file: !3, line: 67, type: !21, isLocal: false, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "xu", scope: !2, file: !3, line: 68, type: !6, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "xo", scope: !2, file: !3, line: 68, type: !6, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "yu", scope: !2, file: !3, line: 68, type: !6, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "yo", scope: !2, file: !3, line: 68, type: !6, isLocal: false, isDefinition: true)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "tu", scope: !2, file: !3, line: 68, type: !6, isLocal: false, isDefinition: true)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "to", scope: !2, file: !3, line: 68, type: !6, isLocal: false, isDefinition: true)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "dx", scope: !2, file: !3, line: 69, type: !6, isLocal: false, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "dy", scope: !2, file: !3, line: 69, type: !6, isLocal: false, isDefinition: true)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "dt", scope: !2, file: !3, line: 69, type: !6, isLocal: false, isDefinition: true)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(name: "dtdxsq", scope: !2, file: !3, line: 71, type: !6, isLocal: false, isDefinition: true)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "dtdysq", scope: !2, file: !3, line: 71, type: !6, isLocal: false, isDefinition: true)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(name: "t", scope: !2, file: !3, line: 72, type: !6, isLocal: false, isDefinition: true)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(name: "leafmaxcol", scope: !2, file: !3, line: 74, type: !21, isLocal: false, isDefinition: true)
!52 = !{i32 7, !"Dwarf Version", i32 5}
!53 = !{i32 2, !"Debug Info Version", i32 3}
!54 = !{i32 1, !"wchar_size", i32 4}
!55 = !{i32 7, !"uwtable", i32 1}
!56 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)"}
!57 = distinct !DISubprogram(name: "todval", scope: !3, file: !3, line: 45, type: !58, scopeLine: 45, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !71)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !61}
!60 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !63, line: 30, size: 128, elements: !64)
!63 = !DIFile(filename: "/usr/include/bits/time.h", directory: "", checksumkind: CSK_MD5, checksum: "7275d681a2390320bc78ae3cf595b8d2")
!64 = !{!65, !69}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !62, file: !63, line: 32, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !67, line: 148, baseType: !68)
!67 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "77efac6352c67c8f56830ba4c854379f")
!68 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !62, file: !63, line: 33, baseType: !70, size: 64, offset: 64)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !67, line: 150, baseType: !68)
!71 = !{!72}
!72 = !DILocalVariable(name: "tp", arg: 1, scope: !57, file: !3, line: 45, type: !61)
!73 = !DILocation(line: 0, scope: !57)
!74 = !DILocation(line: 46, column: 16, scope: !57)
!75 = !{!76, !77, i64 0}
!76 = !{!"timeval", !77, i64 0, !77, i64 8}
!77 = !{!"long", !78, i64 0}
!78 = !{!"omnipotent char", !79, i64 0}
!79 = !{!"Simple C/C++ TBAA"}
!80 = !DILocation(line: 46, column: 30, scope: !57)
!81 = !DILocation(line: 46, column: 43, scope: !57)
!82 = !{!76, !77, i64 8}
!83 = !DILocation(line: 46, column: 37, scope: !57)
!84 = !DILocation(line: 46, column: 5, scope: !57)
!85 = distinct !DISubprogram(name: "startup_cilk", scope: !3, file: !3, line: 50, type: !86, scopeLine: 50, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !88)
!86 = !DISubroutineType(types: !87)
!87 = !{null}
!88 = !{!89, !90, !92, !93, !94, !95}
!89 = !DILocalVariable(name: "g", scope: !85, file: !3, line: 51, type: !6)
!90 = !DILocalVariable(name: "__init", scope: !91, type: !21, flags: DIFlagArtificial)
!91 = distinct !DILexicalBlock(scope: !85, file: !3, line: 52, column: 3)
!92 = !DILocalVariable(name: "__limit", scope: !91, type: !21, flags: DIFlagArtificial)
!93 = !DILocalVariable(name: "__begin", scope: !91, type: !21, flags: DIFlagArtificial)
!94 = !DILocalVariable(name: "__end", scope: !91, type: !21, flags: DIFlagArtificial)
!95 = !DILocalVariable(name: "i", scope: !96, file: !3, line: 52, type: !21)
!96 = distinct !DILexicalBlock(scope: !91, file: !3, line: 52, column: 3)
!97 = !DILocation(line: 0, scope: !85)
!98 = !DILocation(line: 51, column: 3, scope: !85)
!99 = !DILocation(line: 51, column: 10, scope: !85)
!100 = !{!101, !101, i64 0}
!101 = !{!"double", !78, i64 0}
!102 = !DILocation(line: 0, scope: !91)
!103 = !DILocation(line: 52, column: 24, scope: !91)
!104 = !DILocation(line: 52, column: 3, scope: !91)
!105 = !DILocation(line: 0, scope: !96)
!106 = !DILocation(line: 53, column: 14, scope: !107)
!107 = distinct !DILexicalBlock(scope: !96, file: !3, line: 52, column: 36)
!108 = !DILocation(line: 53, column: 10, scope: !107)
!109 = !DILocation(line: 53, column: 7, scope: !107)
!110 = !DILocation(line: 54, column: 3, scope: !107)
!111 = !DILocation(line: 52, column: 32, scope: !96)
!112 = !DILocation(line: 52, column: 24, scope: !96)
!113 = !DILocation(line: 52, column: 3, scope: !96)
!114 = distinct !{!114, !104, !115, !116}
!115 = !DILocation(line: 54, column: 3, scope: !91)
!116 = !{!"tapir.loop.spawn.strategy", i32 1}
!117 = !DILocation(line: 55, column: 1, scope: !85)
!118 = distinct !DISubprogram(name: "allcgrid", scope: !3, file: !3, line: 79, type: !119, scopeLine: 79, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !121)
!119 = !DISubroutineType(types: !120)
!120 = !{null, !7, !7, !21, !21}
!121 = !{!122, !123, !124, !125, !126, !127, !128}
!122 = !DILocalVariable(name: "neww", arg: 1, scope: !118, file: !3, line: 79, type: !7)
!123 = !DILocalVariable(name: "old", arg: 2, scope: !118, file: !3, line: 79, type: !7)
!124 = !DILocalVariable(name: "lb", arg: 3, scope: !118, file: !3, line: 79, type: !21)
!125 = !DILocalVariable(name: "ub", arg: 4, scope: !118, file: !3, line: 79, type: !21)
!126 = !DILocalVariable(name: "j", scope: !118, file: !3, line: 81, type: !21)
!127 = !DILocalVariable(name: "rne", scope: !118, file: !3, line: 82, type: !7)
!128 = !DILocalVariable(name: "rol", scope: !118, file: !3, line: 82, type: !7)
!129 = !DILocation(line: 0, scope: !118)
!130 = !DILocation(line: 84, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !118, file: !3, line: 84, column: 3)
!132 = !DILocation(line: 84, column: 41, scope: !133)
!133 = distinct !DILexicalBlock(scope: !131, file: !3, line: 84, column: 3)
!134 = !DILocation(line: 84, column: 3, scope: !131)
!135 = !DILocation(line: 84, column: 34, scope: !131)
!136 = !{!137, !137, i64 0}
!137 = !{!"int", !78, i64 0}
!138 = !DILocation(line: 85, column: 23, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !3, line: 84, column: 66)
!140 = !DILocation(line: 85, column: 10, scope: !139)
!141 = !{!142, !142, i64 0}
!142 = !{!"any pointer", !78, i64 0}
!143 = !DILocation(line: 86, column: 23, scope: !139)
!144 = !DILocation(line: 86, column: 10, scope: !139)
!145 = !DILocation(line: 84, column: 48, scope: !133)
!146 = !DILocation(line: 84, column: 55, scope: !133)
!147 = !DILocation(line: 84, column: 62, scope: !133)
!148 = distinct !{!148, !134, !149, !150}
!149 = !DILocation(line: 87, column: 3, scope: !131)
!150 = !{!"llvm.loop.mustprogress"}
!151 = !DILocation(line: 88, column: 1, scope: !118)
!152 = distinct !DISubprogram(name: "initgrid", scope: !3, file: !3, line: 92, type: !153, scopeLine: 92, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !155)
!153 = !DISubroutineType(types: !154)
!154 = !{null, !7, !21, !21}
!155 = !{!156, !157, !158, !159, !160, !161, !162}
!156 = !DILocalVariable(name: "old", arg: 1, scope: !152, file: !3, line: 92, type: !7)
!157 = !DILocalVariable(name: "lb", arg: 2, scope: !152, file: !3, line: 92, type: !21)
!158 = !DILocalVariable(name: "ub", arg: 3, scope: !152, file: !3, line: 92, type: !21)
!159 = !DILocalVariable(name: "a", scope: !152, file: !3, line: 94, type: !21)
!160 = !DILocalVariable(name: "b", scope: !152, file: !3, line: 94, type: !21)
!161 = !DILocalVariable(name: "llb", scope: !152, file: !3, line: 94, type: !21)
!162 = !DILocalVariable(name: "lub", scope: !152, file: !3, line: 94, type: !21)
!163 = !DILocation(line: 0, scope: !152)
!164 = !DILocation(line: 96, column: 13, scope: !152)
!165 = !DILocation(line: 96, column: 9, scope: !152)
!166 = !DILocation(line: 97, column: 16, scope: !152)
!167 = !DILocation(line: 97, column: 13, scope: !152)
!168 = !DILocation(line: 97, column: 9, scope: !152)
!169 = !DILocation(line: 99, column: 22, scope: !170)
!170 = distinct !DILexicalBlock(scope: !171, file: !3, line: 99, column: 3)
!171 = distinct !DILexicalBlock(scope: !152, file: !3, line: 99, column: 3)
!172 = !DILocation(line: 99, column: 3, scope: !171)
!173 = !DILocation(line: 100, column: 5, scope: !170)
!174 = !DILocation(line: 100, column: 15, scope: !170)
!175 = !DILocation(line: 99, column: 30, scope: !170)
!176 = distinct !{!176, !177}
!177 = !{!"llvm.loop.unroll.disable"}
!178 = distinct !{!178, !172, !179, !150}
!179 = !DILocation(line: 100, column: 17, scope: !171)
!180 = !DILocation(line: 102, column: 17, scope: !181)
!181 = distinct !DILexicalBlock(scope: !152, file: !3, line: 102, column: 3)
!182 = !DILocation(line: 102, column: 19, scope: !181)
!183 = !DILocation(line: 102, column: 3, scope: !181)
!184 = !DILocation(line: 103, column: 17, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !3, line: 102, column: 3)
!186 = !DILocation(line: 103, column: 5, scope: !185)
!187 = !DILocation(line: 103, column: 15, scope: !185)
!188 = !DILocation(line: 102, column: 33, scope: !185)
!189 = !DILocation(line: 102, column: 25, scope: !185)
!190 = distinct !{!190, !183, !191, !150}
!191 = !DILocation(line: 103, column: 17, scope: !181)
!192 = !DILocation(line: 105, column: 7, scope: !152)
!193 = !DILocation(line: 106, column: 22, scope: !194)
!194 = distinct !DILexicalBlock(scope: !195, file: !3, line: 106, column: 5)
!195 = distinct !DILexicalBlock(scope: !196, file: !3, line: 106, column: 5)
!196 = distinct !DILexicalBlock(scope: !197, file: !3, line: 105, column: 16)
!197 = distinct !DILexicalBlock(scope: !152, file: !3, line: 105, column: 7)
!198 = !DILocation(line: 106, column: 5, scope: !195)
!199 = !DILocation(line: 107, column: 17, scope: !194)
!200 = !DILocation(line: 109, column: 13, scope: !201)
!201 = distinct !DILexicalBlock(scope: !152, file: !3, line: 109, column: 7)
!202 = !DILocation(line: 109, column: 10, scope: !201)
!203 = !DILocation(line: 109, column: 7, scope: !152)
!204 = !DILocation(line: 110, column: 14, scope: !205)
!205 = distinct !DILexicalBlock(scope: !206, file: !3, line: 110, column: 5)
!206 = distinct !DILexicalBlock(scope: !201, file: !3, line: 109, column: 17)
!207 = !DILocation(line: 110, column: 5, scope: !205)
!208 = !DILocation(line: 111, column: 19, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !3, line: 110, column: 5)
!210 = !DILocation(line: 111, column: 7, scope: !209)
!211 = !DILocation(line: 111, column: 17, scope: !209)
!212 = !DILocation(line: 110, column: 32, scope: !209)
!213 = !DILocation(line: 110, column: 27, scope: !209)
!214 = !DILocation(line: 110, column: 25, scope: !209)
!215 = distinct !{!215, !207, !216, !150}
!216 = !DILocation(line: 111, column: 19, scope: !205)
!217 = !DILocation(line: 113, column: 3, scope: !218)
!218 = distinct !DILexicalBlock(scope: !152, file: !3, line: 113, column: 3)
!219 = !DILocation(line: 113, column: 17, scope: !220)
!220 = distinct !DILexicalBlock(scope: !218, file: !3, line: 113, column: 3)
!221 = !DILocation(line: 114, column: 19, scope: !222)
!222 = distinct !DILexicalBlock(scope: !223, file: !3, line: 114, column: 5)
!223 = distinct !DILexicalBlock(scope: !224, file: !3, line: 114, column: 5)
!224 = distinct !DILexicalBlock(scope: !220, file: !3, line: 113, column: 29)
!225 = !DILocation(line: 114, column: 17, scope: !222)
!226 = !DILocation(line: 114, column: 5, scope: !223)
!227 = !DILocation(line: 115, column: 19, scope: !228)
!228 = distinct !DILexicalBlock(scope: !222, file: !3, line: 114, column: 30)
!229 = !DILocation(line: 115, column: 7, scope: !228)
!230 = !DILocation(line: 115, column: 17, scope: !228)
!231 = !DILocation(line: 114, column: 26, scope: !222)
!232 = !DILocation(line: 114, column: 21, scope: !222)
!233 = distinct !{!233, !226, !234, !150}
!234 = !DILocation(line: 116, column: 5, scope: !223)
!235 = !DILocation(line: 113, column: 25, scope: !220)
!236 = distinct !{!236, !217, !237, !150}
!237 = !DILocation(line: 117, column: 3, scope: !218)
!238 = !DILocation(line: 118, column: 1, scope: !152)
!239 = distinct !DISubprogram(name: "compstripe", scope: !3, file: !3, line: 123, type: !119, scopeLine: 123, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !240)
!240 = !{!241, !242, !243, !244, !245, !246, !247, !248}
!241 = !DILocalVariable(name: "neww", arg: 1, scope: !239, file: !3, line: 123, type: !7)
!242 = !DILocalVariable(name: "old", arg: 2, scope: !239, file: !3, line: 123, type: !7)
!243 = !DILocalVariable(name: "lb", arg: 3, scope: !239, file: !3, line: 123, type: !21)
!244 = !DILocalVariable(name: "ub", arg: 4, scope: !239, file: !3, line: 123, type: !21)
!245 = !DILocalVariable(name: "a", scope: !239, file: !3, line: 125, type: !21)
!246 = !DILocalVariable(name: "b", scope: !239, file: !3, line: 125, type: !21)
!247 = !DILocalVariable(name: "llb", scope: !239, file: !3, line: 125, type: !21)
!248 = !DILocalVariable(name: "lub", scope: !239, file: !3, line: 125, type: !21)
!249 = !DILocation(line: 0, scope: !239)
!250 = !DILocation(line: 127, column: 13, scope: !239)
!251 = !DILocation(line: 127, column: 9, scope: !239)
!252 = !DILocation(line: 128, column: 16, scope: !239)
!253 = !DILocation(line: 128, column: 13, scope: !239)
!254 = !DILocation(line: 128, column: 9, scope: !239)
!255 = !DILocation(line: 130, column: 17, scope: !256)
!256 = distinct !DILexicalBlock(scope: !257, file: !3, line: 130, column: 3)
!257 = distinct !DILexicalBlock(scope: !239, file: !3, line: 130, column: 3)
!258 = !DILocation(line: 130, column: 3, scope: !257)
!259 = !DILocation(line: 131, column: 5, scope: !260)
!260 = distinct !DILexicalBlock(scope: !261, file: !3, line: 131, column: 5)
!261 = distinct !DILexicalBlock(scope: !256, file: !3, line: 130, column: 29)
!262 = !DILocation(line: 130, column: 25, scope: !256)
!263 = !{!264}
!264 = distinct !{!264, !265}
!265 = distinct !{!265, !"LVerDomain"}
!266 = !{!267}
!267 = distinct !{!267, !265}
!268 = !DILocation(line: 132, column: 32, scope: !269)
!269 = distinct !DILexicalBlock(scope: !270, file: !3, line: 131, column: 30)
!270 = distinct !DILexicalBlock(scope: !260, file: !3, line: 131, column: 5)
!271 = !{!272}
!272 = distinct !{!272, !265}
!273 = !DILocation(line: 132, column: 50, scope: !269)
!274 = !{!275}
!275 = distinct !{!275, !265}
!276 = !DILocation(line: 132, column: 44, scope: !269)
!277 = !DILocation(line: 132, column: 62, scope: !269)
!278 = !{!279}
!279 = distinct !{!279, !265}
!280 = !DILocation(line: 132, column: 60, scope: !269)
!281 = !DILocation(line: 133, column: 29, scope: !269)
!282 = !DILocation(line: 133, column: 21, scope: !269)
!283 = !{!284}
!284 = distinct !{!284, !265}
!285 = !DILocation(line: 133, column: 33, scope: !269)
!286 = !DILocation(line: 133, column: 51, scope: !269)
!287 = !{!288}
!288 = distinct !{!288, !265}
!289 = !DILocation(line: 133, column: 49, scope: !269)
!290 = !DILocation(line: 134, column: 9, scope: !269)
!291 = !DILocation(line: 132, column: 7, scope: !269)
!292 = !DILocation(line: 132, column: 18, scope: !269)
!293 = !{!294}
!294 = distinct !{!294, !265}
!295 = !{!264, !272, !275, !279, !267, !284, !288}
!296 = distinct !{!296, !259, !297, !150, !298}
!297 = !DILocation(line: 135, column: 5, scope: !260)
!298 = !{!"llvm.loop.isvectorized", i32 1}
!299 = !DILocation(line: 132, column: 22, scope: !269)
!300 = !DILocation(line: 133, column: 11, scope: !269)
!301 = !DILocation(line: 133, column: 59, scope: !269)
!302 = !DILocation(line: 133, column: 18, scope: !269)
!303 = !DILocation(line: 133, column: 9, scope: !269)
!304 = !DILocation(line: 131, column: 17, scope: !270)
!305 = distinct !{!305, !259, !297, !150, !298}
!306 = distinct !{!306, !258, !307, !150}
!307 = !DILocation(line: 136, column: 3, scope: !257)
!308 = !DILocation(line: 138, column: 19, scope: !309)
!309 = distinct !DILexicalBlock(scope: !239, file: !3, line: 138, column: 3)
!310 = !DILocation(line: 138, column: 3, scope: !309)
!311 = !DILocation(line: 138, column: 25, scope: !312)
!312 = distinct !DILexicalBlock(scope: !309, file: !3, line: 138, column: 3)
!313 = !DILocation(line: 141, column: 3, scope: !314)
!314 = distinct !DILexicalBlock(scope: !239, file: !3, line: 141, column: 3)
!315 = !DILocation(line: 142, column: 5, scope: !316)
!316 = distinct !DILexicalBlock(scope: !314, file: !3, line: 141, column: 3)
!317 = !DILocation(line: 142, column: 16, scope: !316)
!318 = !DILocation(line: 141, column: 30, scope: !316)
!319 = distinct !{!319, !177}
!320 = !DILocation(line: 139, column: 18, scope: !312)
!321 = !DILocation(line: 139, column: 5, scope: !312)
!322 = !DILocation(line: 139, column: 16, scope: !312)
!323 = !DILocation(line: 138, column: 33, scope: !312)
!324 = distinct !{!324, !310, !325, !150}
!325 = !DILocation(line: 139, column: 18, scope: !309)
!326 = !DILocation(line: 141, column: 22, scope: !316)
!327 = distinct !{!327, !313, !328, !150}
!328 = !DILocation(line: 142, column: 18, scope: !314)
!329 = !DILocation(line: 144, column: 7, scope: !239)
!330 = !DILocation(line: 145, column: 22, scope: !331)
!331 = distinct !DILexicalBlock(scope: !332, file: !3, line: 145, column: 5)
!332 = distinct !DILexicalBlock(scope: !333, file: !3, line: 145, column: 5)
!333 = distinct !DILexicalBlock(scope: !334, file: !3, line: 144, column: 16)
!334 = distinct !DILexicalBlock(scope: !239, file: !3, line: 144, column: 7)
!335 = !DILocation(line: 145, column: 5, scope: !332)
!336 = !DILocation(line: 146, column: 18, scope: !331)
!337 = !DILocation(line: 148, column: 13, scope: !338)
!338 = distinct !DILexicalBlock(scope: !239, file: !3, line: 148, column: 7)
!339 = !DILocation(line: 148, column: 10, scope: !338)
!340 = !DILocation(line: 148, column: 7, scope: !239)
!341 = !DILocation(line: 149, column: 14, scope: !342)
!342 = distinct !DILexicalBlock(scope: !343, file: !3, line: 149, column: 5)
!343 = distinct !DILexicalBlock(scope: !338, file: !3, line: 148, column: 17)
!344 = !DILocation(line: 149, column: 5, scope: !342)
!345 = !DILocation(line: 150, column: 20, scope: !346)
!346 = distinct !DILexicalBlock(scope: !342, file: !3, line: 149, column: 5)
!347 = !DILocation(line: 150, column: 7, scope: !346)
!348 = !DILocation(line: 150, column: 18, scope: !346)
!349 = !DILocation(line: 149, column: 32, scope: !346)
!350 = !DILocation(line: 149, column: 27, scope: !346)
!351 = !DILocation(line: 149, column: 25, scope: !346)
!352 = distinct !{!352, !344, !353, !150}
!353 = !DILocation(line: 150, column: 20, scope: !342)
!354 = !DILocation(line: 152, column: 1, scope: !239)
!355 = distinct !DISubprogram(name: "divide", scope: !3, file: !3, line: 161, type: !356, scopeLine: 162, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !358)
!356 = !DISubroutineType(types: !357)
!357 = !{!21, !21, !21, !7, !7, !21, !21}
!358 = !{!359, !360, !361, !362, !363, !364, !365, !368, !369}
!359 = !DILocalVariable(name: "lb", arg: 1, scope: !355, file: !3, line: 161, type: !21)
!360 = !DILocalVariable(name: "ub", arg: 2, scope: !355, file: !3, line: 161, type: !21)
!361 = !DILocalVariable(name: "neww", arg: 3, scope: !355, file: !3, line: 161, type: !7)
!362 = !DILocalVariable(name: "old", arg: 4, scope: !355, file: !3, line: 162, type: !7)
!363 = !DILocalVariable(name: "mode", arg: 5, scope: !355, file: !3, line: 162, type: !21)
!364 = !DILocalVariable(name: "timestep", arg: 6, scope: !355, file: !3, line: 162, type: !21)
!365 = !DILocalVariable(name: "_tmp", scope: !366, file: !3, line: 165, type: !21)
!366 = distinct !DILexicalBlock(scope: !367, file: !3, line: 164, column: 29)
!367 = distinct !DILexicalBlock(scope: !355, file: !3, line: 164, column: 7)
!368 = !DILocalVariable(name: "l", scope: !366, file: !3, line: 166, type: !21)
!369 = !DILocalVariable(name: "r", scope: !366, file: !3, line: 166, type: !21)
!370 = !DILocation(line: 0, scope: !366)
!371 = !DILocation(line: 0, scope: !355)
!372 = !DILocation(line: 164, column: 10, scope: !367)
!373 = !DILocation(line: 164, column: 17, scope: !367)
!374 = !DILocation(line: 164, column: 15, scope: !367)
!375 = !DILocation(line: 164, column: 7, scope: !355)
!376 = !DILocation(line: 166, column: 5, scope: !366)
!377 = !DILocation(line: 166, column: 9, scope: !366)
!378 = !DILocation(line: 167, column: 35, scope: !366)
!379 = !DILocation(line: 167, column: 41, scope: !366)
!380 = !DILocation(line: 167, column: 20, scope: !366)
!381 = !DILocation(line: 167, column: 7, scope: !366)
!382 = !DILocation(line: 168, column: 9, scope: !366)
!383 = !DILocation(line: 169, column: 5, scope: !366)
!384 = !DILocation(line: 171, column: 12, scope: !366)
!385 = !DILocation(line: 171, column: 14, scope: !366)
!386 = !DILocation(line: 174, column: 3, scope: !367)
!387 = !DILocation(line: 175, column: 5, scope: !388)
!388 = distinct !DILexicalBlock(scope: !367, file: !3, line: 174, column: 10)
!389 = !DILocation(line: 177, column: 22, scope: !390)
!390 = distinct !DILexicalBlock(scope: !391, file: !3, line: 177, column: 13)
!391 = distinct !DILexicalBlock(scope: !388, file: !3, line: 175, column: 19)
!392 = !DILocation(line: 177, column: 13, scope: !391)
!393 = !DILocation(line: 178, column: 11, scope: !390)
!394 = !DILocation(line: 180, column: 11, scope: !390)
!395 = !DILocation(line: 0, scope: !118, inlinedAt: !396)
!396 = distinct !DILocation(line: 184, column: 9, scope: !391)
!397 = !DILocation(line: 84, column: 21, scope: !131, inlinedAt: !396)
!398 = !DILocation(line: 84, column: 41, scope: !133, inlinedAt: !396)
!399 = !DILocation(line: 84, column: 3, scope: !131, inlinedAt: !396)
!400 = !DILocation(line: 84, column: 34, scope: !131, inlinedAt: !396)
!401 = !DILocation(line: 85, column: 23, scope: !139, inlinedAt: !396)
!402 = !DILocation(line: 85, column: 10, scope: !139, inlinedAt: !396)
!403 = !DILocation(line: 86, column: 23, scope: !139, inlinedAt: !396)
!404 = !DILocation(line: 86, column: 10, scope: !139, inlinedAt: !396)
!405 = !DILocation(line: 84, column: 48, scope: !133, inlinedAt: !396)
!406 = !DILocation(line: 84, column: 55, scope: !133, inlinedAt: !396)
!407 = !DILocation(line: 84, column: 62, scope: !133, inlinedAt: !396)
!408 = distinct !{!408, !399, !409, !150}
!409 = !DILocation(line: 87, column: 3, scope: !131, inlinedAt: !396)
!410 = !DILocation(line: 188, column: 9, scope: !391)
!411 = !DILocation(line: 189, column: 9, scope: !391)
!412 = !DILocation(line: 0, scope: !367)
!413 = !DILocation(line: 194, column: 1, scope: !355)
!414 = distinct !DISubprogram(name: "heat", scope: !3, file: !3, line: 196, type: !415, scopeLine: 196, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !417)
!415 = !DISubroutineType(types: !416)
!416 = !{!21}
!417 = !{!418, !419, !420, !421}
!418 = !DILocalVariable(name: "old", scope: !414, file: !3, line: 198, type: !7)
!419 = !DILocalVariable(name: "neww", scope: !414, file: !3, line: 198, type: !7)
!420 = !DILocalVariable(name: "c", scope: !414, file: !3, line: 199, type: !21)
!421 = !DILocalVariable(name: "l", scope: !414, file: !3, line: 199, type: !21)
!422 = !DILocation(line: 210, column: 28, scope: !414)
!423 = !DILocation(line: 210, column: 31, scope: !414)
!424 = !DILocation(line: 210, column: 21, scope: !414)
!425 = !DILocation(line: 210, column: 9, scope: !414)
!426 = !DILocation(line: 0, scope: !414)
!427 = !DILocation(line: 211, column: 22, scope: !414)
!428 = !DILocation(line: 211, column: 10, scope: !414)
!429 = !DILocation(line: 213, column: 7, scope: !414)
!430 = !DILocation(line: 226, column: 17, scope: !414)
!431 = !DILocation(line: 226, column: 7, scope: !414)
!432 = !DILocation(line: 228, column: 20, scope: !433)
!433 = distinct !DILexicalBlock(scope: !434, file: !3, line: 228, column: 3)
!434 = distinct !DILexicalBlock(scope: !414, file: !3, line: 228, column: 3)
!435 = !DILocation(line: 228, column: 17, scope: !433)
!436 = !DILocation(line: 228, column: 3, scope: !434)
!437 = !DILocation(line: 229, column: 9, scope: !438)
!438 = distinct !DILexicalBlock(scope: !433, file: !3, line: 228, column: 29)
!439 = !DILocation(line: 229, column: 14, scope: !438)
!440 = !DILocation(line: 229, column: 18, scope: !438)
!441 = !DILocation(line: 229, column: 12, scope: !438)
!442 = !DILocation(line: 229, column: 7, scope: !438)
!443 = !DILocation(line: 230, column: 19, scope: !438)
!444 = !DILocation(line: 230, column: 9, scope: !438)
!445 = !DILocation(line: 228, column: 25, scope: !433)
!446 = distinct !{!446, !436, !447, !150}
!447 = !DILocation(line: 231, column: 3, scope: !434)
!448 = !DILocation(line: 267, column: 3, scope: !414)
!449 = distinct !DISubprogram(name: "usage", scope: !3, file: !3, line: 270, type: !415, scopeLine: 270, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !450)
!450 = !{}
!451 = !DILocation(line: 272, column: 11, scope: !449)
!452 = !DILocation(line: 272, column: 3, scope: !449)
!453 = !DILocation(line: 273, column: 11, scope: !449)
!454 = !DILocation(line: 273, column: 3, scope: !449)
!455 = !DILocation(line: 275, column: 11, scope: !449)
!456 = !DILocation(line: 275, column: 3, scope: !449)
!457 = !DILocation(line: 277, column: 11, scope: !449)
!458 = !DILocation(line: 277, column: 3, scope: !449)
!459 = !DILocation(line: 278, column: 11, scope: !449)
!460 = !DILocation(line: 278, column: 3, scope: !449)
!461 = !DILocation(line: 279, column: 11, scope: !449)
!462 = !DILocation(line: 279, column: 3, scope: !449)
!463 = !DILocation(line: 281, column: 11, scope: !449)
!464 = !DILocation(line: 281, column: 3, scope: !449)
!465 = !DILocation(line: 283, column: 11, scope: !449)
!466 = !DILocation(line: 283, column: 3, scope: !449)
!467 = !DILocation(line: 285, column: 11, scope: !449)
!468 = !DILocation(line: 285, column: 3, scope: !449)
!469 = !DILocation(line: 287, column: 11, scope: !449)
!470 = !DILocation(line: 287, column: 3, scope: !449)
!471 = !DILocation(line: 288, column: 11, scope: !449)
!472 = !DILocation(line: 288, column: 3, scope: !449)
!473 = !DILocation(line: 297, column: 3, scope: !449)
!474 = distinct !DISubprogram(name: "read_heatparams", scope: !3, file: !3, line: 300, type: !475, scopeLine: 300, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !478)
!475 = !DISubroutineType(types: !476)
!476 = !{null, !477}
!477 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!478 = !{!479, !480, !538}
!479 = !DILocalVariable(name: "filefn", arg: 1, scope: !474, file: !3, line: 300, type: !477)
!480 = !DILocalVariable(name: "f", scope: !474, file: !3, line: 302, type: !481)
!481 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !482, size: 64)
!482 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !483, line: 48, baseType: !484)
!483 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "ccadb277f847191065ca006254171e90")
!484 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !485, line: 246, size: 1728, elements: !486)
!485 = !DIFile(filename: "/usr/include/libio.h", directory: "", checksumkind: CSK_MD5, checksum: "93df651ae2428563d8c372201ea10863")
!486 = !{!487, !488, !489, !490, !491, !492, !493, !494, !495, !496, !497, !498, !499, !507, !508, !509, !510, !512, !514, !516, !520, !523, !525, !526, !527, !528, !529, !533, !534}
!487 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !484, file: !485, line: 247, baseType: !21, size: 32)
!488 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !484, file: !485, line: 252, baseType: !477, size: 64, offset: 64)
!489 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !484, file: !485, line: 253, baseType: !477, size: 64, offset: 128)
!490 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !484, file: !485, line: 254, baseType: !477, size: 64, offset: 192)
!491 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !484, file: !485, line: 255, baseType: !477, size: 64, offset: 256)
!492 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !484, file: !485, line: 256, baseType: !477, size: 64, offset: 320)
!493 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !484, file: !485, line: 257, baseType: !477, size: 64, offset: 384)
!494 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !484, file: !485, line: 258, baseType: !477, size: 64, offset: 448)
!495 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !484, file: !485, line: 259, baseType: !477, size: 64, offset: 512)
!496 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !484, file: !485, line: 261, baseType: !477, size: 64, offset: 576)
!497 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !484, file: !485, line: 262, baseType: !477, size: 64, offset: 640)
!498 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !484, file: !485, line: 263, baseType: !477, size: 64, offset: 704)
!499 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !484, file: !485, line: 265, baseType: !500, size: 64, offset: 768)
!500 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !501, size: 64)
!501 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !485, line: 161, size: 192, elements: !502)
!502 = !{!503, !504, !506}
!503 = !DIDerivedType(tag: DW_TAG_member, name: "_next", scope: !501, file: !485, line: 162, baseType: !500, size: 64)
!504 = !DIDerivedType(tag: DW_TAG_member, name: "_sbuf", scope: !501, file: !485, line: 163, baseType: !505, size: 64, offset: 64)
!505 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !484, size: 64)
!506 = !DIDerivedType(tag: DW_TAG_member, name: "_pos", scope: !501, file: !485, line: 167, baseType: !21, size: 32, offset: 128)
!507 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !484, file: !485, line: 267, baseType: !505, size: 64, offset: 832)
!508 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !484, file: !485, line: 269, baseType: !21, size: 32, offset: 896)
!509 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !484, file: !485, line: 273, baseType: !21, size: 32, offset: 928)
!510 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !484, file: !485, line: 275, baseType: !511, size: 64, offset: 960)
!511 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !67, line: 140, baseType: !68)
!512 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !484, file: !485, line: 279, baseType: !513, size: 16, offset: 1024)
!513 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!514 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !484, file: !485, line: 280, baseType: !515, size: 8, offset: 1040)
!515 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!516 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !484, file: !485, line: 281, baseType: !517, size: 8, offset: 1048)
!517 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 8, elements: !518)
!518 = !{!519}
!519 = !DISubrange(count: 1)
!520 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !484, file: !485, line: 285, baseType: !521, size: 64, offset: 1088)
!521 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !522, size: 64)
!522 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !485, line: 155, baseType: null)
!523 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !484, file: !485, line: 294, baseType: !524, size: 64, offset: 1152)
!524 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !67, line: 141, baseType: !68)
!525 = !DIDerivedType(tag: DW_TAG_member, name: "__pad1", scope: !484, file: !485, line: 303, baseType: !8, size: 64, offset: 1216)
!526 = !DIDerivedType(tag: DW_TAG_member, name: "__pad2", scope: !484, file: !485, line: 304, baseType: !8, size: 64, offset: 1280)
!527 = !DIDerivedType(tag: DW_TAG_member, name: "__pad3", scope: !484, file: !485, line: 305, baseType: !8, size: 64, offset: 1344)
!528 = !DIDerivedType(tag: DW_TAG_member, name: "__pad4", scope: !484, file: !485, line: 306, baseType: !8, size: 64, offset: 1408)
!529 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !484, file: !485, line: 307, baseType: !530, size: 64, offset: 1472)
!530 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !531, line: 46, baseType: !532)
!531 = !DIFile(filename: "ece.cmu.edu/project/seth_group/ziqiliu/uli-opencilk-project/build/lib/clang/14.0.6/include/stddef.h", directory: "/afs", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!532 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!533 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !484, file: !485, line: 309, baseType: !21, size: 32, offset: 1536)
!534 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !484, file: !485, line: 311, baseType: !535, size: 160, offset: 1568)
!535 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 160, elements: !536)
!536 = !{!537}
!537 = !DISubrange(count: 20)
!538 = !DILocalVariable(name: "l", scope: !474, file: !3, line: 303, type: !21)
!539 = !DILocation(line: 0, scope: !474)
!540 = !DILocation(line: 305, column: 12, scope: !541)
!541 = distinct !DILexicalBlock(scope: !474, file: !3, line: 305, column: 7)
!542 = !DILocation(line: 305, column: 32, scope: !541)
!543 = !DILocation(line: 305, column: 7, scope: !474)
!544 = !DILocation(line: 306, column: 5, scope: !545)
!545 = distinct !DILexicalBlock(scope: !541, file: !3, line: 305, column: 41)
!546 = !DILocation(line: 307, column: 5, scope: !545)
!547 = !DILocation(line: 309, column: 7, scope: !474)
!548 = !DILocation(line: 311, column: 9, scope: !549)
!549 = distinct !DILexicalBlock(scope: !474, file: !3, line: 311, column: 7)
!550 = !DILocation(line: 311, column: 7, scope: !474)
!551 = !DILocation(line: 312, column: 43, scope: !549)
!552 = !DILocation(line: 312, column: 5, scope: !549)
!553 = !DILocation(line: 313, column: 3, scope: !474)
!554 = !DILocation(line: 315, column: 1, scope: !474)
!555 = !DISubprogram(name: "fclose", scope: !483, file: !483, line: 237, type: !556, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !450)
!556 = !DISubroutineType(types: !557)
!557 = !{!21, !481}
!558 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 320, type: !559, scopeLine: 320, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !562)
!559 = !DISubroutineType(types: !560)
!560 = !{!21, !21, !561}
!561 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !477, size: 64)
!562 = !{!563, !564, !565, !566, !567, !568, !569, !573, !575, !578, !579}
!563 = !DILocalVariable(name: "argc", arg: 1, scope: !558, file: !3, line: 320, type: !21)
!564 = !DILocalVariable(name: "argv", arg: 2, scope: !558, file: !3, line: 320, type: !561)
!565 = !DILocalVariable(name: "ret", scope: !558, file: !3, line: 322, type: !21)
!566 = !DILocalVariable(name: "benchmark", scope: !558, file: !3, line: 322, type: !21)
!567 = !DILocalVariable(name: "help", scope: !558, file: !3, line: 322, type: !21)
!568 = !DILocalVariable(name: "round", scope: !558, file: !3, line: 322, type: !21)
!569 = !DILocalVariable(name: "filename", scope: !558, file: !3, line: 323, type: !570)
!570 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 800, elements: !571)
!571 = !{!572}
!572 = !DISubrange(count: 100)
!573 = !DILocalVariable(name: "r", scope: !574, file: !3, line: 394, type: !21)
!574 = distinct !DILexicalBlock(scope: !558, file: !3, line: 394, column: 3)
!575 = !DILocalVariable(name: "t1", scope: !576, file: !3, line: 405, type: !62)
!576 = distinct !DILexicalBlock(scope: !577, file: !3, line: 394, column: 30)
!577 = distinct !DILexicalBlock(scope: !574, file: !3, line: 394, column: 3)
!578 = !DILocalVariable(name: "t2", scope: !576, file: !3, line: 405, type: !62)
!579 = !DILocalVariable(name: "runtime_ms", scope: !576, file: !3, line: 411, type: !60)
!580 = !DILocation(line: 0, scope: !558)
!581 = !DILocation(line: 322, column: 3, scope: !558)
!582 = !DILocation(line: 323, column: 3, scope: !558)
!583 = !DILocation(line: 323, column: 8, scope: !558)
!584 = !DILocation(line: 325, column: 6, scope: !558)
!585 = !DILocation(line: 326, column: 6, scope: !558)
!586 = !DILocation(line: 327, column: 6, scope: !558)
!587 = !DILocation(line: 328, column: 6, scope: !558)
!588 = !DILocation(line: 329, column: 6, scope: !558)
!589 = !DILocation(line: 330, column: 6, scope: !558)
!590 = !DILocation(line: 331, column: 6, scope: !558)
!591 = !DILocation(line: 332, column: 6, scope: !558)
!592 = !DILocation(line: 333, column: 6, scope: !558)
!593 = !DILocation(line: 334, column: 14, scope: !558)
!594 = !DILocation(line: 335, column: 14, scope: !558)
!595 = !{!78, !78, i64 0}
!596 = !DILocation(line: 336, column: 9, scope: !558)
!597 = !DILocation(line: 340, column: 11, scope: !558)
!598 = !DILocation(line: 340, column: 3, scope: !558)
!599 = !DILocation(line: 342, column: 3, scope: !558)
!600 = !DILocation(line: 346, column: 7, scope: !601)
!601 = distinct !DILexicalBlock(scope: !558, file: !3, line: 346, column: 7)
!602 = !DILocation(line: 346, column: 7, scope: !558)
!603 = !DILocation(line: 346, column: 20, scope: !601)
!604 = !DILocation(line: 346, column: 13, scope: !601)
!605 = !DILocation(line: 348, column: 7, scope: !606)
!606 = distinct !DILexicalBlock(scope: !558, file: !3, line: 348, column: 7)
!607 = !DILocation(line: 348, column: 7, scope: !558)
!608 = !DILocation(line: 351, column: 12, scope: !609)
!609 = distinct !DILexicalBlock(scope: !610, file: !3, line: 349, column: 24)
!610 = distinct !DILexicalBlock(scope: !606, file: !3, line: 348, column: 18)
!611 = !DILocation(line: 352, column: 12, scope: !609)
!612 = !DILocation(line: 353, column: 12, scope: !609)
!613 = !DILocation(line: 354, column: 12, scope: !609)
!614 = !DILocation(line: 355, column: 12, scope: !609)
!615 = !DILocation(line: 356, column: 12, scope: !609)
!616 = !DILocation(line: 357, column: 12, scope: !609)
!617 = !DILocation(line: 358, column: 12, scope: !609)
!618 = !DILocation(line: 359, column: 12, scope: !609)
!619 = !DILocation(line: 360, column: 20, scope: !609)
!620 = !DILocation(line: 361, column: 20, scope: !609)
!621 = !DILocation(line: 362, column: 9, scope: !609)
!622 = !DILocation(line: 364, column: 12, scope: !609)
!623 = !DILocation(line: 365, column: 12, scope: !609)
!624 = !DILocation(line: 366, column: 12, scope: !609)
!625 = !DILocation(line: 367, column: 12, scope: !609)
!626 = !DILocation(line: 368, column: 12, scope: !609)
!627 = !DILocation(line: 369, column: 12, scope: !609)
!628 = !DILocation(line: 370, column: 12, scope: !609)
!629 = !DILocation(line: 371, column: 12, scope: !609)
!630 = !DILocation(line: 372, column: 12, scope: !609)
!631 = !DILocation(line: 373, column: 20, scope: !609)
!632 = !DILocation(line: 374, column: 20, scope: !609)
!633 = !DILocation(line: 375, column: 9, scope: !609)
!634 = !DILocation(line: 377, column: 12, scope: !609)
!635 = !DILocation(line: 378, column: 12, scope: !609)
!636 = !DILocation(line: 379, column: 12, scope: !609)
!637 = !DILocation(line: 380, column: 12, scope: !609)
!638 = !DILocation(line: 381, column: 12, scope: !609)
!639 = !DILocation(line: 382, column: 12, scope: !609)
!640 = !DILocation(line: 383, column: 12, scope: !609)
!641 = !DILocation(line: 384, column: 12, scope: !609)
!642 = !DILocation(line: 385, column: 12, scope: !609)
!643 = !DILocation(line: 386, column: 20, scope: !609)
!644 = !DILocation(line: 387, column: 20, scope: !609)
!645 = !DILocation(line: 388, column: 9, scope: !609)
!646 = !DILocation(line: 393, column: 3, scope: !558)
!647 = !DILocation(line: 0, scope: !574)
!648 = !DILocation(line: 394, column: 18, scope: !577)
!649 = !DILocation(line: 394, column: 17, scope: !577)
!650 = !DILocation(line: 394, column: 3, scope: !574)
!651 = !DILocation(line: 396, column: 9, scope: !652)
!652 = distinct !DILexicalBlock(scope: !576, file: !3, line: 396, column: 9)
!653 = !DILocation(line: 396, column: 9, scope: !576)
!654 = !DILocation(line: 396, column: 22, scope: !652)
!655 = !DILocation(line: 398, column: 11, scope: !576)
!656 = !DILocation(line: 398, column: 16, scope: !576)
!657 = !DILocation(line: 398, column: 14, scope: !576)
!658 = !DILocation(line: 398, column: 23, scope: !576)
!659 = !DILocation(line: 398, column: 26, scope: !576)
!660 = !DILocation(line: 398, column: 22, scope: !576)
!661 = !DILocation(line: 398, column: 20, scope: !576)
!662 = !DILocation(line: 398, column: 8, scope: !576)
!663 = !DILocation(line: 399, column: 11, scope: !576)
!664 = !DILocation(line: 399, column: 16, scope: !576)
!665 = !DILocation(line: 399, column: 14, scope: !576)
!666 = !DILocation(line: 399, column: 23, scope: !576)
!667 = !DILocation(line: 399, column: 26, scope: !576)
!668 = !DILocation(line: 399, column: 22, scope: !576)
!669 = !DILocation(line: 399, column: 20, scope: !576)
!670 = !DILocation(line: 399, column: 8, scope: !576)
!671 = !DILocation(line: 400, column: 11, scope: !576)
!672 = !DILocation(line: 400, column: 16, scope: !576)
!673 = !DILocation(line: 400, column: 14, scope: !576)
!674 = !DILocation(line: 400, column: 22, scope: !576)
!675 = !DILocation(line: 400, column: 20, scope: !576)
!676 = !DILocation(line: 400, column: 8, scope: !576)
!677 = !DILocation(line: 402, column: 23, scope: !576)
!678 = !DILocation(line: 402, column: 17, scope: !576)
!679 = !DILocation(line: 402, column: 12, scope: !576)
!680 = !DILocation(line: 403, column: 23, scope: !576)
!681 = !DILocation(line: 403, column: 17, scope: !576)
!682 = !DILocation(line: 403, column: 12, scope: !576)
!683 = !DILocation(line: 405, column: 5, scope: !576)
!684 = !DILocation(line: 405, column: 20, scope: !576)
!685 = !DILocation(line: 405, column: 24, scope: !576)
!686 = !DILocation(line: 406, column: 5, scope: !576)
!687 = !DILocation(line: 408, column: 11, scope: !576)
!688 = !DILocation(line: 410, column: 5, scope: !576)
!689 = !DILocation(line: 0, scope: !57, inlinedAt: !690)
!690 = distinct !DILocation(line: 411, column: 38, scope: !576)
!691 = !DILocation(line: 46, column: 16, scope: !57, inlinedAt: !690)
!692 = !DILocation(line: 46, column: 43, scope: !57, inlinedAt: !690)
!693 = !DILocation(line: 0, scope: !57, inlinedAt: !694)
!694 = distinct !DILocation(line: 411, column: 50, scope: !576)
!695 = !DILocation(line: 46, column: 16, scope: !57, inlinedAt: !694)
!696 = !DILocation(line: 46, column: 43, scope: !57, inlinedAt: !694)
!697 = !DILocation(line: 46, column: 37, scope: !57, inlinedAt: !690)
!698 = !DILocation(line: 411, column: 49, scope: !576)
!699 = !DILocation(line: 411, column: 62, scope: !576)
!700 = !DILocation(line: 0, scope: !576)
!701 = !DILocation(line: 412, column: 31, scope: !576)
!702 = !DILocation(line: 412, column: 41, scope: !576)
!703 = !DILocation(line: 412, column: 5, scope: !576)
!704 = !DILocation(line: 414, column: 13, scope: !576)
!705 = !DILocation(line: 414, column: 5, scope: !576)
!706 = !DILocation(line: 415, column: 13, scope: !576)
!707 = !DILocation(line: 415, column: 37, scope: !576)
!708 = !DILocation(line: 415, column: 5, scope: !576)
!709 = !DILocation(line: 416, column: 13, scope: !576)
!710 = !DILocation(line: 416, column: 37, scope: !576)
!711 = !DILocation(line: 416, column: 5, scope: !576)
!712 = !DILocation(line: 417, column: 13, scope: !576)
!713 = !DILocation(line: 417, column: 37, scope: !576)
!714 = !DILocation(line: 417, column: 5, scope: !576)
!715 = !DILocation(line: 419, column: 13, scope: !576)
!716 = !DILocation(line: 420, column: 13, scope: !576)
!717 = !DILocation(line: 420, column: 19, scope: !576)
!718 = !DILocation(line: 420, column: 36, scope: !576)
!719 = !DILocation(line: 420, column: 22, scope: !576)
!720 = !DILocation(line: 420, column: 16, scope: !576)
!721 = !DILocation(line: 420, column: 28, scope: !576)
!722 = !DILocation(line: 420, column: 10, scope: !576)
!723 = !DILocation(line: 419, column: 5, scope: !576)
!724 = !DILocation(line: 421, column: 13, scope: !576)
!725 = !DILocation(line: 421, column: 52, scope: !576)
!726 = !DILocation(line: 421, column: 5, scope: !576)
!727 = !DILocation(line: 422, column: 13, scope: !576)
!728 = !DILocation(line: 422, column: 52, scope: !576)
!729 = !DILocation(line: 422, column: 5, scope: !576)
!730 = !DILocation(line: 423, column: 13, scope: !576)
!731 = !DILocation(line: 423, column: 52, scope: !576)
!732 = !DILocation(line: 423, column: 5, scope: !576)
!733 = !DILocation(line: 424, column: 13, scope: !576)
!734 = !DILocation(line: 424, column: 52, scope: !576)
!735 = !DILocation(line: 424, column: 5, scope: !576)
!736 = !DILocation(line: 426, column: 3, scope: !577)
!737 = !DILocation(line: 394, column: 26, scope: !577)
!738 = distinct !{!738, !650, !739, !150}
!739 = !DILocation(line: 426, column: 3, scope: !574)
!740 = !DILocation(line: 428, column: 1, scope: !558)
!741 = !DISubprogram(name: "get_options", scope: !742, file: !742, line: 20, type: !743, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !450)
!742 = !DIFile(filename: "./getoptions.h", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "bf060e74fdb298e4a85522e522cd3a24")
!743 = !DISubroutineType(types: !744)
!744 = !{null, !21, !561, !745, !746, null}
!745 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!746 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!747 = !DISubprogram(name: "gettimeofday", scope: !748, file: !748, line: 72, type: !749, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !450)
!748 = !DIFile(filename: "/usr/include/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b3cbcac52b1954fa045aa74bfcd1a38")
!749 = !DISubroutineType(types: !750)
!750 = !{!21, !751, !752}
!751 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !61)
!752 = !DIDerivedType(tag: DW_TAG_typedef, name: "__timezone_ptr_t", file: !748, line: 62, baseType: !753)
!753 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !754)
!754 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !755, size: 64)
!755 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !748, line: 56, size: 64, elements: !756)
!756 = !{!757, !758}
!757 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !755, file: !748, line: 58, baseType: !21, size: 32)
!758 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !755, file: !748, line: 59, baseType: !21, size: 32, offset: 32)
