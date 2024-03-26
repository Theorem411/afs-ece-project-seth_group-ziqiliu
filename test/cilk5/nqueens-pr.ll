; ModuleID = './nqueens.ll'
source_filename = "nqueens.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [32 x i8] c"Usage: %s [<cilk-options>] <n>\0A\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"Use default board size, n = 13.\0A\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"Running %s with n = %d.\0A\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"PBBS-time: %f\0A\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"No solution found.\0A\00", align 1
@.str.5 = private unnamed_addr constant [32 x i8] c"Total number of solutions : %d\0A\00", align 1

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i64 @todval(%struct.timeval* nocapture noundef readonly %tp) local_unnamed_addr #0 !dbg !14 {
entry:
  call void @llvm.dbg.value(metadata %struct.timeval* %tp, metadata !29, metadata !DIExpression()), !dbg !30
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 0, !dbg !31
  %0 = load i64, i64* %tv_sec, align 8, !dbg !31, !tbaa !32
  %mul1 = mul i64 %0, 1000000, !dbg !37
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 1, !dbg !38
  %1 = load i64, i64* %tv_usec, align 8, !dbg !38, !tbaa !39
  %add = add nsw i64 %mul1, %1, !dbg !40
  ret i64 %add, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable writeonly
define dso_local void @startup_cilk() local_unnamed_addr #2 !dbg !42 {
entry:
  %g = alloca double, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !55
  %g.0.g.0.g.0..sroa_cast = bitcast double* %g to i8*, !dbg !56
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !56
  call void @llvm.dbg.value(metadata double 2.000000e+00, metadata !46, metadata !DIExpression()), !dbg !55
  store double 2.000000e+00, double* %g, align 8, !dbg !57, !tbaa !58
  call void @llvm.dbg.value(metadata i32 0, metadata !48, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.value(metadata i32 1000, metadata !50, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.value(metadata i32 0, metadata !51, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.value(metadata i32 1000, metadata !52, metadata !DIExpression()), !dbg !60
  br label %pfor.cond, !dbg !61

pfor.cond:                                        ; preds = %pfor.inc, %entry
  %__begin.0 = phi i32 [ 0, %entry ], [ %inc, %pfor.inc ], !dbg !60
  call void @llvm.dbg.value(metadata i32 %__begin.0, metadata !51, metadata !DIExpression()), !dbg !60
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc, !dbg !62

pfor.body.entry:                                  ; preds = %pfor.cond
  call void @llvm.dbg.value(metadata !DIArgList(i32 0, i32 %__begin.0), metadata !53, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !63
  %g.0.g.0.g.0. = load double, double* %g, align 8, !dbg !64, !tbaa !58
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !46, metadata !DIExpression()), !dbg !55
  %call = tail call double @sin(double noundef %g.0.g.0.g.0.) #15, !dbg !66
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !46, metadata !DIExpression()), !dbg !55
  %div3 = fdiv double %g.0.g.0.g.0., %call, !dbg !67
  call void @llvm.dbg.value(metadata double %div3, metadata !46, metadata !DIExpression()), !dbg !55
  store double %div3, double* %g, align 8, !dbg !67, !tbaa !58
  reattach within %syncreg, label %pfor.inc, !dbg !68

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %inc = add nuw nsw i32 %__begin.0, 1, !dbg !69
  call void @llvm.dbg.value(metadata i32 %inc, metadata !51, metadata !DIExpression()), !dbg !60
  %exitcond.not = icmp eq i32 %inc, 1000, !dbg !70
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !dbg !71, !llvm.loop !72

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %cleanup, !dbg !71

cleanup:                                          ; preds = %pfor.cond.cleanup
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !75
  ret void, !dbg !75
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare token @llvm.syncregion.start() #4

; Function Attrs: mustprogress nofree nounwind willreturn writeonly
declare dso_local double @sin(double noundef) local_unnamed_addr #5

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nofree norecurse nosync nounwind readonly uwtable
define dso_local i32 @ok(i32 noundef %n, i8* nocapture noundef readonly %a) local_unnamed_addr #6 !dbg !76 {
entry:
  call void @llvm.dbg.value(metadata i32 %n, metadata !80, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.value(metadata i8* %a, metadata !81, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.value(metadata i32 0, metadata !82, metadata !DIExpression()), !dbg !86
  %cmp47 = icmp sgt i32 %n, 0, !dbg !87
  br i1 %cmp47, label %for.body.preheader, label %cleanup, !dbg !90

for.body.preheader:                               ; preds = %entry
  %0 = zext i32 %n to i64, !dbg !90
  br label %for.body, !dbg !90

for.cond.loopexit:                                ; preds = %for.cond1, %for.body
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next54, metadata !82, metadata !DIExpression()), !dbg !86
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !90
  %exitcond57.not = icmp eq i64 %indvars.iv.next54, %0, !dbg !87
  br i1 %exitcond57.not, label %cleanup, label %for.body, !dbg !90, !llvm.loop !91

for.body:                                         ; preds = %for.cond.loopexit, %for.body.preheader
  %indvars.iv53 = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next54, %for.cond.loopexit ]
  %indvars.iv = phi i64 [ 1, %for.body.preheader ], [ %indvars.iv.next, %for.cond.loopexit ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv53, metadata !82, metadata !DIExpression()), !dbg !86
  %arrayidx = getelementptr inbounds i8, i8* %a, i64 %indvars.iv53, !dbg !94
  %1 = load i8, i8* %arrayidx, align 1, !dbg !94, !tbaa !96
  call void @llvm.dbg.value(metadata i8 %1, metadata !84, metadata !DIExpression()), !dbg !86
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1, !dbg !97
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next54, metadata !83, metadata !DIExpression()), !dbg !86
  %cmp245 = icmp ult i64 %indvars.iv.next54, %0, !dbg !99
  br i1 %cmp245, label %for.body3.lr.ph, label %for.cond.loopexit, !dbg !101

for.body3.lr.ph:                                  ; preds = %for.body
  %conv6 = sext i8 %1 to i32
  %2 = trunc i64 %indvars.iv53 to i32
  br label %for.body3, !dbg !101

for.cond1:                                        ; preds = %lor.lhs.false
  call void @llvm.dbg.value(metadata i32 undef, metadata !83, metadata !DIExpression()), !dbg !86
  %exitcond.not = icmp eq i64 %indvars.iv.next51, %0, !dbg !99
  br i1 %exitcond.not, label %for.cond.loopexit, label %for.body3, !dbg !101, !llvm.loop !102

for.body3:                                        ; preds = %for.cond1, %for.body3.lr.ph
  %indvars.iv50 = phi i64 [ %indvars.iv, %for.body3.lr.ph ], [ %indvars.iv.next51, %for.cond1 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv50, metadata !83, metadata !DIExpression()), !dbg !86
  %arrayidx5 = getelementptr inbounds i8, i8* %a, i64 %indvars.iv50, !dbg !104
  %3 = load i8, i8* %arrayidx5, align 1, !dbg !104, !tbaa !96
  call void @llvm.dbg.value(metadata i8 %3, metadata !85, metadata !DIExpression()), !dbg !86
  %conv = sext i8 %3 to i32, !dbg !106
  %cmp7 = icmp eq i8 %3, %1, !dbg !108
  br i1 %cmp7, label %cleanup, label %lor.lhs.false, !dbg !109

lor.lhs.false:                                    ; preds = %for.body3
  %4 = trunc i64 %indvars.iv50 to i32, !dbg !110
  %sub = sub nsw i32 %4, %2, !dbg !110
  %sub11 = sub nsw i32 %conv6, %sub, !dbg !111
  %cmp12 = icmp eq i32 %sub11, %conv, !dbg !112
  %add18 = add nsw i32 %sub, %conv6
  %cmp19 = icmp eq i32 %add18, %conv
  %or.cond = select i1 %cmp12, i1 true, i1 %cmp19, !dbg !113
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1, !dbg !114
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next51, metadata !83, metadata !DIExpression()), !dbg !86
  br i1 %or.cond, label %cleanup, label %for.cond1, !dbg !113

