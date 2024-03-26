; ModuleID = 'rectmul.c'
source_filename = "rectmul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [20 x i8] c"R[%d]: %lf != %lf.\0A\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"(R[%d]) %lf != %lf (B[%d]).\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"PBBS-time: %f\0A\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"check: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [24 x i8] c"\0ACilk Example: rectmul\0A\00", align 1
@.str.7 = private unnamed_addr constant [18 x i8] c"Options: x = %ld\0A\00", align 1
@.str.8 = private unnamed_addr constant [18 x i8] c"         y = %ld\0A\00", align 1
@.str.9 = private unnamed_addr constant [19 x i8] c"         z = %ld\0A\0A\00", align 1
@.str.10 = private unnamed_addr constant [71 x i8] c"Program to multiply two rectangualar matrizes A(n,m) * B(m,n), where \0A\00", align 1
@.str.11 = private unnamed_addr constant [92 x i8] c"(n < m) and (n mod 16 = 0) and (m mod n = 0). (Otherwise fill with 0s \0A to fit the shape.)\0A\00", align 1
@.str.12 = private unnamed_addr constant [46 x i8] c"Usage: rectmul [<cilk-options>] [<options>]\0A\0A\00", align 1
@.str.13 = private unnamed_addr constant [10 x i8] c"Options:\0A\00", align 1
@.str.14 = private unnamed_addr constant [24 x i8] c"  -c   : Check result.\0A\00", align 1
@.str.15 = private unnamed_addr constant [35 x i8] c"-benchmark short / medium / long.\0A\00", align 1
@.str.16 = private unnamed_addr constant [46 x i8] c"Default benchmark size: medium (512 * 512).\0A\0A\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"-x\00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"-y\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"-z\00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@.str.21 = private unnamed_addr constant [11 x i8] c"-benchmark\00", align 1
@.str.22 = private unnamed_addr constant [3 x i8] c"-h\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"-r\00", align 1
@specifiers = dso_local global [8 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), i8* null], align 16, !dbg !0
@opt_types = dso_local global [8 x i32] [i32 1, i32 1, i32 1, i32 4, i32 6, i32 4, i32 1, i32 0], align 16, !dbg !14
@str = private unnamed_addr constant [14 x i8] c"WRONG RESULT!\00", align 1
@str.24 = private unnamed_addr constant [22 x i8] c"Now check result ... \00", align 1
@switch.table.main.26 = private unnamed_addr constant [3 x i32] [i32 512, i32 2048, i32 4096], align 4

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i64 @todval(%struct.timeval* nocapture noundef readonly %tp) local_unnamed_addr #0 !dbg !29 {
entry:
  call void @llvm.dbg.value(metadata %struct.timeval* %tp, metadata !44, metadata !DIExpression()), !dbg !45
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 0, !dbg !46
  %0 = load i64, i64* %tv_sec, align 8, !dbg !46, !tbaa !47
  %mul1 = mul i64 %0, 1000000, !dbg !52
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 1, !dbg !53
  %1 = load i64, i64* %tv_usec, align 8, !dbg !53, !tbaa !54
  %add = add nsw i64 %mul1, %1, !dbg !55
  ret i64 %add, !dbg !56
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable writeonly
define dso_local void @startup_cilk() local_unnamed_addr #2 !dbg !57 {
entry:
  %g = alloca double, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !69
  %g.0.g.0.g.0..sroa_cast = bitcast double* %g to i8*, !dbg !70
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !70
  call void @llvm.dbg.value(metadata double 2.000000e+00, metadata !61, metadata !DIExpression()), !dbg !69
  store double 2.000000e+00, double* %g, align 8, !dbg !71, !tbaa !72
  call void @llvm.dbg.value(metadata i32 0, metadata !62, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.value(metadata i32 1000, metadata !64, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.value(metadata i32 0, metadata !65, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.value(metadata i32 1000, metadata !66, metadata !DIExpression()), !dbg !74
  br label %pfor.cond, !dbg !75

pfor.cond:                                        ; preds = %pfor.inc, %entry
  %__begin.0 = phi i32 [ 0, %entry ], [ %inc, %pfor.inc ], !dbg !74
  call void @llvm.dbg.value(metadata i32 %__begin.0, metadata !65, metadata !DIExpression()), !dbg !74
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc, !dbg !76

pfor.body.entry:                                  ; preds = %pfor.cond
  call void @llvm.dbg.value(metadata !DIArgList(i32 0, i32 %__begin.0), metadata !67, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !77
  %g.0.g.0.g.0. = load double, double* %g, align 8, !dbg !78, !tbaa !72
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !61, metadata !DIExpression()), !dbg !69
  %call = tail call double @sin(double noundef %g.0.g.0.g.0.) #20, !dbg !80
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !61, metadata !DIExpression()), !dbg !69
  %div3 = fdiv double %g.0.g.0.g.0., %call, !dbg !81
  call void @llvm.dbg.value(metadata double %div3, metadata !61, metadata !DIExpression()), !dbg !69
  store double %div3, double* %g, align 8, !dbg !81, !tbaa !72
  reattach within %syncreg, label %pfor.inc, !dbg !82

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %inc = add nuw nsw i32 %__begin.0, 1, !dbg !83
  call void @llvm.dbg.value(metadata i32 %inc, metadata !65, metadata !DIExpression()), !dbg !74
  %exitcond.not = icmp eq i32 %inc, 1000, !dbg !84
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !dbg !85, !llvm.loop !86

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %cleanup, !dbg !85

cleanup:                                          ; preds = %pfor.cond.cleanup
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !89
  ret void, !dbg !89
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
define dso_local i64 @mult_add_block([256 x double]* noundef readonly %A, [256 x double]* noundef readonly %B, [256 x double]* nocapture noundef %R) local_unnamed_addr #6 !dbg !90 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %A, metadata !95, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata [256 x double]* %B, metadata !96, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !97, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata i64 0, metadata !100, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata i32 0, metadata !99, metadata !DIExpression()), !dbg !114
  br label %for.body, !dbg !115

for.body:                                         ; preds = %entry, %for.end
  %indvars.iv435 = phi i64 [ 0, %entry ], [ %indvars.iv.next436, %for.end ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv435, metadata !99, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata i64 undef, metadata !100, metadata !DIExpression()), !dbg !114
  %arrayidx = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 %indvars.iv435, !dbg !116
  call void @llvm.dbg.value(metadata double* %arrayidx, metadata !101, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.value(metadata i32 0, metadata !98, metadata !DIExpression()), !dbg !114
  %arrayidx26 = getelementptr inbounds double, double* %arrayidx, i64 16
  %arrayidx38 = getelementptr inbounds double, double* %arrayidx, i64 32
  %arrayidx50 = getelementptr inbounds double, double* %arrayidx, i64 48
  %arrayidx62 = getelementptr inbounds double, double* %arrayidx, i64 64
  %arrayidx74 = getelementptr inbounds double, double* %arrayidx, i64 80
  %arrayidx86 = getelementptr inbounds double, double* %arrayidx, i64 96
  %arrayidx98 = getelementptr inbounds double, double* %arrayidx, i64 112
  %arrayidx110 = getelementptr inbounds double, double* %arrayidx, i64 128
  %arrayidx122 = getelementptr inbounds double, double* %arrayidx, i64 144
  %arrayidx134 = getelementptr inbounds double, double* %arrayidx, i64 160
  %arrayidx146 = getelementptr inbounds double, double* %arrayidx, i64 176
  %arrayidx158 = getelementptr inbounds double, double* %arrayidx, i64 192
  %arrayidx170 = getelementptr inbounds double, double* %arrayidx, i64 208
  %arrayidx182 = getelementptr inbounds double, double* %arrayidx, i64 224
  %arrayidx194 = getelementptr inbounds double, double* %arrayidx, i64 240
  call void @llvm.dbg.value(metadata i32 0, metadata !98, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata i64 undef, metadata !100, metadata !DIExpression()), !dbg !114
  %0 = bitcast double* %arrayidx to <2 x double>*
  %1 = bitcast double* %arrayidx26 to <2 x double>*
  %2 = bitcast double* %arrayidx38 to <2 x double>*
  %3 = bitcast double* %arrayidx50 to <2 x double>*
  %4 = bitcast double* %arrayidx62 to <2 x double>*
  %5 = bitcast double* %arrayidx74 to <2 x double>*
  %6 = bitcast double* %arrayidx86 to <2 x double>*
  %7 = bitcast double* %arrayidx98 to <2 x double>*
  %8 = bitcast double* %arrayidx110 to <2 x double>*
  %9 = bitcast double* %arrayidx122 to <2 x double>*
  %10 = bitcast double* %arrayidx134 to <2 x double>*
  %11 = bitcast double* %arrayidx146 to <2 x double>*
  %12 = bitcast double* %arrayidx158 to <2 x double>*
  %13 = bitcast double* %arrayidx170 to <2 x double>*
  %14 = bitcast double* %arrayidx182 to <2 x double>*
  %15 = bitcast double* %arrayidx194 to <2 x double>*
  br label %for.body3, !dbg !118

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body3 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !98, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata i64 undef, metadata !100, metadata !DIExpression()), !dbg !114
  %16 = shl nuw nsw i64 %indvars.iv, 4, !dbg !119
  %arrayidx5 = getelementptr inbounds [256 x double], [256 x double]* %A, i64 0, i64 %16, !dbg !120
  call void @llvm.dbg.value(metadata double* %arrayidx5, metadata !105, metadata !DIExpression()), !dbg !121
  %17 = add nuw nsw i64 %16, %indvars.iv435, !dbg !122
  %arrayidx8 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %17, !dbg !123
  call void @llvm.dbg.value(metadata double* %arrayidx8, metadata !109, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %18 = bitcast double* %arrayidx8 to <2 x double>*, !dbg !124
  %19 = load <2 x double>, <2 x double>* %18, align 8, !dbg !124, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx11 = getelementptr inbounds double, double* %arrayidx8, i64 16, !dbg !125
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %20 = bitcast double* %arrayidx11 to <2 x double>*, !dbg !125
  %21 = load <2 x double>, <2 x double>* %20, align 8, !dbg !125, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %22 = load double, double* %arrayidx5, align 8, !dbg !126, !tbaa !72
  %23 = load <2 x double>, <2 x double>* %0, align 8, !dbg !127, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %24 = insertelement <2 x double> poison, double %22, i64 0, !dbg !128
  %25 = shufflevector <2 x double> %24, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !128
  %26 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %25, <2 x double> %23, <2 x double> %19), !dbg !128
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx19 = getelementptr inbounds double, double* %arrayidx5, i64 16, !dbg !129
  %27 = load double, double* %arrayidx19, align 8, !dbg !129, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %28 = insertelement <2 x double> poison, double %27, i64 0, !dbg !130
  %29 = shufflevector <2 x double> %28, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !130
  %30 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %29, <2 x double> %23, <2 x double> %21), !dbg !130
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx25 = getelementptr inbounds double, double* %arrayidx5, i64 1, !dbg !131
  %31 = load double, double* %arrayidx25, align 8, !dbg !131, !tbaa !72
  %32 = load <2 x double>, <2 x double>* %1, align 8, !dbg !132, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %33 = insertelement <2 x double> poison, double %31, i64 0, !dbg !133
  %34 = shufflevector <2 x double> %33, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !133
  %35 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %34, <2 x double> %32, <2 x double> %26), !dbg !133
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx31 = getelementptr inbounds double, double* %arrayidx5, i64 17, !dbg !134
  %36 = load double, double* %arrayidx31, align 8, !dbg !134, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %37 = insertelement <2 x double> poison, double %36, i64 0, !dbg !135
  %38 = shufflevector <2 x double> %37, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !135
  %39 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %38, <2 x double> %32, <2 x double> %30), !dbg !135
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx37 = getelementptr inbounds double, double* %arrayidx5, i64 2, !dbg !136
  %40 = load double, double* %arrayidx37, align 8, !dbg !136, !tbaa !72
  %41 = load <2 x double>, <2 x double>* %2, align 8, !dbg !137, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %42 = insertelement <2 x double> poison, double %40, i64 0, !dbg !138
  %43 = shufflevector <2 x double> %42, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !138
  %44 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %43, <2 x double> %41, <2 x double> %35), !dbg !138
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx43 = getelementptr inbounds double, double* %arrayidx5, i64 18, !dbg !139
  %45 = load double, double* %arrayidx43, align 8, !dbg !139, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %46 = insertelement <2 x double> poison, double %45, i64 0, !dbg !140
  %47 = shufflevector <2 x double> %46, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !140
  %48 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %47, <2 x double> %41, <2 x double> %39), !dbg !140
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx49 = getelementptr inbounds double, double* %arrayidx5, i64 3, !dbg !141
  %49 = load double, double* %arrayidx49, align 8, !dbg !141, !tbaa !72
  %50 = load <2 x double>, <2 x double>* %3, align 8, !dbg !142, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %51 = insertelement <2 x double> poison, double %49, i64 0, !dbg !143
  %52 = shufflevector <2 x double> %51, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !143
  %53 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %52, <2 x double> %50, <2 x double> %44), !dbg !143
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx55 = getelementptr inbounds double, double* %arrayidx5, i64 19, !dbg !144
  %54 = load double, double* %arrayidx55, align 8, !dbg !144, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %55 = insertelement <2 x double> poison, double %54, i64 0, !dbg !145
  %56 = shufflevector <2 x double> %55, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !145
  %57 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %56, <2 x double> %50, <2 x double> %48), !dbg !145
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx61 = getelementptr inbounds double, double* %arrayidx5, i64 4, !dbg !146
  %58 = load double, double* %arrayidx61, align 8, !dbg !146, !tbaa !72
  %59 = load <2 x double>, <2 x double>* %4, align 8, !dbg !147, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %60 = insertelement <2 x double> poison, double %58, i64 0, !dbg !148
  %61 = shufflevector <2 x double> %60, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !148
  %62 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %61, <2 x double> %59, <2 x double> %53), !dbg !148
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx67 = getelementptr inbounds double, double* %arrayidx5, i64 20, !dbg !149
  %63 = load double, double* %arrayidx67, align 8, !dbg !149, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %64 = insertelement <2 x double> poison, double %63, i64 0, !dbg !150
  %65 = shufflevector <2 x double> %64, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !150
  %66 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %65, <2 x double> %59, <2 x double> %57), !dbg !150
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx73 = getelementptr inbounds double, double* %arrayidx5, i64 5, !dbg !151
  %67 = load double, double* %arrayidx73, align 8, !dbg !151, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %68 = load <2 x double>, <2 x double>* %5, align 8, !dbg !152, !tbaa !72
  %69 = insertelement <2 x double> poison, double %67, i64 0, !dbg !153
  %70 = shufflevector <2 x double> %69, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !153
  %71 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %70, <2 x double> %68, <2 x double> %62), !dbg !153
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx79 = getelementptr inbounds double, double* %arrayidx5, i64 21, !dbg !154
  %72 = load double, double* %arrayidx79, align 8, !dbg !154, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %73 = insertelement <2 x double> poison, double %72, i64 0, !dbg !155
  %74 = shufflevector <2 x double> %73, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !155
  %75 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %74, <2 x double> %68, <2 x double> %66), !dbg !155
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx85 = getelementptr inbounds double, double* %arrayidx5, i64 6, !dbg !156
  %76 = load double, double* %arrayidx85, align 8, !dbg !156, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %77 = load <2 x double>, <2 x double>* %6, align 8, !dbg !157, !tbaa !72
  %78 = insertelement <2 x double> poison, double %76, i64 0, !dbg !158
  %79 = shufflevector <2 x double> %78, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !158
  %80 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %79, <2 x double> %77, <2 x double> %71), !dbg !158
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx91 = getelementptr inbounds double, double* %arrayidx5, i64 22, !dbg !159
  %81 = load double, double* %arrayidx91, align 8, !dbg !159, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %82 = insertelement <2 x double> poison, double %81, i64 0, !dbg !160
  %83 = shufflevector <2 x double> %82, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !160
  %84 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %83, <2 x double> %77, <2 x double> %75), !dbg !160
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx97 = getelementptr inbounds double, double* %arrayidx5, i64 7, !dbg !161
  %85 = load double, double* %arrayidx97, align 8, !dbg !161, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %86 = load <2 x double>, <2 x double>* %7, align 8, !dbg !162, !tbaa !72
  %87 = insertelement <2 x double> poison, double %85, i64 0, !dbg !163
  %88 = shufflevector <2 x double> %87, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !163
  %89 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %88, <2 x double> %86, <2 x double> %80), !dbg !163
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx103 = getelementptr inbounds double, double* %arrayidx5, i64 23, !dbg !164
  %90 = load double, double* %arrayidx103, align 8, !dbg !164, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %91 = insertelement <2 x double> poison, double %90, i64 0, !dbg !165
  %92 = shufflevector <2 x double> %91, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !165
  %93 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %92, <2 x double> %86, <2 x double> %84), !dbg !165
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx109 = getelementptr inbounds double, double* %arrayidx5, i64 8, !dbg !166
  %94 = load double, double* %arrayidx109, align 8, !dbg !166, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %95 = load <2 x double>, <2 x double>* %8, align 8, !dbg !167, !tbaa !72
  %96 = insertelement <2 x double> poison, double %94, i64 0, !dbg !168
  %97 = shufflevector <2 x double> %96, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !168
  %98 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %97, <2 x double> %95, <2 x double> %89), !dbg !168
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx115 = getelementptr inbounds double, double* %arrayidx5, i64 24, !dbg !169
  %99 = load double, double* %arrayidx115, align 8, !dbg !169, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %100 = insertelement <2 x double> poison, double %99, i64 0, !dbg !170
  %101 = shufflevector <2 x double> %100, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !170
  %102 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %101, <2 x double> %95, <2 x double> %93), !dbg !170
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx121 = getelementptr inbounds double, double* %arrayidx5, i64 9, !dbg !171
  %103 = load double, double* %arrayidx121, align 8, !dbg !171, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %104 = load <2 x double>, <2 x double>* %9, align 8, !dbg !172, !tbaa !72
  %105 = insertelement <2 x double> poison, double %103, i64 0, !dbg !173
  %106 = shufflevector <2 x double> %105, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !173
  %107 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %106, <2 x double> %104, <2 x double> %98), !dbg !173
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx127 = getelementptr inbounds double, double* %arrayidx5, i64 25, !dbg !174
  %108 = load double, double* %arrayidx127, align 8, !dbg !174, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %109 = insertelement <2 x double> poison, double %108, i64 0, !dbg !175
  %110 = shufflevector <2 x double> %109, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !175
  %111 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %110, <2 x double> %104, <2 x double> %102), !dbg !175
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx133 = getelementptr inbounds double, double* %arrayidx5, i64 10, !dbg !176
  %112 = load double, double* %arrayidx133, align 8, !dbg !176, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %113 = load <2 x double>, <2 x double>* %10, align 8, !dbg !177, !tbaa !72
  %114 = insertelement <2 x double> poison, double %112, i64 0, !dbg !178
  %115 = shufflevector <2 x double> %114, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !178
  %116 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %115, <2 x double> %113, <2 x double> %107), !dbg !178
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx139 = getelementptr inbounds double, double* %arrayidx5, i64 26, !dbg !179
  %117 = load double, double* %arrayidx139, align 8, !dbg !179, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %118 = insertelement <2 x double> poison, double %117, i64 0, !dbg !180
  %119 = shufflevector <2 x double> %118, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !180
  %120 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %119, <2 x double> %113, <2 x double> %111), !dbg !180
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx145 = getelementptr inbounds double, double* %arrayidx5, i64 11, !dbg !181
  %121 = load double, double* %arrayidx145, align 8, !dbg !181, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %122 = load <2 x double>, <2 x double>* %11, align 8, !dbg !182, !tbaa !72
  %123 = insertelement <2 x double> poison, double %121, i64 0, !dbg !183
  %124 = shufflevector <2 x double> %123, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !183
  %125 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %124, <2 x double> %122, <2 x double> %116), !dbg !183
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx151 = getelementptr inbounds double, double* %arrayidx5, i64 27, !dbg !184
  %126 = load double, double* %arrayidx151, align 8, !dbg !184, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %127 = insertelement <2 x double> poison, double %126, i64 0, !dbg !185
  %128 = shufflevector <2 x double> %127, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !185
  %129 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %128, <2 x double> %122, <2 x double> %120), !dbg !185
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx157 = getelementptr inbounds double, double* %arrayidx5, i64 12, !dbg !186
  %130 = load double, double* %arrayidx157, align 8, !dbg !186, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %131 = load <2 x double>, <2 x double>* %12, align 8, !dbg !187, !tbaa !72
  %132 = insertelement <2 x double> poison, double %130, i64 0, !dbg !188
  %133 = shufflevector <2 x double> %132, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !188
  %134 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %133, <2 x double> %131, <2 x double> %125), !dbg !188
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx163 = getelementptr inbounds double, double* %arrayidx5, i64 28, !dbg !189
  %135 = load double, double* %arrayidx163, align 8, !dbg !189, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %136 = insertelement <2 x double> poison, double %135, i64 0, !dbg !190
  %137 = shufflevector <2 x double> %136, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !190
  %138 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %137, <2 x double> %131, <2 x double> %129), !dbg !190
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx169 = getelementptr inbounds double, double* %arrayidx5, i64 13, !dbg !191
  %139 = load double, double* %arrayidx169, align 8, !dbg !191, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %140 = load <2 x double>, <2 x double>* %13, align 8, !dbg !192, !tbaa !72
  %141 = insertelement <2 x double> poison, double %139, i64 0, !dbg !193
  %142 = shufflevector <2 x double> %141, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !193
  %143 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %142, <2 x double> %140, <2 x double> %134), !dbg !193
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx175 = getelementptr inbounds double, double* %arrayidx5, i64 29, !dbg !194
  %144 = load double, double* %arrayidx175, align 8, !dbg !194, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %145 = insertelement <2 x double> poison, double %144, i64 0, !dbg !195
  %146 = shufflevector <2 x double> %145, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !195
  %147 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %146, <2 x double> %140, <2 x double> %138), !dbg !195
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx181 = getelementptr inbounds double, double* %arrayidx5, i64 14, !dbg !196
  %148 = load double, double* %arrayidx181, align 8, !dbg !196, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %149 = load <2 x double>, <2 x double>* %14, align 8, !dbg !197, !tbaa !72
  %150 = insertelement <2 x double> poison, double %148, i64 0, !dbg !198
  %151 = shufflevector <2 x double> %150, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !198
  %152 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %151, <2 x double> %149, <2 x double> %143), !dbg !198
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx187 = getelementptr inbounds double, double* %arrayidx5, i64 30, !dbg !199
  %153 = load double, double* %arrayidx187, align 8, !dbg !199, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %154 = insertelement <2 x double> poison, double %153, i64 0, !dbg !200
  %155 = shufflevector <2 x double> %154, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !200
  %156 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %155, <2 x double> %149, <2 x double> %147), !dbg !200
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  %arrayidx193 = getelementptr inbounds double, double* %arrayidx5, i64 15, !dbg !201
  %157 = load double, double* %arrayidx193, align 8, !dbg !201, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !110, metadata !DIExpression()), !dbg !121
  %158 = load <2 x double>, <2 x double>* %15, align 8, !dbg !202, !tbaa !72
  %159 = insertelement <2 x double> poison, double %157, i64 0, !dbg !203
  %160 = shufflevector <2 x double> %159, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !203
  %161 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %160, <2 x double> %158, <2 x double> %152), !dbg !203
  call void @llvm.dbg.value(metadata double undef, metadata !111, metadata !DIExpression()), !dbg !121
  %arrayidx199 = getelementptr inbounds double, double* %arrayidx5, i64 31, !dbg !204
  %162 = load double, double* %arrayidx199, align 8, !dbg !204, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !112, metadata !DIExpression()), !dbg !121
  %163 = insertelement <2 x double> poison, double %162, i64 0, !dbg !205
  %164 = shufflevector <2 x double> %163, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !205
  %165 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %164, <2 x double> %158, <2 x double> %156), !dbg !205
  call void @llvm.dbg.value(metadata double undef, metadata !113, metadata !DIExpression()), !dbg !121
  store <2 x double> %161, <2 x double>* %18, align 8, !dbg !206, !tbaa !72
  store <2 x double> %165, <2 x double>* %20, align 8, !dbg !207, !tbaa !72
  call void @llvm.dbg.value(metadata i64 undef, metadata !100, metadata !DIExpression(DW_OP_plus_uconst, 128, DW_OP_stack_value)), !dbg !114
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !208
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !98, metadata !DIExpression()), !dbg !114
  %cmp2 = icmp ult i64 %indvars.iv, 14, !dbg !209
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !118, !llvm.loop !210

for.end:                                          ; preds = %for.body3
  %indvars.iv.next436 = add nuw nsw i64 %indvars.iv435, 2, !dbg !213
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next436, metadata !99, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.value(metadata i64 undef, metadata !100, metadata !DIExpression(DW_OP_plus_uconst, 1024, DW_OP_stack_value)), !dbg !114
  %cmp = icmp ult i64 %indvars.iv435, 14, !dbg !214
  br i1 %cmp, label %for.body, label %for.end213, !dbg !115, !llvm.loop !215

