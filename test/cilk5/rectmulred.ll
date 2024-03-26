; ModuleID = 'rectmulred.c'
source_filename = "rectmulred.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [20 x i8] c"R[%d]: %lf != %lf.\0A\00", align 1
@.str.1 = private unnamed_addr constant [29 x i8] c"(R[%d]) %lf != %lf (B[%d]).\0A\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
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
@specifiers = dso_local global [7 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.22, i32 0, i32 0), i8* null], align 16, !dbg !0
@opt_types = dso_local global [7 x i32] [i32 1, i32 1, i32 1, i32 4, i32 6, i32 4, i32 0], align 16, !dbg !14
@str = private unnamed_addr constant [14 x i8] c"WRONG RESULT!\00", align 1
@str.23 = private unnamed_addr constant [22 x i8] c"Now check result ... \00", align 1
@switch.table.main.25 = private unnamed_addr constant [3 x i32] [i32 512, i32 2048, i32 4096], align 4

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

; Function Attrs: argmemonly nofree nosync nounwind uwtable
define dso_local i64 @mult_add_block([256 x double]* noundef readonly %A, [256 x double]* noundef readonly %B, [256 x double]* nocapture noundef %R) local_unnamed_addr #2 !dbg !57 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %A, metadata !62, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.value(metadata [256 x double]* %B, metadata !63, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !64, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.value(metadata i64 0, metadata !67, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.value(metadata i32 0, metadata !66, metadata !DIExpression()), !dbg !81
  br label %for.body, !dbg !82

for.body:                                         ; preds = %entry, %for.end
  %indvars.iv435 = phi i64 [ 0, %entry ], [ %indvars.iv.next436, %for.end ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv435, metadata !66, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.value(metadata i64 undef, metadata !67, metadata !DIExpression()), !dbg !81
  %arrayidx = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 %indvars.iv435, !dbg !83
  call void @llvm.dbg.value(metadata double* %arrayidx, metadata !68, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.value(metadata i32 0, metadata !65, metadata !DIExpression()), !dbg !81
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
  call void @llvm.dbg.value(metadata i32 0, metadata !65, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.value(metadata i64 undef, metadata !67, metadata !DIExpression()), !dbg !81
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
  br label %for.body3, !dbg !85

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body3 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !65, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.value(metadata i64 undef, metadata !67, metadata !DIExpression()), !dbg !81
  %16 = shl nuw nsw i64 %indvars.iv, 4, !dbg !86
  %arrayidx5 = getelementptr inbounds [256 x double], [256 x double]* %A, i64 0, i64 %16, !dbg !87
  call void @llvm.dbg.value(metadata double* %arrayidx5, metadata !72, metadata !DIExpression()), !dbg !88
  %17 = add nuw nsw i64 %16, %indvars.iv435, !dbg !89
  %arrayidx8 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %17, !dbg !90
  call void @llvm.dbg.value(metadata double* %arrayidx8, metadata !76, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %18 = bitcast double* %arrayidx8 to <2 x double>*, !dbg !91
  %19 = load <2 x double>, <2 x double>* %18, align 8, !dbg !91, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx11 = getelementptr inbounds double, double* %arrayidx8, i64 16, !dbg !94
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %20 = bitcast double* %arrayidx11 to <2 x double>*, !dbg !94
  %21 = load <2 x double>, <2 x double>* %20, align 8, !dbg !94, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %22 = load double, double* %arrayidx5, align 8, !dbg !95, !tbaa !92
  %23 = load <2 x double>, <2 x double>* %0, align 8, !dbg !96, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %24 = insertelement <2 x double> poison, double %22, i64 0, !dbg !97
  %25 = shufflevector <2 x double> %24, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !97
  %26 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %25, <2 x double> %23, <2 x double> %19), !dbg !97
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx19 = getelementptr inbounds double, double* %arrayidx5, i64 16, !dbg !98
  %27 = load double, double* %arrayidx19, align 8, !dbg !98, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %28 = insertelement <2 x double> poison, double %27, i64 0, !dbg !99
  %29 = shufflevector <2 x double> %28, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !99
  %30 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %29, <2 x double> %23, <2 x double> %21), !dbg !99
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx25 = getelementptr inbounds double, double* %arrayidx5, i64 1, !dbg !100
  %31 = load double, double* %arrayidx25, align 8, !dbg !100, !tbaa !92
  %32 = load <2 x double>, <2 x double>* %1, align 8, !dbg !101, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %33 = insertelement <2 x double> poison, double %31, i64 0, !dbg !102
  %34 = shufflevector <2 x double> %33, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !102
  %35 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %34, <2 x double> %32, <2 x double> %26), !dbg !102
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx31 = getelementptr inbounds double, double* %arrayidx5, i64 17, !dbg !103
  %36 = load double, double* %arrayidx31, align 8, !dbg !103, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %37 = insertelement <2 x double> poison, double %36, i64 0, !dbg !104
  %38 = shufflevector <2 x double> %37, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !104
  %39 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %38, <2 x double> %32, <2 x double> %30), !dbg !104
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx37 = getelementptr inbounds double, double* %arrayidx5, i64 2, !dbg !105
  %40 = load double, double* %arrayidx37, align 8, !dbg !105, !tbaa !92
  %41 = load <2 x double>, <2 x double>* %2, align 8, !dbg !106, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %42 = insertelement <2 x double> poison, double %40, i64 0, !dbg !107
  %43 = shufflevector <2 x double> %42, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !107
  %44 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %43, <2 x double> %41, <2 x double> %35), !dbg !107
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx43 = getelementptr inbounds double, double* %arrayidx5, i64 18, !dbg !108
  %45 = load double, double* %arrayidx43, align 8, !dbg !108, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %46 = insertelement <2 x double> poison, double %45, i64 0, !dbg !109
  %47 = shufflevector <2 x double> %46, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !109
  %48 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %47, <2 x double> %41, <2 x double> %39), !dbg !109
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx49 = getelementptr inbounds double, double* %arrayidx5, i64 3, !dbg !110
  %49 = load double, double* %arrayidx49, align 8, !dbg !110, !tbaa !92
  %50 = load <2 x double>, <2 x double>* %3, align 8, !dbg !111, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %51 = insertelement <2 x double> poison, double %49, i64 0, !dbg !112
  %52 = shufflevector <2 x double> %51, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !112
  %53 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %52, <2 x double> %50, <2 x double> %44), !dbg !112
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx55 = getelementptr inbounds double, double* %arrayidx5, i64 19, !dbg !113
  %54 = load double, double* %arrayidx55, align 8, !dbg !113, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %55 = insertelement <2 x double> poison, double %54, i64 0, !dbg !114
  %56 = shufflevector <2 x double> %55, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !114
  %57 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %56, <2 x double> %50, <2 x double> %48), !dbg !114
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx61 = getelementptr inbounds double, double* %arrayidx5, i64 4, !dbg !115
  %58 = load double, double* %arrayidx61, align 8, !dbg !115, !tbaa !92
  %59 = load <2 x double>, <2 x double>* %4, align 8, !dbg !116, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %60 = insertelement <2 x double> poison, double %58, i64 0, !dbg !117
  %61 = shufflevector <2 x double> %60, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !117
  %62 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %61, <2 x double> %59, <2 x double> %53), !dbg !117
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx67 = getelementptr inbounds double, double* %arrayidx5, i64 20, !dbg !118
  %63 = load double, double* %arrayidx67, align 8, !dbg !118, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %64 = insertelement <2 x double> poison, double %63, i64 0, !dbg !119
  %65 = shufflevector <2 x double> %64, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !119
  %66 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %65, <2 x double> %59, <2 x double> %57), !dbg !119
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx73 = getelementptr inbounds double, double* %arrayidx5, i64 5, !dbg !120
  %67 = load double, double* %arrayidx73, align 8, !dbg !120, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %68 = load <2 x double>, <2 x double>* %5, align 8, !dbg !121, !tbaa !92
  %69 = insertelement <2 x double> poison, double %67, i64 0, !dbg !122
  %70 = shufflevector <2 x double> %69, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !122
  %71 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %70, <2 x double> %68, <2 x double> %62), !dbg !122
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx79 = getelementptr inbounds double, double* %arrayidx5, i64 21, !dbg !123
  %72 = load double, double* %arrayidx79, align 8, !dbg !123, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %73 = insertelement <2 x double> poison, double %72, i64 0, !dbg !124
  %74 = shufflevector <2 x double> %73, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !124
  %75 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %74, <2 x double> %68, <2 x double> %66), !dbg !124
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx85 = getelementptr inbounds double, double* %arrayidx5, i64 6, !dbg !125
  %76 = load double, double* %arrayidx85, align 8, !dbg !125, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %77 = load <2 x double>, <2 x double>* %6, align 8, !dbg !126, !tbaa !92
  %78 = insertelement <2 x double> poison, double %76, i64 0, !dbg !127
  %79 = shufflevector <2 x double> %78, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !127
  %80 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %79, <2 x double> %77, <2 x double> %71), !dbg !127
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx91 = getelementptr inbounds double, double* %arrayidx5, i64 22, !dbg !128
  %81 = load double, double* %arrayidx91, align 8, !dbg !128, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %82 = insertelement <2 x double> poison, double %81, i64 0, !dbg !129
  %83 = shufflevector <2 x double> %82, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !129
  %84 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %83, <2 x double> %77, <2 x double> %75), !dbg !129
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx97 = getelementptr inbounds double, double* %arrayidx5, i64 7, !dbg !130
  %85 = load double, double* %arrayidx97, align 8, !dbg !130, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %86 = load <2 x double>, <2 x double>* %7, align 8, !dbg !131, !tbaa !92
  %87 = insertelement <2 x double> poison, double %85, i64 0, !dbg !132
  %88 = shufflevector <2 x double> %87, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !132
  %89 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %88, <2 x double> %86, <2 x double> %80), !dbg !132
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx103 = getelementptr inbounds double, double* %arrayidx5, i64 23, !dbg !133
  %90 = load double, double* %arrayidx103, align 8, !dbg !133, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %91 = insertelement <2 x double> poison, double %90, i64 0, !dbg !134
  %92 = shufflevector <2 x double> %91, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !134
  %93 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %92, <2 x double> %86, <2 x double> %84), !dbg !134
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx109 = getelementptr inbounds double, double* %arrayidx5, i64 8, !dbg !135
  %94 = load double, double* %arrayidx109, align 8, !dbg !135, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %95 = load <2 x double>, <2 x double>* %8, align 8, !dbg !136, !tbaa !92
  %96 = insertelement <2 x double> poison, double %94, i64 0, !dbg !137
  %97 = shufflevector <2 x double> %96, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !137
  %98 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %97, <2 x double> %95, <2 x double> %89), !dbg !137
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx115 = getelementptr inbounds double, double* %arrayidx5, i64 24, !dbg !138
  %99 = load double, double* %arrayidx115, align 8, !dbg !138, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %100 = insertelement <2 x double> poison, double %99, i64 0, !dbg !139
  %101 = shufflevector <2 x double> %100, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !139
  %102 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %101, <2 x double> %95, <2 x double> %93), !dbg !139
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx121 = getelementptr inbounds double, double* %arrayidx5, i64 9, !dbg !140
  %103 = load double, double* %arrayidx121, align 8, !dbg !140, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %104 = load <2 x double>, <2 x double>* %9, align 8, !dbg !141, !tbaa !92
  %105 = insertelement <2 x double> poison, double %103, i64 0, !dbg !142
  %106 = shufflevector <2 x double> %105, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !142
  %107 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %106, <2 x double> %104, <2 x double> %98), !dbg !142
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx127 = getelementptr inbounds double, double* %arrayidx5, i64 25, !dbg !143
  %108 = load double, double* %arrayidx127, align 8, !dbg !143, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %109 = insertelement <2 x double> poison, double %108, i64 0, !dbg !144
  %110 = shufflevector <2 x double> %109, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !144
  %111 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %110, <2 x double> %104, <2 x double> %102), !dbg !144
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx133 = getelementptr inbounds double, double* %arrayidx5, i64 10, !dbg !145
  %112 = load double, double* %arrayidx133, align 8, !dbg !145, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %113 = load <2 x double>, <2 x double>* %10, align 8, !dbg !146, !tbaa !92
  %114 = insertelement <2 x double> poison, double %112, i64 0, !dbg !147
  %115 = shufflevector <2 x double> %114, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !147
  %116 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %115, <2 x double> %113, <2 x double> %107), !dbg !147
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx139 = getelementptr inbounds double, double* %arrayidx5, i64 26, !dbg !148
  %117 = load double, double* %arrayidx139, align 8, !dbg !148, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %118 = insertelement <2 x double> poison, double %117, i64 0, !dbg !149
  %119 = shufflevector <2 x double> %118, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !149
  %120 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %119, <2 x double> %113, <2 x double> %111), !dbg !149
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx145 = getelementptr inbounds double, double* %arrayidx5, i64 11, !dbg !150
  %121 = load double, double* %arrayidx145, align 8, !dbg !150, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %122 = load <2 x double>, <2 x double>* %11, align 8, !dbg !151, !tbaa !92
  %123 = insertelement <2 x double> poison, double %121, i64 0, !dbg !152
  %124 = shufflevector <2 x double> %123, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !152
  %125 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %124, <2 x double> %122, <2 x double> %116), !dbg !152
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx151 = getelementptr inbounds double, double* %arrayidx5, i64 27, !dbg !153
  %126 = load double, double* %arrayidx151, align 8, !dbg !153, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %127 = insertelement <2 x double> poison, double %126, i64 0, !dbg !154
  %128 = shufflevector <2 x double> %127, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !154
  %129 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %128, <2 x double> %122, <2 x double> %120), !dbg !154
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx157 = getelementptr inbounds double, double* %arrayidx5, i64 12, !dbg !155
  %130 = load double, double* %arrayidx157, align 8, !dbg !155, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %131 = load <2 x double>, <2 x double>* %12, align 8, !dbg !156, !tbaa !92
  %132 = insertelement <2 x double> poison, double %130, i64 0, !dbg !157
  %133 = shufflevector <2 x double> %132, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !157
  %134 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %133, <2 x double> %131, <2 x double> %125), !dbg !157
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx163 = getelementptr inbounds double, double* %arrayidx5, i64 28, !dbg !158
  %135 = load double, double* %arrayidx163, align 8, !dbg !158, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %136 = insertelement <2 x double> poison, double %135, i64 0, !dbg !159
  %137 = shufflevector <2 x double> %136, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !159
  %138 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %137, <2 x double> %131, <2 x double> %129), !dbg !159
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx169 = getelementptr inbounds double, double* %arrayidx5, i64 13, !dbg !160
  %139 = load double, double* %arrayidx169, align 8, !dbg !160, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %140 = load <2 x double>, <2 x double>* %13, align 8, !dbg !161, !tbaa !92
  %141 = insertelement <2 x double> poison, double %139, i64 0, !dbg !162
  %142 = shufflevector <2 x double> %141, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !162
  %143 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %142, <2 x double> %140, <2 x double> %134), !dbg !162
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx175 = getelementptr inbounds double, double* %arrayidx5, i64 29, !dbg !163
  %144 = load double, double* %arrayidx175, align 8, !dbg !163, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %145 = insertelement <2 x double> poison, double %144, i64 0, !dbg !164
  %146 = shufflevector <2 x double> %145, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !164
  %147 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %146, <2 x double> %140, <2 x double> %138), !dbg !164
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx181 = getelementptr inbounds double, double* %arrayidx5, i64 14, !dbg !165
  %148 = load double, double* %arrayidx181, align 8, !dbg !165, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %149 = load <2 x double>, <2 x double>* %14, align 8, !dbg !166, !tbaa !92
  %150 = insertelement <2 x double> poison, double %148, i64 0, !dbg !167
  %151 = shufflevector <2 x double> %150, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !167
  %152 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %151, <2 x double> %149, <2 x double> %143), !dbg !167
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx187 = getelementptr inbounds double, double* %arrayidx5, i64 30, !dbg !168
  %153 = load double, double* %arrayidx187, align 8, !dbg !168, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %154 = insertelement <2 x double> poison, double %153, i64 0, !dbg !169
  %155 = shufflevector <2 x double> %154, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !169
  %156 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %155, <2 x double> %149, <2 x double> %147), !dbg !169
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  %arrayidx193 = getelementptr inbounds double, double* %arrayidx5, i64 15, !dbg !170
  %157 = load double, double* %arrayidx193, align 8, !dbg !170, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !77, metadata !DIExpression()), !dbg !88
  %158 = load <2 x double>, <2 x double>* %15, align 8, !dbg !171, !tbaa !92
  %159 = insertelement <2 x double> poison, double %157, i64 0, !dbg !172
  %160 = shufflevector <2 x double> %159, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !172
  %161 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %160, <2 x double> %158, <2 x double> %152), !dbg !172
  call void @llvm.dbg.value(metadata double undef, metadata !78, metadata !DIExpression()), !dbg !88
  %arrayidx199 = getelementptr inbounds double, double* %arrayidx5, i64 31, !dbg !173
  %162 = load double, double* %arrayidx199, align 8, !dbg !173, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !79, metadata !DIExpression()), !dbg !88
  %163 = insertelement <2 x double> poison, double %162, i64 0, !dbg !174
  %164 = shufflevector <2 x double> %163, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !174
  %165 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %164, <2 x double> %158, <2 x double> %156), !dbg !174
  call void @llvm.dbg.value(metadata double undef, metadata !80, metadata !DIExpression()), !dbg !88
  store <2 x double> %161, <2 x double>* %18, align 8, !dbg !175, !tbaa !92
  store <2 x double> %165, <2 x double>* %20, align 8, !dbg !176, !tbaa !92
  call void @llvm.dbg.value(metadata i64 undef, metadata !67, metadata !DIExpression(DW_OP_plus_uconst, 128, DW_OP_stack_value)), !dbg !81
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !177
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !65, metadata !DIExpression()), !dbg !81
  %cmp2 = icmp ult i64 %indvars.iv, 14, !dbg !178
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !85, !llvm.loop !179

for.end:                                          ; preds = %for.body3
  %indvars.iv.next436 = add nuw nsw i64 %indvars.iv435, 2, !dbg !182
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next436, metadata !66, metadata !DIExpression()), !dbg !81
  call void @llvm.dbg.value(metadata i64 undef, metadata !67, metadata !DIExpression(DW_OP_plus_uconst, 1024, DW_OP_stack_value)), !dbg !81
  %cmp = icmp ult i64 %indvars.iv435, 14, !dbg !183
  br i1 %cmp, label %for.body, label %for.end213, !dbg !82, !llvm.loop !184

for.end213:                                       ; preds = %for.end
  ret i64 8192, !dbg !186
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nofree nosync nounwind uwtable
define dso_local i64 @multiply_block([256 x double]* noundef readonly %A, [256 x double]* noundef readonly %B, [256 x double]* nocapture noundef writeonly %R) local_unnamed_addr #2 !dbg !187 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %A, metadata !189, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata [256 x double]* %B, metadata !190, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !191, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i64 0, metadata !194, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i32 0, metadata !193, metadata !DIExpression()), !dbg !208
  br label %for.body, !dbg !209