cleanup:                                          ; preds = %lor.lhs.false, %for.body3, %for.cond.loopexit, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %lor.lhs.false ], [ 0, %for.body3 ], [ 1, %for.cond.loopexit ], !dbg !86
  ret i32 %retval.0, !dbg !115
}

; Function Attrs: argmemonly nounwind uwtable
define dso_local void @nqueens(i32 noundef %n, i32 noundef %j, i8* nocapture noundef readonly %a, i32* nocapture noundef writeonly %res) local_unnamed_addr #7 !dbg !116 {
entry:
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !128
  call void @llvm.dbg.value(metadata i32 %n, metadata !120, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.value(metadata i32 %j, metadata !121, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.value(metadata i8* %a, metadata !122, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.value(metadata i32* %res, metadata !123, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.value(metadata i32 0, metadata !127, metadata !DIExpression()), !dbg !134
  %cmp = icmp eq i32 %n, %j, !dbg !135
  br i1 %cmp, label %cleanup, label %if.end, !dbg !137

if.end:                                           ; preds = %entry
  %conv = sext i32 %n to i64, !dbg !138
  %mul = shl nsw i64 %conv, 2, !dbg !138
  %0 = alloca i32, i64 %conv, align 16, !dbg !138
  %tmpcast = bitcast i32* %0 to i8*, !dbg !138
  call void @llvm.dbg.value(metadata i32* %0, metadata !126, metadata !DIExpression()), !dbg !134
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 %tmpcast, i8 0, i64 %mul, i1 false), !dbg !139
  call void @llvm.dbg.value(metadata i32 0, metadata !125, metadata !DIExpression()), !dbg !134
  %cmp358 = icmp sgt i32 %n, 0, !dbg !140
  br i1 %cmp358, label %for.body.lr.ph, label %for.end, !dbg !141

for.body.lr.ph:                                   ; preds = %if.end
  %add = add nsw i32 %j, 1
  %conv5 = sext i32 %add to i64
  %conv7 = sext i32 %j to i64
  %cmp47.i = icmp sgt i32 %j, -1
  %1 = zext i32 %add to i64
  %wide.trip.count70 = zext i32 %n to i64, !dbg !140
  br i1 %cmp47.i, label %for.body.us, label %for.body, !dbg !142

for.body.us:                                      ; preds = %for.inc.us, %for.body.lr.ph
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.inc.us ], [ 0, %for.body.lr.ph ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv67, metadata !125, metadata !DIExpression()), !dbg !134
  %2 = alloca i8, i64 %conv5, align 16, !dbg !144
  call void @llvm.dbg.value(metadata i8* %2, metadata !124, metadata !DIExpression()), !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %2, i8* align 1 %a, i64 %conv7, i1 false), !dbg !145
  %conv9.us = trunc i64 %indvars.iv67 to i8, !dbg !146
  %arrayidx.us = getelementptr inbounds i8, i8* %2, i64 %conv7, !dbg !147
  store i8 %conv9.us, i8* %arrayidx.us, align 1, !dbg !148, !tbaa !96
  call void @llvm.dbg.value(metadata i32 %add, metadata !80, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.value(metadata i8* %2, metadata !81, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.value(metadata i32 0, metadata !82, metadata !DIExpression()), !dbg !149
  br label %for.body.i.us, !dbg !142

for.body.i.us:                                    ; preds = %for.cond.loopexit.i.us, %for.body.us
  %indvars.iv53.i.us = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next54.i.us, %for.cond.loopexit.i.us ]
  %indvars.iv.i.us = phi i64 [ 1, %for.body.us ], [ %indvars.iv.next.i.us, %for.cond.loopexit.i.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv53.i.us, metadata !82, metadata !DIExpression()), !dbg !149
  %arrayidx.i.us = getelementptr inbounds i8, i8* %2, i64 %indvars.iv53.i.us, !dbg !150
  %3 = load i8, i8* %arrayidx.i.us, align 1, !dbg !150, !tbaa !96
  call void @llvm.dbg.value(metadata i8 %3, metadata !84, metadata !DIExpression()), !dbg !149
  %indvars.iv.next54.i.us = add nuw nsw i64 %indvars.iv53.i.us, 1, !dbg !151
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next54.i.us, metadata !83, metadata !DIExpression()), !dbg !149
  %cmp245.i.us = icmp ult i64 %indvars.iv.next54.i.us, %1, !dbg !152
  br i1 %cmp245.i.us, label %for.body3.lr.ph.i.us, label %for.cond.loopexit.i.us, !dbg !153

for.body3.lr.ph.i.us:                             ; preds = %for.body.i.us
  %conv6.i.us = sext i8 %3 to i32
  %4 = trunc i64 %indvars.iv53.i.us to i32
  br label %for.body3.i.us, !dbg !153

for.body3.i.us:                                   ; preds = %for.cond1.i.us, %for.body3.lr.ph.i.us
  %indvars.iv50.i.us = phi i64 [ %indvars.iv.i.us, %for.body3.lr.ph.i.us ], [ %indvars.iv.next51.i.us, %for.cond1.i.us ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv50.i.us, metadata !83, metadata !DIExpression()), !dbg !149
  %arrayidx5.i.us = getelementptr inbounds i8, i8* %2, i64 %indvars.iv50.i.us, !dbg !154
  %5 = load i8, i8* %arrayidx5.i.us, align 1, !dbg !154, !tbaa !96
  call void @llvm.dbg.value(metadata i8 %5, metadata !85, metadata !DIExpression()), !dbg !149
  %conv.i.us = sext i8 %5 to i32, !dbg !155
  %cmp7.i.us = icmp eq i8 %5, %3, !dbg !156
  br i1 %cmp7.i.us, label %for.inc.us, label %lor.lhs.false.i.us, !dbg !157

lor.lhs.false.i.us:                               ; preds = %for.body3.i.us
  %6 = trunc i64 %indvars.iv50.i.us to i32, !dbg !158
  %sub.i.us = sub nsw i32 %6, %4, !dbg !158
  %sub11.i.us = sub nsw i32 %conv6.i.us, %sub.i.us, !dbg !159
  %cmp12.i.us = icmp eq i32 %sub11.i.us, %conv.i.us, !dbg !160
  %add18.i.us = add nsw i32 %sub.i.us, %conv6.i.us
  %cmp19.i.us = icmp eq i32 %add18.i.us, %conv.i.us
  %or.cond.i.us = select i1 %cmp12.i.us, i1 true, i1 %cmp19.i.us, !dbg !161
  %indvars.iv.next51.i.us = add nuw nsw i64 %indvars.iv50.i.us, 1, !dbg !162
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next51.i.us, metadata !83, metadata !DIExpression()), !dbg !149
  br i1 %or.cond.i.us, label %for.inc.us, label %for.cond1.i.us, !dbg !161

