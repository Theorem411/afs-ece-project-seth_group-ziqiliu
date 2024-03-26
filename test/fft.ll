; ModuleID = 'fft.c'
source_filename = "fft.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.COMPLEX = type { float, float }
%struct.timezone = type { i32, i32 }

@.str = private unnamed_addr constant [15 x i8] c"n=%d error=%e\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"%f + %fi\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"n=%d ok\0A\00", align 1
@.str.5 = private unnamed_addr constant [15 x i8] c"PBBS-time: %f\0A\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.6 = private unnamed_addr constant [20 x i8] c"\0Acilk example: fft\0A\00", align 1
@.str.7 = private unnamed_addr constant [41 x i8] c"options:  number of elements   n = %ld\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [61 x i8] c"\0Ausage: fft [<cilk-options>] [-n #] [-c] [-benchmark] [-h]\0A\0A\00", align 1
@.str.9 = private unnamed_addr constant [61 x i8] c"this program is a highly optimized version of the classical\0A\00", align 1
@.str.10 = private unnamed_addr constant [72 x i8] c"cooley-tukey fast fourier transform algorithm.  some documentation can\0A\00", align 1
@.str.11 = private unnamed_addr constant [68 x i8] c"be found in the source code. the program is optimized for an exact\0A\00", align 1
@.str.12 = private unnamed_addr constant [57 x i8] c"power of 2.  to test for correctness use parameter -c.\0A\0A\00", align 1
@.str.13 = private unnamed_addr constant [3 x i8] c"-n\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@.str.15 = private unnamed_addr constant [11 x i8] c"-benchmark\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"-h\00", align 1
@.str.17 = private unnamed_addr constant [3 x i8] c"-r\00", align 1
@specifiers = dso_local global [6 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.17, i32 0, i32 0), i8* null], align 16
@opt_types = dso_local global [6 x i32] [i32 3, i32 4, i32 6, i32 4, i32 1, i32 0], align 16
@.str.18 = private unnamed_addr constant [17 x i8] c"Testing cos: %f\0A\00", align 1
@str = private unnamed_addr constant [4 x i8] c"ct:\00", align 1
@str.19 = private unnamed_addr constant [5 x i8] c"seq:\00", align 1

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i64 @todval(%struct.timeval* nocapture noundef readonly %tp) local_unnamed_addr #0 {
entry:
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 0
  %0 = load i64, i64* %tv_sec, align 8, !tbaa !3
  %mul1 = mul i64 %0, 1000000
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 1
  %1 = load i64, i64* %tv_usec, align 8, !tbaa !8
  %add = add nsw i64 %mul1, %1
  ret i64 %add
}

; Function Attrs: noinline nounwind uwtable writeonly
define dso_local void @startup_cilk() local_unnamed_addr #1 {
entry:
  %g = alloca double, align 8
  %syncreg = tail call token @llvm.syncregion.start()
  %g.0.g.0.g.0..sroa_cast = bitcast double* %g to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast)
  store double 2.000000e+00, double* %g, align 8, !tbaa !9
  br label %pfor.cond

pfor.cond:                                        ; preds = %pfor.inc, %entry
  %__begin.0 = phi i32 [ 0, %entry ], [ %inc, %pfor.inc ]
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc

pfor.body.entry:                                  ; preds = %pfor.cond
  %g.0.g.0.g.0. = load double, double* %g, align 8, !tbaa !9
  %call = tail call double @sin(double noundef %g.0.g.0.g.0.) #16
  %div3 = fdiv double %g.0.g.0.g.0., %call
  store double %div3, double* %g, align 8, !tbaa !9
  reattach within %syncreg, label %pfor.inc

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %inc = add nuw nsw i32 %__begin.0, 1
  %exitcond.not = icmp eq i32 %inc, 1000
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !llvm.loop !11

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %cleanup

cleanup:                                          ; preds = %pfor.cond.cleanup
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast)
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nounwind willreturn
declare token @llvm.syncregion.start() #3

; Function Attrs: mustprogress nofree nounwind willreturn writeonly
declare dso_local double @sin(double noundef) local_unnamed_addr #4

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local void @cilk_fft(i32 noundef %n, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out) local_unnamed_addr #5 {
entry:
  %factors = alloca [40 x i32], align 16
  %syncreg = tail call token @llvm.syncregion.start()
  %0 = bitcast [40 x i32]* %factors to i8*
  call void @llvm.lifetime.start.p0i8(i64 160, i8* nonnull %0) #16
  %arraydecay = getelementptr inbounds [40 x i32], [40 x i32]* %factors, i64 0, i64 0
  %add = add nsw i32 %n, 1
  %conv = sext i32 %add to i64
  %mul = shl nsw i64 %conv, 3
  %call = tail call noalias i8* @malloc(i64 noundef %mul) #16
  %1 = bitcast i8* %call to %struct.COMPLEX*
  detach within %syncreg, label %det.achd, label %do.body.preheader

det.achd:                                         ; preds = %entry
  %div = sdiv i32 %n, 2
  tail call fastcc void @compute_w_coefficients(i32 noundef %n, i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %1)
  reattach within %syncreg, label %do.body.preheader

do.body.preheader:                                ; preds = %det.achd, %entry
  br label %do.body

do.body:                                          ; preds = %do.body.preheader, %factor.exit
  %l.0 = phi i32 [ %div2, %factor.exit ], [ %n, %do.body.preheader ]
  %p.0 = phi i32* [ %incdec.ptr, %factor.exit ], [ %arraydecay, %do.body.preheader ]
  %cmp.i = icmp slt i32 %l.0, 2
  br i1 %cmp.i, label %factor.exit, label %if.end.i

if.end.i:                                         ; preds = %do.body
  switch i32 %l.0, label %if.end12.i [
    i32 4096, label %factor.exit
    i32 2048, label %factor.exit
    i32 1024, label %factor.exit
    i32 256, label %factor.exit
    i32 128, label %factor.exit
    i32 64, label %factor.exit
  ]

if.end12.i:                                       ; preds = %if.end.i
  %and.i = and i32 %l.0, 15
  %cmp13.i = icmp eq i32 %and.i, 0
  br i1 %cmp13.i, label %factor.exit, label %if.end15.i

if.end15.i:                                       ; preds = %if.end12.i
  %and16.i = and i32 %l.0, 7
  %cmp17.i = icmp eq i32 %and16.i, 0
  br i1 %cmp17.i, label %factor.exit, label %if.end19.i

if.end19.i:                                       ; preds = %if.end15.i
  %and20.i = and i32 %l.0, 3
  %cmp21.i = icmp eq i32 %and20.i, 0
  br i1 %cmp21.i, label %factor.exit, label %if.end23.i

if.end23.i:                                       ; preds = %if.end19.i
  %and24.i = and i32 %l.0, 1
  %cmp25.i = icmp eq i32 %and24.i, 0
  br i1 %cmp25.i, label %factor.exit, label %for.cond.preheader.i

for.cond.preheader.i:                             ; preds = %if.end23.i
  %cmp2853.i = icmp ugt i32 %l.0, 3
  br i1 %cmp2853.i, label %for.body.i, label %factor.exit

for.body.i:                                       ; preds = %for.cond.preheader.i, %for.inc.i
  %r.054.i = phi i32 [ %add.i, %for.inc.i ], [ 3, %for.cond.preheader.i ]
  %rem.i = srem i32 %l.0, %r.054.i
  %cmp29.i = icmp eq i32 %rem.i, 0
  br i1 %cmp29.i, label %factor.exit, label %for.inc.i

for.inc.i:                                        ; preds = %for.body.i
  %add.i = add nuw nsw i32 %r.054.i, 2
  %cmp28.i = icmp slt i32 %add.i, %l.0
  br i1 %cmp28.i, label %for.body.i, label %factor.exit, !llvm.loop !13

factor.exit:                                      ; preds = %for.body.i, %for.inc.i, %do.body, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end12.i, %if.end15.i, %if.end19.i, %if.end23.i, %for.cond.preheader.i
  %retval.0.i = phi i32 [ 1, %do.body ], [ 8, %if.end.i ], [ 8, %if.end.i ], [ 8, %if.end.i ], [ 8, %if.end.i ], [ 8, %if.end.i ], [ 8, %if.end.i ], [ 16, %if.end12.i ], [ 8, %if.end15.i ], [ 4, %if.end19.i ], [ 2, %if.end23.i ], [ %l.0, %for.cond.preheader.i ], [ %r.054.i, %for.body.i ], [ %l.0, %for.inc.i ]
  %incdec.ptr = getelementptr inbounds i32, i32* %p.0, i64 1
  store i32 %retval.0.i, i32* %p.0, align 4, !tbaa !15
  %div2 = sdiv i32 %l.0, %retval.0.i
  %cmp = icmp sgt i32 %div2, 1
  br i1 %cmp, label %do.body, label %do.end, !llvm.loop !17

do.end:                                           ; preds = %factor.exit
  sync within %syncreg, label %sync.continue

sync.continue:                                    ; preds = %do.end
  call fastcc void @fft_aux(i32 noundef %n, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32* noundef nonnull %arraydecay, %struct.COMPLEX* noundef %1, i32 noundef %n)
  tail call void @free(i8* noundef %call) #16
  call void @llvm.lifetime.end.p0i8(i64 160, i8* nonnull %0) #16
  ret void
}

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #6

; Function Attrs: nounwind uwtable writeonly
define internal fastcc void @compute_w_coefficients(i32 noundef %n, i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %W) unnamed_addr #7 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub54 = sub nsw i32 %b, %a
  %cmp55 = icmp slt i32 %sub54, 128
  br i1 %cmp55, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %add20, %det.cont ]
  %conv = sitofp i32 %n to double
  %div = fdiv double 0x401921FB54442D18, %conv
  %cmp1.not57 = icmp sgt i32 %a.tr.lcssa, %b
  br i1 %cmp1.not57, label %cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %if.then
  %0 = sext i32 %a.tr.lcssa to i64
  %1 = sext i32 %n to i64
  %2 = add i32 %b, 1
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %3 = trunc i64 %indvars.iv to i32
  %conv3 = sitofp i32 %3 to double
  %mul = fmul double %div, %conv3
  %call = tail call double @cos(double noundef %mul) #16
  %conv4 = fptrunc double %call to float
  %4 = sub nsw i64 %1, %indvars.iv
  %re = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %4, i32 0
  store float %conv4, float* %re, align 4, !tbaa !18
  %re8 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 0
  store float %conv4, float* %re8, align 4, !tbaa !18
  %call11 = tail call double @sin(double noundef %mul) #16
  %conv12 = fptrunc double %call11 to float
  %fneg = fneg float %conv12
  %im = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 1
  store float %fneg, float* %im, align 4, !tbaa !21
  %im18 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %4, i32 1
  store float %conv12, float* %im18, align 4, !tbaa !21
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond.not = icmp eq i32 %2, %lftr.wideiv
  br i1 %exitcond.not, label %cleanup, label %for.body, !llvm.loop !22

if.end:                                           ; preds = %entry, %det.cont
  %a.tr56 = phi i32 [ %add20, %det.cont ], [ %a, %entry ]
  %add = add nsw i32 %a.tr56, %b
  %div19 = sdiv i32 %add, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @compute_w_coefficients(i32 noundef %n, i32 noundef %a.tr56, i32 noundef %div19, %struct.COMPLEX* noundef %W)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %add20 = add nsw i32 %div19, 1
  %sub = sub nsw i32 %b, %add20
  %cmp = icmp slt i32 %sub, 128
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !23

cleanup:                                          ; preds = %for.body, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_aux(i32 noundef %n, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32* nocapture noundef readonly %factors, %struct.COMPLEX* noundef %W, i32 noundef %nW) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  switch i32 %n, label %if.end12 [
    i32 32, label %if.then
    i32 16, label %if.then2
    i32 8, label %if.then5
    i32 4, label %if.then8
    i32 2, label %if.then11
  ]

if.then:                                          ; preds = %entry
  %0 = bitcast %struct.COMPLEX* %in to <2 x float>*
  %1 = load <2 x float>, <2 x float>* %0, align 4, !tbaa !25
  %shuffle = shufflevector <2 x float> %1, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %re3.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 16, i32 0
  %2 = bitcast float* %re3.i to <2 x float>*
  %3 = load <2 x float>, <2 x float>* %2, align 4, !tbaa !25
  %shuffle458 = shufflevector <2 x float> %3, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %4 = fadd <4 x float> %shuffle, %shuffle458
  %5 = fsub <4 x float> %shuffle, %shuffle458
  %6 = shufflevector <4 x float> %4, <4 x float> %5, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %re9.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 8, i32 0
  %7 = bitcast float* %re9.i to <2 x float>*
  %8 = load <2 x float>, <2 x float>* %7, align 4, !tbaa !25
  %shuffle459 = shufflevector <2 x float> %8, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %re13.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 24, i32 0
  %9 = bitcast float* %re13.i to <2 x float>*
  %10 = load <2 x float>, <2 x float>* %9, align 4, !tbaa !25
  %shuffle460 = shufflevector <2 x float> %10, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %11 = fadd <4 x float> %shuffle459, %shuffle460
  %12 = fsub <4 x float> %shuffle459, %shuffle460
  %13 = shufflevector <4 x float> %11, <4 x float> %12, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %14 = fadd <4 x float> %6, %13
  %15 = fsub <4 x float> %6, %13
  %16 = shufflevector <4 x float> %14, <4 x float> %15, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %17 = shufflevector <4 x float> %15, <4 x float> %14, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %re29.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 4, i32 0
  %18 = bitcast float* %re29.i to <2 x float>*
  %19 = load <2 x float>, <2 x float>* %18, align 4, !tbaa !25
  %re33.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 20, i32 0
  %20 = bitcast float* %re33.i to <2 x float>*
  %21 = load <2 x float>, <2 x float>* %20, align 4, !tbaa !25
  %22 = fadd <2 x float> %19, %21
  %23 = fsub <2 x float> %19, %21
  %sub38.i = extractelement <2 x float> %23, i64 0
  %sub39.i = extractelement <2 x float> %23, i64 1
  %re41.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 12, i32 0
  %24 = bitcast float* %re41.i to <2 x float>*
  %25 = load <2 x float>, <2 x float>* %24, align 4, !tbaa !25
  %re45.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 28, i32 0
  %26 = bitcast float* %re45.i to <2 x float>*
  %27 = load <2 x float>, <2 x float>* %26, align 4, !tbaa !25
  %28 = fadd <2 x float> %25, %27
  %29 = fsub <2 x float> %25, %27
  %sub50.i = extractelement <2 x float> %29, i64 0
  %sub51.i = extractelement <2 x float> %29, i64 1
  %30 = fadd <2 x float> %22, %28
  %31 = fsub <2 x float> %22, %28
  %add56.i = fadd float %sub38.i, %sub51.i
  %sub57.i = fsub float %sub39.i, %sub50.i
  %sub58.i = fsub float %sub38.i, %sub51.i
  %add59.i = fadd float %sub39.i, %sub50.i
  %32 = insertelement <2 x float> poison, float %sub57.i, i64 0
  %33 = shufflevector <2 x float> %32, <2 x float> poison, <2 x i32> zeroinitializer
  %34 = insertelement <2 x float> poison, float %add56.i, i64 0
  %35 = shufflevector <2 x float> %34, <2 x float> poison, <2 x i32> zeroinitializer
  %36 = fadd <2 x float> %33, %35
  %37 = fsub <2 x float> %33, %35
  %38 = shufflevector <2 x float> %36, <2 x float> %37, <2 x i32> <i32 0, i32 3>
  %39 = fpext <2 x float> %38 to <2 x double>
  %40 = fmul <2 x double> %39, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %41 = fptrunc <2 x double> %40 to <2 x float>
  %42 = shufflevector <2 x float> %30, <2 x float> %41, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %43 = fadd <4 x float> %16, %42
  %44 = shufflevector <2 x float> %30, <2 x float> %41, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %45 = fsub <4 x float> %16, %44
  %46 = insertelement <2 x float> poison, float %add59.i, i64 0
  %47 = shufflevector <2 x float> %46, <2 x float> poison, <2 x i32> zeroinitializer
  %48 = insertelement <2 x float> poison, float %sub58.i, i64 0
  %49 = shufflevector <2 x float> %48, <2 x float> poison, <2 x i32> zeroinitializer
  %50 = fsub <2 x float> %47, %49
  %51 = fadd <2 x float> %47, %49
  %52 = shufflevector <2 x float> %50, <2 x float> %51, <2 x i32> <i32 0, i32 3>
  %53 = fpext <2 x float> %52 to <2 x double>
  %54 = fmul <2 x double> %53, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %55 = fptrunc <2 x double> %54 to <2 x float>
  %56 = shufflevector <2 x float> %31, <2 x float> %55, <4 x i32> <i32 1, i32 0, i32 2, i32 3>
  %57 = fadd <4 x float> %17, %56
  %58 = fsub <4 x float> %17, %56
  %59 = shufflevector <4 x float> %57, <4 x float> %58, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %60 = shufflevector <2 x float> %31, <2 x float> poison, <4 x i32> <i32 1, i32 0, i32 undef, i32 undef>
  %61 = shufflevector <2 x float> %55, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %62 = shufflevector <4 x float> %60, <4 x float> %61, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %63 = fsub <4 x float> %17, %62
  %64 = fadd <4 x float> %17, %62
  %65 = shufflevector <4 x float> %63, <4 x float> %64, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %re91.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 2, i32 0
  %66 = bitcast float* %re91.i to <2 x float>*
  %67 = load <2 x float>, <2 x float>* %66, align 4, !tbaa !25
  %re95.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 18, i32 0
  %68 = bitcast float* %re95.i to <2 x float>*
  %69 = load <2 x float>, <2 x float>* %68, align 4, !tbaa !25
  %70 = fadd <2 x float> %67, %69
  %71 = fsub <2 x float> %67, %69
  %shuffle467 = shufflevector <2 x float> %71, <2 x float> poison, <2 x i32> <i32 1, i32 0>
  %re103.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 10, i32 0
  %72 = bitcast float* %re103.i to <2 x float>*
  %73 = load <2 x float>, <2 x float>* %72, align 4, !tbaa !25
  %re107.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 26, i32 0
  %74 = bitcast float* %re107.i to <2 x float>*
  %75 = load <2 x float>, <2 x float>* %74, align 4, !tbaa !25
  %76 = fadd <2 x float> %73, %75
  %77 = fsub <2 x float> %73, %75
  %78 = fadd <2 x float> %70, %76
  %79 = fsub <2 x float> %70, %76
  %sub116.i = extractelement <2 x float> %79, i64 0
  %sub117.i = extractelement <2 x float> %79, i64 1
  %80 = fsub <2 x float> %shuffle467, %77
  %81 = fadd <2 x float> %shuffle467, %77
  %82 = shufflevector <2 x float> %80, <2 x float> %81, <2 x i32> <i32 0, i32 3>
  %83 = shufflevector <2 x float> %81, <2 x float> %80, <2 x i32> <i32 0, i32 3>
  %re123.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 6, i32 0
  %84 = bitcast float* %re123.i to <2 x float>*
  %85 = load <2 x float>, <2 x float>* %84, align 4, !tbaa !25
  %re127.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 22, i32 0
  %86 = bitcast float* %re127.i to <2 x float>*
  %87 = load <2 x float>, <2 x float>* %86, align 4, !tbaa !25
  %88 = fadd <2 x float> %85, %87
  %89 = fsub <2 x float> %85, %87
  %sub132.i = extractelement <2 x float> %89, i64 0
  %sub133.i = extractelement <2 x float> %89, i64 1
  %re135.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 14, i32 0
  %90 = bitcast float* %re135.i to <2 x float>*
  %91 = load <2 x float>, <2 x float>* %90, align 4, !tbaa !25
  %re139.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 30, i32 0
  %92 = bitcast float* %re139.i to <2 x float>*
  %93 = load <2 x float>, <2 x float>* %92, align 4, !tbaa !25
  %94 = fadd <2 x float> %91, %93
  %95 = fsub <2 x float> %91, %93
  %sub144.i = extractelement <2 x float> %95, i64 0
  %sub145.i = extractelement <2 x float> %95, i64 1
  %96 = fadd <2 x float> %88, %94
  %97 = fsub <2 x float> %88, %94
  %sub148.i = extractelement <2 x float> %97, i64 0
  %sub149.i = extractelement <2 x float> %97, i64 1
  %add150.i = fadd float %sub132.i, %sub145.i
  %sub151.i = fsub float %sub133.i, %sub144.i
  %sub152.i = fsub float %sub132.i, %sub145.i
  %add153.i = fadd float %sub133.i, %sub144.i
  %98 = fadd <2 x float> %78, %96
  %99 = fsub <2 x float> %78, %96
  %100 = insertelement <2 x float> poison, float %sub151.i, i64 0
  %101 = shufflevector <2 x float> %100, <2 x float> poison, <2 x i32> zeroinitializer
  %102 = insertelement <2 x float> poison, float %add150.i, i64 0
  %103 = shufflevector <2 x float> %102, <2 x float> poison, <2 x i32> zeroinitializer
  %104 = fsub <2 x float> %101, %103
  %105 = fadd <2 x float> %101, %103
  %106 = shufflevector <2 x float> %104, <2 x float> %105, <2 x i32> <i32 0, i32 3>
  %107 = fpext <2 x float> %106 to <2 x double>
  %108 = fmul <2 x double> %107, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %109 = fptrunc <2 x double> %108 to <2 x float>
  %110 = fadd <2 x float> %82, %109
  %111 = fsub <2 x float> %82, %109
  %add170.i = fadd float %sub116.i, %sub149.i
  %sub171.i = fsub float %sub117.i, %sub148.i
  %sub172.i = fsub float %sub116.i, %sub149.i
  %add173.i = fadd float %sub117.i, %sub148.i
  %112 = insertelement <2 x float> poison, float %add153.i, i64 0
  %113 = shufflevector <2 x float> %112, <2 x float> poison, <2 x i32> zeroinitializer
  %114 = insertelement <2 x float> poison, float %sub152.i, i64 0
  %115 = shufflevector <2 x float> %114, <2 x float> poison, <2 x i32> zeroinitializer
  %116 = fadd <2 x float> %113, %115
  %117 = fsub <2 x float> %113, %115
  %118 = shufflevector <2 x float> %116, <2 x float> %117, <2 x i32> <i32 0, i32 3>
  %119 = fpext <2 x float> %118 to <2 x double>
  %120 = fmul <2 x double> %119, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %121 = fptrunc <2 x double> %120 to <2 x float>
  %122 = fadd <2 x float> %83, %121
  %123 = fsub <2 x float> %83, %121
  %124 = shufflevector <2 x float> %122, <2 x float> %123, <2 x i32> <i32 1, i32 2>
  %125 = shufflevector <2 x float> %122, <2 x float> %123, <2 x i32> <i32 0, i32 3>
  %126 = fpext <2 x float> %110 to <2 x double>
  %127 = fmul <2 x double> %126, <double 0x3FD87DE2A6AEA312, double 0xBFD87DE2A6AEA312>
  %128 = shufflevector <2 x double> %127, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %129 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %126, <2 x double> <double 0x3FED906BCF32832F, double 0x3FED906BCF32832F>, <2 x double> %128)
  %130 = fptrunc <2 x double> %129 to <2 x float>
  %131 = shufflevector <2 x float> %98, <2 x float> %130, <4 x i32> <i32 0, i32 1, i32 3, i32 2>
  %132 = fadd <4 x float> %43, %131
  %133 = shufflevector <2 x float> %98, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %134 = shufflevector <2 x float> %130, <2 x float> poison, <4 x i32> <i32 1, i32 0, i32 undef, i32 undef>
  %135 = shufflevector <4 x float> %133, <4 x float> %134, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %136 = fsub <4 x float> %43, %135
  %137 = insertelement <2 x float> poison, float %sub171.i, i64 0
  %138 = shufflevector <2 x float> %137, <2 x float> poison, <2 x i32> zeroinitializer
  %139 = insertelement <2 x float> poison, float %add170.i, i64 0
  %140 = shufflevector <2 x float> %139, <2 x float> poison, <2 x i32> zeroinitializer
  %141 = fadd <2 x float> %138, %140
  %142 = fsub <2 x float> %138, %140
  %143 = shufflevector <2 x float> %141, <2 x float> %142, <2 x i32> <i32 0, i32 3>
  %144 = fpext <2 x float> %143 to <2 x double>
  %145 = fmul <2 x double> %144, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %146 = fpext <2 x float> %124 to <2 x double>
  %147 = fmul <2 x double> %146, <double 0xBFED906BCF32832F, double 0x3FED906BCF32832F>
  %148 = shufflevector <2 x double> %147, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %149 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %146, <2 x double> <double 0x3FD87DE2A6AEA312, double 0x3FD87DE2A6AEA312>, <2 x double> %148)
  %150 = shufflevector <2 x double> %145, <2 x double> %149, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %151 = fptrunc <4 x double> %150 to <4 x float>
  %152 = fadd <4 x float> %59, %151
  %153 = fsub <4 x float> %59, %151
  %154 = extractelement <4 x float> %45, i64 0
  %155 = extractelement <2 x float> %99, i64 1
  %sub233.i = fsub float %154, %155
  %156 = extractelement <4 x float> %45, i64 1
  %157 = extractelement <2 x float> %99, i64 0
  %add234.i = fadd float %156, %157
  %158 = fpext <2 x float> %111 to <2 x double>
  %159 = fmul <2 x double> %158, <double 0x3FD87DE2A6AEA312, double 0xBFD87DE2A6AEA312>
  %160 = shufflevector <2 x double> %159, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %161 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %158, <2 x double> <double 0x3FED906BCF32832F, double 0x3FED906BCF32832F>, <2 x double> %160)
  %162 = fptrunc <2 x double> %161 to <2 x float>
  %163 = shufflevector <2 x float> %99, <2 x float> poison, <4 x i32> <i32 1, i32 0, i32 undef, i32 undef>
  %164 = shufflevector <2 x float> %162, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %165 = shufflevector <4 x float> %163, <4 x float> %164, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %166 = fadd <4 x float> %45, %165
  %167 = fsub <4 x float> %45, %165
  %168 = shufflevector <4 x float> %166, <4 x float> %167, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %169 = insertelement <2 x float> poison, float %add173.i, i64 0
  %170 = shufflevector <2 x float> %169, <2 x float> poison, <2 x i32> zeroinitializer
  %171 = insertelement <2 x float> poison, float %sub172.i, i64 0
  %172 = shufflevector <2 x float> %171, <2 x float> poison, <2 x i32> zeroinitializer
  %173 = fsub <2 x float> %170, %172
  %174 = fadd <2 x float> %170, %172
  %175 = shufflevector <2 x float> %173, <2 x float> %174, <2 x i32> <i32 0, i32 3>
  %176 = fpext <2 x float> %175 to <2 x double>
  %177 = fmul <2 x double> %176, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %178 = fpext <2 x float> %125 to <2 x double>
  %179 = fmul <2 x double> %178, <double 0x3FED906BCF32832F, double 0xBFED906BCF32832F>
  %180 = shufflevector <2 x double> %179, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %181 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %178, <2 x double> <double 0x3FD87DE2A6AEA312, double 0x3FD87DE2A6AEA312>, <2 x double> %180)
  %182 = shufflevector <2 x double> %177, <2 x double> %181, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %183 = fptrunc <4 x double> %182 to <4 x float>
  %184 = shufflevector <4 x float> %45, <4 x float> %63, <4 x i32> <i32 2, i32 3, i32 4, i32 undef>
  %185 = shufflevector <4 x float> %184, <4 x float> %64, <4 x i32> <i32 0, i32 1, i32 2, i32 5>
  %186 = shufflevector <4 x float> %164, <4 x float> %183, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %187 = fsub <4 x float> %185, %186
  %188 = fadd <4 x float> %185, %186
  %189 = shufflevector <4 x float> %187, <4 x float> %188, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %190 = fadd <4 x float> %65, %183
  %191 = fsub <4 x float> %65, %183
  %192 = shufflevector <4 x float> %190, <4 x float> %191, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %sub275.i = extractelement <4 x float> %191, i64 2
  %add276.i = extractelement <4 x float> %190, i64 3
  %re278.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 1, i32 0
  %193 = bitcast float* %re278.i to <2 x float>*
  %194 = load <2 x float>, <2 x float>* %193, align 4, !tbaa !25
  %shuffle461 = shufflevector <2 x float> %194, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %re282.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 17, i32 0
  %195 = bitcast float* %re282.i to <2 x float>*
  %196 = load <2 x float>, <2 x float>* %195, align 4, !tbaa !25
  %shuffle462 = shufflevector <2 x float> %196, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %197 = fadd <4 x float> %shuffle461, %shuffle462
  %198 = fsub <4 x float> %shuffle461, %shuffle462
  %199 = shufflevector <4 x float> %197, <4 x float> %198, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %re290.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 9, i32 0
  %200 = bitcast float* %re290.i to <2 x float>*
  %201 = load <2 x float>, <2 x float>* %200, align 4, !tbaa !25
  %shuffle463 = shufflevector <2 x float> %201, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %re294.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 25, i32 0
  %202 = bitcast float* %re294.i to <2 x float>*
  %203 = load <2 x float>, <2 x float>* %202, align 4, !tbaa !25
  %shuffle464 = shufflevector <2 x float> %203, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %204 = fadd <4 x float> %shuffle463, %shuffle464
  %205 = fsub <4 x float> %shuffle463, %shuffle464
  %206 = shufflevector <4 x float> %204, <4 x float> %205, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %207 = fadd <4 x float> %197, %204
  %208 = shufflevector <4 x float> %207, <4 x float> poison, <2 x i32> <i32 0, i32 1>
  %209 = shufflevector <4 x float> %198, <4 x float> undef, <2 x i32> <i32 3, i32 2>
  %210 = shufflevector <4 x float> %205, <4 x float> undef, <2 x i32> <i32 3, i32 2>
  %211 = fsub <2 x float> %209, %210
  %212 = fadd <2 x float> %209, %210
  %213 = shufflevector <2 x float> %211, <2 x float> %212, <2 x i32> <i32 0, i32 3>
  %214 = fsub <4 x float> %199, %206
  %215 = fadd <4 x float> %199, %206
  %216 = shufflevector <4 x float> %214, <4 x float> %215, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %re310.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 5, i32 0
  %217 = bitcast float* %re310.i to <2 x float>*
  %218 = load <2 x float>, <2 x float>* %217, align 4, !tbaa !25
  %re314.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 21, i32 0
  %219 = bitcast float* %re314.i to <2 x float>*
  %220 = load <2 x float>, <2 x float>* %219, align 4, !tbaa !25
  %221 = fadd <2 x float> %218, %220
  %222 = fsub <2 x float> %218, %220
  %sub319.i = extractelement <2 x float> %222, i64 0
  %sub320.i = extractelement <2 x float> %222, i64 1
  %re322.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 13, i32 0
  %223 = bitcast float* %re322.i to <2 x float>*
  %224 = load <2 x float>, <2 x float>* %223, align 4, !tbaa !25
  %re326.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 29, i32 0
  %225 = bitcast float* %re326.i to <2 x float>*
  %226 = load <2 x float>, <2 x float>* %225, align 4, !tbaa !25
  %227 = fadd <2 x float> %224, %226
  %228 = fsub <2 x float> %224, %226
  %sub331.i = extractelement <2 x float> %228, i64 0
  %sub332.i = extractelement <2 x float> %228, i64 1
  %229 = fadd <2 x float> %221, %227
  %230 = fsub <2 x float> %221, %227
  %add337.i = fadd float %sub319.i, %sub332.i
  %sub338.i = fsub float %sub320.i, %sub331.i
  %sub339.i = fsub float %sub319.i, %sub332.i
  %add340.i = fadd float %sub320.i, %sub331.i
  %231 = fadd <2 x float> %208, %229
  %232 = fsub <2 x float> %208, %229
  %sub343.i = extractelement <2 x float> %232, i64 0
  %sub344.i = extractelement <2 x float> %232, i64 1
  %233 = insertelement <2 x float> poison, float %sub338.i, i64 0
  %234 = shufflevector <2 x float> %233, <2 x float> poison, <2 x i32> zeroinitializer
  %235 = insertelement <2 x float> poison, float %add337.i, i64 0
  %236 = shufflevector <2 x float> %235, <2 x float> poison, <2 x i32> zeroinitializer
  %237 = fsub <2 x float> %234, %236
  %238 = fadd <2 x float> %234, %236
  %239 = shufflevector <2 x float> %237, <2 x float> %238, <2 x i32> <i32 0, i32 3>
  %240 = fpext <2 x float> %239 to <2 x double>
  %241 = fmul <2 x double> %240, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %242 = fptrunc <2 x double> %241 to <2 x float>
  %243 = fadd <2 x float> %213, %242
  %shuffle468 = shufflevector <2 x float> %243, <2 x float> poison, <2 x i32> <i32 1, i32 0>
  %244 = fsub <2 x float> %213, %242
  %245 = insertelement <2 x float> poison, float %add340.i, i64 0
  %246 = shufflevector <2 x float> %245, <2 x float> poison, <2 x i32> zeroinitializer
  %247 = insertelement <2 x float> poison, float %sub339.i, i64 0
  %248 = shufflevector <2 x float> %247, <2 x float> poison, <2 x i32> zeroinitializer
  %249 = fsub <2 x float> %246, %248
  %250 = fadd <2 x float> %246, %248
  %251 = shufflevector <2 x float> %249, <2 x float> %250, <2 x i32> <i32 0, i32 3>
  %252 = fpext <2 x float> %251 to <2 x double>
  %253 = fmul <2 x double> %252, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %254 = fptrunc <2 x double> %253 to <2 x float>
  %255 = shufflevector <2 x float> %230, <2 x float> %254, <4 x i32> <i32 1, i32 0, i32 2, i32 3>
  %256 = fadd <4 x float> %216, %255
  %257 = fsub <4 x float> %216, %255
  %258 = shufflevector <4 x float> %256, <4 x float> %257, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %259 = shufflevector <2 x float> %230, <2 x float> poison, <4 x i32> <i32 1, i32 0, i32 undef, i32 undef>
  %260 = shufflevector <2 x float> %254, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %261 = shufflevector <4 x float> %259, <4 x float> %260, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %262 = fsub <4 x float> %216, %261
  %263 = fadd <4 x float> %216, %261
  %264 = shufflevector <4 x float> %262, <4 x float> %263, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %re374.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 3, i32 0
  %265 = bitcast float* %re374.i to <2 x float>*
  %266 = load <2 x float>, <2 x float>* %265, align 4, !tbaa !25
  %re378.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 19, i32 0
  %267 = bitcast float* %re378.i to <2 x float>*
  %268 = load <2 x float>, <2 x float>* %267, align 4, !tbaa !25
  %269 = fadd <2 x float> %266, %268
  %270 = fsub <2 x float> %266, %268
  %re386.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 11, i32 0
  %271 = bitcast float* %re386.i to <2 x float>*
  %272 = load <2 x float>, <2 x float>* %271, align 4, !tbaa !25
  %re390.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 27, i32 0
  %273 = bitcast float* %re390.i to <2 x float>*
  %274 = load <2 x float>, <2 x float>* %273, align 4, !tbaa !25
  %275 = fadd <2 x float> %272, %274
  %276 = fsub <2 x float> %272, %274
  %shuffle466 = shufflevector <2 x float> %276, <2 x float> poison, <2 x i32> <i32 1, i32 0>
  %277 = fadd <2 x float> %269, %275
  %278 = fsub <2 x float> %269, %275
  %sub399.i = extractelement <2 x float> %278, i64 0
  %sub400.i = extractelement <2 x float> %278, i64 1
  %279 = fadd <2 x float> %270, %shuffle466
  %280 = fsub <2 x float> %270, %shuffle466
  %281 = shufflevector <2 x float> %279, <2 x float> %280, <2 x i32> <i32 0, i32 3>
  %282 = shufflevector <2 x float> %279, <2 x float> %280, <2 x i32> <i32 1, i32 2>
  %re406.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 7, i32 0
  %283 = bitcast float* %re406.i to <2 x float>*
  %284 = load <2 x float>, <2 x float>* %283, align 4, !tbaa !25
  %re410.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 23, i32 0
  %285 = bitcast float* %re410.i to <2 x float>*
  %286 = load <2 x float>, <2 x float>* %285, align 4, !tbaa !25
  %287 = fadd <2 x float> %284, %286
  %288 = fsub <2 x float> %284, %286
  %sub415.i = extractelement <2 x float> %288, i64 0
  %sub416.i = extractelement <2 x float> %288, i64 1
  %re418.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 15, i32 0
  %289 = bitcast float* %re418.i to <2 x float>*
  %290 = load <2 x float>, <2 x float>* %289, align 4, !tbaa !25
  %re422.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 31, i32 0
  %291 = bitcast float* %re422.i to <2 x float>*
  %292 = load <2 x float>, <2 x float>* %291, align 4, !tbaa !25
  %293 = fadd <2 x float> %290, %292
  %294 = fsub <2 x float> %290, %292
  %sub427.i = extractelement <2 x float> %294, i64 0
  %sub428.i = extractelement <2 x float> %294, i64 1
  %295 = fadd <2 x float> %287, %293
  %296 = fsub <2 x float> %287, %293
  %sub431.i = extractelement <2 x float> %296, i64 0
  %sub432.i = extractelement <2 x float> %296, i64 1
  %add433.i = fadd float %sub415.i, %sub428.i
  %sub434.i = fsub float %sub416.i, %sub427.i
  %sub435.i = fsub float %sub415.i, %sub428.i
  %add436.i = fadd float %sub416.i, %sub427.i
  %297 = fadd <2 x float> %277, %295
  %298 = fsub <2 x float> %277, %295
  %sub439.i = extractelement <2 x float> %298, i64 0
  %sub440.i = extractelement <2 x float> %298, i64 1
  %299 = insertelement <2 x float> poison, float %sub434.i, i64 0
  %300 = shufflevector <2 x float> %299, <2 x float> poison, <2 x i32> zeroinitializer
  %301 = insertelement <2 x float> poison, float %add433.i, i64 0
  %302 = shufflevector <2 x float> %301, <2 x float> poison, <2 x i32> zeroinitializer
  %303 = fadd <2 x float> %300, %302
  %304 = fsub <2 x float> %300, %302
  %305 = shufflevector <2 x float> %303, <2 x float> %304, <2 x i32> <i32 0, i32 3>
  %306 = fpext <2 x float> %305 to <2 x double>
  %307 = fmul <2 x double> %306, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %308 = fptrunc <2 x double> %307 to <2 x float>
  %309 = fadd <2 x float> %281, %308
  %310 = fsub <2 x float> %281, %308
  %add453.i = fadd float %sub399.i, %sub432.i
  %sub454.i = fsub float %sub400.i, %sub431.i
  %sub455.i = fsub float %sub399.i, %sub432.i
  %add456.i = fadd float %sub400.i, %sub431.i
  %311 = insertelement <2 x float> poison, float %add436.i, i64 0
  %312 = shufflevector <2 x float> %311, <2 x float> poison, <2 x i32> zeroinitializer
  %313 = insertelement <2 x float> poison, float %sub435.i, i64 0
  %314 = shufflevector <2 x float> %313, <2 x float> poison, <2 x i32> zeroinitializer
  %315 = fadd <2 x float> %312, %314
  %316 = fsub <2 x float> %312, %314
  %317 = shufflevector <2 x float> %315, <2 x float> %316, <2 x i32> <i32 0, i32 3>
  %318 = fpext <2 x float> %317 to <2 x double>
  %319 = fmul <2 x double> %318, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %320 = fptrunc <2 x double> %319 to <2 x float>
  %321 = fadd <2 x float> %282, %320
  %322 = fsub <2 x float> %282, %320
  %323 = shufflevector <2 x float> %321, <2 x float> %322, <2 x i32> <i32 1, i32 2>
  %324 = shufflevector <2 x float> %321, <2 x float> %322, <2 x i32> <i32 0, i32 3>
  %325 = fadd <2 x float> %231, %297
  %326 = fsub <2 x float> %231, %297
  %327 = fpext <2 x float> %309 to <2 x double>
  %328 = fmul <2 x double> %327, <double 0xBFD87DE2A6AEA312, double 0x3FD87DE2A6AEA312>
  %329 = shufflevector <2 x double> %328, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %330 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %327, <2 x double> <double 0x3FED906BCF32832F, double 0x3FED906BCF32832F>, <2 x double> %329)
  %331 = fptrunc <2 x double> %330 to <2 x float>
  %332 = fadd <2 x float> %shuffle468, %331
  %333 = fsub <2 x float> %shuffle468, %331
  %334 = insertelement <2 x float> poison, float %sub454.i, i64 0
  %335 = shufflevector <2 x float> %334, <2 x float> poison, <2 x i32> zeroinitializer
  %336 = insertelement <2 x float> poison, float %add453.i, i64 0
  %337 = shufflevector <2 x float> %336, <2 x float> poison, <2 x i32> zeroinitializer
  %338 = fadd <2 x float> %335, %337
  %339 = fsub <2 x float> %335, %337
  %340 = shufflevector <2 x float> %338, <2 x float> %339, <2 x i32> <i32 0, i32 3>
  %341 = fpext <2 x float> %340 to <2 x double>
  %342 = fmul <2 x double> %341, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %343 = fpext <2 x float> %323 to <2 x double>
  %344 = fmul <2 x double> %343, <double 0xBFED906BCF32832F, double 0x3FED906BCF32832F>
  %345 = shufflevector <2 x double> %344, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %346 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %343, <2 x double> <double 0x3FD87DE2A6AEA312, double 0x3FD87DE2A6AEA312>, <2 x double> %345)
  %347 = shufflevector <2 x double> %342, <2 x double> %346, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %348 = fptrunc <4 x double> %347 to <4 x float>
  %349 = fadd <4 x float> %258, %348
  %350 = fsub <4 x float> %258, %348
  %add515.i = fadd float %sub343.i, %sub440.i
  %sub516.i = fsub float %sub344.i, %sub439.i
  %sub517.i = fsub float %sub343.i, %sub440.i
  %add518.i = fadd float %sub344.i, %sub439.i
  %351 = fpext <2 x float> %310 to <2 x double>
  %352 = fmul <2 x double> %351, <double 0xBFD87DE2A6AEA312, double 0x3FD87DE2A6AEA312>
  %353 = shufflevector <2 x double> %352, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %354 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %351, <2 x double> <double 0x3FED906BCF32832F, double 0x3FED906BCF32832F>, <2 x double> %353)
  %355 = fptrunc <2 x double> %354 to <2 x float>
  %356 = fadd <2 x float> %244, %355
  %357 = fsub <2 x float> %244, %355
  %358 = shufflevector <2 x float> %356, <2 x float> %357, <2 x i32> <i32 1, i32 2>
  %359 = insertelement <2 x float> poison, float %add456.i, i64 0
  %360 = shufflevector <2 x float> %359, <2 x float> poison, <2 x i32> zeroinitializer
  %361 = insertelement <2 x float> poison, float %sub455.i, i64 0
  %362 = shufflevector <2 x float> %361, <2 x float> poison, <2 x i32> zeroinitializer
  %363 = fsub <2 x float> %360, %362
  %364 = fadd <2 x float> %360, %362
  %365 = shufflevector <2 x float> %363, <2 x float> %364, <2 x i32> <i32 0, i32 3>
  %366 = fpext <2 x float> %365 to <2 x double>
  %367 = fmul <2 x double> %366, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %368 = fpext <2 x float> %324 to <2 x double>
  %369 = fmul <2 x double> %368, <double 0x3FED906BCF32832F, double 0xBFED906BCF32832F>
  %370 = shufflevector <2 x double> %369, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %371 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %368, <2 x double> <double 0x3FD87DE2A6AEA312, double 0x3FD87DE2A6AEA312>, <2 x double> %370)
  %372 = shufflevector <2 x double> %367, <2 x double> %371, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %373 = fptrunc <4 x double> %372 to <4 x float>
  %374 = shufflevector <2 x float> %244, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %375 = shufflevector <4 x float> %374, <4 x float> %263, <4 x i32> <i32 0, i32 1, i32 5, i32 undef>
  %376 = shufflevector <4 x float> %375, <4 x float> %262, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %377 = shufflevector <2 x float> %355, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %378 = shufflevector <4 x float> %377, <4 x float> %373, <4 x i32> <i32 0, i32 1, i32 5, i32 4>
  %379 = fadd <4 x float> %376, %378
  %380 = fsub <4 x float> %376, %378
  %381 = shufflevector <4 x float> %379, <4 x float> %380, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %382 = fadd <4 x float> %264, %373
  %383 = fsub <4 x float> %264, %373
  %384 = shufflevector <4 x float> %382, <4 x float> %383, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %sub559.i = extractelement <4 x float> %383, i64 2
  %add560.i = extractelement <4 x float> %382, i64 3
  %385 = extractelement <4 x float> %132, i64 0
  %386 = extractelement <2 x float> %325, i64 0
  %sub567.i = fsub float %385, %386
  %re569.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 16, i32 0
  store float %sub567.i, float* %re569.i, align 4, !tbaa !18
  %387 = extractelement <4 x float> %132, i64 1
  %388 = extractelement <2 x float> %325, i64 1
  %sub570.i = fsub float %387, %388
  %im572.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 16, i32 1
  store float %sub570.i, float* %im572.i, align 4, !tbaa !21
  %389 = fpext <2 x float> %332 to <2 x double>
  %390 = fmul <2 x double> %389, <double 0xBFC8F8B83C6993FD, double 0x3FC8F8B83C6993FD>
  %391 = shufflevector <2 x double> %390, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %392 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %389, <2 x double> <double 0x3FEF6297CFF75494, double 0x3FEF6297CFF75494>, <2 x double> %391)
  %393 = fptrunc <2 x double> %392 to <2 x float>
  %394 = shufflevector <2 x float> %325, <2 x float> %393, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %395 = fadd <4 x float> %132, %394
  %396 = bitcast %struct.COMPLEX* %out to <4 x float>*
  store <4 x float> %395, <4 x float>* %396, align 4, !tbaa !25
  %397 = extractelement <4 x float> %132, i64 2
  %398 = extractelement <2 x float> %393, i64 0
  %sub590.i = fsub float %397, %398
  %re592.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 17, i32 0
  store float %sub590.i, float* %re592.i, align 4, !tbaa !18
  %399 = extractelement <4 x float> %132, i64 3
  %400 = extractelement <2 x float> %393, i64 1
  %sub593.i = fsub float %399, %400
  %im595.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 17, i32 1
  store float %sub593.i, float* %im595.i, align 4, !tbaa !21
  %re609.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 2, i32 0
  %401 = fpext <4 x float> %349 to <4 x double>
  %402 = fmul <4 x double> %401, <double 0xBFD87DE2A6AEA312, double 0x3FD87DE2A6AEA312, double 0xBFE1C73B39AE76C7, double 0x3FE1C73B39AE76C7>
  %403 = shufflevector <4 x double> %402, <4 x double> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %404 = call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %401, <4 x double> <double 0x3FED906BCF32832F, double 0x3FED906BCF32832F, double 0x3FEA9B66290EB1A3, double 0x3FEA9B66290EB1A3>, <4 x double> %403)
  %405 = fptrunc <4 x double> %404 to <4 x float>
  %406 = fsub <4 x float> %152, %405
  %sub613.i = extractelement <4 x float> %406, i64 0
  %re615.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 18, i32 0
  store float %sub613.i, float* %re615.i, align 4, !tbaa !18
  %sub616.i = extractelement <4 x float> %406, i64 1
  %im618.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 18, i32 1
  store float %sub616.i, float* %im618.i, align 4, !tbaa !21
  %407 = fadd <4 x float> %152, %405
  %408 = bitcast float* %re609.i to <4 x float>*
  store <4 x float> %407, <4 x float>* %408, align 4, !tbaa !25
  %sub636.i = extractelement <4 x float> %406, i64 2
  %re638.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 19, i32 0
  store float %sub636.i, float* %re638.i, align 4, !tbaa !18
  %sub639.i = extractelement <4 x float> %406, i64 3
  %im641.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 19, i32 1
  store float %sub639.i, float* %im641.i, align 4, !tbaa !21
  %409 = insertelement <2 x float> poison, float %sub516.i, i64 0
  %410 = shufflevector <2 x float> %409, <2 x float> poison, <2 x i32> zeroinitializer
  %411 = insertelement <2 x float> poison, float %add515.i, i64 0
  %412 = shufflevector <2 x float> %411, <2 x float> poison, <2 x i32> zeroinitializer
  %413 = fadd <2 x float> %410, %412
  %414 = fsub <2 x float> %410, %412
  %415 = shufflevector <2 x float> %413, <2 x float> %414, <2 x i32> <i32 0, i32 3>
  %416 = fpext <2 x float> %415 to <2 x double>
  %417 = fmul <2 x double> %416, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %re652.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 4, i32 0
  %418 = fpext <2 x float> %358 to <2 x double>
  %419 = fmul <2 x double> %418, <double 0xBFEA9B66290EB1A3, double 0x3FEA9B66290EB1A3>
  %420 = shufflevector <2 x double> %419, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %421 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %418, <2 x double> <double 0x3FE1C73B39AE76C7, double 0x3FE1C73B39AE76C7>, <2 x double> %420)
  %422 = shufflevector <2 x double> %417, <2 x double> %421, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %423 = fptrunc <4 x double> %422 to <4 x float>
  %424 = fsub <4 x float> %168, %423
  %sub656.i = extractelement <4 x float> %424, i64 0
  %re658.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 20, i32 0
  store float %sub656.i, float* %re658.i, align 4, !tbaa !18
  %sub659.i = extractelement <4 x float> %424, i64 1
  %im661.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 20, i32 1
  store float %sub659.i, float* %im661.i, align 4, !tbaa !21
  %425 = fadd <4 x float> %168, %423
  %426 = bitcast float* %re652.i to <4 x float>*
  store <4 x float> %425, <4 x float>* %426, align 4, !tbaa !25
  %sub679.i = extractelement <4 x float> %424, i64 2
  %re681.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 21, i32 0
  store float %sub679.i, float* %re681.i, align 4, !tbaa !18
  %sub682.i = extractelement <4 x float> %424, i64 3
  %im684.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 21, i32 1
  store float %sub682.i, float* %im684.i, align 4, !tbaa !21
  %re698.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 6, i32 0
  %427 = fpext <4 x float> %384 to <4 x double>
  %428 = fmul <4 x double> %427, <double 0xBFED906BCF32832F, double 0x3FED906BCF32832F, double 0xBFEF6297CFF75494, double 0x3FEF6297CFF75494>
  %429 = shufflevector <4 x double> %428, <4 x double> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %430 = call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %427, <4 x double> <double 0x3FD87DE2A6AEA312, double 0x3FD87DE2A6AEA312, double 0x3FC8F8B83C6993FD, double 0x3FC8F8B83C6993FD>, <4 x double> %429)
  %431 = fptrunc <4 x double> %430 to <4 x float>
  %432 = fsub <4 x float> %192, %431
  %sub702.i = extractelement <4 x float> %432, i64 0
  %re704.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 22, i32 0
  store float %sub702.i, float* %re704.i, align 4, !tbaa !18
  %sub705.i = extractelement <4 x float> %432, i64 1
  %im707.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 22, i32 1
  store float %sub705.i, float* %im707.i, align 4, !tbaa !21
  %433 = fadd <4 x float> %192, %431
  %434 = bitcast float* %re698.i to <4 x float>*
  store <4 x float> %433, <4 x float>* %434, align 4, !tbaa !25
  %sub725.i = extractelement <4 x float> %432, i64 2
  %re727.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 23, i32 0
  store float %sub725.i, float* %re727.i, align 4, !tbaa !18
  %sub728.i = extractelement <4 x float> %432, i64 3
  %im730.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 23, i32 1
  store float %sub728.i, float* %im730.i, align 4, !tbaa !21
  %re733.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 8, i32 0
  %435 = extractelement <4 x float> %136, i64 0
  %436 = extractelement <2 x float> %326, i64 1
  %sub737.i = fsub float %435, %436
  %re739.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 24, i32 0
  store float %sub737.i, float* %re739.i, align 4, !tbaa !18
  %437 = extractelement <4 x float> %136, i64 1
  %438 = extractelement <2 x float> %326, i64 0
  %add740.i = fadd float %437, %438
  %im742.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 24, i32 1
  store float %add740.i, float* %im742.i, align 4, !tbaa !21
  %439 = fpext <2 x float> %333 to <2 x double>
  %440 = fmul <2 x double> %439, <double 0xBFC8F8B83C6993FD, double 0x3FC8F8B83C6993FD>
  %441 = shufflevector <2 x double> %440, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %442 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %439, <2 x double> <double 0x3FEF6297CFF75494, double 0x3FEF6297CFF75494>, <2 x double> %441)
  %443 = fptrunc <2 x double> %442 to <2 x float>
  %444 = shufflevector <2 x float> %326, <2 x float> poison, <4 x i32> <i32 1, i32 0, i32 undef, i32 undef>
  %445 = shufflevector <2 x float> %443, <2 x float> poison, <4 x i32> <i32 1, i32 0, i32 undef, i32 undef>
  %446 = shufflevector <4 x float> %444, <4 x float> %445, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %447 = fadd <4 x float> %136, %446
  %448 = fsub <4 x float> %136, %446
  %449 = shufflevector <4 x float> %447, <4 x float> %448, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %450 = bitcast float* %re733.i to <4 x float>*
  store <4 x float> %449, <4 x float>* %450, align 4, !tbaa !25
  %451 = extractelement <4 x float> %136, i64 2
  %452 = extractelement <2 x float> %443, i64 1
  %sub760.i = fsub float %451, %452
  %re762.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 25, i32 0
  store float %sub760.i, float* %re762.i, align 4, !tbaa !18
  %453 = extractelement <4 x float> %136, i64 3
  %454 = extractelement <2 x float> %443, i64 0
  %add763.i = fadd float %453, %454
  %im765.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 25, i32 1
  store float %add763.i, float* %im765.i, align 4, !tbaa !21
  %re779.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 10, i32 0
  %455 = fpext <4 x float> %350 to <4 x double>
  %shuffle465 = shufflevector <4 x double> %455, <4 x double> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %456 = fmul <4 x double> %455, <double 0xBFD87DE2A6AEA312, double 0x3FD87DE2A6AEA312, double 0xBFE1C73B39AE76C7, double 0x3FE1C73B39AE76C7>
  %457 = call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %shuffle465, <4 x double> <double 0x3FED906BCF32832F, double 0x3FED906BCF32832F, double 0x3FEA9B66290EB1A3, double 0x3FEA9B66290EB1A3>, <4 x double> %456)
  %458 = fptrunc <4 x double> %457 to <4 x float>
  %459 = fsub <4 x float> %153, %458
  %sub783.i = extractelement <4 x float> %459, i64 0
  %re785.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 26, i32 0
  store float %sub783.i, float* %re785.i, align 4, !tbaa !18
  %460 = fadd <4 x float> %153, %458
  %add786.i = extractelement <4 x float> %460, i64 1
  %im788.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 26, i32 1
  store float %add786.i, float* %im788.i, align 4, !tbaa !21
  %461 = shufflevector <4 x float> %460, <4 x float> %459, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %462 = bitcast float* %re779.i to <4 x float>*
  store <4 x float> %461, <4 x float>* %462, align 4, !tbaa !25
  %sub806.i = extractelement <4 x float> %459, i64 2
  %re808.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 27, i32 0
  store float %sub806.i, float* %re808.i, align 4, !tbaa !18
  %add809.i = extractelement <4 x float> %460, i64 3
  %im811.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 27, i32 1
  store float %add809.i, float* %im811.i, align 4, !tbaa !21
  %sub812.i = fsub float %add518.i, %sub517.i
  %conv813.i = fpext float %sub812.i to double
  %mul814.i = fmul double %conv813.i, 0x3FE6A09E667F4BB8
  %conv815.i = fptrunc double %mul814.i to float
  %add816.i = fadd float %add518.i, %sub517.i
  %conv817.i = fpext float %add816.i to double
  %mul818.i = fmul double %conv817.i, 0x3FE6A09E667F4BB8
  %conv819.i = fptrunc double %mul818.i to float
  %add820.i = fadd float %sub233.i, %conv815.i
  %re822.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 12, i32 0
  store float %add820.i, float* %re822.i, align 4, !tbaa !18
  %sub823.i = fsub float %add234.i, %conv819.i
  %im825.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 12, i32 1
  store float %sub823.i, float* %im825.i, align 4, !tbaa !21
  %sub826.i = fsub float %sub233.i, %conv815.i
  %re828.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 28, i32 0
  store float %sub826.i, float* %re828.i, align 4, !tbaa !18
  %add829.i = fadd float %add234.i, %conv819.i
  %im831.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 28, i32 1
  store float %add829.i, float* %im831.i, align 4, !tbaa !21
  %re845.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 13, i32 0
  %463 = fpext <4 x float> %381 to <4 x double>
  %464 = fmul <4 x double> %463, <double 0x3FEA9B66290EB1A3, double 0xBFEA9B66290EB1A3, double 0x3FED906BCF32832F, double 0xBFED906BCF32832F>
  %465 = shufflevector <4 x double> %464, <4 x double> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %466 = call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %463, <4 x double> <double 0x3FE1C73B39AE76C7, double 0x3FE1C73B39AE76C7, double 0x3FD87DE2A6AEA312, double 0x3FD87DE2A6AEA312>, <4 x double> %465)
  %467 = fptrunc <4 x double> %466 to <4 x float>
  %468 = fsub <4 x float> %189, %467
  %sub849.i = extractelement <4 x float> %468, i64 0
  %re851.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 29, i32 0
  store float %sub849.i, float* %re851.i, align 4, !tbaa !18
  %469 = fadd <4 x float> %189, %467
  %add852.i = extractelement <4 x float> %469, i64 1
  %im854.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 29, i32 1
  store float %add852.i, float* %im854.i, align 4, !tbaa !21
  %470 = shufflevector <4 x float> %469, <4 x float> %468, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %471 = bitcast float* %re845.i to <4 x float>*
  store <4 x float> %470, <4 x float>* %471, align 4, !tbaa !25
  %sub872.i = extractelement <4 x float> %468, i64 2
  %re874.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 30, i32 0
  store float %sub872.i, float* %re874.i, align 4, !tbaa !18
  %add875.i = extractelement <4 x float> %469, i64 3
  %im877.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 30, i32 1
  store float %add875.i, float* %im877.i, align 4, !tbaa !21
  %conv878.i = fpext float %add560.i to double
  %conv880.i = fpext float %sub559.i to double
  %neg882.i = fmul double %conv880.i, 0xBFEF6297CFF75494
  %472 = tail call double @llvm.fmuladd.f64(double %conv878.i, double 0x3FC8F8B83C6993FD, double %neg882.i) #16
  %conv883.i = fptrunc double %472 to float
  %mul887.i = fmul double %conv878.i, 0x3FEF6297CFF75494
  %473 = tail call double @llvm.fmuladd.f64(double %conv880.i, double 0x3FC8F8B83C6993FD, double %mul887.i) #16
  %conv888.i = fptrunc double %473 to float
  %add889.i = fadd float %sub275.i, %conv883.i
  %re891.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 15, i32 0
  store float %add889.i, float* %re891.i, align 4, !tbaa !18
  %sub892.i = fsub float %add276.i, %conv888.i
  %im894.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 15, i32 1
  store float %sub892.i, float* %im894.i, align 4, !tbaa !21
  %sub895.i = fsub float %sub275.i, %conv883.i
  %re897.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 31, i32 0
  store float %sub895.i, float* %re897.i, align 4, !tbaa !18
  %add898.i = fadd float %add276.i, %conv888.i
  %im900.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 31, i32 1
  store float %add898.i, float* %im900.i, align 4, !tbaa !21
  br label %cleanup73

if.then2:                                         ; preds = %entry
  %474 = bitcast %struct.COMPLEX* %in to <2 x float>*
  %475 = load <2 x float>, <2 x float>* %474, align 4, !tbaa !25
  %shuffle469 = shufflevector <2 x float> %475, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %re3.i197 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 8, i32 0
  %476 = bitcast float* %re3.i197 to <2 x float>*
  %477 = load <2 x float>, <2 x float>* %476, align 4, !tbaa !25
  %shuffle470 = shufflevector <2 x float> %477, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %478 = fadd <4 x float> %shuffle469, %shuffle470
  %479 = fsub <4 x float> %shuffle469, %shuffle470
  %480 = shufflevector <4 x float> %478, <4 x float> %479, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %re9.i203 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 4, i32 0
  %481 = bitcast float* %re9.i203 to <2 x float>*
  %482 = load <2 x float>, <2 x float>* %481, align 4, !tbaa !25
  %shuffle471 = shufflevector <2 x float> %482, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %re13.i205 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 12, i32 0
  %483 = bitcast float* %re13.i205 to <2 x float>*
  %484 = load <2 x float>, <2 x float>* %483, align 4, !tbaa !25
  %shuffle472 = shufflevector <2 x float> %484, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %485 = fadd <4 x float> %shuffle471, %shuffle472
  %486 = fsub <4 x float> %shuffle471, %shuffle472
  %487 = shufflevector <4 x float> %485, <4 x float> %486, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %488 = fadd <4 x float> %480, %487
  %489 = fsub <4 x float> %480, %487
  %490 = shufflevector <4 x float> %488, <4 x float> %489, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %491 = shufflevector <4 x float> %489, <4 x float> %488, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %re29.i219 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 2, i32 0
  %492 = bitcast float* %re29.i219 to <2 x float>*
  %493 = load <2 x float>, <2 x float>* %492, align 4, !tbaa !25
  %re33.i221 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 10, i32 0
  %494 = bitcast float* %re33.i221 to <2 x float>*
  %495 = load <2 x float>, <2 x float>* %494, align 4, !tbaa !25
  %496 = fadd <2 x float> %493, %495
  %497 = fsub <2 x float> %493, %495
  %sub38.i225 = extractelement <2 x float> %497, i64 0
  %sub39.i226 = extractelement <2 x float> %497, i64 1
  %re41.i227 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 6, i32 0
  %498 = bitcast float* %re41.i227 to <2 x float>*
  %499 = load <2 x float>, <2 x float>* %498, align 4, !tbaa !25
  %re45.i229 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 14, i32 0
  %500 = bitcast float* %re45.i229 to <2 x float>*
  %501 = load <2 x float>, <2 x float>* %500, align 4, !tbaa !25
  %502 = fadd <2 x float> %499, %501
  %503 = fsub <2 x float> %499, %501
  %sub50.i233 = extractelement <2 x float> %503, i64 0
  %sub51.i234 = extractelement <2 x float> %503, i64 1
  %504 = fadd <2 x float> %496, %502
  %505 = fsub <2 x float> %496, %502
  %add56.i239 = fadd float %sub38.i225, %sub51.i234
  %sub57.i240 = fsub float %sub39.i226, %sub50.i233
  %sub58.i241 = fsub float %sub38.i225, %sub51.i234
  %add59.i242 = fadd float %sub39.i226, %sub50.i233
  %506 = insertelement <2 x float> poison, float %sub57.i240, i64 0
  %507 = shufflevector <2 x float> %506, <2 x float> poison, <2 x i32> zeroinitializer
  %508 = insertelement <2 x float> poison, float %add56.i239, i64 0
  %509 = shufflevector <2 x float> %508, <2 x float> poison, <2 x i32> zeroinitializer
  %510 = fadd <2 x float> %507, %509
  %511 = fsub <2 x float> %507, %509
  %512 = shufflevector <2 x float> %510, <2 x float> %511, <2 x i32> <i32 0, i32 3>
  %513 = fpext <2 x float> %512 to <2 x double>
  %514 = fmul <2 x double> %513, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %515 = fptrunc <2 x double> %514 to <2 x float>
  %516 = shufflevector <2 x float> %504, <2 x float> %515, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %517 = fadd <4 x float> %490, %516
  %518 = shufflevector <2 x float> %504, <2 x float> %515, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %519 = fsub <4 x float> %490, %518
  %520 = insertelement <2 x float> poison, float %add59.i242, i64 0
  %521 = shufflevector <2 x float> %520, <2 x float> poison, <2 x i32> zeroinitializer
  %522 = insertelement <2 x float> poison, float %sub58.i241, i64 0
  %523 = shufflevector <2 x float> %522, <2 x float> poison, <2 x i32> zeroinitializer
  %524 = fsub <2 x float> %521, %523
  %525 = fadd <2 x float> %521, %523
  %526 = shufflevector <2 x float> %524, <2 x float> %525, <2 x i32> <i32 0, i32 3>
  %527 = fpext <2 x float> %526 to <2 x double>
  %528 = fmul <2 x double> %527, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %529 = fptrunc <2 x double> %528 to <2 x float>
  %530 = shufflevector <2 x float> %505, <2 x float> %529, <4 x i32> <i32 1, i32 0, i32 2, i32 3>
  %531 = fadd <4 x float> %491, %530
  %532 = fsub <4 x float> %491, %530
  %533 = shufflevector <4 x float> %531, <4 x float> %532, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %534 = shufflevector <2 x float> %505, <2 x float> poison, <4 x i32> <i32 1, i32 0, i32 undef, i32 undef>
  %535 = shufflevector <2 x float> %529, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %536 = shufflevector <4 x float> %534, <4 x float> %535, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %537 = fsub <4 x float> %491, %536
  %538 = fadd <4 x float> %491, %536
  %539 = shufflevector <4 x float> %537, <4 x float> %538, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %re91.i275 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 1, i32 0
  %540 = bitcast float* %re91.i275 to <2 x float>*
  %541 = load <2 x float>, <2 x float>* %540, align 4, !tbaa !25
  %re95.i277 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 9, i32 0
  %542 = bitcast float* %re95.i277 to <2 x float>*
  %543 = load <2 x float>, <2 x float>* %542, align 4, !tbaa !25
  %544 = fadd <2 x float> %541, %543
  %545 = fsub <2 x float> %541, %543
  %re103.i283 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 5, i32 0
  %546 = bitcast float* %re103.i283 to <2 x float>*
  %547 = load <2 x float>, <2 x float>* %546, align 4, !tbaa !25
  %re107.i285 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 13, i32 0
  %548 = bitcast float* %re107.i285 to <2 x float>*
  %549 = load <2 x float>, <2 x float>* %548, align 4, !tbaa !25
  %550 = fadd <2 x float> %547, %549
  %551 = fsub <2 x float> %547, %549
  %shuffle473 = shufflevector <2 x float> %551, <2 x float> poison, <2 x i32> <i32 1, i32 0>
  %552 = fadd <2 x float> %544, %550
  %553 = fsub <2 x float> %544, %550
  %sub116.i293 = extractelement <2 x float> %553, i64 0
  %sub117.i294 = extractelement <2 x float> %553, i64 1
  %554 = fadd <2 x float> %545, %shuffle473
  %555 = fsub <2 x float> %545, %shuffle473
  %556 = shufflevector <2 x float> %554, <2 x float> %555, <2 x i32> <i32 0, i32 3>
  %557 = shufflevector <2 x float> %555, <2 x float> %554, <2 x i32> <i32 0, i32 3>
  %re123.i299 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 3, i32 0
  %558 = bitcast float* %re123.i299 to <2 x float>*
  %559 = load <2 x float>, <2 x float>* %558, align 4, !tbaa !25
  %re127.i301 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 11, i32 0
  %560 = bitcast float* %re127.i301 to <2 x float>*
  %561 = load <2 x float>, <2 x float>* %560, align 4, !tbaa !25
  %562 = fadd <2 x float> %559, %561
  %563 = fsub <2 x float> %559, %561
  %sub132.i305 = extractelement <2 x float> %563, i64 0
  %sub133.i306 = extractelement <2 x float> %563, i64 1
  %re135.i307 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 7, i32 0
  %564 = bitcast float* %re135.i307 to <2 x float>*
  %565 = load <2 x float>, <2 x float>* %564, align 4, !tbaa !25
  %re139.i309 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 15, i32 0
  %566 = bitcast float* %re139.i309 to <2 x float>*
  %567 = load <2 x float>, <2 x float>* %566, align 4, !tbaa !25
  %568 = fadd <2 x float> %565, %567
  %569 = fsub <2 x float> %565, %567
  %sub144.i313 = extractelement <2 x float> %569, i64 0
  %sub145.i314 = extractelement <2 x float> %569, i64 1
  %570 = fadd <2 x float> %562, %568
  %571 = fsub <2 x float> %562, %568
  %sub148.i317 = extractelement <2 x float> %571, i64 0
  %sub149.i318 = extractelement <2 x float> %571, i64 1
  %add150.i319 = fadd float %sub132.i305, %sub145.i314
  %sub151.i320 = fsub float %sub133.i306, %sub144.i313
  %sub152.i321 = fsub float %sub132.i305, %sub145.i314
  %add153.i322 = fadd float %sub133.i306, %sub144.i313
  %572 = fadd <2 x float> %552, %570
  %573 = fsub <2 x float> %552, %570
  %574 = insertelement <2 x float> poison, float %sub151.i320, i64 0
  %575 = shufflevector <2 x float> %574, <2 x float> poison, <2 x i32> zeroinitializer
  %576 = insertelement <2 x float> poison, float %add150.i319, i64 0
  %577 = shufflevector <2 x float> %576, <2 x float> poison, <2 x i32> zeroinitializer
  %578 = fadd <2 x float> %575, %577
  %579 = fsub <2 x float> %575, %577
  %580 = shufflevector <2 x float> %578, <2 x float> %579, <2 x i32> <i32 0, i32 3>
  %581 = fpext <2 x float> %580 to <2 x double>
  %582 = fmul <2 x double> %581, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %583 = fptrunc <2 x double> %582 to <2 x float>
  %584 = fadd <2 x float> %556, %583
  %585 = fsub <2 x float> %556, %583
  %add170.i339 = fadd float %sub116.i293, %sub149.i318
  %sub171.i340 = fsub float %sub117.i294, %sub148.i317
  %sub172.i341 = fsub float %sub116.i293, %sub149.i318
  %add173.i342 = fadd float %sub117.i294, %sub148.i317
  %586 = insertelement <2 x float> poison, float %add153.i322, i64 0
  %587 = shufflevector <2 x float> %586, <2 x float> poison, <2 x i32> zeroinitializer
  %588 = insertelement <2 x float> poison, float %sub152.i321, i64 0
  %589 = shufflevector <2 x float> %588, <2 x float> poison, <2 x i32> zeroinitializer
  %590 = fsub <2 x float> %587, %589
  %591 = fadd <2 x float> %587, %589
  %592 = shufflevector <2 x float> %590, <2 x float> %591, <2 x i32> <i32 0, i32 3>
  %593 = fpext <2 x float> %592 to <2 x double>
  %594 = fmul <2 x double> %593, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %595 = fptrunc <2 x double> %594 to <2 x float>
  %596 = fadd <2 x float> %557, %595
  %597 = fsub <2 x float> %557, %595
  %598 = shufflevector <2 x float> %596, <2 x float> %597, <2 x i32> <i32 0, i32 3>
  %599 = shufflevector <2 x float> %596, <2 x float> %597, <2 x i32> <i32 1, i32 2>
  %600 = fpext <2 x float> %584 to <2 x double>
  %601 = fmul <2 x double> %600, <double 0xBFD87DE2A6AEA312, double 0x3FD87DE2A6AEA312>
  %602 = shufflevector <2 x double> %601, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %603 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %600, <2 x double> <double 0x3FED906BCF32832F, double 0x3FED906BCF32832F>, <2 x double> %602)
  %604 = fptrunc <2 x double> %603 to <2 x float>
  %605 = shufflevector <2 x float> %604, <2 x float> poison, <4 x i32> <i32 0, i32 undef, i32 undef, i32 undef>
  %606 = shufflevector <2 x float> %572, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %607 = shufflevector <2 x float> %572, <2 x float> %604, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %608 = fadd <4 x float> %517, %607
  %609 = bitcast %struct.COMPLEX* %out to <4 x float>*
  store <4 x float> %608, <4 x float>* %609, align 4, !tbaa !25
  %im219.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 9, i32 1
  %610 = insertelement <2 x float> poison, float %sub171.i340, i64 0
  %611 = shufflevector <2 x float> %610, <2 x float> poison, <2 x i32> zeroinitializer
  %612 = insertelement <2 x float> poison, float %add170.i339, i64 0
  %613 = shufflevector <2 x float> %612, <2 x float> poison, <2 x i32> zeroinitializer
  %614 = fadd <2 x float> %611, %613
  %615 = fsub <2 x float> %611, %613
  %616 = shufflevector <2 x float> %614, <2 x float> %615, <2 x i32> <i32 0, i32 3>
  %617 = fpext <2 x float> %616 to <2 x double>
  %618 = fmul <2 x double> %617, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %re230.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 2, i32 0
  %619 = fpext <2 x float> %598 to <2 x double>
  %620 = fmul <2 x double> %619, <double 0xBFED906BCF32832F, double 0x3FED906BCF32832F>
  %621 = shufflevector <2 x double> %620, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %622 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %619, <2 x double> <double 0x3FD87DE2A6AEA312, double 0x3FD87DE2A6AEA312>, <2 x double> %621)
  %623 = shufflevector <2 x double> %618, <2 x double> %622, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %624 = fptrunc <4 x double> %623 to <4 x float>
  %625 = fadd <4 x float> %533, %624
  %626 = bitcast float* %re230.i to <4 x float>*
  store <4 x float> %625, <4 x float>* %626, align 4, !tbaa !25
  %627 = shufflevector <4 x float> %517, <4 x float> %531, <4 x i32> <i32 3, i32 4, i32 undef, i32 undef>
  %628 = shufflevector <4 x float> %627, <4 x float> %532, <4 x i32> <i32 0, i32 1, i32 5, i32 undef>
  %629 = shufflevector <4 x float> %628, <4 x float> %531, <4 x i32> <i32 0, i32 1, i32 2, i32 6>
  %630 = shufflevector <2 x float> %604, <2 x float> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %631 = shufflevector <4 x float> %630, <4 x float> %624, <4 x i32> <i32 0, i32 4, i32 5, i32 6>
  %632 = fsub <4 x float> %629, %631
  %633 = bitcast float* %im219.i to <4 x float>*
  store <4 x float> %632, <4 x float>* %633, align 4, !tbaa !25
  %im262.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 11, i32 1
  %re265.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 4, i32 0
  %634 = fpext <2 x float> %585 to <2 x double>
  %635 = fmul <2 x double> %634, <double 0xBFD87DE2A6AEA312, double 0x3FD87DE2A6AEA312>
  %636 = shufflevector <2 x double> %635, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %637 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %634, <2 x double> <double 0x3FED906BCF32832F, double 0x3FED906BCF32832F>, <2 x double> %636)
  %638 = fptrunc <2 x double> %637 to <2 x float>
  %639 = shufflevector <2 x float> %638, <2 x float> poison, <4 x i32> <i32 undef, i32 1, i32 undef, i32 undef>
  %640 = shufflevector <2 x float> %573, <2 x float> poison, <4 x i32> <i32 1, i32 0, i32 undef, i32 undef>
  %641 = shufflevector <2 x float> %573, <2 x float> poison, <4 x i32> <i32 1, i32 0, i32 undef, i32 undef>
  %642 = shufflevector <2 x float> %638, <2 x float> poison, <4 x i32> <i32 1, i32 0, i32 undef, i32 undef>
  %643 = shufflevector <4 x float> %641, <4 x float> %642, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %644 = fadd <4 x float> %519, %643
  %645 = fsub <4 x float> %519, %643
  %646 = shufflevector <4 x float> %644, <4 x float> %645, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %647 = bitcast float* %re265.i to <4 x float>*
  store <4 x float> %646, <4 x float>* %647, align 4, !tbaa !25
  %648 = shufflevector <4 x float> %532, <4 x float> %519, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  %649 = shufflevector <4 x float> %624, <4 x float> undef, <4 x i32> <i32 3, i32 undef, i32 undef, i32 undef>
  %650 = shufflevector <4 x float> %649, <4 x float> %640, <4 x i32> <i32 0, i32 4, i32 5, i32 undef>
  %651 = shufflevector <4 x float> %650, <4 x float> %639, <4 x i32> <i32 0, i32 1, i32 2, i32 5>
  %652 = fsub <4 x float> %648, %651
  %653 = fadd <4 x float> %648, %651
  %654 = shufflevector <4 x float> %652, <4 x float> %653, <4 x i32> <i32 0, i32 1, i32 6, i32 3>
  %655 = bitcast float* %im262.i to <4 x float>*
  store <4 x float> %654, <4 x float>* %655, align 4, !tbaa !25
  %656 = extractelement <4 x float> %519, i64 3
  %657 = extractelement <2 x float> %638, i64 0
  %add295.i = fadd float %656, %657
  %im297.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 13, i32 1
  store float %add295.i, float* %im297.i, align 4, !tbaa !21
  %658 = insertelement <2 x float> poison, float %add173.i342, i64 0
  %659 = shufflevector <2 x float> %658, <2 x float> poison, <2 x i32> zeroinitializer
  %660 = insertelement <2 x float> poison, float %sub172.i341, i64 0
  %661 = shufflevector <2 x float> %660, <2 x float> poison, <2 x i32> zeroinitializer
  %662 = fsub <2 x float> %659, %661
  %663 = fadd <2 x float> %659, %661
  %664 = shufflevector <2 x float> %662, <2 x float> %663, <2 x i32> <i32 0, i32 3>
  %665 = fpext <2 x float> %664 to <2 x double>
  %666 = fmul <2 x double> %665, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %667 = fpext <2 x float> %599 to <2 x double>
  %668 = fmul <2 x double> %667, <double 0x3FED906BCF32832F, double 0xBFED906BCF32832F>
  %669 = shufflevector <2 x double> %668, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %670 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %667, <2 x double> <double 0x3FD87DE2A6AEA312, double 0x3FD87DE2A6AEA312>, <2 x double> %669)
  %671 = shufflevector <2 x double> %666, <2 x double> %670, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %672 = fptrunc <4 x double> %671 to <4 x float>
  %673 = fadd <4 x float> %539, %672
  %add306.i = extractelement <4 x float> %673, i64 0
  %re308.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 6, i32 0
  store float %add306.i, float* %re308.i, align 4, !tbaa !18
  %674 = fsub <4 x float> %539, %672
  %sub309.i = extractelement <4 x float> %674, i64 1
  %im311.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 6, i32 1
  store float %sub309.i, float* %im311.i, align 4, !tbaa !21
  %re314.i367 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 14, i32 0
  %add329.i368 = extractelement <4 x float> %673, i64 2
  %re331.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 7, i32 0
  store float %add329.i368, float* %re331.i, align 4, !tbaa !18
  %675 = shufflevector <4 x float> %538, <4 x float> %517, <4 x i32> <i32 3, i32 4, i32 5, i32 6>
  %676 = shufflevector <4 x float> %672, <4 x float> undef, <4 x i32> <i32 3, i32 undef, i32 undef, i32 undef>
  %677 = shufflevector <4 x float> %676, <4 x float> %606, <4 x i32> <i32 0, i32 4, i32 5, i32 undef>
  %678 = shufflevector <4 x float> %677, <4 x float> %605, <4 x i32> <i32 0, i32 1, i32 2, i32 4>
  %679 = fsub <4 x float> %675, %678
  %im334.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 7, i32 1
  %680 = bitcast float* %im334.i to <4 x float>*
  store <4 x float> %679, <4 x float>* %680, align 4, !tbaa !25
  %681 = shufflevector <4 x float> %674, <4 x float> %673, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %682 = bitcast float* %re314.i367 to <4 x float>*
  store <4 x float> %681, <4 x float>* %682, align 4, !tbaa !25
  br label %cleanup73

if.then5:                                         ; preds = %entry
  %683 = bitcast %struct.COMPLEX* %in to <2 x float>*
  %684 = load <2 x float>, <2 x float>* %683, align 4, !tbaa !25
  %shuffle474 = shufflevector <2 x float> %684, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %re3.i373 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 4, i32 0
  %685 = bitcast float* %re3.i373 to <2 x float>*
  %686 = load <2 x float>, <2 x float>* %685, align 4, !tbaa !25
  %shuffle475 = shufflevector <2 x float> %686, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %687 = fadd <4 x float> %shuffle474, %shuffle475
  %688 = fsub <4 x float> %shuffle474, %shuffle475
  %689 = shufflevector <4 x float> %687, <4 x float> %688, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %re9.i379 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 2, i32 0
  %690 = bitcast float* %re9.i379 to <2 x float>*
  %691 = load <2 x float>, <2 x float>* %690, align 4, !tbaa !25
  %shuffle476 = shufflevector <2 x float> %691, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %re13.i381 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 6, i32 0
  %692 = bitcast float* %re13.i381 to <2 x float>*
  %693 = load <2 x float>, <2 x float>* %692, align 4, !tbaa !25
  %shuffle477 = shufflevector <2 x float> %693, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %694 = fadd <4 x float> %shuffle476, %shuffle477
  %695 = fsub <4 x float> %shuffle476, %shuffle477
  %696 = shufflevector <4 x float> %694, <4 x float> %695, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %697 = fadd <4 x float> %689, %696
  %698 = fsub <4 x float> %689, %696
  %699 = shufflevector <4 x float> %697, <4 x float> %698, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %700 = shufflevector <4 x float> %698, <4 x float> %697, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %re29.i395 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 1, i32 0
  %701 = bitcast float* %re29.i395 to <2 x float>*
  %702 = load <2 x float>, <2 x float>* %701, align 4, !tbaa !25
  %re33.i397 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 5, i32 0
  %703 = bitcast float* %re33.i397 to <2 x float>*
  %704 = load <2 x float>, <2 x float>* %703, align 4, !tbaa !25
  %705 = fadd <2 x float> %702, %704
  %706 = fsub <2 x float> %702, %704
  %sub38.i401 = extractelement <2 x float> %706, i64 0
  %sub39.i402 = extractelement <2 x float> %706, i64 1
  %re41.i403 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 3, i32 0
  %707 = bitcast float* %re41.i403 to <2 x float>*
  %708 = load <2 x float>, <2 x float>* %707, align 4, !tbaa !25
  %re45.i405 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 7, i32 0
  %709 = bitcast float* %re45.i405 to <2 x float>*
  %710 = load <2 x float>, <2 x float>* %709, align 4, !tbaa !25
  %711 = fadd <2 x float> %708, %710
  %712 = fsub <2 x float> %708, %710
  %sub50.i409 = extractelement <2 x float> %712, i64 0
  %sub51.i410 = extractelement <2 x float> %712, i64 1
  %713 = fadd <2 x float> %705, %711
  %714 = fsub <2 x float> %705, %711
  %add56.i415 = fadd float %sub38.i401, %sub51.i410
  %sub57.i416 = fsub float %sub39.i402, %sub50.i409
  %sub58.i417 = fsub float %sub38.i401, %sub51.i410
  %add59.i418 = fadd float %sub39.i402, %sub50.i409
  %re68.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 4, i32 0
  %715 = insertelement <2 x float> poison, float %sub57.i416, i64 0
  %716 = shufflevector <2 x float> %715, <2 x float> poison, <2 x i32> zeroinitializer
  %717 = insertelement <2 x float> poison, float %add56.i415, i64 0
  %718 = shufflevector <2 x float> %717, <2 x float> poison, <2 x i32> zeroinitializer
  %719 = fadd <2 x float> %716, %718
  %720 = fsub <2 x float> %716, %718
  %721 = shufflevector <2 x float> %719, <2 x float> %720, <2 x i32> <i32 0, i32 3>
  %722 = fpext <2 x float> %721 to <2 x double>
  %723 = fmul <2 x double> %722, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %724 = fptrunc <2 x double> %723 to <2 x float>
  %725 = shufflevector <2 x float> %713, <2 x float> %724, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %726 = fadd <4 x float> %699, %725
  %727 = bitcast %struct.COMPLEX* %out to <4 x float>*
  store <4 x float> %726, <4 x float>* %727, align 4, !tbaa !25
  %728 = shufflevector <2 x float> %713, <2 x float> %724, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %729 = fsub <4 x float> %699, %728
  %730 = bitcast float* %re68.i to <4 x float>*
  store <4 x float> %729, <4 x float>* %730, align 4, !tbaa !25
  %re92.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 2, i32 0
  %re98.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 6, i32 0
  %731 = insertelement <2 x float> poison, float %add59.i418, i64 0
  %732 = shufflevector <2 x float> %731, <2 x float> poison, <2 x i32> zeroinitializer
  %733 = insertelement <2 x float> poison, float %sub58.i417, i64 0
  %734 = shufflevector <2 x float> %733, <2 x float> poison, <2 x i32> zeroinitializer
  %735 = fsub <2 x float> %732, %734
  %736 = fadd <2 x float> %732, %734
  %737 = shufflevector <2 x float> %735, <2 x float> %736, <2 x i32> <i32 0, i32 3>
  %738 = fpext <2 x float> %737 to <2 x double>
  %739 = fmul <2 x double> %738, <double 0x3FE6A09E667F4BB8, double 0x3FE6A09E667F4BB8>
  %740 = fptrunc <2 x double> %739 to <2 x float>
  %741 = shufflevector <2 x float> %714, <2 x float> poison, <4 x i32> <i32 1, i32 0, i32 undef, i32 undef>
  %742 = shufflevector <2 x float> %740, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 undef, i32 undef>
  %743 = shufflevector <4 x float> %741, <4 x float> %742, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %744 = fadd <4 x float> %700, %743
  %745 = fsub <4 x float> %700, %743
  %746 = shufflevector <4 x float> %744, <4 x float> %745, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %747 = bitcast float* %re92.i to <4 x float>*
  store <4 x float> %746, <4 x float>* %747, align 4, !tbaa !25
  %748 = shufflevector <2 x float> %714, <2 x float> %740, <4 x i32> <i32 1, i32 0, i32 2, i32 3>
  %749 = fsub <4 x float> %700, %748
  %750 = fadd <4 x float> %700, %748
  %751 = shufflevector <4 x float> %749, <4 x float> %750, <4 x i32> <i32 0, i32 5, i32 2, i32 7>
  %752 = bitcast float* %re98.i to <4 x float>*
  store <4 x float> %751, <4 x float>* %752, align 4, !tbaa !25
  br label %cleanup73

if.then8:                                         ; preds = %entry
  %753 = bitcast %struct.COMPLEX* %in to <2 x float>*
  %754 = load <2 x float>, <2 x float>* %753, align 4, !tbaa !25
  %shuffle478 = shufflevector <2 x float> %754, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %re3.i430 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 2, i32 0
  %755 = bitcast float* %re3.i430 to <2 x float>*
  %756 = load <2 x float>, <2 x float>* %755, align 4, !tbaa !25
  %shuffle479 = shufflevector <2 x float> %756, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %757 = fadd <4 x float> %shuffle478, %shuffle479
  %758 = fsub <4 x float> %shuffle478, %shuffle479
  %759 = shufflevector <4 x float> %757, <4 x float> %758, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %re9.i436 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 1, i32 0
  %760 = bitcast float* %re9.i436 to <2 x float>*
  %761 = load <2 x float>, <2 x float>* %760, align 4, !tbaa !25
  %shuffle480 = shufflevector <2 x float> %761, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %re13.i438 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 3, i32 0
  %762 = bitcast float* %re13.i438 to <2 x float>*
  %763 = load <2 x float>, <2 x float>* %762, align 4, !tbaa !25
  %shuffle481 = shufflevector <2 x float> %763, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 1, i32 0>
  %764 = fadd <4 x float> %shuffle480, %shuffle481
  %765 = fsub <4 x float> %shuffle480, %shuffle481
  %766 = shufflevector <4 x float> %764, <4 x float> %765, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %re28.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 2, i32 0
  %767 = fadd <4 x float> %759, %766
  %768 = fsub <4 x float> %759, %766
  %769 = shufflevector <4 x float> %767, <4 x float> %768, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %770 = bitcast %struct.COMPLEX* %out to <4 x float>*
  store <4 x float> %769, <4 x float>* %770, align 4, !tbaa !25
  %771 = shufflevector <4 x float> %768, <4 x float> %767, <4 x i32> <i32 0, i32 1, i32 2, i32 7>
  %772 = bitcast float* %re28.i to <4 x float>*
  store <4 x float> %771, <4 x float>* %772, align 4, !tbaa !25
  br label %cleanup73

if.then11:                                        ; preds = %entry
  %773 = bitcast %struct.COMPLEX* %in to <2 x float>*
  %774 = load <2 x float>, <2 x float>* %773, align 4, !tbaa !25
  %shuffle482 = shufflevector <2 x float> %774, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %re3.i451 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 1, i32 0
  %775 = bitcast float* %re3.i451 to <2 x float>*
  %776 = load <2 x float>, <2 x float>* %775, align 4, !tbaa !25
  %shuffle483 = shufflevector <2 x float> %776, <2 x float> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %777 = fadd <4 x float> %shuffle482, %shuffle483
  %778 = fsub <4 x float> %shuffle482, %shuffle483
  %779 = shufflevector <4 x float> %777, <4 x float> %778, <4 x i32> <i32 0, i32 1, i32 6, i32 7>
  %780 = bitcast %struct.COMPLEX* %out to <4 x float>*
  store <4 x float> %779, <4 x float>* %780, align 4, !tbaa !25
  br label %cleanup73

if.end12:                                         ; preds = %entry
  %781 = load i32, i32* %factors, align 4, !tbaa !15
  %div = sdiv i32 %n, %781
  %cmp13 = icmp slt i32 %781, %n
  br i1 %cmp13, label %if.then14, label %if.end46

if.then14:                                        ; preds = %if.end12
  switch i32 %781, label %if.else28 [
    i32 32, label %if.then16
    i32 16, label %if.then18
    i32 8, label %if.then21
    i32 4, label %if.then24
    i32 2, label %if.then27
  ]

if.then16:                                        ; preds = %if.then14
  tail call fastcc void @fft_unshuffle_32(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %div)
  br label %if.end33

if.then18:                                        ; preds = %if.then14
  tail call fastcc void @fft_unshuffle_16(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %div)
  br label %if.end33

if.then21:                                        ; preds = %if.then14
  tail call fastcc void @fft_unshuffle_8(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %div)
  br label %if.end33

if.then24:                                        ; preds = %if.then14
  tail call fastcc void @fft_unshuffle_4(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %div)
  br label %if.end33

if.then27:                                        ; preds = %if.then14
  tail call fastcc void @fft_unshuffle_2(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %div)
  br label %if.end33

if.else28:                                        ; preds = %if.then14
  tail call fastcc void @unshuffle(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %781, i32 noundef %div)
  br label %if.end33

if.end33:                                         ; preds = %if.then18, %if.then24, %if.else28, %if.then27, %if.then21, %if.then16
  %cmp34 = icmp sgt i32 %n, 0
  br i1 %cmp34, label %pfor.ph, label %if.end46

pfor.ph:                                          ; preds = %if.end33
  %sub35 = add nsw i32 %n, -1
  %div36 = sdiv i32 %sub35, %div
  %add.ptr41 = getelementptr inbounds i32, i32* %factors, i64 1
  %782 = sext i32 %div to i64
  %smax = call i32 @llvm.smax.i32(i32 %div36, i32 0)
  %783 = add nuw nsw i32 %smax, 1
  %wide.trip.count = zext i32 %783 to i64
  br label %pfor.cond

pfor.cond:                                        ; preds = %pfor.inc, %pfor.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %pfor.inc ], [ 0, %pfor.ph ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc

pfor.body.entry:                                  ; preds = %pfor.cond
  %784 = mul nsw i64 %indvars.iv, %782
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %784
  %add.ptr40 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %784
  tail call fastcc void @fft_aux(i32 noundef %div, %struct.COMPLEX* noundef %add.ptr, %struct.COMPLEX* noundef %add.ptr40, i32* noundef nonnull %add.ptr41, %struct.COMPLEX* noundef %W, i32 noundef %nW)
  reattach within %syncreg, label %pfor.inc

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !llvm.loop !26

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %if.end46

if.end46:                                         ; preds = %if.end33, %pfor.cond.cleanup, %if.end12
  switch i32 %781, label %if.else66 [
    i32 2, label %if.then48
    i32 4, label %if.then52
    i32 8, label %if.then56
    i32 16, label %if.then60
    i32 32, label %if.then64
  ]

if.then48:                                        ; preds = %if.end46
  %div49 = sdiv i32 %nW, %n
  tail call fastcc void @fft_twiddle_2(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %div49, i32 noundef %div)
  br label %cleanup73

if.then52:                                        ; preds = %if.end46
  %div53 = sdiv i32 %nW, %n
  tail call fastcc void @fft_twiddle_4(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %div53, i32 noundef %div)
  br label %cleanup73

if.then56:                                        ; preds = %if.end46
  %div57 = sdiv i32 %nW, %n
  tail call fastcc void @fft_twiddle_8(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %div57, i32 noundef %div)
  br label %cleanup73

if.then60:                                        ; preds = %if.end46
  %div61 = sdiv i32 %nW, %n
  tail call fastcc void @fft_twiddle_16(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %div61, i32 noundef %div)
  br label %cleanup73

if.then64:                                        ; preds = %if.end46
  %div65 = sdiv i32 %nW, %n
  tail call fastcc void @fft_twiddle_32(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %div65, i32 noundef %div)
  br label %cleanup73

if.else66:                                        ; preds = %if.end46
  %div67 = sdiv i32 %nW, %n
  tail call fastcc void @fft_twiddle_gen(i32 noundef 0, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nW, i32 noundef %div67, i32 noundef %781, i32 noundef %div)
  br label %cleanup73

cleanup73:                                        ; preds = %if.then48, %if.then56, %if.then64, %if.else66, %if.then60, %if.then52, %if.then11, %if.then8, %if.then5, %if.then2, %if.then
  ret void
}

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #9

; Function Attrs: nofree nounwind uwtable
define dso_local void @test_fft_elem(i32 noundef %n, i32 noundef %j, %struct.COMPLEX* nocapture noundef readonly %in, %struct.COMPLEX* nocapture noundef writeonly %out) local_unnamed_addr #10 {
entry:
  %cmp67 = icmp sgt i32 %n, 0
  br i1 %cmp67, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %0 = phi <2 x float> [ zeroinitializer, %for.body.lr.ph ], [ %12, %for.body ]
  %1 = trunc i64 %indvars.iv to i32
  %2 = mul i32 %1, %j
  %rem = srem i32 %2, %n
  %conv2 = sitofp i32 %rem to double
  %mul3 = fmul double %conv2, 0x401921FB60000000
  %div = fdiv double %mul3, %conv4
  %call = tail call double @cos(double noundef %div) #16
  %conv5 = fptrunc double %call to float
  %call15 = tail call double @sin(double noundef %div) #16
  %3 = fptrunc double %call15 to float
  %conv16 = fneg float %3
  %re18 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv, i32 0
  %4 = bitcast float* %re18 to <2 x float>*
  %5 = load <2 x float>, <2 x float>* %4, align 4, !tbaa !25
  %6 = insertelement <2 x float> poison, float %conv16, i64 0
  %7 = insertelement <2 x float> %6, float %3, i64 1
  %8 = fmul <2 x float> %5, %7
  %shuffle = shufflevector <2 x float> %8, <2 x float> poison, <2 x i32> <i32 1, i32 0>
  %9 = insertelement <2 x float> poison, float %conv5, i64 0
  %10 = shufflevector <2 x float> %9, <2 x float> poison, <2 x i32> zeroinitializer
  %11 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %5, <2 x float> %10, <2 x float> %shuffle)
  %12 = fadd <2 x float> %0, %11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !27

for.end:                                          ; preds = %for.body, %entry
  %13 = phi <2 x float> [ zeroinitializer, %entry ], [ %12, %for.body ]
  %idxprom39.pre-phi = sext i32 %j to i64
  %sum.sroa.0.0..sroa_idx = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %idxprom39.pre-phi, i32 0
  %14 = extractelement <2 x float> %13, i64 0
  store float %14, float* %sum.sroa.0.0..sroa_idx, align 4, !tbaa.struct !28
  %sum.sroa.6.0..sroa_idx48 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %idxprom39.pre-phi, i32 1
  %15 = extractelement <2 x float> %13, i64 1
  store float %15, float* %sum.sroa.6.0..sroa_idx48, align 4, !tbaa.struct !29
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn writeonly
declare dso_local double @cos(double noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #11

; Function Attrs: nounwind uwtable
define dso_local void @test_fft(i32 noundef %n, %struct.COMPLEX* nocapture noundef readonly %in, %struct.COMPLEX* nocapture noundef writeonly %out) local_unnamed_addr #5 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %cmp = icmp sgt i32 %n, 0
  br i1 %cmp, label %pfor.cond.preheader, label %cleanup

pfor.cond.preheader:                              ; preds = %entry
  %conv4.i = sitofp i32 %n to double
  %wide.trip.count.i = zext i32 %n to i64
  br label %pfor.cond.us

pfor.cond.us:                                     ; preds = %pfor.inc.us, %pfor.cond.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %pfor.inc.us ], [ 0, %pfor.cond.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  detach within %syncreg, label %for.body.lr.ph.i.us, label %pfor.inc.us

for.body.lr.ph.i.us:                              ; preds = %pfor.cond.us
  %0 = trunc i64 %indvars.iv to i32
  br label %for.body.i.us

for.body.i.us:                                    ; preds = %for.body.i.us, %for.body.lr.ph.i.us
  %indvars.iv.i.us = phi i64 [ 0, %for.body.lr.ph.i.us ], [ %indvars.iv.next.i.us, %for.body.i.us ]
  %1 = phi <2 x float> [ zeroinitializer, %for.body.lr.ph.i.us ], [ %13, %for.body.i.us ]
  %2 = trunc i64 %indvars.iv.i.us to i32
  %3 = mul i32 %0, %2
  %rem.i.us = srem i32 %3, %n
  %conv2.i.us = sitofp i32 %rem.i.us to double
  %mul3.i.us = fmul double %conv2.i.us, 0x401921FB60000000
  %div.i.us = fdiv double %mul3.i.us, %conv4.i
  %call.i.us = tail call double @cos(double noundef %div.i.us) #16
  %conv5.i.us = fptrunc double %call.i.us to float
  %call15.i.us = tail call double @sin(double noundef %div.i.us) #16
  %4 = fptrunc double %call15.i.us to float
  %conv16.i.us = fneg float %4
  %re18.i.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv.i.us, i32 0
  %5 = bitcast float* %re18.i.us to <2 x float>*
  %6 = load <2 x float>, <2 x float>* %5, align 4, !tbaa !25
  %shuffle = shufflevector <2 x float> %6, <2 x float> poison, <2 x i32> <i32 1, i32 0>
  %7 = insertelement <2 x float> poison, float %conv16.i.us, i64 0
  %8 = insertelement <2 x float> %7, float %4, i64 1
  %9 = fmul <2 x float> %6, %8
  %10 = insertelement <2 x float> poison, float %conv5.i.us, i64 0
  %11 = shufflevector <2 x float> %10, <2 x float> poison, <2 x i32> zeroinitializer
  %12 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %shuffle, <2 x float> %11, <2 x float> %9)
  %13 = fadd <2 x float> %1, %12
  %indvars.iv.next.i.us = add nuw nsw i64 %indvars.iv.i.us, 1
  %exitcond.not.i.us = icmp eq i64 %indvars.iv.next.i.us, %wide.trip.count.i
  br i1 %exitcond.not.i.us, label %test_fft_elem.exit.loopexit.us, label %for.body.i.us, !llvm.loop !27

pfor.inc.us:                                      ; preds = %test_fft_elem.exit.loopexit.us, %pfor.cond.us
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count.i
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond.us, !llvm.loop !30

test_fft_elem.exit.loopexit.us:                   ; preds = %for.body.i.us
  %sum.sroa.0.0..sroa_idx.i.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv, i32 0
  %14 = extractelement <2 x float> %13, i64 1
  store float %14, float* %sum.sroa.0.0..sroa_idx.i.us, align 4, !tbaa.struct !28
  %sum.sroa.6.0..sroa_idx48.i.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv, i32 1
  %15 = extractelement <2 x float> %13, i64 0
  store float %15, float* %sum.sroa.6.0..sroa_idx48.i.us, align 4, !tbaa.struct !29
  reattach within %syncreg, label %pfor.inc.us

pfor.cond.cleanup:                                ; preds = %pfor.inc.us
  sync within %syncreg, label %cleanup

cleanup:                                          ; preds = %pfor.cond.cleanup, %entry
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @test_correctness() local_unnamed_addr #5 {
entry:
  %syncreg.i = tail call token @llvm.syncregion.start()
  %call = tail call noalias dereferenceable_or_null(6400) i8* @malloc(i64 noundef 6400) #16
  %0 = bitcast i8* %call to %struct.COMPLEX*
  %call1 = tail call noalias dereferenceable_or_null(6400) i8* @malloc(i64 noundef 6400) #16
  %1 = bitcast i8* %call1 to %struct.COMPLEX*
  %call2 = tail call noalias dereferenceable_or_null(6400) i8* @malloc(i64 noundef 6400) #16
  %2 = bitcast i8* %call2 to %struct.COMPLEX*
  %call3 = tail call noalias dereferenceable_or_null(6400) i8* @malloc(i64 noundef 6400) #16
  %3 = bitcast i8* %call3 to %struct.COMPLEX*
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %entry, %for.inc119
  %indvars.iv220 = phi i64 [ 1, %entry ], [ %indvars.iv.next221, %for.inc119 ]
  %4 = and i64 %indvars.iv220, 9223372036854775804
  %5 = add nsw i64 %4, -4
  %6 = lshr exact i64 %5, 2
  %7 = add nuw nsw i64 %6, 1
  %min.iters.check = icmp ult i64 %indvars.iv220, 4
  br i1 %min.iters.check, label %for.body6.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond4.preheader
  %n.vec = and i64 %indvars.iv220, 9223372036854775804
  %xtraiter = and i64 %7, 1
  %8 = icmp eq i64 %5, 0
  br i1 %8, label %middle.block.unr-lcssa, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter = and i64 %7, 9223372036854775806
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %vec.ind225 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph.new ], [ %vec.ind.next228.1, %vector.body ]
  %niter = phi i64 [ 0, %vector.ph.new ], [ %niter.next.1, %vector.body ]
  %9 = or i64 %index, 2
  %step.add226 = add <2 x i32> %vec.ind225, <i32 2, i32 2>
  %10 = sitofp <2 x i32> %vec.ind225 to <2 x float>
  %11 = sitofp <2 x i32> %step.add226 to <2 x float>
  %12 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %1, i64 %index, i32 1
  %13 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %1, i64 %9, i32 1
  %14 = getelementptr inbounds float, float* %12, i64 -1
  %15 = bitcast float* %14 to <4 x float>*
  %16 = getelementptr inbounds float, float* %13, i64 -1
  %17 = bitcast float* %16 to <4 x float>*
  %interleaved.vec = shufflevector <2 x float> %10, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x float> %interleaved.vec, <4 x float>* %15, align 4, !tbaa !25
  %interleaved.vec229 = shufflevector <2 x float> %11, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x float> %interleaved.vec229, <4 x float>* %17, align 4, !tbaa !25
  %18 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %index, i32 1
  %19 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %9, i32 1
  %20 = getelementptr inbounds float, float* %18, i64 -1
  %21 = bitcast float* %20 to <4 x float>*
  %22 = getelementptr inbounds float, float* %19, i64 -1
  %23 = bitcast float* %22 to <4 x float>*
  store <4 x float> %interleaved.vec, <4 x float>* %21, align 4, !tbaa !25
  store <4 x float> %interleaved.vec229, <4 x float>* %23, align 4, !tbaa !25
  %index.next = or i64 %index, 4
  %vec.ind.next228 = add <2 x i32> %vec.ind225, <i32 4, i32 4>
  %24 = or i64 %index, 6
  %step.add226.1 = add <2 x i32> %vec.ind225, <i32 6, i32 6>
  %25 = sitofp <2 x i32> %vec.ind.next228 to <2 x float>
  %26 = sitofp <2 x i32> %step.add226.1 to <2 x float>
  %27 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %1, i64 %index.next, i32 1
  %28 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %1, i64 %24, i32 1
  %29 = getelementptr inbounds float, float* %27, i64 -1
  %30 = bitcast float* %29 to <4 x float>*
  %31 = getelementptr inbounds float, float* %28, i64 -1
  %32 = bitcast float* %31 to <4 x float>*
  %interleaved.vec.1 = shufflevector <2 x float> %25, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x float> %interleaved.vec.1, <4 x float>* %30, align 4, !tbaa !25
  %interleaved.vec229.1 = shufflevector <2 x float> %26, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x float> %interleaved.vec229.1, <4 x float>* %32, align 4, !tbaa !25
  %33 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %index.next, i32 1
  %34 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %24, i32 1
  %35 = getelementptr inbounds float, float* %33, i64 -1
  %36 = bitcast float* %35 to <4 x float>*
  %37 = getelementptr inbounds float, float* %34, i64 -1
  %38 = bitcast float* %37 to <4 x float>*
  store <4 x float> %interleaved.vec.1, <4 x float>* %36, align 4, !tbaa !25
  store <4 x float> %interleaved.vec229.1, <4 x float>* %38, align 4, !tbaa !25
  %index.next.1 = add nuw i64 %index, 8
  %vec.ind.next228.1 = add <2 x i32> %vec.ind225, <i32 8, i32 8>
  %niter.next.1 = add i64 %niter, 2
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !31

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.1, %vector.body ]
  %vec.ind225.unr = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next228.1, %vector.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa
  %39 = or i64 %index.unr, 2
  %step.add226.epil = add <2 x i32> %vec.ind225.unr, <i32 2, i32 2>
  %40 = sitofp <2 x i32> %vec.ind225.unr to <2 x float>
  %41 = sitofp <2 x i32> %step.add226.epil to <2 x float>
  %42 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %1, i64 %index.unr, i32 1
  %43 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %1, i64 %39, i32 1
  %44 = getelementptr inbounds float, float* %42, i64 -1
  %45 = bitcast float* %44 to <4 x float>*
  %46 = getelementptr inbounds float, float* %43, i64 -1
  %47 = bitcast float* %46 to <4 x float>*
  %interleaved.vec.epil = shufflevector <2 x float> %40, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x float> %interleaved.vec.epil, <4 x float>* %45, align 4, !tbaa !25
  %interleaved.vec229.epil = shufflevector <2 x float> %41, <2 x float> zeroinitializer, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x float> %interleaved.vec229.epil, <4 x float>* %47, align 4, !tbaa !25
  %48 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %index.unr, i32 1
  %49 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %39, i32 1
  %50 = getelementptr inbounds float, float* %48, i64 -1
  %51 = bitcast float* %50 to <4 x float>*
  %52 = getelementptr inbounds float, float* %49, i64 -1
  %53 = bitcast float* %52 to <4 x float>*
  store <4 x float> %interleaved.vec.epil, <4 x float>* %51, align 4, !tbaa !25
  store <4 x float> %interleaved.vec229.epil, <4 x float>* %53, align 4, !tbaa !25
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %cmp.n = icmp eq i64 %indvars.iv220, %n.vec
  br i1 %cmp.n, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.cond4.preheader, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond4.preheader ], [ %n.vec, %middle.block ]
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body6 ], [ %indvars.iv.ph, %for.body6.preheader ]
  %54 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %54 to float
  %re = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %1, i64 %indvars.iv, i32 0
  store float %conv, float* %re, align 4, !tbaa !18
  %re9 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %indvars.iv, i32 0
  store float %conv, float* %re9, align 4, !tbaa !18
  %im = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %1, i64 %indvars.iv, i32 1
  store float 0.000000e+00, float* %im, align 4, !tbaa !21
  %im14 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %indvars.iv, i32 1
  store float 0.000000e+00, float* %im14, align 4, !tbaa !21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %indvars.iv220
  br i1 %exitcond.not, label %for.end, label %for.body6, !llvm.loop !33

for.end:                                          ; preds = %for.body6, %middle.block
  %55 = trunc i64 %indvars.iv220 to i32
  tail call void @cilk_fft(i32 noundef %55, %struct.COMPLEX* noundef nonnull %0, %struct.COMPLEX* noundef %2)
  %conv4.i.i = sitofp i32 %55 to double
  br label %pfor.cond.us.i

pfor.cond.us.i:                                   ; preds = %pfor.inc.us.i, %for.end
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %pfor.inc.us.i ], [ 0, %for.end ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  detach within %syncreg.i, label %for.body.lr.ph.i.us.i, label %pfor.inc.us.i

for.body.lr.ph.i.us.i:                            ; preds = %pfor.cond.us.i
  %56 = trunc i64 %indvars.iv.i to i32
  br label %for.body.i.us.i

for.body.i.us.i:                                  ; preds = %for.body.i.us.i, %for.body.lr.ph.i.us.i
  %indvars.iv.i.us.i = phi i64 [ 0, %for.body.lr.ph.i.us.i ], [ %indvars.iv.next.i.us.i, %for.body.i.us.i ]
  %57 = phi <2 x float> [ zeroinitializer, %for.body.lr.ph.i.us.i ], [ %69, %for.body.i.us.i ]
  %58 = trunc i64 %indvars.iv.i.us.i to i32
  %59 = mul i32 %58, %56
  %rem.i.us.i = srem i32 %59, %55
  %conv2.i.us.i = sitofp i32 %rem.i.us.i to double
  %mul3.i.us.i = fmul double %conv2.i.us.i, 0x401921FB60000000
  %div.i.us.i = fdiv double %mul3.i.us.i, %conv4.i.i
  %call.i.us.i = tail call double @cos(double noundef %div.i.us.i) #16
  %conv5.i.us.i = fptrunc double %call.i.us.i to float
  %call15.i.us.i = tail call double @sin(double noundef %div.i.us.i) #16
  %60 = fptrunc double %call15.i.us.i to float
  %conv16.i.us.i = fneg float %60
  %re18.i.us.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %1, i64 %indvars.iv.i.us.i, i32 0
  %61 = bitcast float* %re18.i.us.i to <2 x float>*
  %62 = load <2 x float>, <2 x float>* %61, align 4, !tbaa !25
  %shuffle = shufflevector <2 x float> %62, <2 x float> poison, <2 x i32> <i32 1, i32 0>
  %63 = insertelement <2 x float> poison, float %conv16.i.us.i, i64 0
  %64 = insertelement <2 x float> %63, float %60, i64 1
  %65 = fmul <2 x float> %62, %64
  %66 = insertelement <2 x float> poison, float %conv5.i.us.i, i64 0
  %67 = shufflevector <2 x float> %66, <2 x float> poison, <2 x i32> zeroinitializer
  %68 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %shuffle, <2 x float> %67, <2 x float> %65)
  %69 = fadd <2 x float> %57, %68
  %indvars.iv.next.i.us.i = add nuw nsw i64 %indvars.iv.i.us.i, 1
  %exitcond.not.i.us.i = icmp eq i64 %indvars.iv.next.i.us.i, %indvars.iv220
  br i1 %exitcond.not.i.us.i, label %test_fft_elem.exit.loopexit.us.i, label %for.body.i.us.i, !llvm.loop !27

pfor.inc.us.i:                                    ; preds = %test_fft_elem.exit.loopexit.us.i, %pfor.cond.us.i
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, %indvars.iv220
  br i1 %exitcond.not.i, label %pfor.cond.cleanup.i, label %pfor.cond.us.i, !llvm.loop !30

test_fft_elem.exit.loopexit.us.i:                 ; preds = %for.body.i.us.i
  %sum.sroa.0.0..sroa_idx.i.us.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %3, i64 %indvars.iv.i, i32 0
  %70 = extractelement <2 x float> %69, i64 1
  store float %70, float* %sum.sroa.0.0..sroa_idx.i.us.i, align 4, !tbaa.struct !28
  %sum.sroa.6.0..sroa_idx48.i.us.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %3, i64 %indvars.iv.i, i32 1
  %71 = extractelement <2 x float> %69, i64 0
  store float %71, float* %sum.sroa.6.0..sroa_idx48.i.us.i, align 4, !tbaa.struct !29
  reattach within %syncreg.i, label %pfor.inc.us.i

pfor.cond.cleanup.i:                              ; preds = %pfor.inc.us.i
  sync within %syncreg.i, label %for.body18

for.body18:                                       ; preds = %pfor.cond.cleanup.i, %for.body18
  %indvars.iv205 = phi i64 [ %indvars.iv.next206, %for.body18 ], [ 0, %pfor.cond.cleanup.i ]
  %error.0198 = phi double [ %error.1, %for.body18 ], [ 0.000000e+00, %pfor.cond.cleanup.i ]
  %re21 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %2, i64 %indvars.iv205, i32 0
  %72 = load float, float* %re21, align 4, !tbaa !18
  %re24 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %3, i64 %indvars.iv205, i32 0
  %73 = load float, float* %re24, align 4, !tbaa !18
  %sub = fsub float %72, %73
  %im34 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %2, i64 %indvars.iv205, i32 1
  %74 = load float, float* %im34, align 4, !tbaa !21
  %im37 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %3, i64 %indvars.iv205, i32 1
  %75 = load float, float* %im37, align 4, !tbaa !21
  %sub38 = fsub float %74, %75
  %mul46 = fmul float %sub38, %sub38
  %76 = tail call float @llvm.fmuladd.f32(float %sub, float %sub, float %mul46)
  %conv47 = fpext float %76 to double
  %call48 = tail call double @sqrt(double noundef %conv47) #16
  %mul61 = fmul float %75, %75
  %77 = tail call float @llvm.fmuladd.f32(float %73, float %73, float %mul61)
  %conv62 = fpext float %77 to double
  %call63 = tail call double @sqrt(double noundef %conv62) #16
  %cmp64 = fcmp olt double %call63, -1.000000e-10
  %cmp66 = fcmp ogt double %call63, 1.000000e-10
  %or.cond = or i1 %cmp64, %cmp66
  %div = select i1 %or.cond, double %call63, double 1.000000e+00
  %a.0 = fdiv double %call48, %div
  %cmp68 = fcmp ogt double %a.0, %error.0198
  %error.1 = select i1 %cmp68, double %a.0, double %error.0198
  %indvars.iv.next206 = add nuw nsw i64 %indvars.iv205, 1
  %exitcond209.not = icmp eq i64 %indvars.iv.next206, %indvars.iv220
  br i1 %exitcond209.not, label %for.end74, label %for.body18, !llvm.loop !35

for.end74:                                        ; preds = %for.body18
  %cmp75 = fcmp ogt double %error.1, 1.000000e-03
  br i1 %cmp75, label %if.then77, label %if.end113

if.then77:                                        ; preds = %for.end74
  %call78 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0), i32 noundef %55, double noundef %error.1)
  %puts = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @str, i64 0, i64 0))
  br label %for.body83

for.body83:                                       ; preds = %if.then77, %for.body83
  %indvars.iv210 = phi i64 [ 0, %if.then77 ], [ %indvars.iv.next211, %for.body83 ]
  %re86 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %3, i64 %indvars.iv210, i32 0
  %78 = load float, float* %re86, align 4, !tbaa !18
  %conv87 = fpext float %78 to double
  %im90 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %3, i64 %indvars.iv210, i32 1
  %79 = load float, float* %im90, align 4, !tbaa !21
  %conv91 = fpext float %79 to double
  %call92 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), double noundef %conv87, double noundef %conv91)
  %indvars.iv.next211 = add nuw nsw i64 %indvars.iv210, 1
  %exitcond214.not = icmp eq i64 %indvars.iv.next211, %indvars.iv220
  br i1 %exitcond214.not, label %for.end95, label %for.body83, !llvm.loop !36

for.end95:                                        ; preds = %for.body83
  %puts195 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([5 x i8], [5 x i8]* @str.19, i64 0, i64 0))
  br label %for.body100

for.body100:                                      ; preds = %for.end95, %for.body100
  %indvars.iv215 = phi i64 [ 0, %for.end95 ], [ %indvars.iv.next216, %for.body100 ]
  %re103 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %2, i64 %indvars.iv215, i32 0
  %80 = load float, float* %re103, align 4, !tbaa !18
  %conv104 = fpext float %80 to double
  %im107 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %2, i64 %indvars.iv215, i32 1
  %81 = load float, float* %im107, align 4, !tbaa !21
  %conv108 = fpext float %81 to double
  %call109 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i64 0, i64 0), double noundef %conv104, double noundef %conv108)
  %indvars.iv.next216 = add nuw nsw i64 %indvars.iv215, 1
  %exitcond219.not = icmp eq i64 %indvars.iv.next216, %indvars.iv220
  br i1 %exitcond219.not, label %if.end113, label %for.body100, !llvm.loop !37

if.end113:                                        ; preds = %for.body100, %for.end74
  %rem = urem i32 %55, 10
  %cmp114 = icmp eq i32 %rem, 0
  br i1 %cmp114, label %if.then116, label %for.inc119

if.then116:                                       ; preds = %if.end113
  %call117 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), i32 noundef %55)
  br label %for.inc119

for.inc119:                                       ; preds = %if.end113, %if.then116
  %indvars.iv.next221 = add nuw nsw i64 %indvars.iv220, 1
  %exitcond223.not = icmp eq i64 %indvars.iv.next221, 800
  br i1 %exitcond223.not, label %for.end121, label %for.cond4.preheader, !llvm.loop !38

for.end121:                                       ; preds = %for.inc119
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn writeonly
declare dso_local double @sqrt(double noundef) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #12

; Function Attrs: nounwind uwtable
define dso_local void @test_speed(i64 noundef %size, i32 noundef %round) local_unnamed_addr #5 {
entry:
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  %mul = shl i64 %size, 3
  %call = tail call noalias i8* @malloc(i64 noundef %mul) #16
  %0 = bitcast i8* %call to %struct.COMPLEX*
  %call2 = tail call noalias i8* @malloc(i64 noundef %mul) #16
  %1 = bitcast i8* %call2 to %struct.COMPLEX*
  %cmp46 = icmp sgt i32 %round, 0
  br i1 %cmp46, label %for.cond3.preheader.lr.ph, label %for.cond.cleanup

for.cond3.preheader.lr.ph:                        ; preds = %entry
  %cmp443 = icmp sgt i64 %size, 0
  %2 = bitcast %struct.timeval* %t1 to i8*
  %3 = bitcast %struct.timeval* %t2 to i8*
  %conv10 = trunc i64 %size to i32
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1
  %tv_sec.i39 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0
  %tv_usec.i41 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1
  br i1 %cmp443, label %for.cond3.preheader.us.preheader, label %for.cond3.preheader

for.cond3.preheader.us.preheader:                 ; preds = %for.cond3.preheader.lr.ph
  %4 = add i64 %size, -4
  %5 = lshr i64 %4, 2
  %6 = add nuw nsw i64 %5, 1
  %min.iters.check = icmp ult i64 %size, 4
  %n.vec = and i64 %size, -4
  %xtraiter = and i64 %6, 3
  %7 = icmp ult i64 %4, 12
  %unroll_iter = and i64 %6, 9223372036854775804
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  %cmp.n = icmp eq i64 %n.vec, %size
  br label %for.cond3.preheader.us

for.cond3.preheader.us:                           ; preds = %for.cond3.preheader.us.preheader, %for.cond3.for.end_crit_edge.us
  %r.047.us = phi i32 [ %inc20.us, %for.cond3.for.end_crit_edge.us ], [ 0, %for.cond3.preheader.us.preheader ]
  br i1 %min.iters.check, label %for.body6.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.cond3.preheader.us
  br i1 %7, label %middle.block.unr-lcssa, label %vector.body

vector.body:                                      ; preds = %vector.ph, %vector.body
  %index = phi i64 [ %index.next.3, %vector.body ], [ 0, %vector.ph ]
  %niter = phi i64 [ %niter.next.3, %vector.body ], [ 0, %vector.ph ]
  %8 = or i64 %index, 2
  %9 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %index, i32 1
  %10 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %8, i32 1
  %11 = getelementptr inbounds float, float* %9, i64 -1
  %12 = bitcast float* %11 to <4 x float>*
  %13 = getelementptr inbounds float, float* %10, i64 -1
  %14 = bitcast float* %13 to <4 x float>*
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %12, align 4, !tbaa !25
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %14, align 4, !tbaa !25
  %index.next = or i64 %index, 4
  %15 = or i64 %index, 6
  %16 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %index.next, i32 1
  %17 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %15, i32 1
  %18 = getelementptr inbounds float, float* %16, i64 -1
  %19 = bitcast float* %18 to <4 x float>*
  %20 = getelementptr inbounds float, float* %17, i64 -1
  %21 = bitcast float* %20 to <4 x float>*
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %19, align 4, !tbaa !25
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %21, align 4, !tbaa !25
  %index.next.1 = or i64 %index, 8
  %22 = or i64 %index, 10
  %23 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %index.next.1, i32 1
  %24 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %22, i32 1
  %25 = getelementptr inbounds float, float* %23, i64 -1
  %26 = bitcast float* %25 to <4 x float>*
  %27 = getelementptr inbounds float, float* %24, i64 -1
  %28 = bitcast float* %27 to <4 x float>*
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %26, align 4, !tbaa !25
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %28, align 4, !tbaa !25
  %index.next.2 = or i64 %index, 12
  %29 = or i64 %index, 14
  %30 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %index.next.2, i32 1
  %31 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %29, i32 1
  %32 = getelementptr inbounds float, float* %30, i64 -1
  %33 = bitcast float* %32 to <4 x float>*
  %34 = getelementptr inbounds float, float* %31, i64 -1
  %35 = bitcast float* %34 to <4 x float>*
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %33, align 4, !tbaa !25
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %35, align 4, !tbaa !25
  %index.next.3 = add nuw i64 %index, 16
  %niter.next.3 = add nuw i64 %niter, 4
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !39

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil

vector.body.epil:                                 ; preds = %middle.block.unr-lcssa, %vector.body.epil
  %index.epil = phi i64 [ %index.next.epil, %vector.body.epil ], [ %index.unr, %middle.block.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %vector.body.epil ], [ 0, %middle.block.unr-lcssa ]
  %36 = or i64 %index.epil, 2
  %37 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %index.epil, i32 1
  %38 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %36, i32 1
  %39 = getelementptr inbounds float, float* %37, i64 -1
  %40 = bitcast float* %39 to <4 x float>*
  %41 = getelementptr inbounds float, float* %38, i64 -1
  %42 = bitcast float* %41 to <4 x float>*
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %40, align 4, !tbaa !25
  store <4 x float> <float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00>, <4 x float>* %42, align 4, !tbaa !25
  %index.next.epil = add nuw i64 %index.epil, 4
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %middle.block, label %vector.body.epil, !llvm.loop !40

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  br i1 %cmp.n, label %for.cond3.for.end_crit_edge.us, label %for.body6.us.preheader

for.body6.us.preheader:                           ; preds = %for.cond3.preheader.us, %middle.block
  %indvars.iv.ph = phi i64 [ 0, %for.cond3.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us.preheader, %for.body6.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body6.us ], [ %indvars.iv.ph, %for.body6.us.preheader ]
  %re.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %indvars.iv, i32 0
  store float 1.000000e+00, float* %re.us, align 4, !tbaa !18
  %im.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %0, i64 %indvars.iv, i32 1
  store float 1.000000e+00, float* %im.us, align 4, !tbaa !21
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond50.not = icmp eq i64 %indvars.iv.next, %size
  br i1 %exitcond50.not, label %for.cond3.for.end_crit_edge.us, label %for.body6.us, !llvm.loop !42

for.cond3.for.end_crit_edge.us:                   ; preds = %for.body6.us, %middle.block
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %2) #16
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #16
  %call9.us = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #16
  tail call void @cilk_fft(i32 noundef %conv10, %struct.COMPLEX* noundef nonnull %0, %struct.COMPLEX* noundef %1)
  %call11.us = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #16
  %43 = load i64, i64* %tv_sec.i, align 8, !tbaa !3
  %44 = load i64, i64* %tv_usec.i, align 8, !tbaa !8
  %45 = load i64, i64* %tv_sec.i39, align 8, !tbaa !3
  %46 = load i64, i64* %tv_usec.i41, align 8, !tbaa !8
  %reass.add.us = sub i64 %43, %45
  %reass.mul.us = mul i64 %reass.add.us, 1000000
  %add.i.us = sub i64 %44, %46
  %sub.us = add i64 %add.i.us, %reass.mul.us
  %div.us = udiv i64 %sub.us, 1000
  %conv14.us = uitofp i64 %div.us to double
  %div15.us = fdiv double %conv14.us, 1.000000e+03
  %call16.us = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0), double noundef %div15.us)
  %47 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %48 = tail call i64 @fwrite(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i64 0, i64 0), i64 19, i64 1, %struct._IO_FILE* %47) #17
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %call18.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %49, i8* noundef getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7, i64 0, i64 0), i64 noundef %size) #17
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #16
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %2) #16
  %inc20.us = add nuw nsw i32 %r.047.us, 1
  %exitcond51.not = icmp eq i32 %inc20.us, %round
  br i1 %exitcond51.not, label %for.cond.cleanup, label %for.cond3.preheader.us, !llvm.loop !45

for.cond3.preheader:                              ; preds = %for.cond3.preheader.lr.ph, %for.cond3.preheader
  %r.047 = phi i32 [ %inc20, %for.cond3.preheader ], [ 0, %for.cond3.preheader.lr.ph ]
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %2) #16
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #16
  %call9 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #16
  tail call void @cilk_fft(i32 noundef %conv10, %struct.COMPLEX* noundef %0, %struct.COMPLEX* noundef %1)
  %call11 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #16
  %50 = load i64, i64* %tv_sec.i, align 8, !tbaa !3
  %51 = load i64, i64* %tv_usec.i, align 8, !tbaa !8
  %52 = load i64, i64* %tv_sec.i39, align 8, !tbaa !3
  %53 = load i64, i64* %tv_usec.i41, align 8, !tbaa !8
  %reass.add = sub i64 %50, %52
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i = sub i64 %51, %53
  %sub = add i64 %add.i, %reass.mul
  %div = udiv i64 %sub, 1000
  %conv14 = uitofp i64 %div to double
  %div15 = fdiv double %conv14, 1.000000e+03
  %call16 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i64 0, i64 0), double noundef %div15)
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %55 = tail call i64 @fwrite(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i64 0, i64 0), i64 19, i64 1, %struct._IO_FILE* %54) #17
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %call18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %56, i8* noundef getelementptr inbounds ([41 x i8], [41 x i8]* @.str.7, i64 0, i64 0), i64 noundef %size) #17
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #16
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %2) #16
  %inc20 = add nuw nsw i32 %r.047, 1
  %exitcond.not = icmp eq i32 %inc20, %round
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.cond3.preheader, !llvm.loop !45

for.cond.cleanup:                                 ; preds = %for.cond3.preheader, %for.cond3.for.end_crit_edge.us, %entry
  tail call void @free(i8* noundef %call) #16
  tail call void @free(i8* noundef %call2) #16
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #12

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @usage() local_unnamed_addr #10 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.8, i64 0, i64 0), i64 60, i64 1, %struct._IO_FILE* %0) #17
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.9, i64 0, i64 0), i64 60, i64 1, %struct._IO_FILE* %2) #17
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.10, i64 0, i64 0), i64 71, i64 1, %struct._IO_FILE* %4) #17
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.11, i64 0, i64 0), i64 67, i64 1, %struct._IO_FILE* %6) #17
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.12, i64 0, i64 0), i64 56, i64 1, %struct._IO_FILE* %8) #17
  ret i32 1
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** noundef %argv) local_unnamed_addr #5 {
entry:
  %correctness = alloca i32, align 4
  %help = alloca i32, align 4
  %benchmark = alloca i32, align 4
  %round = alloca i32, align 4
  %size = alloca i64, align 8
  %0 = bitcast i32* %correctness to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #16
  %1 = bitcast i32* %help to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #16
  %2 = bitcast i32* %benchmark to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #16
  %3 = bitcast i32* %round to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #16
  %4 = bitcast i64* %size to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #16
  store i32 0, i32* %correctness, align 4, !tbaa !15
  store i64 1048576, i64* %size, align 8, !tbaa !46
  store i32 1, i32* %round, align 4, !tbaa !15
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %5, i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.18, i64 0, i64 0), double noundef 0xBFE67CA02266D8B1) #17
  call void (i32, i8**, i8**, i32*, ...) @get_options(i32 noundef %argc, i8** noundef %argv, i8** noundef getelementptr inbounds ([6 x i8*], [6 x i8*]* @specifiers, i64 0, i64 0), i32* noundef getelementptr inbounds ([6 x i32], [6 x i32]* @opt_types, i64 0, i64 0), i64* noundef nonnull %size, i32* noundef nonnull %correctness, i32* noundef nonnull %benchmark, i32* noundef nonnull %help, i32* noundef nonnull %round) #16
  %6 = load i32, i32* %help, align 4, !tbaa !15
  %tobool.not = icmp eq i32 %6, 0
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %8 = call i64 @fwrite(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.8, i64 0, i64 0), i64 60, i64 1, %struct._IO_FILE* %7) #18
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.9, i64 0, i64 0), i64 60, i64 1, %struct._IO_FILE* %9) #18
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %12 = call i64 @fwrite(i8* getelementptr inbounds ([72 x i8], [72 x i8]* @.str.10, i64 0, i64 0), i64 71, i64 1, %struct._IO_FILE* %11) #18
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %14 = call i64 @fwrite(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.11, i64 0, i64 0), i64 67, i64 1, %struct._IO_FILE* %13) #18
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !43
  %16 = call i64 @fwrite(i8* getelementptr inbounds ([57 x i8], [57 x i8]* @.str.12, i64 0, i64 0), i64 56, i64 1, %struct._IO_FILE* %15) #18
  br label %cleanup

if.end:                                           ; preds = %entry
  %17 = load i32, i32* %benchmark, align 4, !tbaa !15
  switch i32 %17, label %if.end7 [
    i32 3, label %sw.bb6
    i32 1, label %sw.bb
    i32 2, label %sw.bb5
  ]

sw.bb:                                            ; preds = %if.end
  store i64 16777216, i64* %size, align 8, !tbaa !46
  br label %if.end7

sw.bb5:                                           ; preds = %if.end
  store i64 33554432, i64* %size, align 8, !tbaa !46
  br label %if.end7

sw.bb6:                                           ; preds = %if.end
  store i64 67108864, i64* %size, align 8, !tbaa !46
  br label %if.end7

if.end7:                                          ; preds = %if.end, %sw.bb, %sw.bb5, %sw.bb6
  %18 = load i32, i32* %correctness, align 4, !tbaa !15
  %tobool8.not = icmp eq i32 %18, 0
  br i1 %tobool8.not, label %if.else, label %if.then9

if.then9:                                         ; preds = %if.end7
  call void @test_correctness()
  br label %cleanup

if.else:                                          ; preds = %if.end7
  call void @startup_cilk()
  %19 = load i64, i64* %size, align 8, !tbaa !46
  %20 = load i32, i32* %round, align 4, !tbaa !15
  call void @test_speed(i64 noundef %19, i32 noundef %20)
  br label %cleanup

cleanup:                                          ; preds = %if.then9, %if.else, %if.then
  %retval.0 = phi i32 [ 1, %if.then ], [ 0, %if.else ], [ 0, %if.then9 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #16
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #16
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #16
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #16
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #16
  ret i32 %retval.0
}

declare dso_local void @get_options(i32 noundef, i8** noundef, i8** noundef, i32* noundef, ...) local_unnamed_addr #13

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_unshuffle_32(i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub288 = sub nsw i32 %b, %a
  %cmp289 = icmp slt i32 %sub288, 128
  br i1 %cmp289, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %div, %det.cont ]
  %cmp1291 = icmp slt i32 %a.tr.lcssa, %b
  br i1 %cmp1291, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.then
  %mul = shl nsw i32 %a.tr.lcssa, 5
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %idx.ext
  %idxprom = sext i32 %m to i64
  %mul8 = shl nsw i32 %m, 1
  %idx.ext9 = sext i32 %mul8 to i64
  %0 = sext i32 %a.tr.lcssa to i64
  %wide.trip.count = sext i32 %b to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ %0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %ip.0292 = phi %struct.COMPLEX* [ %add.ptr, %for.body.lr.ph ], [ %add.ptr142, %for.body ]
  %add.ptr3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv
  %1 = bitcast %struct.COMPLEX* %ip.0292 to i64*
  %2 = bitcast %struct.COMPLEX* %add.ptr3 to i64*
  %3 = load i64, i64* %1, align 4
  store i64 %3, i64* %2, align 4
  %arrayidx5 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom
  %arrayidx6 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 1
  %4 = bitcast %struct.COMPLEX* %arrayidx6 to i64*
  %5 = bitcast %struct.COMPLEX* %arrayidx5 to i64*
  %6 = load i64, i64* %4, align 4
  store i64 %6, i64* %5, align 4
  %add.ptr7 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 2
  %add.ptr10 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idx.ext9
  %7 = bitcast %struct.COMPLEX* %add.ptr7 to i64*
  %8 = bitcast %struct.COMPLEX* %add.ptr10 to i64*
  %9 = load i64, i64* %7, align 4
  store i64 %9, i64* %8, align 4
  %arrayidx14 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr10, i64 %idxprom
  %arrayidx15 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 3
  %10 = bitcast %struct.COMPLEX* %arrayidx15 to i64*
  %11 = bitcast %struct.COMPLEX* %arrayidx14 to i64*
  %12 = load i64, i64* %10, align 4
  store i64 %12, i64* %11, align 4
  %add.ptr16 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 4
  %add.ptr19 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr10, i64 %idx.ext9
  %13 = bitcast %struct.COMPLEX* %add.ptr16 to i64*
  %14 = bitcast %struct.COMPLEX* %add.ptr19 to i64*
  %15 = load i64, i64* %13, align 4
  store i64 %15, i64* %14, align 4
  %arrayidx23 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr19, i64 %idxprom
  %arrayidx24 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 5
  %16 = bitcast %struct.COMPLEX* %arrayidx24 to i64*
  %17 = bitcast %struct.COMPLEX* %arrayidx23 to i64*
  %18 = load i64, i64* %16, align 4
  store i64 %18, i64* %17, align 4
  %add.ptr25 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 6
  %add.ptr28 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr19, i64 %idx.ext9
  %19 = bitcast %struct.COMPLEX* %add.ptr25 to i64*
  %20 = bitcast %struct.COMPLEX* %add.ptr28 to i64*
  %21 = load i64, i64* %19, align 4
  store i64 %21, i64* %20, align 4
  %arrayidx32 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr28, i64 %idxprom
  %arrayidx33 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 7
  %22 = bitcast %struct.COMPLEX* %arrayidx33 to i64*
  %23 = bitcast %struct.COMPLEX* %arrayidx32 to i64*
  %24 = load i64, i64* %22, align 4
  store i64 %24, i64* %23, align 4
  %add.ptr34 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 8
  %add.ptr37 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr28, i64 %idx.ext9
  %25 = bitcast %struct.COMPLEX* %add.ptr34 to i64*
  %26 = bitcast %struct.COMPLEX* %add.ptr37 to i64*
  %27 = load i64, i64* %25, align 4
  store i64 %27, i64* %26, align 4
  %arrayidx41 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr37, i64 %idxprom
  %arrayidx42 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 9
  %28 = bitcast %struct.COMPLEX* %arrayidx42 to i64*
  %29 = bitcast %struct.COMPLEX* %arrayidx41 to i64*
  %30 = load i64, i64* %28, align 4
  store i64 %30, i64* %29, align 4
  %add.ptr43 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 10
  %add.ptr46 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr37, i64 %idx.ext9
  %31 = bitcast %struct.COMPLEX* %add.ptr43 to i64*
  %32 = bitcast %struct.COMPLEX* %add.ptr46 to i64*
  %33 = load i64, i64* %31, align 4
  store i64 %33, i64* %32, align 4
  %arrayidx50 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr46, i64 %idxprom
  %arrayidx51 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 11
  %34 = bitcast %struct.COMPLEX* %arrayidx51 to i64*
  %35 = bitcast %struct.COMPLEX* %arrayidx50 to i64*
  %36 = load i64, i64* %34, align 4
  store i64 %36, i64* %35, align 4
  %add.ptr52 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 12
  %add.ptr55 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr46, i64 %idx.ext9
  %37 = bitcast %struct.COMPLEX* %add.ptr52 to i64*
  %38 = bitcast %struct.COMPLEX* %add.ptr55 to i64*
  %39 = load i64, i64* %37, align 4
  store i64 %39, i64* %38, align 4
  %arrayidx59 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr55, i64 %idxprom
  %arrayidx60 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 13
  %40 = bitcast %struct.COMPLEX* %arrayidx60 to i64*
  %41 = bitcast %struct.COMPLEX* %arrayidx59 to i64*
  %42 = load i64, i64* %40, align 4
  store i64 %42, i64* %41, align 4
  %add.ptr61 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 14
  %add.ptr64 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr55, i64 %idx.ext9
  %43 = bitcast %struct.COMPLEX* %add.ptr61 to i64*
  %44 = bitcast %struct.COMPLEX* %add.ptr64 to i64*
  %45 = load i64, i64* %43, align 4
  store i64 %45, i64* %44, align 4
  %arrayidx68 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr64, i64 %idxprom
  %arrayidx69 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 15
  %46 = bitcast %struct.COMPLEX* %arrayidx69 to i64*
  %47 = bitcast %struct.COMPLEX* %arrayidx68 to i64*
  %48 = load i64, i64* %46, align 4
  store i64 %48, i64* %47, align 4
  %add.ptr70 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 16
  %add.ptr73 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr64, i64 %idx.ext9
  %49 = bitcast %struct.COMPLEX* %add.ptr70 to i64*
  %50 = bitcast %struct.COMPLEX* %add.ptr73 to i64*
  %51 = load i64, i64* %49, align 4
  store i64 %51, i64* %50, align 4
  %arrayidx77 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr73, i64 %idxprom
  %arrayidx78 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 17
  %52 = bitcast %struct.COMPLEX* %arrayidx78 to i64*
  %53 = bitcast %struct.COMPLEX* %arrayidx77 to i64*
  %54 = load i64, i64* %52, align 4
  store i64 %54, i64* %53, align 4
  %add.ptr79 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 18
  %add.ptr82 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr73, i64 %idx.ext9
  %55 = bitcast %struct.COMPLEX* %add.ptr79 to i64*
  %56 = bitcast %struct.COMPLEX* %add.ptr82 to i64*
  %57 = load i64, i64* %55, align 4
  store i64 %57, i64* %56, align 4
  %arrayidx86 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr82, i64 %idxprom
  %arrayidx87 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 19
  %58 = bitcast %struct.COMPLEX* %arrayidx87 to i64*
  %59 = bitcast %struct.COMPLEX* %arrayidx86 to i64*
  %60 = load i64, i64* %58, align 4
  store i64 %60, i64* %59, align 4
  %add.ptr88 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 20
  %add.ptr91 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr82, i64 %idx.ext9
  %61 = bitcast %struct.COMPLEX* %add.ptr88 to i64*
  %62 = bitcast %struct.COMPLEX* %add.ptr91 to i64*
  %63 = load i64, i64* %61, align 4
  store i64 %63, i64* %62, align 4
  %arrayidx95 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr91, i64 %idxprom
  %arrayidx96 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 21
  %64 = bitcast %struct.COMPLEX* %arrayidx96 to i64*
  %65 = bitcast %struct.COMPLEX* %arrayidx95 to i64*
  %66 = load i64, i64* %64, align 4
  store i64 %66, i64* %65, align 4
  %add.ptr97 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 22
  %add.ptr100 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr91, i64 %idx.ext9
  %67 = bitcast %struct.COMPLEX* %add.ptr97 to i64*
  %68 = bitcast %struct.COMPLEX* %add.ptr100 to i64*
  %69 = load i64, i64* %67, align 4
  store i64 %69, i64* %68, align 4
  %arrayidx104 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr100, i64 %idxprom
  %arrayidx105 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 23
  %70 = bitcast %struct.COMPLEX* %arrayidx105 to i64*
  %71 = bitcast %struct.COMPLEX* %arrayidx104 to i64*
  %72 = load i64, i64* %70, align 4
  store i64 %72, i64* %71, align 4
  %add.ptr106 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 24
  %add.ptr109 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr100, i64 %idx.ext9
  %73 = bitcast %struct.COMPLEX* %add.ptr106 to i64*
  %74 = bitcast %struct.COMPLEX* %add.ptr109 to i64*
  %75 = load i64, i64* %73, align 4
  store i64 %75, i64* %74, align 4
  %arrayidx113 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr109, i64 %idxprom
  %arrayidx114 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 25
  %76 = bitcast %struct.COMPLEX* %arrayidx114 to i64*
  %77 = bitcast %struct.COMPLEX* %arrayidx113 to i64*
  %78 = load i64, i64* %76, align 4
  store i64 %78, i64* %77, align 4
  %add.ptr115 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 26
  %add.ptr118 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr109, i64 %idx.ext9
  %79 = bitcast %struct.COMPLEX* %add.ptr115 to i64*
  %80 = bitcast %struct.COMPLEX* %add.ptr118 to i64*
  %81 = load i64, i64* %79, align 4
  store i64 %81, i64* %80, align 4
  %arrayidx122 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr118, i64 %idxprom
  %arrayidx123 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 27
  %82 = bitcast %struct.COMPLEX* %arrayidx123 to i64*
  %83 = bitcast %struct.COMPLEX* %arrayidx122 to i64*
  %84 = load i64, i64* %82, align 4
  store i64 %84, i64* %83, align 4
  %add.ptr124 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 28
  %add.ptr127 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr118, i64 %idx.ext9
  %85 = bitcast %struct.COMPLEX* %add.ptr124 to i64*
  %86 = bitcast %struct.COMPLEX* %add.ptr127 to i64*
  %87 = load i64, i64* %85, align 4
  store i64 %87, i64* %86, align 4
  %arrayidx131 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr127, i64 %idxprom
  %arrayidx132 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 29
  %88 = bitcast %struct.COMPLEX* %arrayidx132 to i64*
  %89 = bitcast %struct.COMPLEX* %arrayidx131 to i64*
  %90 = load i64, i64* %88, align 4
  store i64 %90, i64* %89, align 4
  %add.ptr133 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 30
  %add.ptr136 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr127, i64 %idx.ext9
  %91 = bitcast %struct.COMPLEX* %add.ptr133 to i64*
  %92 = bitcast %struct.COMPLEX* %add.ptr136 to i64*
  %93 = load i64, i64* %91, align 4
  store i64 %93, i64* %92, align 4
  %arrayidx140 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr136, i64 %idxprom
  %arrayidx141 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 31
  %94 = bitcast %struct.COMPLEX* %arrayidx141 to i64*
  %95 = bitcast %struct.COMPLEX* %arrayidx140 to i64*
  %96 = load i64, i64* %94, align 4
  store i64 %96, i64* %95, align 4
  %add.ptr142 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0292, i64 32
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %cleanup, label %for.body, !llvm.loop !47

if.end:                                           ; preds = %entry, %det.cont
  %a.tr290 = phi i32 [ %div, %det.cont ], [ %a, %entry ]
  %add = add nsw i32 %a.tr290, %b
  %div = sdiv i32 %add, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @fft_unshuffle_32(i32 noundef %a.tr290, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %sub = sub nsw i32 %b, %div
  %cmp = icmp slt i32 %sub, 128
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !48

cleanup:                                          ; preds = %for.body, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_unshuffle_16(i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub152 = sub nsw i32 %b, %a
  %cmp153 = icmp slt i32 %sub152, 128
  br i1 %cmp153, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %div, %det.cont ]
  %cmp1155 = icmp slt i32 %a.tr.lcssa, %b
  br i1 %cmp1155, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.then
  %mul = shl nsw i32 %a.tr.lcssa, 4
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %idx.ext
  %idxprom = sext i32 %m to i64
  %mul8 = shl nsw i32 %m, 1
  %idx.ext9 = sext i32 %mul8 to i64
  %0 = sext i32 %a.tr.lcssa to i64
  %wide.trip.count = sext i32 %b to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ %0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %ip.0156 = phi %struct.COMPLEX* [ %add.ptr, %for.body.lr.ph ], [ %add.ptr70, %for.body ]
  %add.ptr3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv
  %1 = bitcast %struct.COMPLEX* %ip.0156 to i64*
  %2 = bitcast %struct.COMPLEX* %add.ptr3 to i64*
  %3 = load i64, i64* %1, align 4
  store i64 %3, i64* %2, align 4
  %arrayidx5 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom
  %arrayidx6 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 1
  %4 = bitcast %struct.COMPLEX* %arrayidx6 to i64*
  %5 = bitcast %struct.COMPLEX* %arrayidx5 to i64*
  %6 = load i64, i64* %4, align 4
  store i64 %6, i64* %5, align 4
  %add.ptr7 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 2
  %add.ptr10 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idx.ext9
  %7 = bitcast %struct.COMPLEX* %add.ptr7 to i64*
  %8 = bitcast %struct.COMPLEX* %add.ptr10 to i64*
  %9 = load i64, i64* %7, align 4
  store i64 %9, i64* %8, align 4
  %arrayidx14 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr10, i64 %idxprom
  %arrayidx15 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 3
  %10 = bitcast %struct.COMPLEX* %arrayidx15 to i64*
  %11 = bitcast %struct.COMPLEX* %arrayidx14 to i64*
  %12 = load i64, i64* %10, align 4
  store i64 %12, i64* %11, align 4
  %add.ptr16 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 4
  %add.ptr19 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr10, i64 %idx.ext9
  %13 = bitcast %struct.COMPLEX* %add.ptr16 to i64*
  %14 = bitcast %struct.COMPLEX* %add.ptr19 to i64*
  %15 = load i64, i64* %13, align 4
  store i64 %15, i64* %14, align 4
  %arrayidx23 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr19, i64 %idxprom
  %arrayidx24 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 5
  %16 = bitcast %struct.COMPLEX* %arrayidx24 to i64*
  %17 = bitcast %struct.COMPLEX* %arrayidx23 to i64*
  %18 = load i64, i64* %16, align 4
  store i64 %18, i64* %17, align 4
  %add.ptr25 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 6
  %add.ptr28 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr19, i64 %idx.ext9
  %19 = bitcast %struct.COMPLEX* %add.ptr25 to i64*
  %20 = bitcast %struct.COMPLEX* %add.ptr28 to i64*
  %21 = load i64, i64* %19, align 4
  store i64 %21, i64* %20, align 4
  %arrayidx32 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr28, i64 %idxprom
  %arrayidx33 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 7
  %22 = bitcast %struct.COMPLEX* %arrayidx33 to i64*
  %23 = bitcast %struct.COMPLEX* %arrayidx32 to i64*
  %24 = load i64, i64* %22, align 4
  store i64 %24, i64* %23, align 4
  %add.ptr34 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 8
  %add.ptr37 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr28, i64 %idx.ext9
  %25 = bitcast %struct.COMPLEX* %add.ptr34 to i64*
  %26 = bitcast %struct.COMPLEX* %add.ptr37 to i64*
  %27 = load i64, i64* %25, align 4
  store i64 %27, i64* %26, align 4
  %arrayidx41 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr37, i64 %idxprom
  %arrayidx42 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 9
  %28 = bitcast %struct.COMPLEX* %arrayidx42 to i64*
  %29 = bitcast %struct.COMPLEX* %arrayidx41 to i64*
  %30 = load i64, i64* %28, align 4
  store i64 %30, i64* %29, align 4
  %add.ptr43 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 10
  %add.ptr46 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr37, i64 %idx.ext9
  %31 = bitcast %struct.COMPLEX* %add.ptr43 to i64*
  %32 = bitcast %struct.COMPLEX* %add.ptr46 to i64*
  %33 = load i64, i64* %31, align 4
  store i64 %33, i64* %32, align 4
  %arrayidx50 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr46, i64 %idxprom
  %arrayidx51 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 11
  %34 = bitcast %struct.COMPLEX* %arrayidx51 to i64*
  %35 = bitcast %struct.COMPLEX* %arrayidx50 to i64*
  %36 = load i64, i64* %34, align 4
  store i64 %36, i64* %35, align 4
  %add.ptr52 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 12
  %add.ptr55 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr46, i64 %idx.ext9
  %37 = bitcast %struct.COMPLEX* %add.ptr52 to i64*
  %38 = bitcast %struct.COMPLEX* %add.ptr55 to i64*
  %39 = load i64, i64* %37, align 4
  store i64 %39, i64* %38, align 4
  %arrayidx59 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr55, i64 %idxprom
  %arrayidx60 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 13
  %40 = bitcast %struct.COMPLEX* %arrayidx60 to i64*
  %41 = bitcast %struct.COMPLEX* %arrayidx59 to i64*
  %42 = load i64, i64* %40, align 4
  store i64 %42, i64* %41, align 4
  %add.ptr61 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 14
  %add.ptr64 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr55, i64 %idx.ext9
  %43 = bitcast %struct.COMPLEX* %add.ptr61 to i64*
  %44 = bitcast %struct.COMPLEX* %add.ptr64 to i64*
  %45 = load i64, i64* %43, align 4
  store i64 %45, i64* %44, align 4
  %arrayidx68 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr64, i64 %idxprom
  %arrayidx69 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 15
  %46 = bitcast %struct.COMPLEX* %arrayidx69 to i64*
  %47 = bitcast %struct.COMPLEX* %arrayidx68 to i64*
  %48 = load i64, i64* %46, align 4
  store i64 %48, i64* %47, align 4
  %add.ptr70 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.0156, i64 16
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %cleanup, label %for.body, !llvm.loop !49

if.end:                                           ; preds = %entry, %det.cont
  %a.tr154 = phi i32 [ %div, %det.cont ], [ %a, %entry ]
  %add = add nsw i32 %a.tr154, %b
  %div = sdiv i32 %add, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @fft_unshuffle_16(i32 noundef %a.tr154, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %sub = sub nsw i32 %b, %div
  %cmp = icmp slt i32 %sub, 128
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !50

cleanup:                                          ; preds = %for.body, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_unshuffle_8(i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub84 = sub nsw i32 %b, %a
  %cmp85 = icmp slt i32 %sub84, 128
  br i1 %cmp85, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %div, %det.cont ]
  %cmp187 = icmp slt i32 %a.tr.lcssa, %b
  br i1 %cmp187, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.then
  %mul = shl nsw i32 %a.tr.lcssa, 3
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %idx.ext
  %idxprom = sext i32 %m to i64
  %mul8 = shl nsw i32 %m, 1
  %idx.ext9 = sext i32 %mul8 to i64
  %0 = sext i32 %a.tr.lcssa to i64
  %wide.trip.count = sext i32 %b to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv = phi i64 [ %0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %ip.088 = phi %struct.COMPLEX* [ %add.ptr, %for.body.lr.ph ], [ %add.ptr34, %for.body ]
  %add.ptr3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv
  %1 = bitcast %struct.COMPLEX* %ip.088 to i64*
  %2 = bitcast %struct.COMPLEX* %add.ptr3 to i64*
  %3 = load i64, i64* %1, align 4
  store i64 %3, i64* %2, align 4
  %arrayidx5 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom
  %arrayidx6 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.088, i64 1
  %4 = bitcast %struct.COMPLEX* %arrayidx6 to i64*
  %5 = bitcast %struct.COMPLEX* %arrayidx5 to i64*
  %6 = load i64, i64* %4, align 4
  store i64 %6, i64* %5, align 4
  %add.ptr7 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.088, i64 2
  %add.ptr10 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idx.ext9
  %7 = bitcast %struct.COMPLEX* %add.ptr7 to i64*
  %8 = bitcast %struct.COMPLEX* %add.ptr10 to i64*
  %9 = load i64, i64* %7, align 4
  store i64 %9, i64* %8, align 4
  %arrayidx14 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr10, i64 %idxprom
  %arrayidx15 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.088, i64 3
  %10 = bitcast %struct.COMPLEX* %arrayidx15 to i64*
  %11 = bitcast %struct.COMPLEX* %arrayidx14 to i64*
  %12 = load i64, i64* %10, align 4
  store i64 %12, i64* %11, align 4
  %add.ptr16 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.088, i64 4
  %add.ptr19 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr10, i64 %idx.ext9
  %13 = bitcast %struct.COMPLEX* %add.ptr16 to i64*
  %14 = bitcast %struct.COMPLEX* %add.ptr19 to i64*
  %15 = load i64, i64* %13, align 4
  store i64 %15, i64* %14, align 4
  %arrayidx23 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr19, i64 %idxprom
  %arrayidx24 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.088, i64 5
  %16 = bitcast %struct.COMPLEX* %arrayidx24 to i64*
  %17 = bitcast %struct.COMPLEX* %arrayidx23 to i64*
  %18 = load i64, i64* %16, align 4
  store i64 %18, i64* %17, align 4
  %add.ptr25 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.088, i64 6
  %add.ptr28 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr19, i64 %idx.ext9
  %19 = bitcast %struct.COMPLEX* %add.ptr25 to i64*
  %20 = bitcast %struct.COMPLEX* %add.ptr28 to i64*
  %21 = load i64, i64* %19, align 4
  store i64 %21, i64* %20, align 4
  %arrayidx32 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr28, i64 %idxprom
  %arrayidx33 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.088, i64 7
  %22 = bitcast %struct.COMPLEX* %arrayidx33 to i64*
  %23 = bitcast %struct.COMPLEX* %arrayidx32 to i64*
  %24 = load i64, i64* %22, align 4
  store i64 %24, i64* %23, align 4
  %add.ptr34 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.088, i64 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %cleanup, label %for.body, !llvm.loop !51

if.end:                                           ; preds = %entry, %det.cont
  %a.tr86 = phi i32 [ %div, %det.cont ], [ %a, %entry ]
  %add = add nsw i32 %a.tr86, %b
  %div = sdiv i32 %add, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @fft_unshuffle_8(i32 noundef %a.tr86, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %sub = sub nsw i32 %b, %div
  %cmp = icmp slt i32 %sub, 128
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !52

cleanup:                                          ; preds = %for.body, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_unshuffle_4(i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub50 = sub nsw i32 %b, %a
  %cmp51 = icmp slt i32 %sub50, 128
  br i1 %cmp51, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %div, %det.cont ]
  %cmp153 = icmp slt i32 %a.tr.lcssa, %b
  br i1 %cmp153, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.then
  %mul = shl nsw i32 %a.tr.lcssa, 2
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %idx.ext
  %idxprom = sext i32 %m to i64
  %mul8 = shl nsw i32 %m, 1
  %idx.ext9 = sext i32 %mul8 to i64
  %0 = sext i32 %a.tr.lcssa to i64
  %wide.trip.count = sext i32 %b to i64
  %1 = sub nsw i64 %wide.trip.count, %0
  %2 = xor i64 %0, -1
  %xtraiter = and i64 %1, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.lr.ph
  %add.ptr3.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %0
  %3 = bitcast %struct.COMPLEX* %add.ptr to i64*
  %4 = bitcast %struct.COMPLEX* %add.ptr3.prol to i64*
  %5 = load i64, i64* %3, align 4
  store i64 %5, i64* %4, align 4
  %arrayidx5.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3.prol, i64 %idxprom
  %arrayidx6.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr, i64 1
  %6 = bitcast %struct.COMPLEX* %arrayidx6.prol to i64*
  %7 = bitcast %struct.COMPLEX* %arrayidx5.prol to i64*
  %8 = load i64, i64* %6, align 4
  store i64 %8, i64* %7, align 4
  %add.ptr7.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr, i64 2
  %add.ptr10.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3.prol, i64 %idx.ext9
  %9 = bitcast %struct.COMPLEX* %add.ptr7.prol to i64*
  %10 = bitcast %struct.COMPLEX* %add.ptr10.prol to i64*
  %11 = load i64, i64* %9, align 4
  store i64 %11, i64* %10, align 4
  %arrayidx14.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr10.prol, i64 %idxprom
  %arrayidx15.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr, i64 3
  %12 = bitcast %struct.COMPLEX* %arrayidx15.prol to i64*
  %13 = bitcast %struct.COMPLEX* %arrayidx14.prol to i64*
  %14 = load i64, i64* %12, align 4
  store i64 %14, i64* %13, align 4
  %add.ptr16.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr, i64 4
  %indvars.iv.next.prol = add nsw i64 %0, 1
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.prol, %for.body.lr.ph
  %indvars.iv.unr = phi i64 [ %0, %for.body.lr.ph ], [ %indvars.iv.next.prol, %for.body.prol ]
  %ip.054.unr = phi %struct.COMPLEX* [ %add.ptr, %for.body.lr.ph ], [ %add.ptr16.prol, %for.body.prol ]
  %15 = sub nsw i64 0, %wide.trip.count
  %16 = icmp eq i64 %2, %15
  br i1 %16, label %cleanup, label %for.body

for.body:                                         ; preds = %for.body.prol.loopexit, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body ], [ %indvars.iv.unr, %for.body.prol.loopexit ]
  %ip.054 = phi %struct.COMPLEX* [ %add.ptr16.1, %for.body ], [ %ip.054.unr, %for.body.prol.loopexit ]
  %add.ptr3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv
  %17 = bitcast %struct.COMPLEX* %ip.054 to i64*
  %18 = bitcast %struct.COMPLEX* %add.ptr3 to i64*
  %19 = load i64, i64* %17, align 4
  store i64 %19, i64* %18, align 4
  %arrayidx5 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom
  %arrayidx6 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.054, i64 1
  %20 = bitcast %struct.COMPLEX* %arrayidx6 to i64*
  %21 = bitcast %struct.COMPLEX* %arrayidx5 to i64*
  %22 = load i64, i64* %20, align 4
  store i64 %22, i64* %21, align 4
  %add.ptr7 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.054, i64 2
  %add.ptr10 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idx.ext9
  %23 = bitcast %struct.COMPLEX* %add.ptr7 to i64*
  %24 = bitcast %struct.COMPLEX* %add.ptr10 to i64*
  %25 = load i64, i64* %23, align 4
  store i64 %25, i64* %24, align 4
  %arrayidx14 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr10, i64 %idxprom
  %arrayidx15 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.054, i64 3
  %26 = bitcast %struct.COMPLEX* %arrayidx15 to i64*
  %27 = bitcast %struct.COMPLEX* %arrayidx14 to i64*
  %28 = load i64, i64* %26, align 4
  store i64 %28, i64* %27, align 4
  %add.ptr16 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.054, i64 4
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %add.ptr3.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv.next
  %29 = bitcast %struct.COMPLEX* %add.ptr16 to i64*
  %30 = bitcast %struct.COMPLEX* %add.ptr3.1 to i64*
  %31 = load i64, i64* %29, align 4
  store i64 %31, i64* %30, align 4
  %arrayidx5.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3.1, i64 %idxprom
  %arrayidx6.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.054, i64 5
  %32 = bitcast %struct.COMPLEX* %arrayidx6.1 to i64*
  %33 = bitcast %struct.COMPLEX* %arrayidx5.1 to i64*
  %34 = load i64, i64* %32, align 4
  store i64 %34, i64* %33, align 4
  %add.ptr7.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.054, i64 6
  %add.ptr10.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3.1, i64 %idx.ext9
  %35 = bitcast %struct.COMPLEX* %add.ptr7.1 to i64*
  %36 = bitcast %struct.COMPLEX* %add.ptr10.1 to i64*
  %37 = load i64, i64* %35, align 4
  store i64 %37, i64* %36, align 4
  %arrayidx14.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr10.1, i64 %idxprom
  %arrayidx15.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.054, i64 7
  %38 = bitcast %struct.COMPLEX* %arrayidx15.1 to i64*
  %39 = bitcast %struct.COMPLEX* %arrayidx14.1 to i64*
  %40 = load i64, i64* %38, align 4
  store i64 %40, i64* %39, align 4
  %add.ptr16.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.054, i64 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.not.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.not.1, label %cleanup, label %for.body, !llvm.loop !53

if.end:                                           ; preds = %entry, %det.cont
  %a.tr52 = phi i32 [ %div, %det.cont ], [ %a, %entry ]
  %add = add nsw i32 %a.tr52, %b
  %div = sdiv i32 %add, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @fft_unshuffle_4(i32 noundef %a.tr52, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %sub = sub nsw i32 %b, %div
  %cmp = icmp slt i32 %sub, 128
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !54

cleanup:                                          ; preds = %for.body.prol.loopexit, %for.body, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_unshuffle_2(i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub33 = sub nsw i32 %b, %a
  %cmp34 = icmp slt i32 %sub33, 128
  br i1 %cmp34, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %div, %det.cont ]
  %cmp136 = icmp slt i32 %a.tr.lcssa, %b
  br i1 %cmp136, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.then
  %mul = shl nsw i32 %a.tr.lcssa, 1
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr %struct.COMPLEX, %struct.COMPLEX* %in, i64 %idx.ext
  %idxprom = sext i32 %m to i64
  %0 = sext i32 %a.tr.lcssa to i64
  %wide.trip.count = sext i32 %b to i64
  %1 = sub nsw i64 %wide.trip.count, %0
  %min.iters.check = icmp ult i64 %1, 4
  br i1 %min.iters.check, label %for.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.lr.ph
  %scevgep = getelementptr %struct.COMPLEX, %struct.COMPLEX* %out, i64 %0
  %scevgep41 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %out, i64 %wide.trip.count
  %2 = add nsw i64 %0, %idxprom
  %scevgep43 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %out, i64 %2
  %3 = add nsw i64 %idxprom, %wide.trip.count
  %scevgep45 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %out, i64 %3
  %4 = shl nsw i64 %wide.trip.count, 1
  %5 = add nsw i64 %4, %idx.ext
  %6 = shl nsw i64 %0, 1
  %7 = xor i64 %6, -1
  %8 = add nsw i64 %5, %7
  %scevgep48 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %in, i64 %8
  %9 = or i64 %idx.ext, 1
  %scevgep50 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %in, i64 %9
  %10 = sub nsw i64 %5, %6
  %scevgep52 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %in, i64 %10
  %bound0 = icmp ult %struct.COMPLEX* %scevgep, %scevgep45
  %bound1 = icmp ult %struct.COMPLEX* %scevgep43, %scevgep41
  %found.conflict = and i1 %bound0, %bound1
  %bound054 = icmp ult %struct.COMPLEX* %scevgep, %scevgep48
  %bound155 = icmp ult %struct.COMPLEX* %add.ptr, %scevgep41
  %found.conflict56 = and i1 %bound054, %bound155
  %conflict.rdx = or i1 %found.conflict, %found.conflict56
  %bound057 = icmp ult %struct.COMPLEX* %scevgep, %scevgep52
  %bound158 = icmp ult %struct.COMPLEX* %scevgep50, %scevgep41
  %found.conflict59 = and i1 %bound057, %bound158
  %conflict.rdx60 = or i1 %conflict.rdx, %found.conflict59
  %bound061 = icmp ult %struct.COMPLEX* %scevgep43, %scevgep48
  %bound162 = icmp ult %struct.COMPLEX* %add.ptr, %scevgep45
  %found.conflict63 = and i1 %bound061, %bound162
  %conflict.rdx64 = or i1 %conflict.rdx60, %found.conflict63
  %bound065 = icmp ult %struct.COMPLEX* %scevgep43, %scevgep52
  %bound166 = icmp ult %struct.COMPLEX* %scevgep50, %scevgep45
  %found.conflict67 = and i1 %bound065, %bound166
  %conflict.rdx68 = or i1 %conflict.rdx64, %found.conflict67
  br i1 %conflict.rdx68, label %for.body.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %1, -4
  %ind.end = add nsw i64 %n.vec, %0
  %11 = shl nsw i64 %n.vec, 1
  %ind.end70 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %add.ptr, i64 %11
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = add i64 %index, %0
  %12 = shl i64 %index, 1
  %next.gep = getelementptr %struct.COMPLEX, %struct.COMPLEX* %add.ptr, i64 %12
  %13 = or i64 %12, 4
  %next.gep71 = getelementptr %struct.COMPLEX, %struct.COMPLEX* %add.ptr, i64 %13
  %14 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %offset.idx
  %15 = bitcast %struct.COMPLEX* %next.gep to <4 x i64>*
  %16 = bitcast %struct.COMPLEX* %next.gep71 to <4 x i64>*
  %wide.vec = load <4 x i64>, <4 x i64>* %15, align 4
  %wide.vec72 = load <4 x i64>, <4 x i64>* %16, align 4
  %strided.vec = shufflevector <4 x i64> %wide.vec, <4 x i64> poison, <2 x i32> <i32 0, i32 2>
  %strided.vec73 = shufflevector <4 x i64> %wide.vec72, <4 x i64> poison, <2 x i32> <i32 0, i32 2>
  %strided.vec74 = shufflevector <4 x i64> %wide.vec, <4 x i64> poison, <2 x i32> <i32 1, i32 3>
  %strided.vec75 = shufflevector <4 x i64> %wide.vec72, <4 x i64> poison, <2 x i32> <i32 1, i32 3>
  %17 = bitcast %struct.COMPLEX* %14 to <2 x i64>*
  store <2 x i64> %strided.vec, <2 x i64>* %17, align 4, !alias.scope !55, !noalias !58
  %18 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %14, i64 2
  %19 = bitcast %struct.COMPLEX* %18 to <2 x i64>*
  store <2 x i64> %strided.vec73, <2 x i64>* %19, align 4, !alias.scope !55, !noalias !58
  %20 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %14, i64 %idxprom
  %21 = bitcast %struct.COMPLEX* %20 to <2 x i64>*
  store <2 x i64> %strided.vec74, <2 x i64>* %21, align 4, !alias.scope !62, !noalias !63
  %22 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %20, i64 2
  %23 = bitcast %struct.COMPLEX* %22 to <2 x i64>*
  store <2 x i64> %strided.vec75, <2 x i64>* %23, align 4, !alias.scope !62, !noalias !63
  %index.next = add nuw i64 %index, 4
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !64

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %1, %n.vec
  br i1 %cmp.n, label %cleanup, label %for.body.preheader

for.body.preheader:                               ; preds = %vector.memcheck, %for.body.lr.ph, %middle.block
  %indvars.iv.ph = phi i64 [ %0, %vector.memcheck ], [ %0, %for.body.lr.ph ], [ %ind.end, %middle.block ]
  %ip.037.ph = phi %struct.COMPLEX* [ %add.ptr, %vector.memcheck ], [ %add.ptr, %for.body.lr.ph ], [ %ind.end70, %middle.block ]
  %25 = sub nsw i64 %wide.trip.count, %indvars.iv.ph
  %26 = xor i64 %indvars.iv.ph, -1
  %27 = add nsw i64 %26, %wide.trip.count
  %xtraiter = and i64 %25, 3
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader, %for.body.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body.prol ], [ %indvars.iv.ph, %for.body.preheader ]
  %ip.037.prol = phi %struct.COMPLEX* [ %add.ptr7.prol, %for.body.prol ], [ %ip.037.ph, %for.body.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body.prol ], [ 0, %for.body.preheader ]
  %add.ptr3.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv.prol
  %28 = bitcast %struct.COMPLEX* %ip.037.prol to i64*
  %29 = bitcast %struct.COMPLEX* %add.ptr3.prol to i64*
  %30 = load i64, i64* %28, align 4
  store i64 %30, i64* %29, align 4
  %arrayidx5.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3.prol, i64 %idxprom
  %arrayidx6.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.037.prol, i64 1
  %31 = bitcast %struct.COMPLEX* %arrayidx6.prol to i64*
  %32 = bitcast %struct.COMPLEX* %arrayidx5.prol to i64*
  %33 = load i64, i64* %31, align 4
  store i64 %33, i64* %32, align 4
  %add.ptr7.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.037.prol, i64 2
  %indvars.iv.next.prol = add nsw i64 %indvars.iv.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter
  br i1 %prol.iter.cmp.not, label %for.body.prol.loopexit, label %for.body.prol, !llvm.loop !65

for.body.prol.loopexit:                           ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body.preheader ], [ %indvars.iv.next.prol, %for.body.prol ]
  %ip.037.unr = phi %struct.COMPLEX* [ %ip.037.ph, %for.body.preheader ], [ %add.ptr7.prol, %for.body.prol ]
  %34 = icmp ult i64 %27, 3
  br i1 %34, label %cleanup, label %for.body

for.body:                                         ; preds = %for.body.prol.loopexit, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body ], [ %indvars.iv.unr, %for.body.prol.loopexit ]
  %ip.037 = phi %struct.COMPLEX* [ %add.ptr7.3, %for.body ], [ %ip.037.unr, %for.body.prol.loopexit ]
  %add.ptr3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv
  %35 = bitcast %struct.COMPLEX* %ip.037 to i64*
  %36 = bitcast %struct.COMPLEX* %add.ptr3 to i64*
  %37 = load i64, i64* %35, align 4
  store i64 %37, i64* %36, align 4
  %arrayidx5 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom
  %arrayidx6 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.037, i64 1
  %38 = bitcast %struct.COMPLEX* %arrayidx6 to i64*
  %39 = bitcast %struct.COMPLEX* %arrayidx5 to i64*
  %40 = load i64, i64* %38, align 4
  store i64 %40, i64* %39, align 4
  %add.ptr7 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.037, i64 2
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %add.ptr3.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv.next
  %41 = bitcast %struct.COMPLEX* %add.ptr7 to i64*
  %42 = bitcast %struct.COMPLEX* %add.ptr3.1 to i64*
  %43 = load i64, i64* %41, align 4
  store i64 %43, i64* %42, align 4
  %arrayidx5.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3.1, i64 %idxprom
  %arrayidx6.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.037, i64 3
  %44 = bitcast %struct.COMPLEX* %arrayidx6.1 to i64*
  %45 = bitcast %struct.COMPLEX* %arrayidx5.1 to i64*
  %46 = load i64, i64* %44, align 4
  store i64 %46, i64* %45, align 4
  %add.ptr7.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.037, i64 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %add.ptr3.2 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv.next.1
  %47 = bitcast %struct.COMPLEX* %add.ptr7.1 to i64*
  %48 = bitcast %struct.COMPLEX* %add.ptr3.2 to i64*
  %49 = load i64, i64* %47, align 4
  store i64 %49, i64* %48, align 4
  %arrayidx5.2 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3.2, i64 %idxprom
  %arrayidx6.2 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.037, i64 5
  %50 = bitcast %struct.COMPLEX* %arrayidx6.2 to i64*
  %51 = bitcast %struct.COMPLEX* %arrayidx5.2 to i64*
  %52 = load i64, i64* %50, align 4
  store i64 %52, i64* %51, align 4
  %add.ptr7.2 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.037, i64 6
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %add.ptr3.3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv.next.2
  %53 = bitcast %struct.COMPLEX* %add.ptr7.2 to i64*
  %54 = bitcast %struct.COMPLEX* %add.ptr3.3 to i64*
  %55 = load i64, i64* %53, align 4
  store i64 %55, i64* %54, align 4
  %arrayidx5.3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3.3, i64 %idxprom
  %arrayidx6.3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.037, i64 7
  %56 = bitcast %struct.COMPLEX* %arrayidx6.3 to i64*
  %57 = bitcast %struct.COMPLEX* %arrayidx5.3 to i64*
  %58 = load i64, i64* %56, align 4
  store i64 %58, i64* %57, align 4
  %add.ptr7.3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.037, i64 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.not.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count
  br i1 %exitcond.not.3, label %cleanup, label %for.body, !llvm.loop !66

if.end:                                           ; preds = %entry, %det.cont
  %a.tr35 = phi i32 [ %div, %det.cont ], [ %a, %entry ]
  %add = add nsw i32 %a.tr35, %b
  %div = sdiv i32 %add, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @fft_unshuffle_2(i32 noundef %a.tr35, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %sub = sub nsw i32 %b, %div
  %cmp = icmp slt i32 %sub, 128
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !67

cleanup:                                          ; preds = %for.body.prol.loopexit, %for.body, %middle.block, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @unshuffle(i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %r, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub82 = sub nsw i32 %b, %a
  %cmp83 = icmp slt i32 %sub82, 16
  br i1 %cmp83, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %div, %det.cont ]
  %and.le = and i32 %r, -4
  %mul = mul nsw i32 %a.tr.lcssa, %r
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %idx.ext
  %cmp197 = icmp slt i32 %a.tr.lcssa, %b
  br i1 %cmp197, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.then
  %cmp585 = icmp sgt i32 %and.le, 0
  %idxprom = sext i32 %m to i64
  %mul10 = shl nsw i32 %m, 1
  %idxprom11 = sext i32 %mul10 to i64
  %mul14 = mul nsw i32 %m, 3
  %idxprom15 = sext i32 %mul14 to i64
  %mul18 = shl nsw i32 %m, 2
  %idx.ext19 = sext i32 %mul18 to i64
  br i1 %cmp585, label %for.body.us.preheader, label %for.body.lr.ph.split

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %0 = sext i32 %a.tr.lcssa to i64
  %wide.trip.count128 = sext i32 %b to i64
  %cmp2392.us = icmp slt i32 %and.le, %r
  %1 = add i32 %and.le, -1
  %2 = lshr i32 %1, 2
  %3 = add nuw nsw i32 %2, 1
  %4 = and i32 %r, 3
  %5 = xor i32 %and.le, -1
  %6 = add i32 %5, %r
  %xtraiter135 = and i32 %3, 1
  %7 = icmp eq i32 %1, 3
  %unroll_iter140 = and i32 %3, 2147483646
  %lcmp.mod137.not = icmp eq i32 %xtraiter135, 0
  %lcmp.mod143.not = icmp eq i32 %4, 0
  %8 = icmp ult i32 %6, 7
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.inc29.us
  %indvars.iv125 = phi i64 [ %0, %for.body.us.preheader ], [ %indvars.iv.next126, %for.inc29.us ]
  %ip.098.us = phi %struct.COMPLEX* [ %add.ptr, %for.body.us.preheader ], [ %ip.2.lcssa.us, %for.inc29.us ]
  %add.ptr3.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv125
  br i1 %7, label %for.cond4.for.cond22.preheader_crit_edge.us.unr-lcssa, label %for.body6.us

for.inc29.us:                                     ; preds = %for.body24.us.prol.loopexit, %for.body24.us, %for.cond4.for.cond22.preheader_crit_edge.us
  %ip.2.lcssa.us = phi %struct.COMPLEX* [ %add.ptr21.us.lcssa, %for.cond4.for.cond22.preheader_crit_edge.us ], [ %incdec.ptr.us.lcssa.unr, %for.body24.us.prol.loopexit ], [ %incdec.ptr.us.7, %for.body24.us ]
  %indvars.iv.next126 = add nsw i64 %indvars.iv125, 1
  %exitcond129.not = icmp eq i64 %indvars.iv.next126, %wide.trip.count128
  br i1 %exitcond129.not, label %cleanup, label %for.body.us, !llvm.loop !68

for.body24.us:                                    ; preds = %for.body24.us.prol.loopexit, %for.body24.us
  %jp.195.us = phi %struct.COMPLEX* [ %add.ptr26.us.7, %for.body24.us ], [ %jp.195.us.unr, %for.body24.us.prol.loopexit ]
  %ip.294.us = phi %struct.COMPLEX* [ %incdec.ptr.us.7, %for.body24.us ], [ %ip.294.us.unr, %for.body24.us.prol.loopexit ]
  %j.193.us = phi i32 [ %inc.us.7, %for.body24.us ], [ %j.193.us.unr, %for.body24.us.prol.loopexit ]
  %9 = bitcast %struct.COMPLEX* %ip.294.us to i64*
  %10 = bitcast %struct.COMPLEX* %jp.195.us to i64*
  %11 = load i64, i64* %9, align 4
  store i64 %11, i64* %10, align 4
  %incdec.ptr.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us, i64 1
  %add.ptr26.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.195.us, i64 %idxprom
  %12 = bitcast %struct.COMPLEX* %incdec.ptr.us to i64*
  %13 = bitcast %struct.COMPLEX* %add.ptr26.us to i64*
  %14 = load i64, i64* %12, align 4
  store i64 %14, i64* %13, align 4
  %incdec.ptr.us.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us, i64 2
  %add.ptr26.us.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us, i64 %idxprom
  %15 = bitcast %struct.COMPLEX* %incdec.ptr.us.1 to i64*
  %16 = bitcast %struct.COMPLEX* %add.ptr26.us.1 to i64*
  %17 = load i64, i64* %15, align 4
  store i64 %17, i64* %16, align 4
  %incdec.ptr.us.2 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us, i64 3
  %add.ptr26.us.2 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us.1, i64 %idxprom
  %18 = bitcast %struct.COMPLEX* %incdec.ptr.us.2 to i64*
  %19 = bitcast %struct.COMPLEX* %add.ptr26.us.2 to i64*
  %20 = load i64, i64* %18, align 4
  store i64 %20, i64* %19, align 4
  %incdec.ptr.us.3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us, i64 4
  %add.ptr26.us.3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us.2, i64 %idxprom
  %21 = bitcast %struct.COMPLEX* %incdec.ptr.us.3 to i64*
  %22 = bitcast %struct.COMPLEX* %add.ptr26.us.3 to i64*
  %23 = load i64, i64* %21, align 4
  store i64 %23, i64* %22, align 4
  %incdec.ptr.us.4 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us, i64 5
  %add.ptr26.us.4 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us.3, i64 %idxprom
  %24 = bitcast %struct.COMPLEX* %incdec.ptr.us.4 to i64*
  %25 = bitcast %struct.COMPLEX* %add.ptr26.us.4 to i64*
  %26 = load i64, i64* %24, align 4
  store i64 %26, i64* %25, align 4
  %incdec.ptr.us.5 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us, i64 6
  %add.ptr26.us.5 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us.4, i64 %idxprom
  %27 = bitcast %struct.COMPLEX* %incdec.ptr.us.5 to i64*
  %28 = bitcast %struct.COMPLEX* %add.ptr26.us.5 to i64*
  %29 = load i64, i64* %27, align 4
  store i64 %29, i64* %28, align 4
  %incdec.ptr.us.6 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us, i64 7
  %add.ptr26.us.6 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us.5, i64 %idxprom
  %30 = bitcast %struct.COMPLEX* %incdec.ptr.us.6 to i64*
  %31 = bitcast %struct.COMPLEX* %add.ptr26.us.6 to i64*
  %32 = load i64, i64* %30, align 4
  store i64 %32, i64* %31, align 4
  %incdec.ptr.us.7 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us, i64 8
  %add.ptr26.us.7 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us.6, i64 %idxprom
  %inc.us.7 = add nuw nsw i32 %j.193.us, 8
  %exitcond124.not.7 = icmp eq i32 %inc.us.7, %r
  br i1 %exitcond124.not.7, label %for.inc29.us, label %for.body24.us, !llvm.loop !69

for.body6.us:                                     ; preds = %for.body.us, %for.body6.us
  %jp.088.us = phi %struct.COMPLEX* [ %add.ptr20.us.1, %for.body6.us ], [ %add.ptr3.us, %for.body.us ]
  %ip.187.us = phi %struct.COMPLEX* [ %add.ptr21.us.1, %for.body6.us ], [ %ip.098.us, %for.body.us ]
  %niter141 = phi i32 [ %niter141.next.1, %for.body6.us ], [ 0, %for.body.us ]
  %33 = bitcast %struct.COMPLEX* %ip.187.us to i64*
  %34 = bitcast %struct.COMPLEX* %jp.088.us to i64*
  %35 = load i64, i64* %33, align 4
  store i64 %35, i64* %34, align 4
  %arrayidx8.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.088.us, i64 %idxprom
  %arrayidx9.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us, i64 1
  %36 = bitcast %struct.COMPLEX* %arrayidx9.us to i64*
  %37 = bitcast %struct.COMPLEX* %arrayidx8.us to i64*
  %38 = load i64, i64* %36, align 4
  store i64 %38, i64* %37, align 4
  %arrayidx12.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.088.us, i64 %idxprom11
  %arrayidx13.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us, i64 2
  %39 = bitcast %struct.COMPLEX* %arrayidx13.us to i64*
  %40 = bitcast %struct.COMPLEX* %arrayidx12.us to i64*
  %41 = load i64, i64* %39, align 4
  store i64 %41, i64* %40, align 4
  %arrayidx16.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.088.us, i64 %idxprom15
  %arrayidx17.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us, i64 3
  %42 = bitcast %struct.COMPLEX* %arrayidx17.us to i64*
  %43 = bitcast %struct.COMPLEX* %arrayidx16.us to i64*
  %44 = load i64, i64* %42, align 4
  store i64 %44, i64* %43, align 4
  %add.ptr20.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.088.us, i64 %idx.ext19
  %add.ptr21.us = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us, i64 4
  %45 = bitcast %struct.COMPLEX* %add.ptr21.us to i64*
  %46 = bitcast %struct.COMPLEX* %add.ptr20.us to i64*
  %47 = load i64, i64* %45, align 4
  store i64 %47, i64* %46, align 4
  %arrayidx8.us.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr20.us, i64 %idxprom
  %arrayidx9.us.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us, i64 5
  %48 = bitcast %struct.COMPLEX* %arrayidx9.us.1 to i64*
  %49 = bitcast %struct.COMPLEX* %arrayidx8.us.1 to i64*
  %50 = load i64, i64* %48, align 4
  store i64 %50, i64* %49, align 4
  %arrayidx12.us.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr20.us, i64 %idxprom11
  %arrayidx13.us.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us, i64 6
  %51 = bitcast %struct.COMPLEX* %arrayidx13.us.1 to i64*
  %52 = bitcast %struct.COMPLEX* %arrayidx12.us.1 to i64*
  %53 = load i64, i64* %51, align 4
  store i64 %53, i64* %52, align 4
  %arrayidx16.us.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr20.us, i64 %idxprom15
  %arrayidx17.us.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us, i64 7
  %54 = bitcast %struct.COMPLEX* %arrayidx17.us.1 to i64*
  %55 = bitcast %struct.COMPLEX* %arrayidx16.us.1 to i64*
  %56 = load i64, i64* %54, align 4
  store i64 %56, i64* %55, align 4
  %add.ptr20.us.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr20.us, i64 %idx.ext19
  %add.ptr21.us.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us, i64 8
  %niter141.next.1 = add i32 %niter141, 2
  %niter141.ncmp.1.not = icmp eq i32 %niter141.next.1, %unroll_iter140
  br i1 %niter141.ncmp.1.not, label %for.cond4.for.cond22.preheader_crit_edge.us.unr-lcssa, label %for.body6.us, !llvm.loop !70

for.cond4.for.cond22.preheader_crit_edge.us.unr-lcssa: ; preds = %for.body6.us, %for.body.us
  %add.ptr20.us.lcssa.ph = phi %struct.COMPLEX* [ undef, %for.body.us ], [ %add.ptr20.us.1, %for.body6.us ]
  %add.ptr21.us.lcssa.ph = phi %struct.COMPLEX* [ undef, %for.body.us ], [ %add.ptr21.us.1, %for.body6.us ]
  %jp.088.us.unr = phi %struct.COMPLEX* [ %add.ptr3.us, %for.body.us ], [ %add.ptr20.us.1, %for.body6.us ]
  %ip.187.us.unr = phi %struct.COMPLEX* [ %ip.098.us, %for.body.us ], [ %add.ptr21.us.1, %for.body6.us ]
  br i1 %lcmp.mod137.not, label %for.cond4.for.cond22.preheader_crit_edge.us, label %for.body6.us.epil

for.body6.us.epil:                                ; preds = %for.cond4.for.cond22.preheader_crit_edge.us.unr-lcssa
  %57 = bitcast %struct.COMPLEX* %ip.187.us.unr to i64*
  %58 = bitcast %struct.COMPLEX* %jp.088.us.unr to i64*
  %59 = load i64, i64* %57, align 4
  store i64 %59, i64* %58, align 4
  %arrayidx8.us.epil = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.088.us.unr, i64 %idxprom
  %arrayidx9.us.epil = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us.unr, i64 1
  %60 = bitcast %struct.COMPLEX* %arrayidx9.us.epil to i64*
  %61 = bitcast %struct.COMPLEX* %arrayidx8.us.epil to i64*
  %62 = load i64, i64* %60, align 4
  store i64 %62, i64* %61, align 4
  %arrayidx12.us.epil = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.088.us.unr, i64 %idxprom11
  %arrayidx13.us.epil = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us.unr, i64 2
  %63 = bitcast %struct.COMPLEX* %arrayidx13.us.epil to i64*
  %64 = bitcast %struct.COMPLEX* %arrayidx12.us.epil to i64*
  %65 = load i64, i64* %63, align 4
  store i64 %65, i64* %64, align 4
  %arrayidx16.us.epil = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.088.us.unr, i64 %idxprom15
  %arrayidx17.us.epil = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us.unr, i64 3
  %66 = bitcast %struct.COMPLEX* %arrayidx17.us.epil to i64*
  %67 = bitcast %struct.COMPLEX* %arrayidx16.us.epil to i64*
  %68 = load i64, i64* %66, align 4
  store i64 %68, i64* %67, align 4
  %add.ptr20.us.epil = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.088.us.unr, i64 %idx.ext19
  %add.ptr21.us.epil = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.187.us.unr, i64 4
  br label %for.cond4.for.cond22.preheader_crit_edge.us

for.cond4.for.cond22.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond22.preheader_crit_edge.us.unr-lcssa, %for.body6.us.epil
  %add.ptr20.us.lcssa = phi %struct.COMPLEX* [ %add.ptr20.us.lcssa.ph, %for.cond4.for.cond22.preheader_crit_edge.us.unr-lcssa ], [ %add.ptr20.us.epil, %for.body6.us.epil ]
  %add.ptr21.us.lcssa = phi %struct.COMPLEX* [ %add.ptr21.us.lcssa.ph, %for.cond4.for.cond22.preheader_crit_edge.us.unr-lcssa ], [ %add.ptr21.us.epil, %for.body6.us.epil ]
  br i1 %cmp2392.us, label %for.body24.us.preheader, label %for.inc29.us

for.body24.us.preheader:                          ; preds = %for.cond4.for.cond22.preheader_crit_edge.us
  br i1 %lcmp.mod143.not, label %for.body24.us.prol.loopexit, label %for.body24.us.prol

for.body24.us.prol:                               ; preds = %for.body24.us.preheader, %for.body24.us.prol
  %jp.195.us.prol = phi %struct.COMPLEX* [ %add.ptr26.us.prol, %for.body24.us.prol ], [ %add.ptr20.us.lcssa, %for.body24.us.preheader ]
  %ip.294.us.prol = phi %struct.COMPLEX* [ %incdec.ptr.us.prol, %for.body24.us.prol ], [ %add.ptr21.us.lcssa, %for.body24.us.preheader ]
  %j.193.us.prol = phi i32 [ %inc.us.prol, %for.body24.us.prol ], [ %and.le, %for.body24.us.preheader ]
  %prol.iter = phi i32 [ %prol.iter.next, %for.body24.us.prol ], [ 0, %for.body24.us.preheader ]
  %69 = bitcast %struct.COMPLEX* %ip.294.us.prol to i64*
  %70 = bitcast %struct.COMPLEX* %jp.195.us.prol to i64*
  %71 = load i64, i64* %69, align 4
  store i64 %71, i64* %70, align 4
  %incdec.ptr.us.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us.prol, i64 1
  %add.ptr26.us.prol = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.195.us.prol, i64 %idxprom
  %inc.us.prol = add nuw nsw i32 %j.193.us.prol, 1
  %prol.iter.next = add i32 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i32 %prol.iter.next, %4
  br i1 %prol.iter.cmp.not, label %for.body24.us.prol.loopexit, label %for.body24.us.prol, !llvm.loop !71

for.body24.us.prol.loopexit:                      ; preds = %for.body24.us.prol, %for.body24.us.preheader
  %incdec.ptr.us.lcssa.unr = phi %struct.COMPLEX* [ undef, %for.body24.us.preheader ], [ %incdec.ptr.us.prol, %for.body24.us.prol ]
  %jp.195.us.unr = phi %struct.COMPLEX* [ %add.ptr20.us.lcssa, %for.body24.us.preheader ], [ %add.ptr26.us.prol, %for.body24.us.prol ]
  %ip.294.us.unr = phi %struct.COMPLEX* [ %add.ptr21.us.lcssa, %for.body24.us.preheader ], [ %incdec.ptr.us.prol, %for.body24.us.prol ]
  %j.193.us.unr = phi i32 [ %and.le, %for.body24.us.preheader ], [ %inc.us.prol, %for.body24.us.prol ]
  br i1 %8, label %for.inc29.us, label %for.body24.us

for.body.lr.ph.split:                             ; preds = %for.body.lr.ph
  %cmp2392 = icmp sgt i32 %r, 0
  br i1 %cmp2392, label %for.body.us100.preheader, label %cleanup

for.body.us100.preheader:                         ; preds = %for.body.lr.ph.split
  %72 = sext i32 %a.tr.lcssa to i64
  %wide.trip.count = sext i32 %b to i64
  %73 = add i32 %r, -1
  %xtraiter = and i32 %r, 7
  %74 = icmp ult i32 %73, 7
  %unroll_iter = and i32 %r, -8
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br label %for.body.us100

for.body.us100:                                   ; preds = %for.body.us100.preheader, %for.cond22.for.inc29_crit_edge.us118
  %indvars.iv = phi i64 [ %72, %for.body.us100.preheader ], [ %indvars.iv.next, %for.cond22.for.inc29_crit_edge.us118 ]
  %ip.098.us102 = phi %struct.COMPLEX* [ %add.ptr, %for.body.us100.preheader ], [ %incdec.ptr.us113.lcssa, %for.cond22.for.inc29_crit_edge.us118 ]
  %add.ptr3.us104 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %indvars.iv
  br i1 %74, label %for.cond22.for.inc29_crit_edge.us118.unr-lcssa, label %for.body24.us109

for.body24.us109:                                 ; preds = %for.body.us100, %for.body24.us109
  %jp.195.us110 = phi %struct.COMPLEX* [ %add.ptr26.us114.7, %for.body24.us109 ], [ %add.ptr3.us104, %for.body.us100 ]
  %ip.294.us111 = phi %struct.COMPLEX* [ %incdec.ptr.us113.7, %for.body24.us109 ], [ %ip.098.us102, %for.body.us100 ]
  %niter = phi i32 [ %niter.next.7, %for.body24.us109 ], [ 0, %for.body.us100 ]
  %75 = bitcast %struct.COMPLEX* %ip.294.us111 to i64*
  %76 = bitcast %struct.COMPLEX* %jp.195.us110 to i64*
  %77 = load i64, i64* %75, align 4
  store i64 %77, i64* %76, align 4
  %incdec.ptr.us113 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us111, i64 1
  %add.ptr26.us114 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.195.us110, i64 %idxprom
  %78 = bitcast %struct.COMPLEX* %incdec.ptr.us113 to i64*
  %79 = bitcast %struct.COMPLEX* %add.ptr26.us114 to i64*
  %80 = load i64, i64* %78, align 4
  store i64 %80, i64* %79, align 4
  %incdec.ptr.us113.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us111, i64 2
  %add.ptr26.us114.1 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us114, i64 %idxprom
  %81 = bitcast %struct.COMPLEX* %incdec.ptr.us113.1 to i64*
  %82 = bitcast %struct.COMPLEX* %add.ptr26.us114.1 to i64*
  %83 = load i64, i64* %81, align 4
  store i64 %83, i64* %82, align 4
  %incdec.ptr.us113.2 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us111, i64 3
  %add.ptr26.us114.2 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us114.1, i64 %idxprom
  %84 = bitcast %struct.COMPLEX* %incdec.ptr.us113.2 to i64*
  %85 = bitcast %struct.COMPLEX* %add.ptr26.us114.2 to i64*
  %86 = load i64, i64* %84, align 4
  store i64 %86, i64* %85, align 4
  %incdec.ptr.us113.3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us111, i64 4
  %add.ptr26.us114.3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us114.2, i64 %idxprom
  %87 = bitcast %struct.COMPLEX* %incdec.ptr.us113.3 to i64*
  %88 = bitcast %struct.COMPLEX* %add.ptr26.us114.3 to i64*
  %89 = load i64, i64* %87, align 4
  store i64 %89, i64* %88, align 4
  %incdec.ptr.us113.4 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us111, i64 5
  %add.ptr26.us114.4 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us114.3, i64 %idxprom
  %90 = bitcast %struct.COMPLEX* %incdec.ptr.us113.4 to i64*
  %91 = bitcast %struct.COMPLEX* %add.ptr26.us114.4 to i64*
  %92 = load i64, i64* %90, align 4
  store i64 %92, i64* %91, align 4
  %incdec.ptr.us113.5 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us111, i64 6
  %add.ptr26.us114.5 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us114.4, i64 %idxprom
  %93 = bitcast %struct.COMPLEX* %incdec.ptr.us113.5 to i64*
  %94 = bitcast %struct.COMPLEX* %add.ptr26.us114.5 to i64*
  %95 = load i64, i64* %93, align 4
  store i64 %95, i64* %94, align 4
  %incdec.ptr.us113.6 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us111, i64 7
  %add.ptr26.us114.6 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us114.5, i64 %idxprom
  %96 = bitcast %struct.COMPLEX* %incdec.ptr.us113.6 to i64*
  %97 = bitcast %struct.COMPLEX* %add.ptr26.us114.6 to i64*
  %98 = load i64, i64* %96, align 4
  store i64 %98, i64* %97, align 4
  %incdec.ptr.us113.7 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us111, i64 8
  %add.ptr26.us114.7 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr26.us114.6, i64 %idxprom
  %niter.next.7 = add i32 %niter, 8
  %niter.ncmp.7 = icmp eq i32 %niter.next.7, %unroll_iter
  br i1 %niter.ncmp.7, label %for.cond22.for.inc29_crit_edge.us118.unr-lcssa, label %for.body24.us109, !llvm.loop !69

for.cond22.for.inc29_crit_edge.us118.unr-lcssa:   ; preds = %for.body24.us109, %for.body.us100
  %incdec.ptr.us113.lcssa.ph = phi %struct.COMPLEX* [ undef, %for.body.us100 ], [ %incdec.ptr.us113.7, %for.body24.us109 ]
  %jp.195.us110.unr = phi %struct.COMPLEX* [ %add.ptr3.us104, %for.body.us100 ], [ %add.ptr26.us114.7, %for.body24.us109 ]
  %ip.294.us111.unr = phi %struct.COMPLEX* [ %ip.098.us102, %for.body.us100 ], [ %incdec.ptr.us113.7, %for.body24.us109 ]
  br i1 %lcmp.mod.not, label %for.cond22.for.inc29_crit_edge.us118, label %for.body24.us109.epil

for.body24.us109.epil:                            ; preds = %for.cond22.for.inc29_crit_edge.us118.unr-lcssa, %for.body24.us109.epil
  %jp.195.us110.epil = phi %struct.COMPLEX* [ %add.ptr26.us114.epil, %for.body24.us109.epil ], [ %jp.195.us110.unr, %for.cond22.for.inc29_crit_edge.us118.unr-lcssa ]
  %ip.294.us111.epil = phi %struct.COMPLEX* [ %incdec.ptr.us113.epil, %for.body24.us109.epil ], [ %ip.294.us111.unr, %for.cond22.for.inc29_crit_edge.us118.unr-lcssa ]
  %epil.iter = phi i32 [ %epil.iter.next, %for.body24.us109.epil ], [ 0, %for.cond22.for.inc29_crit_edge.us118.unr-lcssa ]
  %99 = bitcast %struct.COMPLEX* %ip.294.us111.epil to i64*
  %100 = bitcast %struct.COMPLEX* %jp.195.us110.epil to i64*
  %101 = load i64, i64* %99, align 4
  store i64 %101, i64* %100, align 4
  %incdec.ptr.us113.epil = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %ip.294.us111.epil, i64 1
  %add.ptr26.us114.epil = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.195.us110.epil, i64 %idxprom
  %epil.iter.next = add i32 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.cond22.for.inc29_crit_edge.us118, label %for.body24.us109.epil, !llvm.loop !72

for.cond22.for.inc29_crit_edge.us118:             ; preds = %for.body24.us109.epil, %for.cond22.for.inc29_crit_edge.us118.unr-lcssa
  %incdec.ptr.us113.lcssa = phi %struct.COMPLEX* [ %incdec.ptr.us113.lcssa.ph, %for.cond22.for.inc29_crit_edge.us118.unr-lcssa ], [ %incdec.ptr.us113.epil, %for.body24.us109.epil ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %exitcond123.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond123.not, label %cleanup, label %for.body.us100, !llvm.loop !68

if.end:                                           ; preds = %entry, %det.cont
  %a.tr84 = phi i32 [ %div, %det.cont ], [ %a, %entry ]
  %add32 = add nsw i32 %a.tr84, %b
  %div = sdiv i32 %add32, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @unshuffle(i32 noundef %a.tr84, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, i32 noundef %r, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %sub = sub nsw i32 %b, %div
  %cmp = icmp slt i32 %sub, 16
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !73

cleanup:                                          ; preds = %for.cond22.for.inc29_crit_edge.us118, %for.inc29.us, %for.body.lr.ph.split, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_twiddle_2(i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nWdn, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub1 = sub nsw i32 %b, %a
  %cmp2 = icmp slt i32 %sub1, 128
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %div, %det.cont ]
  %cmp14 = icmp slt i32 %a.tr.lcssa, %b
  br i1 %cmp14, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.then
  %idx.ext = sext i32 %a.tr.lcssa to i64
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %idx.ext
  %mul = mul i32 %a.tr.lcssa, %nWdn
  %idxprom17 = sext i32 %m to i64
  %0 = sext i32 %mul to i64
  %1 = sext i32 %nWdn to i64
  %wide.trip.count = sext i32 %b to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv8 = phi i64 [ %idx.ext, %for.body.lr.ph ], [ %indvars.iv.next9, %for.body ]
  %indvars.iv = phi i64 [ %0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %kp.05 = phi %struct.COMPLEX* [ %add.ptr, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %add.ptr3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv8
  %re = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 0, i32 0
  %2 = load float, float* %re, align 4, !tbaa !18
  %im = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv8, i32 1
  %3 = load float, float* %im, align 4, !tbaa !21
  %re11 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 0
  %4 = load float, float* %re11, align 4, !tbaa !18
  %im15 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 1
  %5 = load float, float* %im15, align 4, !tbaa !21
  %arrayidx18 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom17
  %re19 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx18, i64 0, i32 0
  %6 = load float, float* %re19, align 4, !tbaa !18
  %im23 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx18, i64 0, i32 1
  %7 = load float, float* %im23, align 4, !tbaa !21
  %8 = fneg float %5
  %neg = fmul float %7, %8
  %9 = tail call float @llvm.fmuladd.f32(float %4, float %6, float %neg)
  %mul27 = fmul float %4, %7
  %10 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %mul27)
  %add = fadd float %2, %9
  %re31 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 0, i32 0
  store float %add, float* %re31, align 4, !tbaa !18
  %add32 = fadd float %3, %10
  %im36 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 0, i32 1
  store float %add32, float* %im36, align 4, !tbaa !21
  %sub37 = fsub float %2, %9
  %re41 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom17, i32 0
  store float %sub37, float* %re41, align 4, !tbaa !18
  %sub42 = fsub float %3, %10
  %im46 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom17, i32 1
  store float %sub42, float* %im46, align 4, !tbaa !21
  %indvars.iv.next9 = add nsw i64 %indvars.iv8, 1
  %indvars.iv.next = add i64 %indvars.iv, %1
  %incdec.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 1
  %exitcond.not = icmp eq i64 %indvars.iv.next9, %wide.trip.count
  br i1 %exitcond.not, label %cleanup, label %for.body, !llvm.loop !74

if.end:                                           ; preds = %entry, %det.cont
  %a.tr3 = phi i32 [ %div, %det.cont ], [ %a, %entry ]
  %add48 = add nsw i32 %a.tr3, %b
  %div = sdiv i32 %add48, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @fft_twiddle_2(i32 noundef %a.tr3, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nWdn, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %sub = sub nsw i32 %b, %div
  %cmp = icmp slt i32 %sub, 128
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !75

cleanup:                                          ; preds = %for.body, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_twiddle_4(i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nWdn, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub1 = sub nsw i32 %b, %a
  %cmp2 = icmp slt i32 %sub1, 128
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %div, %det.cont ]
  %cmp14 = icmp slt i32 %a.tr.lcssa, %b
  br i1 %cmp14, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.then
  %idx.ext = sext i32 %a.tr.lcssa to i64
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %idx.ext
  %mul = mul i32 %a.tr.lcssa, %nWdn
  %mul16 = shl nsw i32 %m, 1
  %idxprom17 = sext i32 %mul16 to i64
  %idxprom40 = sext i32 %m to i64
  %mul60 = mul nsw i32 %m, 3
  %idxprom61 = sext i32 %mul60 to i64
  %0 = sext i32 %mul to i64
  %1 = sext i32 %nWdn to i64
  %wide.trip.count = sext i32 %b to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv10 = phi i64 [ %idx.ext, %for.body.lr.ph ], [ %indvars.iv.next11, %for.body ]
  %indvars.iv = phi i64 [ %0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %kp.05 = phi %struct.COMPLEX* [ %add.ptr, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %indvars12 = trunc i64 %indvars.iv to i32
  %add.ptr3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv10
  %re = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 0, i32 0
  %2 = load float, float* %re, align 4, !tbaa !18
  %im = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv10, i32 1
  %3 = load float, float* %im, align 4, !tbaa !21
  %mul8 = shl nsw i32 %indvars12, 1
  %idxprom9 = sext i32 %mul8 to i64
  %re11 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom9, i32 0
  %4 = load float, float* %re11, align 4, !tbaa !18
  %im15 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom9, i32 1
  %5 = load float, float* %im15, align 4, !tbaa !21
  %arrayidx18 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom17
  %re19 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx18, i64 0, i32 0
  %6 = load float, float* %re19, align 4, !tbaa !18
  %im23 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx18, i64 0, i32 1
  %7 = load float, float* %im23, align 4, !tbaa !21
  %8 = fneg float %5
  %neg = fmul float %7, %8
  %9 = tail call float @llvm.fmuladd.f32(float %4, float %6, float %neg)
  %mul27 = fmul float %4, %7
  %10 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %mul27)
  %add = fadd float %2, %9
  %add28 = fadd float %3, %10
  %sub29 = fsub float %2, %9
  %sub30 = fsub float %3, %10
  %re34 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 0
  %11 = load float, float* %re34, align 4, !tbaa !18
  %im38 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 1
  %12 = load float, float* %im38, align 4, !tbaa !21
  %arrayidx41 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom40
  %re42 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx41, i64 0, i32 0
  %13 = load float, float* %re42, align 4, !tbaa !18
  %im46 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx41, i64 0, i32 1
  %14 = load float, float* %im46, align 4, !tbaa !21
  %15 = fneg float %12
  %neg49 = fmul float %14, %15
  %16 = tail call float @llvm.fmuladd.f32(float %11, float %13, float %neg49)
  %mul51 = fmul float %11, %14
  %17 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %mul51)
  %18 = mul nsw i64 %indvars.iv, 3
  %re55 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %18, i32 0
  %19 = load float, float* %re55, align 4, !tbaa !18
  %im59 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %18, i32 1
  %20 = load float, float* %im59, align 4, !tbaa !21
  %arrayidx62 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom61
  %re63 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx62, i64 0, i32 0
  %21 = load float, float* %re63, align 4, !tbaa !18
  %im67 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx62, i64 0, i32 1
  %22 = load float, float* %im67, align 4, !tbaa !21
  %23 = fneg float %20
  %neg70 = fmul float %22, %23
  %24 = tail call float @llvm.fmuladd.f32(float %19, float %21, float %neg70)
  %mul72 = fmul float %19, %22
  %25 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %mul72)
  %add73 = fadd float %16, %24
  %add74 = fadd float %17, %25
  %sub75 = fsub float %16, %24
  %sub76 = fsub float %17, %25
  %add77 = fadd float %add, %add73
  %re81 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 0, i32 0
  store float %add77, float* %re81, align 4, !tbaa !18
  %add82 = fadd float %add28, %add74
  %im86 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 0, i32 1
  store float %add82, float* %im86, align 4, !tbaa !21
  %sub87 = fsub float %add, %add73
  %re91 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom17, i32 0
  store float %sub87, float* %re91, align 4, !tbaa !18
  %sub92 = fsub float %add28, %add74
  %im96 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom17, i32 1
  store float %sub92, float* %im96, align 4, !tbaa !21
  %add97 = fadd float %sub29, %sub76
  %re101 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom40, i32 0
  store float %add97, float* %re101, align 4, !tbaa !18
  %sub102 = fsub float %sub30, %sub75
  %im106 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom40, i32 1
  store float %sub102, float* %im106, align 4, !tbaa !21
  %sub107 = fsub float %sub29, %sub76
  %re111 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom61, i32 0
  store float %sub107, float* %re111, align 4, !tbaa !18
  %add112 = fadd float %sub30, %sub75
  %im116 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom61, i32 1
  store float %add112, float* %im116, align 4, !tbaa !21
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %indvars.iv.next = add i64 %indvars.iv, %1
  %incdec.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 1
  %exitcond.not = icmp eq i64 %indvars.iv.next11, %wide.trip.count
  br i1 %exitcond.not, label %cleanup, label %for.body, !llvm.loop !76

if.end:                                           ; preds = %entry, %det.cont
  %a.tr3 = phi i32 [ %div, %det.cont ], [ %a, %entry ]
  %add118 = add nsw i32 %a.tr3, %b
  %div = sdiv i32 %add118, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @fft_twiddle_4(i32 noundef %a.tr3, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nWdn, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %sub = sub nsw i32 %b, %div
  %cmp = icmp slt i32 %sub, 128
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !77

cleanup:                                          ; preds = %for.body, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_twiddle_8(i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nWdn, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub1 = sub nsw i32 %b, %a
  %cmp2 = icmp slt i32 %sub1, 128
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %div, %det.cont ]
  %cmp14 = icmp slt i32 %a.tr.lcssa, %b
  br i1 %cmp14, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.then
  %idx.ext = sext i32 %a.tr.lcssa to i64
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %idx.ext
  %mul = mul i32 %a.tr.lcssa, %nWdn
  %mul16 = shl nsw i32 %m, 2
  %idxprom17 = sext i32 %mul16 to i64
  %mul39 = shl nsw i32 %m, 1
  %idxprom40 = sext i32 %mul39 to i64
  %mul60 = mul nsw i32 %m, 6
  %idxprom61 = sext i32 %mul60 to i64
  %idxprom94 = sext i32 %m to i64
  %mul114 = mul nsw i32 %m, 5
  %idxprom115 = sext i32 %mul114 to i64
  %mul139 = mul nsw i32 %m, 3
  %idxprom140 = sext i32 %mul139 to i64
  %mul160 = mul nsw i32 %m, 7
  %idxprom161 = sext i32 %mul160 to i64
  %0 = sext i32 %mul to i64
  %1 = sext i32 %nWdn to i64
  %wide.trip.count = sext i32 %b to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv14 = phi i64 [ %idx.ext, %for.body.lr.ph ], [ %indvars.iv.next15, %for.body ]
  %indvars.iv = phi i64 [ %0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %kp.05 = phi %struct.COMPLEX* [ %add.ptr, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %indvars16 = trunc i64 %indvars.iv to i32
  %add.ptr3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv14
  %re = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 0, i32 0
  %2 = load float, float* %re, align 4, !tbaa !18
  %im = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv14, i32 1
  %3 = load float, float* %im, align 4, !tbaa !21
  %mul8 = shl nsw i32 %indvars16, 2
  %idxprom9 = sext i32 %mul8 to i64
  %re11 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom9, i32 0
  %4 = load float, float* %re11, align 4, !tbaa !18
  %im15 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom9, i32 1
  %5 = load float, float* %im15, align 4, !tbaa !21
  %arrayidx18 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom17
  %re19 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx18, i64 0, i32 0
  %6 = load float, float* %re19, align 4, !tbaa !18
  %im23 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx18, i64 0, i32 1
  %7 = load float, float* %im23, align 4, !tbaa !21
  %8 = fneg float %5
  %neg = fmul float %7, %8
  %9 = tail call float @llvm.fmuladd.f32(float %4, float %6, float %neg)
  %mul27 = fmul float %4, %7
  %10 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %mul27)
  %add = fadd float %2, %9
  %add28 = fadd float %3, %10
  %sub29 = fsub float %2, %9
  %sub30 = fsub float %3, %10
  %mul31 = shl nsw i32 %indvars16, 1
  %idxprom32 = sext i32 %mul31 to i64
  %re34 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom32, i32 0
  %11 = load float, float* %re34, align 4, !tbaa !18
  %im38 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom32, i32 1
  %12 = load float, float* %im38, align 4, !tbaa !21
  %arrayidx41 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom40
  %re42 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx41, i64 0, i32 0
  %13 = load float, float* %re42, align 4, !tbaa !18
  %im46 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx41, i64 0, i32 1
  %14 = load float, float* %im46, align 4, !tbaa !21
  %15 = fneg float %12
  %neg49 = fmul float %14, %15
  %16 = tail call float @llvm.fmuladd.f32(float %11, float %13, float %neg49)
  %mul51 = fmul float %11, %14
  %17 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %mul51)
  %18 = mul nsw i64 %indvars.iv, 6
  %re55 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %18, i32 0
  %19 = load float, float* %re55, align 4, !tbaa !18
  %im59 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %18, i32 1
  %20 = load float, float* %im59, align 4, !tbaa !21
  %arrayidx62 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom61
  %re63 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx62, i64 0, i32 0
  %21 = load float, float* %re63, align 4, !tbaa !18
  %im67 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx62, i64 0, i32 1
  %22 = load float, float* %im67, align 4, !tbaa !21
  %23 = fneg float %20
  %neg70 = fmul float %22, %23
  %24 = tail call float @llvm.fmuladd.f32(float %19, float %21, float %neg70)
  %mul72 = fmul float %19, %22
  %25 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %mul72)
  %add73 = fadd float %16, %24
  %add74 = fadd float %17, %25
  %sub75 = fsub float %16, %24
  %sub76 = fsub float %17, %25
  %add77 = fadd float %add, %add73
  %add78 = fadd float %add28, %add74
  %sub79 = fsub float %add, %add73
  %sub80 = fsub float %add28, %add74
  %add81 = fadd float %sub29, %sub76
  %sub82 = fsub float %sub30, %sub75
  %sub83 = fsub float %sub29, %sub76
  %add84 = fadd float %sub30, %sub75
  %re88 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 0
  %26 = load float, float* %re88, align 4, !tbaa !18
  %im92 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 1
  %27 = load float, float* %im92, align 4, !tbaa !21
  %arrayidx95 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom94
  %re96 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx95, i64 0, i32 0
  %28 = load float, float* %re96, align 4, !tbaa !18
  %im100 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx95, i64 0, i32 1
  %29 = load float, float* %im100, align 4, !tbaa !21
  %30 = fneg float %27
  %neg103 = fmul float %29, %30
  %31 = tail call float @llvm.fmuladd.f32(float %26, float %28, float %neg103)
  %mul105 = fmul float %26, %29
  %32 = tail call float @llvm.fmuladd.f32(float %27, float %28, float %mul105)
  %33 = mul nsw i64 %indvars.iv, 5
  %re109 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %33, i32 0
  %34 = load float, float* %re109, align 4, !tbaa !18
  %im113 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %33, i32 1
  %35 = load float, float* %im113, align 4, !tbaa !21
  %arrayidx116 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom115
  %re117 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx116, i64 0, i32 0
  %36 = load float, float* %re117, align 4, !tbaa !18
  %im121 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx116, i64 0, i32 1
  %37 = load float, float* %im121, align 4, !tbaa !21
  %38 = fneg float %35
  %neg124 = fmul float %37, %38
  %39 = tail call float @llvm.fmuladd.f32(float %34, float %36, float %neg124)
  %mul126 = fmul float %34, %37
  %40 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %mul126)
  %add127 = fadd float %31, %39
  %add128 = fadd float %32, %40
  %sub129 = fsub float %31, %39
  %sub130 = fsub float %32, %40
  %41 = mul nsw i64 %indvars.iv, 3
  %re134 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %41, i32 0
  %42 = load float, float* %re134, align 4, !tbaa !18
  %im138 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %41, i32 1
  %43 = load float, float* %im138, align 4, !tbaa !21
  %arrayidx141 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom140
  %re142 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx141, i64 0, i32 0
  %44 = load float, float* %re142, align 4, !tbaa !18
  %im146 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx141, i64 0, i32 1
  %45 = load float, float* %im146, align 4, !tbaa !21
  %46 = fneg float %43
  %neg149 = fmul float %45, %46
  %47 = tail call float @llvm.fmuladd.f32(float %42, float %44, float %neg149)
  %mul151 = fmul float %42, %45
  %48 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %mul151)
  %49 = mul nsw i64 %indvars.iv, 7
  %re155 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %49, i32 0
  %50 = load float, float* %re155, align 4, !tbaa !18
  %im159 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %49, i32 1
  %51 = load float, float* %im159, align 4, !tbaa !21
  %arrayidx162 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom161
  %re163 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx162, i64 0, i32 0
  %52 = load float, float* %re163, align 4, !tbaa !18
  %im167 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx162, i64 0, i32 1
  %53 = load float, float* %im167, align 4, !tbaa !21
  %54 = fneg float %51
  %neg170 = fmul float %53, %54
  %55 = tail call float @llvm.fmuladd.f32(float %50, float %52, float %neg170)
  %mul172 = fmul float %50, %53
  %56 = tail call float @llvm.fmuladd.f32(float %51, float %52, float %mul172)
  %add173 = fadd float %47, %55
  %add174 = fadd float %48, %56
  %sub175 = fsub float %47, %55
  %sub176 = fsub float %48, %56
  %add177 = fadd float %add127, %add173
  %add178 = fadd float %add128, %add174
  %sub179 = fsub float %add127, %add173
  %sub180 = fsub float %add128, %add174
  %add181 = fadd float %sub129, %sub176
  %sub182 = fsub float %sub130, %sub175
  %sub183 = fsub float %sub129, %sub176
  %add184 = fadd float %sub130, %sub175
  %add185 = fadd float %add77, %add177
  %re189 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 0, i32 0
  store float %add185, float* %re189, align 4, !tbaa !18
  %add190 = fadd float %add78, %add178
  %im194 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 0, i32 1
  store float %add190, float* %im194, align 4, !tbaa !21
  %sub195 = fsub float %add77, %add177
  %re199 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom17, i32 0
  store float %sub195, float* %re199, align 4, !tbaa !18
  %sub200 = fsub float %add78, %add178
  %im204 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom17, i32 1
  store float %sub200, float* %im204, align 4, !tbaa !21
  %add205 = fadd float %add181, %sub182
  %conv = fpext float %add205 to double
  %mul206 = fmul double %conv, 0x3FE6A09E667F4BB8
  %conv207 = fptrunc double %mul206 to float
  %sub208 = fsub float %sub182, %add181
  %conv209 = fpext float %sub208 to double
  %mul210 = fmul double %conv209, 0x3FE6A09E667F4BB8
  %conv211 = fptrunc double %mul210 to float
  %add212 = fadd float %add81, %conv207
  %re216 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom94, i32 0
  store float %add212, float* %re216, align 4, !tbaa !18
  %add217 = fadd float %sub82, %conv211
  %im221 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom94, i32 1
  store float %add217, float* %im221, align 4, !tbaa !21
  %sub222 = fsub float %add81, %conv207
  %re226 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom115, i32 0
  store float %sub222, float* %re226, align 4, !tbaa !18
  %sub227 = fsub float %sub82, %conv211
  %im231 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom115, i32 1
  store float %sub227, float* %im231, align 4, !tbaa !21
  %add232 = fadd float %sub79, %sub180
  %re236 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom40, i32 0
  store float %add232, float* %re236, align 4, !tbaa !18
  %sub237 = fsub float %sub80, %sub179
  %im241 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom40, i32 1
  store float %sub237, float* %im241, align 4, !tbaa !21
  %sub242 = fsub float %sub79, %sub180
  %re246 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom61, i32 0
  store float %sub242, float* %re246, align 4, !tbaa !18
  %add247 = fadd float %sub80, %sub179
  %im251 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom61, i32 1
  store float %add247, float* %im251, align 4, !tbaa !21
  %sub252 = fsub float %add184, %sub183
  %conv253 = fpext float %sub252 to double
  %mul254 = fmul double %conv253, 0x3FE6A09E667F4BB8
  %conv255 = fptrunc double %mul254 to float
  %add256 = fadd float %sub183, %add184
  %conv257 = fpext float %add256 to double
  %mul258 = fmul double %conv257, 0x3FE6A09E667F4BB8
  %conv259 = fptrunc double %mul258 to float
  %add260 = fadd float %sub83, %conv255
  %re264 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom140, i32 0
  store float %add260, float* %re264, align 4, !tbaa !18
  %sub265 = fsub float %add84, %conv259
  %im269 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom140, i32 1
  store float %sub265, float* %im269, align 4, !tbaa !21
  %sub270 = fsub float %sub83, %conv255
  %re274 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom161, i32 0
  store float %sub270, float* %re274, align 4, !tbaa !18
  %add275 = fadd float %add84, %conv259
  %im279 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom161, i32 1
  store float %add275, float* %im279, align 4, !tbaa !21
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, 1
  %indvars.iv.next = add i64 %indvars.iv, %1
  %incdec.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 1
  %exitcond.not = icmp eq i64 %indvars.iv.next15, %wide.trip.count
  br i1 %exitcond.not, label %cleanup, label %for.body, !llvm.loop !78

if.end:                                           ; preds = %entry, %det.cont
  %a.tr3 = phi i32 [ %div, %det.cont ], [ %a, %entry ]
  %add281 = add nsw i32 %a.tr3, %b
  %div = sdiv i32 %add281, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @fft_twiddle_8(i32 noundef %a.tr3, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nWdn, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %sub = sub nsw i32 %b, %div
  %cmp = icmp slt i32 %sub, 128
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !79

cleanup:                                          ; preds = %for.body, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_twiddle_16(i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nWdn, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub1 = sub nsw i32 %b, %a
  %cmp2 = icmp slt i32 %sub1, 128
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %div, %det.cont ]
  %cmp14 = icmp slt i32 %a.tr.lcssa, %b
  br i1 %cmp14, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.then
  %idx.ext = sext i32 %a.tr.lcssa to i64
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %idx.ext
  %mul = mul i32 %a.tr.lcssa, %nWdn
  %mul16 = shl nsw i32 %m, 3
  %idxprom17 = sext i32 %mul16 to i64
  %mul39 = shl nsw i32 %m, 2
  %idxprom40 = sext i32 %mul39 to i64
  %mul60 = mul nsw i32 %m, 12
  %idxprom61 = sext i32 %mul60 to i64
  %mul93 = shl nsw i32 %m, 1
  %idxprom94 = sext i32 %mul93 to i64
  %mul114 = mul nsw i32 %m, 10
  %idxprom115 = sext i32 %mul114 to i64
  %mul139 = mul nsw i32 %m, 6
  %idxprom140 = sext i32 %mul139 to i64
  %mul160 = mul nsw i32 %m, 14
  %idxprom161 = sext i32 %mul160 to i64
  %idxprom225 = sext i32 %m to i64
  %mul245 = mul nsw i32 %m, 9
  %idxprom246 = sext i32 %mul245 to i64
  %mul270 = mul nsw i32 %m, 5
  %idxprom271 = sext i32 %mul270 to i64
  %mul291 = mul nsw i32 %m, 13
  %idxprom292 = sext i32 %mul291 to i64
  %mul324 = mul nsw i32 %m, 3
  %idxprom325 = sext i32 %mul324 to i64
  %mul345 = mul nsw i32 %m, 11
  %idxprom346 = sext i32 %mul345 to i64
  %mul370 = mul nsw i32 %m, 7
  %idxprom371 = sext i32 %mul370 to i64
  %mul391 = mul nsw i32 %m, 15
  %idxprom392 = sext i32 %mul391 to i64
  %0 = sext i32 %mul to i64
  %1 = sext i32 %nWdn to i64
  %wide.trip.count = sext i32 %b to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv21 = phi i64 [ %idx.ext, %for.body.lr.ph ], [ %indvars.iv.next22, %for.body ]
  %indvars.iv = phi i64 [ %0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %kp.05 = phi %struct.COMPLEX* [ %add.ptr, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %indvars23 = trunc i64 %indvars.iv to i32
  %add.ptr3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv21
  %re = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 0, i32 0
  %2 = load float, float* %re, align 4, !tbaa !18
  %im = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv21, i32 1
  %3 = load float, float* %im, align 4, !tbaa !21
  %mul8 = shl nsw i32 %indvars23, 3
  %idxprom9 = sext i32 %mul8 to i64
  %re11 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom9, i32 0
  %4 = load float, float* %re11, align 4, !tbaa !18
  %im15 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom9, i32 1
  %5 = load float, float* %im15, align 4, !tbaa !21
  %arrayidx18 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom17
  %re19 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx18, i64 0, i32 0
  %6 = load float, float* %re19, align 4, !tbaa !18
  %im23 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx18, i64 0, i32 1
  %7 = load float, float* %im23, align 4, !tbaa !21
  %8 = fneg float %5
  %neg = fmul float %7, %8
  %9 = tail call float @llvm.fmuladd.f32(float %4, float %6, float %neg)
  %mul27 = fmul float %4, %7
  %10 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %mul27)
  %add = fadd float %2, %9
  %add28 = fadd float %3, %10
  %sub29 = fsub float %2, %9
  %sub30 = fsub float %3, %10
  %mul31 = shl nsw i32 %indvars23, 2
  %idxprom32 = sext i32 %mul31 to i64
  %re34 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom32, i32 0
  %11 = load float, float* %re34, align 4, !tbaa !18
  %im38 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom32, i32 1
  %12 = load float, float* %im38, align 4, !tbaa !21
  %arrayidx41 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom40
  %re42 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx41, i64 0, i32 0
  %13 = load float, float* %re42, align 4, !tbaa !18
  %im46 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx41, i64 0, i32 1
  %14 = load float, float* %im46, align 4, !tbaa !21
  %15 = fneg float %12
  %neg49 = fmul float %14, %15
  %16 = tail call float @llvm.fmuladd.f32(float %11, float %13, float %neg49)
  %mul51 = fmul float %11, %14
  %17 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %mul51)
  %18 = mul nsw i64 %indvars.iv, 12
  %re55 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %18, i32 0
  %19 = load float, float* %re55, align 4, !tbaa !18
  %im59 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %18, i32 1
  %20 = load float, float* %im59, align 4, !tbaa !21
  %arrayidx62 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom61
  %re63 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx62, i64 0, i32 0
  %21 = load float, float* %re63, align 4, !tbaa !18
  %im67 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx62, i64 0, i32 1
  %22 = load float, float* %im67, align 4, !tbaa !21
  %23 = fneg float %20
  %neg70 = fmul float %22, %23
  %24 = tail call float @llvm.fmuladd.f32(float %19, float %21, float %neg70)
  %mul72 = fmul float %19, %22
  %25 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %mul72)
  %add73 = fadd float %16, %24
  %add74 = fadd float %17, %25
  %sub75 = fsub float %16, %24
  %sub76 = fsub float %17, %25
  %add77 = fadd float %add, %add73
  %add78 = fadd float %add28, %add74
  %sub79 = fsub float %add, %add73
  %sub80 = fsub float %add28, %add74
  %add81 = fadd float %sub29, %sub76
  %sub82 = fsub float %sub30, %sub75
  %sub83 = fsub float %sub29, %sub76
  %add84 = fadd float %sub30, %sub75
  %mul85 = shl nsw i32 %indvars23, 1
  %idxprom86 = sext i32 %mul85 to i64
  %re88 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom86, i32 0
  %26 = load float, float* %re88, align 4, !tbaa !18
  %im92 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom86, i32 1
  %27 = load float, float* %im92, align 4, !tbaa !21
  %arrayidx95 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom94
  %re96 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx95, i64 0, i32 0
  %28 = load float, float* %re96, align 4, !tbaa !18
  %im100 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx95, i64 0, i32 1
  %29 = load float, float* %im100, align 4, !tbaa !21
  %30 = fneg float %27
  %neg103 = fmul float %29, %30
  %31 = tail call float @llvm.fmuladd.f32(float %26, float %28, float %neg103)
  %mul105 = fmul float %26, %29
  %32 = tail call float @llvm.fmuladd.f32(float %27, float %28, float %mul105)
  %33 = mul nsw i64 %indvars.iv, 10
  %re109 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %33, i32 0
  %34 = load float, float* %re109, align 4, !tbaa !18
  %im113 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %33, i32 1
  %35 = load float, float* %im113, align 4, !tbaa !21
  %arrayidx116 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom115
  %re117 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx116, i64 0, i32 0
  %36 = load float, float* %re117, align 4, !tbaa !18
  %im121 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx116, i64 0, i32 1
  %37 = load float, float* %im121, align 4, !tbaa !21
  %38 = fneg float %35
  %neg124 = fmul float %37, %38
  %39 = tail call float @llvm.fmuladd.f32(float %34, float %36, float %neg124)
  %mul126 = fmul float %34, %37
  %40 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %mul126)
  %add127 = fadd float %31, %39
  %add128 = fadd float %32, %40
  %sub129 = fsub float %31, %39
  %sub130 = fsub float %32, %40
  %41 = mul nsw i64 %indvars.iv, 6
  %re134 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %41, i32 0
  %42 = load float, float* %re134, align 4, !tbaa !18
  %im138 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %41, i32 1
  %43 = load float, float* %im138, align 4, !tbaa !21
  %arrayidx141 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom140
  %re142 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx141, i64 0, i32 0
  %44 = load float, float* %re142, align 4, !tbaa !18
  %im146 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx141, i64 0, i32 1
  %45 = load float, float* %im146, align 4, !tbaa !21
  %46 = fneg float %43
  %neg149 = fmul float %45, %46
  %47 = tail call float @llvm.fmuladd.f32(float %42, float %44, float %neg149)
  %mul151 = fmul float %42, %45
  %48 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %mul151)
  %49 = mul nsw i64 %indvars.iv, 14
  %re155 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %49, i32 0
  %50 = load float, float* %re155, align 4, !tbaa !18
  %im159 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %49, i32 1
  %51 = load float, float* %im159, align 4, !tbaa !21
  %arrayidx162 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom161
  %re163 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx162, i64 0, i32 0
  %52 = load float, float* %re163, align 4, !tbaa !18
  %im167 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx162, i64 0, i32 1
  %53 = load float, float* %im167, align 4, !tbaa !21
  %54 = fneg float %51
  %neg170 = fmul float %53, %54
  %55 = tail call float @llvm.fmuladd.f32(float %50, float %52, float %neg170)
  %mul172 = fmul float %50, %53
  %56 = tail call float @llvm.fmuladd.f32(float %51, float %52, float %mul172)
  %add173 = fadd float %47, %55
  %add174 = fadd float %48, %56
  %sub175 = fsub float %47, %55
  %sub176 = fsub float %48, %56
  %add177 = fadd float %add127, %add173
  %add178 = fadd float %add128, %add174
  %sub179 = fsub float %add127, %add173
  %sub180 = fsub float %add128, %add174
  %add181 = fadd float %sub129, %sub176
  %sub182 = fsub float %sub130, %sub175
  %sub183 = fsub float %sub129, %sub176
  %add184 = fadd float %sub130, %sub175
  %add185 = fadd float %add77, %add177
  %add186 = fadd float %add78, %add178
  %sub187 = fsub float %add77, %add177
  %sub188 = fsub float %add78, %add178
  %add189 = fadd float %add181, %sub182
  %conv = fpext float %add189 to double
  %mul190 = fmul double %conv, 0x3FE6A09E667F4BB8
  %conv191 = fptrunc double %mul190 to float
  %sub192 = fsub float %sub182, %add181
  %conv193 = fpext float %sub192 to double
  %mul194 = fmul double %conv193, 0x3FE6A09E667F4BB8
  %conv195 = fptrunc double %mul194 to float
  %add196 = fadd float %add81, %conv191
  %add197 = fadd float %sub82, %conv195
  %sub198 = fsub float %add81, %conv191
  %sub199 = fsub float %sub82, %conv195
  %add200 = fadd float %sub79, %sub180
  %sub201 = fsub float %sub80, %sub179
  %sub202 = fsub float %sub79, %sub180
  %add203 = fadd float %sub80, %sub179
  %sub204 = fsub float %add184, %sub183
  %conv205 = fpext float %sub204 to double
  %mul206 = fmul double %conv205, 0x3FE6A09E667F4BB8
  %conv207 = fptrunc double %mul206 to float
  %add208 = fadd float %sub183, %add184
  %conv209 = fpext float %add208 to double
  %mul210 = fmul double %conv209, 0x3FE6A09E667F4BB8
  %conv211 = fptrunc double %mul210 to float
  %add212 = fadd float %sub83, %conv207
  %sub213 = fsub float %add84, %conv211
  %sub214 = fsub float %sub83, %conv207
  %add215 = fadd float %add84, %conv211
  %re219 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 0
  %57 = load float, float* %re219, align 4, !tbaa !18
  %im223 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 1
  %58 = load float, float* %im223, align 4, !tbaa !21
  %arrayidx226 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom225
  %re227 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx226, i64 0, i32 0
  %59 = load float, float* %re227, align 4, !tbaa !18
  %im231 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx226, i64 0, i32 1
  %60 = load float, float* %im231, align 4, !tbaa !21
  %61 = fneg float %58
  %neg234 = fmul float %60, %61
  %62 = tail call float @llvm.fmuladd.f32(float %57, float %59, float %neg234)
  %mul236 = fmul float %57, %60
  %63 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %mul236)
  %64 = mul nsw i64 %indvars.iv, 9
  %re240 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %64, i32 0
  %65 = load float, float* %re240, align 4, !tbaa !18
  %im244 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %64, i32 1
  %66 = load float, float* %im244, align 4, !tbaa !21
  %arrayidx247 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom246
  %re248 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx247, i64 0, i32 0
  %67 = load float, float* %re248, align 4, !tbaa !18
  %im252 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx247, i64 0, i32 1
  %68 = load float, float* %im252, align 4, !tbaa !21
  %69 = fneg float %66
  %neg255 = fmul float %68, %69
  %70 = tail call float @llvm.fmuladd.f32(float %65, float %67, float %neg255)
  %mul257 = fmul float %65, %68
  %71 = tail call float @llvm.fmuladd.f32(float %66, float %67, float %mul257)
  %add258 = fadd float %62, %70
  %add259 = fadd float %63, %71
  %sub260 = fsub float %62, %70
  %sub261 = fsub float %63, %71
  %72 = mul nsw i64 %indvars.iv, 5
  %re265 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %72, i32 0
  %73 = load float, float* %re265, align 4, !tbaa !18
  %im269 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %72, i32 1
  %74 = load float, float* %im269, align 4, !tbaa !21
  %arrayidx272 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom271
  %re273 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx272, i64 0, i32 0
  %75 = load float, float* %re273, align 4, !tbaa !18
  %im277 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx272, i64 0, i32 1
  %76 = load float, float* %im277, align 4, !tbaa !21
  %77 = fneg float %74
  %neg280 = fmul float %76, %77
  %78 = tail call float @llvm.fmuladd.f32(float %73, float %75, float %neg280)
  %mul282 = fmul float %73, %76
  %79 = tail call float @llvm.fmuladd.f32(float %74, float %75, float %mul282)
  %80 = mul nsw i64 %indvars.iv, 13
  %re286 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %80, i32 0
  %81 = load float, float* %re286, align 4, !tbaa !18
  %im290 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %80, i32 1
  %82 = load float, float* %im290, align 4, !tbaa !21
  %arrayidx293 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom292
  %re294 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx293, i64 0, i32 0
  %83 = load float, float* %re294, align 4, !tbaa !18
  %im298 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx293, i64 0, i32 1
  %84 = load float, float* %im298, align 4, !tbaa !21
  %85 = fneg float %82
  %neg301 = fmul float %84, %85
  %86 = tail call float @llvm.fmuladd.f32(float %81, float %83, float %neg301)
  %mul303 = fmul float %81, %84
  %87 = tail call float @llvm.fmuladd.f32(float %82, float %83, float %mul303)
  %add304 = fadd float %78, %86
  %add305 = fadd float %79, %87
  %sub306 = fsub float %78, %86
  %sub307 = fsub float %79, %87
  %add308 = fadd float %add258, %add304
  %add309 = fadd float %add259, %add305
  %sub310 = fsub float %add258, %add304
  %sub311 = fsub float %add259, %add305
  %add312 = fadd float %sub260, %sub307
  %sub313 = fsub float %sub261, %sub306
  %sub314 = fsub float %sub260, %sub307
  %add315 = fadd float %sub261, %sub306
  %88 = mul nsw i64 %indvars.iv, 3
  %re319 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %88, i32 0
  %89 = load float, float* %re319, align 4, !tbaa !18
  %im323 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %88, i32 1
  %90 = load float, float* %im323, align 4, !tbaa !21
  %arrayidx326 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom325
  %re327 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx326, i64 0, i32 0
  %91 = load float, float* %re327, align 4, !tbaa !18
  %im331 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx326, i64 0, i32 1
  %92 = load float, float* %im331, align 4, !tbaa !21
  %93 = fneg float %90
  %neg334 = fmul float %92, %93
  %94 = tail call float @llvm.fmuladd.f32(float %89, float %91, float %neg334)
  %mul336 = fmul float %89, %92
  %95 = tail call float @llvm.fmuladd.f32(float %90, float %91, float %mul336)
  %96 = mul nsw i64 %indvars.iv, 11
  %re340 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %96, i32 0
  %97 = load float, float* %re340, align 4, !tbaa !18
  %im344 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %96, i32 1
  %98 = load float, float* %im344, align 4, !tbaa !21
  %arrayidx347 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom346
  %re348 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx347, i64 0, i32 0
  %99 = load float, float* %re348, align 4, !tbaa !18
  %im352 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx347, i64 0, i32 1
  %100 = load float, float* %im352, align 4, !tbaa !21
  %101 = fneg float %98
  %neg355 = fmul float %100, %101
  %102 = tail call float @llvm.fmuladd.f32(float %97, float %99, float %neg355)
  %mul357 = fmul float %97, %100
  %103 = tail call float @llvm.fmuladd.f32(float %98, float %99, float %mul357)
  %add358 = fadd float %94, %102
  %add359 = fadd float %95, %103
  %sub360 = fsub float %94, %102
  %sub361 = fsub float %95, %103
  %104 = mul nsw i64 %indvars.iv, 7
  %re365 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %104, i32 0
  %105 = load float, float* %re365, align 4, !tbaa !18
  %im369 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %104, i32 1
  %106 = load float, float* %im369, align 4, !tbaa !21
  %arrayidx372 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom371
  %re373 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx372, i64 0, i32 0
  %107 = load float, float* %re373, align 4, !tbaa !18
  %im377 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx372, i64 0, i32 1
  %108 = load float, float* %im377, align 4, !tbaa !21
  %109 = fneg float %106
  %neg380 = fmul float %108, %109
  %110 = tail call float @llvm.fmuladd.f32(float %105, float %107, float %neg380)
  %mul382 = fmul float %105, %108
  %111 = tail call float @llvm.fmuladd.f32(float %106, float %107, float %mul382)
  %112 = mul nsw i64 %indvars.iv, 15
  %re386 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %112, i32 0
  %113 = load float, float* %re386, align 4, !tbaa !18
  %im390 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %112, i32 1
  %114 = load float, float* %im390, align 4, !tbaa !21
  %arrayidx393 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom392
  %re394 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx393, i64 0, i32 0
  %115 = load float, float* %re394, align 4, !tbaa !18
  %im398 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx393, i64 0, i32 1
  %116 = load float, float* %im398, align 4, !tbaa !21
  %117 = fneg float %114
  %neg401 = fmul float %116, %117
  %118 = tail call float @llvm.fmuladd.f32(float %113, float %115, float %neg401)
  %mul403 = fmul float %113, %116
  %119 = tail call float @llvm.fmuladd.f32(float %114, float %115, float %mul403)
  %add404 = fadd float %110, %118
  %add405 = fadd float %111, %119
  %sub406 = fsub float %110, %118
  %sub407 = fsub float %111, %119
  %add408 = fadd float %add358, %add404
  %add409 = fadd float %add359, %add405
  %sub410 = fsub float %add358, %add404
  %sub411 = fsub float %add359, %add405
  %add412 = fadd float %sub360, %sub407
  %sub413 = fsub float %sub361, %sub406
  %sub414 = fsub float %sub360, %sub407
  %add415 = fadd float %sub361, %sub406
  %add416 = fadd float %add308, %add408
  %add417 = fadd float %add309, %add409
  %sub418 = fsub float %add308, %add408
  %sub419 = fsub float %add309, %add409
  %add420 = fadd float %add412, %sub413
  %conv421 = fpext float %add420 to double
  %mul422 = fmul double %conv421, 0x3FE6A09E667F4BB8
  %conv423 = fptrunc double %mul422 to float
  %sub424 = fsub float %sub413, %add412
  %conv425 = fpext float %sub424 to double
  %mul426 = fmul double %conv425, 0x3FE6A09E667F4BB8
  %conv427 = fptrunc double %mul426 to float
  %add428 = fadd float %add312, %conv423
  %add429 = fadd float %sub313, %conv427
  %sub430 = fsub float %add312, %conv423
  %sub431 = fsub float %sub313, %conv427
  %add432 = fadd float %sub310, %sub411
  %sub433 = fsub float %sub311, %sub410
  %sub434 = fsub float %sub310, %sub411
  %add435 = fadd float %sub311, %sub410
  %sub436 = fsub float %add415, %sub414
  %conv437 = fpext float %sub436 to double
  %mul438 = fmul double %conv437, 0x3FE6A09E667F4BB8
  %conv439 = fptrunc double %mul438 to float
  %add440 = fadd float %sub414, %add415
  %conv441 = fpext float %add440 to double
  %mul442 = fmul double %conv441, 0x3FE6A09E667F4BB8
  %conv443 = fptrunc double %mul442 to float
  %add444 = fadd float %sub314, %conv439
  %sub445 = fsub float %add315, %conv443
  %sub446 = fsub float %sub314, %conv439
  %add447 = fadd float %add315, %conv443
  %add448 = fadd float %add185, %add416
  %re452 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 0, i32 0
  store float %add448, float* %re452, align 4, !tbaa !18
  %add453 = fadd float %add186, %add417
  %im457 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 0, i32 1
  store float %add453, float* %im457, align 4, !tbaa !21
  %sub458 = fsub float %add185, %add416
  %re462 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom17, i32 0
  store float %sub458, float* %re462, align 4, !tbaa !18
  %sub463 = fsub float %add186, %add417
  %im467 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom17, i32 1
  store float %sub463, float* %im467, align 4, !tbaa !21
  %conv468 = fpext float %add428 to double
  %conv470 = fpext float %add429 to double
  %mul471 = fmul double %conv470, 0x3FD87DE2A6AEA312
  %120 = tail call double @llvm.fmuladd.f64(double %conv468, double 0x3FED906BCF32832F, double %mul471)
  %conv472 = fptrunc double %120 to float
  %neg477 = fmul double %conv468, 0xBFD87DE2A6AEA312
  %121 = tail call double @llvm.fmuladd.f64(double %conv470, double 0x3FED906BCF32832F, double %neg477)
  %conv478 = fptrunc double %121 to float
  %add479 = fadd float %add196, %conv472
  %re483 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom225, i32 0
  store float %add479, float* %re483, align 4, !tbaa !18
  %add484 = fadd float %add197, %conv478
  %im488 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom225, i32 1
  store float %add484, float* %im488, align 4, !tbaa !21
  %sub489 = fsub float %add196, %conv472
  %re493 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom246, i32 0
  store float %sub489, float* %re493, align 4, !tbaa !18
  %sub494 = fsub float %add197, %conv478
  %im498 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom246, i32 1
  store float %sub494, float* %im498, align 4, !tbaa !21
  %add499 = fadd float %add432, %sub433
  %conv500 = fpext float %add499 to double
  %mul501 = fmul double %conv500, 0x3FE6A09E667F4BB8
  %conv502 = fptrunc double %mul501 to float
  %sub503 = fsub float %sub433, %add432
  %conv504 = fpext float %sub503 to double
  %mul505 = fmul double %conv504, 0x3FE6A09E667F4BB8
  %conv506 = fptrunc double %mul505 to float
  %add507 = fadd float %add200, %conv502
  %re511 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom94, i32 0
  store float %add507, float* %re511, align 4, !tbaa !18
  %add512 = fadd float %sub201, %conv506
  %im516 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom94, i32 1
  store float %add512, float* %im516, align 4, !tbaa !21
  %sub517 = fsub float %add200, %conv502
  %re521 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom115, i32 0
  store float %sub517, float* %re521, align 4, !tbaa !18
  %sub522 = fsub float %sub201, %conv506
  %im526 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom115, i32 1
  store float %sub522, float* %im526, align 4, !tbaa !21
  %conv527 = fpext float %add444 to double
  %conv529 = fpext float %sub445 to double
  %mul530 = fmul double %conv529, 0x3FED906BCF32832F
  %122 = tail call double @llvm.fmuladd.f64(double %conv527, double 0x3FD87DE2A6AEA312, double %mul530)
  %conv531 = fptrunc double %122 to float
  %neg536 = fmul double %conv527, 0xBFED906BCF32832F
  %123 = tail call double @llvm.fmuladd.f64(double %conv529, double 0x3FD87DE2A6AEA312, double %neg536)
  %conv537 = fptrunc double %123 to float
  %add538 = fadd float %add212, %conv531
  %re542 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom325, i32 0
  store float %add538, float* %re542, align 4, !tbaa !18
  %add543 = fadd float %sub213, %conv537
  %im547 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom325, i32 1
  store float %add543, float* %im547, align 4, !tbaa !21
  %sub548 = fsub float %add212, %conv531
  %re552 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom346, i32 0
  store float %sub548, float* %re552, align 4, !tbaa !18
  %sub553 = fsub float %sub213, %conv537
  %im557 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom346, i32 1
  store float %sub553, float* %im557, align 4, !tbaa !21
  %add558 = fadd float %sub187, %sub419
  %re562 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom40, i32 0
  store float %add558, float* %re562, align 4, !tbaa !18
  %sub563 = fsub float %sub188, %sub418
  %im567 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom40, i32 1
  store float %sub563, float* %im567, align 4, !tbaa !21
  %sub568 = fsub float %sub187, %sub419
  %re572 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom61, i32 0
  store float %sub568, float* %re572, align 4, !tbaa !18
  %add573 = fadd float %sub188, %sub418
  %im577 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom61, i32 1
  store float %add573, float* %im577, align 4, !tbaa !21
  %conv578 = fpext float %sub431 to double
  %conv580 = fpext float %sub430 to double
  %neg582 = fmul double %conv580, 0xBFD87DE2A6AEA312
  %124 = tail call double @llvm.fmuladd.f64(double %conv578, double 0x3FED906BCF32832F, double %neg582)
  %conv583 = fptrunc double %124 to float
  %mul587 = fmul double %conv578, 0x3FD87DE2A6AEA312
  %125 = tail call double @llvm.fmuladd.f64(double %conv580, double 0x3FED906BCF32832F, double %mul587)
  %conv588 = fptrunc double %125 to float
  %add589 = fadd float %sub198, %conv583
  %re593 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom271, i32 0
  store float %add589, float* %re593, align 4, !tbaa !18
  %sub594 = fsub float %sub199, %conv588
  %im598 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom271, i32 1
  store float %sub594, float* %im598, align 4, !tbaa !21
  %sub599 = fsub float %sub198, %conv583
  %re603 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom292, i32 0
  store float %sub599, float* %re603, align 4, !tbaa !18
  %add604 = fadd float %sub199, %conv588
  %im608 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom292, i32 1
  store float %add604, float* %im608, align 4, !tbaa !21
  %sub609 = fsub float %add435, %sub434
  %conv610 = fpext float %sub609 to double
  %mul611 = fmul double %conv610, 0x3FE6A09E667F4BB8
  %conv612 = fptrunc double %mul611 to float
  %add613 = fadd float %sub434, %add435
  %conv614 = fpext float %add613 to double
  %mul615 = fmul double %conv614, 0x3FE6A09E667F4BB8
  %conv616 = fptrunc double %mul615 to float
  %add617 = fadd float %sub202, %conv612
  %re621 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom140, i32 0
  store float %add617, float* %re621, align 4, !tbaa !18
  %sub622 = fsub float %add203, %conv616
  %im626 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom140, i32 1
  store float %sub622, float* %im626, align 4, !tbaa !21
  %sub627 = fsub float %sub202, %conv612
  %re631 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom161, i32 0
  store float %sub627, float* %re631, align 4, !tbaa !18
  %add632 = fadd float %add203, %conv616
  %im636 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom161, i32 1
  store float %add632, float* %im636, align 4, !tbaa !21
  %conv637 = fpext float %add447 to double
  %conv639 = fpext float %sub446 to double
  %neg641 = fmul double %conv639, 0xBFED906BCF32832F
  %126 = tail call double @llvm.fmuladd.f64(double %conv637, double 0x3FD87DE2A6AEA312, double %neg641)
  %conv642 = fptrunc double %126 to float
  %mul646 = fmul double %conv637, 0x3FED906BCF32832F
  %127 = tail call double @llvm.fmuladd.f64(double %conv639, double 0x3FD87DE2A6AEA312, double %mul646)
  %conv647 = fptrunc double %127 to float
  %add648 = fadd float %sub214, %conv642
  %re652 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom371, i32 0
  store float %add648, float* %re652, align 4, !tbaa !18
  %sub653 = fsub float %add215, %conv647
  %im657 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom371, i32 1
  store float %sub653, float* %im657, align 4, !tbaa !21
  %sub658 = fsub float %sub214, %conv642
  %re662 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom392, i32 0
  store float %sub658, float* %re662, align 4, !tbaa !18
  %add663 = fadd float %add215, %conv647
  %im667 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom392, i32 1
  store float %add663, float* %im667, align 4, !tbaa !21
  %indvars.iv.next22 = add nsw i64 %indvars.iv21, 1
  %indvars.iv.next = add i64 %indvars.iv, %1
  %incdec.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 1
  %exitcond.not = icmp eq i64 %indvars.iv.next22, %wide.trip.count
  br i1 %exitcond.not, label %cleanup, label %for.body, !llvm.loop !80

if.end:                                           ; preds = %entry, %det.cont
  %a.tr3 = phi i32 [ %div, %det.cont ], [ %a, %entry ]
  %add669 = add nsw i32 %a.tr3, %b
  %div = sdiv i32 %add669, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @fft_twiddle_16(i32 noundef %a.tr3, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nWdn, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %sub = sub nsw i32 %b, %div
  %cmp = icmp slt i32 %sub, 128
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !81

cleanup:                                          ; preds = %for.body, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_twiddle_32(i32 noundef %a, i32 noundef %b, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nWdn, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub1 = sub nsw i32 %b, %a
  %cmp2 = icmp slt i32 %sub1, 128
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %a.tr.lcssa = phi i32 [ %a, %entry ], [ %div, %det.cont ]
  %cmp14 = icmp slt i32 %a.tr.lcssa, %b
  br i1 %cmp14, label %for.body.lr.ph, label %cleanup

for.body.lr.ph:                                   ; preds = %if.then
  %idx.ext = sext i32 %a.tr.lcssa to i64
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %idx.ext
  %mul = mul i32 %a.tr.lcssa, %nWdn
  %mul16 = shl nsw i32 %m, 4
  %idxprom17 = sext i32 %mul16 to i64
  %mul39 = shl nsw i32 %m, 3
  %idxprom40 = sext i32 %mul39 to i64
  %mul60 = mul nsw i32 %m, 24
  %idxprom61 = sext i32 %mul60 to i64
  %mul93 = shl nsw i32 %m, 2
  %idxprom94 = sext i32 %mul93 to i64
  %mul114 = mul nsw i32 %m, 20
  %idxprom115 = sext i32 %mul114 to i64
  %mul139 = mul nsw i32 %m, 12
  %idxprom140 = sext i32 %mul139 to i64
  %mul160 = mul nsw i32 %m, 28
  %idxprom161 = sext i32 %mul160 to i64
  %mul224 = shl nsw i32 %m, 1
  %idxprom225 = sext i32 %mul224 to i64
  %mul245 = mul nsw i32 %m, 18
  %idxprom246 = sext i32 %mul245 to i64
  %mul270 = mul nsw i32 %m, 10
  %idxprom271 = sext i32 %mul270 to i64
  %mul291 = mul nsw i32 %m, 26
  %idxprom292 = sext i32 %mul291 to i64
  %mul324 = mul nsw i32 %m, 6
  %idxprom325 = sext i32 %mul324 to i64
  %mul345 = mul nsw i32 %m, 22
  %idxprom346 = sext i32 %mul345 to i64
  %mul370 = mul nsw i32 %m, 14
  %idxprom371 = sext i32 %mul370 to i64
  %mul391 = mul nsw i32 %m, 30
  %idxprom392 = sext i32 %mul391 to i64
  %idxprom549 = sext i32 %m to i64
  %mul569 = mul nsw i32 %m, 17
  %idxprom570 = sext i32 %mul569 to i64
  %mul594 = mul nsw i32 %m, 9
  %idxprom595 = sext i32 %mul594 to i64
  %mul615 = mul nsw i32 %m, 25
  %idxprom616 = sext i32 %mul615 to i64
  %mul648 = mul nsw i32 %m, 5
  %idxprom649 = sext i32 %mul648 to i64
  %mul669 = mul nsw i32 %m, 21
  %idxprom670 = sext i32 %mul669 to i64
  %mul694 = mul nsw i32 %m, 13
  %idxprom695 = sext i32 %mul694 to i64
  %mul715 = mul nsw i32 %m, 29
  %idxprom716 = sext i32 %mul715 to i64
  %mul780 = mul nsw i32 %m, 3
  %idxprom781 = sext i32 %mul780 to i64
  %mul801 = mul nsw i32 %m, 19
  %idxprom802 = sext i32 %mul801 to i64
  %mul826 = mul nsw i32 %m, 11
  %idxprom827 = sext i32 %mul826 to i64
  %mul847 = mul nsw i32 %m, 27
  %idxprom848 = sext i32 %mul847 to i64
  %mul880 = mul nsw i32 %m, 7
  %idxprom881 = sext i32 %mul880 to i64
  %mul901 = mul nsw i32 %m, 23
  %idxprom902 = sext i32 %mul901 to i64
  %mul926 = mul nsw i32 %m, 15
  %idxprom927 = sext i32 %mul926 to i64
  %mul947 = mul nsw i32 %m, 31
  %idxprom948 = sext i32 %mul947 to i64
  %0 = sext i32 %mul to i64
  %1 = sext i32 %nWdn to i64
  %wide.trip.count = sext i32 %b to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %indvars.iv36 = phi i64 [ %idx.ext, %for.body.lr.ph ], [ %indvars.iv.next37, %for.body ]
  %indvars.iv = phi i64 [ %0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %kp.05 = phi %struct.COMPLEX* [ %add.ptr, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %indvars38 = trunc i64 %indvars.iv to i32
  %add.ptr3 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv36
  %re = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 0, i32 0
  %2 = load float, float* %re, align 4, !tbaa !18
  %im = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %indvars.iv36, i32 1
  %3 = load float, float* %im, align 4, !tbaa !21
  %mul8 = shl nsw i32 %indvars38, 4
  %idxprom9 = sext i32 %mul8 to i64
  %re11 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom9, i32 0
  %4 = load float, float* %re11, align 4, !tbaa !18
  %im15 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom9, i32 1
  %5 = load float, float* %im15, align 4, !tbaa !21
  %arrayidx18 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom17
  %re19 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx18, i64 0, i32 0
  %6 = load float, float* %re19, align 4, !tbaa !18
  %im23 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx18, i64 0, i32 1
  %7 = load float, float* %im23, align 4, !tbaa !21
  %8 = fneg float %5
  %neg = fmul float %7, %8
  %9 = tail call float @llvm.fmuladd.f32(float %4, float %6, float %neg)
  %mul27 = fmul float %4, %7
  %10 = tail call float @llvm.fmuladd.f32(float %5, float %6, float %mul27)
  %add = fadd float %2, %9
  %add28 = fadd float %3, %10
  %sub29 = fsub float %2, %9
  %sub30 = fsub float %3, %10
  %mul31 = shl nsw i32 %indvars38, 3
  %idxprom32 = sext i32 %mul31 to i64
  %re34 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom32, i32 0
  %11 = load float, float* %re34, align 4, !tbaa !18
  %im38 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom32, i32 1
  %12 = load float, float* %im38, align 4, !tbaa !21
  %arrayidx41 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom40
  %re42 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx41, i64 0, i32 0
  %13 = load float, float* %re42, align 4, !tbaa !18
  %im46 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx41, i64 0, i32 1
  %14 = load float, float* %im46, align 4, !tbaa !21
  %15 = fneg float %12
  %neg49 = fmul float %14, %15
  %16 = tail call float @llvm.fmuladd.f32(float %11, float %13, float %neg49)
  %mul51 = fmul float %11, %14
  %17 = tail call float @llvm.fmuladd.f32(float %12, float %13, float %mul51)
  %18 = mul nsw i64 %indvars.iv, 24
  %re55 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %18, i32 0
  %19 = load float, float* %re55, align 4, !tbaa !18
  %im59 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %18, i32 1
  %20 = load float, float* %im59, align 4, !tbaa !21
  %arrayidx62 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom61
  %re63 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx62, i64 0, i32 0
  %21 = load float, float* %re63, align 4, !tbaa !18
  %im67 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx62, i64 0, i32 1
  %22 = load float, float* %im67, align 4, !tbaa !21
  %23 = fneg float %20
  %neg70 = fmul float %22, %23
  %24 = tail call float @llvm.fmuladd.f32(float %19, float %21, float %neg70)
  %mul72 = fmul float %19, %22
  %25 = tail call float @llvm.fmuladd.f32(float %20, float %21, float %mul72)
  %add73 = fadd float %16, %24
  %add74 = fadd float %17, %25
  %sub75 = fsub float %16, %24
  %sub76 = fsub float %17, %25
  %add77 = fadd float %add, %add73
  %add78 = fadd float %add28, %add74
  %sub79 = fsub float %add, %add73
  %sub80 = fsub float %add28, %add74
  %add81 = fadd float %sub29, %sub76
  %sub82 = fsub float %sub30, %sub75
  %sub83 = fsub float %sub29, %sub76
  %add84 = fadd float %sub30, %sub75
  %mul85 = shl nsw i32 %indvars38, 2
  %idxprom86 = sext i32 %mul85 to i64
  %re88 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom86, i32 0
  %26 = load float, float* %re88, align 4, !tbaa !18
  %im92 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom86, i32 1
  %27 = load float, float* %im92, align 4, !tbaa !21
  %arrayidx95 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom94
  %re96 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx95, i64 0, i32 0
  %28 = load float, float* %re96, align 4, !tbaa !18
  %im100 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx95, i64 0, i32 1
  %29 = load float, float* %im100, align 4, !tbaa !21
  %30 = fneg float %27
  %neg103 = fmul float %29, %30
  %31 = tail call float @llvm.fmuladd.f32(float %26, float %28, float %neg103)
  %mul105 = fmul float %26, %29
  %32 = tail call float @llvm.fmuladd.f32(float %27, float %28, float %mul105)
  %33 = mul nsw i64 %indvars.iv, 20
  %re109 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %33, i32 0
  %34 = load float, float* %re109, align 4, !tbaa !18
  %im113 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %33, i32 1
  %35 = load float, float* %im113, align 4, !tbaa !21
  %arrayidx116 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom115
  %re117 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx116, i64 0, i32 0
  %36 = load float, float* %re117, align 4, !tbaa !18
  %im121 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx116, i64 0, i32 1
  %37 = load float, float* %im121, align 4, !tbaa !21
  %38 = fneg float %35
  %neg124 = fmul float %37, %38
  %39 = tail call float @llvm.fmuladd.f32(float %34, float %36, float %neg124)
  %mul126 = fmul float %34, %37
  %40 = tail call float @llvm.fmuladd.f32(float %35, float %36, float %mul126)
  %add127 = fadd float %31, %39
  %add128 = fadd float %32, %40
  %sub129 = fsub float %31, %39
  %sub130 = fsub float %32, %40
  %41 = mul nsw i64 %indvars.iv, 12
  %re134 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %41, i32 0
  %42 = load float, float* %re134, align 4, !tbaa !18
  %im138 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %41, i32 1
  %43 = load float, float* %im138, align 4, !tbaa !21
  %arrayidx141 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom140
  %re142 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx141, i64 0, i32 0
  %44 = load float, float* %re142, align 4, !tbaa !18
  %im146 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx141, i64 0, i32 1
  %45 = load float, float* %im146, align 4, !tbaa !21
  %46 = fneg float %43
  %neg149 = fmul float %45, %46
  %47 = tail call float @llvm.fmuladd.f32(float %42, float %44, float %neg149)
  %mul151 = fmul float %42, %45
  %48 = tail call float @llvm.fmuladd.f32(float %43, float %44, float %mul151)
  %49 = mul nsw i64 %indvars.iv, 28
  %re155 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %49, i32 0
  %50 = load float, float* %re155, align 4, !tbaa !18
  %im159 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %49, i32 1
  %51 = load float, float* %im159, align 4, !tbaa !21
  %arrayidx162 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom161
  %re163 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx162, i64 0, i32 0
  %52 = load float, float* %re163, align 4, !tbaa !18
  %im167 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx162, i64 0, i32 1
  %53 = load float, float* %im167, align 4, !tbaa !21
  %54 = fneg float %51
  %neg170 = fmul float %53, %54
  %55 = tail call float @llvm.fmuladd.f32(float %50, float %52, float %neg170)
  %mul172 = fmul float %50, %53
  %56 = tail call float @llvm.fmuladd.f32(float %51, float %52, float %mul172)
  %add173 = fadd float %47, %55
  %add174 = fadd float %48, %56
  %sub175 = fsub float %47, %55
  %sub176 = fsub float %48, %56
  %add177 = fadd float %add127, %add173
  %add178 = fadd float %add128, %add174
  %sub179 = fsub float %add127, %add173
  %sub180 = fsub float %add128, %add174
  %add181 = fadd float %sub129, %sub176
  %sub182 = fsub float %sub130, %sub175
  %sub183 = fsub float %sub129, %sub176
  %add184 = fadd float %sub130, %sub175
  %add185 = fadd float %add77, %add177
  %add186 = fadd float %add78, %add178
  %sub187 = fsub float %add77, %add177
  %sub188 = fsub float %add78, %add178
  %add189 = fadd float %add181, %sub182
  %conv = fpext float %add189 to double
  %mul190 = fmul double %conv, 0x3FE6A09E667F4BB8
  %conv191 = fptrunc double %mul190 to float
  %sub192 = fsub float %sub182, %add181
  %conv193 = fpext float %sub192 to double
  %mul194 = fmul double %conv193, 0x3FE6A09E667F4BB8
  %conv195 = fptrunc double %mul194 to float
  %add196 = fadd float %add81, %conv191
  %add197 = fadd float %sub82, %conv195
  %sub198 = fsub float %add81, %conv191
  %sub199 = fsub float %sub82, %conv195
  %add200 = fadd float %sub79, %sub180
  %sub201 = fsub float %sub80, %sub179
  %sub202 = fsub float %sub79, %sub180
  %add203 = fadd float %sub80, %sub179
  %sub204 = fsub float %add184, %sub183
  %conv205 = fpext float %sub204 to double
  %mul206 = fmul double %conv205, 0x3FE6A09E667F4BB8
  %conv207 = fptrunc double %mul206 to float
  %add208 = fadd float %sub183, %add184
  %conv209 = fpext float %add208 to double
  %mul210 = fmul double %conv209, 0x3FE6A09E667F4BB8
  %conv211 = fptrunc double %mul210 to float
  %add212 = fadd float %sub83, %conv207
  %sub213 = fsub float %add84, %conv211
  %sub214 = fsub float %sub83, %conv207
  %add215 = fadd float %add84, %conv211
  %mul216 = shl nsw i32 %indvars38, 1
  %idxprom217 = sext i32 %mul216 to i64
  %re219 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom217, i32 0
  %57 = load float, float* %re219, align 4, !tbaa !18
  %im223 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom217, i32 1
  %58 = load float, float* %im223, align 4, !tbaa !21
  %arrayidx226 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom225
  %re227 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx226, i64 0, i32 0
  %59 = load float, float* %re227, align 4, !tbaa !18
  %im231 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx226, i64 0, i32 1
  %60 = load float, float* %im231, align 4, !tbaa !21
  %61 = fneg float %58
  %neg234 = fmul float %60, %61
  %62 = tail call float @llvm.fmuladd.f32(float %57, float %59, float %neg234)
  %mul236 = fmul float %57, %60
  %63 = tail call float @llvm.fmuladd.f32(float %58, float %59, float %mul236)
  %64 = mul nsw i64 %indvars.iv, 18
  %re240 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %64, i32 0
  %65 = load float, float* %re240, align 4, !tbaa !18
  %im244 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %64, i32 1
  %66 = load float, float* %im244, align 4, !tbaa !21
  %arrayidx247 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom246
  %re248 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx247, i64 0, i32 0
  %67 = load float, float* %re248, align 4, !tbaa !18
  %im252 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx247, i64 0, i32 1
  %68 = load float, float* %im252, align 4, !tbaa !21
  %69 = fneg float %66
  %neg255 = fmul float %68, %69
  %70 = tail call float @llvm.fmuladd.f32(float %65, float %67, float %neg255)
  %mul257 = fmul float %65, %68
  %71 = tail call float @llvm.fmuladd.f32(float %66, float %67, float %mul257)
  %add258 = fadd float %62, %70
  %add259 = fadd float %63, %71
  %sub260 = fsub float %62, %70
  %sub261 = fsub float %63, %71
  %72 = mul nsw i64 %indvars.iv, 10
  %re265 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %72, i32 0
  %73 = load float, float* %re265, align 4, !tbaa !18
  %im269 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %72, i32 1
  %74 = load float, float* %im269, align 4, !tbaa !21
  %arrayidx272 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom271
  %re273 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx272, i64 0, i32 0
  %75 = load float, float* %re273, align 4, !tbaa !18
  %im277 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx272, i64 0, i32 1
  %76 = load float, float* %im277, align 4, !tbaa !21
  %77 = fneg float %74
  %neg280 = fmul float %76, %77
  %78 = tail call float @llvm.fmuladd.f32(float %73, float %75, float %neg280)
  %mul282 = fmul float %73, %76
  %79 = tail call float @llvm.fmuladd.f32(float %74, float %75, float %mul282)
  %80 = mul nsw i64 %indvars.iv, 26
  %re286 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %80, i32 0
  %81 = load float, float* %re286, align 4, !tbaa !18
  %im290 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %80, i32 1
  %82 = load float, float* %im290, align 4, !tbaa !21
  %arrayidx293 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom292
  %re294 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx293, i64 0, i32 0
  %83 = load float, float* %re294, align 4, !tbaa !18
  %im298 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx293, i64 0, i32 1
  %84 = load float, float* %im298, align 4, !tbaa !21
  %85 = fneg float %82
  %neg301 = fmul float %84, %85
  %86 = tail call float @llvm.fmuladd.f32(float %81, float %83, float %neg301)
  %mul303 = fmul float %81, %84
  %87 = tail call float @llvm.fmuladd.f32(float %82, float %83, float %mul303)
  %add304 = fadd float %78, %86
  %add305 = fadd float %79, %87
  %sub306 = fsub float %78, %86
  %sub307 = fsub float %79, %87
  %add308 = fadd float %add258, %add304
  %add309 = fadd float %add259, %add305
  %sub310 = fsub float %add258, %add304
  %sub311 = fsub float %add259, %add305
  %add312 = fadd float %sub260, %sub307
  %sub313 = fsub float %sub261, %sub306
  %sub314 = fsub float %sub260, %sub307
  %add315 = fadd float %sub261, %sub306
  %88 = mul nsw i64 %indvars.iv, 6
  %re319 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %88, i32 0
  %89 = load float, float* %re319, align 4, !tbaa !18
  %im323 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %88, i32 1
  %90 = load float, float* %im323, align 4, !tbaa !21
  %arrayidx326 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom325
  %re327 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx326, i64 0, i32 0
  %91 = load float, float* %re327, align 4, !tbaa !18
  %im331 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx326, i64 0, i32 1
  %92 = load float, float* %im331, align 4, !tbaa !21
  %93 = fneg float %90
  %neg334 = fmul float %92, %93
  %94 = tail call float @llvm.fmuladd.f32(float %89, float %91, float %neg334)
  %mul336 = fmul float %89, %92
  %95 = tail call float @llvm.fmuladd.f32(float %90, float %91, float %mul336)
  %96 = mul nsw i64 %indvars.iv, 22
  %re340 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %96, i32 0
  %97 = load float, float* %re340, align 4, !tbaa !18
  %im344 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %96, i32 1
  %98 = load float, float* %im344, align 4, !tbaa !21
  %arrayidx347 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom346
  %re348 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx347, i64 0, i32 0
  %99 = load float, float* %re348, align 4, !tbaa !18
  %im352 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx347, i64 0, i32 1
  %100 = load float, float* %im352, align 4, !tbaa !21
  %101 = fneg float %98
  %neg355 = fmul float %100, %101
  %102 = tail call float @llvm.fmuladd.f32(float %97, float %99, float %neg355)
  %mul357 = fmul float %97, %100
  %103 = tail call float @llvm.fmuladd.f32(float %98, float %99, float %mul357)
  %add358 = fadd float %94, %102
  %add359 = fadd float %95, %103
  %sub360 = fsub float %94, %102
  %sub361 = fsub float %95, %103
  %104 = mul nsw i64 %indvars.iv, 14
  %re365 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %104, i32 0
  %105 = load float, float* %re365, align 4, !tbaa !18
  %im369 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %104, i32 1
  %106 = load float, float* %im369, align 4, !tbaa !21
  %arrayidx372 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom371
  %re373 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx372, i64 0, i32 0
  %107 = load float, float* %re373, align 4, !tbaa !18
  %im377 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx372, i64 0, i32 1
  %108 = load float, float* %im377, align 4, !tbaa !21
  %109 = fneg float %106
  %neg380 = fmul float %108, %109
  %110 = tail call float @llvm.fmuladd.f32(float %105, float %107, float %neg380)
  %mul382 = fmul float %105, %108
  %111 = tail call float @llvm.fmuladd.f32(float %106, float %107, float %mul382)
  %112 = mul nsw i64 %indvars.iv, 30
  %re386 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %112, i32 0
  %113 = load float, float* %re386, align 4, !tbaa !18
  %im390 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %112, i32 1
  %114 = load float, float* %im390, align 4, !tbaa !21
  %arrayidx393 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom392
  %re394 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx393, i64 0, i32 0
  %115 = load float, float* %re394, align 4, !tbaa !18
  %im398 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx393, i64 0, i32 1
  %116 = load float, float* %im398, align 4, !tbaa !21
  %117 = fneg float %114
  %neg401 = fmul float %116, %117
  %118 = tail call float @llvm.fmuladd.f32(float %113, float %115, float %neg401)
  %mul403 = fmul float %113, %116
  %119 = tail call float @llvm.fmuladd.f32(float %114, float %115, float %mul403)
  %add404 = fadd float %110, %118
  %add405 = fadd float %111, %119
  %sub406 = fsub float %110, %118
  %sub407 = fsub float %111, %119
  %add408 = fadd float %add358, %add404
  %add409 = fadd float %add359, %add405
  %sub410 = fsub float %add358, %add404
  %sub411 = fsub float %add359, %add405
  %add412 = fadd float %sub360, %sub407
  %sub413 = fsub float %sub361, %sub406
  %sub414 = fsub float %sub360, %sub407
  %add415 = fadd float %sub361, %sub406
  %add416 = fadd float %add308, %add408
  %add417 = fadd float %add309, %add409
  %sub418 = fsub float %add308, %add408
  %sub419 = fsub float %add309, %add409
  %add420 = fadd float %add412, %sub413
  %conv421 = fpext float %add420 to double
  %mul422 = fmul double %conv421, 0x3FE6A09E667F4BB8
  %conv423 = fptrunc double %mul422 to float
  %sub424 = fsub float %sub413, %add412
  %conv425 = fpext float %sub424 to double
  %mul426 = fmul double %conv425, 0x3FE6A09E667F4BB8
  %conv427 = fptrunc double %mul426 to float
  %add428 = fadd float %add312, %conv423
  %add429 = fadd float %sub313, %conv427
  %sub430 = fsub float %add312, %conv423
  %sub431 = fsub float %sub313, %conv427
  %add432 = fadd float %sub310, %sub411
  %sub433 = fsub float %sub311, %sub410
  %sub434 = fsub float %sub310, %sub411
  %add435 = fadd float %sub311, %sub410
  %sub436 = fsub float %add415, %sub414
  %conv437 = fpext float %sub436 to double
  %mul438 = fmul double %conv437, 0x3FE6A09E667F4BB8
  %conv439 = fptrunc double %mul438 to float
  %add440 = fadd float %sub414, %add415
  %conv441 = fpext float %add440 to double
  %mul442 = fmul double %conv441, 0x3FE6A09E667F4BB8
  %conv443 = fptrunc double %mul442 to float
  %add444 = fadd float %sub314, %conv439
  %sub445 = fsub float %add315, %conv443
  %sub446 = fsub float %sub314, %conv439
  %add447 = fadd float %add315, %conv443
  %add448 = fadd float %add185, %add416
  %add449 = fadd float %add186, %add417
  %sub450 = fsub float %add185, %add416
  %sub451 = fsub float %add186, %add417
  %conv452 = fpext float %add428 to double
  %conv454 = fpext float %add429 to double
  %mul455 = fmul double %conv454, 0x3FD87DE2A6AEA312
  %120 = tail call double @llvm.fmuladd.f64(double %conv452, double 0x3FED906BCF32832F, double %mul455)
  %conv456 = fptrunc double %120 to float
  %neg461 = fmul double %conv452, 0xBFD87DE2A6AEA312
  %121 = tail call double @llvm.fmuladd.f64(double %conv454, double 0x3FED906BCF32832F, double %neg461)
  %conv462 = fptrunc double %121 to float
  %add463 = fadd float %add196, %conv456
  %add464 = fadd float %add197, %conv462
  %sub465 = fsub float %add196, %conv456
  %sub466 = fsub float %add197, %conv462
  %add467 = fadd float %add432, %sub433
  %conv468 = fpext float %add467 to double
  %mul469 = fmul double %conv468, 0x3FE6A09E667F4BB8
  %conv470 = fptrunc double %mul469 to float
  %sub471 = fsub float %sub433, %add432
  %conv472 = fpext float %sub471 to double
  %mul473 = fmul double %conv472, 0x3FE6A09E667F4BB8
  %conv474 = fptrunc double %mul473 to float
  %add475 = fadd float %add200, %conv470
  %add476 = fadd float %sub201, %conv474
  %sub477 = fsub float %add200, %conv470
  %sub478 = fsub float %sub201, %conv474
  %conv479 = fpext float %add444 to double
  %conv481 = fpext float %sub445 to double
  %mul482 = fmul double %conv481, 0x3FED906BCF32832F
  %122 = tail call double @llvm.fmuladd.f64(double %conv479, double 0x3FD87DE2A6AEA312, double %mul482)
  %conv483 = fptrunc double %122 to float
  %neg488 = fmul double %conv479, 0xBFED906BCF32832F
  %123 = tail call double @llvm.fmuladd.f64(double %conv481, double 0x3FD87DE2A6AEA312, double %neg488)
  %conv489 = fptrunc double %123 to float
  %add490 = fadd float %add212, %conv483
  %add491 = fadd float %sub213, %conv489
  %sub492 = fsub float %add212, %conv483
  %sub493 = fsub float %sub213, %conv489
  %add494 = fadd float %sub187, %sub419
  %sub495 = fsub float %sub188, %sub418
  %sub496 = fsub float %sub187, %sub419
  %add497 = fadd float %sub188, %sub418
  %conv498 = fpext float %sub431 to double
  %conv500 = fpext float %sub430 to double
  %neg502 = fmul double %conv500, 0xBFD87DE2A6AEA312
  %124 = tail call double @llvm.fmuladd.f64(double %conv498, double 0x3FED906BCF32832F, double %neg502)
  %conv503 = fptrunc double %124 to float
  %mul507 = fmul double %conv498, 0x3FD87DE2A6AEA312
  %125 = tail call double @llvm.fmuladd.f64(double %conv500, double 0x3FED906BCF32832F, double %mul507)
  %conv508 = fptrunc double %125 to float
  %add509 = fadd float %sub198, %conv503
  %sub510 = fsub float %sub199, %conv508
  %sub511 = fsub float %sub198, %conv503
  %add512 = fadd float %sub199, %conv508
  %sub513 = fsub float %add435, %sub434
  %conv514 = fpext float %sub513 to double
  %mul515 = fmul double %conv514, 0x3FE6A09E667F4BB8
  %conv516 = fptrunc double %mul515 to float
  %add517 = fadd float %sub434, %add435
  %conv518 = fpext float %add517 to double
  %mul519 = fmul double %conv518, 0x3FE6A09E667F4BB8
  %conv520 = fptrunc double %mul519 to float
  %add521 = fadd float %sub202, %conv516
  %sub522 = fsub float %add203, %conv520
  %sub523 = fsub float %sub202, %conv516
  %add524 = fadd float %add203, %conv520
  %conv525 = fpext float %add447 to double
  %conv527 = fpext float %sub446 to double
  %neg529 = fmul double %conv527, 0xBFED906BCF32832F
  %126 = tail call double @llvm.fmuladd.f64(double %conv525, double 0x3FD87DE2A6AEA312, double %neg529)
  %conv530 = fptrunc double %126 to float
  %mul534 = fmul double %conv525, 0x3FED906BCF32832F
  %127 = tail call double @llvm.fmuladd.f64(double %conv527, double 0x3FD87DE2A6AEA312, double %mul534)
  %conv535 = fptrunc double %127 to float
  %add536 = fadd float %sub214, %conv530
  %sub537 = fsub float %add215, %conv535
  %sub538 = fsub float %sub214, %conv530
  %add539 = fadd float %add215, %conv535
  %re543 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 0
  %128 = load float, float* %re543, align 4, !tbaa !18
  %im547 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %indvars.iv, i32 1
  %129 = load float, float* %im547, align 4, !tbaa !21
  %arrayidx550 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom549
  %re551 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx550, i64 0, i32 0
  %130 = load float, float* %re551, align 4, !tbaa !18
  %im555 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx550, i64 0, i32 1
  %131 = load float, float* %im555, align 4, !tbaa !21
  %132 = fneg float %129
  %neg558 = fmul float %131, %132
  %133 = tail call float @llvm.fmuladd.f32(float %128, float %130, float %neg558)
  %mul560 = fmul float %128, %131
  %134 = tail call float @llvm.fmuladd.f32(float %129, float %130, float %mul560)
  %135 = mul nsw i64 %indvars.iv, 17
  %re564 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %135, i32 0
  %136 = load float, float* %re564, align 4, !tbaa !18
  %im568 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %135, i32 1
  %137 = load float, float* %im568, align 4, !tbaa !21
  %arrayidx571 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom570
  %re572 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx571, i64 0, i32 0
  %138 = load float, float* %re572, align 4, !tbaa !18
  %im576 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx571, i64 0, i32 1
  %139 = load float, float* %im576, align 4, !tbaa !21
  %140 = fneg float %137
  %neg579 = fmul float %139, %140
  %141 = tail call float @llvm.fmuladd.f32(float %136, float %138, float %neg579)
  %mul581 = fmul float %136, %139
  %142 = tail call float @llvm.fmuladd.f32(float %137, float %138, float %mul581)
  %add582 = fadd float %133, %141
  %add583 = fadd float %134, %142
  %sub584 = fsub float %133, %141
  %sub585 = fsub float %134, %142
  %143 = mul nsw i64 %indvars.iv, 9
  %re589 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %143, i32 0
  %144 = load float, float* %re589, align 4, !tbaa !18
  %im593 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %143, i32 1
  %145 = load float, float* %im593, align 4, !tbaa !21
  %arrayidx596 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom595
  %re597 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx596, i64 0, i32 0
  %146 = load float, float* %re597, align 4, !tbaa !18
  %im601 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx596, i64 0, i32 1
  %147 = load float, float* %im601, align 4, !tbaa !21
  %148 = fneg float %145
  %neg604 = fmul float %147, %148
  %149 = tail call float @llvm.fmuladd.f32(float %144, float %146, float %neg604)
  %mul606 = fmul float %144, %147
  %150 = tail call float @llvm.fmuladd.f32(float %145, float %146, float %mul606)
  %151 = mul nsw i64 %indvars.iv, 25
  %re610 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %151, i32 0
  %152 = load float, float* %re610, align 4, !tbaa !18
  %im614 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %151, i32 1
  %153 = load float, float* %im614, align 4, !tbaa !21
  %arrayidx617 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom616
  %re618 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx617, i64 0, i32 0
  %154 = load float, float* %re618, align 4, !tbaa !18
  %im622 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx617, i64 0, i32 1
  %155 = load float, float* %im622, align 4, !tbaa !21
  %156 = fneg float %153
  %neg625 = fmul float %155, %156
  %157 = tail call float @llvm.fmuladd.f32(float %152, float %154, float %neg625)
  %mul627 = fmul float %152, %155
  %158 = tail call float @llvm.fmuladd.f32(float %153, float %154, float %mul627)
  %add628 = fadd float %149, %157
  %add629 = fadd float %150, %158
  %sub630 = fsub float %149, %157
  %sub631 = fsub float %150, %158
  %add632 = fadd float %add582, %add628
  %add633 = fadd float %add583, %add629
  %sub634 = fsub float %add582, %add628
  %sub635 = fsub float %add583, %add629
  %add636 = fadd float %sub584, %sub631
  %sub637 = fsub float %sub585, %sub630
  %sub638 = fsub float %sub584, %sub631
  %add639 = fadd float %sub585, %sub630
  %159 = mul nsw i64 %indvars.iv, 5
  %re643 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %159, i32 0
  %160 = load float, float* %re643, align 4, !tbaa !18
  %im647 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %159, i32 1
  %161 = load float, float* %im647, align 4, !tbaa !21
  %arrayidx650 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom649
  %re651 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx650, i64 0, i32 0
  %162 = load float, float* %re651, align 4, !tbaa !18
  %im655 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx650, i64 0, i32 1
  %163 = load float, float* %im655, align 4, !tbaa !21
  %164 = fneg float %161
  %neg658 = fmul float %163, %164
  %165 = tail call float @llvm.fmuladd.f32(float %160, float %162, float %neg658)
  %mul660 = fmul float %160, %163
  %166 = tail call float @llvm.fmuladd.f32(float %161, float %162, float %mul660)
  %167 = mul nsw i64 %indvars.iv, 21
  %re664 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %167, i32 0
  %168 = load float, float* %re664, align 4, !tbaa !18
  %im668 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %167, i32 1
  %169 = load float, float* %im668, align 4, !tbaa !21
  %arrayidx671 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom670
  %re672 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx671, i64 0, i32 0
  %170 = load float, float* %re672, align 4, !tbaa !18
  %im676 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx671, i64 0, i32 1
  %171 = load float, float* %im676, align 4, !tbaa !21
  %172 = fneg float %169
  %neg679 = fmul float %171, %172
  %173 = tail call float @llvm.fmuladd.f32(float %168, float %170, float %neg679)
  %mul681 = fmul float %168, %171
  %174 = tail call float @llvm.fmuladd.f32(float %169, float %170, float %mul681)
  %add682 = fadd float %165, %173
  %add683 = fadd float %166, %174
  %sub684 = fsub float %165, %173
  %sub685 = fsub float %166, %174
  %175 = mul nsw i64 %indvars.iv, 13
  %re689 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %175, i32 0
  %176 = load float, float* %re689, align 4, !tbaa !18
  %im693 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %175, i32 1
  %177 = load float, float* %im693, align 4, !tbaa !21
  %arrayidx696 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom695
  %re697 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx696, i64 0, i32 0
  %178 = load float, float* %re697, align 4, !tbaa !18
  %im701 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx696, i64 0, i32 1
  %179 = load float, float* %im701, align 4, !tbaa !21
  %180 = fneg float %177
  %neg704 = fmul float %179, %180
  %181 = tail call float @llvm.fmuladd.f32(float %176, float %178, float %neg704)
  %mul706 = fmul float %176, %179
  %182 = tail call float @llvm.fmuladd.f32(float %177, float %178, float %mul706)
  %183 = mul nsw i64 %indvars.iv, 29
  %re710 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %183, i32 0
  %184 = load float, float* %re710, align 4, !tbaa !18
  %im714 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %183, i32 1
  %185 = load float, float* %im714, align 4, !tbaa !21
  %arrayidx717 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom716
  %re718 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx717, i64 0, i32 0
  %186 = load float, float* %re718, align 4, !tbaa !18
  %im722 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx717, i64 0, i32 1
  %187 = load float, float* %im722, align 4, !tbaa !21
  %188 = fneg float %185
  %neg725 = fmul float %187, %188
  %189 = tail call float @llvm.fmuladd.f32(float %184, float %186, float %neg725)
  %mul727 = fmul float %184, %187
  %190 = tail call float @llvm.fmuladd.f32(float %185, float %186, float %mul727)
  %add728 = fadd float %181, %189
  %add729 = fadd float %182, %190
  %sub730 = fsub float %181, %189
  %sub731 = fsub float %182, %190
  %add732 = fadd float %add682, %add728
  %add733 = fadd float %add683, %add729
  %sub734 = fsub float %add682, %add728
  %sub735 = fsub float %add683, %add729
  %add736 = fadd float %sub684, %sub731
  %sub737 = fsub float %sub685, %sub730
  %sub738 = fsub float %sub684, %sub731
  %add739 = fadd float %sub685, %sub730
  %add740 = fadd float %add632, %add732
  %add741 = fadd float %add633, %add733
  %sub742 = fsub float %add632, %add732
  %sub743 = fsub float %add633, %add733
  %add744 = fadd float %add736, %sub737
  %conv745 = fpext float %add744 to double
  %mul746 = fmul double %conv745, 0x3FE6A09E667F4BB8
  %conv747 = fptrunc double %mul746 to float
  %sub748 = fsub float %sub737, %add736
  %conv749 = fpext float %sub748 to double
  %mul750 = fmul double %conv749, 0x3FE6A09E667F4BB8
  %conv751 = fptrunc double %mul750 to float
  %add752 = fadd float %add636, %conv747
  %add753 = fadd float %sub637, %conv751
  %sub754 = fsub float %add636, %conv747
  %sub755 = fsub float %sub637, %conv751
  %add756 = fadd float %sub634, %sub735
  %sub757 = fsub float %sub635, %sub734
  %sub758 = fsub float %sub634, %sub735
  %add759 = fadd float %sub635, %sub734
  %sub760 = fsub float %add739, %sub738
  %conv761 = fpext float %sub760 to double
  %mul762 = fmul double %conv761, 0x3FE6A09E667F4BB8
  %conv763 = fptrunc double %mul762 to float
  %add764 = fadd float %sub738, %add739
  %conv765 = fpext float %add764 to double
  %mul766 = fmul double %conv765, 0x3FE6A09E667F4BB8
  %conv767 = fptrunc double %mul766 to float
  %add768 = fadd float %sub638, %conv763
  %sub769 = fsub float %add639, %conv767
  %sub770 = fsub float %sub638, %conv763
  %add771 = fadd float %add639, %conv767
  %191 = mul nsw i64 %indvars.iv, 3
  %re775 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %191, i32 0
  %192 = load float, float* %re775, align 4, !tbaa !18
  %im779 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %191, i32 1
  %193 = load float, float* %im779, align 4, !tbaa !21
  %arrayidx782 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom781
  %re783 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx782, i64 0, i32 0
  %194 = load float, float* %re783, align 4, !tbaa !18
  %im787 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx782, i64 0, i32 1
  %195 = load float, float* %im787, align 4, !tbaa !21
  %196 = fneg float %193
  %neg790 = fmul float %195, %196
  %197 = tail call float @llvm.fmuladd.f32(float %192, float %194, float %neg790)
  %mul792 = fmul float %192, %195
  %198 = tail call float @llvm.fmuladd.f32(float %193, float %194, float %mul792)
  %199 = mul nsw i64 %indvars.iv, 19
  %re796 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %199, i32 0
  %200 = load float, float* %re796, align 4, !tbaa !18
  %im800 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %199, i32 1
  %201 = load float, float* %im800, align 4, !tbaa !21
  %arrayidx803 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom802
  %re804 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx803, i64 0, i32 0
  %202 = load float, float* %re804, align 4, !tbaa !18
  %im808 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx803, i64 0, i32 1
  %203 = load float, float* %im808, align 4, !tbaa !21
  %204 = fneg float %201
  %neg811 = fmul float %203, %204
  %205 = tail call float @llvm.fmuladd.f32(float %200, float %202, float %neg811)
  %mul813 = fmul float %200, %203
  %206 = tail call float @llvm.fmuladd.f32(float %201, float %202, float %mul813)
  %add814 = fadd float %197, %205
  %add815 = fadd float %198, %206
  %sub816 = fsub float %197, %205
  %sub817 = fsub float %198, %206
  %207 = mul nsw i64 %indvars.iv, 11
  %re821 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %207, i32 0
  %208 = load float, float* %re821, align 4, !tbaa !18
  %im825 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %207, i32 1
  %209 = load float, float* %im825, align 4, !tbaa !21
  %arrayidx828 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom827
  %re829 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx828, i64 0, i32 0
  %210 = load float, float* %re829, align 4, !tbaa !18
  %im833 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx828, i64 0, i32 1
  %211 = load float, float* %im833, align 4, !tbaa !21
  %212 = fneg float %209
  %neg836 = fmul float %211, %212
  %213 = tail call float @llvm.fmuladd.f32(float %208, float %210, float %neg836)
  %mul838 = fmul float %208, %211
  %214 = tail call float @llvm.fmuladd.f32(float %209, float %210, float %mul838)
  %215 = mul nsw i64 %indvars.iv, 27
  %re842 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %215, i32 0
  %216 = load float, float* %re842, align 4, !tbaa !18
  %im846 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %215, i32 1
  %217 = load float, float* %im846, align 4, !tbaa !21
  %arrayidx849 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom848
  %re850 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx849, i64 0, i32 0
  %218 = load float, float* %re850, align 4, !tbaa !18
  %im854 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx849, i64 0, i32 1
  %219 = load float, float* %im854, align 4, !tbaa !21
  %220 = fneg float %217
  %neg857 = fmul float %219, %220
  %221 = tail call float @llvm.fmuladd.f32(float %216, float %218, float %neg857)
  %mul859 = fmul float %216, %219
  %222 = tail call float @llvm.fmuladd.f32(float %217, float %218, float %mul859)
  %add860 = fadd float %213, %221
  %add861 = fadd float %214, %222
  %sub862 = fsub float %213, %221
  %sub863 = fsub float %214, %222
  %add864 = fadd float %add814, %add860
  %add865 = fadd float %add815, %add861
  %sub866 = fsub float %add814, %add860
  %sub867 = fsub float %add815, %add861
  %add868 = fadd float %sub816, %sub863
  %sub869 = fsub float %sub817, %sub862
  %sub870 = fsub float %sub816, %sub863
  %add871 = fadd float %sub817, %sub862
  %223 = mul nsw i64 %indvars.iv, 7
  %re875 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %223, i32 0
  %224 = load float, float* %re875, align 4, !tbaa !18
  %im879 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %223, i32 1
  %225 = load float, float* %im879, align 4, !tbaa !21
  %arrayidx882 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom881
  %re883 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx882, i64 0, i32 0
  %226 = load float, float* %re883, align 4, !tbaa !18
  %im887 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx882, i64 0, i32 1
  %227 = load float, float* %im887, align 4, !tbaa !21
  %228 = fneg float %225
  %neg890 = fmul float %227, %228
  %229 = tail call float @llvm.fmuladd.f32(float %224, float %226, float %neg890)
  %mul892 = fmul float %224, %227
  %230 = tail call float @llvm.fmuladd.f32(float %225, float %226, float %mul892)
  %231 = mul nsw i64 %indvars.iv, 23
  %re896 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %231, i32 0
  %232 = load float, float* %re896, align 4, !tbaa !18
  %im900 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %231, i32 1
  %233 = load float, float* %im900, align 4, !tbaa !21
  %arrayidx903 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom902
  %re904 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx903, i64 0, i32 0
  %234 = load float, float* %re904, align 4, !tbaa !18
  %im908 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx903, i64 0, i32 1
  %235 = load float, float* %im908, align 4, !tbaa !21
  %236 = fneg float %233
  %neg911 = fmul float %235, %236
  %237 = tail call float @llvm.fmuladd.f32(float %232, float %234, float %neg911)
  %mul913 = fmul float %232, %235
  %238 = tail call float @llvm.fmuladd.f32(float %233, float %234, float %mul913)
  %add914 = fadd float %229, %237
  %add915 = fadd float %230, %238
  %sub916 = fsub float %229, %237
  %sub917 = fsub float %230, %238
  %239 = mul nsw i64 %indvars.iv, 15
  %re921 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %239, i32 0
  %240 = load float, float* %re921, align 4, !tbaa !18
  %im925 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %239, i32 1
  %241 = load float, float* %im925, align 4, !tbaa !21
  %arrayidx928 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom927
  %re929 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx928, i64 0, i32 0
  %242 = load float, float* %re929, align 4, !tbaa !18
  %im933 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx928, i64 0, i32 1
  %243 = load float, float* %im933, align 4, !tbaa !21
  %244 = fneg float %241
  %neg936 = fmul float %243, %244
  %245 = tail call float @llvm.fmuladd.f32(float %240, float %242, float %neg936)
  %mul938 = fmul float %240, %243
  %246 = tail call float @llvm.fmuladd.f32(float %241, float %242, float %mul938)
  %247 = mul nsw i64 %indvars.iv, 31
  %re942 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %247, i32 0
  %248 = load float, float* %re942, align 4, !tbaa !18
  %im946 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %247, i32 1
  %249 = load float, float* %im946, align 4, !tbaa !21
  %arrayidx949 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %add.ptr3, i64 %idxprom948
  %re950 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx949, i64 0, i32 0
  %250 = load float, float* %re950, align 4, !tbaa !18
  %im954 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %arrayidx949, i64 0, i32 1
  %251 = load float, float* %im954, align 4, !tbaa !21
  %252 = fneg float %249
  %neg957 = fmul float %251, %252
  %253 = tail call float @llvm.fmuladd.f32(float %248, float %250, float %neg957)
  %mul959 = fmul float %248, %251
  %254 = tail call float @llvm.fmuladd.f32(float %249, float %250, float %mul959)
  %add960 = fadd float %245, %253
  %add961 = fadd float %246, %254
  %sub962 = fsub float %245, %253
  %sub963 = fsub float %246, %254
  %add964 = fadd float %add914, %add960
  %add965 = fadd float %add915, %add961
  %sub966 = fsub float %add914, %add960
  %sub967 = fsub float %add915, %add961
  %add968 = fadd float %sub916, %sub963
  %sub969 = fsub float %sub917, %sub962
  %sub970 = fsub float %sub916, %sub963
  %add971 = fadd float %sub917, %sub962
  %add972 = fadd float %add864, %add964
  %add973 = fadd float %add865, %add965
  %sub974 = fsub float %add864, %add964
  %sub975 = fsub float %add865, %add965
  %add976 = fadd float %add968, %sub969
  %conv977 = fpext float %add976 to double
  %mul978 = fmul double %conv977, 0x3FE6A09E667F4BB8
  %conv979 = fptrunc double %mul978 to float
  %sub980 = fsub float %sub969, %add968
  %conv981 = fpext float %sub980 to double
  %mul982 = fmul double %conv981, 0x3FE6A09E667F4BB8
  %conv983 = fptrunc double %mul982 to float
  %add984 = fadd float %add868, %conv979
  %add985 = fadd float %sub869, %conv983
  %sub986 = fsub float %add868, %conv979
  %sub987 = fsub float %sub869, %conv983
  %add988 = fadd float %sub866, %sub967
  %sub989 = fsub float %sub867, %sub966
  %sub990 = fsub float %sub866, %sub967
  %add991 = fadd float %sub867, %sub966
  %sub992 = fsub float %add971, %sub970
  %conv993 = fpext float %sub992 to double
  %mul994 = fmul double %conv993, 0x3FE6A09E667F4BB8
  %conv995 = fptrunc double %mul994 to float
  %add996 = fadd float %sub970, %add971
  %conv997 = fpext float %add996 to double
  %mul998 = fmul double %conv997, 0x3FE6A09E667F4BB8
  %conv999 = fptrunc double %mul998 to float
  %add1000 = fadd float %sub870, %conv995
  %sub1001 = fsub float %add871, %conv999
  %sub1002 = fsub float %sub870, %conv995
  %add1003 = fadd float %add871, %conv999
  %add1004 = fadd float %add740, %add972
  %add1005 = fadd float %add741, %add973
  %sub1006 = fsub float %add740, %add972
  %sub1007 = fsub float %add741, %add973
  %conv1008 = fpext float %add984 to double
  %conv1010 = fpext float %add985 to double
  %mul1011 = fmul double %conv1010, 0x3FD87DE2A6AEA312
  %255 = tail call double @llvm.fmuladd.f64(double %conv1008, double 0x3FED906BCF32832F, double %mul1011)
  %conv1012 = fptrunc double %255 to float
  %neg1017 = fmul double %conv1008, 0xBFD87DE2A6AEA312
  %256 = tail call double @llvm.fmuladd.f64(double %conv1010, double 0x3FED906BCF32832F, double %neg1017)
  %conv1018 = fptrunc double %256 to float
  %add1019 = fadd float %add752, %conv1012
  %add1020 = fadd float %add753, %conv1018
  %sub1021 = fsub float %add752, %conv1012
  %sub1022 = fsub float %add753, %conv1018
  %add1023 = fadd float %add988, %sub989
  %conv1024 = fpext float %add1023 to double
  %mul1025 = fmul double %conv1024, 0x3FE6A09E667F4BB8
  %conv1026 = fptrunc double %mul1025 to float
  %sub1027 = fsub float %sub989, %add988
  %conv1028 = fpext float %sub1027 to double
  %mul1029 = fmul double %conv1028, 0x3FE6A09E667F4BB8
  %conv1030 = fptrunc double %mul1029 to float
  %add1031 = fadd float %add756, %conv1026
  %add1032 = fadd float %sub757, %conv1030
  %sub1033 = fsub float %add756, %conv1026
  %sub1034 = fsub float %sub757, %conv1030
  %conv1035 = fpext float %add1000 to double
  %conv1037 = fpext float %sub1001 to double
  %mul1038 = fmul double %conv1037, 0x3FED906BCF32832F
  %257 = tail call double @llvm.fmuladd.f64(double %conv1035, double 0x3FD87DE2A6AEA312, double %mul1038)
  %conv1039 = fptrunc double %257 to float
  %neg1044 = fmul double %conv1035, 0xBFED906BCF32832F
  %258 = tail call double @llvm.fmuladd.f64(double %conv1037, double 0x3FD87DE2A6AEA312, double %neg1044)
  %conv1045 = fptrunc double %258 to float
  %add1046 = fadd float %add768, %conv1039
  %add1047 = fadd float %sub769, %conv1045
  %sub1048 = fsub float %add768, %conv1039
  %sub1049 = fsub float %sub769, %conv1045
  %add1050 = fadd float %sub742, %sub975
  %sub1051 = fsub float %sub743, %sub974
  %sub1052 = fsub float %sub742, %sub975
  %add1053 = fadd float %sub743, %sub974
  %conv1054 = fpext float %sub987 to double
  %conv1056 = fpext float %sub986 to double
  %neg1058 = fmul double %conv1056, 0xBFD87DE2A6AEA312
  %259 = tail call double @llvm.fmuladd.f64(double %conv1054, double 0x3FED906BCF32832F, double %neg1058)
  %conv1059 = fptrunc double %259 to float
  %mul1063 = fmul double %conv1054, 0x3FD87DE2A6AEA312
  %260 = tail call double @llvm.fmuladd.f64(double %conv1056, double 0x3FED906BCF32832F, double %mul1063)
  %conv1064 = fptrunc double %260 to float
  %add1065 = fadd float %sub754, %conv1059
  %sub1066 = fsub float %sub755, %conv1064
  %sub1067 = fsub float %sub754, %conv1059
  %add1068 = fadd float %sub755, %conv1064
  %sub1069 = fsub float %add991, %sub990
  %conv1070 = fpext float %sub1069 to double
  %mul1071 = fmul double %conv1070, 0x3FE6A09E667F4BB8
  %conv1072 = fptrunc double %mul1071 to float
  %add1073 = fadd float %sub990, %add991
  %conv1074 = fpext float %add1073 to double
  %mul1075 = fmul double %conv1074, 0x3FE6A09E667F4BB8
  %conv1076 = fptrunc double %mul1075 to float
  %add1077 = fadd float %sub758, %conv1072
  %sub1078 = fsub float %add759, %conv1076
  %sub1079 = fsub float %sub758, %conv1072
  %add1080 = fadd float %add759, %conv1076
  %conv1081 = fpext float %add1003 to double
  %conv1083 = fpext float %sub1002 to double
  %neg1085 = fmul double %conv1083, 0xBFED906BCF32832F
  %261 = tail call double @llvm.fmuladd.f64(double %conv1081, double 0x3FD87DE2A6AEA312, double %neg1085)
  %conv1086 = fptrunc double %261 to float
  %mul1090 = fmul double %conv1081, 0x3FED906BCF32832F
  %262 = tail call double @llvm.fmuladd.f64(double %conv1083, double 0x3FD87DE2A6AEA312, double %mul1090)
  %conv1091 = fptrunc double %262 to float
  %add1092 = fadd float %sub770, %conv1086
  %sub1093 = fsub float %add771, %conv1091
  %sub1094 = fsub float %sub770, %conv1086
  %add1095 = fadd float %add771, %conv1091
  %add1096 = fadd float %add448, %add1004
  %re1100 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 0, i32 0
  store float %add1096, float* %re1100, align 4, !tbaa !18
  %add1101 = fadd float %add449, %add1005
  %im1105 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 0, i32 1
  store float %add1101, float* %im1105, align 4, !tbaa !21
  %sub1106 = fsub float %add448, %add1004
  %re1110 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom17, i32 0
  store float %sub1106, float* %re1110, align 4, !tbaa !18
  %sub1111 = fsub float %add449, %add1005
  %im1115 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom17, i32 1
  store float %sub1111, float* %im1115, align 4, !tbaa !21
  %conv1116 = fpext float %add1019 to double
  %conv1118 = fpext float %add1020 to double
  %mul1119 = fmul double %conv1118, 0x3FC8F8B83C6993FD
  %263 = tail call double @llvm.fmuladd.f64(double %conv1116, double 0x3FEF6297CFF75494, double %mul1119)
  %conv1120 = fptrunc double %263 to float
  %neg1125 = fmul double %conv1116, 0xBFC8F8B83C6993FD
  %264 = tail call double @llvm.fmuladd.f64(double %conv1118, double 0x3FEF6297CFF75494, double %neg1125)
  %conv1126 = fptrunc double %264 to float
  %add1127 = fadd float %add463, %conv1120
  %re1131 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom549, i32 0
  store float %add1127, float* %re1131, align 4, !tbaa !18
  %add1132 = fadd float %add464, %conv1126
  %im1136 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom549, i32 1
  store float %add1132, float* %im1136, align 4, !tbaa !21
  %sub1137 = fsub float %add463, %conv1120
  %re1141 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom570, i32 0
  store float %sub1137, float* %re1141, align 4, !tbaa !18
  %sub1142 = fsub float %add464, %conv1126
  %im1146 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom570, i32 1
  store float %sub1142, float* %im1146, align 4, !tbaa !21
  %conv1147 = fpext float %add1031 to double
  %conv1149 = fpext float %add1032 to double
  %mul1150 = fmul double %conv1149, 0x3FD87DE2A6AEA312
  %265 = tail call double @llvm.fmuladd.f64(double %conv1147, double 0x3FED906BCF32832F, double %mul1150)
  %conv1151 = fptrunc double %265 to float
  %neg1156 = fmul double %conv1147, 0xBFD87DE2A6AEA312
  %266 = tail call double @llvm.fmuladd.f64(double %conv1149, double 0x3FED906BCF32832F, double %neg1156)
  %conv1157 = fptrunc double %266 to float
  %add1158 = fadd float %add475, %conv1151
  %re1162 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom225, i32 0
  store float %add1158, float* %re1162, align 4, !tbaa !18
  %add1163 = fadd float %add476, %conv1157
  %im1167 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom225, i32 1
  store float %add1163, float* %im1167, align 4, !tbaa !21
  %sub1168 = fsub float %add475, %conv1151
  %re1172 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom246, i32 0
  store float %sub1168, float* %re1172, align 4, !tbaa !18
  %sub1173 = fsub float %add476, %conv1157
  %im1177 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom246, i32 1
  store float %sub1173, float* %im1177, align 4, !tbaa !21
  %conv1178 = fpext float %add1046 to double
  %conv1180 = fpext float %add1047 to double
  %mul1181 = fmul double %conv1180, 0x3FE1C73B39AE76C7
  %267 = tail call double @llvm.fmuladd.f64(double %conv1178, double 0x3FEA9B66290EB1A3, double %mul1181)
  %conv1182 = fptrunc double %267 to float
  %neg1187 = fmul double %conv1178, 0xBFE1C73B39AE76C7
  %268 = tail call double @llvm.fmuladd.f64(double %conv1180, double 0x3FEA9B66290EB1A3, double %neg1187)
  %conv1188 = fptrunc double %268 to float
  %add1189 = fadd float %add490, %conv1182
  %re1193 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom781, i32 0
  store float %add1189, float* %re1193, align 4, !tbaa !18
  %add1194 = fadd float %add491, %conv1188
  %im1198 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom781, i32 1
  store float %add1194, float* %im1198, align 4, !tbaa !21
  %sub1199 = fsub float %add490, %conv1182
  %re1203 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom802, i32 0
  store float %sub1199, float* %re1203, align 4, !tbaa !18
  %sub1204 = fsub float %add491, %conv1188
  %im1208 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom802, i32 1
  store float %sub1204, float* %im1208, align 4, !tbaa !21
  %add1209 = fadd float %add1050, %sub1051
  %conv1210 = fpext float %add1209 to double
  %mul1211 = fmul double %conv1210, 0x3FE6A09E667F4BB8
  %conv1212 = fptrunc double %mul1211 to float
  %sub1213 = fsub float %sub1051, %add1050
  %conv1214 = fpext float %sub1213 to double
  %mul1215 = fmul double %conv1214, 0x3FE6A09E667F4BB8
  %conv1216 = fptrunc double %mul1215 to float
  %add1217 = fadd float %add494, %conv1212
  %re1221 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom94, i32 0
  store float %add1217, float* %re1221, align 4, !tbaa !18
  %add1222 = fadd float %sub495, %conv1216
  %im1226 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom94, i32 1
  store float %add1222, float* %im1226, align 4, !tbaa !21
  %sub1227 = fsub float %add494, %conv1212
  %re1231 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom115, i32 0
  store float %sub1227, float* %re1231, align 4, !tbaa !18
  %sub1232 = fsub float %sub495, %conv1216
  %im1236 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom115, i32 1
  store float %sub1232, float* %im1236, align 4, !tbaa !21
  %conv1237 = fpext float %add1065 to double
  %conv1239 = fpext float %sub1066 to double
  %mul1240 = fmul double %conv1239, 0x3FEA9B66290EB1A3
  %269 = tail call double @llvm.fmuladd.f64(double %conv1237, double 0x3FE1C73B39AE76C7, double %mul1240)
  %conv1241 = fptrunc double %269 to float
  %neg1246 = fmul double %conv1237, 0xBFEA9B66290EB1A3
  %270 = tail call double @llvm.fmuladd.f64(double %conv1239, double 0x3FE1C73B39AE76C7, double %neg1246)
  %conv1247 = fptrunc double %270 to float
  %add1248 = fadd float %add509, %conv1241
  %re1252 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom649, i32 0
  store float %add1248, float* %re1252, align 4, !tbaa !18
  %add1253 = fadd float %sub510, %conv1247
  %im1257 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom649, i32 1
  store float %add1253, float* %im1257, align 4, !tbaa !21
  %sub1258 = fsub float %add509, %conv1241
  %re1262 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom670, i32 0
  store float %sub1258, float* %re1262, align 4, !tbaa !18
  %sub1263 = fsub float %sub510, %conv1247
  %im1267 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom670, i32 1
  store float %sub1263, float* %im1267, align 4, !tbaa !21
  %conv1268 = fpext float %add1077 to double
  %conv1270 = fpext float %sub1078 to double
  %mul1271 = fmul double %conv1270, 0x3FED906BCF32832F
  %271 = tail call double @llvm.fmuladd.f64(double %conv1268, double 0x3FD87DE2A6AEA312, double %mul1271)
  %conv1272 = fptrunc double %271 to float
  %neg1277 = fmul double %conv1268, 0xBFED906BCF32832F
  %272 = tail call double @llvm.fmuladd.f64(double %conv1270, double 0x3FD87DE2A6AEA312, double %neg1277)
  %conv1278 = fptrunc double %272 to float
  %add1279 = fadd float %add521, %conv1272
  %re1283 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom325, i32 0
  store float %add1279, float* %re1283, align 4, !tbaa !18
  %add1284 = fadd float %sub522, %conv1278
  %im1288 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom325, i32 1
  store float %add1284, float* %im1288, align 4, !tbaa !21
  %sub1289 = fsub float %add521, %conv1272
  %re1293 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom346, i32 0
  store float %sub1289, float* %re1293, align 4, !tbaa !18
  %sub1294 = fsub float %sub522, %conv1278
  %im1298 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom346, i32 1
  store float %sub1294, float* %im1298, align 4, !tbaa !21
  %conv1299 = fpext float %add1092 to double
  %conv1301 = fpext float %sub1093 to double
  %mul1302 = fmul double %conv1301, 0x3FEF6297CFF75494
  %273 = tail call double @llvm.fmuladd.f64(double %conv1299, double 0x3FC8F8B83C6993FD, double %mul1302)
  %conv1303 = fptrunc double %273 to float
  %neg1308 = fmul double %conv1299, 0xBFEF6297CFF75494
  %274 = tail call double @llvm.fmuladd.f64(double %conv1301, double 0x3FC8F8B83C6993FD, double %neg1308)
  %conv1309 = fptrunc double %274 to float
  %add1310 = fadd float %add536, %conv1303
  %re1314 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom881, i32 0
  store float %add1310, float* %re1314, align 4, !tbaa !18
  %add1315 = fadd float %sub537, %conv1309
  %im1319 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom881, i32 1
  store float %add1315, float* %im1319, align 4, !tbaa !21
  %sub1320 = fsub float %add536, %conv1303
  %re1324 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom902, i32 0
  store float %sub1320, float* %re1324, align 4, !tbaa !18
  %sub1325 = fsub float %sub537, %conv1309
  %im1329 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom902, i32 1
  store float %sub1325, float* %im1329, align 4, !tbaa !21
  %add1330 = fadd float %sub450, %sub1007
  %re1334 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom40, i32 0
  store float %add1330, float* %re1334, align 4, !tbaa !18
  %sub1335 = fsub float %sub451, %sub1006
  %im1339 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom40, i32 1
  store float %sub1335, float* %im1339, align 4, !tbaa !21
  %sub1340 = fsub float %sub450, %sub1007
  %re1344 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom61, i32 0
  store float %sub1340, float* %re1344, align 4, !tbaa !18
  %add1345 = fadd float %sub451, %sub1006
  %im1349 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom61, i32 1
  store float %add1345, float* %im1349, align 4, !tbaa !21
  %conv1350 = fpext float %sub1022 to double
  %conv1352 = fpext float %sub1021 to double
  %neg1354 = fmul double %conv1352, 0xBFC8F8B83C6993FD
  %275 = tail call double @llvm.fmuladd.f64(double %conv1350, double 0x3FEF6297CFF75494, double %neg1354)
  %conv1355 = fptrunc double %275 to float
  %mul1359 = fmul double %conv1350, 0x3FC8F8B83C6993FD
  %276 = tail call double @llvm.fmuladd.f64(double %conv1352, double 0x3FEF6297CFF75494, double %mul1359)
  %conv1360 = fptrunc double %276 to float
  %add1361 = fadd float %sub465, %conv1355
  %re1365 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom595, i32 0
  store float %add1361, float* %re1365, align 4, !tbaa !18
  %sub1366 = fsub float %sub466, %conv1360
  %im1370 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom595, i32 1
  store float %sub1366, float* %im1370, align 4, !tbaa !21
  %sub1371 = fsub float %sub465, %conv1355
  %re1375 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom616, i32 0
  store float %sub1371, float* %re1375, align 4, !tbaa !18
  %add1376 = fadd float %sub466, %conv1360
  %im1380 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom616, i32 1
  store float %add1376, float* %im1380, align 4, !tbaa !21
  %conv1381 = fpext float %sub1034 to double
  %conv1383 = fpext float %sub1033 to double
  %neg1385 = fmul double %conv1383, 0xBFD87DE2A6AEA312
  %277 = tail call double @llvm.fmuladd.f64(double %conv1381, double 0x3FED906BCF32832F, double %neg1385)
  %conv1386 = fptrunc double %277 to float
  %mul1390 = fmul double %conv1381, 0x3FD87DE2A6AEA312
  %278 = tail call double @llvm.fmuladd.f64(double %conv1383, double 0x3FED906BCF32832F, double %mul1390)
  %conv1391 = fptrunc double %278 to float
  %add1392 = fadd float %sub477, %conv1386
  %re1396 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom271, i32 0
  store float %add1392, float* %re1396, align 4, !tbaa !18
  %sub1397 = fsub float %sub478, %conv1391
  %im1401 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom271, i32 1
  store float %sub1397, float* %im1401, align 4, !tbaa !21
  %sub1402 = fsub float %sub477, %conv1386
  %re1406 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom292, i32 0
  store float %sub1402, float* %re1406, align 4, !tbaa !18
  %add1407 = fadd float %sub478, %conv1391
  %im1411 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom292, i32 1
  store float %add1407, float* %im1411, align 4, !tbaa !21
  %conv1412 = fpext float %sub1049 to double
  %conv1414 = fpext float %sub1048 to double
  %neg1416 = fmul double %conv1414, 0xBFE1C73B39AE76C7
  %279 = tail call double @llvm.fmuladd.f64(double %conv1412, double 0x3FEA9B66290EB1A3, double %neg1416)
  %conv1417 = fptrunc double %279 to float
  %mul1421 = fmul double %conv1412, 0x3FE1C73B39AE76C7
  %280 = tail call double @llvm.fmuladd.f64(double %conv1414, double 0x3FEA9B66290EB1A3, double %mul1421)
  %conv1422 = fptrunc double %280 to float
  %add1423 = fadd float %sub492, %conv1417
  %re1427 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom827, i32 0
  store float %add1423, float* %re1427, align 4, !tbaa !18
  %sub1428 = fsub float %sub493, %conv1422
  %im1432 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom827, i32 1
  store float %sub1428, float* %im1432, align 4, !tbaa !21
  %sub1433 = fsub float %sub492, %conv1417
  %re1437 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom848, i32 0
  store float %sub1433, float* %re1437, align 4, !tbaa !18
  %add1438 = fadd float %sub493, %conv1422
  %im1442 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom848, i32 1
  store float %add1438, float* %im1442, align 4, !tbaa !21
  %sub1443 = fsub float %add1053, %sub1052
  %conv1444 = fpext float %sub1443 to double
  %mul1445 = fmul double %conv1444, 0x3FE6A09E667F4BB8
  %conv1446 = fptrunc double %mul1445 to float
  %add1447 = fadd float %sub1052, %add1053
  %conv1448 = fpext float %add1447 to double
  %mul1449 = fmul double %conv1448, 0x3FE6A09E667F4BB8
  %conv1450 = fptrunc double %mul1449 to float
  %add1451 = fadd float %sub496, %conv1446
  %re1455 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom140, i32 0
  store float %add1451, float* %re1455, align 4, !tbaa !18
  %sub1456 = fsub float %add497, %conv1450
  %im1460 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom140, i32 1
  store float %sub1456, float* %im1460, align 4, !tbaa !21
  %sub1461 = fsub float %sub496, %conv1446
  %re1465 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom161, i32 0
  store float %sub1461, float* %re1465, align 4, !tbaa !18
  %add1466 = fadd float %add497, %conv1450
  %im1470 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom161, i32 1
  store float %add1466, float* %im1470, align 4, !tbaa !21
  %conv1471 = fpext float %add1068 to double
  %conv1473 = fpext float %sub1067 to double
  %neg1475 = fmul double %conv1473, 0xBFEA9B66290EB1A3
  %281 = tail call double @llvm.fmuladd.f64(double %conv1471, double 0x3FE1C73B39AE76C7, double %neg1475)
  %conv1476 = fptrunc double %281 to float
  %mul1480 = fmul double %conv1471, 0x3FEA9B66290EB1A3
  %282 = tail call double @llvm.fmuladd.f64(double %conv1473, double 0x3FE1C73B39AE76C7, double %mul1480)
  %conv1481 = fptrunc double %282 to float
  %add1482 = fadd float %sub511, %conv1476
  %re1486 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom695, i32 0
  store float %add1482, float* %re1486, align 4, !tbaa !18
  %sub1487 = fsub float %add512, %conv1481
  %im1491 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom695, i32 1
  store float %sub1487, float* %im1491, align 4, !tbaa !21
  %sub1492 = fsub float %sub511, %conv1476
  %re1496 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom716, i32 0
  store float %sub1492, float* %re1496, align 4, !tbaa !18
  %add1497 = fadd float %add512, %conv1481
  %im1501 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom716, i32 1
  store float %add1497, float* %im1501, align 4, !tbaa !21
  %conv1502 = fpext float %add1080 to double
  %conv1504 = fpext float %sub1079 to double
  %neg1506 = fmul double %conv1504, 0xBFED906BCF32832F
  %283 = tail call double @llvm.fmuladd.f64(double %conv1502, double 0x3FD87DE2A6AEA312, double %neg1506)
  %conv1507 = fptrunc double %283 to float
  %mul1511 = fmul double %conv1502, 0x3FED906BCF32832F
  %284 = tail call double @llvm.fmuladd.f64(double %conv1504, double 0x3FD87DE2A6AEA312, double %mul1511)
  %conv1512 = fptrunc double %284 to float
  %add1513 = fadd float %sub523, %conv1507
  %re1517 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom371, i32 0
  store float %add1513, float* %re1517, align 4, !tbaa !18
  %sub1518 = fsub float %add524, %conv1512
  %im1522 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom371, i32 1
  store float %sub1518, float* %im1522, align 4, !tbaa !21
  %sub1523 = fsub float %sub523, %conv1507
  %re1527 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom392, i32 0
  store float %sub1523, float* %re1527, align 4, !tbaa !18
  %add1528 = fadd float %add524, %conv1512
  %im1532 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom392, i32 1
  store float %add1528, float* %im1532, align 4, !tbaa !21
  %conv1533 = fpext float %add1095 to double
  %conv1535 = fpext float %sub1094 to double
  %neg1537 = fmul double %conv1535, 0xBFEF6297CFF75494
  %285 = tail call double @llvm.fmuladd.f64(double %conv1533, double 0x3FC8F8B83C6993FD, double %neg1537)
  %conv1538 = fptrunc double %285 to float
  %mul1542 = fmul double %conv1533, 0x3FEF6297CFF75494
  %286 = tail call double @llvm.fmuladd.f64(double %conv1535, double 0x3FC8F8B83C6993FD, double %mul1542)
  %conv1543 = fptrunc double %286 to float
  %add1544 = fadd float %sub538, %conv1538
  %re1548 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom927, i32 0
  store float %add1544, float* %re1548, align 4, !tbaa !18
  %sub1549 = fsub float %add539, %conv1543
  %im1553 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom927, i32 1
  store float %sub1549, float* %im1553, align 4, !tbaa !21
  %sub1554 = fsub float %sub538, %conv1538
  %re1558 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom948, i32 0
  store float %sub1554, float* %re1558, align 4, !tbaa !18
  %add1559 = fadd float %add539, %conv1543
  %im1563 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 %idxprom948, i32 1
  store float %add1559, float* %im1563, align 4, !tbaa !21
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %indvars.iv.next = add i64 %indvars.iv, %1
  %incdec.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.05, i64 1
  %exitcond.not = icmp eq i64 %indvars.iv.next37, %wide.trip.count
  br i1 %exitcond.not, label %cleanup, label %for.body, !llvm.loop !82

if.end:                                           ; preds = %entry, %det.cont
  %a.tr3 = phi i32 [ %div, %det.cont ], [ %a, %entry ]
  %add1565 = add nsw i32 %a.tr3, %b
  %div = sdiv i32 %add1565, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @fft_twiddle_32(i32 noundef %a.tr3, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nWdn, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %sub = sub nsw i32 %b, %div
  %cmp = icmp slt i32 %sub, 128
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !83

cleanup:                                          ; preds = %for.body, %if.then
  sync within %syncreg, label %cleanup.split

cleanup.split:                                    ; preds = %cleanup
  ret void
}

; Function Attrs: argmemonly nounwind uwtable
define internal fastcc void @fft_twiddle_gen(i32 noundef %i, i32 noundef %i1, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nW, i32 noundef %nWdn, i32 noundef %r, i32 noundef %m) unnamed_addr #8 {
entry:
  %syncreg = tail call token @llvm.syncregion.start()
  %sub = add nsw i32 %i1, -1
  %cmp29 = icmp eq i32 %sub, %i
  br i1 %cmp29, label %if.then, label %if.end

if.then:                                          ; preds = %det.cont, %entry
  %i.tr.lcssa = phi i32 [ %i, %entry ], [ %sub, %det.cont ]
  %idx.ext = sext i32 %i.tr.lcssa to i64
  %add.ptr = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %in, i64 %idx.ext
  %cmp63.i = icmp sgt i32 %r, 0
  br i1 %cmp63.i, label %for.body.lr.ph.i, label %return

for.body.lr.ph.i:                                 ; preds = %if.then
  %add.ptr2 = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %out, i64 %idx.ext
  %idx.ext.i = sext i32 %m to i64
  br label %for.body.us.i

for.body.us.i:                                    ; preds = %for.cond1.for.end_crit_edge.us.i, %for.body.lr.ph.i
  %k.065.us.i = phi i32 [ 0, %for.body.lr.ph.i ], [ %inc19.us.i, %for.cond1.for.end_crit_edge.us.i ]
  %kp.064.us.i = phi %struct.COMPLEX* [ %add.ptr2, %for.body.lr.ph.i ], [ %add.ptr21.us.i, %for.cond1.for.end_crit_edge.us.i ]
  %mul.us.i = mul i32 %k.065.us.i, %m
  %reass.add = add i32 %mul.us.i, %i.tr.lcssa
  %reass.mul = mul i32 %reass.add, %nWdn
  br label %for.body3.us.i

for.body3.us.i:                                   ; preds = %for.body3.us.i, %for.body.us.i
  %l0.061.us.i = phi i32 [ 0, %for.body.us.i ], [ %spec.select.us.i, %for.body3.us.i ]
  %j.060.us.i = phi i32 [ 0, %for.body.us.i ], [ %inc.us.i, %for.body3.us.i ]
  %jp.059.us.i = phi %struct.COMPLEX* [ %add.ptr, %for.body.us.i ], [ %add.ptr.us.i, %for.body3.us.i ]
  %0 = phi <2 x float> [ zeroinitializer, %for.body.us.i ], [ %12, %for.body3.us.i ]
  %idxprom.us.i = sext i32 %l0.061.us.i to i64
  %re.us.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %W, i64 %idxprom.us.i, i32 0
  %1 = bitcast float* %re.us.i to <2 x float>*
  %2 = load <2 x float>, <2 x float>* %1, align 4, !tbaa !25
  %re6.us.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.059.us.i, i64 0, i32 0
  %3 = load float, float* %re6.us.i, align 4, !tbaa !18
  %im7.us.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.059.us.i, i64 0, i32 1
  %4 = load float, float* %im7.us.i, align 4, !tbaa !21
  %5 = fneg float %4
  %6 = insertelement <2 x float> poison, float %4, i64 0
  %7 = insertelement <2 x float> %6, float %5, i64 1
  %8 = fmul <2 x float> %2, %7
  %shuffle = shufflevector <2 x float> %8, <2 x float> poison, <2 x i32> <i32 1, i32 0>
  %9 = insertelement <2 x float> poison, float %3, i64 0
  %10 = shufflevector <2 x float> %9, <2 x float> poison, <2 x i32> zeroinitializer
  %11 = call <2 x float> @llvm.fmuladd.v2f32(<2 x float> %10, <2 x float> %2, <2 x float> %shuffle)
  %12 = fadd <2 x float> %0, %11
  %add14.us.i = add i32 %reass.mul, %l0.061.us.i
  %cmp15.us.i = icmp sgt i32 %add14.us.i, %nW
  %sub.us.i = select i1 %cmp15.us.i, i32 %nW, i32 0
  %spec.select.us.i = sub nsw i32 %add14.us.i, %sub.us.i
  %inc.us.i = add nuw nsw i32 %j.060.us.i, 1
  %add.ptr.us.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %jp.059.us.i, i64 %idx.ext.i
  %exitcond.not.i = icmp eq i32 %inc.us.i, %r
  br i1 %exitcond.not.i, label %for.cond1.for.end_crit_edge.us.i, label %for.body3.us.i, !llvm.loop !84

for.cond1.for.end_crit_edge.us.i:                 ; preds = %for.body3.us.i
  %re16.us.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.064.us.i, i64 0, i32 0
  %13 = extractelement <2 x float> %12, i64 0
  store float %13, float* %re16.us.i, align 4, !tbaa !18
  %im17.us.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.064.us.i, i64 0, i32 1
  %14 = extractelement <2 x float> %12, i64 1
  store float %14, float* %im17.us.i, align 4, !tbaa !21
  %inc19.us.i = add nuw nsw i32 %k.065.us.i, 1
  %add.ptr21.us.i = getelementptr inbounds %struct.COMPLEX, %struct.COMPLEX* %kp.064.us.i, i64 %idx.ext.i
  %exitcond66.not.i = icmp eq i32 %inc19.us.i, %r
  br i1 %exitcond66.not.i, label %return, label %for.body.us.i, !llvm.loop !85

if.end:                                           ; preds = %entry, %det.cont
  %i.tr30 = phi i32 [ %div, %det.cont ], [ %i, %entry ]
  %add = add nsw i32 %i.tr30, %i1
  %div = sdiv i32 %add, 2
  detach within %syncreg, label %det.achd, label %det.cont

det.achd:                                         ; preds = %if.end
  tail call fastcc void @fft_twiddle_gen(i32 noundef %i.tr30, i32 noundef %div, %struct.COMPLEX* noundef %in, %struct.COMPLEX* noundef %out, %struct.COMPLEX* noundef %W, i32 noundef %nW, i32 noundef %nWdn, i32 noundef %r, i32 noundef %m)
  reattach within %syncreg, label %det.cont

det.cont:                                         ; preds = %det.achd, %if.end
  %cmp = icmp eq i32 %sub, %div
  br i1 %cmp, label %if.then, label %if.end, !llvm.loop !86

return:                                           ; preds = %for.cond1.for.end_crit_edge.us.i, %if.then
  sync within %syncreg, label %return.split

return.split:                                     ; preds = %return
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #11

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #14

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #14

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #15

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <4 x double> @llvm.fmuladd.v4f64(<4 x double>, <4 x double>, <4 x double>) #15

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #15

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <2 x float> @llvm.fmuladd.v2f32(<2 x float>, <2 x float>, <2 x float>) #15

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noinline nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { argmemonly mustprogress nounwind willreturn }
attributes #4 = { mustprogress nofree nounwind willreturn writeonly "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { argmemonly nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #12 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nofree nounwind }
attributes #15 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #16 = { nounwind }
attributes #17 = { cold }
attributes #18 = { cold nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang 7bd465c3ab0afbef62b430a362e3cd897fef2fd6)"}
!3 = !{!4, !5, i64 0}
!4 = !{!"timeval", !5, i64 0, !5, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!4, !5, i64 8}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !6, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"tapir.loop.spawn.strategy", i32 1}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !6, i64 0}
!17 = distinct !{!17, !14}
!18 = !{!19, !20, i64 0}
!19 = !{!"", !20, i64 0, !20, i64 4}
!20 = !{!"float", !6, i64 0}
!21 = !{!19, !20, i64 4}
!22 = distinct !{!22, !14}
!23 = distinct !{!23, !24}
!24 = !{!"tapir.loop.grainsize", i32 1}
!25 = !{!20, !20, i64 0}
!26 = distinct !{!26, !12, !24}
!27 = distinct !{!27, !14}
!28 = !{i64 0, i64 4, !25, i64 4, i64 4, !25}
!29 = !{i64 0, i64 4, !25}
!30 = distinct !{!30, !12}
!31 = distinct !{!31, !14, !32}
!32 = !{!"llvm.loop.isvectorized", i32 1}
!33 = distinct !{!33, !14, !34, !32}
!34 = !{!"llvm.loop.unroll.runtime.disable"}
!35 = distinct !{!35, !14}
!36 = distinct !{!36, !14}
!37 = distinct !{!37, !14}
!38 = distinct !{!38, !14}
!39 = distinct !{!39, !14, !32}
!40 = distinct !{!40, !41}
!41 = !{!"llvm.loop.unroll.disable"}
!42 = distinct !{!42, !14, !34, !32}
!43 = !{!44, !44, i64 0}
!44 = !{!"any pointer", !6, i64 0}
!45 = distinct !{!45, !14}
!46 = !{!5, !5, i64 0}
!47 = distinct !{!47, !14}
!48 = distinct !{!48, !24}
!49 = distinct !{!49, !14}
!50 = distinct !{!50, !24}
!51 = distinct !{!51, !14}
!52 = distinct !{!52, !24}
!53 = distinct !{!53, !14}
!54 = distinct !{!54, !24}
!55 = !{!56}
!56 = distinct !{!56, !57}
!57 = distinct !{!57, !"LVerDomain"}
!58 = !{!59, !60, !61}
!59 = distinct !{!59, !57}
!60 = distinct !{!60, !57}
!61 = distinct !{!61, !57}
!62 = !{!59}
!63 = !{!60, !61}
!64 = distinct !{!64, !14, !32}
!65 = distinct !{!65, !41}
!66 = distinct !{!66, !14, !32}
!67 = distinct !{!67, !24}
!68 = distinct !{!68, !14}
!69 = distinct !{!69, !14}
!70 = distinct !{!70, !14}
!71 = distinct !{!71, !41}
!72 = distinct !{!72, !41}
!73 = distinct !{!73, !24}
!74 = distinct !{!74, !14}
!75 = distinct !{!75, !24}
!76 = distinct !{!76, !14}
!77 = distinct !{!77, !24}
!78 = distinct !{!78, !14}
!79 = distinct !{!79, !24}
!80 = distinct !{!80, !14}
!81 = distinct !{!81, !24}
!82 = distinct !{!82, !14}
!83 = distinct !{!83, !24}
!84 = distinct !{!84, !14}
!85 = distinct !{!85, !14}
!86 = distinct !{!86, !24}