for.body:                                         ; preds = %entry, %for.end
  %indvars.iv423 = phi i64 [ 0, %entry ], [ %indvars.iv.next424, %for.end ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv423, metadata !193, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i64 undef, metadata !194, metadata !DIExpression()), !dbg !208
  %arrayidx = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 %indvars.iv423, !dbg !210
  call void @llvm.dbg.value(metadata double* %arrayidx, metadata !195, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i32 0, metadata !192, metadata !DIExpression()), !dbg !208
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
  call void @llvm.dbg.value(metadata i32 0, metadata !192, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i64 undef, metadata !194, metadata !DIExpression()), !dbg !208
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
  br label %for.body3, !dbg !212

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body3 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !192, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i64 undef, metadata !194, metadata !DIExpression()), !dbg !208
  %16 = shl nuw nsw i64 %indvars.iv, 4, !dbg !213
  %arrayidx5 = getelementptr inbounds [256 x double], [256 x double]* %A, i64 0, i64 %16, !dbg !214
  call void @llvm.dbg.value(metadata double* %arrayidx5, metadata !199, metadata !DIExpression()), !dbg !215
  %17 = add nuw nsw i64 %16, %indvars.iv423, !dbg !216
  %arrayidx8 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %17, !dbg !217
  call void @llvm.dbg.value(metadata double* %arrayidx8, metadata !203, metadata !DIExpression()), !dbg !215
  %18 = load double, double* %arrayidx5, align 8, !dbg !218, !tbaa !92
  %19 = load <2 x double>, <2 x double>* %0, align 8, !dbg !219, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %20 = insertelement <2 x double> poison, double %18, i64 0, !dbg !220
  %21 = shufflevector <2 x double> %20, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !220
  %22 = fmul <2 x double> %21, %19, !dbg !220
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx15 = getelementptr inbounds double, double* %arrayidx5, i64 16, !dbg !221
  %23 = load double, double* %arrayidx15, align 8, !dbg !221, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %24 = insertelement <2 x double> poison, double %23, i64 0, !dbg !222
  %25 = shufflevector <2 x double> %24, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !222
  %26 = fmul <2 x double> %19, %25, !dbg !222
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx21 = getelementptr inbounds double, double* %arrayidx5, i64 1, !dbg !223
  %27 = load double, double* %arrayidx21, align 8, !dbg !223, !tbaa !92
  %28 = load <2 x double>, <2 x double>* %1, align 8, !dbg !224, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %29 = insertelement <2 x double> poison, double %27, i64 0, !dbg !225
  %30 = shufflevector <2 x double> %29, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !225
  %31 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %30, <2 x double> %28, <2 x double> %22), !dbg !225
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx27 = getelementptr inbounds double, double* %arrayidx5, i64 17, !dbg !226
  %32 = load double, double* %arrayidx27, align 8, !dbg !226, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %33 = insertelement <2 x double> poison, double %32, i64 0, !dbg !227
  %34 = shufflevector <2 x double> %33, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !227
  %35 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %34, <2 x double> %28, <2 x double> %26), !dbg !227
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx33 = getelementptr inbounds double, double* %arrayidx5, i64 2, !dbg !228
  %36 = load double, double* %arrayidx33, align 8, !dbg !228, !tbaa !92
  %37 = load <2 x double>, <2 x double>* %2, align 8, !dbg !229, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %38 = insertelement <2 x double> poison, double %36, i64 0, !dbg !230
  %39 = shufflevector <2 x double> %38, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !230
  %40 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %39, <2 x double> %37, <2 x double> %31), !dbg !230
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx39 = getelementptr inbounds double, double* %arrayidx5, i64 18, !dbg !231
  %41 = load double, double* %arrayidx39, align 8, !dbg !231, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %42 = insertelement <2 x double> poison, double %41, i64 0, !dbg !232
  %43 = shufflevector <2 x double> %42, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !232
  %44 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %43, <2 x double> %37, <2 x double> %35), !dbg !232
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx45 = getelementptr inbounds double, double* %arrayidx5, i64 3, !dbg !233
  %45 = load double, double* %arrayidx45, align 8, !dbg !233, !tbaa !92
  %46 = load <2 x double>, <2 x double>* %3, align 8, !dbg !234, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %47 = insertelement <2 x double> poison, double %45, i64 0, !dbg !235
  %48 = shufflevector <2 x double> %47, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !235
  %49 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %48, <2 x double> %46, <2 x double> %40), !dbg !235
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx51 = getelementptr inbounds double, double* %arrayidx5, i64 19, !dbg !236
  %50 = load double, double* %arrayidx51, align 8, !dbg !236, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %51 = insertelement <2 x double> poison, double %50, i64 0, !dbg !237
  %52 = shufflevector <2 x double> %51, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !237
  %53 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %52, <2 x double> %46, <2 x double> %44), !dbg !237
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx57 = getelementptr inbounds double, double* %arrayidx5, i64 4, !dbg !238
  %54 = load double, double* %arrayidx57, align 8, !dbg !238, !tbaa !92
  %55 = load <2 x double>, <2 x double>* %4, align 8, !dbg !239, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %56 = insertelement <2 x double> poison, double %54, i64 0, !dbg !240
  %57 = shufflevector <2 x double> %56, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !240
  %58 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %57, <2 x double> %55, <2 x double> %49), !dbg !240
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx63 = getelementptr inbounds double, double* %arrayidx5, i64 20, !dbg !241
  %59 = load double, double* %arrayidx63, align 8, !dbg !241, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %60 = insertelement <2 x double> poison, double %59, i64 0, !dbg !242
  %61 = shufflevector <2 x double> %60, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !242
  %62 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %61, <2 x double> %55, <2 x double> %53), !dbg !242
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx69 = getelementptr inbounds double, double* %arrayidx5, i64 5, !dbg !243
  %63 = load double, double* %arrayidx69, align 8, !dbg !243, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %64 = load <2 x double>, <2 x double>* %5, align 8, !dbg !244, !tbaa !92
  %65 = insertelement <2 x double> poison, double %63, i64 0, !dbg !245
  %66 = shufflevector <2 x double> %65, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !245
  %67 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %66, <2 x double> %64, <2 x double> %58), !dbg !245
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx75 = getelementptr inbounds double, double* %arrayidx5, i64 21, !dbg !246
  %68 = load double, double* %arrayidx75, align 8, !dbg !246, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %69 = insertelement <2 x double> poison, double %68, i64 0, !dbg !247
  %70 = shufflevector <2 x double> %69, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !247
  %71 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %70, <2 x double> %64, <2 x double> %62), !dbg !247
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx81 = getelementptr inbounds double, double* %arrayidx5, i64 6, !dbg !248
  %72 = load double, double* %arrayidx81, align 8, !dbg !248, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %73 = load <2 x double>, <2 x double>* %6, align 8, !dbg !249, !tbaa !92
  %74 = insertelement <2 x double> poison, double %72, i64 0, !dbg !250
  %75 = shufflevector <2 x double> %74, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !250
  %76 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %75, <2 x double> %73, <2 x double> %67), !dbg !250
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx87 = getelementptr inbounds double, double* %arrayidx5, i64 22, !dbg !251
  %77 = load double, double* %arrayidx87, align 8, !dbg !251, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %78 = insertelement <2 x double> poison, double %77, i64 0, !dbg !252
  %79 = shufflevector <2 x double> %78, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !252
  %80 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %79, <2 x double> %73, <2 x double> %71), !dbg !252
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx93 = getelementptr inbounds double, double* %arrayidx5, i64 7, !dbg !253
  %81 = load double, double* %arrayidx93, align 8, !dbg !253, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %82 = load <2 x double>, <2 x double>* %7, align 8, !dbg !254, !tbaa !92
  %83 = insertelement <2 x double> poison, double %81, i64 0, !dbg !255
  %84 = shufflevector <2 x double> %83, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !255
  %85 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %84, <2 x double> %82, <2 x double> %76), !dbg !255
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx99 = getelementptr inbounds double, double* %arrayidx5, i64 23, !dbg !256
  %86 = load double, double* %arrayidx99, align 8, !dbg !256, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %87 = insertelement <2 x double> poison, double %86, i64 0, !dbg !257
  %88 = shufflevector <2 x double> %87, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !257
  %89 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %88, <2 x double> %82, <2 x double> %80), !dbg !257
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx105 = getelementptr inbounds double, double* %arrayidx5, i64 8, !dbg !258
  %90 = load double, double* %arrayidx105, align 8, !dbg !258, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %91 = load <2 x double>, <2 x double>* %8, align 8, !dbg !259, !tbaa !92
  %92 = insertelement <2 x double> poison, double %90, i64 0, !dbg !260
  %93 = shufflevector <2 x double> %92, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !260
  %94 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %93, <2 x double> %91, <2 x double> %85), !dbg !260
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx111 = getelementptr inbounds double, double* %arrayidx5, i64 24, !dbg !261
  %95 = load double, double* %arrayidx111, align 8, !dbg !261, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %96 = insertelement <2 x double> poison, double %95, i64 0, !dbg !262
  %97 = shufflevector <2 x double> %96, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !262
  %98 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %97, <2 x double> %91, <2 x double> %89), !dbg !262
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx117 = getelementptr inbounds double, double* %arrayidx5, i64 9, !dbg !263
  %99 = load double, double* %arrayidx117, align 8, !dbg !263, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %100 = load <2 x double>, <2 x double>* %9, align 8, !dbg !264, !tbaa !92
  %101 = insertelement <2 x double> poison, double %99, i64 0, !dbg !265
  %102 = shufflevector <2 x double> %101, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !265
  %103 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %102, <2 x double> %100, <2 x double> %94), !dbg !265
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx123 = getelementptr inbounds double, double* %arrayidx5, i64 25, !dbg !266
  %104 = load double, double* %arrayidx123, align 8, !dbg !266, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %105 = insertelement <2 x double> poison, double %104, i64 0, !dbg !267
  %106 = shufflevector <2 x double> %105, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !267
  %107 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %106, <2 x double> %100, <2 x double> %98), !dbg !267
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx129 = getelementptr inbounds double, double* %arrayidx5, i64 10, !dbg !268
  %108 = load double, double* %arrayidx129, align 8, !dbg !268, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %109 = load <2 x double>, <2 x double>* %10, align 8, !dbg !269, !tbaa !92
  %110 = insertelement <2 x double> poison, double %108, i64 0, !dbg !270
  %111 = shufflevector <2 x double> %110, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !270
  %112 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %111, <2 x double> %109, <2 x double> %103), !dbg !270
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx135 = getelementptr inbounds double, double* %arrayidx5, i64 26, !dbg !271
  %113 = load double, double* %arrayidx135, align 8, !dbg !271, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %114 = insertelement <2 x double> poison, double %113, i64 0, !dbg !272
  %115 = shufflevector <2 x double> %114, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !272
  %116 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %115, <2 x double> %109, <2 x double> %107), !dbg !272
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx141 = getelementptr inbounds double, double* %arrayidx5, i64 11, !dbg !273
  %117 = load double, double* %arrayidx141, align 8, !dbg !273, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %118 = load <2 x double>, <2 x double>* %11, align 8, !dbg !274, !tbaa !92
  %119 = insertelement <2 x double> poison, double %117, i64 0, !dbg !275
  %120 = shufflevector <2 x double> %119, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !275
  %121 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %120, <2 x double> %118, <2 x double> %112), !dbg !275
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx147 = getelementptr inbounds double, double* %arrayidx5, i64 27, !dbg !276
  %122 = load double, double* %arrayidx147, align 8, !dbg !276, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %123 = insertelement <2 x double> poison, double %122, i64 0, !dbg !277
  %124 = shufflevector <2 x double> %123, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !277
  %125 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %124, <2 x double> %118, <2 x double> %116), !dbg !277
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx153 = getelementptr inbounds double, double* %arrayidx5, i64 12, !dbg !278
  %126 = load double, double* %arrayidx153, align 8, !dbg !278, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %127 = load <2 x double>, <2 x double>* %12, align 8, !dbg !279, !tbaa !92
  %128 = insertelement <2 x double> poison, double %126, i64 0, !dbg !280
  %129 = shufflevector <2 x double> %128, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !280
  %130 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %129, <2 x double> %127, <2 x double> %121), !dbg !280
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx159 = getelementptr inbounds double, double* %arrayidx5, i64 28, !dbg !281
  %131 = load double, double* %arrayidx159, align 8, !dbg !281, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %132 = insertelement <2 x double> poison, double %131, i64 0, !dbg !282
  %133 = shufflevector <2 x double> %132, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !282
  %134 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %133, <2 x double> %127, <2 x double> %125), !dbg !282
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx165 = getelementptr inbounds double, double* %arrayidx5, i64 13, !dbg !283
  %135 = load double, double* %arrayidx165, align 8, !dbg !283, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %136 = load <2 x double>, <2 x double>* %13, align 8, !dbg !284, !tbaa !92
  %137 = insertelement <2 x double> poison, double %135, i64 0, !dbg !285
  %138 = shufflevector <2 x double> %137, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !285
  %139 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %138, <2 x double> %136, <2 x double> %130), !dbg !285
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx171 = getelementptr inbounds double, double* %arrayidx5, i64 29, !dbg !286
  %140 = load double, double* %arrayidx171, align 8, !dbg !286, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %141 = insertelement <2 x double> poison, double %140, i64 0, !dbg !287
  %142 = shufflevector <2 x double> %141, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !287
  %143 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %142, <2 x double> %136, <2 x double> %134), !dbg !287
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx177 = getelementptr inbounds double, double* %arrayidx5, i64 14, !dbg !288
  %144 = load double, double* %arrayidx177, align 8, !dbg !288, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %145 = load <2 x double>, <2 x double>* %14, align 8, !dbg !289, !tbaa !92
  %146 = insertelement <2 x double> poison, double %144, i64 0, !dbg !290
  %147 = shufflevector <2 x double> %146, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !290
  %148 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %147, <2 x double> %145, <2 x double> %139), !dbg !290
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx183 = getelementptr inbounds double, double* %arrayidx5, i64 30, !dbg !291
  %149 = load double, double* %arrayidx183, align 8, !dbg !291, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %150 = insertelement <2 x double> poison, double %149, i64 0, !dbg !292
  %151 = shufflevector <2 x double> %150, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !292
  %152 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %151, <2 x double> %145, <2 x double> %143), !dbg !292
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %arrayidx189 = getelementptr inbounds double, double* %arrayidx5, i64 15, !dbg !293
  %153 = load double, double* %arrayidx189, align 8, !dbg !293, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !204, metadata !DIExpression()), !dbg !215
  %154 = load <2 x double>, <2 x double>* %15, align 8, !dbg !294, !tbaa !92
  %155 = insertelement <2 x double> poison, double %153, i64 0, !dbg !295
  %156 = shufflevector <2 x double> %155, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !295
  %157 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %156, <2 x double> %154, <2 x double> %148), !dbg !295
  call void @llvm.dbg.value(metadata double undef, metadata !205, metadata !DIExpression()), !dbg !215
  %arrayidx195 = getelementptr inbounds double, double* %arrayidx5, i64 31, !dbg !296
  %158 = load double, double* %arrayidx195, align 8, !dbg !296, !tbaa !92
  call void @llvm.dbg.value(metadata double undef, metadata !206, metadata !DIExpression()), !dbg !215
  %159 = insertelement <2 x double> poison, double %158, i64 0, !dbg !297
  %160 = shufflevector <2 x double> %159, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !297
  %161 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %160, <2 x double> %154, <2 x double> %152), !dbg !297
  call void @llvm.dbg.value(metadata double undef, metadata !207, metadata !DIExpression()), !dbg !215
  %162 = bitcast double* %arrayidx8 to <2 x double>*, !dbg !298
  store <2 x double> %157, <2 x double>* %162, align 8, !dbg !298, !tbaa !92
  %arrayidx203 = getelementptr inbounds double, double* %arrayidx8, i64 16, !dbg !299
  %163 = bitcast double* %arrayidx203 to <2 x double>*, !dbg !300
  store <2 x double> %161, <2 x double>* %163, align 8, !dbg !300, !tbaa !92
  call void @llvm.dbg.value(metadata i64 undef, metadata !194, metadata !DIExpression(DW_OP_plus_uconst, 124, DW_OP_stack_value)), !dbg !208
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 2, !dbg !301
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !192, metadata !DIExpression()), !dbg !208
  %cmp2 = icmp ult i64 %indvars.iv, 14, !dbg !302
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !212, !llvm.loop !303

for.end:                                          ; preds = %for.body3
  %indvars.iv.next424 = add nuw nsw i64 %indvars.iv423, 2, !dbg !305
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next424, metadata !193, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.value(metadata i64 undef, metadata !194, metadata !DIExpression(DW_OP_plus_uconst, 992, DW_OP_stack_value)), !dbg !208
  %cmp = icmp ult i64 %indvars.iv423, 14, !dbg !306
  br i1 %cmp, label %for.body, label %for.end209, !dbg !209, !llvm.loop !307

for.end209:                                       ; preds = %for.end
  ret i64 7936, !dbg !309
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @check_block([256 x double]* nocapture noundef readonly %R, double noundef %v, i32* nocapture noundef writeonly %errorf) local_unnamed_addr #4 !dbg !310 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !315, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.value(metadata double %v, metadata !316, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.value(metadata i32* %errorf, metadata !317, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.value(metadata i32 0, metadata !319, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.value(metadata i32 0, metadata !318, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.value(metadata i32 0, metadata !319, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.value(metadata i64 0, metadata !318, metadata !DIExpression()), !dbg !320
  %arrayidx.peel = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 0, !dbg !321
  %0 = load double, double* %arrayidx.peel, align 8, !dbg !321, !tbaa !92
  %cmp1.peel = fcmp une double %0, %v, !dbg !325
  br i1 %cmp1.peel, label %if.end.peel, label %for.end, !dbg !326

if.end.peel:                                      ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !327, !tbaa !330
  %call.peel = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %1, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 noundef 0, double noundef %0, double noundef %v) #18, !dbg !332
  call void @llvm.dbg.value(metadata i32 1, metadata !319, metadata !DIExpression()), !dbg !320
  br label %for.end, !dbg !333

for.end:                                          ; preds = %if.end.peel, %entry
  call void @llvm.dbg.value(metadata i32 undef, metadata !319, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.value(metadata i64 1, metadata !318, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.value(metadata i32 undef, metadata !319, metadata !DIExpression()), !dbg !320
  call void @llvm.dbg.value(metadata i32 undef, metadata !318, metadata !DIExpression()), !dbg !320
  store i32 1, i32* %errorf, align 4, !dbg !334, !tbaa !335
  ret void, !dbg !337
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @compare_block([256 x double]* nocapture noundef readonly %R, [256 x double]* nocapture noundef readonly %B) local_unnamed_addr #4 !dbg !338 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !342, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata [256 x double]* %B, metadata !343, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i32 0, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i32 0, metadata !344, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i32 0, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i64 0, metadata !344, metadata !DIExpression()), !dbg !346
  %arrayidx.peel = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 0, !dbg !347
  %0 = load double, double* %arrayidx.peel, align 8, !dbg !347, !tbaa !92
  %arrayidx2.peel = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 0, !dbg !351
  %1 = load double, double* %arrayidx2.peel, align 8, !dbg !351, !tbaa !92
  %cmp3.peel = fcmp une double %0, %1, !dbg !352
  br i1 %cmp3.peel, label %if.end.peel, label %vector.ph, !dbg !353

if.end.peel:                                      ; preds = %entry
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !354, !tbaa !330
  %call.peel = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %2, i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @.str.1, i64 0, i64 0), i32 noundef 0, double noundef %0, double noundef %1, i32 noundef 0) #18, !dbg !357
  call void @llvm.dbg.value(metadata i32 1, metadata !345, metadata !DIExpression()), !dbg !346
  br label %vector.ph, !dbg !358

vector.ph:                                        ; preds = %if.end.peel, %entry
  %error.1.peel = phi i32 [ 1, %if.end.peel ], [ 0, %entry ], !dbg !346
  call void @llvm.dbg.value(metadata i32 %error.1.peel, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i64 1, metadata !344, metadata !DIExpression()), !dbg !346
  %3 = insertelement <2 x i32> <i32 poison, i32 0>, i32 %error.1.peel, i64 0, !dbg !359
  br label %vector.body, !dbg !359

vector.body:                                      ; preds = %vector.body.1, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body.1 ]
  %vec.phi = phi <2 x i32> [ %3, %vector.ph ], [ %31, %vector.body.1 ]
  %vec.phi31 = phi <2 x i32> [ zeroinitializer, %vector.ph ], [ %32, %vector.body.1 ]
  %offset.idx = or i64 %index, 1
  %4 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %offset.idx, !dbg !347
  %5 = bitcast double* %4 to <2 x double>*, !dbg !347
  %wide.load = load <2 x double>, <2 x double>* %5, align 8, !dbg !347, !tbaa !92
  %6 = getelementptr inbounds double, double* %4, i64 2, !dbg !347
  %7 = bitcast double* %6 to <2 x double>*, !dbg !347
  %wide.load32 = load <2 x double>, <2 x double>* %7, align 8, !dbg !347, !tbaa !92
  %8 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 %offset.idx, !dbg !351
  %9 = bitcast double* %8 to <2 x double>*, !dbg !351
  %wide.load33 = load <2 x double>, <2 x double>* %9, align 8, !dbg !351, !tbaa !92
  %10 = getelementptr inbounds double, double* %8, i64 2, !dbg !351
  %11 = bitcast double* %10 to <2 x double>*, !dbg !351
  %wide.load34 = load <2 x double>, <2 x double>* %11, align 8, !dbg !351, !tbaa !92
  %12 = fcmp une <2 x double> %wide.load, %wide.load33, !dbg !352
  %13 = fcmp une <2 x double> %wide.load32, %wide.load34, !dbg !352
  %14 = zext <2 x i1> %12 to <2 x i32>, !dbg !353
  %15 = zext <2 x i1> %13 to <2 x i32>, !dbg !353
  %16 = add <2 x i32> %vec.phi, %14, !dbg !353
  %17 = add <2 x i32> %vec.phi31, %15, !dbg !353
  %18 = icmp eq i64 %index, 248
  br i1 %18, label %for.body, label %vector.body.1, !llvm.loop !360

vector.body.1:                                    ; preds = %vector.body
  %offset.idx.1 = or i64 %index, 5
  %19 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %offset.idx.1, !dbg !347
  %20 = bitcast double* %19 to <2 x double>*, !dbg !347
  %wide.load.1 = load <2 x double>, <2 x double>* %20, align 8, !dbg !347, !tbaa !92
  %21 = getelementptr inbounds double, double* %19, i64 2, !dbg !347
  %22 = bitcast double* %21 to <2 x double>*, !dbg !347
  %wide.load32.1 = load <2 x double>, <2 x double>* %22, align 8, !dbg !347, !tbaa !92
  %23 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 %offset.idx.1, !dbg !351
  %24 = bitcast double* %23 to <2 x double>*, !dbg !351
  %wide.load33.1 = load <2 x double>, <2 x double>* %24, align 8, !dbg !351, !tbaa !92
  %25 = getelementptr inbounds double, double* %23, i64 2, !dbg !351
  %26 = bitcast double* %25 to <2 x double>*, !dbg !351
  %wide.load34.1 = load <2 x double>, <2 x double>* %26, align 8, !dbg !351, !tbaa !92
  %27 = fcmp une <2 x double> %wide.load.1, %wide.load33.1, !dbg !352
  %28 = fcmp une <2 x double> %wide.load32.1, %wide.load34.1, !dbg !352
  %29 = zext <2 x i1> %27 to <2 x i32>, !dbg !353
  %30 = zext <2 x i1> %28 to <2 x i32>, !dbg !353
  %31 = add <2 x i32> %16, %29, !dbg !353
  %32 = add <2 x i32> %17, %30, !dbg !353
  %index.next.1 = add nuw nsw i64 %index, 8
  br label %vector.body

for.body:                                         ; preds = %vector.body
  %bin.rdx = add <2 x i32> %17, %16, !dbg !359
  %33 = call i32 @llvm.vector.reduce.add.v2i32(<2 x i32> %bin.rdx), !dbg !359
  call void @llvm.dbg.value(metadata i32 %33, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i64 253, metadata !344, metadata !DIExpression()), !dbg !346
  %arrayidx = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 253, !dbg !347
  %34 = load double, double* %arrayidx, align 8, !dbg !347, !tbaa !92
  %arrayidx2 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 253, !dbg !351
  %35 = load double, double* %arrayidx2, align 8, !dbg !351, !tbaa !92
  %cmp3 = fcmp une double %34, %35, !dbg !352
  %inc = zext i1 %cmp3 to i32, !dbg !353
  %error.1 = add nuw nsw i32 %33, %inc, !dbg !353
  call void @llvm.dbg.value(metadata i32 %error.1, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i64 254, metadata !344, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i32 %error.1, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i64 254, metadata !344, metadata !DIExpression()), !dbg !346
  %arrayidx.1 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 254, !dbg !347
  %36 = load double, double* %arrayidx.1, align 8, !dbg !347, !tbaa !92
  %arrayidx2.1 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 254, !dbg !351
  %37 = load double, double* %arrayidx2.1, align 8, !dbg !351, !tbaa !92
  %cmp3.1 = fcmp une double %36, %37, !dbg !352
  %inc.1 = zext i1 %cmp3.1 to i32, !dbg !353
  %error.1.1 = add nuw nsw i32 %error.1, %inc.1, !dbg !353
  call void @llvm.dbg.value(metadata i32 %error.1.1, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i64 255, metadata !344, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i32 %error.1.1, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i64 255, metadata !344, metadata !DIExpression()), !dbg !346
  %arrayidx.2 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 255, !dbg !347
  %38 = load double, double* %arrayidx.2, align 8, !dbg !347, !tbaa !92
  %arrayidx2.2 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 0, i64 255, !dbg !351
  %39 = load double, double* %arrayidx2.2, align 8, !dbg !351, !tbaa !92
  %cmp3.2 = fcmp une double %38, %39, !dbg !352
  %inc.2 = zext i1 %cmp3.2 to i32, !dbg !353
  %error.1.2 = add nuw nsw i32 %error.1.1, %inc.2, !dbg !353
  call void @llvm.dbg.value(metadata i32 %error.1.2, metadata !345, metadata !DIExpression()), !dbg !346
  call void @llvm.dbg.value(metadata i64 256, metadata !344, metadata !DIExpression()), !dbg !346
  ret i32 %error.1.2, !dbg !364
}

; Function Attrs: nounwind uwtable
define dso_local void @check_matrix([256 x double]* noundef %R, i64 noundef %x, i64 noundef %y, i64 noundef %o, double noundef %v, i32* noundef %errorf) local_unnamed_addr #6 !dbg !365 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !377
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !369, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i64 %x, metadata !370, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i64 %y, metadata !371, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i64 %o, metadata !372, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata double %v, metadata !373, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i32* %errorf, metadata !374, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i32 0, metadata !375, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i32 0, metadata !376, metadata !DIExpression()), !dbg !380
  %mul4853 = mul nsw i64 %y, %x, !dbg !381
  %cmp4954 = icmp eq i64 %mul4853, 1, !dbg !383
  br i1 %cmp4954, label %if.then, label %if.end.lr.ph, !dbg !384