for.cond1.i.us:                                   ; preds = %lor.lhs.false.i.us
  call void @llvm.dbg.value(metadata i32 undef, metadata !83, metadata !DIExpression()), !dbg !149
  %exitcond.not.i.us = icmp eq i64 %indvars.iv.next51.i.us, %1, !dbg !152
  br i1 %exitcond.not.i.us, label %for.cond.loopexit.i.us, label %for.body3.i.us, !dbg !153, !llvm.loop !163

for.cond.loopexit.i.us:                           ; preds = %for.cond1.i.us, %for.body.i.us
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next54.i.us, metadata !82, metadata !DIExpression()), !dbg !149
  %indvars.iv.next.i.us = add nuw nsw i64 %indvars.iv.i.us, 1, !dbg !142
  %exitcond57.not.i.us = icmp eq i64 %indvars.iv.next54.i.us, %1, !dbg !165
  br i1 %exitcond57.not.i.us, label %if.then11.tf.loopexit.us, label %for.body.i.us, !dbg !142, !llvm.loop !166

det.achd.us:                                      ; preds = %if.then11.tf.loopexit.us
  %arrayidx14.us = getelementptr inbounds i32, i32* %0, i64 %indvars.iv67, !dbg !168
  call void @nqueens(i32 noundef %n, i32 noundef %add, i8* noundef nonnull %2, i32* noundef nonnull %arrayidx14.us), !dbg !169
  reattach within %syncreg, label %for.inc.us, !dbg !169

for.inc.us:                                       ; preds = %if.then11.tf.loopexit.us, %det.achd.us, %lor.lhs.false.i.us, %for.body3.i.us
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1, !dbg !170
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next68, metadata !125, metadata !DIExpression()), !dbg !134
  %exitcond71.not = icmp eq i64 %indvars.iv.next68, %wide.trip.count70, !dbg !140
  br i1 %exitcond71.not, label %for.end, label %for.body.us, !dbg !141, !llvm.loop !171

if.then11.tf.loopexit.us:                         ; preds = %for.cond.loopexit.i.us
  detach within %syncreg, label %det.achd.us, label %for.inc.us, !dbg !169

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.lr.ph ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !125, metadata !DIExpression()), !dbg !134
  %7 = alloca i8, i64 %conv5, align 16, !dbg !144
  call void @llvm.dbg.value(metadata i8* %7, metadata !124, metadata !DIExpression()), !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %7, i8* align 1 %a, i64 %conv7, i1 false), !dbg !145
  %conv9 = trunc i64 %indvars.iv to i8, !dbg !146
  %arrayidx = getelementptr inbounds i8, i8* %7, i64 %conv7, !dbg !147
  store i8 %conv9, i8* %arrayidx, align 1, !dbg !148, !tbaa !96
  call void @llvm.dbg.value(metadata i32 %add, metadata !80, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.value(metadata i8* %7, metadata !81, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.value(metadata i32 0, metadata !82, metadata !DIExpression()), !dbg !149
  detach within %syncreg, label %det.achd, label %for.inc, !dbg !169

det.achd:                                         ; preds = %for.body
  %arrayidx14 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv, !dbg !168
  call void @nqueens(i32 noundef %n, i32 noundef %add, i8* noundef nonnull %7, i32* noundef nonnull %arrayidx14), !dbg !169
  reattach within %syncreg, label %for.inc, !dbg !169

for.inc:                                          ; preds = %det.achd, %for.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1, !dbg !170
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !125, metadata !DIExpression()), !dbg !134
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count70, !dbg !140
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !141, !llvm.loop !173

for.end:                                          ; preds = %for.inc, %for.inc.us, %if.end
  sync within %syncreg, label %for.end.split, !dbg !175

for.end.split:                                    ; preds = %for.end
  call void @llvm.dbg.value(metadata i32 0, metadata !127, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.value(metadata i32 0, metadata !125, metadata !DIExpression()), !dbg !134
  br i1 %cmp358, label %for.body19.preheader, label %cleanup, !dbg !176

for.body19.preheader:                             ; preds = %for.end.split
  %wide.trip.count75 = zext i32 %n to i64, !dbg !178
  %min.iters.check = icmp ult i32 %n, 8, !dbg !176
  br i1 %min.iters.check, label %for.body19.preheader82, label %vector.ph, !dbg !176

vector.ph:                                        ; preds = %for.body19.preheader
  %n.vec = and i64 %wide.trip.count75, 4294967288, !dbg !176
  %8 = add nsw i64 %n.vec, -8, !dbg !176
  %9 = lshr exact i64 %8, 3, !dbg !176
  %10 = add nuw nsw i64 %9, 1, !dbg !176
  %xtraiter = and i64 %10, 3, !dbg !176
  %11 = icmp ult i64 %8, 24, !dbg !176
  br i1 %11, label %middle.block.unr-lcssa, label %vector.ph.new, !dbg !176

vector.ph.new:                                    ; preds = %vector.ph
  %unroll_iter = and i64 %10, 4611686018427387900, !dbg !176
  br label %vector.body, !dbg !176

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ 0, %vector.ph.new ], [ %index.next.3, %vector.body ], !dbg !180
  %vec.phi = phi <4 x i32> [ zeroinitializer, %vector.ph.new ], [ %34, %vector.body ]
  %vec.phi80 = phi <4 x i32> [ zeroinitializer, %vector.ph.new ], [ %35, %vector.body ]
  %niter = phi i64 [ 0, %vector.ph.new ], [ %niter.next.3, %vector.body ]
  %12 = getelementptr inbounds i32, i32* %0, i64 %index, !dbg !180
  %13 = bitcast i32* %12 to <4 x i32>*, !dbg !181
  %wide.load = load <4 x i32>, <4 x i32>* %13, align 16, !dbg !181, !tbaa !183
  %14 = getelementptr inbounds i32, i32* %12, i64 4, !dbg !181
  %15 = bitcast i32* %14 to <4 x i32>*, !dbg !181
  %wide.load81 = load <4 x i32>, <4 x i32>* %15, align 16, !dbg !181, !tbaa !183
  %16 = add <4 x i32> %wide.load, %vec.phi, !dbg !185
  %17 = add <4 x i32> %wide.load81, %vec.phi80, !dbg !185
  %index.next = or i64 %index, 8, !dbg !180
  %18 = getelementptr inbounds i32, i32* %0, i64 %index.next, !dbg !180
  %19 = bitcast i32* %18 to <4 x i32>*, !dbg !181
  %wide.load.1 = load <4 x i32>, <4 x i32>* %19, align 16, !dbg !181, !tbaa !183
  %20 = getelementptr inbounds i32, i32* %18, i64 4, !dbg !181
  %21 = bitcast i32* %20 to <4 x i32>*, !dbg !181
  %wide.load81.1 = load <4 x i32>, <4 x i32>* %21, align 16, !dbg !181, !tbaa !183
  %22 = add <4 x i32> %wide.load.1, %16, !dbg !185
  %23 = add <4 x i32> %wide.load81.1, %17, !dbg !185
  %index.next.1 = or i64 %index, 16, !dbg !180
  %24 = getelementptr inbounds i32, i32* %0, i64 %index.next.1, !dbg !180
  %25 = bitcast i32* %24 to <4 x i32>*, !dbg !181
  %wide.load.2 = load <4 x i32>, <4 x i32>* %25, align 16, !dbg !181, !tbaa !183
  %26 = getelementptr inbounds i32, i32* %24, i64 4, !dbg !181
  %27 = bitcast i32* %26 to <4 x i32>*, !dbg !181
  %wide.load81.2 = load <4 x i32>, <4 x i32>* %27, align 16, !dbg !181, !tbaa !183
  %28 = add <4 x i32> %wide.load.2, %22, !dbg !185
  %29 = add <4 x i32> %wide.load81.2, %23, !dbg !185
  %index.next.2 = or i64 %index, 24, !dbg !180
  %30 = getelementptr inbounds i32, i32* %0, i64 %index.next.2, !dbg !180
  %31 = bitcast i32* %30 to <4 x i32>*, !dbg !181
  %wide.load.3 = load <4 x i32>, <4 x i32>* %31, align 16, !dbg !181, !tbaa !183
  %32 = getelementptr inbounds i32, i32* %30, i64 4, !dbg !181
  %33 = bitcast i32* %32 to <4 x i32>*, !dbg !181
  %wide.load81.3 = load <4 x i32>, <4 x i32>* %33, align 16, !dbg !181, !tbaa !183
  %34 = add <4 x i32> %wide.load.3, %28, !dbg !185
  %35 = add <4 x i32> %wide.load81.3, %29, !dbg !185
  %index.next.3 = add nuw i64 %index, 32, !dbg !180
  %niter.next.3 = add i64 %niter, 4, !dbg !180
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter, !dbg !180
  br i1 %niter.ncmp.3, label %middle.block.unr-lcssa, label %vector.body, !dbg !180, !llvm.loop !186

middle.block.unr-lcssa:                           ; preds = %vector.body, %vector.ph
  %.lcssa83.ph = phi <4 x i32> [ undef, %vector.ph ], [ %34, %vector.body ]
  %.lcssa.ph = phi <4 x i32> [ undef, %vector.ph ], [ %35, %vector.body ]
  %index.unr = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  %vec.phi.unr = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %34, %vector.body ]
  %vec.phi80.unr = phi <4 x i32> [ zeroinitializer, %vector.ph ], [ %35, %vector.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !180
  br i1 %lcmp.mod.not, label %middle.block, label %vector.body.epil, !dbg !180

vector.body.epil:                                 ; preds = %vector.body.epil, %middle.block.unr-lcssa
  %index.epil = phi i64 [ %index.next.epil, %vector.body.epil ], [ %index.unr, %middle.block.unr-lcssa ], !dbg !180
  %vec.phi.epil = phi <4 x i32> [ %40, %vector.body.epil ], [ %vec.phi.unr, %middle.block.unr-lcssa ]
  %vec.phi80.epil = phi <4 x i32> [ %41, %vector.body.epil ], [ %vec.phi80.unr, %middle.block.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %vector.body.epil ], [ 0, %middle.block.unr-lcssa ]
  %36 = getelementptr inbounds i32, i32* %0, i64 %index.epil, !dbg !180
  %37 = bitcast i32* %36 to <4 x i32>*, !dbg !181
  %wide.load.epil = load <4 x i32>, <4 x i32>* %37, align 16, !dbg !181, !tbaa !183
  %38 = getelementptr inbounds i32, i32* %36, i64 4, !dbg !181
  %39 = bitcast i32* %38 to <4 x i32>*, !dbg !181
  %wide.load81.epil = load <4 x i32>, <4 x i32>* %39, align 16, !dbg !181, !tbaa !183
  %40 = add <4 x i32> %wide.load.epil, %vec.phi.epil, !dbg !185
  %41 = add <4 x i32> %wide.load81.epil, %vec.phi80.epil, !dbg !185
  %index.next.epil = add nuw i64 %index.epil, 8, !dbg !180
  %epil.iter.next = add i64 %epil.iter, 1, !dbg !180
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter, !dbg !180
  br i1 %epil.iter.cmp.not, label %middle.block, label %vector.body.epil, !dbg !180, !llvm.loop !189

middle.block:                                     ; preds = %vector.body.epil, %middle.block.unr-lcssa
  %.lcssa83 = phi <4 x i32> [ %.lcssa83.ph, %middle.block.unr-lcssa ], [ %40, %vector.body.epil ], !dbg !185
  %.lcssa = phi <4 x i32> [ %.lcssa.ph, %middle.block.unr-lcssa ], [ %41, %vector.body.epil ], !dbg !185
  %bin.rdx = add <4 x i32> %.lcssa, %.lcssa83, !dbg !176
  %42 = call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %bin.rdx), !dbg !176
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count75, !dbg !176
  br i1 %cmp.n, label %cleanup, label %for.body19.preheader82, !dbg !176