for.end213:                                       ; preds = %for.end
  ret i64 8192, !dbg !217
}

; Function Attrs: argmemonly nofree nosync nounwind uwtable
define dso_local i64 @multiply_block([256 x double]* noundef readonly %A, [256 x double]* noundef readonly %B, [256 x double]* nocapture noundef writeonly %R) local_unnamed_addr #6 !dbg !218 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %A, metadata !220, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.value(metadata [256 x double]* %B, metadata !221, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !222, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.value(metadata i64 0, metadata !225, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.value(metadata i32 0, metadata !224, metadata !DIExpression()), !dbg !239
  br label %for.body, !dbg !240

for.body:                                         ; preds = %entry, %for.end
  %indvars.iv423 = phi i64 [ 0, %entry ], [ %indvars.iv.next424, %for.end ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv423, metadata !224, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.value(metadata i64 undef, metadata !225, metadata !DIExpression()), !dbg !239
  %arrayidx = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 %indvars.iv423, !dbg !241
  call void @llvm.dbg.value(metadata double* %arrayidx, metadata !226, metadata !DIExpression()), !dbg !242
  call void @llvm.dbg.value(metadata i32 0, metadata !223, metadata !DIExpression()), !dbg !239
  %arrayidx22 = getelementptr inbounds double, double* %arrayidx, i64 16
  %arrayidx34 = getelementptr inbounds double, double* %arrayidx, i64 32
  %arrayidx46 = getelementptr inbounds double, double* %arrayidx, i64 48
  %arrayidx58 = getelementptr inbounds double, double* %arrayidx, i64 64
  %arrayidx70 = getelementptr inbounds double, double* %arrayidx, i64 80
  %arrayidx82 = getelementptr inbounds double, double* %arrayidx, i64 96
  %arrayidx94 = getelementptr inbounds double, double* %arrayidx, i64 112
  %arrayidx106 = getelementptr inbounds double, double* %arrayidx, i64 128
  %arrayidx118 = getelementptr inbounds double, double* %arrayidx, i64 144
  %arrayidx130 = getelementptr inbounds double, double* %arrayidx, i64 160
  %arrayidx142 = getelementptr inbounds double, double* %arrayidx, i64 176
  %arrayidx154 = getelementptr inbounds double, double* %arrayidx, i64 192
  %arrayidx166 = getelementptr inbounds double, double* %arrayidx, i64 208
  %arrayidx178 = getelementptr inbounds double, double* %arrayidx, i64 224
  %arrayidx190 = getelementptr inbounds double, double* %arrayidx, i64 240
  call void @llvm.dbg.value(metadata i32 0, metadata !223, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.value(metadata i64 undef, metadata !225, metadata !DIExpression()), !dbg !239
  %0 = bitcast double* %arrayidx to <2 x double>*
  %1 = bitcast double* %arrayidx22 to <2 x double>*
  %2 = bitcast double* %arrayidx34 to <2 x double>*
  %3 = bitcast double* %arrayidx46 to <2 x double>*
  %4 = bitcast double* %arrayidx58 to <2 x double>*
  %5 = bitcast double* %arrayidx70 to <2 x double>*
  %6 = bitcast double* %arrayidx82 to <2 x double>*
  %7 = bitcast double* %arrayidx94 to <2 x double>*
  %8 = bitcast double* %arrayidx106 to <2 x double>*
  %9 = bitcast double* %arrayidx118 to <2 x double>*
  %10 = bitcast double* %arrayidx130 to <2 x double>*
  %11 = bitcast double* %arrayidx142 to <2 x double>*
  %12 = bitcast double* %arrayidx154 to <2 x double>*
  %13 = bitcast double* %arrayidx166 to <2 x double>*
  %14 = bitcast double* %arrayidx178 to <2 x double>*
  %15 = bitcast double* %arrayidx190 to <2 x double>*
  br label %for.body3, !dbg !243

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body3 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !223, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.value(metadata i64 undef, metadata !225, metadata !DIExpression()), !dbg !239
  %16 = shl nuw nsw i64 %indvars.iv, 4, !dbg !244
  %arrayidx5 = getelementptr inbounds [256 x double], [256 x double]* %A, i64 0, i64 %16, !dbg !245
  call void @llvm.dbg.value(metadata double* %arrayidx5, metadata !230, metadata !DIExpression()), !dbg !246
  %17 = add nuw nsw i64 %16, %indvars.iv423, !dbg !247
  %arrayidx8 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %17, !dbg !248
  call void @llvm.dbg.value(metadata double* %arrayidx8, metadata !234, metadata !DIExpression()), !dbg !246
  %18 = load double, double* %arrayidx5, align 8, !dbg !249, !tbaa !72
  %19 = load <2 x double>, <2 x double>* %0, align 8, !dbg !250, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %20 = insertelement <2 x double> poison, double %18, i64 0, !dbg !251
  %21 = shufflevector <2 x double> %20, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !251
  %22 = fmul <2 x double> %21, %19, !dbg !251
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx15 = getelementptr inbounds double, double* %arrayidx5, i64 16, !dbg !252
  %23 = load double, double* %arrayidx15, align 8, !dbg !252, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %24 = insertelement <2 x double> poison, double %23, i64 0, !dbg !253
  %25 = shufflevector <2 x double> %24, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !253
  %26 = fmul <2 x double> %19, %25, !dbg !253
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx21 = getelementptr inbounds double, double* %arrayidx5, i64 1, !dbg !254
  %27 = load double, double* %arrayidx21, align 8, !dbg !254, !tbaa !72
  %28 = load <2 x double>, <2 x double>* %1, align 8, !dbg !255, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %29 = insertelement <2 x double> poison, double %27, i64 0, !dbg !256
  %30 = shufflevector <2 x double> %29, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !256
  %31 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %30, <2 x double> %28, <2 x double> %22), !dbg !256
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx27 = getelementptr inbounds double, double* %arrayidx5, i64 17, !dbg !257
  %32 = load double, double* %arrayidx27, align 8, !dbg !257, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %33 = insertelement <2 x double> poison, double %32, i64 0, !dbg !258
  %34 = shufflevector <2 x double> %33, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !258
  %35 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %34, <2 x double> %28, <2 x double> %26), !dbg !258
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx33 = getelementptr inbounds double, double* %arrayidx5, i64 2, !dbg !259
  %36 = load double, double* %arrayidx33, align 8, !dbg !259, !tbaa !72
  %37 = load <2 x double>, <2 x double>* %2, align 8, !dbg !260, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %38 = insertelement <2 x double> poison, double %36, i64 0, !dbg !261
  %39 = shufflevector <2 x double> %38, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !261
  %40 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %39, <2 x double> %37, <2 x double> %31), !dbg !261
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx39 = getelementptr inbounds double, double* %arrayidx5, i64 18, !dbg !262
  %41 = load double, double* %arrayidx39, align 8, !dbg !262, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %42 = insertelement <2 x double> poison, double %41, i64 0, !dbg !263
  %43 = shufflevector <2 x double> %42, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !263
  %44 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %43, <2 x double> %37, <2 x double> %35), !dbg !263
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx45 = getelementptr inbounds double, double* %arrayidx5, i64 3, !dbg !264
  %45 = load double, double* %arrayidx45, align 8, !dbg !264, !tbaa !72
  %46 = load <2 x double>, <2 x double>* %3, align 8, !dbg !265, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %47 = insertelement <2 x double> poison, double %45, i64 0, !dbg !266
  %48 = shufflevector <2 x double> %47, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !266
  %49 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %48, <2 x double> %46, <2 x double> %40), !dbg !266
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx51 = getelementptr inbounds double, double* %arrayidx5, i64 19, !dbg !267
  %50 = load double, double* %arrayidx51, align 8, !dbg !267, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %51 = insertelement <2 x double> poison, double %50, i64 0, !dbg !268
  %52 = shufflevector <2 x double> %51, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !268
  %53 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %52, <2 x double> %46, <2 x double> %44), !dbg !268
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx57 = getelementptr inbounds double, double* %arrayidx5, i64 4, !dbg !269
  %54 = load double, double* %arrayidx57, align 8, !dbg !269, !tbaa !72
  %55 = load <2 x double>, <2 x double>* %4, align 8, !dbg !270, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %56 = insertelement <2 x double> poison, double %54, i64 0, !dbg !271
  %57 = shufflevector <2 x double> %56, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !271
  %58 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %57, <2 x double> %55, <2 x double> %49), !dbg !271
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx63 = getelementptr inbounds double, double* %arrayidx5, i64 20, !dbg !272
  %59 = load double, double* %arrayidx63, align 8, !dbg !272, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %60 = insertelement <2 x double> poison, double %59, i64 0, !dbg !273
  %61 = shufflevector <2 x double> %60, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !273
  %62 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %61, <2 x double> %55, <2 x double> %53), !dbg !273
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx69 = getelementptr inbounds double, double* %arrayidx5, i64 5, !dbg !274
  %63 = load double, double* %arrayidx69, align 8, !dbg !274, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %64 = load <2 x double>, <2 x double>* %5, align 8, !dbg !275, !tbaa !72
  %65 = insertelement <2 x double> poison, double %63, i64 0, !dbg !276
  %66 = shufflevector <2 x double> %65, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !276
  %67 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %66, <2 x double> %64, <2 x double> %58), !dbg !276
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx75 = getelementptr inbounds double, double* %arrayidx5, i64 21, !dbg !277
  %68 = load double, double* %arrayidx75, align 8, !dbg !277, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %69 = insertelement <2 x double> poison, double %68, i64 0, !dbg !278
  %70 = shufflevector <2 x double> %69, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !278
  %71 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %70, <2 x double> %64, <2 x double> %62), !dbg !278
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx81 = getelementptr inbounds double, double* %arrayidx5, i64 6, !dbg !279
  %72 = load double, double* %arrayidx81, align 8, !dbg !279, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %73 = load <2 x double>, <2 x double>* %6, align 8, !dbg !280, !tbaa !72
  %74 = insertelement <2 x double> poison, double %72, i64 0, !dbg !281
  %75 = shufflevector <2 x double> %74, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !281
  %76 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %75, <2 x double> %73, <2 x double> %67), !dbg !281
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx87 = getelementptr inbounds double, double* %arrayidx5, i64 22, !dbg !282
  %77 = load double, double* %arrayidx87, align 8, !dbg !282, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %78 = insertelement <2 x double> poison, double %77, i64 0, !dbg !283
  %79 = shufflevector <2 x double> %78, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !283
  %80 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %79, <2 x double> %73, <2 x double> %71), !dbg !283
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx93 = getelementptr inbounds double, double* %arrayidx5, i64 7, !dbg !284
  %81 = load double, double* %arrayidx93, align 8, !dbg !284, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %82 = load <2 x double>, <2 x double>* %7, align 8, !dbg !285, !tbaa !72
  %83 = insertelement <2 x double> poison, double %81, i64 0, !dbg !286
  %84 = shufflevector <2 x double> %83, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !286
  %85 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %84, <2 x double> %82, <2 x double> %76), !dbg !286
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx99 = getelementptr inbounds double, double* %arrayidx5, i64 23, !dbg !287
  %86 = load double, double* %arrayidx99, align 8, !dbg !287, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %87 = insertelement <2 x double> poison, double %86, i64 0, !dbg !288
  %88 = shufflevector <2 x double> %87, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !288
  %89 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %88, <2 x double> %82, <2 x double> %80), !dbg !288
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx105 = getelementptr inbounds double, double* %arrayidx5, i64 8, !dbg !289
  %90 = load double, double* %arrayidx105, align 8, !dbg !289, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %91 = load <2 x double>, <2 x double>* %8, align 8, !dbg !290, !tbaa !72
  %92 = insertelement <2 x double> poison, double %90, i64 0, !dbg !291
  %93 = shufflevector <2 x double> %92, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !291
  %94 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %93, <2 x double> %91, <2 x double> %85), !dbg !291
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx111 = getelementptr inbounds double, double* %arrayidx5, i64 24, !dbg !292
  %95 = load double, double* %arrayidx111, align 8, !dbg !292, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %96 = insertelement <2 x double> poison, double %95, i64 0, !dbg !293
  %97 = shufflevector <2 x double> %96, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !293
  %98 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %97, <2 x double> %91, <2 x double> %89), !dbg !293
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx117 = getelementptr inbounds double, double* %arrayidx5, i64 9, !dbg !294
  %99 = load double, double* %arrayidx117, align 8, !dbg !294, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %100 = load <2 x double>, <2 x double>* %9, align 8, !dbg !295, !tbaa !72
  %101 = insertelement <2 x double> poison, double %99, i64 0, !dbg !296
  %102 = shufflevector <2 x double> %101, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !296
  %103 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %102, <2 x double> %100, <2 x double> %94), !dbg !296
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx123 = getelementptr inbounds double, double* %arrayidx5, i64 25, !dbg !297
  %104 = load double, double* %arrayidx123, align 8, !dbg !297, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %105 = insertelement <2 x double> poison, double %104, i64 0, !dbg !298
  %106 = shufflevector <2 x double> %105, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !298
  %107 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %106, <2 x double> %100, <2 x double> %98), !dbg !298
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx129 = getelementptr inbounds double, double* %arrayidx5, i64 10, !dbg !299
  %108 = load double, double* %arrayidx129, align 8, !dbg !299, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %109 = load <2 x double>, <2 x double>* %10, align 8, !dbg !300, !tbaa !72
  %110 = insertelement <2 x double> poison, double %108, i64 0, !dbg !301
  %111 = shufflevector <2 x double> %110, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !301
  %112 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %111, <2 x double> %109, <2 x double> %103), !dbg !301
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx135 = getelementptr inbounds double, double* %arrayidx5, i64 26, !dbg !302
  %113 = load double, double* %arrayidx135, align 8, !dbg !302, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %114 = insertelement <2 x double> poison, double %113, i64 0, !dbg !303
  %115 = shufflevector <2 x double> %114, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !303
  %116 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %115, <2 x double> %109, <2 x double> %107), !dbg !303
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx141 = getelementptr inbounds double, double* %arrayidx5, i64 11, !dbg !304
  %117 = load double, double* %arrayidx141, align 8, !dbg !304, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %118 = load <2 x double>, <2 x double>* %11, align 8, !dbg !305, !tbaa !72
  %119 = insertelement <2 x double> poison, double %117, i64 0, !dbg !306
  %120 = shufflevector <2 x double> %119, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !306
  %121 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %120, <2 x double> %118, <2 x double> %112), !dbg !306
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx147 = getelementptr inbounds double, double* %arrayidx5, i64 27, !dbg !307
  %122 = load double, double* %arrayidx147, align 8, !dbg !307, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %123 = insertelement <2 x double> poison, double %122, i64 0, !dbg !308
  %124 = shufflevector <2 x double> %123, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !308
  %125 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %124, <2 x double> %118, <2 x double> %116), !dbg !308
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx153 = getelementptr inbounds double, double* %arrayidx5, i64 12, !dbg !309
  %126 = load double, double* %arrayidx153, align 8, !dbg !309, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %127 = load <2 x double>, <2 x double>* %12, align 8, !dbg !310, !tbaa !72
  %128 = insertelement <2 x double> poison, double %126, i64 0, !dbg !311
  %129 = shufflevector <2 x double> %128, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !311
  %130 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %129, <2 x double> %127, <2 x double> %121), !dbg !311
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx159 = getelementptr inbounds double, double* %arrayidx5, i64 28, !dbg !312
  %131 = load double, double* %arrayidx159, align 8, !dbg !312, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %132 = insertelement <2 x double> poison, double %131, i64 0, !dbg !313
  %133 = shufflevector <2 x double> %132, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !313
  %134 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %133, <2 x double> %127, <2 x double> %125), !dbg !313
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx165 = getelementptr inbounds double, double* %arrayidx5, i64 13, !dbg !314
  %135 = load double, double* %arrayidx165, align 8, !dbg !314, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %136 = load <2 x double>, <2 x double>* %13, align 8, !dbg !315, !tbaa !72
  %137 = insertelement <2 x double> poison, double %135, i64 0, !dbg !316
  %138 = shufflevector <2 x double> %137, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !316
  %139 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %138, <2 x double> %136, <2 x double> %130), !dbg !316
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx171 = getelementptr inbounds double, double* %arrayidx5, i64 29, !dbg !317
  %140 = load double, double* %arrayidx171, align 8, !dbg !317, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %141 = insertelement <2 x double> poison, double %140, i64 0, !dbg !318
  %142 = shufflevector <2 x double> %141, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !318
  %143 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %142, <2 x double> %136, <2 x double> %134), !dbg !318
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx177 = getelementptr inbounds double, double* %arrayidx5, i64 14, !dbg !319
  %144 = load double, double* %arrayidx177, align 8, !dbg !319, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %145 = load <2 x double>, <2 x double>* %14, align 8, !dbg !320, !tbaa !72
  %146 = insertelement <2 x double> poison, double %144, i64 0, !dbg !321
  %147 = shufflevector <2 x double> %146, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !321
  %148 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %147, <2 x double> %145, <2 x double> %139), !dbg !321
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx183 = getelementptr inbounds double, double* %arrayidx5, i64 30, !dbg !322
  %149 = load double, double* %arrayidx183, align 8, !dbg !322, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %150 = insertelement <2 x double> poison, double %149, i64 0, !dbg !323
  %151 = shufflevector <2 x double> %150, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !323
  %152 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %151, <2 x double> %145, <2 x double> %143), !dbg !323
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %arrayidx189 = getelementptr inbounds double, double* %arrayidx5, i64 15, !dbg !324
  %153 = load double, double* %arrayidx189, align 8, !dbg !324, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !235, metadata !DIExpression()), !dbg !246
  %154 = load <2 x double>, <2 x double>* %15, align 8, !dbg !325, !tbaa !72
  %155 = insertelement <2 x double> poison, double %153, i64 0, !dbg !326
  %156 = shufflevector <2 x double> %155, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !326
  %157 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %156, <2 x double> %154, <2 x double> %148), !dbg !326
  call void @llvm.dbg.value(metadata double undef, metadata !236, metadata !DIExpression()), !dbg !246
  %arrayidx195 = getelementptr inbounds double, double* %arrayidx5, i64 31, !dbg !327
  %158 = load double, double* %arrayidx195, align 8, !dbg !327, !tbaa !72
  call void @llvm.dbg.value(metadata double undef, metadata !237, metadata !DIExpression()), !dbg !246
  %159 = insertelement <2 x double> poison, double %158, i64 0, !dbg !328
  %160 = shufflevector <2 x double> %159, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !328
  %161 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %160, <2 x double> %154, <2 x double> %152), !dbg !328
  call void @llvm.dbg.value(metadata double undef, metadata !238, metadata !DIExpression()), !dbg !246
  %162 = bitcast double* %arrayidx8 to <2 x double>*, !dbg !329
  store <2 x double> %157, <2 x double>* %162, align 8, !dbg !329, !tbaa !72
  %arrayidx203 = getelementptr inbounds double, double* %arrayidx8, i64 16, !dbg !330
  %163 = bitcast double* %arrayidx203 to <2 x double>*, !dbg !331
  store <2 x double> %161, <2 x double>* %163, align 8, !dbg !331, !tbaa !72
  call void @llvm.dbg.value(metadata i64 undef, metadata !225, metadata !DIExpression(DW_OP_plus_uconst, 124, DW_OP_stack_value)), !dbg !239
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !332
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !223, metadata !DIExpression()), !dbg !239
  %cmp2 = icmp ult i64 %indvars.iv, 14, !dbg !333
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !243, !llvm.loop !334

for.end:                                          ; preds = %for.body3
  %indvars.iv.next424 = add nuw nsw i64 %indvars.iv423, 2, !dbg !336
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next424, metadata !224, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.value(metadata i64 undef, metadata !225, metadata !DIExpression(DW_OP_plus_uconst, 992, DW_OP_stack_value)), !dbg !239
  %cmp = icmp ult i64 %indvars.iv423, 14, !dbg !337
  br i1 %cmp, label %for.body, label %for.end209, !dbg !240, !llvm.loop !338

for.end209:                                       ; preds = %for.end
  ret i64 7936, !dbg !340
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @check_block([256 x double]* nocapture noundef readonly %R, double noundef %v) local_unnamed_addr #7 !dbg !341 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !345, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata double %v, metadata !346, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 0, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 0, metadata !347, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 0, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i64 0, metadata !347, metadata !DIExpression()), !dbg !349
  %arrayidx.peel = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 0, !dbg !350
  %0 = load double, double* %arrayidx.peel, align 8, !dbg !350, !tbaa !72
  %cmp1.peel = fcmp une double %0, %v, !dbg !354
  br i1 %cmp1.peel, label %if.end.peel, label %vector.ph, !dbg !355

if.end.peel:                                      ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !356, !tbaa !359
  %call.peel = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %1, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 noundef 0, double noundef %0, double noundef %v) #21, !dbg !361
  call void @llvm.dbg.value(metadata i32 1, metadata !348, metadata !DIExpression()), !dbg !349
  br label %vector.ph, !dbg !362

vector.ph:                                        ; preds = %if.end.peel, %entry
  %error.1.peel = phi i32 [ 1, %if.end.peel ], [ 0, %entry ], !dbg !349
  call void @llvm.dbg.value(metadata i32 %error.1.peel, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i64 1, metadata !347, metadata !DIExpression()), !dbg !349
  %2 = insertelement <2 x i32> <i32 poison, i32 0>, i32 %error.1.peel, i64 0, !dbg !363
  %broadcast.splatinsert = insertelement <2 x double> poison, double %v, i64 0, !dbg !363
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !363
  br label %vector.body, !dbg !363

vector.body:                                      ; preds = %vector.body.1, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body.1 ]
  %vec.phi = phi <2 x i32> [ %2, %vector.ph ], [ %22, %vector.body.1 ]
  %vec.phi23 = phi <2 x i32> [ zeroinitializer, %vector.ph ], [ %23, %vector.body.1 ]
  %offset.idx = or i64 %index, 1
  %3 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %offset.idx, !dbg !350
  %4 = bitcast double* %3 to <2 x double>*, !dbg !350
  %wide.load = load <2 x double>, <2 x double>* %4, align 8, !dbg !350, !tbaa !72
  %5 = getelementptr inbounds double, double* %3, i64 2, !dbg !350
  %6 = bitcast double* %5 to <2 x double>*, !dbg !350
  %wide.load24 = load <2 x double>, <2 x double>* %6, align 8, !dbg !350, !tbaa !72
  %7 = fcmp une <2 x double> %wide.load, %broadcast.splat, !dbg !354
  %8 = fcmp une <2 x double> %wide.load24, %broadcast.splat, !dbg !354
  %9 = zext <2 x i1> %7 to <2 x i32>, !dbg !355
  %10 = zext <2 x i1> %8 to <2 x i32>, !dbg !355
  %11 = add <2 x i32> %vec.phi, %9, !dbg !355
  %12 = add <2 x i32> %vec.phi23, %10, !dbg !355
  %13 = icmp eq i64 %index, 248
  br i1 %13, label %for.body, label %vector.body.1, !llvm.loop !364

vector.body.1:                                    ; preds = %vector.body
  %offset.idx.1 = or i64 %index, 5
  %14 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %offset.idx.1, !dbg !350
  %15 = bitcast double* %14 to <2 x double>*, !dbg !350
  %wide.load.1 = load <2 x double>, <2 x double>* %15, align 8, !dbg !350, !tbaa !72
  %16 = getelementptr inbounds double, double* %14, i64 2, !dbg !350
  %17 = bitcast double* %16 to <2 x double>*, !dbg !350
  %wide.load24.1 = load <2 x double>, <2 x double>* %17, align 8, !dbg !350, !tbaa !72
  %18 = fcmp une <2 x double> %wide.load.1, %broadcast.splat, !dbg !354
  %19 = fcmp une <2 x double> %wide.load24.1, %broadcast.splat, !dbg !354
  %20 = zext <2 x i1> %18 to <2 x i32>, !dbg !355
  %21 = zext <2 x i1> %19 to <2 x i32>, !dbg !355
  %22 = add <2 x i32> %11, %20, !dbg !355
  %23 = add <2 x i32> %12, %21, !dbg !355
  %index.next.1 = add nuw nsw i64 %index, 8
  br label %vector.body