if.end.lr.ph:                                     ; preds = %entry, %det.cont
  %y.tr.ph57 = phi i64 [ %y.tr51, %det.cont ], [ %y, %entry ]
  %x.tr.ph56 = phi i64 [ %div5, %det.cont ], [ %x, %entry ]
  %R.tr.ph55 = phi [256 x double]* [ %add.ptr, %det.cont ], [ %R, %entry ]
  call void @llvm.dbg.value(metadata i64 %y.tr.ph57, metadata !371, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i64 %x.tr.ph56, metadata !370, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata [256 x double]* %R.tr.ph55, metadata !369, metadata !DIExpression()), !dbg !380
  br label %if.end, !dbg !384

if.then:                                          ; preds = %det.cont, %det.cont8, %entry
  %R.tr.lcssa = phi [256 x double]* [ %R, %entry ], [ %add.ptr10, %det.cont8 ], [ %add.ptr, %det.cont ]
  call void @llvm.dbg.value(metadata [256 x double]* %R.tr.lcssa, metadata !315, metadata !DIExpression()) #19, !dbg !385
  call void @llvm.dbg.value(metadata double %v, metadata !316, metadata !DIExpression()) #19, !dbg !385
  call void @llvm.dbg.value(metadata i32* %errorf, metadata !317, metadata !DIExpression()) #19, !dbg !385
  call void @llvm.dbg.value(metadata i32 0, metadata !319, metadata !DIExpression()) #19, !dbg !385
  call void @llvm.dbg.value(metadata i64 0, metadata !318, metadata !DIExpression()) #19, !dbg !385
  %arrayidx.peel.i = getelementptr inbounds [256 x double], [256 x double]* %R.tr.lcssa, i64 0, i64 0, !dbg !388
  %0 = load double, double* %arrayidx.peel.i, align 8, !dbg !388, !tbaa !92
  %cmp1.peel.i = fcmp une double %0, %v, !dbg !389
  br i1 %cmp1.peel.i, label %if.end.peel.i, label %for.body.peel.next.i, !dbg !390

if.end.peel.i:                                    ; preds = %if.then
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !391, !tbaa !330
  %call.peel.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %1, i8* noundef getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0), i32 noundef 0, double noundef %0, double noundef %v) #20, !dbg !392
  call void @llvm.dbg.value(metadata i32 1, metadata !319, metadata !DIExpression()) #19, !dbg !385
  br label %for.body.peel.next.i, !dbg !393

for.body.peel.next.i:                             ; preds = %if.end.peel.i, %if.then
  call void @llvm.dbg.value(metadata i32 undef, metadata !319, metadata !DIExpression()), !dbg !385
  call void @llvm.dbg.value(metadata i32 undef, metadata !318, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)), !dbg !385
  store i32 1, i32* %errorf, align 4, !dbg !394, !tbaa !335
  sync within %syncreg, label %cleanup.split, !dbg !395

if.end:                                           ; preds = %if.end.lr.ph, %det.cont8
  %y.tr51 = phi i64 [ %y.tr.ph57, %if.end.lr.ph ], [ %div12, %det.cont8 ]
  %R.tr50 = phi [256 x double]* [ %R.tr.ph55, %if.end.lr.ph ], [ %add.ptr10, %det.cont8 ]
  call void @llvm.dbg.value(metadata i64 %y.tr51, metadata !371, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata [256 x double]* %R.tr50, metadata !369, metadata !DIExpression()), !dbg !380
  %cmp1 = icmp sgt i64 %x.tr.ph56, %y.tr51, !dbg !396
  br i1 %cmp1, label %if.then2.tf, label %if.else.tf, !dbg !397

if.then2.tf:                                      ; preds = %if.end
  %div = sdiv i64 %x.tr.ph56, 2, !dbg !398
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !399

det.achd:                                         ; preds = %if.then2.tf
  tail call void @check_matrix([256 x double]* noundef %R.tr50, i64 noundef %div, i64 noundef %y.tr51, i64 noundef %o, double noundef %v, i32* noundef %errorf), !dbg !399
  reattach within %syncreg, label %det.cont, !dbg !399

det.cont:                                         ; preds = %det.achd, %if.then2.tf
  %mul4 = mul nsw i64 %div, %o, !dbg !400
  %add.ptr = getelementptr inbounds [256 x double], [256 x double]* %R.tr50, i64 %mul4, !dbg !401
  %add = add nsw i64 %x.tr.ph56, 1, !dbg !402
  %div5 = sdiv i64 %add, 2, !dbg !403
  call void @llvm.dbg.value(metadata [256 x double]* %add.ptr, metadata !369, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i64 %div5, metadata !370, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i64 %y.tr51, metadata !371, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i64 %o, metadata !372, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata double %v, metadata !373, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i32* %errorf, metadata !374, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i32 0, metadata !375, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i32 0, metadata !376, metadata !DIExpression()), !dbg !380
  %mul48 = mul nsw i64 %y.tr51, %div5, !dbg !381
  %cmp49 = icmp eq i64 %mul48, 1, !dbg !383
  br i1 %cmp49, label %if.then, label %if.end.lr.ph, !dbg !384

if.else.tf:                                       ; preds = %if.end
  %div6 = sdiv i64 %y.tr51, 2, !dbg !404
  detach within %syncreg, label %det.achd7, label %det.cont8, !dbg !406

det.achd7:                                        ; preds = %if.else.tf
  tail call void @check_matrix([256 x double]* noundef %R.tr50, i64 noundef %x.tr.ph56, i64 noundef %div6, i64 noundef %o, double noundef %v, i32* noundef %errorf), !dbg !406
  reattach within %syncreg, label %det.cont8, !dbg !406

det.cont8:                                        ; preds = %det.achd7, %if.else.tf
  %add.ptr10 = getelementptr inbounds [256 x double], [256 x double]* %R.tr50, i64 %div6, !dbg !407
  %add11 = add nsw i64 %y.tr51, 1, !dbg !408
  %div12 = sdiv i64 %add11, 2, !dbg !409
  call void @llvm.dbg.value(metadata [256 x double]* %add.ptr10, metadata !369, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i64 %x.tr.ph56, metadata !370, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i64 %div12, metadata !371, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i64 %o, metadata !372, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata double %v, metadata !373, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i32* %errorf, metadata !374, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i32 0, metadata !375, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.value(metadata i32 0, metadata !376, metadata !DIExpression()), !dbg !380
  %mul = mul nsw i64 %div12, %x.tr.ph56, !dbg !381
  %cmp = icmp eq i64 %mul, 1, !dbg !383
  br i1 %cmp, label %if.then, label %if.end, !dbg !384

cleanup.split:                                    ; preds = %for.body.peel.next.i
  ret void, !dbg !395
}

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare token @llvm.syncregion.start() #7

; Function Attrs: argmemonly nofree norecurse nosync nounwind uwtable
define dso_local i64 @add_block([256 x double]* nocapture noundef readonly %T, [256 x double]* nocapture noundef %R) local_unnamed_addr #8 !dbg !410 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %T, metadata !414, metadata !DIExpression()), !dbg !417
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !415, metadata !DIExpression()), !dbg !417
  call void @llvm.dbg.value(metadata i64 0, metadata !416, metadata !DIExpression()), !dbg !417
  br label %for.body, !dbg !418

for.body:                                         ; preds = %entry, %for.body
  %i.034 = phi i64 [ 0, %entry ], [ %add17, %for.body ]
  call void @llvm.dbg.value(metadata i64 %i.034, metadata !416, metadata !DIExpression()), !dbg !417
  %arrayidx = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %i.034, !dbg !420
  %0 = load double, double* %arrayidx, align 8, !dbg !420, !tbaa !92
  %arrayidx1 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %i.034, !dbg !423
  %1 = load double, double* %arrayidx1, align 8, !dbg !424, !tbaa !92
  %add = fadd double %0, %1, !dbg !424
  store double %add, double* %arrayidx1, align 8, !dbg !424, !tbaa !92
  %add2 = or i64 %i.034, 1, !dbg !425
  %arrayidx3 = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %add2, !dbg !426
  %2 = load double, double* %arrayidx3, align 8, !dbg !426, !tbaa !92
  %arrayidx5 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %add2, !dbg !427
  %3 = load double, double* %arrayidx5, align 8, !dbg !428, !tbaa !92
  %add6 = fadd double %2, %3, !dbg !428
  store double %add6, double* %arrayidx5, align 8, !dbg !428, !tbaa !92
  %add7 = or i64 %i.034, 2, !dbg !429
  %arrayidx8 = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %add7, !dbg !430
  %4 = load double, double* %arrayidx8, align 8, !dbg !430, !tbaa !92
  %arrayidx10 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %add7, !dbg !431
  %5 = load double, double* %arrayidx10, align 8, !dbg !432, !tbaa !92
  %add11 = fadd double %4, %5, !dbg !432
  store double %add11, double* %arrayidx10, align 8, !dbg !432, !tbaa !92
  %add12 = or i64 %i.034, 3, !dbg !433
  %arrayidx13 = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %add12, !dbg !434
  %6 = load double, double* %arrayidx13, align 8, !dbg !434, !tbaa !92
  %arrayidx15 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %add12, !dbg !435
  %7 = load double, double* %arrayidx15, align 8, !dbg !436, !tbaa !92
  %add16 = fadd double %6, %7, !dbg !436
  store double %add16, double* %arrayidx15, align 8, !dbg !436, !tbaa !92
  %add17 = add nuw nsw i64 %i.034, 4, !dbg !437
  call void @llvm.dbg.value(metadata i64 %add17, metadata !416, metadata !DIExpression()), !dbg !417
  %cmp = icmp ult i64 %i.034, 252, !dbg !438
  br i1 %cmp, label %for.body, label %for.end, !dbg !418, !llvm.loop !439

for.end:                                          ; preds = %for.body
  ret i64 256, !dbg !441
}

; Function Attrs: argmemonly nounwind uwtable
define dso_local void @add_matrix([256 x double]* noundef %T, i64 noundef %ot, [256 x double]* noundef %R, i64 noundef %orr, i64 noundef %x, i64 noundef %y) local_unnamed_addr #9 !dbg !442 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !452
  call void @llvm.dbg.value(metadata [256 x double]* %T, metadata !446, metadata !DIExpression()), !dbg !455
  call void @llvm.dbg.value(metadata i64 %ot, metadata !447, metadata !DIExpression()), !dbg !455
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !448, metadata !DIExpression()), !dbg !455
  call void @llvm.dbg.value(metadata i64 %orr, metadata !449, metadata !DIExpression()), !dbg !455
  call void @llvm.dbg.value(metadata i64 %x, metadata !450, metadata !DIExpression()), !dbg !455
  call void @llvm.dbg.value(metadata i64 %y, metadata !451, metadata !DIExpression()), !dbg !455
  %add = add nsw i64 %y, %x, !dbg !456
  %cmp = icmp eq i64 %add, 2, !dbg !458
  br i1 %cmp, label %for.body.i, label %if.end, !dbg !459

for.body.i:                                       ; preds = %entry, %for.body.i
  %i.034.i = phi i64 [ %add17.i, %for.body.i ], [ 0, %entry ]
  call void @llvm.dbg.value(metadata i64 %i.034.i, metadata !416, metadata !DIExpression()), !dbg !460
  %arrayidx.i = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %i.034.i, !dbg !463
  %0 = load double, double* %arrayidx.i, align 8, !dbg !463, !tbaa !92
  %arrayidx1.i = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %i.034.i, !dbg !464
  %1 = load double, double* %arrayidx1.i, align 8, !dbg !465, !tbaa !92
  %add.i = fadd double %0, %1, !dbg !465
  store double %add.i, double* %arrayidx1.i, align 8, !dbg !465, !tbaa !92
  %add2.i = or i64 %i.034.i, 1, !dbg !466
  %arrayidx3.i = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %add2.i, !dbg !467
  %2 = load double, double* %arrayidx3.i, align 8, !dbg !467, !tbaa !92
  %arrayidx5.i = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %add2.i, !dbg !468
  %3 = load double, double* %arrayidx5.i, align 8, !dbg !469, !tbaa !92
  %add6.i = fadd double %2, %3, !dbg !469
  store double %add6.i, double* %arrayidx5.i, align 8, !dbg !469, !tbaa !92
  %add7.i = or i64 %i.034.i, 2, !dbg !470
  %arrayidx8.i = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %add7.i, !dbg !471
  %4 = load double, double* %arrayidx8.i, align 8, !dbg !471, !tbaa !92
  %arrayidx10.i = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %add7.i, !dbg !472
  %5 = load double, double* %arrayidx10.i, align 8, !dbg !473, !tbaa !92
  %add11.i = fadd double %4, %5, !dbg !473
  store double %add11.i, double* %arrayidx10.i, align 8, !dbg !473, !tbaa !92
  %add12.i = or i64 %i.034.i, 3, !dbg !474
  %arrayidx13.i = getelementptr inbounds [256 x double], [256 x double]* %T, i64 0, i64 %add12.i, !dbg !475
  %6 = load double, double* %arrayidx13.i, align 8, !dbg !475, !tbaa !92
  %arrayidx15.i = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 %add12.i, !dbg !476
  %7 = load double, double* %arrayidx15.i, align 8, !dbg !477, !tbaa !92
  %add16.i = fadd double %6, %7, !dbg !477
  store double %add16.i, double* %arrayidx15.i, align 8, !dbg !477, !tbaa !92
  %add17.i = add nuw nsw i64 %i.034.i, 4, !dbg !478
  call void @llvm.dbg.value(metadata i64 %add17.i, metadata !416, metadata !DIExpression()), !dbg !460
  %cmp.i = icmp ult i64 %i.034.i, 252, !dbg !479
  br i1 %cmp.i, label %for.body.i, label %sync.continue, !dbg !480, !llvm.loop !481

if.end:                                           ; preds = %entry
  %cmp1 = icmp sgt i64 %x, %y, !dbg !483
  br i1 %cmp1, label %if.then2.tf, label %if.else.tf, !dbg !484

if.then2.tf:                                      ; preds = %if.end
  %div = sdiv i64 %x, 2, !dbg !485
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !486

det.achd:                                         ; preds = %if.then2.tf
  tail call void @add_matrix([256 x double]* noundef %T, i64 noundef %ot, [256 x double]* noundef %R, i64 noundef %orr, i64 noundef %div, i64 noundef %y), !dbg !486
  reattach within %syncreg, label %det.cont, !dbg !486

det.cont:                                         ; preds = %det.achd, %if.then2.tf
  %mul = mul nsw i64 %div, %ot, !dbg !487
  %add.ptr = getelementptr inbounds [256 x double], [256 x double]* %T, i64 %mul, !dbg !488
  %mul5 = mul nsw i64 %div, %orr, !dbg !489
  %add.ptr6 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 %mul5, !dbg !490
  %add7 = add nsw i64 %x, 1, !dbg !491
  %div8 = sdiv i64 %add7, 2, !dbg !492
  tail call void @add_matrix([256 x double]* noundef %add.ptr, i64 noundef %ot, [256 x double]* noundef %add.ptr6, i64 noundef %orr, i64 noundef %div8, i64 noundef %y), !dbg !493
  br label %if.end18, !dbg !494

if.else.tf:                                       ; preds = %if.end
  %div9 = sdiv i64 %y, 2, !dbg !495
  detach within %syncreg, label %det.achd10, label %det.cont11, !dbg !497

det.achd10:                                       ; preds = %if.else.tf
  tail call void @add_matrix([256 x double]* noundef %T, i64 noundef %ot, [256 x double]* noundef %R, i64 noundef %orr, i64 noundef %x, i64 noundef %div9), !dbg !497
  reattach within %syncreg, label %det.cont11, !dbg !497

det.cont11:                                       ; preds = %det.achd10, %if.else.tf
  %add.ptr13 = getelementptr inbounds [256 x double], [256 x double]* %T, i64 %div9, !dbg !498
  %add.ptr15 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 %div9, !dbg !499
  %add16 = add nsw i64 %y, 1, !dbg !500
  %div17 = sdiv i64 %add16, 2, !dbg !501
  tail call void @add_matrix([256 x double]* noundef %add.ptr13, i64 noundef %ot, [256 x double]* noundef %add.ptr15, i64 noundef %orr, i64 noundef %x, i64 noundef %div17), !dbg !502
  br label %if.end18

if.end18:                                         ; preds = %det.cont11, %det.cont
  sync within %syncreg, label %sync.continue, !dbg !503

sync.continue:                                    ; preds = %for.body.i, %if.end18
  ret void, !dbg !504
}