for.body19.preheader82:                           ; preds = %middle.block, %for.body19.preheader
  %indvars.iv72.ph = phi i64 [ 0, %for.body19.preheader ], [ %n.vec, %middle.block ]
  %solNum.064.ph = phi i32 [ 0, %for.body19.preheader ], [ %42, %middle.block ]
  br label %for.body19, !dbg !176

for.body19:                                       ; preds = %for.body19, %for.body19.preheader82
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.body19 ], [ %indvars.iv72.ph, %for.body19.preheader82 ]
  %solNum.064 = phi i32 [ %add22, %for.body19 ], [ %solNum.064.ph, %for.body19.preheader82 ]
  call void @llvm.dbg.value(metadata i32 %solNum.064, metadata !127, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.value(metadata i64 %indvars.iv72, metadata !125, metadata !DIExpression()), !dbg !134
  %arrayidx21 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv72, !dbg !181
  %43 = load i32, i32* %arrayidx21, align 4, !dbg !181, !tbaa !183
  %add22 = add nsw i32 %43, %solNum.064, !dbg !185
  call void @llvm.dbg.value(metadata i32 %add22, metadata !127, metadata !DIExpression()), !dbg !134
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1, !dbg !180
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next73, metadata !125, metadata !DIExpression()), !dbg !134
  %exitcond76.not = icmp eq i64 %indvars.iv.next73, %wide.trip.count75, !dbg !178
  br i1 %exitcond76.not, label %cleanup, label %for.body19, !dbg !176, !llvm.loop !191

cleanup:                                          ; preds = %for.body19, %middle.block, %for.end.split, %entry
  %storemerge = phi i32 [ 1, %entry ], [ 0, %for.end.split ], [ %42, %middle.block ], [ %add22, %for.body19 ], !dbg !134
  store i32 %storemerge, i32* %res, align 4, !dbg !134, !tbaa !183
  ret void, !dbg !193
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #8

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #9

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** nocapture noundef readonly %argv) local_unnamed_addr #10 !dbg !194 {
entry:
  %res = alloca i32, align 4
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !198, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i8** %argv, metadata !199, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i32 13, metadata !200, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i32 1, metadata !201, metadata !DIExpression()), !dbg !211
  %0 = bitcast i32* %res to i8*, !dbg !212
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #15, !dbg !212
  %cmp = icmp slt i32 %argc, 2, !dbg !213
  br i1 %cmp, label %if.then, label %if.else, !dbg !215

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !216, !tbaa !218
  %2 = load i8*, i8** %argv, align 8, !dbg !220, !tbaa !218
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %1, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8* noundef %2) #16, !dbg !221
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !222, !tbaa !218
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.1, i64 0, i64 0), i64 32, i64 1, %struct._IO_FILE* %3) #16, !dbg !223
  br label %if.end15.thread, !dbg !224