for.body:                                         ; preds = %vector.body
  %bin.rdx = add <2 x i32> %12, %11, !dbg !363
  %24 = call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %bin.rdx), !dbg !363
  call void @llvm.dbg.value(metadata i32 %24, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i64 253, metadata !347, metadata !DIExpression()), !dbg !349
  %arrayidx = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 253, !dbg !350
  %25 = load double, double* %arrayidx, align 8, !dbg !350, !tbaa !72
  %cmp1 = fcmp une double %25, %v, !dbg !354
  %inc = zext i1 %cmp1 to i32, !dbg !355
  %error.1 = add nuw nsw i32 %24, %inc, !dbg !355
  call void @llvm.dbg.value(metadata i32 %error.1, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i64 254, metadata !347, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 %error.1, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i64 254, metadata !347, metadata !DIExpression()), !dbg !349
  %arrayidx.1 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 254, !dbg !350
  %26 = load double, double* %arrayidx.1, align 8, !dbg !350, !tbaa !72
  %cmp1.1 = fcmp une double %26, %v, !dbg !354
  %inc.1 = zext i1 %cmp1.1 to i32, !dbg !355
  %error.1.1 = add nuw nsw i32 %error.1, %inc.1, !dbg !355
  call void @llvm.dbg.value(metadata i32 %error.1.1, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i64 255, metadata !347, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i32 %error.1.1, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i64 255, metadata !347, metadata !DIExpression()), !dbg !349
  %arrayidx.2 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 255, !dbg !350
  %27 = load double, double* %arrayidx.2, align 8, !dbg !350, !tbaa !72
  %cmp1.2 = fcmp une double %27, %v, !dbg !354
  %inc.2 = zext i1 %cmp1.2 to i32, !dbg !355
  %error.1.2 = add nuw nsw i32 %error.1.1, %inc.2, !dbg !355
  call void @llvm.dbg.value(metadata i32 %error.1.2, metadata !348, metadata !DIExpression()), !dbg !349
  call void @llvm.dbg.value(metadata i64 256, metadata !347, metadata !DIExpression()), !dbg !349
  ret i32 %error.1.2, !dbg !368
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #8

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @compare_block([256 x double]* nocapture noundef readonly %R, [256 x double]* nocapture noundef readonly %B) local_unnamed_addr #7 !dbg !369 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !373, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata [256 x double]* %B, metadata !374, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i32 0, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i32 0, metadata !375, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i32 0, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i64 0, metadata !375, metadata !DIExpression()), !dbg !377
  %arrayidx.peel = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 0, !dbg !378
  %0 = load double, double* %arrayidx.peel, align 8, !dbg !378, !tbaa !72
  %arrayidx2.peel = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 0, !dbg !382
  %1 = load double, double* %arrayidx2.peel, align 8, !dbg !382, !tbaa !72
  %cmp3.peel = fcmp une double %0, %1, !dbg !383
  br i1 %cmp3.peel, label %if.end.peel, label %vector.ph, !dbg !384

if.end.peel:                                      ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !385, !tbaa !359
  %call.peel = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %2, i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i64 0, i64 0), i32 noundef 0, double noundef %0, double noundef %1, i32 noundef 0) #21, !dbg !388
  call void @llvm.dbg.value(metadata i32 1, metadata !376, metadata !DIExpression()), !dbg !377
  br label %vector.ph, !dbg !389

vector.ph:                                        ; preds = %if.end.peel, %entry
  %error.1.peel = phi i32 [ 1, %if.end.peel ], [ 0, %entry ], !dbg !377
  call void @llvm.dbg.value(metadata i32 %error.1.peel, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i64 1, metadata !375, metadata !DIExpression()), !dbg !377
  %3 = insertelement <2 x i32> <i32 poison, i32 0>, i32 %error.1.peel, i64 0, !dbg !390
  br label %vector.body, !dbg !390

vector.body:                                      ; preds = %vector.body.1, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body.1 ]
  %vec.phi = phi <2 x i32> [ %3, %vector.ph ], [ %31, %vector.body.1 ]
  %vec.phi31 = phi <2 x i32> [ zeroinitializer, %vector.ph ], [ %32, %vector.body.1 ]
  %offset.idx = or i64 %index, 1
  %4 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %offset.idx, !dbg !378
  %5 = bitcast double* %4 to <2 x double>*, !dbg !378
  %wide.load = load <2 x double>, <2 x double>* %5, align 8, !dbg !378, !tbaa !72
  %6 = getelementptr inbounds double, double* %4, i64 2, !dbg !378
  %7 = bitcast double* %6 to <2 x double>*, !dbg !378
  %wide.load32 = load <2 x double>, <2 x double>* %7, align 8, !dbg !378, !tbaa !72
  %8 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 %offset.idx, !dbg !382
  %9 = bitcast double* %8 to <2 x double>*, !dbg !382
  %wide.load33 = load <2 x double>, <2 x double>* %9, align 8, !dbg !382, !tbaa !72
  %10 = getelementptr inbounds double, double* %8, i64 2, !dbg !382
  %11 = bitcast double* %10 to <2 x double>*, !dbg !382
  %wide.load34 = load <2 x double>, <2 x double>* %11, align 8, !dbg !382, !tbaa !72
  %12 = fcmp une <2 x double> %wide.load, %wide.load33, !dbg !383
  %13 = fcmp une <2 x double> %wide.load32, %wide.load34, !dbg !383
  %14 = zext <2 x i1> %12 to <2 x i32>, !dbg !384
  %15 = zext <2 x i1> %13 to <2 x i32>, !dbg !384
  %16 = add <2 x i32> %vec.phi, %14, !dbg !384
  %17 = add <2 x i32> %vec.phi31, %15, !dbg !384
  %18 = icmp eq i64 %index, 248
  br i1 %18, label %for.body, label %vector.body.1, !llvm.loop !391

vector.body.1:                                    ; preds = %vector.body
  %offset.idx.1 = or i64 %index, 5
  %19 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %offset.idx.1, !dbg !378
  %20 = bitcast double* %19 to <2 x double>*, !dbg !378
  %wide.load.1 = load <2 x double>, <2 x double>* %20, align 8, !dbg !378, !tbaa !72
  %21 = getelementptr inbounds double, double* %19, i64 2, !dbg !378
  %22 = bitcast double* %21 to <2 x double>*, !dbg !378
  %wide.load32.1 = load <2 x double>, <2 x double>* %22, align 8, !dbg !378, !tbaa !72
  %23 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 %offset.idx.1, !dbg !382
  %24 = bitcast double* %23 to <2 x double>*, !dbg !382
  %wide.load33.1 = load <2 x double>, <2 x double>* %24, align 8, !dbg !382, !tbaa !72
  %25 = getelementptr inbounds double, double* %23, i64 2, !dbg !382
  %26 = bitcast double* %25 to <2 x double>*, !dbg !382
  %wide.load34.1 = load <2 x double>, <2 x double>* %26, align 8, !dbg !382, !tbaa !72
  %27 = fcmp une <2 x double> %wide.load.1, %wide.load33.1, !dbg !383
  %28 = fcmp une <2 x double> %wide.load32.1, %wide.load34.1, !dbg !383
  %29 = zext <2 x i1> %27 to <2 x i32>, !dbg !384
  %30 = zext <2 x i1> %28 to <2 x i32>, !dbg !384
  %31 = add <2 x i32> %16, %29, !dbg !384
  %32 = add <2 x i32> %17, %30, !dbg !384
  %index.next.1 = add nuw nsw i64 %index, 8
  br label %vector.body

for.body:                                         ; preds = %vector.body
  %bin.rdx = add <2 x i32> %17, %16, !dbg !390
  %33 = call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %bin.rdx), !dbg !390
  call void @llvm.dbg.value(metadata i32 %33, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i64 253, metadata !375, metadata !DIExpression()), !dbg !377
  %arrayidx = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 253, !dbg !378
  %34 = load double, double* %arrayidx, align 8, !dbg !378, !tbaa !72
  %arrayidx2 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 253, !dbg !382
  %35 = load double, double* %arrayidx2, align 8, !dbg !382, !tbaa !72
  %cmp3 = fcmp une double %34, %35, !dbg !383
  %inc = zext i1 %cmp3 to i32, !dbg !384
  %error.1 = add nuw nsw i32 %33, %inc, !dbg !384
  call void @llvm.dbg.value(metadata i32 %error.1, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i64 254, metadata !375, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i32 %error.1, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i64 254, metadata !375, metadata !DIExpression()), !dbg !377
  %arrayidx.1 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 254, !dbg !378
  %36 = load double, double* %arrayidx.1, align 8, !dbg !378, !tbaa !72
  %arrayidx2.1 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 254, !dbg !382
  %37 = load double, double* %arrayidx2.1, align 8, !dbg !382, !tbaa !72
  %cmp3.1 = fcmp une double %36, %37, !dbg !383
  %inc.1 = zext i1 %cmp3.1 to i32, !dbg !384
  %error.1.1 = add nuw nsw i32 %error.1, %inc.1, !dbg !384
  call void @llvm.dbg.value(metadata i32 %error.1.1, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i64 255, metadata !375, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i32 %error.1.1, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i64 255, metadata !375, metadata !DIExpression()), !dbg !377
  %arrayidx.2 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 255, !dbg !378
  %38 = load double, double* %arrayidx.2, align 8, !dbg !378, !tbaa !72
  %arrayidx2.2 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 255, !dbg !382
  %39 = load double, double* %arrayidx2.2, align 8, !dbg !382, !tbaa !72
  %cmp3.2 = fcmp une double %38, %39, !dbg !383
  %inc.2 = zext i1 %cmp3.2 to i32, !dbg !384
  %error.1.2 = add nuw nsw i32 %error.1.1, %inc.2, !dbg !384
  call void @llvm.dbg.value(metadata i32 %error.1.2, metadata !376, metadata !DIExpression()), !dbg !377
  call void @llvm.dbg.value(metadata i64 256, metadata !375, metadata !DIExpression()), !dbg !377
  ret i32 %error.1.2, !dbg !393
}

; Function Attrs: nounwind uwtable
define dso_local i32 @check_matrix([256 x double]* noundef %R, i64 noundef %x, i64 noundef %y, i64 noundef %o, double noundef %v) local_unnamed_addr #9 !dbg !394 {
entry:
  %a = alloca i32, align 4
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !409
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !398, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.value(metadata i64 %x, metadata !399, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.value(metadata i64 %y, metadata !400, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.value(metadata i64 %o, metadata !401, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.value(metadata double %v, metadata !402, metadata !DIExpression()), !dbg !412
  %a.0.a.0.a.0..sroa_cast = bitcast i32* %a to i8*, !dbg !413
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %a.0.a.0.a.0..sroa_cast), !dbg !413
  call void @llvm.dbg.value(metadata i32 0, metadata !403, metadata !DIExpression()), !dbg !412
  store i32 0, i32* %a, align 4, !dbg !414, !tbaa !415
  call void @llvm.dbg.value(metadata i32 0, metadata !404, metadata !DIExpression()), !dbg !412
  %mul = mul nsw i64 %y, %x, !dbg !417
  %cmp = icmp eq i64 %mul, 1, !dbg !418
  br i1 %cmp, label %if.then, label %if.end, !dbg !419

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !345, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata double %v, metadata !346, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i32 0, metadata !348, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i32 0, metadata !347, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i32 0, metadata !348, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i64 0, metadata !347, metadata !DIExpression()) #20, !dbg !420
  %arrayidx.peel.i = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 0, !dbg !422
  %0 = load double, double* %arrayidx.peel.i, align 8, !dbg !422, !tbaa !72
  %cmp1.peel.i = fcmp une double %0, %v, !dbg !423
  br i1 %cmp1.peel.i, label %if.end.peel.i, label %vector.ph, !dbg !424

if.end.peel.i:                                    ; preds = %if.then
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !425, !tbaa !359
  %call.peel.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %1, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 noundef 0, double noundef %0, double noundef %v) #22, !dbg !426
  call void @llvm.dbg.value(metadata i32 1, metadata !348, metadata !DIExpression()) #20, !dbg !420
  br label %vector.ph, !dbg !427

vector.ph:                                        ; preds = %if.then, %if.end.peel.i
  %error.1.peel.i = phi i32 [ 1, %if.end.peel.i ], [ 0, %if.then ], !dbg !420
  call void @llvm.dbg.value(metadata i32 %error.1.peel.i, metadata !348, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i64 1, metadata !347, metadata !DIExpression()) #20, !dbg !420
  %2 = insertelement <2 x i32> <i32 poison, i32 0>, i32 %error.1.peel.i, i64 0, !dbg !428
  %broadcast.splatinsert = insertelement <2 x double> poison, double %v, i64 0, !dbg !428
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !428
  br label %vector.body, !dbg !428

vector.body:                                      ; preds = %vector.body.1, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body.1 ]
  %vec.phi = phi <2 x i32> [ %2, %vector.ph ], [ %22, %vector.body.1 ]
  %vec.phi52 = phi <2 x i32> [ zeroinitializer, %vector.ph ], [ %23, %vector.body.1 ]
  %offset.idx = or i64 %index, 1
  %3 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %offset.idx, !dbg !422
  %4 = bitcast double* %3 to <2 x double>*, !dbg !422
  %wide.load = load <2 x double>, <2 x double>* %4, align 8, !dbg !422, !tbaa !72
  %5 = getelementptr inbounds double, double* %3, i64 2, !dbg !422
  %6 = bitcast double* %5 to <2 x double>*, !dbg !422
  %wide.load53 = load <2 x double>, <2 x double>* %6, align 8, !dbg !422, !tbaa !72
  %7 = fcmp une <2 x double> %wide.load, %broadcast.splat, !dbg !423
  %8 = fcmp une <2 x double> %wide.load53, %broadcast.splat, !dbg !423
  %9 = zext <2 x i1> %7 to <2 x i32>, !dbg !424
  %10 = zext <2 x i1> %8 to <2 x i32>, !dbg !424
  %11 = add <2 x i32> %vec.phi, %9, !dbg !424
  %12 = add <2 x i32> %vec.phi52, %10, !dbg !424
  %13 = icmp eq i64 %index, 248
  br i1 %13, label %for.body.i, label %vector.body.1, !llvm.loop !429

vector.body.1:                                    ; preds = %vector.body
  %offset.idx.1 = or i64 %index, 5
  %14 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %offset.idx.1, !dbg !422
  %15 = bitcast double* %14 to <2 x double>*, !dbg !422
  %wide.load.1 = load <2 x double>, <2 x double>* %15, align 8, !dbg !422, !tbaa !72
  %16 = getelementptr inbounds double, double* %14, i64 2, !dbg !422
  %17 = bitcast double* %16 to <2 x double>*, !dbg !422
  %wide.load53.1 = load <2 x double>, <2 x double>* %17, align 8, !dbg !422, !tbaa !72
  %18 = fcmp une <2 x double> %wide.load.1, %broadcast.splat, !dbg !423
  %19 = fcmp une <2 x double> %wide.load53.1, %broadcast.splat, !dbg !423
  %20 = zext <2 x i1> %18 to <2 x i32>, !dbg !424
  %21 = zext <2 x i1> %19 to <2 x i32>, !dbg !424
  %22 = add <2 x i32> %11, %20, !dbg !424
  %23 = add <2 x i32> %12, %21, !dbg !424
  %index.next.1 = add nuw nsw i64 %index, 8
  br label %vector.body

for.body.i:                                       ; preds = %vector.body
  %bin.rdx = add <2 x i32> %12, %11, !dbg !428
  %24 = call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %bin.rdx), !dbg !428
  call void @llvm.dbg.value(metadata i32 %24, metadata !348, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i64 253, metadata !347, metadata !DIExpression()) #20, !dbg !420
  %arrayidx.i = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 253, !dbg !422
  %25 = load double, double* %arrayidx.i, align 8, !dbg !422, !tbaa !72
  %cmp1.i = fcmp une double %25, %v, !dbg !423
  %inc.i = zext i1 %cmp1.i to i32, !dbg !424
  %error.1.i = add nuw nsw i32 %24, %inc.i, !dbg !424
  call void @llvm.dbg.value(metadata i32 %error.1.i, metadata !348, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i64 254, metadata !347, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i32 %error.1.i, metadata !348, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i64 254, metadata !347, metadata !DIExpression()) #20, !dbg !420
  %arrayidx.i.1 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 254, !dbg !422
  %26 = load double, double* %arrayidx.i.1, align 8, !dbg !422, !tbaa !72
  %cmp1.i.1 = fcmp une double %26, %v, !dbg !423
  %inc.i.1 = zext i1 %cmp1.i.1 to i32, !dbg !424
  %error.1.i.1 = add nuw nsw i32 %error.1.i, %inc.i.1, !dbg !424
  call void @llvm.dbg.value(metadata i32 %error.1.i.1, metadata !348, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i64 255, metadata !347, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i32 %error.1.i.1, metadata !348, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i64 255, metadata !347, metadata !DIExpression()) #20, !dbg !420
  %arrayidx.i.2 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 255, !dbg !422
  %27 = load double, double* %arrayidx.i.2, align 8, !dbg !422, !tbaa !72
  %cmp1.i.2 = fcmp une double %27, %v, !dbg !423
  %inc.i.2 = zext i1 %cmp1.i.2 to i32, !dbg !424
  %error.1.i.2 = add nuw nsw i32 %error.1.i.1, %inc.i.2, !dbg !424
  call void @llvm.dbg.value(metadata i32 %error.1.i.2, metadata !348, metadata !DIExpression()) #20, !dbg !420
  call void @llvm.dbg.value(metadata i64 256, metadata !347, metadata !DIExpression()) #20, !dbg !420
  br label %cleanup, !dbg !431

if.end:                                           ; preds = %entry
  %cmp1 = icmp sgt i64 %x, %y, !dbg !432
  br i1 %cmp1, label %if.then2.tf, label %if.else.tf, !dbg !433

if.then2.tf:                                      ; preds = %if.end
  %div = sdiv i64 %x, 2, !dbg !434
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !435

det.achd:                                         ; preds = %if.then2.tf
  %call3 = tail call i32 @check_matrix([256 x double]* noundef %R, i64 noundef %div, i64 noundef %y, i64 noundef %o, double noundef %v), !dbg !435
  call void @llvm.dbg.value(metadata i32 %call3, metadata !403, metadata !DIExpression()), !dbg !412
  store i32 %call3, i32* %a, align 4, !dbg !436, !tbaa !415
  reattach within %syncreg, label %det.cont, !dbg !436

det.cont:                                         ; preds = %det.achd, %if.then2.tf
  %mul5 = mul nsw i64 %div, %o, !dbg !437
  %add.ptr = getelementptr inbounds [256 x double], [256 x double]* %R, i64 %mul5, !dbg !438
  %add = add nsw i64 %x, 1, !dbg !439
  %div6 = sdiv i64 %add, 2, !dbg !440
  %call7 = tail call i32 @check_matrix([256 x double]* noundef %add.ptr, i64 noundef %div6, i64 noundef %y, i64 noundef %o, double noundef %v), !dbg !441
  call void @llvm.dbg.value(metadata i32 %call7, metadata !404, metadata !DIExpression()), !dbg !412
  sync within %syncreg, label %if.end18, !dbg !442

if.else.tf:                                       ; preds = %if.end
  %div8 = sdiv i64 %y, 2, !dbg !443
  detach within %syncreg, label %det.achd9, label %det.cont11, !dbg !445

det.achd9:                                        ; preds = %if.else.tf
  %call10 = tail call i32 @check_matrix([256 x double]* noundef %R, i64 noundef %x, i64 noundef %div8, i64 noundef %o, double noundef %v), !dbg !445
  call void @llvm.dbg.value(metadata i32 %call10, metadata !403, metadata !DIExpression()), !dbg !412
  store i32 %call10, i32* %a, align 4, !dbg !446, !tbaa !415
  reattach within %syncreg, label %det.cont11, !dbg !446

det.cont11:                                       ; preds = %det.achd9, %if.else.tf
  %add.ptr13 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 %div8, !dbg !447
  %add14 = add nsw i64 %y, 1, !dbg !448
  %div15 = sdiv i64 %add14, 2, !dbg !449
  %call16 = tail call i32 @check_matrix([256 x double]* noundef %add.ptr13, i64 noundef %x, i64 noundef %div15, i64 noundef %o, double noundef %v), !dbg !450
  call void @llvm.dbg.value(metadata i32 %call16, metadata !404, metadata !DIExpression()), !dbg !412
  sync within %syncreg, label %if.end18, !dbg !451

if.end18:                                         ; preds = %det.cont11, %det.cont
  %b.0 = phi i32 [ %call7, %det.cont ], [ %call16, %det.cont11 ], !dbg !452
  call void @llvm.dbg.value(metadata i32 %b.0, metadata !404, metadata !DIExpression()), !dbg !412
  %a.0.load = load i32, i32* %a, align 4, !dbg !453
  call void @llvm.dbg.value(metadata i32 %a.0.load, metadata !403, metadata !DIExpression()), !dbg !412
  %add19 = add nsw i32 %a.0.load, %b.0, !dbg !454
  call void @llvm.dbg.value(metadata i32 %add19, metadata !408, metadata !DIExpression()), !dbg !412
  br label %cleanup

cleanup:                                          ; preds = %for.body.i, %if.end18
  %retval.0 = phi i32 [ %add19, %if.end18 ], [ %error.1.i.2, %for.body.i ], !dbg !412
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %a.0.a.0.a.0..sroa_cast), !dbg !431
  ret i32 %retval.0, !dbg !431
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind uwtable
define dso_local i64 @add_block([256 x double]* nocapture noundef readonly %T, [256 x double]* nocapture noundef %R) local_unnamed_addr #10 !dbg !455 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %T, metadata !459, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !460, metadata !DIExpression()), !dbg !462
  call void @llvm.dbg.value(metadata i64 0, metadata !461, metadata !DIExpression()), !dbg !462
  br label %for.body, !dbg !463

for.body:                                         ; preds = %entry, %for.body
  %i.034 = phi i64 [ 0, %entry ], [ %add17, %for.body ]
  call void @llvm.dbg.value(metadata i64 %i.034, metadata !461, metadata !DIExpression()), !dbg !462
  %arrayidx = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %i.034, !dbg !465
  %0 = load double, double* %arrayidx, align 8, !dbg !465, !tbaa !72
  %arrayidx1 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %i.034, !dbg !468
  %1 = load double, double* %arrayidx1, align 8, !dbg !469, !tbaa !72
  %add = fadd double %0, %1, !dbg !469
  store double %add, double* %arrayidx1, align 8, !dbg !469, !tbaa !72
  %add2 = or i64 %i.034, 1, !dbg !470
  %arrayidx3 = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %add2, !dbg !471
  %2 = load double, double* %arrayidx3, align 8, !dbg !471, !tbaa !72
  %arrayidx5 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %add2, !dbg !472
  %3 = load double, double* %arrayidx5, align 8, !dbg !473, !tbaa !72
  %add6 = fadd double %2, %3, !dbg !473
  store double %add6, double* %arrayidx5, align 8, !dbg !473, !tbaa !72
  %add7 = or i64 %i.034, 2, !dbg !474
  %arrayidx8 = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %add7, !dbg !475
  %4 = load double, double* %arrayidx8, align 8, !dbg !475, !tbaa !72
  %arrayidx10 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %add7, !dbg !476
  %5 = load double, double* %arrayidx10, align 8, !dbg !477, !tbaa !72
  %add11 = fadd double %4, %5, !dbg !477
  store double %add11, double* %arrayidx10, align 8, !dbg !477, !tbaa !72
  %add12 = or i64 %i.034, 3, !dbg !478
  %arrayidx13 = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %add12, !dbg !479
  %6 = load double, double* %arrayidx13, align 8, !dbg !479, !tbaa !72
  %arrayidx15 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %add12, !dbg !480
  %7 = load double, double* %arrayidx15, align 8, !dbg !481, !tbaa !72
  %add16 = fadd double %6, %7, !dbg !481
  store double %add16, double* %arrayidx15, align 8, !dbg !481, !tbaa !72
  %add17 = add nuw nsw i64 %i.034, 4, !dbg !482
  call void @llvm.dbg.value(metadata i64 %add17, metadata !461, metadata !DIExpression()), !dbg !462
  %cmp = icmp ult i64 %i.034, 252, !dbg !483
  br i1 %cmp, label %for.body, label %for.end, !dbg !463, !llvm.loop !484