; Function Attrs: argmemonly nofree norecurse nosync nounwind uwtable writeonly
define dso_local void @init_block([256 x double]* nocapture noundef writeonly %R, double noundef %v) local_unnamed_addr #10 !dbg !505 {
entry:
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !509, metadata !DIExpression()), !dbg !512
  call void @llvm.dbg.value(metadata double %v, metadata !510, metadata !DIExpression()), !dbg !512
  call void @llvm.dbg.value(metadata i32 0, metadata !511, metadata !DIExpression()), !dbg !512
  %broadcast.splatinsert = insertelement <2 x double> poison, double %v, i64 0, !dbg !513
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !513
  %0 = bitcast [256 x double]* %R to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %0, align 8, !dbg !515, !tbaa !92
  %1 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 2, !dbg !515
  %2 = bitcast double* %1 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %2, align 8, !dbg !515, !tbaa !92
  %3 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 4, !dbg !517
  %4 = bitcast double* %3 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %4, align 8, !dbg !515, !tbaa !92
  %5 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 6, !dbg !515
  %6 = bitcast double* %5 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %6, align 8, !dbg !515, !tbaa !92
  %7 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 8, !dbg !517
  %8 = bitcast double* %7 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %8, align 8, !dbg !515, !tbaa !92
  %9 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 10, !dbg !515
  %10 = bitcast double* %9 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %10, align 8, !dbg !515, !tbaa !92
  %11 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 12, !dbg !517
  %12 = bitcast double* %11 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %12, align 8, !dbg !515, !tbaa !92
  %13 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 14, !dbg !515
  %14 = bitcast double* %13 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %14, align 8, !dbg !515, !tbaa !92
  %15 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 16, !dbg !517
  %16 = bitcast double* %15 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %16, align 8, !dbg !515, !tbaa !92
  %17 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 18, !dbg !515
  %18 = bitcast double* %17 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %18, align 8, !dbg !515, !tbaa !92
  %19 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 20, !dbg !517
  %20 = bitcast double* %19 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %20, align 8, !dbg !515, !tbaa !92
  %21 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 22, !dbg !515
  %22 = bitcast double* %21 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %22, align 8, !dbg !515, !tbaa !92
  %23 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 24, !dbg !517
  %24 = bitcast double* %23 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %24, align 8, !dbg !515, !tbaa !92
  %25 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 26, !dbg !515
  %26 = bitcast double* %25 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %26, align 8, !dbg !515, !tbaa !92
  %27 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 28, !dbg !517
  %28 = bitcast double* %27 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %28, align 8, !dbg !515, !tbaa !92
  %29 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 30, !dbg !515
  %30 = bitcast double* %29 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %30, align 8, !dbg !515, !tbaa !92
  %31 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 32, !dbg !517
  %32 = bitcast double* %31 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %32, align 8, !dbg !515, !tbaa !92
  %33 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 34, !dbg !515
  %34 = bitcast double* %33 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %34, align 8, !dbg !515, !tbaa !92
  %35 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 36, !dbg !517
  %36 = bitcast double* %35 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %36, align 8, !dbg !515, !tbaa !92
  %37 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 38, !dbg !515
  %38 = bitcast double* %37 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %38, align 8, !dbg !515, !tbaa !92
  %39 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 40, !dbg !517
  %40 = bitcast double* %39 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %40, align 8, !dbg !515, !tbaa !92
  %41 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 42, !dbg !515
  %42 = bitcast double* %41 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %42, align 8, !dbg !515, !tbaa !92
  %43 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 44, !dbg !517
  %44 = bitcast double* %43 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %44, align 8, !dbg !515, !tbaa !92
  %45 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 46, !dbg !515
  %46 = bitcast double* %45 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %46, align 8, !dbg !515, !tbaa !92
  %47 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 48, !dbg !517
  %48 = bitcast double* %47 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %48, align 8, !dbg !515, !tbaa !92
  %49 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 50, !dbg !515
  %50 = bitcast double* %49 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %50, align 8, !dbg !515, !tbaa !92
  %51 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 52, !dbg !517
  %52 = bitcast double* %51 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %52, align 8, !dbg !515, !tbaa !92
  %53 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 54, !dbg !515
  %54 = bitcast double* %53 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %54, align 8, !dbg !515, !tbaa !92
  %55 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 56, !dbg !517
  %56 = bitcast double* %55 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %56, align 8, !dbg !515, !tbaa !92
  %57 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 58, !dbg !515
  %58 = bitcast double* %57 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %58, align 8, !dbg !515, !tbaa !92
  %59 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 60, !dbg !517
  %60 = bitcast double* %59 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %60, align 8, !dbg !515, !tbaa !92
  %61 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 62, !dbg !515
  %62 = bitcast double* %61 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %62, align 8, !dbg !515, !tbaa !92
  %63 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 64, !dbg !517
  %64 = bitcast double* %63 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %64, align 8, !dbg !515, !tbaa !92
  %65 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 66, !dbg !515
  %66 = bitcast double* %65 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %66, align 8, !dbg !515, !tbaa !92
  %67 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 68, !dbg !517
  %68 = bitcast double* %67 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %68, align 8, !dbg !515, !tbaa !92
  %69 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 70, !dbg !515
  %70 = bitcast double* %69 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %70, align 8, !dbg !515, !tbaa !92
  %71 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 72, !dbg !517
  %72 = bitcast double* %71 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %72, align 8, !dbg !515, !tbaa !92
  %73 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 74, !dbg !515
  %74 = bitcast double* %73 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %74, align 8, !dbg !515, !tbaa !92
  %75 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 76, !dbg !517
  %76 = bitcast double* %75 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %76, align 8, !dbg !515, !tbaa !92
  %77 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 78, !dbg !515
  %78 = bitcast double* %77 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %78, align 8, !dbg !515, !tbaa !92
  %79 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 80, !dbg !517
  %80 = bitcast double* %79 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %80, align 8, !dbg !515, !tbaa !92
  %81 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 82, !dbg !515
  %82 = bitcast double* %81 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %82, align 8, !dbg !515, !tbaa !92
  %83 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 84, !dbg !517
  %84 = bitcast double* %83 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %84, align 8, !dbg !515, !tbaa !92
  %85 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 86, !dbg !515
  %86 = bitcast double* %85 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %86, align 8, !dbg !515, !tbaa !92
  %87 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 88, !dbg !517
  %88 = bitcast double* %87 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %88, align 8, !dbg !515, !tbaa !92
  %89 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 90, !dbg !515
  %90 = bitcast double* %89 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %90, align 8, !dbg !515, !tbaa !92
  %91 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 92, !dbg !517
  %92 = bitcast double* %91 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %92, align 8, !dbg !515, !tbaa !92
  %93 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 94, !dbg !515
  %94 = bitcast double* %93 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %94, align 8, !dbg !515, !tbaa !92
  %95 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 96, !dbg !517
  %96 = bitcast double* %95 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %96, align 8, !dbg !515, !tbaa !92
  %97 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 98, !dbg !515
  %98 = bitcast double* %97 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %98, align 8, !dbg !515, !tbaa !92
  %99 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 100, !dbg !517
  %100 = bitcast double* %99 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %100, align 8, !dbg !515, !tbaa !92
  %101 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 102, !dbg !515
  %102 = bitcast double* %101 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %102, align 8, !dbg !515, !tbaa !92
  %103 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 104, !dbg !517
  %104 = bitcast double* %103 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %104, align 8, !dbg !515, !tbaa !92
  %105 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 106, !dbg !515
  %106 = bitcast double* %105 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %106, align 8, !dbg !515, !tbaa !92
  %107 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 108, !dbg !517
  %108 = bitcast double* %107 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %108, align 8, !dbg !515, !tbaa !92
  %109 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 110, !dbg !515
  %110 = bitcast double* %109 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %110, align 8, !dbg !515, !tbaa !92
  %111 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 112, !dbg !517
  %112 = bitcast double* %111 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %112, align 8, !dbg !515, !tbaa !92
  %113 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 114, !dbg !515
  %114 = bitcast double* %113 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %114, align 8, !dbg !515, !tbaa !92
  %115 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 116, !dbg !517
  %116 = bitcast double* %115 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %116, align 8, !dbg !515, !tbaa !92
  %117 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 118, !dbg !515
  %118 = bitcast double* %117 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %118, align 8, !dbg !515, !tbaa !92
  %119 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 120, !dbg !517
  %120 = bitcast double* %119 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %120, align 8, !dbg !515, !tbaa !92
  %121 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 122, !dbg !515
  %122 = bitcast double* %121 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %122, align 8, !dbg !515, !tbaa !92
  %123 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 124, !dbg !517
  %124 = bitcast double* %123 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %124, align 8, !dbg !515, !tbaa !92
  %125 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 126, !dbg !515
  %126 = bitcast double* %125 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %126, align 8, !dbg !515, !tbaa !92
  %127 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 128, !dbg !517
  %128 = bitcast double* %127 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %128, align 8, !dbg !515, !tbaa !92
  %129 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 130, !dbg !515
  %130 = bitcast double* %129 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %130, align 8, !dbg !515, !tbaa !92
  %131 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 132, !dbg !517
  %132 = bitcast double* %131 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %132, align 8, !dbg !515, !tbaa !92
  %133 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 134, !dbg !515
  %134 = bitcast double* %133 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %134, align 8, !dbg !515, !tbaa !92
  %135 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 136, !dbg !517
  %136 = bitcast double* %135 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %136, align 8, !dbg !515, !tbaa !92
  %137 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 138, !dbg !515
  %138 = bitcast double* %137 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %138, align 8, !dbg !515, !tbaa !92
  %139 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 140, !dbg !517
  %140 = bitcast double* %139 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %140, align 8, !dbg !515, !tbaa !92
  %141 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 142, !dbg !515
  %142 = bitcast double* %141 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %142, align 8, !dbg !515, !tbaa !92
  %143 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 144, !dbg !517
  %144 = bitcast double* %143 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %144, align 8, !dbg !515, !tbaa !92
  %145 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 146, !dbg !515
  %146 = bitcast double* %145 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %146, align 8, !dbg !515, !tbaa !92
  %147 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 148, !dbg !517
  %148 = bitcast double* %147 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %148, align 8, !dbg !515, !tbaa !92
  %149 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 150, !dbg !515
  %150 = bitcast double* %149 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %150, align 8, !dbg !515, !tbaa !92
  %151 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 152, !dbg !517
  %152 = bitcast double* %151 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %152, align 8, !dbg !515, !tbaa !92
  %153 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 154, !dbg !515
  %154 = bitcast double* %153 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %154, align 8, !dbg !515, !tbaa !92
  %155 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 156, !dbg !517
  %156 = bitcast double* %155 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %156, align 8, !dbg !515, !tbaa !92
  %157 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 158, !dbg !515
  %158 = bitcast double* %157 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %158, align 8, !dbg !515, !tbaa !92
  %159 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 160, !dbg !517
  %160 = bitcast double* %159 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %160, align 8, !dbg !515, !tbaa !92
  %161 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 162, !dbg !515
  %162 = bitcast double* %161 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %162, align 8, !dbg !515, !tbaa !92
  %163 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 164, !dbg !517
  %164 = bitcast double* %163 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %164, align 8, !dbg !515, !tbaa !92
  %165 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 166, !dbg !515
  %166 = bitcast double* %165 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %166, align 8, !dbg !515, !tbaa !92
  %167 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 168, !dbg !517
  %168 = bitcast double* %167 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %168, align 8, !dbg !515, !tbaa !92
  %169 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 170, !dbg !515
  %170 = bitcast double* %169 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %170, align 8, !dbg !515, !tbaa !92
  %171 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 172, !dbg !517
  %172 = bitcast double* %171 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %172, align 8, !dbg !515, !tbaa !92
  %173 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 174, !dbg !515
  %174 = bitcast double* %173 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %174, align 8, !dbg !515, !tbaa !92
  %175 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 176, !dbg !517
  %176 = bitcast double* %175 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %176, align 8, !dbg !515, !tbaa !92
  %177 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 178, !dbg !515
  %178 = bitcast double* %177 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %178, align 8, !dbg !515, !tbaa !92
  %179 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 180, !dbg !517
  %180 = bitcast double* %179 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %180, align 8, !dbg !515, !tbaa !92
  %181 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 182, !dbg !515
  %182 = bitcast double* %181 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %182, align 8, !dbg !515, !tbaa !92
  %183 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 184, !dbg !517
  %184 = bitcast double* %183 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %184, align 8, !dbg !515, !tbaa !92
  %185 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 186, !dbg !515
  %186 = bitcast double* %185 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %186, align 8, !dbg !515, !tbaa !92
  %187 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 188, !dbg !517
  %188 = bitcast double* %187 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %188, align 8, !dbg !515, !tbaa !92
  %189 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 190, !dbg !515
  %190 = bitcast double* %189 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %190, align 8, !dbg !515, !tbaa !92
  %191 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 192, !dbg !517
  %192 = bitcast double* %191 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %192, align 8, !dbg !515, !tbaa !92
  %193 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 194, !dbg !515
  %194 = bitcast double* %193 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %194, align 8, !dbg !515, !tbaa !92
  %195 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 196, !dbg !517
  %196 = bitcast double* %195 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %196, align 8, !dbg !515, !tbaa !92
  %197 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 198, !dbg !515
  %198 = bitcast double* %197 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %198, align 8, !dbg !515, !tbaa !92
  %199 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 200, !dbg !517
  %200 = bitcast double* %199 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %200, align 8, !dbg !515, !tbaa !92
  %201 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 202, !dbg !515
  %202 = bitcast double* %201 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %202, align 8, !dbg !515, !tbaa !92
  %203 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 204, !dbg !517
  %204 = bitcast double* %203 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %204, align 8, !dbg !515, !tbaa !92
  %205 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 206, !dbg !515
  %206 = bitcast double* %205 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %206, align 8, !dbg !515, !tbaa !92
  %207 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 208, !dbg !517
  %208 = bitcast double* %207 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %208, align 8, !dbg !515, !tbaa !92
  %209 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 210, !dbg !515
  %210 = bitcast double* %209 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %210, align 8, !dbg !515, !tbaa !92
  %211 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 212, !dbg !517
  %212 = bitcast double* %211 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %212, align 8, !dbg !515, !tbaa !92
  %213 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 214, !dbg !515
  %214 = bitcast double* %213 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %214, align 8, !dbg !515, !tbaa !92
  %215 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 216, !dbg !517
  %216 = bitcast double* %215 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %216, align 8, !dbg !515, !tbaa !92
  %217 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 218, !dbg !515
  %218 = bitcast double* %217 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %218, align 8, !dbg !515, !tbaa !92
  %219 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 220, !dbg !517
  %220 = bitcast double* %219 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %220, align 8, !dbg !515, !tbaa !92
  %221 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 222, !dbg !515
  %222 = bitcast double* %221 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %222, align 8, !dbg !515, !tbaa !92
  %223 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 224, !dbg !517
  %224 = bitcast double* %223 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %224, align 8, !dbg !515, !tbaa !92
  %225 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 226, !dbg !515
  %226 = bitcast double* %225 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %226, align 8, !dbg !515, !tbaa !92
  %227 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 228, !dbg !517
  %228 = bitcast double* %227 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %228, align 8, !dbg !515, !tbaa !92
  %229 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 230, !dbg !515
  %230 = bitcast double* %229 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %230, align 8, !dbg !515, !tbaa !92
  %231 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 232, !dbg !517
  %232 = bitcast double* %231 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %232, align 8, !dbg !515, !tbaa !92
  %233 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 234, !dbg !515
  %234 = bitcast double* %233 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %234, align 8, !dbg !515, !tbaa !92
  %235 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 236, !dbg !517
  %236 = bitcast double* %235 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %236, align 8, !dbg !515, !tbaa !92
  %237 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 238, !dbg !515
  %238 = bitcast double* %237 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %238, align 8, !dbg !515, !tbaa !92
  %239 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 240, !dbg !517
  %240 = bitcast double* %239 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %240, align 8, !dbg !515, !tbaa !92
  %241 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 242, !dbg !515
  %242 = bitcast double* %241 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %242, align 8, !dbg !515, !tbaa !92
  %243 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 244, !dbg !517
  %244 = bitcast double* %243 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %244, align 8, !dbg !515, !tbaa !92
  %245 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 246, !dbg !515
  %246 = bitcast double* %245 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %246, align 8, !dbg !515, !tbaa !92
  %247 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 248, !dbg !517
  %248 = bitcast double* %247 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %248, align 8, !dbg !515, !tbaa !92
  %249 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 250, !dbg !515
  %250 = bitcast double* %249 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %250, align 8, !dbg !515, !tbaa !92
  %251 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 252, !dbg !517
  %252 = bitcast double* %251 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %252, align 8, !dbg !515, !tbaa !92
  %253 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 254, !dbg !515
  %254 = bitcast double* %253 to <2 x double>*, !dbg !515
  store <2 x double> %broadcast.splat, <2 x double>* %254, align 8, !dbg !515, !tbaa !92
  ret void, !dbg !518
}

; Function Attrs: argmemonly nounwind uwtable writeonly
define dso_local void @init_matrix([256 x double]* noundef %R, i64 noundef %x, i64 noundef %y, i64 noundef %o, double noundef %v) local_unnamed_addr #11 !dbg !519 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !528
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !523, metadata !DIExpression()), !dbg !531
  call void @llvm.dbg.value(metadata i64 %x, metadata !524, metadata !DIExpression()), !dbg !531
  call void @llvm.dbg.value(metadata i64 %y, metadata !525, metadata !DIExpression()), !dbg !531
  call void @llvm.dbg.value(metadata i64 %o, metadata !526, metadata !DIExpression()), !dbg !531
  call void @llvm.dbg.value(metadata double %v, metadata !527, metadata !DIExpression()), !dbg !531
  %add = add nsw i64 %y, %x, !dbg !532
  %cmp = icmp eq i64 %add, 2, !dbg !534
  br i1 %cmp, label %vector.ph, label %if.end, !dbg !535

vector.ph:                                        ; preds = %entry
  %broadcast.splatinsert = insertelement <2 x double> poison, double %v, i64 0, !dbg !536
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !536
  %0 = bitcast [256 x double]* %R to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %0, align 8, !dbg !539, !tbaa !92
  %1 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 2, !dbg !539
  %2 = bitcast double* %1 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %2, align 8, !dbg !539, !tbaa !92
  %3 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 4, !dbg !540
  %4 = bitcast double* %3 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %4, align 8, !dbg !539, !tbaa !92
  %5 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 6, !dbg !539
  %6 = bitcast double* %5 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %6, align 8, !dbg !539, !tbaa !92
  %7 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 8, !dbg !540
  %8 = bitcast double* %7 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %8, align 8, !dbg !539, !tbaa !92
  %9 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 10, !dbg !539
  %10 = bitcast double* %9 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %10, align 8, !dbg !539, !tbaa !92
  %11 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 12, !dbg !540
  %12 = bitcast double* %11 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %12, align 8, !dbg !539, !tbaa !92
  %13 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 14, !dbg !539
  %14 = bitcast double* %13 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %14, align 8, !dbg !539, !tbaa !92
  %15 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 16, !dbg !540
  %16 = bitcast double* %15 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %16, align 8, !dbg !539, !tbaa !92
  %17 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 18, !dbg !539
  %18 = bitcast double* %17 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %18, align 8, !dbg !539, !tbaa !92
  %19 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 20, !dbg !540
  %20 = bitcast double* %19 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %20, align 8, !dbg !539, !tbaa !92
  %21 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 22, !dbg !539
  %22 = bitcast double* %21 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %22, align 8, !dbg !539, !tbaa !92
  %23 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 24, !dbg !540
  %24 = bitcast double* %23 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %24, align 8, !dbg !539, !tbaa !92
  %25 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 26, !dbg !539
  %26 = bitcast double* %25 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %26, align 8, !dbg !539, !tbaa !92
  %27 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 28, !dbg !540
  %28 = bitcast double* %27 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %28, align 8, !dbg !539, !tbaa !92
  %29 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 30, !dbg !539
  %30 = bitcast double* %29 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %30, align 8, !dbg !539, !tbaa !92
  %31 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 32, !dbg !540
  %32 = bitcast double* %31 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %32, align 8, !dbg !539, !tbaa !92
  %33 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 34, !dbg !539
  %34 = bitcast double* %33 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %34, align 8, !dbg !539, !tbaa !92
  %35 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 36, !dbg !540
  %36 = bitcast double* %35 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %36, align 8, !dbg !539, !tbaa !92
  %37 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 38, !dbg !539
  %38 = bitcast double* %37 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %38, align 8, !dbg !539, !tbaa !92
  %39 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 40, !dbg !540
  %40 = bitcast double* %39 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %40, align 8, !dbg !539, !tbaa !92
  %41 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 42, !dbg !539
  %42 = bitcast double* %41 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %42, align 8, !dbg !539, !tbaa !92
  %43 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 44, !dbg !540
  %44 = bitcast double* %43 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %44, align 8, !dbg !539, !tbaa !92
  %45 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 46, !dbg !539
  %46 = bitcast double* %45 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %46, align 8, !dbg !539, !tbaa !92
  %47 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 48, !dbg !540
  %48 = bitcast double* %47 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %48, align 8, !dbg !539, !tbaa !92
  %49 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 50, !dbg !539
  %50 = bitcast double* %49 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %50, align 8, !dbg !539, !tbaa !92
  %51 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 52, !dbg !540
  %52 = bitcast double* %51 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %52, align 8, !dbg !539, !tbaa !92
  %53 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 54, !dbg !539
  %54 = bitcast double* %53 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %54, align 8, !dbg !539, !tbaa !92
  %55 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 56, !dbg !540
  %56 = bitcast double* %55 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %56, align 8, !dbg !539, !tbaa !92
  %57 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 58, !dbg !539
  %58 = bitcast double* %57 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %58, align 8, !dbg !539, !tbaa !92
  %59 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 60, !dbg !540
  %60 = bitcast double* %59 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %60, align 8, !dbg !539, !tbaa !92
  %61 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 62, !dbg !539
  %62 = bitcast double* %61 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %62, align 8, !dbg !539, !tbaa !92
  %63 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 64, !dbg !540
  %64 = bitcast double* %63 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %64, align 8, !dbg !539, !tbaa !92
  %65 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 66, !dbg !539
  %66 = bitcast double* %65 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %66, align 8, !dbg !539, !tbaa !92
  %67 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 68, !dbg !540
  %68 = bitcast double* %67 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %68, align 8, !dbg !539, !tbaa !92
  %69 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 70, !dbg !539
  %70 = bitcast double* %69 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %70, align 8, !dbg !539, !tbaa !92
  %71 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 72, !dbg !540
  %72 = bitcast double* %71 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %72, align 8, !dbg !539, !tbaa !92
  %73 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 74, !dbg !539
  %74 = bitcast double* %73 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %74, align 8, !dbg !539, !tbaa !92
  %75 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 76, !dbg !540
  %76 = bitcast double* %75 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %76, align 8, !dbg !539, !tbaa !92
  %77 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 78, !dbg !539
  %78 = bitcast double* %77 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %78, align 8, !dbg !539, !tbaa !92
  %79 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 80, !dbg !540
  %80 = bitcast double* %79 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %80, align 8, !dbg !539, !tbaa !92
  %81 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 82, !dbg !539
  %82 = bitcast double* %81 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %82, align 8, !dbg !539, !tbaa !92
  %83 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 84, !dbg !540
  %84 = bitcast double* %83 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %84, align 8, !dbg !539, !tbaa !92
  %85 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 86, !dbg !539
  %86 = bitcast double* %85 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %86, align 8, !dbg !539, !tbaa !92
  %87 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 88, !dbg !540
  %88 = bitcast double* %87 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %88, align 8, !dbg !539, !tbaa !92
  %89 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 90, !dbg !539
  %90 = bitcast double* %89 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %90, align 8, !dbg !539, !tbaa !92
  %91 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 92, !dbg !540
  %92 = bitcast double* %91 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %92, align 8, !dbg !539, !tbaa !92
  %93 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 94, !dbg !539
  %94 = bitcast double* %93 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %94, align 8, !dbg !539, !tbaa !92
  %95 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 96, !dbg !540
  %96 = bitcast double* %95 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %96, align 8, !dbg !539, !tbaa !92
  %97 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 98, !dbg !539
  %98 = bitcast double* %97 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %98, align 8, !dbg !539, !tbaa !92
  %99 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 100, !dbg !540
  %100 = bitcast double* %99 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %100, align 8, !dbg !539, !tbaa !92
  %101 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 102, !dbg !539
  %102 = bitcast double* %101 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %102, align 8, !dbg !539, !tbaa !92
  %103 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 104, !dbg !540
  %104 = bitcast double* %103 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %104, align 8, !dbg !539, !tbaa !92
  %105 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 106, !dbg !539
  %106 = bitcast double* %105 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %106, align 8, !dbg !539, !tbaa !92
  %107 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 108, !dbg !540
  %108 = bitcast double* %107 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %108, align 8, !dbg !539, !tbaa !92
  %109 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 110, !dbg !539
  %110 = bitcast double* %109 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %110, align 8, !dbg !539, !tbaa !92
  %111 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 112, !dbg !540
  %112 = bitcast double* %111 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %112, align 8, !dbg !539, !tbaa !92
  %113 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 114, !dbg !539
  %114 = bitcast double* %113 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %114, align 8, !dbg !539, !tbaa !92
  %115 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 116, !dbg !540
  %116 = bitcast double* %115 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %116, align 8, !dbg !539, !tbaa !92
  %117 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 118, !dbg !539
  %118 = bitcast double* %117 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %118, align 8, !dbg !539, !tbaa !92
  %119 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 120, !dbg !540
  %120 = bitcast double* %119 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %120, align 8, !dbg !539, !tbaa !92
  %121 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 122, !dbg !539
  %122 = bitcast double* %121 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %122, align 8, !dbg !539, !tbaa !92
  %123 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 124, !dbg !540
  %124 = bitcast double* %123 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %124, align 8, !dbg !539, !tbaa !92
  %125 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 126, !dbg !539
  %126 = bitcast double* %125 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %126, align 8, !dbg !539, !tbaa !92
  %127 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 128, !dbg !540
  %128 = bitcast double* %127 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %128, align 8, !dbg !539, !tbaa !92
  %129 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 130, !dbg !539
  %130 = bitcast double* %129 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %130, align 8, !dbg !539, !tbaa !92
  %131 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 132, !dbg !540
  %132 = bitcast double* %131 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %132, align 8, !dbg !539, !tbaa !92
  %133 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 134, !dbg !539
  %134 = bitcast double* %133 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %134, align 8, !dbg !539, !tbaa !92
  %135 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 136, !dbg !540
  %136 = bitcast double* %135 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %136, align 8, !dbg !539, !tbaa !92
  %137 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 138, !dbg !539
  %138 = bitcast double* %137 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %138, align 8, !dbg !539, !tbaa !92
  %139 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 140, !dbg !540
  %140 = bitcast double* %139 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %140, align 8, !dbg !539, !tbaa !92
  %141 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 142, !dbg !539
  %142 = bitcast double* %141 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %142, align 8, !dbg !539, !tbaa !92
  %143 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 144, !dbg !540
  %144 = bitcast double* %143 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %144, align 8, !dbg !539, !tbaa !92
  %145 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 146, !dbg !539
  %146 = bitcast double* %145 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %146, align 8, !dbg !539, !tbaa !92
  %147 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 148, !dbg !540
  %148 = bitcast double* %147 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %148, align 8, !dbg !539, !tbaa !92
  %149 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 150, !dbg !539
  %150 = bitcast double* %149 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %150, align 8, !dbg !539, !tbaa !92
  %151 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 152, !dbg !540
  %152 = bitcast double* %151 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %152, align 8, !dbg !539, !tbaa !92
  %153 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 154, !dbg !539
  %154 = bitcast double* %153 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %154, align 8, !dbg !539, !tbaa !92
  %155 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 156, !dbg !540
  %156 = bitcast double* %155 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %156, align 8, !dbg !539, !tbaa !92
  %157 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 158, !dbg !539
  %158 = bitcast double* %157 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %158, align 8, !dbg !539, !tbaa !92
  %159 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 160, !dbg !540
  %160 = bitcast double* %159 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %160, align 8, !dbg !539, !tbaa !92
  %161 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 162, !dbg !539
  %162 = bitcast double* %161 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %162, align 8, !dbg !539, !tbaa !92
  %163 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 164, !dbg !540
  %164 = bitcast double* %163 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %164, align 8, !dbg !539, !tbaa !92
  %165 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 166, !dbg !539
  %166 = bitcast double* %165 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %166, align 8, !dbg !539, !tbaa !92
  %167 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 168, !dbg !540
  %168 = bitcast double* %167 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %168, align 8, !dbg !539, !tbaa !92
  %169 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 170, !dbg !539
  %170 = bitcast double* %169 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %170, align 8, !dbg !539, !tbaa !92
  %171 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 172, !dbg !540
  %172 = bitcast double* %171 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %172, align 8, !dbg !539, !tbaa !92
  %173 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 174, !dbg !539
  %174 = bitcast double* %173 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %174, align 8, !dbg !539, !tbaa !92
  %175 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 176, !dbg !540
  %176 = bitcast double* %175 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %176, align 8, !dbg !539, !tbaa !92
  %177 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 178, !dbg !539
  %178 = bitcast double* %177 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %178, align 8, !dbg !539, !tbaa !92
  %179 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 180, !dbg !540
  %180 = bitcast double* %179 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %180, align 8, !dbg !539, !tbaa !92
  %181 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 182, !dbg !539
  %182 = bitcast double* %181 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %182, align 8, !dbg !539, !tbaa !92
  %183 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 184, !dbg !540
  %184 = bitcast double* %183 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %184, align 8, !dbg !539, !tbaa !92
  %185 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 186, !dbg !539
  %186 = bitcast double* %185 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %186, align 8, !dbg !539, !tbaa !92
  %187 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 188, !dbg !540
  %188 = bitcast double* %187 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %188, align 8, !dbg !539, !tbaa !92
  %189 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 190, !dbg !539
  %190 = bitcast double* %189 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %190, align 8, !dbg !539, !tbaa !92
  %191 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 192, !dbg !540
  %192 = bitcast double* %191 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %192, align 8, !dbg !539, !tbaa !92
  %193 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 194, !dbg !539
  %194 = bitcast double* %193 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %194, align 8, !dbg !539, !tbaa !92
  %195 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 196, !dbg !540
  %196 = bitcast double* %195 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %196, align 8, !dbg !539, !tbaa !92
  %197 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 198, !dbg !539
  %198 = bitcast double* %197 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %198, align 8, !dbg !539, !tbaa !92
  %199 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 200, !dbg !540
  %200 = bitcast double* %199 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %200, align 8, !dbg !539, !tbaa !92
  %201 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 202, !dbg !539
  %202 = bitcast double* %201 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %202, align 8, !dbg !539, !tbaa !92
  %203 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 204, !dbg !540
  %204 = bitcast double* %203 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %204, align 8, !dbg !539, !tbaa !92
  %205 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 206, !dbg !539
  %206 = bitcast double* %205 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %206, align 8, !dbg !539, !tbaa !92
  %207 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 208, !dbg !540
  %208 = bitcast double* %207 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %208, align 8, !dbg !539, !tbaa !92
  %209 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 210, !dbg !539
  %210 = bitcast double* %209 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %210, align 8, !dbg !539, !tbaa !92
  %211 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 212, !dbg !540
  %212 = bitcast double* %211 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %212, align 8, !dbg !539, !tbaa !92
  %213 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 214, !dbg !539
  %214 = bitcast double* %213 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %214, align 8, !dbg !539, !tbaa !92
  %215 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 216, !dbg !540
  %216 = bitcast double* %215 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %216, align 8, !dbg !539, !tbaa !92
  %217 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 218, !dbg !539
  %218 = bitcast double* %217 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %218, align 8, !dbg !539, !tbaa !92
  %219 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 220, !dbg !540
  %220 = bitcast double* %219 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %220, align 8, !dbg !539, !tbaa !92
  %221 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 222, !dbg !539
  %222 = bitcast double* %221 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %222, align 8, !dbg !539, !tbaa !92
  %223 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 224, !dbg !540
  %224 = bitcast double* %223 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %224, align 8, !dbg !539, !tbaa !92
  %225 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 226, !dbg !539
  %226 = bitcast double* %225 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %226, align 8, !dbg !539, !tbaa !92
  %227 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 228, !dbg !540
  %228 = bitcast double* %227 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %228, align 8, !dbg !539, !tbaa !92
  %229 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 230, !dbg !539
  %230 = bitcast double* %229 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %230, align 8, !dbg !539, !tbaa !92
  %231 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 232, !dbg !540
  %232 = bitcast double* %231 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %232, align 8, !dbg !539, !tbaa !92
  %233 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 234, !dbg !539
  %234 = bitcast double* %233 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %234, align 8, !dbg !539, !tbaa !92
  %235 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 236, !dbg !540
  %236 = bitcast double* %235 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %236, align 8, !dbg !539, !tbaa !92
  %237 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 238, !dbg !539
  %238 = bitcast double* %237 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %238, align 8, !dbg !539, !tbaa !92
  %239 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 240, !dbg !540
  %240 = bitcast double* %239 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %240, align 8, !dbg !539, !tbaa !92
  %241 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 242, !dbg !539
  %242 = bitcast double* %241 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %242, align 8, !dbg !539, !tbaa !92
  %243 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 244, !dbg !540
  %244 = bitcast double* %243 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %244, align 8, !dbg !539, !tbaa !92
  %245 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 246, !dbg !539
  %246 = bitcast double* %245 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %246, align 8, !dbg !539, !tbaa !92
  %247 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 248, !dbg !540
  %248 = bitcast double* %247 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %248, align 8, !dbg !539, !tbaa !92
  %249 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 250, !dbg !539
  %250 = bitcast double* %249 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %250, align 8, !dbg !539, !tbaa !92
  %251 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 252, !dbg !540
  %252 = bitcast double* %251 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %252, align 8, !dbg !539, !tbaa !92
  %253 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 0, i64 254, !dbg !539
  %254 = bitcast double* %253 to <2 x double>*, !dbg !539
  store <2 x double> %broadcast.splat, <2 x double>* %254, align 8, !dbg !539, !tbaa !92
  br label %return, !dbg !541