if.else:                                          ; preds = %entry
  %cmp2 = icmp eq i32 %argc, 2, !dbg !225
  %arrayidx4 = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !227
  %5 = load i8*, i8** %arrayidx4, align 8, !dbg !227, !tbaa !218
  call void @llvm.dbg.value(metadata i8* %5, metadata !228, metadata !DIExpression()) #15, !dbg !236
  call void @llvm.dbg.value(metadata i8* %5, metadata !228, metadata !DIExpression()) #15, !dbg !239
  %call.i = tail call i64 @strtol(i8* nocapture noundef nonnull %5, i8** noundef null, i32 noundef 10) #15, !dbg !227
  %conv.i = trunc i64 %call.i to i32, !dbg !227
  call void @llvm.dbg.value(metadata i32 %conv.i, metadata !200, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i32 %conv.i, metadata !200, metadata !DIExpression()), !dbg !211
  br i1 %cmp2, label %if.then3, label %if.end15, !dbg !242

if.then3:                                         ; preds = %if.else
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !243, !tbaa !218
  %7 = load i8*, i8** %argv, align 8, !dbg !244, !tbaa !218
  %call7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %6, i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i64 0, i64 0), i8* noundef %7, i32 noundef %conv.i) #16, !dbg !245
  br label %if.end15.thread, !dbg !246

if.end15.thread:                                  ; preds = %if.then3, %if.then
  %n.0.ph = phi i32 [ %conv.i, %if.then3 ], [ 13, %if.then ]
  call void @llvm.dbg.value(metadata i32 %conv.i, metadata !200, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i32 %conv.i50, metadata !201, metadata !DIExpression()), !dbg !211
  tail call void @startup_cilk(), !dbg !247
  call void @llvm.dbg.value(metadata i32 0, metadata !204, metadata !DIExpression()), !dbg !248
  br label %for.body.lr.ph, !dbg !249

if.end15:                                         ; preds = %if.else
  %arrayidx11 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !250
  %8 = load i8*, i8** %arrayidx11, align 8, !dbg !250, !tbaa !218
  call void @llvm.dbg.value(metadata i8* %8, metadata !228, metadata !DIExpression()) #15, !dbg !251
  %call.i49 = tail call i64 @strtol(i8* nocapture noundef nonnull %8, i8** noundef null, i32 noundef 10) #15, !dbg !253
  %conv.i50 = trunc i64 %call.i49 to i32, !dbg !254
  call void @llvm.dbg.value(metadata i32 %conv.i50, metadata !201, metadata !DIExpression()), !dbg !211
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !255, !tbaa !218
  %10 = load i8*, i8** %argv, align 8, !dbg !256, !tbaa !218
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %9, i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i64 0, i64 0), i8* noundef %10, i32 noundef %conv.i) #16, !dbg !257
  tail call void @startup_cilk(), !dbg !247
  call void @llvm.dbg.value(metadata i32 0, metadata !204, metadata !DIExpression()), !dbg !248
  %cmp1655 = icmp sgt i32 %conv.i50, 0, !dbg !258
  br i1 %cmp1655, label %for.body.lr.ph, label %for.cond.cleanup, !dbg !249

for.body.lr.ph:                                   ; preds = %if.end15, %if.end15.thread
  %n.061 = phi i32 [ %n.0.ph, %if.end15.thread ], [ %conv.i, %if.end15 ]
  %round.060 = phi i32 [ 1, %if.end15.thread ], [ %conv.i50, %if.end15 ]
  %conv = sext i32 %n.061 to i64
  %11 = bitcast %struct.timeval* %t1 to i8*
  %12 = bitcast %struct.timeval* %t2 to i8*
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1
  %tv_sec.i51 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0
  %tv_usec.i53 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1
  br label %for.body, !dbg !249

for.cond.cleanup:                                 ; preds = %if.end30, %if.end15
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #15, !dbg !259
  ret i32 0, !dbg !260

for.body:                                         ; preds = %if.end30, %for.body.lr.ph
  %r.056 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %if.end30 ]
  call void @llvm.dbg.value(metadata i32 %r.056, metadata !204, metadata !DIExpression()), !dbg !248
  %13 = alloca i8, i64 %conv, align 16, !dbg !261
  call void @llvm.dbg.value(metadata i8* %13, metadata !202, metadata !DIExpression()), !dbg !211
  %14 = bitcast i8* %13 to i64*, !dbg !262
  store i64 0, i64* %14, align 16, !dbg !262
  call void @llvm.dbg.value(metadata i32 0, metadata !203, metadata !DIExpression()), !dbg !211
  store i32 0, i32* %res, align 4, !dbg !263, !tbaa !183
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %11) #15, !dbg !264
  call void @llvm.dbg.declare(metadata %struct.timeval* %t1, metadata !206, metadata !DIExpression()), !dbg !265
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %12) #15, !dbg !264
  call void @llvm.dbg.declare(metadata %struct.timeval* %t2, metadata !209, metadata !DIExpression()), !dbg !266
  %call17 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #15, !dbg !267
  call void @llvm.dbg.value(metadata i32* %res, metadata !203, metadata !DIExpression(DW_OP_deref)), !dbg !211
  call void @nqueens(i32 noundef %n.061, i32 noundef 0, i8* noundef nonnull %13, i32* noundef nonnull %res), !dbg !268
  %call18 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #15, !dbg !269
  call void @llvm.dbg.value(metadata %struct.timeval* %t2, metadata !29, metadata !DIExpression()), !dbg !270
  %15 = load i64, i64* %tv_sec.i, align 8, !dbg !272, !tbaa !32
  %16 = load i64, i64* %tv_usec.i, align 8, !dbg !273, !tbaa !39
  call void @llvm.dbg.value(metadata %struct.timeval* %t1, metadata !29, metadata !DIExpression()), !dbg !274
  %17 = load i64, i64* %tv_sec.i51, align 8, !dbg !276, !tbaa !32
  %18 = load i64, i64* %tv_usec.i53, align 8, !dbg !277, !tbaa !39
  %reass.add = sub i64 %15, %17
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i = sub i64 %16, %18, !dbg !278
  %sub = add i64 %add.i, %reass.mul, !dbg !279
  %div = udiv i64 %sub, 1000, !dbg !280
  call void @llvm.dbg.value(metadata i64 %div, metadata !210, metadata !DIExpression()), !dbg !281
  %conv21 = uitofp i64 %div to double, !dbg !282
  %div22 = fdiv double %conv21, 1.000000e+03, !dbg !283
  %call23 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), double noundef %div22), !dbg !284
  %19 = load i32, i32* %res, align 4, !dbg !285, !tbaa !183
  call void @llvm.dbg.value(metadata i32 %19, metadata !203, metadata !DIExpression()), !dbg !211
  %cmp24 = icmp eq i32 %19, 0, !dbg !287
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !288, !tbaa !218
  br i1 %cmp24, label %if.then26, label %if.else28, !dbg !289

if.then26:                                        ; preds = %for.body
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0), i64 19, i64 1, %struct._IO_FILE* %20) #16, !dbg !290
  br label %if.end30, !dbg !292

if.else28:                                        ; preds = %for.body
  %call29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %20, i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.5, i64 0, i64 0), i32 noundef %19) #16, !dbg !293
  br label %if.end30

if.end30:                                         ; preds = %if.else28, %if.then26
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %12) #15, !dbg !295
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %11) #15, !dbg !295
  %inc = add nuw nsw i32 %r.056, 1, !dbg !296
  call void @llvm.dbg.value(metadata i32 %inc, metadata !204, metadata !DIExpression()), !dbg !248
  %exitcond.not = icmp eq i32 %inc, %round.060, !dbg !258
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !dbg !249, !llvm.loop !297
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare !dbg !299 dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #11

; Function Attrs: mustprogress nofree nounwind willreturn
declare dso_local i64 @strtol(i8* noundef readonly, i8** nocapture noundef, i32 noundef) local_unnamed_addr #12

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #13