for.end:                                          ; preds = %for.body
  ret i64 256, !dbg !486
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind uwtable writeonly
define dso_local void @init_block([256 x double]* nocapture noundef writeonly %R, double noundef %v) local_unnamed_addr #11 !dbg !487 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !491, metadata !DIExpression()), !dbg !494
  call void @llvm.dbg.value(metadata double %v, metadata !492, metadata !DIExpression()), !dbg !494
  call void @llvm.dbg.value(metadata i32 0, metadata !493, metadata !DIExpression()), !dbg !494
  %broadcast.splatinsert = insertelement <2 x double> poison, double %v, i64 0, !dbg !495
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !495
  %0 = bitcast [256 x double]* %R to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %0, align 8, !dbg !497, !tbaa !72
  %1 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 2, !dbg !497
  %2 = bitcast double* %1 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %2, align 8, !dbg !497, !tbaa !72
  %3 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 4, !dbg !499
  %4 = bitcast double* %3 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %4, align 8, !dbg !497, !tbaa !72
  %5 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 6, !dbg !497
  %6 = bitcast double* %5 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %6, align 8, !dbg !497, !tbaa !72
  %7 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 8, !dbg !499
  %8 = bitcast double* %7 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %8, align 8, !dbg !497, !tbaa !72
  %9 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 10, !dbg !497
  %10 = bitcast double* %9 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %10, align 8, !dbg !497, !tbaa !72
  %11 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 12, !dbg !499
  %12 = bitcast double* %11 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %12, align 8, !dbg !497, !tbaa !72
  %13 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 14, !dbg !497
  %14 = bitcast double* %13 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %14, align 8, !dbg !497, !tbaa !72
  %15 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 16, !dbg !499
  %16 = bitcast double* %15 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %16, align 8, !dbg !497, !tbaa !72
  %17 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 18, !dbg !497
  %18 = bitcast double* %17 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %18, align 8, !dbg !497, !tbaa !72
  %19 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 20, !dbg !499
  %20 = bitcast double* %19 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %20, align 8, !dbg !497, !tbaa !72
  %21 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 22, !dbg !497
  %22 = bitcast double* %21 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %22, align 8, !dbg !497, !tbaa !72
  %23 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 24, !dbg !499
  %24 = bitcast double* %23 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %24, align 8, !dbg !497, !tbaa !72
  %25 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 26, !dbg !497
  %26 = bitcast double* %25 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %26, align 8, !dbg !497, !tbaa !72
  %27 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 28, !dbg !499
  %28 = bitcast double* %27 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %28, align 8, !dbg !497, !tbaa !72
  %29 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 30, !dbg !497
  %30 = bitcast double* %29 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %30, align 8, !dbg !497, !tbaa !72
  %31 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 32, !dbg !499
  %32 = bitcast double* %31 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %32, align 8, !dbg !497, !tbaa !72
  %33 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 34, !dbg !497
  %34 = bitcast double* %33 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %34, align 8, !dbg !497, !tbaa !72
  %35 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 36, !dbg !499
  %36 = bitcast double* %35 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %36, align 8, !dbg !497, !tbaa !72
  %37 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 38, !dbg !497
  %38 = bitcast double* %37 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %38, align 8, !dbg !497, !tbaa !72
  %39 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 40, !dbg !499
  %40 = bitcast double* %39 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %40, align 8, !dbg !497, !tbaa !72
  %41 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 42, !dbg !497
  %42 = bitcast double* %41 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %42, align 8, !dbg !497, !tbaa !72
  %43 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 44, !dbg !499
  %44 = bitcast double* %43 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %44, align 8, !dbg !497, !tbaa !72
  %45 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 46, !dbg !497
  %46 = bitcast double* %45 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %46, align 8, !dbg !497, !tbaa !72
  %47 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 48, !dbg !499
  %48 = bitcast double* %47 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %48, align 8, !dbg !497, !tbaa !72
  %49 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 50, !dbg !497
  %50 = bitcast double* %49 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %50, align 8, !dbg !497, !tbaa !72
  %51 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 52, !dbg !499
  %52 = bitcast double* %51 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %52, align 8, !dbg !497, !tbaa !72
  %53 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 54, !dbg !497
  %54 = bitcast double* %53 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %54, align 8, !dbg !497, !tbaa !72
  %55 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 56, !dbg !499
  %56 = bitcast double* %55 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %56, align 8, !dbg !497, !tbaa !72
  %57 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 58, !dbg !497
  %58 = bitcast double* %57 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %58, align 8, !dbg !497, !tbaa !72
  %59 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 60, !dbg !499
  %60 = bitcast double* %59 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %60, align 8, !dbg !497, !tbaa !72
  %61 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 62, !dbg !497
  %62 = bitcast double* %61 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %62, align 8, !dbg !497, !tbaa !72
  %63 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 64, !dbg !499
  %64 = bitcast double* %63 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %64, align 8, !dbg !497, !tbaa !72
  %65 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 66, !dbg !497
  %66 = bitcast double* %65 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %66, align 8, !dbg !497, !tbaa !72
  %67 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 68, !dbg !499
  %68 = bitcast double* %67 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %68, align 8, !dbg !497, !tbaa !72
  %69 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 70, !dbg !497
  %70 = bitcast double* %69 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %70, align 8, !dbg !497, !tbaa !72
  %71 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 72, !dbg !499
  %72 = bitcast double* %71 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %72, align 8, !dbg !497, !tbaa !72
  %73 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 74, !dbg !497
  %74 = bitcast double* %73 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %74, align 8, !dbg !497, !tbaa !72
  %75 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 76, !dbg !499
  %76 = bitcast double* %75 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %76, align 8, !dbg !497, !tbaa !72
  %77 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 78, !dbg !497
  %78 = bitcast double* %77 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %78, align 8, !dbg !497, !tbaa !72
  %79 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 80, !dbg !499
  %80 = bitcast double* %79 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %80, align 8, !dbg !497, !tbaa !72
  %81 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 82, !dbg !497
  %82 = bitcast double* %81 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %82, align 8, !dbg !497, !tbaa !72
  %83 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 84, !dbg !499
  %84 = bitcast double* %83 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %84, align 8, !dbg !497, !tbaa !72
  %85 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 86, !dbg !497
  %86 = bitcast double* %85 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %86, align 8, !dbg !497, !tbaa !72
  %87 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 88, !dbg !499
  %88 = bitcast double* %87 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %88, align 8, !dbg !497, !tbaa !72
  %89 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 90, !dbg !497
  %90 = bitcast double* %89 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %90, align 8, !dbg !497, !tbaa !72
  %91 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 92, !dbg !499
  %92 = bitcast double* %91 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %92, align 8, !dbg !497, !tbaa !72
  %93 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 94, !dbg !497
  %94 = bitcast double* %93 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %94, align 8, !dbg !497, !tbaa !72
  %95 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 96, !dbg !499
  %96 = bitcast double* %95 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %96, align 8, !dbg !497, !tbaa !72
  %97 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 98, !dbg !497
  %98 = bitcast double* %97 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %98, align 8, !dbg !497, !tbaa !72
  %99 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 100, !dbg !499
  %100 = bitcast double* %99 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %100, align 8, !dbg !497, !tbaa !72
  %101 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 102, !dbg !497
  %102 = bitcast double* %101 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %102, align 8, !dbg !497, !tbaa !72
  %103 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 104, !dbg !499
  %104 = bitcast double* %103 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %104, align 8, !dbg !497, !tbaa !72
  %105 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 106, !dbg !497
  %106 = bitcast double* %105 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %106, align 8, !dbg !497, !tbaa !72
  %107 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 108, !dbg !499
  %108 = bitcast double* %107 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %108, align 8, !dbg !497, !tbaa !72
  %109 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 110, !dbg !497
  %110 = bitcast double* %109 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %110, align 8, !dbg !497, !tbaa !72
  %111 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 112, !dbg !499
  %112 = bitcast double* %111 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %112, align 8, !dbg !497, !tbaa !72
  %113 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 114, !dbg !497
  %114 = bitcast double* %113 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %114, align 8, !dbg !497, !tbaa !72
  %115 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 116, !dbg !499
  %116 = bitcast double* %115 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %116, align 8, !dbg !497, !tbaa !72
  %117 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 118, !dbg !497
  %118 = bitcast double* %117 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %118, align 8, !dbg !497, !tbaa !72
  %119 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 120, !dbg !499
  %120 = bitcast double* %119 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %120, align 8, !dbg !497, !tbaa !72
  %121 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 122, !dbg !497
  %122 = bitcast double* %121 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %122, align 8, !dbg !497, !tbaa !72
  %123 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 124, !dbg !499
  %124 = bitcast double* %123 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %124, align 8, !dbg !497, !tbaa !72
  %125 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 126, !dbg !497
  %126 = bitcast double* %125 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %126, align 8, !dbg !497, !tbaa !72
  %127 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 128, !dbg !499
  %128 = bitcast double* %127 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %128, align 8, !dbg !497, !tbaa !72
  %129 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 130, !dbg !497
  %130 = bitcast double* %129 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %130, align 8, !dbg !497, !tbaa !72
  %131 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 132, !dbg !499
  %132 = bitcast double* %131 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %132, align 8, !dbg !497, !tbaa !72
  %133 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 134, !dbg !497
  %134 = bitcast double* %133 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %134, align 8, !dbg !497, !tbaa !72
  %135 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 136, !dbg !499
  %136 = bitcast double* %135 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %136, align 8, !dbg !497, !tbaa !72
  %137 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 138, !dbg !497
  %138 = bitcast double* %137 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %138, align 8, !dbg !497, !tbaa !72
  %139 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 140, !dbg !499
  %140 = bitcast double* %139 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %140, align 8, !dbg !497, !tbaa !72
  %141 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 142, !dbg !497
  %142 = bitcast double* %141 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %142, align 8, !dbg !497, !tbaa !72
  %143 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 144, !dbg !499
  %144 = bitcast double* %143 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %144, align 8, !dbg !497, !tbaa !72
  %145 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 146, !dbg !497
  %146 = bitcast double* %145 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %146, align 8, !dbg !497, !tbaa !72
  %147 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 148, !dbg !499
  %148 = bitcast double* %147 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %148, align 8, !dbg !497, !tbaa !72
  %149 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 150, !dbg !497
  %150 = bitcast double* %149 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %150, align 8, !dbg !497, !tbaa !72
  %151 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 152, !dbg !499
  %152 = bitcast double* %151 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %152, align 8, !dbg !497, !tbaa !72
  %153 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 154, !dbg !497
  %154 = bitcast double* %153 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %154, align 8, !dbg !497, !tbaa !72
  %155 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 156, !dbg !499
  %156 = bitcast double* %155 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %156, align 8, !dbg !497, !tbaa !72
  %157 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 158, !dbg !497
  %158 = bitcast double* %157 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %158, align 8, !dbg !497, !tbaa !72
  %159 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 160, !dbg !499
  %160 = bitcast double* %159 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %160, align 8, !dbg !497, !tbaa !72
  %161 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 162, !dbg !497
  %162 = bitcast double* %161 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %162, align 8, !dbg !497, !tbaa !72
  %163 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 164, !dbg !499
  %164 = bitcast double* %163 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %164, align 8, !dbg !497, !tbaa !72
  %165 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 166, !dbg !497
  %166 = bitcast double* %165 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %166, align 8, !dbg !497, !tbaa !72
  %167 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 168, !dbg !499
  %168 = bitcast double* %167 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %168, align 8, !dbg !497, !tbaa !72
  %169 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 170, !dbg !497
  %170 = bitcast double* %169 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %170, align 8, !dbg !497, !tbaa !72
  %171 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 172, !dbg !499
  %172 = bitcast double* %171 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %172, align 8, !dbg !497, !tbaa !72
  %173 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 174, !dbg !497
  %174 = bitcast double* %173 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %174, align 8, !dbg !497, !tbaa !72
  %175 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 176, !dbg !499
  %176 = bitcast double* %175 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %176, align 8, !dbg !497, !tbaa !72
  %177 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 178, !dbg !497
  %178 = bitcast double* %177 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %178, align 8, !dbg !497, !tbaa !72
  %179 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 180, !dbg !499
  %180 = bitcast double* %179 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %180, align 8, !dbg !497, !tbaa !72
  %181 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 182, !dbg !497
  %182 = bitcast double* %181 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %182, align 8, !dbg !497, !tbaa !72
  %183 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 184, !dbg !499
  %184 = bitcast double* %183 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %184, align 8, !dbg !497, !tbaa !72
  %185 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 186, !dbg !497
  %186 = bitcast double* %185 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %186, align 8, !dbg !497, !tbaa !72
  %187 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 188, !dbg !499
  %188 = bitcast double* %187 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %188, align 8, !dbg !497, !tbaa !72
  %189 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 190, !dbg !497
  %190 = bitcast double* %189 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %190, align 8, !dbg !497, !tbaa !72
  %191 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 192, !dbg !499
  %192 = bitcast double* %191 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %192, align 8, !dbg !497, !tbaa !72
  %193 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 194, !dbg !497
  %194 = bitcast double* %193 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %194, align 8, !dbg !497, !tbaa !72
  %195 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 196, !dbg !499
  %196 = bitcast double* %195 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %196, align 8, !dbg !497, !tbaa !72
  %197 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 198, !dbg !497
  %198 = bitcast double* %197 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %198, align 8, !dbg !497, !tbaa !72
  %199 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 200, !dbg !499
  %200 = bitcast double* %199 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %200, align 8, !dbg !497, !tbaa !72
  %201 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 202, !dbg !497
  %202 = bitcast double* %201 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %202, align 8, !dbg !497, !tbaa !72
  %203 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 204, !dbg !499
  %204 = bitcast double* %203 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %204, align 8, !dbg !497, !tbaa !72
  %205 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 206, !dbg !497
  %206 = bitcast double* %205 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %206, align 8, !dbg !497, !tbaa !72
  %207 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 208, !dbg !499
  %208 = bitcast double* %207 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %208, align 8, !dbg !497, !tbaa !72
  %209 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 210, !dbg !497
  %210 = bitcast double* %209 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %210, align 8, !dbg !497, !tbaa !72
  %211 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 212, !dbg !499
  %212 = bitcast double* %211 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %212, align 8, !dbg !497, !tbaa !72
  %213 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 214, !dbg !497
  %214 = bitcast double* %213 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %214, align 8, !dbg !497, !tbaa !72
  %215 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 216, !dbg !499
  %216 = bitcast double* %215 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %216, align 8, !dbg !497, !tbaa !72
  %217 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 218, !dbg !497
  %218 = bitcast double* %217 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %218, align 8, !dbg !497, !tbaa !72
  %219 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 220, !dbg !499
  %220 = bitcast double* %219 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %220, align 8, !dbg !497, !tbaa !72
  %221 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 222, !dbg !497
  %222 = bitcast double* %221 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %222, align 8, !dbg !497, !tbaa !72
  %223 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 224, !dbg !499
  %224 = bitcast double* %223 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %224, align 8, !dbg !497, !tbaa !72
  %225 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 226, !dbg !497
  %226 = bitcast double* %225 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %226, align 8, !dbg !497, !tbaa !72
  %227 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 228, !dbg !499
  %228 = bitcast double* %227 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %228, align 8, !dbg !497, !tbaa !72
  %229 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 230, !dbg !497
  %230 = bitcast double* %229 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %230, align 8, !dbg !497, !tbaa !72
  %231 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 232, !dbg !499
  %232 = bitcast double* %231 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %232, align 8, !dbg !497, !tbaa !72
  %233 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 234, !dbg !497
  %234 = bitcast double* %233 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %234, align 8, !dbg !497, !tbaa !72
  %235 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 236, !dbg !499
  %236 = bitcast double* %235 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %236, align 8, !dbg !497, !tbaa !72
  %237 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 238, !dbg !497
  %238 = bitcast double* %237 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %238, align 8, !dbg !497, !tbaa !72
  %239 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 240, !dbg !499
  %240 = bitcast double* %239 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %240, align 8, !dbg !497, !tbaa !72
  %241 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 242, !dbg !497
  %242 = bitcast double* %241 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %242, align 8, !dbg !497, !tbaa !72
  %243 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 244, !dbg !499
  %244 = bitcast double* %243 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %244, align 8, !dbg !497, !tbaa !72
  %245 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 246, !dbg !497
  %246 = bitcast double* %245 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %246, align 8, !dbg !497, !tbaa !72
  %247 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 248, !dbg !499
  %248 = bitcast double* %247 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %248, align 8, !dbg !497, !tbaa !72
  %249 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 250, !dbg !497
  %250 = bitcast double* %249 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %250, align 8, !dbg !497, !tbaa !72
  %251 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 252, !dbg !499
  %252 = bitcast double* %251 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %252, align 8, !dbg !497, !tbaa !72
  %253 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 254, !dbg !497
  %254 = bitcast double* %253 to <2 x double>*, !dbg !497
  store <2 x double> %broadcast.splat, <2 x double>* %254, align 8, !dbg !497, !tbaa !72
  ret void, !dbg !500
}

; Function Attrs: argmemonly nounwind uwtable writeonly
define dso_local void @init_matrix([256 x double]* noundef %R, i64 noundef %x, i64 noundef %y, i64 noundef %o, double noundef %v) local_unnamed_addr #12 !dbg !501 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !510
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !505, metadata !DIExpression()), !dbg !513
  call void @llvm.dbg.value(metadata i64 %x, metadata !506, metadata !DIExpression()), !dbg !513
  call void @llvm.dbg.value(metadata i64 %y, metadata !507, metadata !DIExpression()), !dbg !513
  call void @llvm.dbg.value(metadata i64 %o, metadata !508, metadata !DIExpression()), !dbg !513
  call void @llvm.dbg.value(metadata double %v, metadata !509, metadata !DIExpression()), !dbg !513
  %add = add nsw i64 %y, %x, !dbg !514
  %cmp = icmp eq i64 %add, 2, !dbg !516
  br i1 %cmp, label %vector.ph, label %if.end, !dbg !517

vector.ph:                                        ; preds = %entry
  %broadcast.splatinsert = insertelement <2 x double> poison, double %v, i64 0, !dbg !518
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !518
  %0 = bitcast [256 x double]* %R to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %0, align 8, !dbg !521, !tbaa !72
  %1 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 2, !dbg !521
  %2 = bitcast double* %1 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %2, align 8, !dbg !521, !tbaa !72
  %3 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 4, !dbg !522
  %4 = bitcast double* %3 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %4, align 8, !dbg !521, !tbaa !72
  %5 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 6, !dbg !521
  %6 = bitcast double* %5 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %6, align 8, !dbg !521, !tbaa !72
  %7 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 8, !dbg !522
  %8 = bitcast double* %7 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %8, align 8, !dbg !521, !tbaa !72
  %9 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 10, !dbg !521
  %10 = bitcast double* %9 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %10, align 8, !dbg !521, !tbaa !72
  %11 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 12, !dbg !522
  %12 = bitcast double* %11 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %12, align 8, !dbg !521, !tbaa !72
  %13 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 14, !dbg !521
  %14 = bitcast double* %13 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %14, align 8, !dbg !521, !tbaa !72
  %15 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 16, !dbg !522
  %16 = bitcast double* %15 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %16, align 8, !dbg !521, !tbaa !72
  %17 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 18, !dbg !521
  %18 = bitcast double* %17 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %18, align 8, !dbg !521, !tbaa !72
  %19 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 20, !dbg !522
  %20 = bitcast double* %19 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %20, align 8, !dbg !521, !tbaa !72
  %21 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 22, !dbg !521
  %22 = bitcast double* %21 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %22, align 8, !dbg !521, !tbaa !72
  %23 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 24, !dbg !522
  %24 = bitcast double* %23 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %24, align 8, !dbg !521, !tbaa !72
  %25 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 26, !dbg !521
  %26 = bitcast double* %25 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %26, align 8, !dbg !521, !tbaa !72
  %27 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 28, !dbg !522
  %28 = bitcast double* %27 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %28, align 8, !dbg !521, !tbaa !72
  %29 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 30, !dbg !521
  %30 = bitcast double* %29 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %30, align 8, !dbg !521, !tbaa !72
  %31 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 32, !dbg !522
  %32 = bitcast double* %31 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %32, align 8, !dbg !521, !tbaa !72
  %33 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 34, !dbg !521
  %34 = bitcast double* %33 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %34, align 8, !dbg !521, !tbaa !72
  %35 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 36, !dbg !522
  %36 = bitcast double* %35 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %36, align 8, !dbg !521, !tbaa !72
  %37 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 38, !dbg !521
  %38 = bitcast double* %37 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %38, align 8, !dbg !521, !tbaa !72
  %39 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 40, !dbg !522
  %40 = bitcast double* %39 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %40, align 8, !dbg !521, !tbaa !72
  %41 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 42, !dbg !521
  %42 = bitcast double* %41 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %42, align 8, !dbg !521, !tbaa !72
  %43 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 44, !dbg !522
  %44 = bitcast double* %43 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %44, align 8, !dbg !521, !tbaa !72
  %45 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 46, !dbg !521
  %46 = bitcast double* %45 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %46, align 8, !dbg !521, !tbaa !72
  %47 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 48, !dbg !522
  %48 = bitcast double* %47 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %48, align 8, !dbg !521, !tbaa !72
  %49 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 50, !dbg !521
  %50 = bitcast double* %49 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %50, align 8, !dbg !521, !tbaa !72
  %51 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 52, !dbg !522
  %52 = bitcast double* %51 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %52, align 8, !dbg !521, !tbaa !72
  %53 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 54, !dbg !521
  %54 = bitcast double* %53 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %54, align 8, !dbg !521, !tbaa !72
  %55 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 56, !dbg !522
  %56 = bitcast double* %55 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %56, align 8, !dbg !521, !tbaa !72
  %57 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 58, !dbg !521
  %58 = bitcast double* %57 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %58, align 8, !dbg !521, !tbaa !72
  %59 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 60, !dbg !522
  %60 = bitcast double* %59 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %60, align 8, !dbg !521, !tbaa !72
  %61 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 62, !dbg !521
  %62 = bitcast double* %61 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %62, align 8, !dbg !521, !tbaa !72
  %63 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 64, !dbg !522
  %64 = bitcast double* %63 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %64, align 8, !dbg !521, !tbaa !72
  %65 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 66, !dbg !521
  %66 = bitcast double* %65 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %66, align 8, !dbg !521, !tbaa !72
  %67 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 68, !dbg !522
  %68 = bitcast double* %67 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %68, align 8, !dbg !521, !tbaa !72
  %69 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 70, !dbg !521
  %70 = bitcast double* %69 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %70, align 8, !dbg !521, !tbaa !72
  %71 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 72, !dbg !522
  %72 = bitcast double* %71 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %72, align 8, !dbg !521, !tbaa !72
  %73 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 74, !dbg !521
  %74 = bitcast double* %73 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %74, align 8, !dbg !521, !tbaa !72
  %75 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 76, !dbg !522
  %76 = bitcast double* %75 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %76, align 8, !dbg !521, !tbaa !72
  %77 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 78, !dbg !521
  %78 = bitcast double* %77 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %78, align 8, !dbg !521, !tbaa !72
  %79 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 80, !dbg !522
  %80 = bitcast double* %79 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %80, align 8, !dbg !521, !tbaa !72
  %81 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 82, !dbg !521
  %82 = bitcast double* %81 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %82, align 8, !dbg !521, !tbaa !72
  %83 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 84, !dbg !522
  %84 = bitcast double* %83 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %84, align 8, !dbg !521, !tbaa !72
  %85 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 86, !dbg !521
  %86 = bitcast double* %85 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %86, align 8, !dbg !521, !tbaa !72
  %87 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 88, !dbg !522
  %88 = bitcast double* %87 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %88, align 8, !dbg !521, !tbaa !72
  %89 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 90, !dbg !521
  %90 = bitcast double* %89 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %90, align 8, !dbg !521, !tbaa !72
  %91 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 92, !dbg !522
  %92 = bitcast double* %91 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %92, align 8, !dbg !521, !tbaa !72
  %93 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 94, !dbg !521
  %94 = bitcast double* %93 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %94, align 8, !dbg !521, !tbaa !72
  %95 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 96, !dbg !522
  %96 = bitcast double* %95 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %96, align 8, !dbg !521, !tbaa !72
  %97 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 98, !dbg !521
  %98 = bitcast double* %97 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %98, align 8, !dbg !521, !tbaa !72
  %99 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 100, !dbg !522
  %100 = bitcast double* %99 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %100, align 8, !dbg !521, !tbaa !72
  %101 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 102, !dbg !521
  %102 = bitcast double* %101 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %102, align 8, !dbg !521, !tbaa !72
  %103 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 104, !dbg !522
  %104 = bitcast double* %103 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %104, align 8, !dbg !521, !tbaa !72
  %105 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 106, !dbg !521
  %106 = bitcast double* %105 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %106, align 8, !dbg !521, !tbaa !72
  %107 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 108, !dbg !522
  %108 = bitcast double* %107 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %108, align 8, !dbg !521, !tbaa !72
  %109 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 110, !dbg !521
  %110 = bitcast double* %109 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %110, align 8, !dbg !521, !tbaa !72
  %111 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 112, !dbg !522
  %112 = bitcast double* %111 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %112, align 8, !dbg !521, !tbaa !72
  %113 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 114, !dbg !521
  %114 = bitcast double* %113 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %114, align 8, !dbg !521, !tbaa !72
  %115 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 116, !dbg !522
  %116 = bitcast double* %115 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %116, align 8, !dbg !521, !tbaa !72
  %117 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 118, !dbg !521
  %118 = bitcast double* %117 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %118, align 8, !dbg !521, !tbaa !72
  %119 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 120, !dbg !522
  %120 = bitcast double* %119 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %120, align 8, !dbg !521, !tbaa !72
  %121 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 122, !dbg !521
  %122 = bitcast double* %121 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %122, align 8, !dbg !521, !tbaa !72
  %123 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 124, !dbg !522
  %124 = bitcast double* %123 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %124, align 8, !dbg !521, !tbaa !72
  %125 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 126, !dbg !521
  %126 = bitcast double* %125 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %126, align 8, !dbg !521, !tbaa !72
  %127 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 128, !dbg !522
  %128 = bitcast double* %127 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %128, align 8, !dbg !521, !tbaa !72
  %129 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 130, !dbg !521
  %130 = bitcast double* %129 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %130, align 8, !dbg !521, !tbaa !72
  %131 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 132, !dbg !522
  %132 = bitcast double* %131 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %132, align 8, !dbg !521, !tbaa !72
  %133 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 134, !dbg !521
  %134 = bitcast double* %133 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %134, align 8, !dbg !521, !tbaa !72
  %135 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 136, !dbg !522
  %136 = bitcast double* %135 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %136, align 8, !dbg !521, !tbaa !72
  %137 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 138, !dbg !521
  %138 = bitcast double* %137 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %138, align 8, !dbg !521, !tbaa !72
  %139 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 140, !dbg !522
  %140 = bitcast double* %139 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %140, align 8, !dbg !521, !tbaa !72
  %141 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 142, !dbg !521
  %142 = bitcast double* %141 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %142, align 8, !dbg !521, !tbaa !72
  %143 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 144, !dbg !522
  %144 = bitcast double* %143 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %144, align 8, !dbg !521, !tbaa !72
  %145 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 146, !dbg !521
  %146 = bitcast double* %145 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %146, align 8, !dbg !521, !tbaa !72
  %147 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 148, !dbg !522
  %148 = bitcast double* %147 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %148, align 8, !dbg !521, !tbaa !72
  %149 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 150, !dbg !521
  %150 = bitcast double* %149 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %150, align 8, !dbg !521, !tbaa !72
  %151 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 152, !dbg !522
  %152 = bitcast double* %151 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %152, align 8, !dbg !521, !tbaa !72
  %153 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 154, !dbg !521
  %154 = bitcast double* %153 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %154, align 8, !dbg !521, !tbaa !72
  %155 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 156, !dbg !522
  %156 = bitcast double* %155 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %156, align 8, !dbg !521, !tbaa !72
  %157 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 158, !dbg !521
  %158 = bitcast double* %157 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %158, align 8, !dbg !521, !tbaa !72
  %159 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 160, !dbg !522
  %160 = bitcast double* %159 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %160, align 8, !dbg !521, !tbaa !72
  %161 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 162, !dbg !521
  %162 = bitcast double* %161 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %162, align 8, !dbg !521, !tbaa !72
  %163 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 164, !dbg !522
  %164 = bitcast double* %163 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %164, align 8, !dbg !521, !tbaa !72
  %165 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 166, !dbg !521
  %166 = bitcast double* %165 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %166, align 8, !dbg !521, !tbaa !72
  %167 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 168, !dbg !522
  %168 = bitcast double* %167 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %168, align 8, !dbg !521, !tbaa !72
  %169 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 170, !dbg !521
  %170 = bitcast double* %169 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %170, align 8, !dbg !521, !tbaa !72
  %171 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 172, !dbg !522
  %172 = bitcast double* %171 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %172, align 8, !dbg !521, !tbaa !72
  %173 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 174, !dbg !521
  %174 = bitcast double* %173 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %174, align 8, !dbg !521, !tbaa !72
  %175 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 176, !dbg !522
  %176 = bitcast double* %175 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %176, align 8, !dbg !521, !tbaa !72
  %177 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 178, !dbg !521
  %178 = bitcast double* %177 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %178, align 8, !dbg !521, !tbaa !72
  %179 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 180, !dbg !522
  %180 = bitcast double* %179 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %180, align 8, !dbg !521, !tbaa !72
  %181 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 182, !dbg !521
  %182 = bitcast double* %181 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %182, align 8, !dbg !521, !tbaa !72
  %183 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 184, !dbg !522
  %184 = bitcast double* %183 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %184, align 8, !dbg !521, !tbaa !72
  %185 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 186, !dbg !521
  %186 = bitcast double* %185 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %186, align 8, !dbg !521, !tbaa !72
  %187 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 188, !dbg !522
  %188 = bitcast double* %187 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %188, align 8, !dbg !521, !tbaa !72
  %189 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 190, !dbg !521
  %190 = bitcast double* %189 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %190, align 8, !dbg !521, !tbaa !72
  %191 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 192, !dbg !522
  %192 = bitcast double* %191 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %192, align 8, !dbg !521, !tbaa !72
  %193 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 194, !dbg !521
  %194 = bitcast double* %193 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %194, align 8, !dbg !521, !tbaa !72
  %195 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 196, !dbg !522
  %196 = bitcast double* %195 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %196, align 8, !dbg !521, !tbaa !72
  %197 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 198, !dbg !521
  %198 = bitcast double* %197 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %198, align 8, !dbg !521, !tbaa !72
  %199 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 200, !dbg !522
  %200 = bitcast double* %199 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %200, align 8, !dbg !521, !tbaa !72
  %201 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 202, !dbg !521
  %202 = bitcast double* %201 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %202, align 8, !dbg !521, !tbaa !72
  %203 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 204, !dbg !522
  %204 = bitcast double* %203 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %204, align 8, !dbg !521, !tbaa !72
  %205 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 206, !dbg !521
  %206 = bitcast double* %205 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %206, align 8, !dbg !521, !tbaa !72
  %207 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 208, !dbg !522
  %208 = bitcast double* %207 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %208, align 8, !dbg !521, !tbaa !72
  %209 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 210, !dbg !521
  %210 = bitcast double* %209 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %210, align 8, !dbg !521, !tbaa !72
  %211 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 212, !dbg !522
  %212 = bitcast double* %211 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %212, align 8, !dbg !521, !tbaa !72
  %213 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 214, !dbg !521
  %214 = bitcast double* %213 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %214, align 8, !dbg !521, !tbaa !72
  %215 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 216, !dbg !522
  %216 = bitcast double* %215 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %216, align 8, !dbg !521, !tbaa !72
  %217 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 218, !dbg !521
  %218 = bitcast double* %217 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %218, align 8, !dbg !521, !tbaa !72
  %219 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 220, !dbg !522
  %220 = bitcast double* %219 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %220, align 8, !dbg !521, !tbaa !72
  %221 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 222, !dbg !521
  %222 = bitcast double* %221 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %222, align 8, !dbg !521, !tbaa !72
  %223 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 224, !dbg !522
  %224 = bitcast double* %223 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %224, align 8, !dbg !521, !tbaa !72
  %225 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 226, !dbg !521
  %226 = bitcast double* %225 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %226, align 8, !dbg !521, !tbaa !72
  %227 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 228, !dbg !522
  %228 = bitcast double* %227 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %228, align 8, !dbg !521, !tbaa !72
  %229 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 230, !dbg !521
  %230 = bitcast double* %229 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %230, align 8, !dbg !521, !tbaa !72
  %231 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 232, !dbg !522
  %232 = bitcast double* %231 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %232, align 8, !dbg !521, !tbaa !72
  %233 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 234, !dbg !521
  %234 = bitcast double* %233 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %234, align 8, !dbg !521, !tbaa !72
  %235 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 236, !dbg !522
  %236 = bitcast double* %235 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %236, align 8, !dbg !521, !tbaa !72
  %237 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 238, !dbg !521
  %238 = bitcast double* %237 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %238, align 8, !dbg !521, !tbaa !72
  %239 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 240, !dbg !522
  %240 = bitcast double* %239 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %240, align 8, !dbg !521, !tbaa !72
  %241 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 242, !dbg !521
  %242 = bitcast double* %241 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %242, align 8, !dbg !521, !tbaa !72
  %243 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 244, !dbg !522
  %244 = bitcast double* %243 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %244, align 8, !dbg !521, !tbaa !72
  %245 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 246, !dbg !521
  %246 = bitcast double* %245 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %246, align 8, !dbg !521, !tbaa !72
  %247 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 248, !dbg !522
  %248 = bitcast double* %247 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %248, align 8, !dbg !521, !tbaa !72
  %249 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 250, !dbg !521
  %250 = bitcast double* %249 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %250, align 8, !dbg !521, !tbaa !72
  %251 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 252, !dbg !522
  %252 = bitcast double* %251 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %252, align 8, !dbg !521, !tbaa !72
  %253 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 254, !dbg !521
  %254 = bitcast double* %253 to <2 x double>*, !dbg !521
  store <2 x double> %broadcast.splat, <2 x double>* %254, align 8, !dbg !521, !tbaa !72
  br label %return, !dbg !523