if.end:                                           ; preds = %entry
  %cmp1 = icmp sgt i64 %x, %y, !dbg !542
  br i1 %cmp1, label %if.then2.tf, label %if.else.tf, !dbg !543

if.then2.tf:                                      ; preds = %if.end
  %div = sdiv i64 %x, 2, !dbg !544
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !545

det.achd:                                         ; preds = %if.then2.tf
  tail call void @init_matrix([256 x double]* noundef %R, i64 noundef %div, i64 noundef %y, i64 noundef %o, double noundef %v), !dbg !545
  reattach within %syncreg, label %det.cont, !dbg !545

det.cont:                                         ; preds = %det.achd, %if.then2.tf
  %mul = mul nsw i64 %div, %o, !dbg !546
  %add4 = add nsw i64 %x, 1, !dbg !547
  %div5 = sdiv i64 %add4, 2, !dbg !548
  br label %if.end13, !dbg !549

if.else.tf:                                       ; preds = %if.end
  %div6 = sdiv i64 %y, 2, !dbg !550
  detach within %syncreg, label %det.achd7, label %det.cont8, !dbg !552

det.achd7:                                        ; preds = %if.else.tf
  tail call void @init_matrix([256 x double]* noundef %R, i64 noundef %x, i64 noundef %div6, i64 noundef %o, double noundef %v), !dbg !552
  reattach within %syncreg, label %det.cont8, !dbg !552

det.cont8:                                        ; preds = %det.achd7, %if.else.tf
  %add11 = add nsw i64 %y, 1, !dbg !553
  %div12 = sdiv i64 %add11, 2, !dbg !554
  br label %if.end13

if.end13:                                         ; preds = %det.cont8, %det.cont
  %div12.sink = phi i64 [ %div12, %det.cont8 ], [ %y, %det.cont ]
  %x.sink = phi i64 [ %x, %det.cont8 ], [ %div5, %det.cont ]
  %div6.pn = phi i64 [ %div6, %det.cont8 ], [ %mul, %det.cont ]
  %add.ptr10.sink = getelementptr inbounds [256 x double], [256 x double]* %R, i64 %div6.pn, !dbg !555
  tail call void @init_matrix([256 x double]* noundef %add.ptr10.sink, i64 noundef %x.sink, i64 noundef %div12.sink, i64 noundef %o, double noundef %v), !dbg !555
  sync within %syncreg, label %return, !dbg !556

return:                                           ; preds = %vector.ph, %if.end13
  ret void, !dbg !541
}

; Function Attrs: argmemonly nounwind uwtable
define dso_local void @multiply_matrix([256 x double]* noundef %A, i64 noundef %oa, [256 x double]* noundef %B, i64 noundef %ob, i64 noundef %x, i64 noundef %y, i64 noundef %z, [256 x double]* noundef %R, i64 noundef %orr, i32 noundef %add) local_unnamed_addr #9 !dbg !557 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !571
  call void @llvm.dbg.value(metadata [256 x double]* %A, metadata !561, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata i64 %oa, metadata !562, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata [256 x double]* %B, metadata !563, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata i64 %ob, metadata !564, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata i64 %x, metadata !565, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata i64 %y, metadata !566, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata i64 %z, metadata !567, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata [256 x double]* %R, metadata !568, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata i64 %orr, metadata !569, metadata !DIExpression()), !dbg !574
  call void @llvm.dbg.value(metadata i32 %add, metadata !570, metadata !DIExpression()), !dbg !574
  %add1 = add nsw i64 %y, %x, !dbg !575
  %add2 = add nsw i64 %add1, %z, !dbg !577
  %cmp = icmp eq i64 %add2, 3, !dbg !578
  br i1 %cmp, label %if.then, label %if.end5, !dbg !579

if.then:                                          ; preds = %entry
  %tobool.not = icmp eq i32 %add, 0, !dbg !580
  br i1 %tobool.not, label %if.else, label %if.then3, !dbg !583

if.then3:                                         ; preds = %if.then
  %call = tail call i64 @mult_add_block([256 x double]* noundef %A, [256 x double]* noundef %B, [256 x double]* noundef %R), !dbg !584
  br label %sync.continue, !dbg !584

if.else:                                          ; preds = %if.then
  %call4 = tail call i64 @multiply_block([256 x double]* noundef %A, [256 x double]* noundef %B, [256 x double]* noundef %R), !dbg !585
  br label %sync.continue

if.end5:                                          ; preds = %entry
  %cmp6.not = icmp slt i64 %x, %y, !dbg !586
  %cmp7.not = icmp slt i64 %x, %z
  %or.cond = or i1 %cmp6.not, %cmp7.not, !dbg !587
  br i1 %or.cond, label %if.else15, label %if.then8.tf, !dbg !587

if.then8.tf:                                      ; preds = %if.end5
  %div = sdiv i64 %x, 2, !dbg !588
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !589

det.achd:                                         ; preds = %if.then8.tf
  tail call void @multiply_matrix([256 x double]* noundef %A, i64 noundef %oa, [256 x double]* noundef %B, i64 noundef %ob, i64 noundef %div, i64 noundef %y, i64 noundef %z, [256 x double]* noundef %R, i64 noundef %orr, i32 noundef %add), !dbg !589
  reattach within %syncreg, label %det.cont, !dbg !589

det.cont:                                         ; preds = %det.achd, %if.then8.tf
  %mul = mul nsw i64 %div, %oa, !dbg !590
  %add.ptr = getelementptr inbounds [256 x double], [256 x double]* %A, i64 %mul, !dbg !591
  %add10 = add nsw i64 %x, 1, !dbg !592
  %div11 = sdiv i64 %add10, 2, !dbg !593
  %mul13 = mul nsw i64 %div, %orr, !dbg !594
  %add.ptr14 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 %mul13, !dbg !595
  tail call void @multiply_matrix([256 x double]* noundef %add.ptr, i64 noundef %oa, [256 x double]* noundef %B, i64 noundef %ob, i64 noundef %div11, i64 noundef %y, i64 noundef %z, [256 x double]* noundef %add.ptr14, i64 noundef %orr, i32 noundef %add), !dbg !596
  br label %if.end39, !dbg !597

if.else15:                                        ; preds = %if.end5
  %cmp18 = icmp sgt i64 %y, %z
  %or.cond116 = and i1 %cmp6.not, %cmp18, !dbg !598
  br i1 %or.cond116, label %if.then19, label %if.else28.tf, !dbg !598

if.then19:                                        ; preds = %if.else15
  %div20 = sdiv i64 %y, 2, !dbg !601
  %add.ptr21 = getelementptr inbounds [256 x double], [256 x double]* %A, i64 %div20, !dbg !603
  %mul23 = mul nsw i64 %div20, %ob, !dbg !604
  %add.ptr24 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 %mul23, !dbg !605
  %add25 = add nsw i64 %y, 1, !dbg !606
  %div26 = sdiv i64 %add25, 2, !dbg !607
  tail call void @multiply_matrix([256 x double]* noundef %add.ptr21, i64 noundef %oa, [256 x double]* noundef %add.ptr24, i64 noundef %ob, i64 noundef %x, i64 noundef %div26, i64 noundef %z, [256 x double]* noundef %R, i64 noundef %orr, i32 noundef %add), !dbg !608
  tail call void @multiply_matrix([256 x double]* noundef %A, i64 noundef %oa, [256 x double]* noundef %B, i64 noundef %ob, i64 noundef %x, i64 noundef %div20, i64 noundef %z, [256 x double]* noundef %R, i64 noundef %orr, i32 noundef 1), !dbg !609
  br label %if.end39, !dbg !610

if.else28.tf:                                     ; preds = %if.else15
  %div29 = sdiv i64 %z, 2, !dbg !611
  detach within %syncreg, label %det.achd30, label %det.cont31, !dbg !613

det.achd30:                                       ; preds = %if.else28.tf
  tail call void @multiply_matrix([256 x double]* noundef %A, i64 noundef %oa, [256 x double]* noundef %B, i64 noundef %ob, i64 noundef %x, i64 noundef %y, i64 noundef %div29, [256 x double]* noundef %R, i64 noundef %orr, i32 noundef %add), !dbg !613
  reattach within %syncreg, label %det.cont31, !dbg !613

det.cont31:                                       ; preds = %det.achd30, %if.else28.tf
  %add.ptr33 = getelementptr inbounds [256 x double], [256 x double]* %B, i64 %div29, !dbg !614
  %add34 = add nsw i64 %z, 1, !dbg !615
  %div35 = sdiv i64 %add34, 2, !dbg !616
  %add.ptr37 = getelementptr inbounds [256 x double], [256 x double]* %R, i64 %div29, !dbg !617
  tail call void @multiply_matrix([256 x double]* noundef %A, i64 noundef %oa, [256 x double]* noundef %add.ptr33, i64 noundef %ob, i64 noundef %x, i64 noundef %y, i64 noundef %div35, [256 x double]* noundef %add.ptr37, i64 noundef %orr, i32 noundef %add), !dbg !618
  br label %if.end39

if.end39:                                         ; preds = %if.then19, %det.cont31, %det.cont
  sync within %syncreg, label %sync.continue, !dbg !619

sync.continue:                                    ; preds = %if.then3, %if.else, %if.end39
  ret void, !dbg !620
}

; Function Attrs: nounwind uwtable
define dso_local i32 @run(i64 noundef %x, i64 noundef %y, i64 noundef %z, i32 noundef %check) local_unnamed_addr #6 !dbg !621 {
entry:
  %check.addr = alloca i32, align 4
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !635
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i64 %x, metadata !625, metadata !DIExpression()), !dbg !635
  call void @llvm.dbg.value(metadata i64 %y, metadata !626, metadata !DIExpression()), !dbg !635
  call void @llvm.dbg.value(metadata i64 %z, metadata !627, metadata !DIExpression()), !dbg !635
  call void @llvm.dbg.value(metadata i32 %check, metadata !628, metadata !DIExpression()), !dbg !635
  store i32 %check, i32* %check.addr, align 4, !tbaa !335
  %mul = shl i64 %x, 11, !dbg !636
  %mul1 = mul i64 %mul, %y, !dbg !637
  %call = tail call noalias i8* @malloc(i64 noundef %mul1) #19, !dbg !638
  %0 = bitcast i8* %call to [256 x double]*, !dbg !639
  call void @llvm.dbg.value(metadata [256 x double]* %0, metadata !629, metadata !DIExpression()), !dbg !635
  %mul2 = shl i64 %y, 11, !dbg !640
  %mul3 = mul i64 %mul2, %z, !dbg !641
  %call4 = tail call noalias i8* @malloc(i64 noundef %mul3) #19, !dbg !642
  %1 = bitcast i8* %call4 to [256 x double]*, !dbg !643
  call void @llvm.dbg.value(metadata [256 x double]* %1, metadata !630, metadata !DIExpression()), !dbg !635
  %mul6 = mul i64 %mul, %z, !dbg !644
  %call7 = tail call noalias i8* @malloc(i64 noundef %mul6) #19, !dbg !645
  %2 = bitcast i8* %call7 to [256 x double]*, !dbg !646
  call void @llvm.dbg.value(metadata [256 x double]* %2, metadata !631, metadata !DIExpression()), !dbg !635
  detach within %syncreg, label %det.achd, label %det.cont.tf, !dbg !647

det.achd:                                         ; preds = %entry
  tail call void @init_matrix([256 x double]* noundef %0, i64 noundef %x, i64 noundef %y, i64 noundef %y, double noundef 1.000000e+00), !dbg !647
  reattach within %syncreg, label %det.cont.tf, !dbg !647

det.cont.tf:                                      ; preds = %entry, %det.achd
  detach within %syncreg, label %det.achd8, label %det.cont9, !dbg !648

det.achd8:                                        ; preds = %det.cont.tf
  tail call void @init_matrix([256 x double]* noundef %1, i64 noundef %y, i64 noundef %z, i64 noundef %z, double noundef 1.000000e+00), !dbg !648
  reattach within %syncreg, label %det.cont9, !dbg !648

det.cont9:                                        ; preds = %det.achd8, %det.cont.tf
  tail call void @init_matrix([256 x double]* noundef %2, i64 noundef %x, i64 noundef %z, i64 noundef %z, double noundef 0.000000e+00), !dbg !649
  sync within %syncreg, label %sync.continue, !dbg !650

sync.continue:                                    ; preds = %det.cont9
  %3 = bitcast %struct.timeval* %t1 to i8*, !dbg !651
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #19, !dbg !651
  call void @llvm.dbg.declare(metadata %struct.timeval* %t1, metadata !632, metadata !DIExpression()), !dbg !652
  %4 = bitcast %struct.timeval* %t2 to i8*, !dbg !651
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #19, !dbg !651
  call void @llvm.dbg.declare(metadata %struct.timeval* %t2, metadata !633, metadata !DIExpression()), !dbg !653
  %call10 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #19, !dbg !654
  tail call void @multiply_matrix([256 x double]* noundef %0, i64 noundef %y, [256 x double]* noundef %1, i64 noundef %z, i64 noundef %x, i64 noundef %y, i64 noundef %z, [256 x double]* noundef %2, i64 noundef %z, i32 noundef 0), !dbg !655
  %call11 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #19, !dbg !656
  call void @llvm.dbg.value(metadata %struct.timeval* %t2, metadata !44, metadata !DIExpression()), !dbg !657
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0, !dbg !659
  %5 = load i64, i64* %tv_sec.i, align 8, !dbg !659, !tbaa !47
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1, !dbg !660
  %6 = load i64, i64* %tv_usec.i, align 8, !dbg !660, !tbaa !54
  call void @llvm.dbg.value(metadata %struct.timeval* %t1, metadata !44, metadata !DIExpression()), !dbg !661
  %tv_sec.i68 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0, !dbg !663
  %7 = load i64, i64* %tv_sec.i68, align 8, !dbg !663, !tbaa !47
  %tv_usec.i70 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1, !dbg !664
  %8 = load i64, i64* %tv_usec.i70, align 8, !dbg !664, !tbaa !54
  %reass.add = sub i64 %5, %7
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i = sub i64 %6, %8, !dbg !665
  %sub = add i64 %add.i, %reass.mul, !dbg !666
  %div = udiv i64 %sub, 1000, !dbg !667
  call void @llvm.dbg.value(metadata i64 %div, metadata !634, metadata !DIExpression()), !dbg !635
  %conv = uitofp i64 %div to double, !dbg !668
  %div14 = fdiv double %conv, 1.000000e+03, !dbg !669
  %call15 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), double noundef %div14), !dbg !670
  call void @llvm.dbg.value(metadata i32 %check, metadata !628, metadata !DIExpression()), !dbg !635
  %tobool.not = icmp eq i32 %check, 0, !dbg !671
  br i1 %tobool.not, label %sync.continue.if.else_crit_edge, label %if.end, !dbg !673

sync.continue.if.else_crit_edge:                  ; preds = %sync.continue
  %.pre = shl nsw i64 %y, 4, !dbg !674
  br label %if.else, !dbg !673

if.end:                                           ; preds = %sync.continue
  %puts67 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @str.23, i64 0, i64 0)), !dbg !677
  call void @llvm.dbg.value(metadata i32 0, metadata !628, metadata !DIExpression()), !dbg !635
  store i32 0, i32* %check.addr, align 4, !dbg !679, !tbaa !335
  %mul17 = shl nsw i64 %y, 4, !dbg !680
  %conv18 = sitofp i64 %mul17 to double, !dbg !681
  call void @llvm.dbg.value(metadata i32* %check.addr, metadata !628, metadata !DIExpression(DW_OP_deref)), !dbg !635
  call void @check_matrix([256 x double]* noundef %2, i64 noundef %x, i64 noundef %z, i64 noundef %z, double noundef %conv18, i32* noundef nonnull %check.addr), !dbg !682
  %.pr = load i32, i32* %check.addr, align 4, !dbg !683, !tbaa !335
  call void @llvm.dbg.value(metadata i32 %.pr, metadata !628, metadata !DIExpression()), !dbg !635
  %tobool19.not = icmp eq i32 %.pr, 0, !dbg !683
  br i1 %tobool19.not, label %if.else, label %if.then20, !dbg !684

if.then20:                                        ; preds = %if.end
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([14 x i8], [14 x i8]* @str, i64 0, i64 0)), !dbg !685
  %9 = load i32, i32* %check.addr, align 4, !dbg !687, !tbaa !335
  call void @llvm.dbg.value(metadata i32 %9, metadata !628, metadata !DIExpression()), !dbg !635
  %call22 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i32 noundef %9), !dbg !688
  br label %if.end30, !dbg !689

if.else:                                          ; preds = %sync.continue.if.else_crit_edge, %if.end
  %mul26.pre-phi = phi i64 [ %.pre, %sync.continue.if.else_crit_edge ], [ %mul17, %if.end ], !dbg !674
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !690, !tbaa !330
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.6, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %10) #18, !dbg !691
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !692, !tbaa !330
  %mul24 = shl nsw i64 %x, 4, !dbg !693
  %call25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %12, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.7, i64 0, i64 0), i64 noundef %mul24) #18, !dbg !694
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !695, !tbaa !330
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %13, i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.8, i64 0, i64 0), i64 noundef %mul26.pre-phi) #18, !dbg !696
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !697, !tbaa !330
  %mul28 = shl nsw i64 %z, 4, !dbg !698
  %call29 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %14, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.9, i64 0, i64 0), i64 noundef %mul28) #18, !dbg !699
  br label %if.end30