; Function Attrs: nofree nosync nounwind readnone willreturn
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #14

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { mustprogress nofree nounwind willreturn writeonly "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree norecurse nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { argmemonly nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { argmemonly nofree nounwind willreturn writeonly }
attributes #9 = { argmemonly nofree nounwind willreturn }
attributes #10 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nofree nounwind }
attributes #14 = { nofree nosync nounwind readnone willreturn }
attributes #15 = { nounwind }
attributes #16 = { cold }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "nqueens.c", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "4b61573607c9e93165423c52e47ec2f8")
!2 = !{!3, !5, !4, !7, !8}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !{i32 7, !"Dwarf Version", i32 5}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)"}
!14 = distinct !DISubprogram(name: "todval", scope: !1, file: !1, line: 12, type: !15, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !28)
!15 = !DISubroutineType(types: !16)
!16 = !{!17, !18}
!17 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !20, line: 30, size: 128, elements: !21)
!20 = !DIFile(filename: "/usr/include/bits/time.h", directory: "", checksumkind: CSK_MD5, checksum: "7275d681a2390320bc78ae3cf595b8d2")
!21 = !{!22, !26}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !19, file: !20, line: 32, baseType: !23, size: 64)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !24, line: 148, baseType: !25)
!24 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "77efac6352c67c8f56830ba4c854379f")
!25 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !19, file: !20, line: 33, baseType: !27, size: 64, offset: 64)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !24, line: 150, baseType: !25)
!28 = !{!29}
!29 = !DILocalVariable(name: "tp", arg: 1, scope: !14, file: !1, line: 12, type: !18)
!30 = !DILocation(line: 0, scope: !14)
!31 = !DILocation(line: 13, column: 16, scope: !14)
!32 = !{!33, !34, i64 0}
!33 = !{!"timeval", !34, i64 0, !34, i64 8}
!34 = !{!"long", !35, i64 0}
!35 = !{!"omnipotent char", !36, i64 0}
!36 = !{!"Simple C/C++ TBAA"}
!37 = !DILocation(line: 13, column: 30, scope: !14)
!38 = !DILocation(line: 13, column: 43, scope: !14)
!39 = !{!33, !34, i64 8}
!40 = !DILocation(line: 13, column: 37, scope: !14)
!41 = !DILocation(line: 13, column: 5, scope: !14)
!42 = distinct !DISubprogram(name: "startup_cilk", scope: !1, file: !1, line: 17, type: !43, scopeLine: 17, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !45)
!43 = !DISubroutineType(types: !44)
!44 = !{null}
!45 = !{!46, !48, !50, !51, !52, !53}
!46 = !DILocalVariable(name: "g", scope: !42, file: !1, line: 18, type: !47)
!47 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!48 = !DILocalVariable(name: "__init", scope: !49, type: !4, flags: DIFlagArtificial)
!49 = distinct !DILexicalBlock(scope: !42, file: !1, line: 19, column: 3)
!50 = !DILocalVariable(name: "__limit", scope: !49, type: !4, flags: DIFlagArtificial)
!51 = !DILocalVariable(name: "__begin", scope: !49, type: !4, flags: DIFlagArtificial)
!52 = !DILocalVariable(name: "__end", scope: !49, type: !4, flags: DIFlagArtificial)
!53 = !DILocalVariable(name: "i", scope: !54, file: !1, line: 19, type: !4)
!54 = distinct !DILexicalBlock(scope: !49, file: !1, line: 19, column: 3)
!55 = !DILocation(line: 0, scope: !42)
!56 = !DILocation(line: 18, column: 3, scope: !42)
!57 = !DILocation(line: 18, column: 10, scope: !42)
!58 = !{!59, !59, i64 0}
!59 = !{!"double", !35, i64 0}
!60 = !DILocation(line: 0, scope: !49)
!61 = !DILocation(line: 19, column: 24, scope: !49)
!62 = !DILocation(line: 19, column: 3, scope: !49)
!63 = !DILocation(line: 0, scope: !54)
!64 = !DILocation(line: 20, column: 14, scope: !65)
!65 = distinct !DILexicalBlock(scope: !54, file: !1, line: 19, column: 36)
!66 = !DILocation(line: 20, column: 10, scope: !65)
!67 = !DILocation(line: 20, column: 7, scope: !65)
!68 = !DILocation(line: 21, column: 3, scope: !65)
!69 = !DILocation(line: 19, column: 32, scope: !54)
!70 = !DILocation(line: 19, column: 24, scope: !54)
!71 = !DILocation(line: 19, column: 3, scope: !54)
!72 = distinct !{!72, !62, !73, !74}
!73 = !DILocation(line: 21, column: 3, scope: !49)
!74 = !{!"tapir.loop.spawn.strategy", i32 1}
!75 = !DILocation(line: 22, column: 1, scope: !42)
!76 = distinct !DISubprogram(name: "ok", scope: !1, file: !1, line: 45, type: !77, scopeLine: 45, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !79)
!77 = !DISubroutineType(types: !78)
!78 = !{!4, !4, !5}
!79 = !{!80, !81, !82, !83, !84, !85}
!80 = !DILocalVariable(name: "n", arg: 1, scope: !76, file: !1, line: 45, type: !4)
!81 = !DILocalVariable(name: "a", arg: 2, scope: !76, file: !1, line: 45, type: !5)
!82 = !DILocalVariable(name: "i", scope: !76, file: !1, line: 47, type: !4)
!83 = !DILocalVariable(name: "j", scope: !76, file: !1, line: 47, type: !4)
!84 = !DILocalVariable(name: "p", scope: !76, file: !1, line: 48, type: !6)
!85 = !DILocalVariable(name: "q", scope: !76, file: !1, line: 48, type: !6)
!86 = !DILocation(line: 0, scope: !76)
!87 = !DILocation(line: 50, column: 17, scope: !88)
!88 = distinct !DILexicalBlock(scope: !89, file: !1, line: 50, column: 3)
!89 = distinct !DILexicalBlock(scope: !76, file: !1, line: 50, column: 3)
!90 = !DILocation(line: 50, column: 3, scope: !89)
!91 = distinct !{!91, !90, !92, !93}
!92 = !DILocation(line: 57, column: 3, scope: !89)
!93 = !{!"llvm.loop.mustprogress"}
!94 = !DILocation(line: 51, column: 9, scope: !95)
!95 = distinct !DILexicalBlock(scope: !88, file: !1, line: 50, column: 27)
!96 = !{!35, !35, i64 0}
!97 = !DILocation(line: 52, column: 16, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !1, line: 52, column: 5)
!99 = !DILocation(line: 52, column: 23, scope: !100)
!100 = distinct !DILexicalBlock(scope: !98, file: !1, line: 52, column: 5)
!101 = !DILocation(line: 52, column: 5, scope: !98)
!102 = distinct !{!102, !101, !103, !93}
!103 = !DILocation(line: 56, column: 5, scope: !98)
!104 = !DILocation(line: 53, column: 11, scope: !105)
!105 = distinct !DILexicalBlock(scope: !100, file: !1, line: 52, column: 33)
!106 = !DILocation(line: 54, column: 11, scope: !107)
!107 = distinct !DILexicalBlock(scope: !105, file: !1, line: 54, column: 11)
!108 = !DILocation(line: 54, column: 13, scope: !107)
!109 = !DILocation(line: 54, column: 18, scope: !107)
!110 = !DILocation(line: 54, column: 33, scope: !107)
!111 = !DILocation(line: 54, column: 28, scope: !107)
!112 = !DILocation(line: 54, column: 23, scope: !107)
!113 = !DILocation(line: 54, column: 38, scope: !107)
!114 = !DILocation(line: 52, column: 29, scope: !100)
!115 = !DILocation(line: 60, column: 1, scope: !76)
!116 = distinct !DISubprogram(name: "nqueens", scope: !1, file: !1, line: 62, type: !117, scopeLine: 62, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !119)
!117 = !DISubroutineType(types: !118)
!118 = !{null, !4, !4, !5, !3}
!119 = !{!120, !121, !122, !123, !124, !125, !126, !127}
!120 = !DILocalVariable(name: "n", arg: 1, scope: !116, file: !1, line: 62, type: !4)
!121 = !DILocalVariable(name: "j", arg: 2, scope: !116, file: !1, line: 62, type: !4)
!122 = !DILocalVariable(name: "a", arg: 3, scope: !116, file: !1, line: 62, type: !5)
!123 = !DILocalVariable(name: "res", arg: 4, scope: !116, file: !1, line: 62, type: !3)
!124 = !DILocalVariable(name: "b", scope: !116, file: !1, line: 64, type: !5)
!125 = !DILocalVariable(name: "i", scope: !116, file: !1, line: 65, type: !4)
!126 = !DILocalVariable(name: "count", scope: !116, file: !1, line: 66, type: !3)
!127 = !DILocalVariable(name: "solNum", scope: !116, file: !1, line: 67, type: !4)
!128 = !DILocation(line: 0, scope: !129)
!129 = distinct !DILexicalBlock(scope: !130, file: !1, line: 90, column: 23)
!130 = distinct !DILexicalBlock(scope: !131, file: !1, line: 90, column: 8)
!131 = distinct !DILexicalBlock(scope: !132, file: !1, line: 78, column: 27)
!132 = distinct !DILexicalBlock(scope: !133, file: !1, line: 78, column: 3)
!133 = distinct !DILexicalBlock(scope: !116, file: !1, line: 78, column: 3)
!134 = !DILocation(line: 0, scope: !116)
!135 = !DILocation(line: 69, column: 9, scope: !136)
!136 = distinct !DILexicalBlock(scope: !116, file: !1, line: 69, column: 7)
!137 = !DILocation(line: 69, column: 7, scope: !116)
!138 = !DILocation(line: 75, column: 19, scope: !116)
!139 = !DILocation(line: 76, column: 10, scope: !116)
!140 = !DILocation(line: 78, column: 17, scope: !132)
!141 = !DILocation(line: 78, column: 3, scope: !133)
!142 = !DILocation(line: 50, column: 3, scope: !89, inlinedAt: !143)
!143 = distinct !DILocation(line: 90, column: 8, scope: !130)
!144 = !DILocation(line: 86, column: 18, scope: !131)
!145 = !DILocation(line: 87, column: 5, scope: !131)
!146 = !DILocation(line: 88, column: 12, scope: !131)
!147 = !DILocation(line: 88, column: 5, scope: !131)
!148 = !DILocation(line: 88, column: 10, scope: !131)
!149 = !DILocation(line: 0, scope: !76, inlinedAt: !143)
!150 = !DILocation(line: 51, column: 9, scope: !95, inlinedAt: !143)
!151 = !DILocation(line: 52, column: 16, scope: !98, inlinedAt: !143)
!152 = !DILocation(line: 52, column: 23, scope: !100, inlinedAt: !143)
!153 = !DILocation(line: 52, column: 5, scope: !98, inlinedAt: !143)
!154 = !DILocation(line: 53, column: 11, scope: !105, inlinedAt: !143)
!155 = !DILocation(line: 54, column: 11, scope: !107, inlinedAt: !143)
!156 = !DILocation(line: 54, column: 13, scope: !107, inlinedAt: !143)
!157 = !DILocation(line: 54, column: 18, scope: !107, inlinedAt: !143)
!158 = !DILocation(line: 54, column: 33, scope: !107, inlinedAt: !143)
!159 = !DILocation(line: 54, column: 28, scope: !107, inlinedAt: !143)
!160 = !DILocation(line: 54, column: 23, scope: !107, inlinedAt: !143)
!161 = !DILocation(line: 54, column: 38, scope: !107, inlinedAt: !143)
!162 = !DILocation(line: 52, column: 29, scope: !100, inlinedAt: !143)
!163 = distinct !{!163, !153, !164, !93}
!164 = !DILocation(line: 56, column: 5, scope: !98, inlinedAt: !143)
!165 = !DILocation(line: 50, column: 17, scope: !88, inlinedAt: !143)
!166 = distinct !{!166, !142, !167, !93}
!167 = !DILocation(line: 57, column: 3, scope: !89, inlinedAt: !143)
!168 = !DILocation(line: 92, column: 40, scope: !129)
!169 = !DILocation(line: 92, column: 18, scope: !129)
!170 = !DILocation(line: 78, column: 23, scope: !132)
!171 = distinct !{!171, !141, !172, !93}
!172 = !DILocation(line: 94, column: 3, scope: !133)
!173 = distinct !{!173, !141, !172, !93, !174}
!174 = !{!"tapir.loop.grainsize", i32 1}
!175 = !DILocation(line: 95, column: 3, scope: !116)
!176 = !DILocation(line: 98, column: 3, scope: !177)
!177 = distinct !DILexicalBlock(scope: !116, file: !1, line: 98, column: 3)
!178 = !DILocation(line: 98, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !177, file: !1, line: 98, column: 3)
!180 = !DILocation(line: 98, column: 22, scope: !179)
!181 = !DILocation(line: 99, column: 15, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !1, line: 98, column: 26)
!183 = !{!184, !184, i64 0}
!184 = !{!"int", !35, i64 0}
!185 = !DILocation(line: 99, column: 12, scope: !182)
!186 = distinct !{!186, !176, !187, !93, !188}
!187 = !DILocation(line: 100, column: 3, scope: !177)
!188 = !{!"llvm.loop.isvectorized", i32 1}
!189 = distinct !{!189, !190}
!190 = !{!"llvm.loop.unroll.disable"}
!191 = distinct !{!191, !176, !187, !93, !192, !188}
!192 = !{!"llvm.loop.unroll.runtime.disable"}
!193 = !DILocation(line: 105, column: 1, scope: !116)
!194 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 108, type: !195, scopeLine: 108, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !197)
!195 = !DISubroutineType(types: !196)
!196 = !{!4, !4, !7}
!197 = !{!198, !199, !200, !201, !202, !203, !204, !206, !209, !210}
!198 = !DILocalVariable(name: "argc", arg: 1, scope: !194, file: !1, line: 108, type: !4)
!199 = !DILocalVariable(name: "argv", arg: 2, scope: !194, file: !1, line: 108, type: !7)
!200 = !DILocalVariable(name: "n", scope: !194, file: !1, line: 110, type: !4)
!201 = !DILocalVariable(name: "round", scope: !194, file: !1, line: 111, type: !4)
!202 = !DILocalVariable(name: "a", scope: !194, file: !1, line: 112, type: !5)
!203 = !DILocalVariable(name: "res", scope: !194, file: !1, line: 113, type: !4)
!204 = !DILocalVariable(name: "r", scope: !205, file: !1, line: 130, type: !4)
!205 = distinct !DILexicalBlock(scope: !194, file: !1, line: 130, column: 3)
!206 = !DILocalVariable(name: "t1", scope: !207, file: !1, line: 136, type: !19)
!207 = distinct !DILexicalBlock(scope: !208, file: !1, line: 130, column: 30)
!208 = distinct !DILexicalBlock(scope: !205, file: !1, line: 130, column: 3)
!209 = !DILocalVariable(name: "t2", scope: !207, file: !1, line: 136, type: !19)
!210 = !DILocalVariable(name: "runtime_ms", scope: !207, file: !1, line: 143, type: !17)
!211 = !DILocation(line: 0, scope: !194)
!212 = !DILocation(line: 113, column: 3, scope: !194)
!213 = !DILocation(line: 115, column: 12, scope: !214)
!214 = distinct !DILexicalBlock(scope: !194, file: !1, line: 115, column: 7)
!215 = !DILocation(line: 115, column: 7, scope: !194)
!216 = !DILocation(line: 116, column: 14, scope: !217)
!217 = distinct !DILexicalBlock(scope: !214, file: !1, line: 115, column: 17)
!218 = !{!219, !219, i64 0}
!219 = !{!"any pointer", !35, i64 0}
!220 = !DILocation(line: 116, column: 58, scope: !217)
!221 = !DILocation(line: 116, column: 5, scope: !217)
!222 = !DILocation(line: 117, column: 14, scope: !217)
!223 = !DILocation(line: 117, column: 5, scope: !217)
!224 = !DILocation(line: 118, column: 3, scope: !217)
!225 = !DILocation(line: 118, column: 19, scope: !226)
!226 = distinct !DILexicalBlock(scope: !214, file: !1, line: 118, column: 14)
!227 = !DILocation(line: 0, scope: !226)
!228 = !DILocalVariable(name: "__nptr", arg: 1, scope: !229, file: !230, line: 278, type: !233)
!229 = distinct !DISubprogram(name: "atoi", scope: !230, file: !230, line: 278, type: !231, scopeLine: 279, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !235)
!230 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f7a1412d75d9e3df251dfc21b02d59ef")
!231 = !DISubroutineType(types: !232)
!232 = !{!4, !233}
!233 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !234, size: 64)
!234 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!235 = !{!228}
!236 = !DILocation(line: 0, scope: !229, inlinedAt: !237)
!237 = distinct !DILocation(line: 119, column: 9, scope: !238)
!238 = distinct !DILexicalBlock(scope: !226, file: !1, line: 118, column: 25)
!239 = !DILocation(line: 0, scope: !229, inlinedAt: !240)
!240 = distinct !DILocation(line: 122, column: 9, scope: !241)
!241 = distinct !DILexicalBlock(scope: !226, file: !1, line: 121, column: 10)
!242 = !DILocation(line: 118, column: 14, scope: !214)
!243 = !DILocation(line: 120, column: 14, scope: !238)
!244 = !DILocation(line: 120, column: 51, scope: !238)
!245 = !DILocation(line: 120, column: 5, scope: !238)
!246 = !DILocation(line: 121, column: 3, scope: !238)
!247 = !DILocation(line: 128, column: 3, scope: !194)
!248 = !DILocation(line: 0, scope: !205)
!249 = !DILocation(line: 130, column: 3, scope: !205)
!250 = !DILocation(line: 123, column: 18, scope: !241)
!251 = !DILocation(line: 0, scope: !229, inlinedAt: !252)
!252 = distinct !DILocation(line: 123, column: 13, scope: !241)
!253 = !DILocation(line: 280, column: 16, scope: !229, inlinedAt: !252)
!254 = !DILocation(line: 280, column: 10, scope: !229, inlinedAt: !252)
!255 = !DILocation(line: 124, column: 14, scope: !241)
!256 = !DILocation(line: 124, column: 51, scope: !241)
!257 = !DILocation(line: 124, column: 5, scope: !241)
!258 = !DILocation(line: 130, column: 17, scope: !208)
!259 = !DILocation(line: 154, column: 1, scope: !194)
!260 = !DILocation(line: 153, column: 3, scope: !194)
!261 = !DILocation(line: 132, column: 18, scope: !207)
!262 = !DILocation(line: 133, column: 5, scope: !207)
!263 = !DILocation(line: 134, column: 9, scope: !207)
!264 = !DILocation(line: 136, column: 5, scope: !207)
!265 = !DILocation(line: 136, column: 20, scope: !207)
!266 = !DILocation(line: 136, column: 24, scope: !207)
!267 = !DILocation(line: 137, column: 5, scope: !207)
!268 = !DILocation(line: 140, column: 5, scope: !207)
!269 = !DILocation(line: 142, column: 5, scope: !207)
!270 = !DILocation(line: 0, scope: !14, inlinedAt: !271)
!271 = distinct !DILocation(line: 143, column: 38, scope: !207)
!272 = !DILocation(line: 13, column: 16, scope: !14, inlinedAt: !271)
!273 = !DILocation(line: 13, column: 43, scope: !14, inlinedAt: !271)
!274 = !DILocation(line: 0, scope: !14, inlinedAt: !275)
!275 = distinct !DILocation(line: 143, column: 50, scope: !207)
!276 = !DILocation(line: 13, column: 16, scope: !14, inlinedAt: !275)
!277 = !DILocation(line: 13, column: 43, scope: !14, inlinedAt: !275)
!278 = !DILocation(line: 13, column: 37, scope: !14, inlinedAt: !271)
!279 = !DILocation(line: 143, column: 49, scope: !207)
!280 = !DILocation(line: 143, column: 62, scope: !207)
!281 = !DILocation(line: 0, scope: !207)
!282 = !DILocation(line: 144, column: 31, scope: !207)
!283 = !DILocation(line: 144, column: 41, scope: !207)
!284 = !DILocation(line: 144, column: 5, scope: !207)
!285 = !DILocation(line: 146, column: 9, scope: !286)
!286 = distinct !DILexicalBlock(scope: !207, file: !1, line: 146, column: 9)
!287 = !DILocation(line: 146, column: 13, scope: !286)
!288 = !DILocation(line: 0, scope: !286)
!289 = !DILocation(line: 146, column: 9, scope: !207)
!290 = !DILocation(line: 147, column: 7, scope: !291)
!291 = distinct !DILexicalBlock(scope: !286, file: !1, line: 146, column: 19)
!292 = !DILocation(line: 148, column: 5, scope: !291)
!293 = !DILocation(line: 149, column: 7, scope: !294)
!294 = distinct !DILexicalBlock(scope: !286, file: !1, line: 148, column: 12)
!295 = !DILocation(line: 151, column: 3, scope: !208)
!296 = !DILocation(line: 130, column: 26, scope: !208)
!297 = distinct !{!297, !249, !298, !93}
!298 = !DILocation(line: 151, column: 3, scope: !205)
!299 = !DISubprogram(name: "gettimeofday", scope: !300, file: !300, line: 72, type: !301, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !311)
!300 = !DIFile(filename: "/usr/include/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b3cbcac52b1954fa045aa74bfcd1a38")
!301 = !DISubroutineType(types: !302)
!302 = !{!4, !303, !304}
!303 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !18)
!304 = !DIDerivedType(tag: DW_TAG_typedef, name: "__timezone_ptr_t", file: !300, line: 62, baseType: !305)
!305 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !306)
!306 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !307, size: 64)
!307 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !300, line: 56, size: 64, elements: !308)
!308 = !{!309, !310}
!309 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !307, file: !300, line: 58, baseType: !4, size: 32)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !307, file: !300, line: 59, baseType: !4, size: 32, offset: 32)
!311 = !{}