if.end:                                           ; preds = %entry
  %cmp1 = icmp sgt i64 %x, %y, !dbg !524
  br i1 %cmp1, label %if.then2.tf, label %if.else.tf, !dbg !525

if.then2.tf:                                      ; preds = %if.end
  %div = sdiv i64 %x, 2, !dbg !526
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !527

det.achd:                                         ; preds = %if.then2.tf
  tail call void @init_matrix([256 x double]* noundef %R, i64 noundef %div, i64 noundef %y, i64 noundef %o, double noundef %v), !dbg !527
  reattach within %syncreg, label %det.cont, !dbg !527

det.cont:                                         ; preds = %det.achd, %if.then2.tf
  %mul = mul nsw i64 %div, %o, !dbg !528
  %add4 = add nsw i64 %x, 1, !dbg !529
  %div5 = sdiv i64 %add4, 2, !dbg !530
  br label %if.end13, !dbg !531

if.else.tf:                                       ; preds = %if.end
  %div6 = sdiv i64 %y, 2, !dbg !532
  detach within %syncreg, label %det.achd7, label %det.cont8, !dbg !534

det.achd7:                                        ; preds = %if.else.tf
  tail call void @init_matrix([256 x double]* noundef %R, i64 noundef %x, i64 noundef %div6, i64 noundef %o, double noundef %v), !dbg !534
  reattach within %syncreg, label %det.cont8, !dbg !534

det.cont8:                                        ; preds = %det.achd7, %if.else.tf
  %add11 = add nsw i64 %y, 1, !dbg !535
  %div12 = sdiv i64 %add11, 2, !dbg !536
  br label %if.end13

if.end13:                                         ; preds = %det.cont8, %det.cont
  %div12.sink = phi i64 [ %div12, %det.cont8 ], [ %y, %det.cont ]
  %x.sink = phi i64 [ %x, %det.cont8 ], [ %div5, %det.cont ]
  %div6.pn = phi i64 [ %div6, %det.cont8 ], [ %mul, %det.cont ]
  %add.ptr10.sink = getelementptr inbounds [256 x double], [256 x double]* %R, i64 %div6.pn, !dbg !537
  tail call void @init_matrix([256 x double]* noundef %add.ptr10.sink, i64 noundef %x.sink, i64 noundef %div12.sink, i64 noundef %o, double noundef %v), !dbg !537
  sync within %syncreg, label %return, !dbg !538

return:                                           ; preds = %vector.ph, %if.end13
  ret void, !dbg !523
}

; Function Attrs: nounwind uwtable
define dso_local i32 @run(i64 noundef %x, i64 noundef %y, i64 noundef %z, i32 noundef %check, i32 noundef %round) local_unnamed_addr #9 !dbg !539 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !560
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i64 %x, metadata !543, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.value(metadata i64 %y, metadata !544, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.value(metadata i64 %z, metadata !545, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.value(metadata i32 %check, metadata !546, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.value(metadata i32 %round, metadata !547, metadata !DIExpression()), !dbg !561
  %mul = shl i64 %x, 11, !dbg !562
  %mul1 = mul i64 %mul, %y, !dbg !563
  %call = tail call noalias i8* @malloc(i64 noundef %mul1) #20, !dbg !564
  %0 = bitcast i8* %call to [256 x double]*, !dbg !565
  call void @llvm.dbg.value(metadata [256 x double]* %0, metadata !548, metadata !DIExpression()), !dbg !561
  %mul2 = shl i64 %y, 11, !dbg !566
  %mul3 = mul i64 %mul2, %z, !dbg !567
  %call4 = tail call noalias i8* @malloc(i64 noundef %mul3) #20, !dbg !568
  %1 = bitcast i8* %call4 to [256 x double]*, !dbg !569
  call void @llvm.dbg.value(metadata [256 x double]* %1, metadata !549, metadata !DIExpression()), !dbg !561
  %mul6 = mul i64 %mul, %z, !dbg !570
  %call7 = tail call noalias i8* @malloc(i64 noundef %mul6) #20, !dbg !571
  %2 = bitcast i8* %call7 to [256 x double]*, !dbg !572
  call void @llvm.dbg.value(metadata [256 x double]* %2, metadata !550, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.value(metadata i32 %check, metadata !552, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.value(metadata i32 0, metadata !553, metadata !DIExpression()), !dbg !573
  %cmp83 = icmp sgt i32 %round, 0, !dbg !574
  br i1 %cmp83, label %for.body.tf.lr.ph, label %for.cond.cleanup, !dbg !575

for.body.tf.lr.ph:                                ; preds = %entry
  %3 = bitcast %struct.timeval* %t1 to i8*
  %4 = bitcast %struct.timeval* %t2 to i8*
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1
  %tv_sec.i77 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0
  %tv_usec.i79 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1
  %tobool.not = icmp eq i32 %check, 0
  %mul18 = shl nsw i64 %y, 4
  %conv19 = sitofp i64 %mul18 to double
  %mul26 = shl nsw i64 %x, 4
  %mul30 = shl nsw i64 %z, 4
  br label %for.body.tf, !dbg !575

for.cond.cleanup:                                 ; preds = %if.end32, %entry
  tail call void @free(i8* noundef %call) #20, !dbg !576
  tail call void @free(i8* noundef %call4) #20, !dbg !577
  tail call void @free(i8* noundef %call7) #20, !dbg !578
  ret i32 0, !dbg !579

for.body.tf:                                      ; preds = %for.body.tf.lr.ph, %if.end32
  %r.084 = phi i32 [ 0, %for.body.tf.lr.ph ], [ %inc, %if.end32 ]
  call void @llvm.dbg.value(metadata i32 %r.084, metadata !553, metadata !DIExpression()), !dbg !573
  call void @llvm.dbg.value(metadata i32 %check, metadata !546, metadata !DIExpression()), !dbg !561
  detach within %syncreg, label %det.achd, label %det.cont.tf, !dbg !580

det.achd:                                         ; preds = %for.body.tf
  tail call void @init_matrix([256 x double]* noundef %0, i64 noundef %x, i64 noundef %y, i64 noundef %y, double noundef 1.000000e+00), !dbg !580
  reattach within %syncreg, label %det.cont.tf, !dbg !580

det.cont.tf:                                      ; preds = %for.body.tf, %det.achd
  detach within %syncreg, label %det.achd8, label %det.cont9, !dbg !581

det.achd8:                                        ; preds = %det.cont.tf
  tail call void @init_matrix([256 x double]* noundef %1, i64 noundef %y, i64 noundef %z, i64 noundef %z, double noundef 1.000000e+00), !dbg !581
  reattach within %syncreg, label %det.cont9, !dbg !581

det.cont9:                                        ; preds = %det.achd8, %det.cont.tf
  tail call void @init_matrix([256 x double]* noundef %2, i64 noundef %x, i64 noundef %z, i64 noundef %z, double noundef 0.000000e+00), !dbg !582
  sync within %syncreg, label %sync.continue, !dbg !583

sync.continue:                                    ; preds = %det.cont9
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #20, !dbg !584
  call void @llvm.dbg.declare(metadata %struct.timeval* %t1, metadata !555, metadata !DIExpression()), !dbg !585
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #20, !dbg !584
  call void @llvm.dbg.declare(metadata %struct.timeval* %t2, metadata !558, metadata !DIExpression()), !dbg !586
  %call10 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #20, !dbg !587
  %call11 = tail call fastcc i64 @multiply_matrix([256 x double]* noundef %0, i64 noundef %y, [256 x double]* noundef %1, i64 noundef %z, i64 noundef %x, i64 noundef %y, i64 noundef %z, [256 x double]* noundef %2, i64 noundef %z, i32 noundef 0), !dbg !588
  call void @llvm.dbg.value(metadata i64 %call11, metadata !551, metadata !DIExpression()), !dbg !561
  %call12 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #20, !dbg !589
  call void @llvm.dbg.value(metadata %struct.timeval* %t2, metadata !44, metadata !DIExpression()), !dbg !590
  %5 = load i64, i64* %tv_sec.i, align 8, !dbg !592, !tbaa !47
  %6 = load i64, i64* %tv_usec.i, align 8, !dbg !593, !tbaa !54
  call void @llvm.dbg.value(metadata %struct.timeval* %t1, metadata !44, metadata !DIExpression()), !dbg !594
  %7 = load i64, i64* %tv_sec.i77, align 8, !dbg !596, !tbaa !47
  %8 = load i64, i64* %tv_usec.i79, align 8, !dbg !597, !tbaa !54
  %reass.add = sub i64 %5, %7
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i = sub i64 %6, %8, !dbg !598
  %sub = add i64 %add.i, %reass.mul, !dbg !599
  %div = udiv i64 %sub, 1000, !dbg !600
  call void @llvm.dbg.value(metadata i64 %div, metadata !559, metadata !DIExpression()), !dbg !560
  %conv = uitofp i64 %div to double, !dbg !601
  %div15 = fdiv double %conv, 1.000000e+03, !dbg !602
  %call16 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), double noundef %div15), !dbg !603
  br i1 %tobool.not, label %if.else, label %if.end, !dbg !604

if.end:                                           ; preds = %sync.continue
  %puts76 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @str.24, i64 0, i64 0)), !dbg !605
  %call20 = tail call i32 @check_matrix([256 x double]* noundef %2, i64 noundef %x, i64 noundef %z, i64 noundef %z, double noundef %conv19), !dbg !608
  call void @llvm.dbg.value(metadata i32 %call20, metadata !546, metadata !DIExpression()), !dbg !561
  %tobool21.not = icmp eq i32 %call20, 0, !dbg !609
  br i1 %tobool21.not, label %if.else, label %if.then22, !dbg !611

if.then22:                                        ; preds = %if.end
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([14 x i8], [14 x i8]* @str, i64 0, i64 0)), !dbg !612
  %call24 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i32 noundef %call20), !dbg !614
  br label %if.end32, !dbg !615

if.else:                                          ; preds = %sync.continue, %if.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !616, !tbaa !359
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %9) #21, !dbg !618
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !619, !tbaa !359
  %call27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %11, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.7, i64 0, i64 0), i64 noundef %mul26) #21, !dbg !620
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !621, !tbaa !359
  %call29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %12, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.8, i64 0, i64 0), i64 noundef %mul18) #21, !dbg !622
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !623, !tbaa !359
  %call31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %13, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i64 0, i64 0), i64 noundef %mul30) #21, !dbg !624
  br label %if.end32

if.end32:                                         ; preds = %if.else, %if.then22
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #20, !dbg !625
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #20, !dbg !625
  %inc = add nuw nsw i32 %r.084, 1, !dbg !626
  call void @llvm.dbg.value(metadata i32 %inc, metadata !553, metadata !DIExpression()), !dbg !573
  %exitcond.not = icmp eq i32 %inc, %round, !dbg !574
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body.tf, !dbg !575, !llvm.loop !627
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #13

; Function Attrs: nofree nounwind
declare !dbg !629 dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #8

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc i64 @multiply_matrix([256 x double]* noundef %A, i64 noundef %oa, [256 x double]* noundef %B, i64 noundef %ob, i64 noundef %x, i64 noundef %y, i64 noundef %z, [256 x double]* noundef %R, i64 noundef %orr, i32 noundef %add) unnamed_addr #14 !dbg !642 {
entry:
  %_tmp1 = alloca i64, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !662
  call void @llvm.dbg.value(metadata [256 x double]* %A, metadata !646, metadata !DIExpression()), !dbg !665
  call void @llvm.dbg.value(metadata i64 %oa, metadata !647, metadata !DIExpression()), !dbg !665
  call void @llvm.dbg.value(metadata [256 x double]* %B, metadata !648, metadata !DIExpression()), !dbg !665
  call void @llvm.dbg.value(metadata i64 %ob, metadata !649, metadata !DIExpression()), !dbg !665
  call void @llvm.dbg.value(metadata i64 %x, metadata !650, metadata !DIExpression()), !dbg !665
  call void @llvm.dbg.value(metadata i64 %y, metadata !651, metadata !DIExpression()), !dbg !665
  call void @llvm.dbg.value(metadata i64 %z, metadata !652, metadata !DIExpression()), !dbg !665
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !653, metadata !DIExpression()), !dbg !665
  call void @llvm.dbg.value(metadata i64 %orr, metadata !654, metadata !DIExpression()), !dbg !665
  call void @llvm.dbg.value(metadata i32 %add, metadata !655, metadata !DIExpression()), !dbg !665
  %add1 = add nsw i64 %y, %x, !dbg !666
  %add2 = add nsw i64 %add1, %z, !dbg !667
  %cmp = icmp eq i64 %add2, 3, !dbg !668
  br i1 %cmp, label %if.then, label %if.end5, !dbg !669

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i64 0, metadata !656, metadata !DIExpression()), !dbg !670
  %tobool.not = icmp eq i32 %add, 0, !dbg !671
  br i1 %tobool.not, label %if.else, label %if.then3, !dbg !673

if.then3:                                         ; preds = %if.then
  %call = tail call i64 @mult_add_block([256 x double]* noundef %A, [256 x double]* noundef %B, [256 x double]* noundef %R), !dbg !674
  call void @llvm.dbg.value(metadata i64 %call, metadata !656, metadata !DIExpression()), !dbg !670
  br label %return, !dbg !675

if.else:                                          ; preds = %if.then
  %call4 = tail call i64 @multiply_block([256 x double]* noundef %A, [256 x double]* noundef %B, [256 x double]* noundef %R), !dbg !676
  call void @llvm.dbg.value(metadata i64 %call4, metadata !656, metadata !DIExpression()), !dbg !670
  br label %return

if.end5:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i64 0, metadata !659, metadata !DIExpression()), !dbg !665
  %_tmp1.0._tmp1.0._tmp1.0..sroa_cast = bitcast i64* %_tmp1 to i8*, !dbg !677
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %_tmp1.0._tmp1.0._tmp1.0..sroa_cast), !dbg !677
  call void @llvm.dbg.value(metadata i64 0, metadata !660, metadata !DIExpression()), !dbg !665
  store i64 0, i64* %_tmp1, align 8, !dbg !678, !tbaa !679
  call void @llvm.dbg.value(metadata i64 0, metadata !661, metadata !DIExpression()), !dbg !665
  %cmp6.not = icmp slt i64 %x, %y, !dbg !681
  %cmp7.not = icmp slt i64 %x, %z
  %or.cond = or i1 %cmp6.not, %cmp7.not, !dbg !682
  br i1 %or.cond, label %if.else17, label %if.then8.tf, !dbg !682

if.then8.tf:                                      ; preds = %if.end5
  %div = sdiv i64 %x, 2, !dbg !683
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !684

det.achd:                                         ; preds = %if.then8.tf
  %call9 = tail call fastcc i64 @multiply_matrix([256 x double]* noundef %A, i64 noundef %oa, [256 x double]* noundef %B, i64 noundef %ob, i64 noundef %div, i64 noundef %y, i64 noundef %z, [256 x double]* noundef %R, i64 noundef %orr, i32 noundef %add), !dbg !684
  call void @llvm.dbg.value(metadata i64 %call9, metadata !660, metadata !DIExpression()), !dbg !665
  store i64 %call9, i64* %_tmp1, align 8, !dbg !685, !tbaa !679
  reattach within %syncreg, label %det.cont, !dbg !685

det.cont:                                         ; preds = %det.achd, %if.then8.tf
  %mul = mul nsw i64 %div, %oa, !dbg !686
  %add.ptr = getelementptr inbounds [256 x double], [256 x double]* %A, i64 %mul, !dbg !687
  %add11 = add nsw i64 %x, 1, !dbg !688
  %div12 = sdiv i64 %add11, 2, !dbg !689
  %mul14 = mul nsw i64 %div, %orr, !dbg !690
  %add.ptr15 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 %mul14, !dbg !691
  %call16 = tail call fastcc i64 @multiply_matrix([256 x double]* noundef %add.ptr, i64 noundef %oa, [256 x double]* noundef %B, i64 noundef %ob, i64 noundef %div12, i64 noundef %y, i64 noundef %z, [256 x double]* noundef %add.ptr15, i64 noundef %orr, i32 noundef %add), !dbg !692
  call void @llvm.dbg.value(metadata i64 %call16, metadata !661, metadata !DIExpression()), !dbg !665
  br label %if.end45, !dbg !693

if.else17:                                        ; preds = %if.end5
  %cmp20 = icmp sgt i64 %y, %z
  %or.cond127 = and i1 %cmp6.not, %cmp20, !dbg !694
  br i1 %or.cond127, label %if.then21, label %if.else32.tf, !dbg !694