if.end30:                                         ; preds = %if.else, %if.then20
  call void @free(i8* noundef %call) #19, !dbg !700
  call void @free(i8* noundef %call4) #19, !dbg !701
  call void @free(i8* noundef %call7) #19, !dbg !702
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #19, !dbg !703
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #19, !dbg !703
  ret i32 0, !dbg !704
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare !dbg !705 dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #5

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #13

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @usage() local_unnamed_addr #4 !dbg !718 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !721, !tbaa !330
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.10, i64 0, i64 0), i64 70, i64 1, %struct._IO_FILE* %0) #18, !dbg !722
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !723, !tbaa !330
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str.11, i64 0, i64 0), i64 91, i64 1, %struct._IO_FILE* %2) #18, !dbg !724
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !725, !tbaa !330
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.12, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %4) #18, !dbg !726
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !727, !tbaa !330
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.13, i64 0, i64 0), i64 9, i64 1, %struct._IO_FILE* %6) #18, !dbg !728
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !729, !tbaa !330
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.14, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %8) #18, !dbg !730
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !731, !tbaa !330
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.15, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %10) #18, !dbg !732
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !733, !tbaa !330
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.16, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %12) #18, !dbg !734
  ret i32 1, !dbg !735
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** noundef %argv) local_unnamed_addr #6 !dbg !736 {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %benchmark = alloca i32, align 4
  %help = alloca i32, align 4
  %check = alloca i32, align 4
  call void @llvm.dbg.value(metadata i32 %argc, metadata !742, metadata !DIExpression()), !dbg !751
  call void @llvm.dbg.value(metadata i8** %argv, metadata !743, metadata !DIExpression()), !dbg !751
  %0 = bitcast i32* %x to i8*, !dbg !752
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #19, !dbg !752
  %1 = bitcast i32* %y to i8*, !dbg !752
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #19, !dbg !752
  %2 = bitcast i32* %z to i8*, !dbg !752
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #19, !dbg !752
  %3 = bitcast i32* %benchmark to i8*, !dbg !752
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #19, !dbg !752
  %4 = bitcast i32* %help to i8*, !dbg !752
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #19, !dbg !752
  %5 = bitcast i32* %check to i8*, !dbg !752
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #19, !dbg !752
  call void @llvm.dbg.value(metadata i32 128, metadata !744, metadata !DIExpression()), !dbg !751
  store i32 128, i32* %x, align 4, !dbg !753, !tbaa !335
  call void @llvm.dbg.value(metadata i32 128, metadata !745, metadata !DIExpression()), !dbg !751
  store i32 128, i32* %y, align 4, !dbg !754, !tbaa !335
  call void @llvm.dbg.value(metadata i32 128, metadata !746, metadata !DIExpression()), !dbg !751
  store i32 128, i32* %z, align 4, !dbg !755, !tbaa !335
  call void @llvm.dbg.value(metadata i32 0, metadata !750, metadata !DIExpression()), !dbg !751
  store i32 0, i32* %check, align 4, !dbg !756, !tbaa !335
  call void @llvm.dbg.value(metadata i32* %x, metadata !744, metadata !DIExpression(DW_OP_deref)), !dbg !751
  call void @llvm.dbg.value(metadata i32* %y, metadata !745, metadata !DIExpression(DW_OP_deref)), !dbg !751
  call void @llvm.dbg.value(metadata i32* %z, metadata !746, metadata !DIExpression(DW_OP_deref)), !dbg !751
  call void @llvm.dbg.value(metadata i32* %benchmark, metadata !747, metadata !DIExpression(DW_OP_deref)), !dbg !751
  call void @llvm.dbg.value(metadata i32* %help, metadata !748, metadata !DIExpression(DW_OP_deref)), !dbg !751
  call void @llvm.dbg.value(metadata i32* %check, metadata !750, metadata !DIExpression(DW_OP_deref)), !dbg !751
  call void (i32, i8**, i8**, i32*, ...) @get_options(i32 noundef %argc, i8** noundef %argv, i8** noundef getelementptr inbounds ([7 x i8*], [7 x i8*]* @specifiers, i64 0, i64 0), i32* noundef getelementptr inbounds ([7 x i32], [7 x i32]* @opt_types, i64 0, i64 0), i32* noundef nonnull %x, i32* noundef nonnull %y, i32* noundef nonnull %z, i32* noundef nonnull %check, i32* noundef nonnull %benchmark, i32* noundef nonnull %help) #19, !dbg !757
  %6 = load i32, i32* %help, align 4, !dbg !758, !tbaa !335
  call void @llvm.dbg.value(metadata i32 %6, metadata !748, metadata !DIExpression()), !dbg !751
  %tobool.not = icmp eq i32 %6, 0, !dbg !758
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !760

if.then:                                          ; preds = %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !761, !tbaa !330
  %8 = call i64 @fwrite(i8* getelementptr inbounds ([71 x i8], [71 x i8]* @.str.10, i64 0, i64 0), i64 70, i64 1, %struct._IO_FILE* %7) #20, !dbg !763
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !764, !tbaa !330
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str.11, i64 0, i64 0), i64 91, i64 1, %struct._IO_FILE* %9) #20, !dbg !765
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !766, !tbaa !330
  %12 = call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.12, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %11) #20, !dbg !767
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !768, !tbaa !330
  %14 = call i64 @fwrite(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.13, i64 0, i64 0), i64 9, i64 1, %struct._IO_FILE* %13) #20, !dbg !769
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !770, !tbaa !330
  %16 = call i64 @fwrite(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.14, i64 0, i64 0), i64 23, i64 1, %struct._IO_FILE* %15) #20, !dbg !771
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !772, !tbaa !330
  %18 = call i64 @fwrite(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.15, i64 0, i64 0), i64 34, i64 1, %struct._IO_FILE* %17) #20, !dbg !773
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !774, !tbaa !330
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.16, i64 0, i64 0), i64 45, i64 1, %struct._IO_FILE* %19) #20, !dbg !775
  br label %cleanup, !dbg !776

if.end:                                           ; preds = %entry
  %21 = load i32, i32* %benchmark, align 4, !dbg !777, !tbaa !335
  call void @llvm.dbg.value(metadata i32 %21, metadata !747, metadata !DIExpression()), !dbg !751
  %switch.tableidx = add i32 %21, -1, !dbg !779
  %22 = icmp ult i32 %switch.tableidx, 3, !dbg !779
  %23 = sext i32 %switch.tableidx to i64, !dbg !779
  %switch.gep = getelementptr inbounds [3 x i32], [3 x i32]* @switch.table.main.25, i64 0, i64 %23, !dbg !779
  %24 = sext i32 %switch.tableidx to i64, !dbg !779
  %switch.gep28 = getelementptr inbounds [3 x i32], [3 x i32]* @switch.table.main.25, i64 0, i64 %24, !dbg !779
  %25 = sext i32 %switch.tableidx to i64, !dbg !779
  %switch.gep30 = getelementptr inbounds [3 x i32], [3 x i32]* @switch.table.main.25, i64 0, i64 %25, !dbg !779
  %.in = select i1 %22, i32* %switch.gep, i32* %z, !dbg !779
  %.in32 = select i1 %22, i32* %switch.gep28, i32* %y, !dbg !779
  %.in33 = select i1 %22, i32* %switch.gep30, i32* %x, !dbg !779
  %26 = load i32, i32* %.in33, align 4, !dbg !780
  %27 = load i32, i32* %.in32, align 4, !dbg !781
  %28 = load i32, i32* %.in, align 4, !dbg !782
  call void @llvm.dbg.value(metadata i32 %26, metadata !744, metadata !DIExpression()), !dbg !751
  %div = sdiv i32 %26, 16, !dbg !783
  call void @llvm.dbg.value(metadata i32 %div, metadata !744, metadata !DIExpression()), !dbg !751
  store i32 %div, i32* %x, align 4, !dbg !784, !tbaa !335
  call void @llvm.dbg.value(metadata i32 %27, metadata !745, metadata !DIExpression()), !dbg !751
  %div6 = sdiv i32 %27, 16, !dbg !785
  call void @llvm.dbg.value(metadata i32 %div6, metadata !745, metadata !DIExpression()), !dbg !751
  store i32 %div6, i32* %y, align 4, !dbg !786, !tbaa !335
  call void @llvm.dbg.value(metadata i32 %28, metadata !746, metadata !DIExpression()), !dbg !751
  %div7 = sdiv i32 %28, 16, !dbg !787
  call void @llvm.dbg.value(metadata i32 %div7, metadata !746, metadata !DIExpression()), !dbg !751
  store i32 %div7, i32* %z, align 4, !dbg !788, !tbaa !335
  call void @llvm.dbg.value(metadata i32 %div, metadata !744, metadata !DIExpression()), !dbg !751
  %cmp = icmp slt i32 %26, 16, !dbg !789
  br i1 %cmp, label %if.then8, label %if.end9, !dbg !791

if.then8:                                         ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 1, metadata !744, metadata !DIExpression()), !dbg !751
  store i32 1, i32* %x, align 4, !dbg !792, !tbaa !335
  br label %if.end9, !dbg !793

if.end9:                                          ; preds = %if.then8, %if.end
  %29 = phi i32 [ 1, %if.then8 ], [ %div, %if.end ]
  call void @llvm.dbg.value(metadata i32 %div6, metadata !745, metadata !DIExpression()), !dbg !751
  %cmp10 = icmp slt i32 %27, 16, !dbg !794
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !796

if.then11:                                        ; preds = %if.end9
  call void @llvm.dbg.value(metadata i32 1, metadata !745, metadata !DIExpression()), !dbg !751
  store i32 1, i32* %y, align 4, !dbg !797, !tbaa !335
  br label %if.end12, !dbg !798

if.end12:                                         ; preds = %if.then11, %if.end9
  %30 = phi i32 [ 1, %if.then11 ], [ %div6, %if.end9 ]
  call void @llvm.dbg.value(metadata i32 %div7, metadata !746, metadata !DIExpression()), !dbg !751
  %cmp13 = icmp slt i32 %28, 16, !dbg !799
  br i1 %cmp13, label %if.then14, label %if.end15, !dbg !801

if.then14:                                        ; preds = %if.end12
  call void @llvm.dbg.value(metadata i32 1, metadata !746, metadata !DIExpression()), !dbg !751
  store i32 1, i32* %z, align 4, !dbg !802, !tbaa !335
  br label %if.end15, !dbg !803

if.end15:                                         ; preds = %if.then14, %if.end12
  %31 = phi i32 [ 1, %if.then14 ], [ %div7, %if.end12 ], !dbg !804
  call void @llvm.dbg.value(metadata i32 %29, metadata !744, metadata !DIExpression()), !dbg !751
  %conv = sext i32 %29 to i64, !dbg !805
  call void @llvm.dbg.value(metadata i32 %30, metadata !745, metadata !DIExpression()), !dbg !751
  %conv16 = sext i32 %30 to i64, !dbg !806
  call void @llvm.dbg.value(metadata i32 %31, metadata !746, metadata !DIExpression()), !dbg !751
  %conv17 = sext i32 %31 to i64, !dbg !804
  %32 = load i32, i32* %check, align 4, !dbg !807, !tbaa !335
  call void @llvm.dbg.value(metadata i32 %32, metadata !750, metadata !DIExpression()), !dbg !751
  %call18 = call i32 @run(i64 noundef %conv, i64 noundef %conv16, i64 noundef %conv17, i32 noundef %32), !dbg !808
  call void @llvm.dbg.value(metadata i32 0, metadata !749, metadata !DIExpression()), !dbg !751
  br label %cleanup, !dbg !809

cleanup:                                          ; preds = %if.end15, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.end15 ], !dbg !751
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #19, !dbg !810
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #19, !dbg !810
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #19, !dbg !810
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #19, !dbg !810
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #19, !dbg !810
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #19, !dbg !810
  ret i32 %retval.0, !dbg !810
}

declare !dbg !811 dso_local void @get_options(i32 noundef, i8** noundef, i8** noundef, i32* noundef, ...) local_unnamed_addr #14

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #15

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #16

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #16

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #15

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v2i32(<2 x i32>) #17

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly mustprogress nounwind willreturn }
attributes #8 = { argmemonly nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { argmemonly nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { argmemonly nofree norecurse nosync nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { argmemonly nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #16 = { nofree nounwind }
attributes #17 = { nofree nosync nounwind readnone willreturn }
attributes #18 = { cold }
attributes #19 = { nounwind }
attributes #20 = { cold nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "specifiers", scope: !2, file: !3, line: 458, type: !20, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !13, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "rectmulred.c", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "3380f1ad2be343605bda486aea2a3642")
!4 = !{!5, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_typedef, name: "DTYPE", file: !3, line: 47, baseType: !7)
!7 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "block", file: !3, line: 49, baseType: !10)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 16384, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 256)
!13 = !{!0, !14}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "opt_types", scope: !2, file: !3, line: 459, type: !16, isLocal: false, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 224, elements: !18)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !{!19}
!19 = !DISubrange(count: 7)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 448, elements: !18)
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
!57 = distinct !DISubprogram(name: "mult_add_block", scope: !3, file: !3, line: 64, type: !58, scopeLine: 64, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !61)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !8, !8, !8}
!60 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!61 = !{!62, !63, !64, !65, !66, !67, !68, !72, !76, !77, !78, !79, !80}
!62 = !DILocalVariable(name: "A", arg: 1, scope: !57, file: !3, line: 64, type: !8)
!63 = !DILocalVariable(name: "B", arg: 2, scope: !57, file: !3, line: 64, type: !8)
!64 = !DILocalVariable(name: "R", arg: 3, scope: !57, file: !3, line: 64, type: !8)
!65 = !DILocalVariable(name: "i", scope: !57, file: !3, line: 66, type: !17)
!66 = !DILocalVariable(name: "j", scope: !57, file: !3, line: 66, type: !17)
!67 = !DILocalVariable(name: "flops", scope: !57, file: !3, line: 67, type: !60)
!68 = !DILocalVariable(name: "bp", scope: !69, file: !3, line: 70, type: !5)
!69 = distinct !DILexicalBlock(scope: !70, file: !3, line: 69, column: 31)
!70 = distinct !DILexicalBlock(scope: !71, file: !3, line: 69, column: 3)
!71 = distinct !DILexicalBlock(scope: !57, file: !3, line: 69, column: 3)
!72 = !DILocalVariable(name: "ap", scope: !73, file: !3, line: 72, type: !5)
!73 = distinct !DILexicalBlock(scope: !74, file: !3, line: 71, column: 33)
!74 = distinct !DILexicalBlock(scope: !75, file: !3, line: 71, column: 5)
!75 = distinct !DILexicalBlock(scope: !69, file: !3, line: 71, column: 5)
!76 = !DILocalVariable(name: "rp", scope: !73, file: !3, line: 73, type: !5)
!77 = !DILocalVariable(name: "s0_0", scope: !73, file: !3, line: 74, type: !6)
!78 = !DILocalVariable(name: "s0_1", scope: !73, file: !3, line: 74, type: !6)
!79 = !DILocalVariable(name: "s1_0", scope: !73, file: !3, line: 75, type: !6)
!80 = !DILocalVariable(name: "s1_1", scope: !73, file: !3, line: 75, type: !6)
!81 = !DILocation(line: 0, scope: !57)
!82 = !DILocation(line: 69, column: 3, scope: !71)
!83 = !DILocation(line: 70, column: 18, scope: !69)
!84 = !DILocation(line: 0, scope: !69)
!85 = !DILocation(line: 71, column: 5, scope: !75)
!86 = !DILocation(line: 72, column: 36, scope: !73)
!87 = !DILocation(line: 72, column: 20, scope: !73)
!88 = !DILocation(line: 0, scope: !73)
!89 = !DILocation(line: 73, column: 36, scope: !73)
!90 = !DILocation(line: 73, column: 20, scope: !73)
!91 = !DILocation(line: 76, column: 14, scope: !73)
!92 = !{!93, !93, i64 0}
!93 = !{!"double", !50, i64 0}
!94 = !DILocation(line: 78, column: 14, scope: !73)
!95 = !DILocation(line: 80, column: 15, scope: !73)
!96 = !DILocation(line: 80, column: 23, scope: !73)
!97 = !DILocation(line: 80, column: 12, scope: !73)
!98 = !DILocation(line: 82, column: 15, scope: !73)
!99 = !DILocation(line: 82, column: 12, scope: !73)
!100 = !DILocation(line: 84, column: 15, scope: !73)
!101 = !DILocation(line: 84, column: 23, scope: !73)
!102 = !DILocation(line: 84, column: 12, scope: !73)
!103 = !DILocation(line: 86, column: 15, scope: !73)
!104 = !DILocation(line: 86, column: 12, scope: !73)
!105 = !DILocation(line: 88, column: 15, scope: !73)
!106 = !DILocation(line: 88, column: 23, scope: !73)
!107 = !DILocation(line: 88, column: 12, scope: !73)
!108 = !DILocation(line: 90, column: 15, scope: !73)
!109 = !DILocation(line: 90, column: 12, scope: !73)
!110 = !DILocation(line: 92, column: 15, scope: !73)
!111 = !DILocation(line: 92, column: 23, scope: !73)
!112 = !DILocation(line: 92, column: 12, scope: !73)
!113 = !DILocation(line: 94, column: 15, scope: !73)
!114 = !DILocation(line: 94, column: 12, scope: !73)
!115 = !DILocation(line: 96, column: 15, scope: !73)
!116 = !DILocation(line: 96, column: 23, scope: !73)
!117 = !DILocation(line: 96, column: 12, scope: !73)
!118 = !DILocation(line: 98, column: 15, scope: !73)
!119 = !DILocation(line: 98, column: 12, scope: !73)
!120 = !DILocation(line: 100, column: 15, scope: !73)
!121 = !DILocation(line: 100, column: 23, scope: !73)
!122 = !DILocation(line: 100, column: 12, scope: !73)
!123 = !DILocation(line: 102, column: 15, scope: !73)
!124 = !DILocation(line: 102, column: 12, scope: !73)
!125 = !DILocation(line: 104, column: 15, scope: !73)
!126 = !DILocation(line: 104, column: 23, scope: !73)
!127 = !DILocation(line: 104, column: 12, scope: !73)
!128 = !DILocation(line: 106, column: 15, scope: !73)
!129 = !DILocation(line: 106, column: 12, scope: !73)
!130 = !DILocation(line: 108, column: 15, scope: !73)
!131 = !DILocation(line: 108, column: 23, scope: !73)
!132 = !DILocation(line: 108, column: 12, scope: !73)
!133 = !DILocation(line: 110, column: 15, scope: !73)
!134 = !DILocation(line: 110, column: 12, scope: !73)
!135 = !DILocation(line: 112, column: 15, scope: !73)
!136 = !DILocation(line: 112, column: 23, scope: !73)
!137 = !DILocation(line: 112, column: 12, scope: !73)
!138 = !DILocation(line: 114, column: 15, scope: !73)
!139 = !DILocation(line: 114, column: 12, scope: !73)
!140 = !DILocation(line: 116, column: 15, scope: !73)
!141 = !DILocation(line: 116, column: 23, scope: !73)
!142 = !DILocation(line: 116, column: 12, scope: !73)
!143 = !DILocation(line: 118, column: 15, scope: !73)
!144 = !DILocation(line: 118, column: 12, scope: !73)
!145 = !DILocation(line: 120, column: 15, scope: !73)
!146 = !DILocation(line: 120, column: 24, scope: !73)
!147 = !DILocation(line: 120, column: 12, scope: !73)
!148 = !DILocation(line: 122, column: 15, scope: !73)
!149 = !DILocation(line: 122, column: 12, scope: !73)
!150 = !DILocation(line: 124, column: 15, scope: !73)
!151 = !DILocation(line: 124, column: 24, scope: !73)
!152 = !DILocation(line: 124, column: 12, scope: !73)
!153 = !DILocation(line: 126, column: 15, scope: !73)
!154 = !DILocation(line: 126, column: 12, scope: !73)
!155 = !DILocation(line: 128, column: 15, scope: !73)
!156 = !DILocation(line: 128, column: 24, scope: !73)
!157 = !DILocation(line: 128, column: 12, scope: !73)
!158 = !DILocation(line: 130, column: 15, scope: !73)
!159 = !DILocation(line: 130, column: 12, scope: !73)
!160 = !DILocation(line: 132, column: 15, scope: !73)
!161 = !DILocation(line: 132, column: 24, scope: !73)
!162 = !DILocation(line: 132, column: 12, scope: !73)
!163 = !DILocation(line: 134, column: 15, scope: !73)
!164 = !DILocation(line: 134, column: 12, scope: !73)
!165 = !DILocation(line: 136, column: 15, scope: !73)
!166 = !DILocation(line: 136, column: 24, scope: !73)
!167 = !DILocation(line: 136, column: 12, scope: !73)
!168 = !DILocation(line: 138, column: 15, scope: !73)
!169 = !DILocation(line: 138, column: 12, scope: !73)
!170 = !DILocation(line: 140, column: 15, scope: !73)
!171 = !DILocation(line: 140, column: 24, scope: !73)
!172 = !DILocation(line: 140, column: 12, scope: !73)
!173 = !DILocation(line: 142, column: 15, scope: !73)
!174 = !DILocation(line: 142, column: 12, scope: !73)
!175 = !DILocation(line: 144, column: 13, scope: !73)
!176 = !DILocation(line: 146, column: 14, scope: !73)
!177 = !DILocation(line: 71, column: 27, scope: !74)
!178 = !DILocation(line: 71, column: 19, scope: !74)
!179 = distinct !{!179, !85, !180, !181}
!180 = !DILocation(line: 149, column: 5, scope: !75)
!181 = !{!"llvm.loop.mustprogress"}
!182 = !DILocation(line: 69, column: 25, scope: !70)
!183 = !DILocation(line: 69, column: 17, scope: !70)
!184 = distinct !{!184, !82, !185, !181}
!185 = !DILocation(line: 150, column: 3, scope: !71)
!186 = !DILocation(line: 152, column: 3, scope: !57)
!187 = distinct !DISubprogram(name: "multiply_block", scope: !3, file: !3, line: 158, type: !58, scopeLine: 158, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !188)
!188 = !{!189, !190, !191, !192, !193, !194, !195, !199, !203, !204, !205, !206, !207}
!189 = !DILocalVariable(name: "A", arg: 1, scope: !187, file: !3, line: 158, type: !8)
!190 = !DILocalVariable(name: "B", arg: 2, scope: !187, file: !3, line: 158, type: !8)
!191 = !DILocalVariable(name: "R", arg: 3, scope: !187, file: !3, line: 158, type: !8)
!192 = !DILocalVariable(name: "i", scope: !187, file: !3, line: 160, type: !17)
!193 = !DILocalVariable(name: "j", scope: !187, file: !3, line: 160, type: !17)
!194 = !DILocalVariable(name: "flops", scope: !187, file: !3, line: 161, type: !60)
!195 = !DILocalVariable(name: "bp", scope: !196, file: !3, line: 164, type: !5)
!196 = distinct !DILexicalBlock(scope: !197, file: !3, line: 163, column: 31)
!197 = distinct !DILexicalBlock(scope: !198, file: !3, line: 163, column: 3)
!198 = distinct !DILexicalBlock(scope: !187, file: !3, line: 163, column: 3)
!199 = !DILocalVariable(name: "ap", scope: !200, file: !3, line: 166, type: !5)
!200 = distinct !DILexicalBlock(scope: !201, file: !3, line: 165, column: 33)
!201 = distinct !DILexicalBlock(scope: !202, file: !3, line: 165, column: 5)
!202 = distinct !DILexicalBlock(scope: !196, file: !3, line: 165, column: 5)
!203 = !DILocalVariable(name: "rp", scope: !200, file: !3, line: 167, type: !5)
!204 = !DILocalVariable(name: "s0_0", scope: !200, file: !3, line: 168, type: !6)
!205 = !DILocalVariable(name: "s0_1", scope: !200, file: !3, line: 168, type: !6)
!206 = !DILocalVariable(name: "s1_0", scope: !200, file: !3, line: 169, type: !6)
!207 = !DILocalVariable(name: "s1_1", scope: !200, file: !3, line: 169, type: !6)
!208 = !DILocation(line: 0, scope: !187)
!209 = !DILocation(line: 163, column: 3, scope: !198)
!210 = !DILocation(line: 164, column: 18, scope: !196)
!211 = !DILocation(line: 0, scope: !196)
!212 = !DILocation(line: 165, column: 5, scope: !202)
!213 = !DILocation(line: 166, column: 36, scope: !200)
!214 = !DILocation(line: 166, column: 20, scope: !200)
!215 = !DILocation(line: 0, scope: !200)
!216 = !DILocation(line: 167, column: 36, scope: !200)
!217 = !DILocation(line: 167, column: 20, scope: !200)
!218 = !DILocation(line: 170, column: 14, scope: !200)
!219 = !DILocation(line: 170, column: 22, scope: !200)
!220 = !DILocation(line: 170, column: 20, scope: !200)
!221 = !DILocation(line: 172, column: 14, scope: !200)
!222 = !DILocation(line: 172, column: 21, scope: !200)
!223 = !DILocation(line: 174, column: 15, scope: !200)
!224 = !DILocation(line: 174, column: 23, scope: !200)
!225 = !DILocation(line: 174, column: 12, scope: !200)
!226 = !DILocation(line: 176, column: 15, scope: !200)
!227 = !DILocation(line: 176, column: 12, scope: !200)
!228 = !DILocation(line: 178, column: 15, scope: !200)
!229 = !DILocation(line: 178, column: 23, scope: !200)
!230 = !DILocation(line: 178, column: 12, scope: !200)
!231 = !DILocation(line: 180, column: 15, scope: !200)
!232 = !DILocation(line: 180, column: 12, scope: !200)
!233 = !DILocation(line: 182, column: 15, scope: !200)
!234 = !DILocation(line: 182, column: 23, scope: !200)
!235 = !DILocation(line: 182, column: 12, scope: !200)
!236 = !DILocation(line: 184, column: 15, scope: !200)
!237 = !DILocation(line: 184, column: 12, scope: !200)
!238 = !DILocation(line: 186, column: 15, scope: !200)
!239 = !DILocation(line: 186, column: 23, scope: !200)
!240 = !DILocation(line: 186, column: 12, scope: !200)
!241 = !DILocation(line: 188, column: 15, scope: !200)
!242 = !DILocation(line: 188, column: 12, scope: !200)
!243 = !DILocation(line: 190, column: 15, scope: !200)
!244 = !DILocation(line: 190, column: 23, scope: !200)
!245 = !DILocation(line: 190, column: 12, scope: !200)
!246 = !DILocation(line: 192, column: 15, scope: !200)
!247 = !DILocation(line: 192, column: 12, scope: !200)
!248 = !DILocation(line: 194, column: 15, scope: !200)
!249 = !DILocation(line: 194, column: 23, scope: !200)
!250 = !DILocation(line: 194, column: 12, scope: !200)
!251 = !DILocation(line: 196, column: 15, scope: !200)
!252 = !DILocation(line: 196, column: 12, scope: !200)
!253 = !DILocation(line: 198, column: 15, scope: !200)
!254 = !DILocation(line: 198, column: 23, scope: !200)
!255 = !DILocation(line: 198, column: 12, scope: !200)
!256 = !DILocation(line: 200, column: 15, scope: !200)
!257 = !DILocation(line: 200, column: 12, scope: !200)
!258 = !DILocation(line: 202, column: 15, scope: !200)
!259 = !DILocation(line: 202, column: 23, scope: !200)
!260 = !DILocation(line: 202, column: 12, scope: !200)
!261 = !DILocation(line: 204, column: 15, scope: !200)
!262 = !DILocation(line: 204, column: 12, scope: !200)
!263 = !DILocation(line: 206, column: 15, scope: !200)
!264 = !DILocation(line: 206, column: 23, scope: !200)
!265 = !DILocation(line: 206, column: 12, scope: !200)
!266 = !DILocation(line: 208, column: 15, scope: !200)
!267 = !DILocation(line: 208, column: 12, scope: !200)
!268 = !DILocation(line: 210, column: 15, scope: !200)
!269 = !DILocation(line: 210, column: 24, scope: !200)
!270 = !DILocation(line: 210, column: 12, scope: !200)
!271 = !DILocation(line: 212, column: 15, scope: !200)
!272 = !DILocation(line: 212, column: 12, scope: !200)
!273 = !DILocation(line: 214, column: 15, scope: !200)
!274 = !DILocation(line: 214, column: 24, scope: !200)
!275 = !DILocation(line: 214, column: 12, scope: !200)
!276 = !DILocation(line: 216, column: 15, scope: !200)
!277 = !DILocation(line: 216, column: 12, scope: !200)
!278 = !DILocation(line: 218, column: 15, scope: !200)
!279 = !DILocation(line: 218, column: 24, scope: !200)
!280 = !DILocation(line: 218, column: 12, scope: !200)
!281 = !DILocation(line: 220, column: 15, scope: !200)
!282 = !DILocation(line: 220, column: 12, scope: !200)
!283 = !DILocation(line: 222, column: 15, scope: !200)
!284 = !DILocation(line: 222, column: 24, scope: !200)
!285 = !DILocation(line: 222, column: 12, scope: !200)
!286 = !DILocation(line: 224, column: 15, scope: !200)
!287 = !DILocation(line: 224, column: 12, scope: !200)
!288 = !DILocation(line: 226, column: 15, scope: !200)
!289 = !DILocation(line: 226, column: 24, scope: !200)
!290 = !DILocation(line: 226, column: 12, scope: !200)
!291 = !DILocation(line: 228, column: 15, scope: !200)
!292 = !DILocation(line: 228, column: 12, scope: !200)
!293 = !DILocation(line: 230, column: 15, scope: !200)
!294 = !DILocation(line: 230, column: 24, scope: !200)
!295 = !DILocation(line: 230, column: 12, scope: !200)
!296 = !DILocation(line: 232, column: 15, scope: !200)
!297 = !DILocation(line: 232, column: 12, scope: !200)
!298 = !DILocation(line: 234, column: 13, scope: !200)
!299 = !DILocation(line: 236, column: 7, scope: !200)
!300 = !DILocation(line: 236, column: 14, scope: !200)
!301 = !DILocation(line: 165, column: 27, scope: !201)
!302 = !DILocation(line: 165, column: 19, scope: !201)
!303 = distinct !{!303, !212, !304, !181}
!304 = !DILocation(line: 239, column: 5, scope: !202)
!305 = !DILocation(line: 163, column: 25, scope: !197)
!306 = !DILocation(line: 163, column: 17, scope: !197)
!307 = distinct !{!307, !209, !308, !181}
!308 = !DILocation(line: 240, column: 3, scope: !198)
!309 = !DILocation(line: 242, column: 3, scope: !187)
!310 = distinct !DISubprogram(name: "check_block", scope: !3, file: !3, line: 248, type: !311, scopeLine: 248, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !314)
!311 = !DISubroutineType(types: !312)
!312 = !{null, !8, !6, !313}
!313 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!314 = !{!315, !316, !317, !318, !319}
!315 = !DILocalVariable(name: "R", arg: 1, scope: !310, file: !3, line: 248, type: !8)
!316 = !DILocalVariable(name: "v", arg: 2, scope: !310, file: !3, line: 248, type: !6)
!317 = !DILocalVariable(name: "errorf", arg: 3, scope: !310, file: !3, line: 248, type: !313)
!318 = !DILocalVariable(name: "i", scope: !310, file: !3, line: 250, type: !17)
!319 = !DILocalVariable(name: "error", scope: !310, file: !3, line: 251, type: !17)
!320 = !DILocation(line: 0, scope: !310)
!321 = !DILocation(line: 255, column: 9, scope: !322)
!322 = distinct !DILexicalBlock(scope: !323, file: !3, line: 255, column: 9)
!323 = distinct !DILexicalBlock(scope: !324, file: !3, line: 254, column: 3)
!324 = distinct !DILexicalBlock(scope: !310, file: !3, line: 254, column: 3)
!325 = !DILocation(line: 255, column: 26, scope: !322)
!326 = !DILocation(line: 255, column: 9, scope: !323)
!327 = !DILocation(line: 257, column: 17, scope: !328)
!328 = distinct !DILexicalBlock(scope: !329, file: !3, line: 256, column: 11)
!329 = distinct !DILexicalBlock(scope: !322, file: !3, line: 255, column: 32)
!330 = !{!331, !331, i64 0}
!331 = !{!"any pointer", !50, i64 0}
!332 = !DILocation(line: 257, column: 9, scope: !328)
!333 = !DILocation(line: 260, column: 5, scope: !329)
!334 = !DILocation(line: 262, column: 11, scope: !310)
!335 = !{!336, !336, i64 0}
!336 = !{!"int", !50, i64 0}
!337 = !DILocation(line: 263, column: 1, scope: !310)
!338 = distinct !DISubprogram(name: "compare_block", scope: !3, file: !3, line: 265, type: !339, scopeLine: 265, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !341)
!339 = !DISubroutineType(types: !340)
!340 = !{!17, !8, !8}
!341 = !{!342, !343, !344, !345}
!342 = !DILocalVariable(name: "R", arg: 1, scope: !338, file: !3, line: 265, type: !8)
!343 = !DILocalVariable(name: "B", arg: 2, scope: !338, file: !3, line: 265, type: !8)
!344 = !DILocalVariable(name: "i", scope: !338, file: !3, line: 267, type: !17)
!345 = !DILocalVariable(name: "error", scope: !338, file: !3, line: 268, type: !17)
!346 = !DILocation(line: 0, scope: !338)
!347 = !DILocation(line: 272, column: 9, scope: !348)
!348 = distinct !DILexicalBlock(scope: !349, file: !3, line: 272, column: 9)
!349 = distinct !DILexicalBlock(scope: !350, file: !3, line: 271, column: 3)
!350 = distinct !DILexicalBlock(scope: !338, file: !3, line: 271, column: 3)
!351 = !DILocation(line: 272, column: 29, scope: !348)
!352 = !DILocation(line: 272, column: 26, scope: !348)
!353 = !DILocation(line: 272, column: 9, scope: !349)
!354 = !DILocation(line: 274, column: 17, scope: !355)
!355 = distinct !DILexicalBlock(scope: !356, file: !3, line: 273, column: 11)
!356 = distinct !DILexicalBlock(scope: !348, file: !3, line: 272, column: 48)
!357 = !DILocation(line: 274, column: 9, scope: !355)
!358 = !DILocation(line: 278, column: 5, scope: !356)
!359 = !DILocation(line: 271, column: 3, scope: !350)
!360 = distinct !{!360, !359, !361, !181, !362, !363}
!361 = !DILocation(line: 278, column: 5, scope: !350)
!362 = !{!"llvm.loop.peeled.count", i32 1}
!363 = !{!"llvm.loop.isvectorized", i32 1}
!364 = !DILocation(line: 280, column: 3, scope: !338)
!365 = distinct !DISubprogram(name: "check_matrix", scope: !3, file: !3, line: 283, type: !366, scopeLine: 283, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !368)
!366 = !DISubroutineType(types: !367)
!367 = !{null, !8, !40, !40, !40, !6, !313}
!368 = !{!369, !370, !371, !372, !373, !374, !375, !376}
!369 = !DILocalVariable(name: "R", arg: 1, scope: !365, file: !3, line: 283, type: !8)
!370 = !DILocalVariable(name: "x", arg: 2, scope: !365, file: !3, line: 283, type: !40)
!371 = !DILocalVariable(name: "y", arg: 3, scope: !365, file: !3, line: 283, type: !40)
!372 = !DILocalVariable(name: "o", arg: 4, scope: !365, file: !3, line: 283, type: !40)
!373 = !DILocalVariable(name: "v", arg: 5, scope: !365, file: !3, line: 283, type: !6)
!374 = !DILocalVariable(name: "errorf", arg: 6, scope: !365, file: !3, line: 283, type: !313)
!375 = !DILocalVariable(name: "a", scope: !365, file: !3, line: 285, type: !17)
!376 = !DILocalVariable(name: "b", scope: !365, file: !3, line: 285, type: !17)
!377 = !DILocation(line: 0, scope: !378)
!378 = distinct !DILexicalBlock(scope: !379, file: !3, line: 292, column: 12)
!379 = distinct !DILexicalBlock(scope: !365, file: !3, line: 292, column: 7)
!380 = !DILocation(line: 0, scope: !365)
!381 = !DILocation(line: 287, column: 9, scope: !382)
!382 = distinct !DILexicalBlock(scope: !365, file: !3, line: 287, column: 7)
!383 = !DILocation(line: 287, column: 13, scope: !382)
!384 = !DILocation(line: 287, column: 7, scope: !365)
!385 = !DILocation(line: 0, scope: !310, inlinedAt: !386)
!386 = distinct !DILocation(line: 288, column: 5, scope: !387)
!387 = distinct !DILexicalBlock(scope: !382, file: !3, line: 287, column: 19)
!388 = !DILocation(line: 255, column: 9, scope: !322, inlinedAt: !386)
!389 = !DILocation(line: 255, column: 26, scope: !322, inlinedAt: !386)
!390 = !DILocation(line: 255, column: 9, scope: !323, inlinedAt: !386)
!391 = !DILocation(line: 257, column: 17, scope: !328, inlinedAt: !386)
!392 = !DILocation(line: 257, column: 9, scope: !328, inlinedAt: !386)
!393 = !DILocation(line: 260, column: 5, scope: !329, inlinedAt: !386)
!394 = !DILocation(line: 262, column: 11, scope: !310, inlinedAt: !386)
!395 = !DILocation(line: 301, column: 1, scope: !365)
!396 = !DILocation(line: 292, column: 8, scope: !379)
!397 = !DILocation(line: 292, column: 7, scope: !365)
!398 = !DILocation(line: 293, column: 32, scope: !378)
!399 = !DILocation(line: 293, column: 16, scope: !378)
!400 = !DILocation(line: 294, column: 25, scope: !378)
!401 = !DILocation(line: 294, column: 19, scope: !378)
!402 = !DILocation(line: 294, column: 30, scope: !378)
!403 = !DILocation(line: 294, column: 33, scope: !378)
!404 = !DILocation(line: 297, column: 34, scope: !405)
!405 = distinct !DILexicalBlock(scope: !379, file: !3, line: 296, column: 10)
!406 = !DILocation(line: 297, column: 16, scope: !405)
!407 = !DILocation(line: 298, column: 19, scope: !405)
!408 = !DILocation(line: 298, column: 30, scope: !405)
!409 = !DILocation(line: 298, column: 33, scope: !405)
!410 = distinct !DISubprogram(name: "add_block", scope: !3, file: !3, line: 303, type: !411, scopeLine: 303, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !413)
!411 = !DISubroutineType(types: !412)
!412 = !{!60, !8, !8}
!413 = !{!414, !415, !416}
!414 = !DILocalVariable(name: "T", arg: 1, scope: !410, file: !3, line: 303, type: !8)
!415 = !DILocalVariable(name: "R", arg: 2, scope: !410, file: !3, line: 303, type: !8)
!416 = !DILocalVariable(name: "i", scope: !410, file: !3, line: 305, type: !40)
!417 = !DILocation(line: 0, scope: !410)
!418 = !DILocation(line: 307, column: 3, scope: !419)
!419 = distinct !DILexicalBlock(scope: !410, file: !3, line: 307, column: 3)
!420 = !DILocation(line: 308, column: 25, scope: !421)
!421 = distinct !DILexicalBlock(scope: !422, file: !3, line: 307, column: 39)
!422 = distinct !DILexicalBlock(scope: !419, file: !3, line: 307, column: 3)
!423 = !DILocation(line: 308, column: 5, scope: !421)
!424 = !DILocation(line: 308, column: 22, scope: !421)
!425 = !DILocation(line: 309, column: 45, scope: !421)
!426 = !DILocation(line: 309, column: 29, scope: !421)
!427 = !DILocation(line: 309, column: 5, scope: !421)
!428 = !DILocation(line: 309, column: 26, scope: !421)
!429 = !DILocation(line: 310, column: 45, scope: !421)
!430 = !DILocation(line: 310, column: 29, scope: !421)
!431 = !DILocation(line: 310, column: 5, scope: !421)
!432 = !DILocation(line: 310, column: 26, scope: !421)
!433 = !DILocation(line: 311, column: 45, scope: !421)
!434 = !DILocation(line: 311, column: 29, scope: !421)
!435 = !DILocation(line: 311, column: 5, scope: !421)
!436 = !DILocation(line: 311, column: 26, scope: !421)
!437 = !DILocation(line: 307, column: 33, scope: !422)
!438 = !DILocation(line: 307, column: 17, scope: !422)
!439 = distinct !{!439, !418, !440, !181}
!440 = !DILocation(line: 312, column: 3, scope: !419)
!441 = !DILocation(line: 314, column: 3, scope: !410)
!442 = distinct !DISubprogram(name: "add_matrix", scope: !3, file: !3, line: 320, type: !443, scopeLine: 320, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !445)
!443 = !DISubroutineType(types: !444)
!444 = !{null, !8, !40, !8, !40, !40, !40}
!445 = !{!446, !447, !448, !449, !450, !451}
!446 = !DILocalVariable(name: "T", arg: 1, scope: !442, file: !3, line: 320, type: !8)
!447 = !DILocalVariable(name: "ot", arg: 2, scope: !442, file: !3, line: 320, type: !40)
!448 = !DILocalVariable(name: "R", arg: 3, scope: !442, file: !3, line: 320, type: !8)
!449 = !DILocalVariable(name: "orr", arg: 4, scope: !442, file: !3, line: 320, type: !40)
!450 = !DILocalVariable(name: "x", arg: 5, scope: !442, file: !3, line: 320, type: !40)
!451 = !DILocalVariable(name: "y", arg: 6, scope: !442, file: !3, line: 320, type: !40)
!452 = !DILocation(line: 0, scope: !453)
!453 = distinct !DILexicalBlock(scope: !454, file: !3, line: 327, column: 14)
!454 = distinct !DILexicalBlock(scope: !442, file: !3, line: 327, column: 7)
!455 = !DILocation(line: 0, scope: !442)
!456 = !DILocation(line: 322, column: 9, scope: !457)
!457 = distinct !DILexicalBlock(scope: !442, file: !3, line: 322, column: 7)
!458 = !DILocation(line: 322, column: 12, scope: !457)
!459 = !DILocation(line: 322, column: 7, scope: !442)
!460 = !DILocation(line: 0, scope: !410, inlinedAt: !461)
!461 = distinct !DILocation(line: 323, column: 5, scope: !462)
!462 = distinct !DILexicalBlock(scope: !457, file: !3, line: 322, column: 17)
!463 = !DILocation(line: 308, column: 25, scope: !421, inlinedAt: !461)
!464 = !DILocation(line: 308, column: 5, scope: !421, inlinedAt: !461)
!465 = !DILocation(line: 308, column: 22, scope: !421, inlinedAt: !461)
!466 = !DILocation(line: 309, column: 45, scope: !421, inlinedAt: !461)
!467 = !DILocation(line: 309, column: 29, scope: !421, inlinedAt: !461)
!468 = !DILocation(line: 309, column: 5, scope: !421, inlinedAt: !461)
!469 = !DILocation(line: 309, column: 26, scope: !421, inlinedAt: !461)
!470 = !DILocation(line: 310, column: 45, scope: !421, inlinedAt: !461)
!471 = !DILocation(line: 310, column: 29, scope: !421, inlinedAt: !461)
!472 = !DILocation(line: 310, column: 5, scope: !421, inlinedAt: !461)
!473 = !DILocation(line: 310, column: 26, scope: !421, inlinedAt: !461)
!474 = !DILocation(line: 311, column: 45, scope: !421, inlinedAt: !461)
!475 = !DILocation(line: 311, column: 29, scope: !421, inlinedAt: !461)
!476 = !DILocation(line: 311, column: 5, scope: !421, inlinedAt: !461)
!477 = !DILocation(line: 311, column: 26, scope: !421, inlinedAt: !461)
!478 = !DILocation(line: 307, column: 33, scope: !422, inlinedAt: !461)
!479 = !DILocation(line: 307, column: 17, scope: !422, inlinedAt: !461)
!480 = !DILocation(line: 307, column: 3, scope: !419, inlinedAt: !461)
!481 = distinct !{!481, !480, !482, !181}
!482 = !DILocation(line: 312, column: 3, scope: !419, inlinedAt: !461)
!483 = !DILocation(line: 327, column: 9, scope: !454)
!484 = !DILocation(line: 327, column: 7, scope: !442)
!485 = !DILocation(line: 328, column: 39, scope: !453)
!486 = !DILocation(line: 328, column: 16, scope: !453)
!487 = !DILocation(line: 329, column: 23, scope: !453)
!488 = !DILocation(line: 329, column: 17, scope: !453)
!489 = !DILocation(line: 329, column: 37, scope: !453)
!490 = !DILocation(line: 329, column: 31, scope: !453)
!491 = !DILocation(line: 329, column: 48, scope: !453)
!492 = !DILocation(line: 329, column: 51, scope: !453)
!493 = !DILocation(line: 329, column: 5, scope: !453)
!494 = !DILocation(line: 330, column: 3, scope: !453)
!495 = !DILocation(line: 331, column: 41, scope: !496)
!496 = distinct !DILexicalBlock(scope: !454, file: !3, line: 330, column: 10)
!497 = !DILocation(line: 331, column: 16, scope: !496)
!498 = !DILocation(line: 332, column: 17, scope: !496)
!499 = !DILocation(line: 332, column: 28, scope: !496)
!500 = !DILocation(line: 332, column: 43, scope: !496)
!501 = !DILocation(line: 332, column: 46, scope: !496)
!502 = !DILocation(line: 332, column: 5, scope: !496)
!503 = !DILocation(line: 334, column: 3, scope: !442)
!504 = !DILocation(line: 335, column: 1, scope: !442)
!505 = distinct !DISubprogram(name: "init_block", scope: !3, file: !3, line: 337, type: !506, scopeLine: 337, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !508)
!506 = !DISubroutineType(types: !507)
!507 = !{null, !8, !6}
!508 = !{!509, !510, !511}
!509 = !DILocalVariable(name: "R", arg: 1, scope: !505, file: !3, line: 337, type: !8)
!510 = !DILocalVariable(name: "v", arg: 2, scope: !505, file: !3, line: 337, type: !6)
!511 = !DILocalVariable(name: "i", scope: !505, file: !3, line: 339, type: !17)
!512 = !DILocation(line: 0, scope: !505)
!513 = !DILocation(line: 341, column: 3, scope: !514)
!514 = distinct !DILexicalBlock(scope: !505, file: !3, line: 341, column: 3)
!515 = !DILocation(line: 342, column: 22, scope: !516)
!516 = distinct !DILexicalBlock(scope: !514, file: !3, line: 341, column: 3)
!517 = !DILocation(line: 341, column: 32, scope: !516)
!518 = !DILocation(line: 343, column: 1, scope: !505)
!519 = distinct !DISubprogram(name: "init_matrix", scope: !3, file: !3, line: 345, type: !520, scopeLine: 345, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !522)
!520 = !DISubroutineType(types: !521)
!521 = !{null, !8, !40, !40, !40, !6}
!522 = !{!523, !524, !525, !526, !527}
!523 = !DILocalVariable(name: "R", arg: 1, scope: !519, file: !3, line: 345, type: !8)
!524 = !DILocalVariable(name: "x", arg: 2, scope: !519, file: !3, line: 345, type: !40)
!525 = !DILocalVariable(name: "y", arg: 3, scope: !519, file: !3, line: 345, type: !40)
!526 = !DILocalVariable(name: "o", arg: 4, scope: !519, file: !3, line: 345, type: !40)
!527 = !DILocalVariable(name: "v", arg: 5, scope: !519, file: !3, line: 345, type: !6)
!528 = !DILocation(line: 0, scope: !529)
!529 = distinct !DILexicalBlock(scope: !530, file: !3, line: 352, column: 12)
!530 = distinct !DILexicalBlock(scope: !519, file: !3, line: 352, column: 7)
!531 = !DILocation(line: 0, scope: !519)
!532 = !DILocation(line: 347, column: 9, scope: !533)
!533 = distinct !DILexicalBlock(scope: !519, file: !3, line: 347, column: 7)
!534 = !DILocation(line: 347, column: 12, scope: !533)
!535 = !DILocation(line: 347, column: 7, scope: !519)
!536 = !DILocation(line: 341, column: 3, scope: !514, inlinedAt: !537)
!537 = distinct !DILocation(line: 348, column: 5, scope: !538)
!538 = distinct !DILexicalBlock(scope: !533, file: !3, line: 347, column: 17)
!539 = !DILocation(line: 342, column: 22, scope: !516, inlinedAt: !537)
!540 = !DILocation(line: 341, column: 32, scope: !516, inlinedAt: !537)
!541 = !DILocation(line: 363, column: 1, scope: !519)
!542 = !DILocation(line: 352, column: 8, scope: !530)
!543 = !DILocation(line: 352, column: 7, scope: !519)
!544 = !DILocation(line: 353, column: 31, scope: !529)
!545 = !DILocation(line: 353, column: 16, scope: !529)
!546 = !DILocation(line: 354, column: 24, scope: !529)
!547 = !DILocation(line: 354, column: 29, scope: !529)
!548 = !DILocation(line: 354, column: 32, scope: !529)
!549 = !DILocation(line: 356, column: 3, scope: !529)
!550 = !DILocation(line: 357, column: 33, scope: !551)
!551 = distinct !DILexicalBlock(scope: !530, file: !3, line: 356, column: 10)
!552 = !DILocation(line: 357, column: 16, scope: !551)
!553 = !DILocation(line: 358, column: 29, scope: !551)
!554 = !DILocation(line: 358, column: 32, scope: !551)
!555 = !DILocation(line: 0, scope: !530)
!556 = !DILocation(line: 360, column: 3, scope: !519)
!557 = distinct !DISubprogram(name: "multiply_matrix", scope: !3, file: !3, line: 365, type: !558, scopeLine: 366, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !560)
!558 = !DISubroutineType(types: !559)
!559 = !{null, !8, !40, !8, !40, !40, !40, !40, !8, !40, !17}
!560 = !{!561, !562, !563, !564, !565, !566, !567, !568, !569, !570}
!561 = !DILocalVariable(name: "A", arg: 1, scope: !557, file: !3, line: 365, type: !8)
!562 = !DILocalVariable(name: "oa", arg: 2, scope: !557, file: !3, line: 365, type: !40)
!563 = !DILocalVariable(name: "B", arg: 3, scope: !557, file: !3, line: 365, type: !8)
!564 = !DILocalVariable(name: "ob", arg: 4, scope: !557, file: !3, line: 365, type: !40)
!565 = !DILocalVariable(name: "x", arg: 5, scope: !557, file: !3, line: 365, type: !40)
!566 = !DILocalVariable(name: "y", arg: 6, scope: !557, file: !3, line: 366, type: !40)
!567 = !DILocalVariable(name: "z", arg: 7, scope: !557, file: !3, line: 366, type: !40)
!568 = !DILocalVariable(name: "R", arg: 8, scope: !557, file: !3, line: 366, type: !8)
!569 = !DILocalVariable(name: "orr", arg: 9, scope: !557, file: !3, line: 366, type: !40)
!570 = !DILocalVariable(name: "add", arg: 10, scope: !557, file: !3, line: 366, type: !17)
!571 = !DILocation(line: 0, scope: !572)
!572 = distinct !DILexicalBlock(scope: !573, file: !3, line: 376, column: 26)
!573 = distinct !DILexicalBlock(scope: !557, file: !3, line: 376, column: 7)
!574 = !DILocation(line: 0, scope: !557)
!575 = !DILocation(line: 368, column: 9, scope: !576)
!576 = distinct !DILexicalBlock(scope: !557, file: !3, line: 368, column: 7)
!577 = !DILocation(line: 368, column: 11, scope: !576)
!578 = !DILocation(line: 368, column: 15, scope: !576)
!579 = !DILocation(line: 368, column: 7, scope: !557)
!580 = !DILocation(line: 369, column: 9, scope: !581)
!581 = distinct !DILexicalBlock(scope: !582, file: !3, line: 369, column: 9)
!582 = distinct !DILexicalBlock(scope: !576, file: !3, line: 368, column: 21)
!583 = !DILocation(line: 369, column: 9, scope: !582)
!584 = !DILocation(line: 370, column: 7, scope: !581)
!585 = !DILocation(line: 372, column: 7, scope: !581)
!586 = !DILocation(line: 376, column: 9, scope: !573)
!587 = !DILocation(line: 376, column: 14, scope: !573)
!588 = !DILocation(line: 377, column: 47, scope: !572)
!589 = !DILocation(line: 377, column: 16, scope: !572)
!590 = !DILocation(line: 378, column: 28, scope: !572)
!591 = !DILocation(line: 378, column: 22, scope: !572)
!592 = !DILocation(line: 379, column: 27, scope: !572)
!593 = !DILocation(line: 379, column: 30, scope: !572)
!594 = !DILocation(line: 379, column: 47, scope: !572)
!595 = !DILocation(line: 379, column: 41, scope: !572)
!596 = !DILocation(line: 378, column: 5, scope: !572)
!597 = !DILocation(line: 380, column: 3, scope: !572)
!598 = !DILocation(line: 382, column: 15, scope: !599)
!599 = distinct !DILexicalBlock(scope: !600, file: !3, line: 382, column: 9)
!600 = distinct !DILexicalBlock(scope: !573, file: !3, line: 380, column: 10)
!601 = !DILocation(line: 383, column: 27, scope: !602)
!602 = distinct !DILexicalBlock(scope: !599, file: !3, line: 382, column: 26)
!603 = !DILocation(line: 383, column: 24, scope: !602)
!604 = !DILocation(line: 384, column: 38, scope: !602)
!605 = !DILocation(line: 384, column: 32, scope: !602)
!606 = !DILocation(line: 384, column: 52, scope: !602)
!607 = !DILocation(line: 384, column: 55, scope: !602)
!608 = !DILocation(line: 383, column: 7, scope: !602)
!609 = !DILocation(line: 385, column: 7, scope: !602)
!610 = !DILocation(line: 386, column: 5, scope: !602)
!611 = !DILocation(line: 387, column: 55, scope: !612)
!612 = distinct !DILexicalBlock(scope: !599, file: !3, line: 386, column: 12)
!613 = !DILocation(line: 387, column: 18, scope: !612)
!614 = !DILocation(line: 388, column: 31, scope: !612)
!615 = !DILocation(line: 388, column: 51, scope: !612)
!616 = !DILocation(line: 388, column: 54, scope: !612)
!617 = !DILocation(line: 389, column: 33, scope: !612)
!618 = !DILocation(line: 388, column: 7, scope: !612)
!619 = !DILocation(line: 392, column: 3, scope: !557)
!620 = !DILocation(line: 393, column: 1, scope: !557)
!621 = distinct !DISubprogram(name: "run", scope: !3, file: !3, line: 395, type: !622, scopeLine: 395, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !624)
!622 = !DISubroutineType(types: !623)
!623 = !{!17, !40, !40, !40, !17}
!624 = !{!625, !626, !627, !628, !629, !630, !631, !632, !633, !634}
!625 = !DILocalVariable(name: "x", arg: 1, scope: !621, file: !3, line: 395, type: !40)
!626 = !DILocalVariable(name: "y", arg: 2, scope: !621, file: !3, line: 395, type: !40)
!627 = !DILocalVariable(name: "z", arg: 3, scope: !621, file: !3, line: 395, type: !40)
!628 = !DILocalVariable(name: "check", arg: 4, scope: !621, file: !3, line: 395, type: !17)
!629 = !DILocalVariable(name: "A", scope: !621, file: !3, line: 397, type: !8)
!630 = !DILocalVariable(name: "B", scope: !621, file: !3, line: 397, type: !8)
!631 = !DILocalVariable(name: "R", scope: !621, file: !3, line: 397, type: !8)
!632 = !DILocalVariable(name: "t1", scope: !621, file: !3, line: 408, type: !34)
!633 = !DILocalVariable(name: "t2", scope: !621, file: !3, line: 408, type: !34)
!634 = !DILocalVariable(name: "runtime_ms", scope: !621, file: !3, line: 414, type: !32)
!635 = !DILocation(line: 0, scope: !621)
!636 = !DILocation(line: 399, column: 25, scope: !621)
!637 = !DILocation(line: 399, column: 28, scope: !621)
!638 = !DILocation(line: 399, column: 17, scope: !621)
!639 = !DILocation(line: 399, column: 7, scope: !621)
!640 = !DILocation(line: 400, column: 25, scope: !621)
!641 = !DILocation(line: 400, column: 28, scope: !621)
!642 = !DILocation(line: 400, column: 17, scope: !621)
!643 = !DILocation(line: 400, column: 7, scope: !621)
!644 = !DILocation(line: 401, column: 28, scope: !621)
!645 = !DILocation(line: 401, column: 17, scope: !621)
!646 = !DILocation(line: 401, column: 7, scope: !621)
!647 = !DILocation(line: 403, column: 14, scope: !621)
!648 = !DILocation(line: 404, column: 14, scope: !621)
!649 = !DILocation(line: 405, column: 3, scope: !621)
!650 = !DILocation(line: 406, column: 3, scope: !621)
!651 = !DILocation(line: 408, column: 3, scope: !621)
!652 = !DILocation(line: 408, column: 18, scope: !621)
!653 = !DILocation(line: 408, column: 22, scope: !621)
!654 = !DILocation(line: 409, column: 3, scope: !621)
!655 = !DILocation(line: 411, column: 3, scope: !621)
!656 = !DILocation(line: 413, column: 3, scope: !621)
!657 = !DILocation(line: 0, scope: !29, inlinedAt: !658)
!658 = distinct !DILocation(line: 414, column: 36, scope: !621)
!659 = !DILocation(line: 41, column: 16, scope: !29, inlinedAt: !658)
!660 = !DILocation(line: 41, column: 43, scope: !29, inlinedAt: !658)
!661 = !DILocation(line: 0, scope: !29, inlinedAt: !662)
!662 = distinct !DILocation(line: 414, column: 48, scope: !621)
!663 = !DILocation(line: 41, column: 16, scope: !29, inlinedAt: !662)
!664 = !DILocation(line: 41, column: 43, scope: !29, inlinedAt: !662)
!665 = !DILocation(line: 41, column: 37, scope: !29, inlinedAt: !658)
!666 = !DILocation(line: 414, column: 47, scope: !621)
!667 = !DILocation(line: 414, column: 60, scope: !621)
!668 = !DILocation(line: 415, column: 18, scope: !621)
!669 = !DILocation(line: 415, column: 28, scope: !621)
!670 = !DILocation(line: 415, column: 3, scope: !621)
!671 = !DILocation(line: 417, column: 6, scope: !672)
!672 = distinct !DILexicalBlock(scope: !621, file: !3, line: 417, column: 6)
!673 = !DILocation(line: 417, column: 6, scope: !621)
!674 = !DILocation(line: 430, column: 53, scope: !675)
!675 = distinct !DILexicalBlock(scope: !676, file: !3, line: 427, column: 10)
!676 = distinct !DILexicalBlock(scope: !621, file: !3, line: 423, column: 7)
!677 = !DILocation(line: 418, column: 5, scope: !678)
!678 = distinct !DILexicalBlock(scope: !672, file: !3, line: 417, column: 13)
!679 = !DILocation(line: 419, column: 11, scope: !678)
!680 = !DILocation(line: 420, column: 31, scope: !678)
!681 = !DILocation(line: 420, column: 30, scope: !678)
!682 = !DILocation(line: 420, column: 5, scope: !678)
!683 = !DILocation(line: 423, column: 7, scope: !676)
!684 = !DILocation(line: 423, column: 7, scope: !621)
!685 = !DILocation(line: 424, column: 5, scope: !686)
!686 = distinct !DILexicalBlock(scope: !676, file: !3, line: 423, column: 14)
!687 = !DILocation(line: 425, column: 27, scope: !686)
!688 = !DILocation(line: 425, column: 5, scope: !686)
!689 = !DILocation(line: 427, column: 3, scope: !686)
!690 = !DILocation(line: 428, column: 13, scope: !675)
!691 = !DILocation(line: 428, column: 5, scope: !675)
!692 = !DILocation(line: 429, column: 13, scope: !675)
!693 = !DILocation(line: 429, column: 53, scope: !675)
!694 = !DILocation(line: 429, column: 5, scope: !675)
!695 = !DILocation(line: 430, column: 13, scope: !675)
!696 = !DILocation(line: 430, column: 5, scope: !675)
!697 = !DILocation(line: 431, column: 13, scope: !675)
!698 = !DILocation(line: 431, column: 55, scope: !675)
!699 = !DILocation(line: 431, column: 5, scope: !675)
!700 = !DILocation(line: 437, column: 3, scope: !621)
!701 = !DILocation(line: 438, column: 3, scope: !621)
!702 = !DILocation(line: 439, column: 3, scope: !621)
!703 = !DILocation(line: 442, column: 1, scope: !621)
!704 = !DILocation(line: 441, column: 3, scope: !621)
!705 = !DISubprogram(name: "gettimeofday", scope: !706, file: !706, line: 72, type: !707, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !717)
!706 = !DIFile(filename: "/usr/include/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b3cbcac52b1954fa045aa74bfcd1a38")
!707 = !DISubroutineType(types: !708)
!708 = !{!17, !709, !710}
!709 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !33)
!710 = !DIDerivedType(tag: DW_TAG_typedef, name: "__timezone_ptr_t", file: !706, line: 62, baseType: !711)
!711 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !712)
!712 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !713, size: 64)
!713 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !706, line: 56, size: 64, elements: !714)
!714 = !{!715, !716}
!715 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !713, file: !706, line: 58, baseType: !17, size: 32)
!716 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !713, file: !706, line: 59, baseType: !17, size: 32, offset: 32)
!717 = !{}
!718 = distinct !DISubprogram(name: "usage", scope: !3, file: !3, line: 444, type: !719, scopeLine: 444, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !717)
!719 = !DISubroutineType(types: !720)
!720 = !{!17}
!721 = !DILocation(line: 445, column: 11, scope: !718)
!722 = !DILocation(line: 445, column: 3, scope: !718)
!723 = !DILocation(line: 447, column: 11, scope: !718)
!724 = !DILocation(line: 447, column: 3, scope: !718)
!725 = !DILocation(line: 449, column: 11, scope: !718)
!726 = !DILocation(line: 449, column: 3, scope: !718)
!727 = !DILocation(line: 450, column: 11, scope: !718)
!728 = !DILocation(line: 450, column: 3, scope: !718)
!729 = !DILocation(line: 451, column: 11, scope: !718)
!730 = !DILocation(line: 451, column: 3, scope: !718)
!731 = !DILocation(line: 452, column: 11, scope: !718)
!732 = !DILocation(line: 452, column: 3, scope: !718)
!733 = !DILocation(line: 453, column: 11, scope: !718)
!734 = !DILocation(line: 453, column: 3, scope: !718)
!735 = !DILocation(line: 455, column: 3, scope: !718)
!736 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 462, type: !737, scopeLine: 462, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !741)
!737 = !DISubroutineType(types: !738)
!738 = !{!17, !17, !739}
!739 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !740, size: 64)
!740 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!741 = !{!742, !743, !744, !745, !746, !747, !748, !749, !750}
!742 = !DILocalVariable(name: "argc", arg: 1, scope: !736, file: !3, line: 462, type: !17)
!743 = !DILocalVariable(name: "argv", arg: 2, scope: !736, file: !3, line: 462, type: !739)
!744 = !DILocalVariable(name: "x", scope: !736, file: !3, line: 464, type: !17)
!745 = !DILocalVariable(name: "y", scope: !736, file: !3, line: 464, type: !17)
!746 = !DILocalVariable(name: "z", scope: !736, file: !3, line: 464, type: !17)
!747 = !DILocalVariable(name: "benchmark", scope: !736, file: !3, line: 464, type: !17)
!748 = !DILocalVariable(name: "help", scope: !736, file: !3, line: 464, type: !17)
!749 = !DILocalVariable(name: "t", scope: !736, file: !3, line: 464, type: !17)
!750 = !DILocalVariable(name: "check", scope: !736, file: !3, line: 464, type: !17)
!751 = !DILocation(line: 0, scope: !736)
!752 = !DILocation(line: 464, column: 3, scope: !736)
!753 = !DILocation(line: 467, column: 5, scope: !736)
!754 = !DILocation(line: 468, column: 5, scope: !736)
!755 = !DILocation(line: 469, column: 5, scope: !736)
!756 = !DILocation(line: 470, column: 9, scope: !736)
!757 = !DILocation(line: 472, column: 3, scope: !736)
!758 = !DILocation(line: 475, column: 7, scope: !759)
!759 = distinct !DILexicalBlock(scope: !736, file: !3, line: 475, column: 7)
!760 = !DILocation(line: 475, column: 7, scope: !736)
!761 = !DILocation(line: 445, column: 11, scope: !718, inlinedAt: !762)
!762 = distinct !DILocation(line: 475, column: 20, scope: !759)
!763 = !DILocation(line: 445, column: 3, scope: !718, inlinedAt: !762)
!764 = !DILocation(line: 447, column: 11, scope: !718, inlinedAt: !762)
!765 = !DILocation(line: 447, column: 3, scope: !718, inlinedAt: !762)
!766 = !DILocation(line: 449, column: 11, scope: !718, inlinedAt: !762)
!767 = !DILocation(line: 449, column: 3, scope: !718, inlinedAt: !762)
!768 = !DILocation(line: 450, column: 11, scope: !718, inlinedAt: !762)
!769 = !DILocation(line: 450, column: 3, scope: !718, inlinedAt: !762)
!770 = !DILocation(line: 451, column: 11, scope: !718, inlinedAt: !762)
!771 = !DILocation(line: 451, column: 3, scope: !718, inlinedAt: !762)
!772 = !DILocation(line: 452, column: 11, scope: !718, inlinedAt: !762)
!773 = !DILocation(line: 452, column: 3, scope: !718, inlinedAt: !762)
!774 = !DILocation(line: 453, column: 11, scope: !718, inlinedAt: !762)
!775 = !DILocation(line: 453, column: 3, scope: !718, inlinedAt: !762)
!776 = !DILocation(line: 475, column: 13, scope: !759)
!777 = !DILocation(line: 477, column: 7, scope: !778)
!778 = distinct !DILexicalBlock(scope: !736, file: !3, line: 477, column: 7)
!779 = !DILocation(line: 477, column: 7, scope: !736)
!780 = !DILocation(line: 497, column: 7, scope: !736)
!781 = !DILocation(line: 498, column: 7, scope: !736)
!782 = !DILocation(line: 499, column: 7, scope: !736)
!783 = !DILocation(line: 497, column: 8, scope: !736)
!784 = !DILocation(line: 497, column: 5, scope: !736)
!785 = !DILocation(line: 498, column: 8, scope: !736)
!786 = !DILocation(line: 498, column: 5, scope: !736)
!787 = !DILocation(line: 499, column: 8, scope: !736)
!788 = !DILocation(line: 499, column: 5, scope: !736)
!789 = !DILocation(line: 501, column: 8, scope: !790)
!790 = distinct !DILexicalBlock(scope: !736, file: !3, line: 501, column: 7)
!791 = !DILocation(line: 501, column: 7, scope: !736)
!792 = !DILocation(line: 501, column: 13, scope: !790)
!793 = !DILocation(line: 501, column: 12, scope: !790)
!794 = !DILocation(line: 502, column: 8, scope: !795)
!795 = distinct !DILexicalBlock(scope: !736, file: !3, line: 502, column: 7)
!796 = !DILocation(line: 502, column: 7, scope: !736)
!797 = !DILocation(line: 502, column: 13, scope: !795)
!798 = !DILocation(line: 502, column: 12, scope: !795)
!799 = !DILocation(line: 503, column: 8, scope: !800)
!800 = distinct !DILexicalBlock(scope: !736, file: !3, line: 503, column: 7)
!801 = !DILocation(line: 503, column: 7, scope: !736)
!802 = !DILocation(line: 503, column: 13, scope: !800)
!803 = !DILocation(line: 503, column: 12, scope: !800)
!804 = !DILocation(line: 505, column: 15, scope: !736)
!805 = !DILocation(line: 505, column: 11, scope: !736)
!806 = !DILocation(line: 505, column: 13, scope: !736)
!807 = !DILocation(line: 505, column: 17, scope: !736)
!808 = !DILocation(line: 505, column: 7, scope: !736)
!809 = !DILocation(line: 507, column: 3, scope: !736)
!810 = !DILocation(line: 508, column: 1, scope: !736)
!811 = !DISubprogram(name: "get_options", scope: !812, file: !812, line: 20, type: !813, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !717)
!812 = !DIFile(filename: "./getoptions.h", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "bf060e74fdb298e4a85522e522cd3a24")
!813 = !DISubroutineType(types: !814)
!814 = !{null, !17, !739, !815, !313, null}
!815 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