if.then21:                                        ; preds = %if.else17
  %div22 = sdiv i64 %y, 2, !dbg !697
  %add.ptr23 = getelementptr inbounds [256 x double], [256 x double]* %A, i64 %div22, !dbg !699
  %mul25 = mul nsw i64 %div22, %ob, !dbg !700
  %add.ptr26 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 %mul25, !dbg !701
  %add27 = add nsw i64 %y, 1, !dbg !702
  %div28 = sdiv i64 %add27, 2, !dbg !703
  %call29 = tail call fastcc i64 @multiply_matrix([256 x double]* noundef %add.ptr23, i64 noundef %oa, [256 x double]* noundef %add.ptr26, i64 noundef %ob, i64 noundef %x, i64 noundef %div28, i64 noundef %z, [256 x double]* noundef %R, i64 noundef %orr, i32 noundef %add), !dbg !704
  call void @llvm.dbg.value(metadata i64 %call29, metadata !660, metadata !DIExpression()), !dbg !665
  store i64 %call29, i64* %_tmp1, align 8, !dbg !705, !tbaa !679
  %call31 = tail call fastcc i64 @multiply_matrix([256 x double]* noundef %A, i64 noundef %oa, [256 x double]* noundef %B, i64 noundef %ob, i64 noundef %x, i64 noundef %div22, i64 noundef %z, [256 x double]* noundef %R, i64 noundef %orr, i32 noundef 1), !dbg !706
  call void @llvm.dbg.value(metadata i64 %call31, metadata !661, metadata !DIExpression()), !dbg !665
  br label %if.end45, !dbg !707

if.else32.tf:                                     ; preds = %if.else17
  %div33 = sdiv i64 %z, 2, !dbg !708
  detach within %syncreg, label %det.achd34, label %det.cont36, !dbg !710

det.achd34:                                       ; preds = %if.else32.tf
  %call35 = tail call fastcc i64 @multiply_matrix([256 x double]* noundef %A, i64 noundef %oa, [256 x double]* noundef %B, i64 noundef %ob, i64 noundef %x, i64 noundef %y, i64 noundef %div33, [256 x double]* noundef %R, i64 noundef %orr, i32 noundef %add), !dbg !710
  call void @llvm.dbg.value(metadata i64 %call35, metadata !660, metadata !DIExpression()), !dbg !665
  store i64 %call35, i64* %_tmp1, align 8, !dbg !711, !tbaa !679
  reattach within %syncreg, label %det.cont36, !dbg !711

det.cont36:                                       ; preds = %det.achd34, %if.else32.tf
  %add.ptr38 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 %div33, !dbg !712
  %add39 = add nsw i64 %z, 1, !dbg !713
  %div40 = sdiv i64 %add39, 2, !dbg !714
  %add.ptr42 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 %div33, !dbg !715
  %call43 = tail call fastcc i64 @multiply_matrix([256 x double]* noundef %A, i64 noundef %oa, [256 x double]* noundef %add.ptr38, i64 noundef %ob, i64 noundef %x, i64 noundef %y, i64 noundef %div40, [256 x double]* noundef %add.ptr42, i64 noundef %orr, i32 noundef %add), !dbg !716
  call void @llvm.dbg.value(metadata i64 %call43, metadata !661, metadata !DIExpression()), !dbg !665
  br label %if.end45

if.end45:                                         ; preds = %if.then21, %det.cont36, %det.cont
  %_tmp2.0 = phi i64 [ %call16, %det.cont ], [ %call31, %if.then21 ], [ %call43, %det.cont36 ], !dbg !717
  call void @llvm.dbg.value(metadata i64 %_tmp2.0, metadata !661, metadata !DIExpression()), !dbg !665
  sync within %syncreg, label %sync.continue, !dbg !718

sync.continue:                                    ; preds = %if.end45
  %_tmp1.0.load = load i64, i64* %_tmp1, align 8, !dbg !719
  call void @llvm.dbg.value(metadata i64 %_tmp1.0.load, metadata !660, metadata !DIExpression()), !dbg !665
  %add46 = add nsw i64 %_tmp1.0.load, %_tmp2.0, !dbg !720
  call void @llvm.dbg.value(metadata i64 %add46, metadata !659, metadata !DIExpression()), !dbg !665
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %_tmp1.0._tmp1.0._tmp1.0..sroa_cast), !dbg !721
  br label %return

return:                                           ; preds = %if.then3, %if.else, %sync.continue
  %retval.0 = phi i64 [ %add46, %sync.continue ], [ %call, %if.then3 ], [ %call4, %if.else ], !dbg !665
  ret i64 %retval.0, !dbg !721
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #8

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #15

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @usage() local_unnamed_addr #7 !dbg !722 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !725, !tbaa !359
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.10, i64 0, i64 0), i64 70, i64 1, %struct._IO_FILE* %0) #21, !dbg !726
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !727, !tbaa !359
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str.11, i64 0, i64 0), i64 91, i64 1, %struct._IO_FILE* %2) #21, !dbg !728
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !729, !tbaa !359
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.12, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %4) #21, !dbg !730
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !731, !tbaa !359
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.13, i64 0, i64 0), i64 9, i64 1, %struct._IO_FILE* %6) #21, !dbg !732
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !733, !tbaa !359
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.14, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %8) #21, !dbg !734
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !735, !tbaa !359
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.15, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %10) #21, !dbg !736
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !737, !tbaa !359
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.16, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %12) #21, !dbg !738
  ret i32 1, !dbg !739
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** noundef %argv) local_unnamed_addr #9 !dbg !740 {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %benchmark = alloca i32, align 4
  %help = alloca i32, align 4
  %check = alloca i32, align 4
  %round = alloca i32, align 4
  call void @llvm.dbg.value(metadata i32 %argc, metadata !746, metadata !DIExpression()), !dbg !756
  call void @llvm.dbg.value(metadata i8** %argv, metadata !747, metadata !DIExpression()), !dbg !756
  %0 = bitcast i32* %x to i8*, !dbg !757
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #20, !dbg !757
  %1 = bitcast i32* %y to i8*, !dbg !757
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #20, !dbg !757
  %2 = bitcast i32* %z to i8*, !dbg !757
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #20, !dbg !757
  %3 = bitcast i32* %benchmark to i8*, !dbg !757
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #20, !dbg !757
  %4 = bitcast i32* %help to i8*, !dbg !757
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #20, !dbg !757
  %5 = bitcast i32* %check to i8*, !dbg !757
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #20, !dbg !757
  %6 = bitcast i32* %round to i8*, !dbg !757
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #20, !dbg !757
  call void @llvm.dbg.value(metadata i32 128, metadata !748, metadata !DIExpression()), !dbg !756
  store i32 128, i32* %x, align 4, !dbg !758, !tbaa !415
  call void @llvm.dbg.value(metadata i32 128, metadata !749, metadata !DIExpression()), !dbg !756
  store i32 128, i32* %y, align 4, !dbg !759, !tbaa !415
  call void @llvm.dbg.value(metadata i32 128, metadata !750, metadata !DIExpression()), !dbg !756
  store i32 128, i32* %z, align 4, !dbg !760, !tbaa !415
  call void @llvm.dbg.value(metadata i32 0, metadata !754, metadata !DIExpression()), !dbg !756
  store i32 0, i32* %check, align 4, !dbg !761, !tbaa !415
  call void @llvm.dbg.value(metadata i32 1, metadata !755, metadata !DIExpression()), !dbg !756
  store i32 1, i32* %round, align 4, !dbg !762, !tbaa !415
  call void @llvm.dbg.value(metadata i32* %x, metadata !748, metadata !DIExpression(DW_OP_deref)), !dbg !756
  call void @llvm.dbg.value(metadata i32* %y, metadata !749, metadata !DIExpression(DW_OP_deref)), !dbg !756
  call void @llvm.dbg.value(metadata i32* %z, metadata !750, metadata !DIExpression(DW_OP_deref)), !dbg !756
  call void @llvm.dbg.value(metadata i32* %benchmark, metadata !751, metadata !DIExpression(DW_OP_deref)), !dbg !756
  call void @llvm.dbg.value(metadata i32* %help, metadata !752, metadata !DIExpression(DW_OP_deref)), !dbg !756
  call void @llvm.dbg.value(metadata i32* %check, metadata !754, metadata !DIExpression(DW_OP_deref)), !dbg !756
  call void @llvm.dbg.value(metadata i32* %round, metadata !755, metadata !DIExpression(DW_OP_deref)), !dbg !756
  call void (i32, i8**, i8**, i32*, ...) @get_options(i32 noundef %argc, i8** noundef %argv, i8** noundef getelementptr inbounds ([8 x i8*], [8 x i8*]* @specifiers, i64 0, i64 0), i32* noundef getelementptr inbounds ([8 x i32], [8 x i32]* @opt_types, i64 0, i64 0), i32* noundef nonnull %x, i32* noundef nonnull %y, i32* noundef nonnull %z, i32* noundef nonnull %check, i32* noundef nonnull %benchmark, i32* noundef nonnull %help, i32* noundef nonnull %round) #20, !dbg !763
  %7 = load i32, i32* %help, align 4, !dbg !764, !tbaa !415
  call void @llvm.dbg.value(metadata i32 %7, metadata !752, metadata !DIExpression()), !dbg !756
  %tobool.not = icmp eq i32 %7, 0, !dbg !764
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !766

if.then:                                          ; preds = %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !767, !tbaa !359
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.10, i64 0, i64 0), i64 70, i64 1, %struct._IO_FILE* %8) #22, !dbg !769
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !770, !tbaa !359
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str.11, i64 0, i64 0), i64 91, i64 1, %struct._IO_FILE* %10) #22, !dbg !771
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !772, !tbaa !359
  %13 = call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.12, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %12) #22, !dbg !773
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !774, !tbaa !359
  %15 = call i64 @fwrite(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.13, i64 0, i64 0), i64 9, i64 1, %struct._IO_FILE* %14) #22, !dbg !775
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !776, !tbaa !359
  %17 = call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.14, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %16) #22, !dbg !777
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !778, !tbaa !359
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.15, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %18) #22, !dbg !779
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !780, !tbaa !359
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.16, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %20) #22, !dbg !781
  br label %cleanup, !dbg !782

if.end:                                           ; preds = %entry
  %22 = load i32, i32* %benchmark, align 4, !dbg !783, !tbaa !415
  call void @llvm.dbg.value(metadata i32 %22, metadata !751, metadata !DIExpression()), !dbg !756
  %switch.tableidx = add i32 %22, -1, !dbg !785
  %23 = icmp ult i32 %switch.tableidx, 3, !dbg !785
  %24 = sext i32 %switch.tableidx to i64, !dbg !785
  %switch.gep = getelementptr inbounds [3 x i32], [3 x i32]* @switch.table.main.26, i64 0, i64 %24, !dbg !785
  %25 = sext i32 %switch.tableidx to i64, !dbg !785
  %switch.gep29 = getelementptr inbounds [3 x i32], [3 x i32]* @switch.table.main.26, i64 0, i64 %25, !dbg !785
  %26 = sext i32 %switch.tableidx to i64, !dbg !785
  %switch.gep31 = getelementptr inbounds [3 x i32], [3 x i32]* @switch.table.main.26, i64 0, i64 %26, !dbg !785
  %.in = select i1 %23, i32* %switch.gep, i32* %z, !dbg !785
  %.in33 = select i1 %23, i32* %switch.gep29, i32* %y, !dbg !785
  %.in34 = select i1 %23, i32* %switch.gep31, i32* %x, !dbg !785
  %27 = load i32, i32* %.in34, align 4, !dbg !786
  %28 = load i32, i32* %.in33, align 4, !dbg !787
  %29 = load i32, i32* %.in, align 4, !dbg !788
  call void @llvm.dbg.value(metadata i32 %27, metadata !748, metadata !DIExpression()), !dbg !756
  %div = sdiv i32 %27, 16, !dbg !789
  call void @llvm.dbg.value(metadata i32 %div, metadata !748, metadata !DIExpression()), !dbg !756
  store i32 %div, i32* %x, align 4, !dbg !790, !tbaa !415
  call void @llvm.dbg.value(metadata i32 %28, metadata !749, metadata !DIExpression()), !dbg !756
  %div6 = sdiv i32 %28, 16, !dbg !791
  call void @llvm.dbg.value(metadata i32 %div6, metadata !749, metadata !DIExpression()), !dbg !756
  store i32 %div6, i32* %y, align 4, !dbg !792, !tbaa !415
  call void @llvm.dbg.value(metadata i32 %29, metadata !750, metadata !DIExpression()), !dbg !756
  %div7 = sdiv i32 %29, 16, !dbg !793
  call void @llvm.dbg.value(metadata i32 %div7, metadata !750, metadata !DIExpression()), !dbg !756
  store i32 %div7, i32* %z, align 4, !dbg !794, !tbaa !415
  call void @llvm.dbg.value(metadata i32 %div, metadata !748, metadata !DIExpression()), !dbg !756
  %cmp = icmp slt i32 %27, 16, !dbg !795
  br i1 %cmp, label %if.then8, label %if.end9, !dbg !797

if.then8:                                         ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 1, metadata !748, metadata !DIExpression()), !dbg !756
  store i32 1, i32* %x, align 4, !dbg !798, !tbaa !415
  br label %if.end9, !dbg !799

if.end9:                                          ; preds = %if.then8, %if.end
  %30 = phi i32 [ 1, %if.then8 ], [ %div, %if.end ]
  call void @llvm.dbg.value(metadata i32 %div6, metadata !749, metadata !DIExpression()), !dbg !756
  %cmp10 = icmp slt i32 %28, 16, !dbg !800
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !802

if.then11:                                        ; preds = %if.end9
  call void @llvm.dbg.value(metadata i32 1, metadata !749, metadata !DIExpression()), !dbg !756
  store i32 1, i32* %y, align 4, !dbg !803, !tbaa !415
  br label %if.end12, !dbg !804

if.end12:                                         ; preds = %if.then11, %if.end9
  %31 = phi i32 [ 1, %if.then11 ], [ %div6, %if.end9 ]
  call void @llvm.dbg.value(metadata i32 %div7, metadata !750, metadata !DIExpression()), !dbg !756
  %cmp13 = icmp slt i32 %29, 16, !dbg !805
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !807

if.then14:                                        ; preds = %if.end12
  call void @llvm.dbg.value(metadata i32 1, metadata !750, metadata !DIExpression()), !dbg !756
  store i32 1, i32* %z, align 4, !dbg !808, !tbaa !415
  br label %if.end15, !dbg !809

if.end15:                                         ; preds = %if.then14, %if.end12
  %32 = phi i32 [ 1, %if.then14 ], [ %div7, %if.end12 ], !dbg !810
  call void @llvm.dbg.value(metadata i32 %30, metadata !748, metadata !DIExpression()), !dbg !756
  %conv = sext i32 %30 to i64, !dbg !811
  call void @llvm.dbg.value(metadata i32 %31, metadata !749, metadata !DIExpression()), !dbg !756
  %conv16 = sext i32 %31 to i64, !dbg !812
  call void @llvm.dbg.value(metadata i32 %32, metadata !750, metadata !DIExpression()), !dbg !756
  %conv17 = sext i32 %32 to i64, !dbg !810
  %33 = load i32, i32* %check, align 4, !dbg !813, !tbaa !415
  call void @llvm.dbg.value(metadata i32 %33, metadata !754, metadata !DIExpression()), !dbg !756
  %34 = load i32, i32* %round, align 4, !dbg !814, !tbaa !415
  call void @llvm.dbg.value(metadata i32 %34, metadata !755, metadata !DIExpression()), !dbg !756
  %call18 = call i32 @run(i64 noundef %conv, i64 noundef %conv16, i64 noundef %conv17, i32 noundef %33, i32 noundef %34), !dbg !815
  call void @llvm.dbg.value(metadata i32 0, metadata !753, metadata !DIExpression()), !dbg !756
  br label %cleanup, !dbg !816

cleanup:                                          ; preds = %if.end15, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.end15 ], !dbg !756
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #20, !dbg !817
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #20, !dbg !817
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #20, !dbg !817
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #20, !dbg !817
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #20, !dbg !817
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #20, !dbg !817
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #20, !dbg !817
  ret i32 %retval.0, !dbg !817
}

declare !dbg !818 dso_local void @get_options(i32 noundef, i8** noundef, i8** noundef, i32* noundef, ...) local_unnamed_addr #16

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #17

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #18

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #18

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #17

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v2i32(<2 x i32>) #19

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { argmemonly mustprogress nounwind willreturn }
attributes #5 = { mustprogress nofree nounwind willreturn writeonly "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { argmemonly nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { argmemonly nofree norecurse nosync nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { argmemonly nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { argmemonly nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #18 = { nofree nounwind }
attributes #19 = { nofree nosync nounwind readnone willreturn }
attributes #20 = { nounwind }
attributes #21 = { cold }
attributes #22 = { cold nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "specifiers", scope: !2, file: !3, line: 492, type: !20, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "rectmul.c", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "daf16ea35485c45cbf2d33954e1c7e89")
!4 = !{!5, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "DTYPE", file: !3, line: 55, baseType: !7)
!7 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "block", file: !3, line: 57, baseType: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 16384, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 256)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "opt_types", scope: !2, file: !3, line: 493, type: !16, isLocal: false, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 256, elements: !18)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{!19}
!19 = !DISubrange(count: 8)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 512, elements: !18)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !23)
!23 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!24 = !{i32 7, !"Dwarf Version", i32 5}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{i32 7, !"uwtable", i32 1}
!28 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)"}
!29 = distinct !DISubprogram(name: "todval", scope: !3, file: !3, line: 40, type: !30, scopeLine: 40, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !43)
!30 = !DISubroutineType(types: !31)
!31 = !{!32, !33}
!32 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !35, line: 30, size: 128, elements: !36)
!35 = !DIFile(filename: "/usr/include/bits/time.h", directory: "", checksumkind: CSK_MD5, checksum: "7275d681a2390320bc78ae3cf595b8d2")
!36 = !{!37, !41}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !34, file: !35, line: 32, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !39, line: 148, baseType: !40)
!39 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "77efac6352c67c8f56830ba4c854379f")
!40 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !34, file: !35, line: 33, baseType: !42, size: 64, offset: 64)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !39, line: 150, baseType: !40)
!43 = !{!44}
!44 = !DILocalVariable(name: "tp", arg: 1, scope: !29, file: !3, line: 40, type: !33)
!45 = !DILocation(line: 0, scope: !29)
!46 = !DILocation(line: 41, column: 16, scope: !29)
!47 = !{!48, !49, i64 0}
!48 = !{!"timeval", !49, i64 0, !49, i64 8}
!49 = !{!"long", !50, i64 0}
!50 = !{!"omnipotent char", !51, i64 0}
!51 = !{!"Simple C/C++ TBAA"}
!52 = !DILocation(line: 41, column: 30, scope: !29)
!53 = !DILocation(line: 41, column: 43, scope: !29)
!54 = !{!48, !49, i64 8}
!55 = !DILocation(line: 41, column: 37, scope: !29)
!56 = !DILocation(line: 41, column: 5, scope: !29)
!57 = distinct !DISubprogram(name: "startup_cilk", scope: !3, file: !3, line: 45, type: !58, scopeLine: 45, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !60)
!58 = !DISubroutineType(types: !59)
!59 = !{null}
!60 = !{!61, !62, !64, !65, !66, !67}
!61 = !DILocalVariable(name: "g", scope: !57, file: !3, line: 46, type: !7)
!62 = !DILocalVariable(name: "__init", scope: !63, type: !17, flags: DIFlagArtificial)
!63 = distinct !DILexicalBlock(scope: !57, file: !3, line: 47, column: 3)
!64 = !DILocalVariable(name: "__limit", scope: !63, type: !17, flags: DIFlagArtificial)
!65 = !DILocalVariable(name: "__begin", scope: !63, type: !17, flags: DIFlagArtificial)
!66 = !DILocalVariable(name: "__end", scope: !63, type: !17, flags: DIFlagArtificial)
!67 = !DILocalVariable(name: "i", scope: !68, file: !3, line: 47, type: !17)
!68 = distinct !DILexicalBlock(scope: !63, file: !3, line: 47, column: 3)
!69 = !DILocation(line: 0, scope: !57)
!70 = !DILocation(line: 46, column: 3, scope: !57)
!71 = !DILocation(line: 46, column: 10, scope: !57)
!72 = !{!73, !73, i64 0}
!73 = !{!"double", !50, i64 0}
!74 = !DILocation(line: 0, scope: !63)
!75 = !DILocation(line: 47, column: 24, scope: !63)
!76 = !DILocation(line: 47, column: 3, scope: !63)
!77 = !DILocation(line: 0, scope: !68)
!78 = !DILocation(line: 48, column: 14, scope: !79)
!79 = distinct !DILexicalBlock(scope: !68, file: !3, line: 47, column: 36)
!80 = !DILocation(line: 48, column: 10, scope: !79)
!81 = !DILocation(line: 48, column: 7, scope: !79)
!82 = !DILocation(line: 49, column: 3, scope: !79)
!83 = !DILocation(line: 47, column: 32, scope: !68)
!84 = !DILocation(line: 47, column: 24, scope: !68)
!85 = !DILocation(line: 47, column: 3, scope: !68)
!86 = distinct !{!86, !76, !87, !88}
!87 = !DILocation(line: 49, column: 3, scope: !63)
!88 = !{!"tapir.loop.spawn.strategy", i32 1}
!89 = !DILocation(line: 50, column: 1, scope: !57)
!90 = distinct !DISubprogram(name: "mult_add_block", scope: !3, file: !3, line: 72, type: !91, scopeLine: 72, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !94)
!91 = !DISubroutineType(types: !92)
!92 = !{!93, !8, !8, !8}
!93 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!94 = !{!95, !96, !97, !98, !99, !100, !101, !105, !109, !110, !111, !112, !113}
!95 = !DILocalVariable(name: "A", arg: 1, scope: !90, file: !3, line: 72, type: !8)
!96 = !DILocalVariable(name: "B", arg: 2, scope: !90, file: !3, line: 72, type: !8)
!97 = !DILocalVariable(name: "R", arg: 3, scope: !90, file: !3, line: 72, type: !8)
!98 = !DILocalVariable(name: "i", scope: !90, file: !3, line: 74, type: !17)
!99 = !DILocalVariable(name: "j", scope: !90, file: !3, line: 74, type: !17)
!100 = !DILocalVariable(name: "flops", scope: !90, file: !3, line: 75, type: !93)
!101 = !DILocalVariable(name: "bp", scope: !102, file: !3, line: 78, type: !5)
!102 = distinct !DILexicalBlock(scope: !103, file: !3, line: 77, column: 31)
!103 = distinct !DILexicalBlock(scope: !104, file: !3, line: 77, column: 3)
!104 = distinct !DILexicalBlock(scope: !90, file: !3, line: 77, column: 3)
!105 = !DILocalVariable(name: "ap", scope: !106, file: !3, line: 80, type: !5)
!106 = distinct !DILexicalBlock(scope: !107, file: !3, line: 79, column: 33)
!107 = distinct !DILexicalBlock(scope: !108, file: !3, line: 79, column: 5)
!108 = distinct !DILexicalBlock(scope: !102, file: !3, line: 79, column: 5)
!109 = !DILocalVariable(name: "rp", scope: !106, file: !3, line: 81, type: !5)
!110 = !DILocalVariable(name: "s0_0", scope: !106, file: !3, line: 82, type: !6)
!111 = !DILocalVariable(name: "s0_1", scope: !106, file: !3, line: 82, type: !6)
!112 = !DILocalVariable(name: "s1_0", scope: !106, file: !3, line: 83, type: !6)
!113 = !DILocalVariable(name: "s1_1", scope: !106, file: !3, line: 83, type: !6)
!114 = !DILocation(line: 0, scope: !90)
!115 = !DILocation(line: 77, column: 3, scope: !104)
!116 = !DILocation(line: 78, column: 18, scope: !102)
!117 = !DILocation(line: 0, scope: !102)
!118 = !DILocation(line: 79, column: 5, scope: !108)
!119 = !DILocation(line: 80, column: 36, scope: !106)
!120 = !DILocation(line: 80, column: 20, scope: !106)
!121 = !DILocation(line: 0, scope: !106)
!122 = !DILocation(line: 81, column: 36, scope: !106)
!123 = !DILocation(line: 81, column: 20, scope: !106)
!124 = !DILocation(line: 84, column: 14, scope: !106)
!125 = !DILocation(line: 86, column: 14, scope: !106)
!126 = !DILocation(line: 88, column: 15, scope: !106)
!127 = !DILocation(line: 88, column: 23, scope: !106)
!128 = !DILocation(line: 88, column: 12, scope: !106)
!129 = !DILocation(line: 90, column: 15, scope: !106)
!130 = !DILocation(line: 90, column: 12, scope: !106)
!131 = !DILocation(line: 92, column: 15, scope: !106)
!132 = !DILocation(line: 92, column: 23, scope: !106)
!133 = !DILocation(line: 92, column: 12, scope: !106)
!134 = !DILocation(line: 94, column: 15, scope: !106)
!135 = !DILocation(line: 94, column: 12, scope: !106)
!136 = !DILocation(line: 96, column: 15, scope: !106)
!137 = !DILocation(line: 96, column: 23, scope: !106)
!138 = !DILocation(line: 96, column: 12, scope: !106)
!139 = !DILocation(line: 98, column: 15, scope: !106)
!140 = !DILocation(line: 98, column: 12, scope: !106)
!141 = !DILocation(line: 100, column: 15, scope: !106)
!142 = !DILocation(line: 100, column: 23, scope: !106)
!143 = !DILocation(line: 100, column: 12, scope: !106)
!144 = !DILocation(line: 102, column: 15, scope: !106)
!145 = !DILocation(line: 102, column: 12, scope: !106)
!146 = !DILocation(line: 104, column: 15, scope: !106)
!147 = !DILocation(line: 104, column: 23, scope: !106)
!148 = !DILocation(line: 104, column: 12, scope: !106)
!149 = !DILocation(line: 106, column: 15, scope: !106)
!150 = !DILocation(line: 106, column: 12, scope: !106)
!151 = !DILocation(line: 108, column: 15, scope: !106)
!152 = !DILocation(line: 108, column: 23, scope: !106)
!153 = !DILocation(line: 108, column: 12, scope: !106)
!154 = !DILocation(line: 110, column: 15, scope: !106)
!155 = !DILocation(line: 110, column: 12, scope: !106)
!156 = !DILocation(line: 112, column: 15, scope: !106)
!157 = !DILocation(line: 112, column: 23, scope: !106)
!158 = !DILocation(line: 112, column: 12, scope: !106)
!159 = !DILocation(line: 114, column: 15, scope: !106)
!160 = !DILocation(line: 114, column: 12, scope: !106)
!161 = !DILocation(line: 116, column: 15, scope: !106)
!162 = !DILocation(line: 116, column: 23, scope: !106)
!163 = !DILocation(line: 116, column: 12, scope: !106)
!164 = !DILocation(line: 118, column: 15, scope: !106)
!165 = !DILocation(line: 118, column: 12, scope: !106)
!166 = !DILocation(line: 120, column: 15, scope: !106)
!167 = !DILocation(line: 120, column: 23, scope: !106)
!168 = !DILocation(line: 120, column: 12, scope: !106)
!169 = !DILocation(line: 122, column: 15, scope: !106)
!170 = !DILocation(line: 122, column: 12, scope: !106)
!171 = !DILocation(line: 124, column: 15, scope: !106)
!172 = !DILocation(line: 124, column: 23, scope: !106)
!173 = !DILocation(line: 124, column: 12, scope: !106)
!174 = !DILocation(line: 126, column: 15, scope: !106)
!175 = !DILocation(line: 126, column: 12, scope: !106)
!176 = !DILocation(line: 128, column: 15, scope: !106)
!177 = !DILocation(line: 128, column: 24, scope: !106)
!178 = !DILocation(line: 128, column: 12, scope: !106)
!179 = !DILocation(line: 130, column: 15, scope: !106)
!180 = !DILocation(line: 130, column: 12, scope: !106)
!181 = !DILocation(line: 132, column: 15, scope: !106)
!182 = !DILocation(line: 132, column: 24, scope: !106)
!183 = !DILocation(line: 132, column: 12, scope: !106)
!184 = !DILocation(line: 134, column: 15, scope: !106)
!185 = !DILocation(line: 134, column: 12, scope: !106)
!186 = !DILocation(line: 136, column: 15, scope: !106)
!187 = !DILocation(line: 136, column: 24, scope: !106)
!188 = !DILocation(line: 136, column: 12, scope: !106)
!189 = !DILocation(line: 138, column: 15, scope: !106)
!190 = !DILocation(line: 138, column: 12, scope: !106)
!191 = !DILocation(line: 140, column: 15, scope: !106)
!192 = !DILocation(line: 140, column: 24, scope: !106)
!193 = !DILocation(line: 140, column: 12, scope: !106)
!194 = !DILocation(line: 142, column: 15, scope: !106)
!195 = !DILocation(line: 142, column: 12, scope: !106)
!196 = !DILocation(line: 144, column: 15, scope: !106)
!197 = !DILocation(line: 144, column: 24, scope: !106)
!198 = !DILocation(line: 144, column: 12, scope: !106)
!199 = !DILocation(line: 146, column: 15, scope: !106)
!200 = !DILocation(line: 146, column: 12, scope: !106)
!201 = !DILocation(line: 148, column: 15, scope: !106)
!202 = !DILocation(line: 148, column: 24, scope: !106)
!203 = !DILocation(line: 148, column: 12, scope: !106)
!204 = !DILocation(line: 150, column: 15, scope: !106)
!205 = !DILocation(line: 150, column: 12, scope: !106)
!206 = !DILocation(line: 152, column: 13, scope: !106)
!207 = !DILocation(line: 154, column: 14, scope: !106)
!208 = !DILocation(line: 79, column: 27, scope: !107)
!209 = !DILocation(line: 79, column: 19, scope: !107)
!210 = distinct !{!210, !118, !211, !212}
!211 = !DILocation(line: 157, column: 5, scope: !108)
!212 = !{!"llvm.loop.mustprogress"}
!213 = !DILocation(line: 77, column: 25, scope: !103)
!214 = !DILocation(line: 77, column: 17, scope: !103)
!215 = distinct !{!215, !115, !216, !212}
!216 = !DILocation(line: 158, column: 3, scope: !104)
!217 = !DILocation(line: 160, column: 3, scope: !90)
!218 = distinct !DISubprogram(name: "multiply_block", scope: !3, file: !3, line: 166, type: !91, scopeLine: 166, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !219)
!219 = !{!220, !221, !222, !223, !224, !225, !226, !230, !234, !235, !236, !237, !238}
!220 = !DILocalVariable(name: "A", arg: 1, scope: !218, file: !3, line: 166, type: !8)
!221 = !DILocalVariable(name: "B", arg: 2, scope: !218, file: !3, line: 166, type: !8)
!222 = !DILocalVariable(name: "R", arg: 3, scope: !218, file: !3, line: 166, type: !8)
!223 = !DILocalVariable(name: "i", scope: !218, file: !3, line: 168, type: !17)
!224 = !DILocalVariable(name: "j", scope: !218, file: !3, line: 168, type: !17)
!225 = !DILocalVariable(name: "flops", scope: !218, file: !3, line: 169, type: !93)
!226 = !DILocalVariable(name: "bp", scope: !227, file: !3, line: 172, type: !5)
!227 = distinct !DILexicalBlock(scope: !228, file: !3, line: 171, column: 31)
!228 = distinct !DILexicalBlock(scope: !229, file: !3, line: 171, column: 3)
!229 = distinct !DILexicalBlock(scope: !218, file: !3, line: 171, column: 3)
!230 = !DILocalVariable(name: "ap", scope: !231, file: !3, line: 174, type: !5)
!231 = distinct !DILexicalBlock(scope: !232, file: !3, line: 173, column: 33)
!232 = distinct !DILexicalBlock(scope: !233, file: !3, line: 173, column: 5)
!233 = distinct !DILexicalBlock(scope: !227, file: !3, line: 173, column: 5)
!234 = !DILocalVariable(name: "rp", scope: !231, file: !3, line: 175, type: !5)
!235 = !DILocalVariable(name: "s0_0", scope: !231, file: !3, line: 176, type: !6)
!236 = !DILocalVariable(name: "s0_1", scope: !231, file: !3, line: 176, type: !6)
!237 = !DILocalVariable(name: "s1_0", scope: !231, file: !3, line: 177, type: !6)
!238 = !DILocalVariable(name: "s1_1", scope: !231, file: !3, line: 177, type: !6)
!239 = !DILocation(line: 0, scope: !218)
!240 = !DILocation(line: 171, column: 3, scope: !229)
!241 = !DILocation(line: 172, column: 18, scope: !227)
!242 = !DILocation(line: 0, scope: !227)
!243 = !DILocation(line: 173, column: 5, scope: !233)
!244 = !DILocation(line: 174, column: 36, scope: !231)
!245 = !DILocation(line: 174, column: 20, scope: !231)
!246 = !DILocation(line: 0, scope: !231)
!247 = !DILocation(line: 175, column: 36, scope: !231)
!248 = !DILocation(line: 175, column: 20, scope: !231)
!249 = !DILocation(line: 178, column: 14, scope: !231)
!250 = !DILocation(line: 178, column: 22, scope: !231)
!251 = !DILocation(line: 178, column: 20, scope: !231)
!252 = !DILocation(line: 180, column: 14, scope: !231)
!253 = !DILocation(line: 180, column: 21, scope: !231)
!254 = !DILocation(line: 182, column: 15, scope: !231)
!255 = !DILocation(line: 182, column: 23, scope: !231)
!256 = !DILocation(line: 182, column: 12, scope: !231)
!257 = !DILocation(line: 184, column: 15, scope: !231)
!258 = !DILocation(line: 184, column: 12, scope: !231)
!259 = !DILocation(line: 186, column: 15, scope: !231)
!260 = !DILocation(line: 186, column: 23, scope: !231)
!261 = !DILocation(line: 186, column: 12, scope: !231)
!262 = !DILocation(line: 188, column: 15, scope: !231)
!263 = !DILocation(line: 188, column: 12, scope: !231)
!264 = !DILocation(line: 190, column: 15, scope: !231)
!265 = !DILocation(line: 190, column: 23, scope: !231)
!266 = !DILocation(line: 190, column: 12, scope: !231)
!267 = !DILocation(line: 192, column: 15, scope: !231)
!268 = !DILocation(line: 192, column: 12, scope: !231)
!269 = !DILocation(line: 194, column: 15, scope: !231)
!270 = !DILocation(line: 194, column: 23, scope: !231)
!271 = !DILocation(line: 194, column: 12, scope: !231)
!272 = !DILocation(line: 196, column: 15, scope: !231)
!273 = !DILocation(line: 196, column: 12, scope: !231)
!274 = !DILocation(line: 198, column: 15, scope: !231)
!275 = !DILocation(line: 198, column: 23, scope: !231)
!276 = !DILocation(line: 198, column: 12, scope: !231)
!277 = !DILocation(line: 200, column: 15, scope: !231)
!278 = !DILocation(line: 200, column: 12, scope: !231)
!279 = !DILocation(line: 202, column: 15, scope: !231)
!280 = !DILocation(line: 202, column: 23, scope: !231)
!281 = !DILocation(line: 202, column: 12, scope: !231)
!282 = !DILocation(line: 204, column: 15, scope: !231)
!283 = !DILocation(line: 204, column: 12, scope: !231)
!284 = !DILocation(line: 206, column: 15, scope: !231)
!285 = !DILocation(line: 206, column: 23, scope: !231)
!286 = !DILocation(line: 206, column: 12, scope: !231)
!287 = !DILocation(line: 208, column: 15, scope: !231)
!288 = !DILocation(line: 208, column: 12, scope: !231)
!289 = !DILocation(line: 210, column: 15, scope: !231)
!290 = !DILocation(line: 210, column: 23, scope: !231)
!291 = !DILocation(line: 210, column: 12, scope: !231)
!292 = !DILocation(line: 212, column: 15, scope: !231)
!293 = !DILocation(line: 212, column: 12, scope: !231)
!294 = !DILocation(line: 214, column: 15, scope: !231)
!295 = !DILocation(line: 214, column: 23, scope: !231)
!296 = !DILocation(line: 214, column: 12, scope: !231)
!297 = !DILocation(line: 216, column: 15, scope: !231)
!298 = !DILocation(line: 216, column: 12, scope: !231)
!299 = !DILocation(line: 218, column: 15, scope: !231)
!300 = !DILocation(line: 218, column: 24, scope: !231)
!301 = !DILocation(line: 218, column: 12, scope: !231)
!302 = !DILocation(line: 220, column: 15, scope: !231)
!303 = !DILocation(line: 220, column: 12, scope: !231)
!304 = !DILocation(line: 222, column: 15, scope: !231)
!305 = !DILocation(line: 222, column: 24, scope: !231)
!306 = !DILocation(line: 222, column: 12, scope: !231)
!307 = !DILocation(line: 224, column: 15, scope: !231)
!308 = !DILocation(line: 224, column: 12, scope: !231)
!309 = !DILocation(line: 226, column: 15, scope: !231)
!310 = !DILocation(line: 226, column: 24, scope: !231)
!311 = !DILocation(line: 226, column: 12, scope: !231)
!312 = !DILocation(line: 228, column: 15, scope: !231)
!313 = !DILocation(line: 228, column: 12, scope: !231)
!314 = !DILocation(line: 230, column: 15, scope: !231)
!315 = !DILocation(line: 230, column: 24, scope: !231)
!316 = !DILocation(line: 230, column: 12, scope: !231)
!317 = !DILocation(line: 232, column: 15, scope: !231)
!318 = !DILocation(line: 232, column: 12, scope: !231)
!319 = !DILocation(line: 234, column: 15, scope: !231)
!320 = !DILocation(line: 234, column: 24, scope: !231)
!321 = !DILocation(line: 234, column: 12, scope: !231)
!322 = !DILocation(line: 236, column: 15, scope: !231)
!323 = !DILocation(line: 236, column: 12, scope: !231)
!324 = !DILocation(line: 238, column: 15, scope: !231)
!325 = !DILocation(line: 238, column: 24, scope: !231)
!326 = !DILocation(line: 238, column: 12, scope: !231)
!327 = !DILocation(line: 240, column: 15, scope: !231)
!328 = !DILocation(line: 240, column: 12, scope: !231)
!329 = !DILocation(line: 242, column: 13, scope: !231)
!330 = !DILocation(line: 244, column: 7, scope: !231)
!331 = !DILocation(line: 244, column: 14, scope: !231)
!332 = !DILocation(line: 173, column: 27, scope: !232)
!333 = !DILocation(line: 173, column: 19, scope: !232)
!334 = distinct !{!334, !243, !335, !212}
!335 = !DILocation(line: 247, column: 5, scope: !233)
!336 = !DILocation(line: 171, column: 25, scope: !228)
!337 = !DILocation(line: 171, column: 17, scope: !228)
!338 = distinct !{!338, !240, !339, !212}
!339 = !DILocation(line: 248, column: 3, scope: !229)
!340 = !DILocation(line: 250, column: 3, scope: !218)
!341 = distinct !DISubprogram(name: "check_block", scope: !3, file: !3, line: 256, type: !342, scopeLine: 256, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !344)
!342 = !DISubroutineType(types: !343)
!343 = !{!17, !8, !6}
!344 = !{!345, !346, !347, !348}
!345 = !DILocalVariable(name: "R", arg: 1, scope: !341, file: !3, line: 256, type: !8)
!346 = !DILocalVariable(name: "v", arg: 2, scope: !341, file: !3, line: 256, type: !6)
!347 = !DILocalVariable(name: "i", scope: !341, file: !3, line: 258, type: !17)
!348 = !DILocalVariable(name: "error", scope: !341, file: !3, line: 259, type: !17)
!349 = !DILocation(line: 0, scope: !341)
!350 = !DILocation(line: 263, column: 9, scope: !351)
!351 = distinct !DILexicalBlock(scope: !352, file: !3, line: 263, column: 9)
!352 = distinct !DILexicalBlock(scope: !353, file: !3, line: 262, column: 3)
!353 = distinct !DILexicalBlock(scope: !341, file: !3, line: 262, column: 3)
!354 = !DILocation(line: 263, column: 26, scope: !351)
!355 = !DILocation(line: 263, column: 9, scope: !352)
!356 = !DILocation(line: 265, column: 17, scope: !357)
!357 = distinct !DILexicalBlock(scope: !358, file: !3, line: 264, column: 11)
!358 = distinct !DILexicalBlock(scope: !351, file: !3, line: 263, column: 32)
!359 = !{!360, !360, i64 0}
!360 = !{!"any pointer", !50, i64 0}
!361 = !DILocation(line: 265, column: 9, scope: !357)
!362 = !DILocation(line: 268, column: 5, scope: !358)
!363 = !DILocation(line: 262, column: 3, scope: !353)
!364 = distinct !{!364, !363, !365, !212, !366, !367}
!365 = !DILocation(line: 268, column: 5, scope: !353)
!366 = !{!"llvm.loop.peeled.count", i32 1}
!367 = !{!"llvm.loop.isvectorized", i32 1}
!368 = !DILocation(line: 270, column: 3, scope: !341)
!369 = distinct !DISubprogram(name: "compare_block", scope: !3, file: !3, line: 273, type: !370, scopeLine: 273, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !372)
!370 = !DISubroutineType(types: !371)
!371 = !{!17, !8, !8}
!372 = !{!373, !374, !375, !376}
!373 = !DILocalVariable(name: "R", arg: 1, scope: !369, file: !3, line: 273, type: !8)
!374 = !DILocalVariable(name: "B", arg: 2, scope: !369, file: !3, line: 273, type: !8)
!375 = !DILocalVariable(name: "i", scope: !369, file: !3, line: 275, type: !17)
!376 = !DILocalVariable(name: "error", scope: !369, file: !3, line: 276, type: !17)
!377 = !DILocation(line: 0, scope: !369)
!378 = !DILocation(line: 280, column: 9, scope: !379)
!379 = distinct !DILexicalBlock(scope: !380, file: !3, line: 280, column: 9)
!380 = distinct !DILexicalBlock(scope: !381, file: !3, line: 279, column: 3)
!381 = distinct !DILexicalBlock(scope: !369, file: !3, line: 279, column: 3)
!382 = !DILocation(line: 280, column: 29, scope: !379)
!383 = !DILocation(line: 280, column: 26, scope: !379)
!384 = !DILocation(line: 280, column: 9, scope: !380)
!385 = !DILocation(line: 282, column: 17, scope: !386)
!386 = distinct !DILexicalBlock(scope: !387, file: !3, line: 281, column: 11)
!387 = distinct !DILexicalBlock(scope: !379, file: !3, line: 280, column: 48)
!388 = !DILocation(line: 282, column: 9, scope: !386)
!389 = !DILocation(line: 286, column: 5, scope: !387)
!390 = !DILocation(line: 279, column: 3, scope: !381)
!391 = distinct !{!391, !390, !392, !212, !366, !367}
!392 = !DILocation(line: 286, column: 5, scope: !381)
!393 = !DILocation(line: 288, column: 3, scope: !369)
!394 = distinct !DISubprogram(name: "check_matrix", scope: !3, file: !3, line: 291, type: !395, scopeLine: 291, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !397)
!395 = !DISubroutineType(types: !396)
!396 = !{!17, !8, !40, !40, !40, !6}
!397 = !{!398, !399, !400, !401, !402, !403, !404, !405, !408}
!398 = !DILocalVariable(name: "R", arg: 1, scope: !394, file: !3, line: 291, type: !8)
!399 = !DILocalVariable(name: "x", arg: 2, scope: !394, file: !3, line: 291, type: !40)
!400 = !DILocalVariable(name: "y", arg: 3, scope: !394, file: !3, line: 291, type: !40)
!401 = !DILocalVariable(name: "o", arg: 4, scope: !394, file: !3, line: 291, type: !40)
!402 = !DILocalVariable(name: "v", arg: 5, scope: !394, file: !3, line: 291, type: !6)
!403 = !DILocalVariable(name: "a", scope: !394, file: !3, line: 293, type: !17)
!404 = !DILocalVariable(name: "b", scope: !394, file: !3, line: 293, type: !17)
!405 = !DILocalVariable(name: "tmp", scope: !406, file: !3, line: 296, type: !17)
!406 = distinct !DILexicalBlock(scope: !407, file: !3, line: 295, column: 19)
!407 = distinct !DILexicalBlock(scope: !394, file: !3, line: 295, column: 7)
!408 = !DILocalVariable(name: "_tmp3", scope: !394, file: !3, line: 311, type: !17)
!409 = !DILocation(line: 0, scope: !410)
!410 = distinct !DILexicalBlock(scope: !411, file: !3, line: 300, column: 12)
!411 = distinct !DILexicalBlock(scope: !394, file: !3, line: 300, column: 7)
!412 = !DILocation(line: 0, scope: !394)
!413 = !DILocation(line: 293, column: 3, scope: !394)
!414 = !DILocation(line: 293, column: 7, scope: !394)
!415 = !{!416, !416, i64 0}
!416 = !{!"int", !50, i64 0}
!417 = !DILocation(line: 295, column: 9, scope: !407)
!418 = !DILocation(line: 295, column: 13, scope: !407)
!419 = !DILocation(line: 295, column: 7, scope: !394)
!420 = !DILocation(line: 0, scope: !341, inlinedAt: !421)
!421 = distinct !DILocation(line: 296, column: 15, scope: !406)
!422 = !DILocation(line: 263, column: 9, scope: !351, inlinedAt: !421)
!423 = !DILocation(line: 263, column: 26, scope: !351, inlinedAt: !421)
!424 = !DILocation(line: 263, column: 9, scope: !352, inlinedAt: !421)
!425 = !DILocation(line: 265, column: 17, scope: !357, inlinedAt: !421)
!426 = !DILocation(line: 265, column: 9, scope: !357, inlinedAt: !421)
!427 = !DILocation(line: 268, column: 5, scope: !358, inlinedAt: !421)
!428 = !DILocation(line: 262, column: 3, scope: !353, inlinedAt: !421)
!429 = distinct !{!429, !428, !430, !212, !366, !367}
!430 = !DILocation(line: 268, column: 5, scope: !353, inlinedAt: !421)
!431 = !DILocation(line: 314, column: 1, scope: !394)
!432 = !DILocation(line: 300, column: 8, scope: !411)
!433 = !DILocation(line: 300, column: 7, scope: !394)
!434 = !DILocation(line: 301, column: 36, scope: !410)
!435 = !DILocation(line: 301, column: 20, scope: !410)
!436 = !DILocation(line: 301, column: 7, scope: !410)
!437 = !DILocation(line: 302, column: 29, scope: !410)
!438 = !DILocation(line: 302, column: 23, scope: !410)
!439 = !DILocation(line: 302, column: 34, scope: !410)
!440 = !DILocation(line: 302, column: 37, scope: !410)
!441 = !DILocation(line: 302, column: 9, scope: !410)
!442 = !DILocation(line: 303, column: 5, scope: !410)
!443 = !DILocation(line: 306, column: 38, scope: !444)
!444 = distinct !DILexicalBlock(scope: !411, file: !3, line: 305, column: 10)
!445 = !DILocation(line: 306, column: 20, scope: !444)
!446 = !DILocation(line: 306, column: 7, scope: !444)
!447 = !DILocation(line: 307, column: 23, scope: !444)
!448 = !DILocation(line: 307, column: 34, scope: !444)
!449 = !DILocation(line: 307, column: 37, scope: !444)
!450 = !DILocation(line: 307, column: 9, scope: !444)
!451 = !DILocation(line: 308, column: 5, scope: !444)
!452 = !DILocation(line: 0, scope: !411)
!453 = !DILocation(line: 311, column: 15, scope: !394)
!454 = !DILocation(line: 311, column: 17, scope: !394)
!455 = distinct !DISubprogram(name: "add_block", scope: !3, file: !3, line: 316, type: !456, scopeLine: 316, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !458)
!456 = !DISubroutineType(types: !457)
!457 = !{!93, !8, !8}
!458 = !{!459, !460, !461}
!459 = !DILocalVariable(name: "T", arg: 1, scope: !455, file: !3, line: 316, type: !8)
!460 = !DILocalVariable(name: "R", arg: 2, scope: !455, file: !3, line: 316, type: !8)
!461 = !DILocalVariable(name: "i", scope: !455, file: !3, line: 318, type: !40)
!462 = !DILocation(line: 0, scope: !455)
!463 = !DILocation(line: 320, column: 3, scope: !464)
!464 = distinct !DILexicalBlock(scope: !455, file: !3, line: 320, column: 3)
!465 = !DILocation(line: 321, column: 25, scope: !466)
!466 = distinct !DILexicalBlock(scope: !467, file: !3, line: 320, column: 39)
!467 = distinct !DILexicalBlock(scope: !464, file: !3, line: 320, column: 3)
!468 = !DILocation(line: 321, column: 5, scope: !466)
!469 = !DILocation(line: 321, column: 22, scope: !466)
!470 = !DILocation(line: 322, column: 45, scope: !466)
!471 = !DILocation(line: 322, column: 29, scope: !466)
!472 = !DILocation(line: 322, column: 5, scope: !466)
!473 = !DILocation(line: 322, column: 26, scope: !466)
!474 = !DILocation(line: 323, column: 45, scope: !466)
!475 = !DILocation(line: 323, column: 29, scope: !466)
!476 = !DILocation(line: 323, column: 5, scope: !466)
!477 = !DILocation(line: 323, column: 26, scope: !466)
!478 = !DILocation(line: 324, column: 45, scope: !466)
!479 = !DILocation(line: 324, column: 29, scope: !466)
!480 = !DILocation(line: 324, column: 5, scope: !466)
!481 = !DILocation(line: 324, column: 26, scope: !466)
!482 = !DILocation(line: 320, column: 33, scope: !467)
!483 = !DILocation(line: 320, column: 17, scope: !467)
!484 = distinct !{!484, !463, !485, !212}
!485 = !DILocation(line: 325, column: 3, scope: !464)
!486 = !DILocation(line: 327, column: 3, scope: !455)
!487 = distinct !DISubprogram(name: "init_block", scope: !3, file: !3, line: 358, type: !488, scopeLine: 358, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !490)
!488 = !DISubroutineType(types: !489)
!489 = !{null, !8, !6}
!490 = !{!491, !492, !493}
!491 = !DILocalVariable(name: "R", arg: 1, scope: !487, file: !3, line: 358, type: !8)
!492 = !DILocalVariable(name: "v", arg: 2, scope: !487, file: !3, line: 358, type: !6)
!493 = !DILocalVariable(name: "i", scope: !487, file: !3, line: 360, type: !17)
!494 = !DILocation(line: 0, scope: !487)
!495 = !DILocation(line: 362, column: 3, scope: !496)
!496 = distinct !DILexicalBlock(scope: !487, file: !3, line: 362, column: 3)
!497 = !DILocation(line: 363, column: 22, scope: !498)
!498 = distinct !DILexicalBlock(scope: !496, file: !3, line: 362, column: 3)
!499 = !DILocation(line: 362, column: 32, scope: !498)
!500 = !DILocation(line: 364, column: 1, scope: !487)
!501 = distinct !DISubprogram(name: "init_matrix", scope: !3, file: !3, line: 366, type: !502, scopeLine: 366, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !504)
!502 = !DISubroutineType(types: !503)
!503 = !{null, !8, !40, !40, !40, !6}
!504 = !{!505, !506, !507, !508, !509}
!505 = !DILocalVariable(name: "R", arg: 1, scope: !501, file: !3, line: 366, type: !8)
!506 = !DILocalVariable(name: "x", arg: 2, scope: !501, file: !3, line: 366, type: !40)
!507 = !DILocalVariable(name: "y", arg: 3, scope: !501, file: !3, line: 366, type: !40)
!508 = !DILocalVariable(name: "o", arg: 4, scope: !501, file: !3, line: 366, type: !40)
!509 = !DILocalVariable(name: "v", arg: 5, scope: !501, file: !3, line: 366, type: !6)
!510 = !DILocation(line: 0, scope: !511)
!511 = distinct !DILexicalBlock(scope: !512, file: !3, line: 373, column: 12)
!512 = distinct !DILexicalBlock(scope: !501, file: !3, line: 373, column: 7)
!513 = !DILocation(line: 0, scope: !501)
!514 = !DILocation(line: 368, column: 9, scope: !515)
!515 = distinct !DILexicalBlock(scope: !501, file: !3, line: 368, column: 7)
!516 = !DILocation(line: 368, column: 12, scope: !515)
!517 = !DILocation(line: 368, column: 7, scope: !501)
!518 = !DILocation(line: 362, column: 3, scope: !496, inlinedAt: !519)
!519 = distinct !DILocation(line: 369, column: 5, scope: !520)
!520 = distinct !DILexicalBlock(scope: !515, file: !3, line: 368, column: 17)
!521 = !DILocation(line: 363, column: 22, scope: !498, inlinedAt: !519)
!522 = !DILocation(line: 362, column: 32, scope: !498, inlinedAt: !519)
!523 = !DILocation(line: 384, column: 1, scope: !501)
!524 = !DILocation(line: 373, column: 8, scope: !512)
!525 = !DILocation(line: 373, column: 7, scope: !501)
!526 = !DILocation(line: 374, column: 31, scope: !511)
!527 = !DILocation(line: 374, column: 16, scope: !511)
!528 = !DILocation(line: 375, column: 24, scope: !511)
!529 = !DILocation(line: 375, column: 29, scope: !511)
!530 = !DILocation(line: 375, column: 32, scope: !511)
!531 = !DILocation(line: 377, column: 3, scope: !511)
!532 = !DILocation(line: 378, column: 33, scope: !533)
!533 = distinct !DILexicalBlock(scope: !512, file: !3, line: 377, column: 10)
!534 = !DILocation(line: 378, column: 16, scope: !533)
!535 = !DILocation(line: 379, column: 29, scope: !533)
!536 = !DILocation(line: 379, column: 32, scope: !533)
!537 = !DILocation(line: 0, scope: !512)
!538 = !DILocation(line: 381, column: 3, scope: !501)
!539 = distinct !DISubprogram(name: "run", scope: !3, file: !3, line: 425, type: !540, scopeLine: 425, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !542)
!540 = !DISubroutineType(types: !541)
!541 = !{!17, !40, !40, !40, !17, !17}
!542 = !{!543, !544, !545, !546, !547, !548, !549, !550, !551, !552, !553, !555, !558, !559}
!543 = !DILocalVariable(name: "x", arg: 1, scope: !539, file: !3, line: 425, type: !40)
!544 = !DILocalVariable(name: "y", arg: 2, scope: !539, file: !3, line: 425, type: !40)
!545 = !DILocalVariable(name: "z", arg: 3, scope: !539, file: !3, line: 425, type: !40)
!546 = !DILocalVariable(name: "check", arg: 4, scope: !539, file: !3, line: 425, type: !17)
!547 = !DILocalVariable(name: "round", arg: 5, scope: !539, file: !3, line: 425, type: !17)
!548 = !DILocalVariable(name: "A", scope: !539, file: !3, line: 427, type: !8)
!549 = !DILocalVariable(name: "B", scope: !539, file: !3, line: 427, type: !8)
!550 = !DILocalVariable(name: "R", scope: !539, file: !3, line: 427, type: !8)
!551 = !DILocalVariable(name: "flops", scope: !539, file: !3, line: 428, type: !93)
!552 = !DILocalVariable(name: "oldcheck", scope: !539, file: !3, line: 434, type: !17)
!553 = !DILocalVariable(name: "r", scope: !554, file: !3, line: 435, type: !17)
!554 = distinct !DILexicalBlock(scope: !539, file: !3, line: 435, column: 3)
!555 = !DILocalVariable(name: "t1", scope: !556, file: !3, line: 442, type: !34)
!556 = distinct !DILexicalBlock(scope: !557, file: !3, line: 435, column: 30)
!557 = distinct !DILexicalBlock(scope: !554, file: !3, line: 435, column: 3)
!558 = !DILocalVariable(name: "t2", scope: !556, file: !3, line: 442, type: !34)
!559 = !DILocalVariable(name: "runtime_ms", scope: !556, file: !3, line: 448, type: !32)
!560 = !DILocation(line: 0, scope: !556)
!561 = !DILocation(line: 0, scope: !539)
!562 = !DILocation(line: 430, column: 25, scope: !539)
!563 = !DILocation(line: 430, column: 28, scope: !539)
!564 = !DILocation(line: 430, column: 17, scope: !539)
!565 = !DILocation(line: 430, column: 7, scope: !539)
!566 = !DILocation(line: 431, column: 25, scope: !539)
!567 = !DILocation(line: 431, column: 28, scope: !539)
!568 = !DILocation(line: 431, column: 17, scope: !539)
!569 = !DILocation(line: 431, column: 7, scope: !539)
!570 = !DILocation(line: 432, column: 28, scope: !539)
!571 = !DILocation(line: 432, column: 17, scope: !539)
!572 = !DILocation(line: 432, column: 7, scope: !539)
!573 = !DILocation(line: 0, scope: !554)
!574 = !DILocation(line: 435, column: 17, scope: !557)
!575 = !DILocation(line: 435, column: 3, scope: !554)
!576 = !DILocation(line: 471, column: 3, scope: !539)
!577 = !DILocation(line: 472, column: 3, scope: !539)
!578 = !DILocation(line: 473, column: 3, scope: !539)
!579 = !DILocation(line: 475, column: 3, scope: !539)
!580 = !DILocation(line: 437, column: 16, scope: !556)
!581 = !DILocation(line: 438, column: 16, scope: !556)
!582 = !DILocation(line: 439, column: 5, scope: !556)
!583 = !DILocation(line: 440, column: 5, scope: !556)
!584 = !DILocation(line: 442, column: 5, scope: !556)
!585 = !DILocation(line: 442, column: 20, scope: !556)
!586 = !DILocation(line: 442, column: 24, scope: !556)
!587 = !DILocation(line: 443, column: 5, scope: !556)
!588 = !DILocation(line: 445, column: 13, scope: !556)
!589 = !DILocation(line: 447, column: 5, scope: !556)
!590 = !DILocation(line: 0, scope: !29, inlinedAt: !591)
!591 = distinct !DILocation(line: 448, column: 38, scope: !556)
!592 = !DILocation(line: 41, column: 16, scope: !29, inlinedAt: !591)
!593 = !DILocation(line: 41, column: 43, scope: !29, inlinedAt: !591)
!594 = !DILocation(line: 0, scope: !29, inlinedAt: !595)
!595 = distinct !DILocation(line: 448, column: 50, scope: !556)
!596 = !DILocation(line: 41, column: 16, scope: !29, inlinedAt: !595)
!597 = !DILocation(line: 41, column: 43, scope: !29, inlinedAt: !595)
!598 = !DILocation(line: 41, column: 37, scope: !29, inlinedAt: !591)
!599 = !DILocation(line: 448, column: 49, scope: !556)
!600 = !DILocation(line: 448, column: 62, scope: !556)
!601 = !DILocation(line: 449, column: 31, scope: !556)
!602 = !DILocation(line: 449, column: 41, scope: !556)
!603 = !DILocation(line: 449, column: 5, scope: !556)
!604 = !DILocation(line: 451, column: 8, scope: !556)
!605 = !DILocation(line: 452, column: 7, scope: !606)
!606 = distinct !DILexicalBlock(scope: !607, file: !3, line: 451, column: 15)
!607 = distinct !DILexicalBlock(scope: !556, file: !3, line: 451, column: 8)
!608 = !DILocation(line: 453, column: 15, scope: !606)
!609 = !DILocation(line: 456, column: 9, scope: !610)
!610 = distinct !DILexicalBlock(scope: !556, file: !3, line: 456, column: 9)
!611 = !DILocation(line: 456, column: 9, scope: !556)
!612 = !DILocation(line: 457, column: 7, scope: !613)
!613 = distinct !DILexicalBlock(scope: !610, file: !3, line: 456, column: 16)
!614 = !DILocation(line: 458, column: 7, scope: !613)
!615 = !DILocation(line: 460, column: 5, scope: !613)
!616 = !DILocation(line: 461, column: 15, scope: !617)
!617 = distinct !DILexicalBlock(scope: !610, file: !3, line: 460, column: 12)
!618 = !DILocation(line: 461, column: 7, scope: !617)
!619 = !DILocation(line: 462, column: 15, scope: !617)
!620 = !DILocation(line: 462, column: 7, scope: !617)
!621 = !DILocation(line: 463, column: 15, scope: !617)
!622 = !DILocation(line: 463, column: 7, scope: !617)
!623 = !DILocation(line: 464, column: 15, scope: !617)
!624 = !DILocation(line: 464, column: 7, scope: !617)
!625 = !DILocation(line: 469, column: 3, scope: !557)
!626 = !DILocation(line: 435, column: 26, scope: !557)
!627 = distinct !{!627, !575, !628, !212}
!628 = !DILocation(line: 469, column: 3, scope: !554)
!629 = !DISubprogram(name: "gettimeofday", scope: !630, file: !630, line: 72, type: !631, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !641)
!630 = !DIFile(filename: "/usr/include/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b3cbcac52b1954fa045aa74bfcd1a38")
!631 = !DISubroutineType(types: !632)
!632 = !{!17, !633, !634}
!633 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !33)
!634 = !DIDerivedType(tag: DW_TAG_typedef, name: "__timezone_ptr_t", file: !630, line: 62, baseType: !635)
!635 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !636)
!636 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !637, size: 64)
!637 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !630, line: 56, size: 64, elements: !638)
!638 = !{!639, !640}
!639 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !637, file: !630, line: 58, baseType: !17, size: 32)
!640 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !637, file: !630, line: 59, baseType: !17, size: 32, offset: 32)
!641 = !{}
!642 = distinct !DISubprogram(name: "multiply_matrix", scope: !3, file: !3, line: 386, type: !643, scopeLine: 387, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !645)
!643 = !DISubroutineType(types: !644)
!644 = !{!93, !8, !40, !8, !40, !40, !40, !40, !8, !40, !17}
!645 = !{!646, !647, !648, !649, !650, !651, !652, !653, !654, !655, !656, !659, !660, !661}
!646 = !DILocalVariable(name: "A", arg: 1, scope: !642, file: !3, line: 386, type: !8)
!647 = !DILocalVariable(name: "oa", arg: 2, scope: !642, file: !3, line: 386, type: !40)
!648 = !DILocalVariable(name: "B", arg: 3, scope: !642, file: !3, line: 386, type: !8)
!649 = !DILocalVariable(name: "ob", arg: 4, scope: !642, file: !3, line: 386, type: !40)
!650 = !DILocalVariable(name: "x", arg: 5, scope: !642, file: !3, line: 386, type: !40)
!651 = !DILocalVariable(name: "y", arg: 6, scope: !642, file: !3, line: 387, type: !40)
!652 = !DILocalVariable(name: "z", arg: 7, scope: !642, file: !3, line: 387, type: !40)
!653 = !DILocalVariable(name: "R", arg: 8, scope: !642, file: !3, line: 387, type: !8)
!654 = !DILocalVariable(name: "orr", arg: 9, scope: !642, file: !3, line: 387, type: !40)
!655 = !DILocalVariable(name: "add", arg: 10, scope: !642, file: !3, line: 387, type: !17)
!656 = !DILocalVariable(name: "_tmp", scope: !657, file: !3, line: 390, type: !93)
!657 = distinct !DILexicalBlock(scope: !658, file: !3, line: 389, column: 21)
!658 = distinct !DILexicalBlock(scope: !642, file: !3, line: 389, column: 7)
!659 = !DILocalVariable(name: "flops", scope: !642, file: !3, line: 399, type: !93)
!660 = !DILocalVariable(name: "_tmp1", scope: !642, file: !3, line: 400, type: !93)
!661 = !DILocalVariable(name: "_tmp2", scope: !642, file: !3, line: 400, type: !93)
!662 = !DILocation(line: 0, scope: !663)
!663 = distinct !DILexicalBlock(scope: !664, file: !3, line: 402, column: 26)
!664 = distinct !DILexicalBlock(scope: !642, file: !3, line: 402, column: 7)
!665 = !DILocation(line: 0, scope: !642)
!666 = !DILocation(line: 389, column: 9, scope: !658)
!667 = !DILocation(line: 389, column: 11, scope: !658)
!668 = !DILocation(line: 389, column: 15, scope: !658)
!669 = !DILocation(line: 389, column: 7, scope: !642)
!670 = !DILocation(line: 0, scope: !657)
!671 = !DILocation(line: 391, column: 9, scope: !672)
!672 = distinct !DILexicalBlock(scope: !657, file: !3, line: 391, column: 9)
!673 = !DILocation(line: 391, column: 9, scope: !657)
!674 = !DILocation(line: 392, column: 14, scope: !672)
!675 = !DILocation(line: 392, column: 7, scope: !672)
!676 = !DILocation(line: 394, column: 14, scope: !672)
!677 = !DILocation(line: 400, column: 3, scope: !642)
!678 = !DILocation(line: 400, column: 13, scope: !642)
!679 = !{!680, !680, i64 0}
!680 = !{!"long long", !50, i64 0}
!681 = !DILocation(line: 402, column: 9, scope: !664)
!682 = !DILocation(line: 402, column: 14, scope: !664)
!683 = !DILocation(line: 403, column: 55, scope: !663)
!684 = !DILocation(line: 403, column: 24, scope: !663)
!685 = !DILocation(line: 403, column: 11, scope: !663)
!686 = !DILocation(line: 404, column: 36, scope: !663)
!687 = !DILocation(line: 404, column: 30, scope: !663)
!688 = !DILocation(line: 405, column: 31, scope: !663)
!689 = !DILocation(line: 405, column: 34, scope: !663)
!690 = !DILocation(line: 405, column: 51, scope: !663)
!691 = !DILocation(line: 405, column: 45, scope: !663)
!692 = !DILocation(line: 404, column: 13, scope: !663)
!693 = !DILocation(line: 406, column: 3, scope: !663)
!694 = !DILocation(line: 408, column: 15, scope: !695)
!695 = distinct !DILexicalBlock(scope: !696, file: !3, line: 408, column: 9)
!696 = distinct !DILexicalBlock(scope: !664, file: !3, line: 406, column: 10)
!697 = !DILocation(line: 409, column: 35, scope: !698)
!698 = distinct !DILexicalBlock(scope: !695, file: !3, line: 408, column: 26)
!699 = !DILocation(line: 409, column: 32, scope: !698)
!700 = !DILocation(line: 410, column: 38, scope: !698)
!701 = !DILocation(line: 410, column: 32, scope: !698)
!702 = !DILocation(line: 410, column: 52, scope: !698)
!703 = !DILocation(line: 410, column: 55, scope: !698)
!704 = !DILocation(line: 409, column: 15, scope: !698)
!705 = !DILocation(line: 409, column: 13, scope: !698)
!706 = !DILocation(line: 411, column: 15, scope: !698)
!707 = !DILocation(line: 413, column: 5, scope: !698)
!708 = !DILocation(line: 414, column: 63, scope: !709)
!709 = distinct !DILexicalBlock(scope: !695, file: !3, line: 413, column: 12)
!710 = !DILocation(line: 414, column: 26, scope: !709)
!711 = !DILocation(line: 414, column: 13, scope: !709)
!712 = !DILocation(line: 415, column: 39, scope: !709)
!713 = !DILocation(line: 415, column: 59, scope: !709)
!714 = !DILocation(line: 415, column: 62, scope: !709)
!715 = !DILocation(line: 416, column: 33, scope: !709)
!716 = !DILocation(line: 415, column: 15, scope: !709)
!717 = !DILocation(line: 0, scope: !664)
!718 = !DILocation(line: 419, column: 3, scope: !642)
!719 = !DILocation(line: 421, column: 11, scope: !642)
!720 = !DILocation(line: 421, column: 17, scope: !642)
!721 = !DILocation(line: 423, column: 1, scope: !642)
!722 = distinct !DISubprogram(name: "usage", scope: !3, file: !3, line: 478, type: !723, scopeLine: 478, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !641)
!723 = !DISubroutineType(types: !724)
!724 = !{!17}
!725 = !DILocation(line: 479, column: 11, scope: !722)
!726 = !DILocation(line: 479, column: 3, scope: !722)
!727 = !DILocation(line: 481, column: 11, scope: !722)
!728 = !DILocation(line: 481, column: 3, scope: !722)
!729 = !DILocation(line: 483, column: 11, scope: !722)
!730 = !DILocation(line: 483, column: 3, scope: !722)
!731 = !DILocation(line: 484, column: 11, scope: !722)
!732 = !DILocation(line: 484, column: 3, scope: !722)
!733 = !DILocation(line: 485, column: 11, scope: !722)
!734 = !DILocation(line: 485, column: 3, scope: !722)
!735 = !DILocation(line: 486, column: 11, scope: !722)
!736 = !DILocation(line: 486, column: 3, scope: !722)
!737 = !DILocation(line: 487, column: 11, scope: !722)
!738 = !DILocation(line: 487, column: 3, scope: !722)
!739 = !DILocation(line: 489, column: 3, scope: !722)
!740 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 496, type: !741, scopeLine: 496, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !745)
!741 = !DISubroutineType(types: !742)
!742 = !{!17, !17, !743}
!743 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !744, size: 64)
!744 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!745 = !{!746, !747, !748, !749, !750, !751, !752, !753, !754, !755}
!746 = !DILocalVariable(name: "argc", arg: 1, scope: !740, file: !3, line: 496, type: !17)
!747 = !DILocalVariable(name: "argv", arg: 2, scope: !740, file: !3, line: 496, type: !743)
!748 = !DILocalVariable(name: "x", scope: !740, file: !3, line: 498, type: !17)
!749 = !DILocalVariable(name: "y", scope: !740, file: !3, line: 498, type: !17)
!750 = !DILocalVariable(name: "z", scope: !740, file: !3, line: 498, type: !17)
!751 = !DILocalVariable(name: "benchmark", scope: !740, file: !3, line: 498, type: !17)
!752 = !DILocalVariable(name: "help", scope: !740, file: !3, line: 498, type: !17)
!753 = !DILocalVariable(name: "t", scope: !740, file: !3, line: 498, type: !17)
!754 = !DILocalVariable(name: "check", scope: !740, file: !3, line: 498, type: !17)
!755 = !DILocalVariable(name: "round", scope: !740, file: !3, line: 498, type: !17)
!756 = !DILocation(line: 0, scope: !740)
!757 = !DILocation(line: 498, column: 3, scope: !740)
!758 = !DILocation(line: 501, column: 5, scope: !740)
!759 = !DILocation(line: 502, column: 5, scope: !740)
!760 = !DILocation(line: 503, column: 5, scope: !740)
!761 = !DILocation(line: 504, column: 9, scope: !740)
!762 = !DILocation(line: 505, column: 9, scope: !740)
!763 = !DILocation(line: 507, column: 3, scope: !740)
!764 = !DILocation(line: 510, column: 7, scope: !765)
!765 = distinct !DILexicalBlock(scope: !740, file: !3, line: 510, column: 7)
!766 = !DILocation(line: 510, column: 7, scope: !740)
!767 = !DILocation(line: 479, column: 11, scope: !722, inlinedAt: !768)
!768 = distinct !DILocation(line: 510, column: 20, scope: !765)
!769 = !DILocation(line: 479, column: 3, scope: !722, inlinedAt: !768)
!770 = !DILocation(line: 481, column: 11, scope: !722, inlinedAt: !768)
!771 = !DILocation(line: 481, column: 3, scope: !722, inlinedAt: !768)
!772 = !DILocation(line: 483, column: 11, scope: !722, inlinedAt: !768)
!773 = !DILocation(line: 483, column: 3, scope: !722, inlinedAt: !768)
!774 = !DILocation(line: 484, column: 11, scope: !722, inlinedAt: !768)
!775 = !DILocation(line: 484, column: 3, scope: !722, inlinedAt: !768)
!776 = !DILocation(line: 485, column: 11, scope: !722, inlinedAt: !768)
!777 = !DILocation(line: 485, column: 3, scope: !722, inlinedAt: !768)
!778 = !DILocation(line: 486, column: 11, scope: !722, inlinedAt: !768)
!779 = !DILocation(line: 486, column: 3, scope: !722, inlinedAt: !768)
!780 = !DILocation(line: 487, column: 11, scope: !722, inlinedAt: !768)
!781 = !DILocation(line: 487, column: 3, scope: !722, inlinedAt: !768)
!782 = !DILocation(line: 510, column: 13, scope: !765)
!783 = !DILocation(line: 512, column: 7, scope: !784)
!784 = distinct !DILexicalBlock(scope: !740, file: !3, line: 512, column: 7)
!785 = !DILocation(line: 512, column: 7, scope: !740)
!786 = !DILocation(line: 532, column: 7, scope: !740)
!787 = !DILocation(line: 533, column: 7, scope: !740)
!788 = !DILocation(line: 534, column: 7, scope: !740)
!789 = !DILocation(line: 532, column: 8, scope: !740)
!790 = !DILocation(line: 532, column: 5, scope: !740)
!791 = !DILocation(line: 533, column: 8, scope: !740)
!792 = !DILocation(line: 533, column: 5, scope: !740)
!793 = !DILocation(line: 534, column: 8, scope: !740)
!794 = !DILocation(line: 534, column: 5, scope: !740)
!795 = !DILocation(line: 536, column: 8, scope: !796)
!796 = distinct !DILexicalBlock(scope: !740, file: !3, line: 536, column: 7)
!797 = !DILocation(line: 536, column: 7, scope: !740)
!798 = !DILocation(line: 536, column: 13, scope: !796)
!799 = !DILocation(line: 536, column: 12, scope: !796)
!800 = !DILocation(line: 537, column: 8, scope: !801)
!801 = distinct !DILexicalBlock(scope: !740, file: !3, line: 537, column: 7)
!802 = !DILocation(line: 537, column: 7, scope: !740)
!803 = !DILocation(line: 537, column: 13, scope: !801)
!804 = !DILocation(line: 537, column: 12, scope: !801)
!805 = !DILocation(line: 538, column: 8, scope: !806)
!806 = distinct !DILexicalBlock(scope: !740, file: !3, line: 538, column: 7)
!807 = !DILocation(line: 538, column: 7, scope: !740)
!808 = !DILocation(line: 538, column: 13, scope: !806)
!809 = !DILocation(line: 538, column: 12, scope: !806)
!810 = !DILocation(line: 540, column: 15, scope: !740)
!811 = !DILocation(line: 540, column: 11, scope: !740)
!812 = !DILocation(line: 540, column: 13, scope: !740)
!813 = !DILocation(line: 540, column: 17, scope: !740)
!814 = !DILocation(line: 540, column: 24, scope: !740)
!815 = !DILocation(line: 540, column: 7, scope: !740)
!816 = !DILocation(line: 542, column: 3, scope: !740)
!817 = !DILocation(line: 543, column: 1, scope: !740)
!818 = !DISubprogram(name: "get_options", scope: !819, file: !819, line: 20, type: !820, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !641)
!819 = !DIFile(filename: "./getoptions.h", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "bf060e74fdb298e4a85522e522cd3a24")
!820 = !DISubroutineType(types: !821)
!821 = !{null, !17, !743, !822, !823, null}
!822 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!823 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
