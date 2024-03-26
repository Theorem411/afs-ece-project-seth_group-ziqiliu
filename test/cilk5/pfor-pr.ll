; ModuleID = './pfor.ll'
source_filename = "pfor.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

@threadId = external thread_local local_unnamed_addr global i32, align 4
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [66 x i8] c"Usage: pfor [<cilk options>] <n> <m> <maxgran> <number of round>\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%f,\00", align 1
@.str.4 = private unnamed_addr constant [35 x i8] c"result[i] == 1 && \22Invalid result\22\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"pfor.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [23 x i8] c"int main(int, char **)\00", align 1

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i64 @todval(%struct.timeval* nocapture noundef readonly %tp) local_unnamed_addr #0 !dbg !13 {
entry:
  call void @llvm.dbg.value(metadata %struct.timeval* %tp, metadata !28, metadata !DIExpression()), !dbg !29
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 0, !dbg !30
  %0 = load i64, i64* %tv_sec, align 8, !dbg !30, !tbaa !31
  %mul1 = mul i64 %0, 1000000, !dbg !36
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 1, !dbg !37
  %1 = load i64, i64* %tv_usec, align 8, !dbg !37, !tbaa !38
  %add = add nsw i64 %mul1, %1, !dbg !39
  ret i64 %add, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly noinline nounwind uwtable
define dso_local void @parallel_for_recurse(i64 noundef %start, i64 noundef %end, i64 noundef %granularity, i64 noundef %m, i64* nocapture noundef writeonly %res) local_unnamed_addr #2 !dbg !41 {
entry:
  %j = alloca i64, align 8
  %a = alloca i32, align 4
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !72
  call void @llvm.dbg.value(metadata i64 %start, metadata !49, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i64 %end, metadata !50, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i64 %granularity, metadata !51, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i64 %m, metadata !52, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i64* %res, metadata !53, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.label(metadata !71), !dbg !74
  %sub31 = sub i64 %end, %start, !dbg !75
  %cmp.not32 = icmp ugt i64 %sub31, %granularity, !dbg !76
  br i1 %cmp.not32, label %if.else, label %for.cond.preheader, !dbg !77

for.cond.preheader:                               ; preds = %det.cont, %entry
  %start.addr.0.lcssa = phi i64 [ %start, %entry ], [ %add, %det.cont ]
  call void @llvm.dbg.value(metadata i64 %start.addr.0.lcssa, metadata !54, metadata !DIExpression()), !dbg !78
  %cmp137 = icmp ult i64 %start.addr.0.lcssa, %end, !dbg !79
  br i1 %cmp137, label %for.body.lr.ph, label %for.cond.cleanup, !dbg !80

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %j.0.j.0.j.0..sroa_cast = bitcast i64* %j to i8*
  %a.0.a.0.a.0..sroa_cast = bitcast i32* %a to i8*
  br label %for.body, !dbg !80

for.cond.cleanup:                                 ; preds = %for.cond.cleanup4, %for.cond.preheader
  sync within %syncreg, label %sync.continue, !dbg !81

for.body:                                         ; preds = %for.cond.cleanup4, %for.body.lr.ph
  %i.038 = phi i64 [ %start.addr.0.lcssa, %for.body.lr.ph ], [ %inc8, %for.cond.cleanup4 ]
  call void @llvm.dbg.value(metadata i64 %i.038, metadata !54, metadata !DIExpression()), !dbg !78
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %j.0.j.0.j.0..sroa_cast), !dbg !82
  call void @llvm.dbg.declare(metadata i64* %j, metadata !58, metadata !DIExpression()), !dbg !83
  store volatile i64 0, i64* %j, align 8, !dbg !83, !tbaa !84
  %j.0.j.0.j.0.35 = load volatile i64, i64* %j, align 8, !dbg !85, !tbaa !84
  %cmp336 = icmp slt i64 %j.0.j.0.j.0.35, %m, !dbg !86
  br i1 %cmp336, label %for.body5.lr.ph, label %for.cond.cleanup4, !dbg !87

for.body5.lr.ph:                                  ; preds = %for.body
  %arrayidx = getelementptr inbounds i64, i64* %res, i64 %i.038
  br label %for.body5, !dbg !87

for.cond.cleanup4:                                ; preds = %for.body5, %for.body
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %j.0.j.0.j.0..sroa_cast), !dbg !88
  %inc8 = add nuw i64 %i.038, 1, !dbg !89
  call void @llvm.dbg.value(metadata i64 %inc8, metadata !54, metadata !DIExpression()), !dbg !78
  %exitcond.not = icmp eq i64 %inc8, %end, !dbg !79
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !dbg !80, !llvm.loop !90

for.body5:                                        ; preds = %for.body5, %for.body5.lr.ph
  store i64 1, i64* %arrayidx, align 8, !dbg !93, !tbaa !84
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %a.0.a.0.a.0..sroa_cast), !dbg !94
  call void @llvm.dbg.declare(metadata i32* %a, metadata !63, metadata !DIExpression()), !dbg !95
  store volatile i32 0, i32* %a, align 4, !dbg !95, !tbaa !96
  %a.0.a.0.a.0. = load volatile i32, i32* %a, align 4, !dbg !98, !tbaa !96
  %inc = add nsw i32 %a.0.a.0.a.0., 1, !dbg !98
  store volatile i32 %inc, i32* %a, align 4, !dbg !98, !tbaa !96
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %a.0.a.0.a.0..sroa_cast), !dbg !99
  %j.0.j.0.j.0.15 = load volatile i64, i64* %j, align 8, !dbg !100, !tbaa !84
  %inc6 = add nsw i64 %j.0.j.0.j.0.15, 1, !dbg !100
  store volatile i64 %inc6, i64* %j, align 8, !dbg !100, !tbaa !84
  %j.0.j.0.j.0. = load volatile i64, i64* %j, align 8, !dbg !85, !tbaa !84
  %cmp3 = icmp slt i64 %j.0.j.0.j.0., %m, !dbg !86
  br i1 %cmp3, label %for.body5, label %for.cond.cleanup4, !dbg !87, !llvm.loop !101

if.else:                                          ; preds = %det.cont, %entry
  %sub34 = phi i64 [ %sub, %det.cont ], [ %sub31, %entry ]
  %start.addr.033 = phi i64 [ %add, %det.cont ], [ %start, %entry ]
  call void @llvm.dbg.value(metadata i64 %start.addr.033, metadata !49, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata i64 %sub34, metadata !68, metadata !DIExpression()), !dbg !72
  %div = lshr i64 %sub34, 1, !dbg !103
  %add = add i64 %div, %start.addr.033, !dbg !104
  call void @llvm.dbg.value(metadata i64 %add, metadata !70, metadata !DIExpression()), !dbg !72
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !105

det.achd:                                         ; preds = %if.else
  tail call void @parallel_for_recurse(i64 noundef %start.addr.033, i64 noundef %add, i64 noundef %granularity, i64 noundef %m, i64* noundef %res), !dbg !105
  reattach within %syncreg, label %det.cont, !dbg !105

det.cont:                                         ; preds = %det.achd, %if.else
  call void @llvm.dbg.value(metadata i64 %add, metadata !49, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.label(metadata !71), !dbg !74
  %sub = sub i64 %end, %add, !dbg !75
  %cmp.not = icmp ugt i64 %sub, %granularity, !dbg !76
  br i1 %cmp.not, label %if.else, label %for.cond.preheader, !dbg !77, !llvm.loop !106

sync.continue:                                    ; preds = %for.cond.cleanup
  ret void, !dbg !108
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare token @llvm.syncregion.start() #4

; Function Attrs: mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn
define dso_local void @parallel_for_seq(i64 noundef %start, i64 noundef %end, i64 noundef %granularity, i64 noundef %m, i64* nocapture noundef %res) local_unnamed_addr #5 !dbg !109 {
entry:
  call void @llvm.dbg.value(metadata i64 %start, metadata !111, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.value(metadata i64 %end, metadata !112, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.value(metadata i64 %granularity, metadata !113, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.value(metadata i64 %m, metadata !114, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.value(metadata i64* %res, metadata !115, metadata !DIExpression()), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind no_unwind_path uwtable
define dso_local void @parallel_for_static(i64 noundef %start, i64 noundef %end, i64 noundef %granularity, i64 noundef %m, i64* nocapture noundef writeonly %res, i8** noundef %resumeCtx) #6 !dbg !118 {
entry:
  %j = alloca i64, align 8
  %a = alloca i32, align 4
  %parallelCtx = alloca [64 x i8*], align 16
  call void @llvm.dbg.value(metadata i64 %start, metadata !122, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.value(metadata i64 %end, metadata !123, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.value(metadata i64 %granularity, metadata !124, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.value(metadata i64 %m, metadata !125, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.value(metadata i64* %res, metadata !126, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.value(metadata i8** %resumeCtx, metadata !127, metadata !DIExpression()), !dbg !155
  %sub = sub i64 %end, %start, !dbg !156
  call void @llvm.dbg.value(metadata i64 %sub, metadata !128, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !155
  %call.i = tail call i32 (...) @__cilkrts_get_nworkers() #7, !dbg !157
  %conv.i = sext i32 %call.i to i64, !dbg !157
  call void @llvm.dbg.value(metadata i64 %conv.i, metadata !129, metadata !DIExpression()), !dbg !155
  %sext = shl i64 %sub, 32, !dbg !163
  %conv1 = ashr exact i64 %sext, 32, !dbg !163
  call void @llvm.dbg.value(metadata i64 undef, metadata !130, metadata !DIExpression()), !dbg !155
  %cmp = icmp slt i64 %conv1, %granularity, !dbg !164
  br i1 %cmp, label %if.then, label %if.else, !dbg !165

if.then:                                          ; preds = %entry
  call void @llvm.dbg.value(metadata i64 %start, metadata !131, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !166
  %sext109 = shl i64 %start, 32, !dbg !167
  %conv5105 = ashr exact i64 %sext109, 32, !dbg !167
  %cmp6106 = icmp ult i64 %conv5105, %end, !dbg !168
  br i1 %cmp6106, label %for.body.lr.ph, label %cleanup54, !dbg !169

for.body.lr.ph:                                   ; preds = %if.then
  call void @llvm.dbg.value(metadata i64 %start, metadata !131, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !166
  %j.0.j.0.j.0..sroa_cast = bitcast i64* %j to i8*
  %a.0.a.0.a.0..sroa_cast = bitcast i32* %a to i8*
  br label %for.body, !dbg !169

for.body:                                         ; preds = %for.cond.cleanup11, %for.body.lr.ph
  %indvars.iv111 = phi i64 [ %conv5105, %for.body.lr.ph ], [ %indvars.iv.next112, %for.cond.cleanup11 ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv111, metadata !131, metadata !DIExpression()), !dbg !166
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %j.0.j.0.j.0..sroa_cast), !dbg !170
  call void @llvm.dbg.declare(metadata i64* %j, metadata !135, metadata !DIExpression()), !dbg !171
  store volatile i64 0, i64* %j, align 8, !dbg !171, !tbaa !84
  %j.0.j.0.j.0.103 = load volatile i64, i64* %j, align 8, !dbg !172, !tbaa !84
  %cmp9104 = icmp slt i64 %j.0.j.0.j.0.103, %m, !dbg !173
  br i1 %cmp9104, label %for.body12.lr.ph, label %for.cond.cleanup11, !dbg !174

for.body12.lr.ph:                                 ; preds = %for.body
  %arrayidx = getelementptr inbounds i64, i64* %res, i64 %indvars.iv111
  br label %for.body12, !dbg !174

for.cond.cleanup11:                               ; preds = %for.body12, %for.body
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %j.0.j.0.j.0..sroa_cast), !dbg !175
  %indvars.iv.next112 = add i64 %indvars.iv111, 1, !dbg !176
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next112, metadata !131, metadata !DIExpression()), !dbg !166
  %cmp6 = icmp ult i64 %indvars.iv.next112, %end, !dbg !168
  br i1 %cmp6, label %for.body, label %cleanup54, !dbg !169, !llvm.loop !177

for.body12:                                       ; preds = %for.body12, %for.body12.lr.ph
  store i64 1, i64* %arrayidx, align 8, !dbg !179, !tbaa !84
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %a.0.a.0.a.0..sroa_cast), !dbg !180
  call void @llvm.dbg.declare(metadata i32* %a, metadata !139, metadata !DIExpression()), !dbg !181
  store volatile i32 0, i32* %a, align 4, !dbg !181, !tbaa !96
  %a.0.a.0.a.0. = load volatile i32, i32* %a, align 4, !dbg !182, !tbaa !96
  %inc = add nsw i32 %a.0.a.0.a.0., 1, !dbg !182
  store volatile i32 %inc, i32* %a, align 4, !dbg !182, !tbaa !96
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %a.0.a.0.a.0..sroa_cast), !dbg !183
  %j.0.j.0.j.0.65 = load volatile i64, i64* %j, align 8, !dbg !184, !tbaa !84
  %inc13 = add nsw i64 %j.0.j.0.j.0.65, 1, !dbg !184
  store volatile i64 %inc13, i64* %j, align 8, !dbg !184, !tbaa !84
  %j.0.j.0.j.0. = load volatile i64, i64* %j, align 8, !dbg !172, !tbaa !84
  %cmp9 = icmp slt i64 %j.0.j.0.j.0., %m, !dbg !173
  br i1 %cmp9, label %for.body12, label %for.cond.cleanup11, !dbg !174, !llvm.loop !185

if.else:                                          ; preds = %entry
  %div = udiv i64 %conv1, %conv.i, !dbg !187
  call void @llvm.dbg.value(metadata i64 %div, metadata !130, metadata !DIExpression()), !dbg !155
  %cmp17 = icmp ult i64 %conv1, %conv.i, !dbg !188
  %spec.select = select i1 %cmp17, i64 1, i64 %div, !dbg !190
  %spec.select97 = select i1 %cmp17, i64 %conv1, i64 %conv.i, !dbg !190
  call void @llvm.dbg.value(metadata i64 %spec.select97, metadata !129, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.value(metadata i64 %spec.select, metadata !130, metadata !DIExpression()), !dbg !155
  %0 = inttoptr i64 %spec.select97 to i8*, !dbg !191
  %arrayidx21 = getelementptr inbounds i8*, i8** %resumeCtx, i64 17, !dbg !192
  store i8* %0, i8** %arrayidx21, align 8, !dbg !193, !tbaa !194
  %1 = bitcast [64 x i8*]* %parallelCtx to i8*, !dbg !196
  call void @llvm.lifetime.start.p0i8(i64 512, i8* nonnull %1) #7, !dbg !196
  call void @llvm.dbg.declare(metadata [64 x i8*]* %parallelCtx, metadata !142, metadata !DIExpression()), !dbg !197
  %arraydecay = getelementptr inbounds [64 x i8*], [64 x i8*]* %parallelCtx, i64 0, i64 0, !dbg !198
  multiretcall void @llvm.uli.save.context.nosp(i8* nonnull %1, i8* blockaddress(@parallel_for_static, %det_cont))
          to label %for.cond24.preheader [label %det_cont ], !dbg !199

for.cond24.preheader:                             ; preds = %if.else
  call void @llvm.dbg.value(metadata i32 1, metadata !149, metadata !DIExpression()), !dbg !200
  %cmp26101 = icmp ugt i64 %spec.select97, 1, !dbg !201
  br i1 %cmp26101, label %for.body29, label %for.cond.cleanup28, !dbg !203

for.cond.cleanup28:                               ; preds = %for.body29, %for.cond24.preheader
  %add = add i64 %spec.select, %start, !dbg !204
  call void @parallel_for_recurse(i64 noundef %start, i64 noundef %add, i64 noundef %granularity, i64 noundef %m, i64* noundef %res), !dbg !205
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %1) #7, !dbg !206
  br label %cleanup54

for.body29:                                       ; preds = %for.body29, %for.cond24.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body29 ], [ 1, %for.cond24.preheader ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv, metadata !149, metadata !DIExpression()), !dbg !200
  %2 = trunc i64 %indvars.iv to i32, !dbg !207
  call void @push_workmsg(i8** noundef nonnull %arraydecay, i32 noundef %2) #7, !dbg !207
  %indvars.iv.next = add nuw i64 %indvars.iv, 1, !dbg !209
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next, metadata !149, metadata !DIExpression()), !dbg !200
  %exitcond.not = icmp eq i64 %indvars.iv.next, %spec.select97, !dbg !201
  br i1 %exitcond.not, label %for.cond.cleanup28, label %for.body29, !dbg !203, !llvm.loop !210

det_cont:                                         ; preds = %if.else
  call void @llvm.dbg.label(metadata !154), !dbg !212
  %3 = load i32, i32* @threadId, align 4, !dbg !213, !tbaa !96
  %conv34 = sext i32 %3 to i64, !dbg !213
  %mul = mul i64 %spec.select, %conv34, !dbg !214
  %add35 = add i64 %mul, %start, !dbg !215
  call void @llvm.dbg.value(metadata i64 %add35, metadata !151, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !216
  %add37 = add nsw i32 %3, 1, !dbg !217
  %conv38116 = zext i32 %add37 to i64, !dbg !218
  %mul39 = mul i64 %spec.select, %conv38116, !dbg !219
  %add40 = add i64 %mul39, %start, !dbg !220
  call void @llvm.dbg.value(metadata i64 %add40, metadata !153, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !216
  %sub43 = add nsw i64 %spec.select97, -1, !dbg !221
  %cmp44 = icmp eq i64 %sub43, %conv34, !dbg !223
  %spec.select98 = select i1 %cmp44, i64 %end, i64 %add40, !dbg !224
  call void @llvm.dbg.value(metadata i64 %spec.select98, metadata !153, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !216
  %sext95 = shl i64 %add35, 32, !dbg !225
  %conv49 = ashr exact i64 %sext95, 32, !dbg !225
  %sext96 = shl i64 %spec.select98, 32, !dbg !226
  %conv50 = ashr exact i64 %sext96, 32, !dbg !226
  call void @parallel_for_recurse(i64 noundef %conv49, i64 noundef %conv50, i64 noundef %granularity, i64 noundef %m, i64* noundef %res), !dbg !227
  %call51 = call i8** (...) @get_stacklet_ctx() #7, !dbg !228
  %arrayidx52 = getelementptr inbounds i8*, i8** %call51, i64 18, !dbg !228
  %4 = load i8*, i8** %arrayidx52, align 8, !dbg !228, !tbaa !194
  call void @resume2scheduler(i8** noundef nonnull %resumeCtx, i8* noundef %4) #7, !dbg !229
  call void @llvm.lifetime.end.p0i8(i64 512, i8* nonnull %1) #7, !dbg !206
  br label %cleanup54

cleanup54:                                        ; preds = %det_cont, %for.cond.cleanup28, %for.cond.cleanup11, %if.then
  ret void, !dbg !230
}

; Function Attrs: nounwind
declare void @llvm.uli.save.context.nosp(i8*, i8*) #7

declare !dbg !231 dso_local void @push_workmsg(i8** noundef, i32 noundef) local_unnamed_addr #8

declare !dbg !234 dso_local void @resume2scheduler(i8** noundef, i8* noundef) local_unnamed_addr #8

declare !dbg !237 dso_local i8** @get_stacklet_ctx(...) local_unnamed_addr #8

; Function Attrs: argmemonly noinline nounwind uwtable
define dso_local void @startup_cilk(i64 noundef %n, i64 noundef %m, i64 noundef %granularity, i64* nocapture noundef writeonly %res) local_unnamed_addr #2 !dbg !240 {
entry:
  call void @llvm.dbg.value(metadata i64 %n, metadata !244, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i64 %m, metadata !245, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i64 %granularity, metadata !246, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i64* %res, metadata !247, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i64 0, metadata !248, metadata !DIExpression()), !dbg !249
  tail call void @parallel_for_recurse(i64 noundef 0, i64 noundef %n, i64 noundef %granularity, i64 noundef %m, i64* noundef %res), !dbg !250
  ret void, !dbg !251
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** nocapture noundef readonly %argv) local_unnamed_addr #9 !dbg !252 {
entry:
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !256, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i8** %argv, metadata !257, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i64 1, metadata !261, metadata !DIExpression()), !dbg !275
  %cmp.not = icmp eq i32 %argc, 5, !dbg !276
  br i1 %cmp.not, label %if.end, label %if.then, !dbg !278

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !279, !tbaa !194
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([66 x i8], [66 x i8]* @.str, i64 0, i64 0), i64 65, i64 1, %struct._IO_FILE* %0) #17, !dbg !281
  tail call void @exit(i32 noundef 1) #18, !dbg !282
  unreachable, !dbg !282

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds i8*, i8** %argv, i64 1, !dbg !283
  %2 = load i8*, i8** %arrayidx, align 8, !dbg !283, !tbaa !194
  call void @llvm.dbg.value(metadata i8* %2, metadata !284, metadata !DIExpression()) #7, !dbg !292
  %call.i = tail call i64 @strtol(i8* nocapture noundef nonnull %2, i8** noundef null, i32 noundef 10) #7, !dbg !294
  call void @llvm.dbg.value(metadata i64 %call.i, metadata !258, metadata !DIExpression()), !dbg !275
  %arrayidx2 = getelementptr inbounds i8*, i8** %argv, i64 2, !dbg !295
  %3 = load i8*, i8** %arrayidx2, align 8, !dbg !295, !tbaa !194
  call void @llvm.dbg.value(metadata i8* %3, metadata !284, metadata !DIExpression()) #7, !dbg !296
  %call.i50 = tail call i64 @strtol(i8* nocapture noundef nonnull %3, i8** noundef null, i32 noundef 10) #7, !dbg !298
  call void @llvm.dbg.value(metadata i64 %call.i50, metadata !259, metadata !DIExpression()), !dbg !275
  %arrayidx4 = getelementptr inbounds i8*, i8** %argv, i64 3, !dbg !299
  %4 = load i8*, i8** %arrayidx4, align 8, !dbg !299, !tbaa !194
  call void @llvm.dbg.value(metadata i8* %4, metadata !284, metadata !DIExpression()) #7, !dbg !300
  %call.i51 = tail call i64 @strtol(i8* nocapture noundef nonnull %4, i8** noundef null, i32 noundef 10) #7, !dbg !302
  call void @llvm.dbg.value(metadata i64 %call.i51, metadata !260, metadata !DIExpression()), !dbg !275
  %arrayidx6 = getelementptr inbounds i8*, i8** %argv, i64 4, !dbg !303
  %5 = load i8*, i8** %arrayidx6, align 8, !dbg !303, !tbaa !194
  call void @llvm.dbg.value(metadata i8* %5, metadata !284, metadata !DIExpression()) #7, !dbg !304
  %call.i52 = tail call i64 @strtol(i8* nocapture noundef nonnull %5, i8** noundef null, i32 noundef 10) #7, !dbg !306
  call void @llvm.dbg.value(metadata i64 %call.i52, metadata !261, metadata !DIExpression()), !dbg !275
  %call8 = tail call noalias i8* @calloc(i64 noundef %call.i, i64 noundef 8) #7, !dbg !307
  %6 = bitcast i8* %call8 to i64*, !dbg !307
  call void @llvm.dbg.value(metadata i64* %6, metadata !262, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i64 0, metadata !263, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i64 %call.i, metadata !264, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i64 %call.i51, metadata !265, metadata !DIExpression()), !dbg !275
  call void @llvm.dbg.value(metadata i64 0, metadata !266, metadata !DIExpression()), !dbg !308
  %cmp957 = icmp sgt i64 %call.i52, 0, !dbg !309
  br i1 %cmp957, label %for.body.lr.ph, label %for.cond.cleanup, !dbg !310

for.body.lr.ph:                                   ; preds = %if.end
  %7 = bitcast %struct.timeval* %t1 to i8*
  %8 = bitcast %struct.timeval* %t2 to i8*
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1
  %tv_sec.i53 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0
  %tv_usec.i55 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1
  br label %for.body, !dbg !310

for.cond.cleanup:                                 ; preds = %for.body, %if.end
  %putchar = tail call i32 @putchar(i32 10), !dbg !311
  call void @llvm.dbg.value(metadata i64 0, metadata !273, metadata !DIExpression()), !dbg !312
  %cmp1859 = icmp sgt i64 %call.i, 0, !dbg !313
  br i1 %cmp1859, label %for.body21, label %for.cond.cleanup20, !dbg !315

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %r.058 = phi i64 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  call void @llvm.dbg.value(metadata i64 %r.058, metadata !266, metadata !DIExpression()), !dbg !308
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #7, !dbg !316
  call void @llvm.dbg.declare(metadata %struct.timeval* %t1, metadata !268, metadata !DIExpression()), !dbg !317
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %8) #7, !dbg !316
  call void @llvm.dbg.declare(metadata %struct.timeval* %t2, metadata !271, metadata !DIExpression()), !dbg !318
  %call10 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #7, !dbg !319
  tail call void @startup_cilk(i64 noundef %call.i, i64 noundef %call.i50, i64 noundef %call.i51, i64* noundef %6), !dbg !320
  %call11 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #7, !dbg !321
  call void @llvm.dbg.value(metadata %struct.timeval* %t2, metadata !28, metadata !DIExpression()), !dbg !322
  %9 = load i64, i64* %tv_sec.i, align 8, !dbg !324, !tbaa !31
  %10 = load i64, i64* %tv_usec.i, align 8, !dbg !325, !tbaa !38
  call void @llvm.dbg.value(metadata %struct.timeval* %t1, metadata !28, metadata !DIExpression()), !dbg !326
  %11 = load i64, i64* %tv_sec.i53, align 8, !dbg !328, !tbaa !31
  %12 = load i64, i64* %tv_usec.i55, align 8, !dbg !329, !tbaa !38
  %reass.add = sub i64 %9, %11
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i = sub i64 %10, %12, !dbg !330
  %sub = add i64 %add.i, %reass.mul, !dbg !331
  %div = udiv i64 %sub, 1000, !dbg !332
  call void @llvm.dbg.value(metadata i64 %div, metadata !272, metadata !DIExpression()), !dbg !333
  %conv = uitofp i64 %div to double, !dbg !334
  %div14 = fdiv double %conv, 1.000000e+03, !dbg !335
  %call15 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), double noundef %div14), !dbg !336
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %8) #7, !dbg !337
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #7, !dbg !337
  %inc = add nuw nsw i64 %r.058, 1, !dbg !338
  call void @llvm.dbg.value(metadata i64 %inc, metadata !266, metadata !DIExpression()), !dbg !308
  %exitcond.not = icmp eq i64 %inc, %call.i52, !dbg !309
  br i1 %exitcond.not, label %for.cond.cleanup, label %for.body, !dbg !310, !llvm.loop !339

for.cond17:                                       ; preds = %for.body21
  call void @llvm.dbg.value(metadata i64 %inc26, metadata !273, metadata !DIExpression()), !dbg !312
  %exitcond61.not = icmp eq i64 %inc26, %call.i, !dbg !313
  br i1 %exitcond61.not, label %for.cond.cleanup20, label %for.body21, !dbg !315, !llvm.loop !341

for.cond.cleanup20:                               ; preds = %for.cond17, %for.cond.cleanup
  tail call void @free(i8* noundef %call8) #7, !dbg !343
  ret i32 0, !dbg !344

for.body21:                                       ; preds = %for.cond17, %for.cond.cleanup
  %i.060 = phi i64 [ %inc26, %for.cond17 ], [ 0, %for.cond.cleanup ]
  call void @llvm.dbg.value(metadata i64 %i.060, metadata !273, metadata !DIExpression()), !dbg !312
  %arrayidx22 = getelementptr inbounds i64, i64* %6, i64 %i.060, !dbg !345
  %13 = load i64, i64* %arrayidx22, align 8, !dbg !345, !tbaa !84
  %cmp23 = icmp eq i64 %13, 1, !dbg !345
  %inc26 = add nuw nsw i64 %i.060, 1, !dbg !347
  call void @llvm.dbg.value(metadata i64 %inc26, metadata !273, metadata !DIExpression()), !dbg !312
  br i1 %cmp23, label %for.cond17, label %cond.false, !dbg !345

cond.false:                                       ; preds = %for.body21
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str.4, i64 0, i64 0), i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i32 noundef 471, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #18, !dbg !345
  unreachable, !dbg !345
}

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #10

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare !dbg !348 dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #12

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) local_unnamed_addr #10

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #13

; Function Attrs: mustprogress nofree willreturn
declare dso_local i32 @__cilkrts_get_nworkers(...) local_unnamed_addr #14

; Function Attrs: mustprogress nofree nounwind willreturn
declare dso_local i64 @strtol(i8* noundef readonly, i8** nocapture noundef, i32 noundef) local_unnamed_addr #15

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #16

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #16

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly noinline nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { mustprogress nofree noinline norecurse nosync nounwind readnone uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noinline nounwind no_unwind_path uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { noreturn nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { mustprogress nofree willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { nofree nounwind }
attributes #17 = { cold }
attributes #18 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "pfor.c", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "9df74c1ca47c78ffc4acb3914f19c6e8")
!2 = !{!3, !4, !5}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{i32 7, !"Dwarf Version", i32 5}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)"}
!13 = distinct !DISubprogram(name: "todval", scope: !1, file: !1, line: 33, type: !14, scopeLine: 33, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !27)
!14 = !DISubroutineType(types: !15)
!15 = !{!16, !17}
!16 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !19, line: 30, size: 128, elements: !20)
!19 = !DIFile(filename: "/usr/include/bits/time.h", directory: "", checksumkind: CSK_MD5, checksum: "7275d681a2390320bc78ae3cf595b8d2")
!20 = !{!21, !25}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !18, file: !19, line: 32, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !23, line: 148, baseType: !24)
!23 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "77efac6352c67c8f56830ba4c854379f")
!24 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !18, file: !19, line: 33, baseType: !26, size: 64, offset: 64)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !23, line: 150, baseType: !24)
!27 = !{!28}
!28 = !DILocalVariable(name: "tp", arg: 1, scope: !13, file: !1, line: 33, type: !17)
!29 = !DILocation(line: 0, scope: !13)
!30 = !DILocation(line: 34, column: 16, scope: !13)
!31 = !{!32, !33, i64 0}
!32 = !{!"timeval", !33, i64 0, !33, i64 8}
!33 = !{!"long", !34, i64 0}
!34 = !{!"omnipotent char", !35, i64 0}
!35 = !{!"Simple C/C++ TBAA"}
!36 = !DILocation(line: 34, column: 30, scope: !13)
!37 = !DILocation(line: 34, column: 43, scope: !13)
!38 = !{!32, !33, i64 8}
!39 = !DILocation(line: 34, column: 37, scope: !13)
!40 = !DILocation(line: 34, column: 5, scope: !13)
!41 = distinct !DISubprogram(name: "parallel_for_recurse", scope: !1, file: !1, line: 231, type: !42, scopeLine: 232, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !48)
!42 = !DISubroutineType(types: !43)
!43 = !{null, !44, !44, !24, !24, !47}
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 46, baseType: !46)
!45 = !DIFile(filename: "ece.cmu.edu/project/seth_group/ziqiliu/uli-opencilk-project/build/lib/clang/14.0.6/include/stddef.h", directory: "/afs", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!46 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!48 = !{!49, !50, !51, !52, !53, !54, !58, !63, !68, !70, !71}
!49 = !DILocalVariable(name: "start", arg: 1, scope: !41, file: !1, line: 231, type: !44)
!50 = !DILocalVariable(name: "end", arg: 2, scope: !41, file: !1, line: 231, type: !44)
!51 = !DILocalVariable(name: "granularity", arg: 3, scope: !41, file: !1, line: 232, type: !24)
!52 = !DILocalVariable(name: "m", arg: 4, scope: !41, file: !1, line: 232, type: !24)
!53 = !DILocalVariable(name: "res", arg: 5, scope: !41, file: !1, line: 232, type: !47)
!54 = !DILocalVariable(name: "i", scope: !55, file: !1, line: 236, type: !44)
!55 = distinct !DILexicalBlock(scope: !56, file: !1, line: 236, column: 6)
!56 = distinct !DILexicalBlock(scope: !57, file: !1, line: 235, column: 40)
!57 = distinct !DILexicalBlock(scope: !41, file: !1, line: 235, column: 8)
!58 = !DILocalVariable(name: "j", scope: !59, file: !1, line: 237, type: !62)
!59 = distinct !DILexicalBlock(scope: !60, file: !1, line: 237, column: 8)
!60 = distinct !DILexicalBlock(scope: !61, file: !1, line: 236, column: 41)
!61 = distinct !DILexicalBlock(scope: !55, file: !1, line: 236, column: 6)
!62 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !24)
!63 = !DILocalVariable(name: "a", scope: !64, file: !1, line: 243, type: !66)
!64 = distinct !DILexicalBlock(scope: !65, file: !1, line: 237, column: 41)
!65 = distinct !DILexicalBlock(scope: !59, file: !1, line: 237, column: 8)
!66 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !67)
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DILocalVariable(name: "n", scope: !69, file: !1, line: 248, type: !44)
!69 = distinct !DILexicalBlock(scope: !57, file: !1, line: 247, column: 11)
!70 = !DILocalVariable(name: "mid", scope: !69, file: !1, line: 249, type: !44)
!71 = !DILabel(scope: !41, name: "tail_recurse", file: !1, line: 234)
!72 = !DILocation(line: 0, scope: !69)
!73 = !DILocation(line: 0, scope: !41)
!74 = !DILocation(line: 234, column: 2, scope: !41)
!75 = !DILocation(line: 235, column: 13, scope: !57)
!76 = !DILocation(line: 235, column: 22, scope: !57)
!77 = !DILocation(line: 235, column: 8, scope: !41)
!78 = !DILocation(line: 0, scope: !55)
!79 = !DILocation(line: 236, column: 29, scope: !61)
!80 = !DILocation(line: 236, column: 6, scope: !55)
!81 = !DILocation(line: 255, column: 4, scope: !41)
!82 = !DILocation(line: 237, column: 12, scope: !59)
!83 = !DILocation(line: 237, column: 26, scope: !59)
!84 = !{!33, !33, i64 0}
!85 = !DILocation(line: 237, column: 31, scope: !65)
!86 = !DILocation(line: 237, column: 32, scope: !65)
!87 = !DILocation(line: 237, column: 8, scope: !59)
!88 = !DILocation(line: 237, column: 8, scope: !65)
!89 = !DILocation(line: 236, column: 37, scope: !61)
!90 = distinct !{!90, !80, !91, !92}
!91 = !DILocation(line: 246, column: 6, scope: !55)
!92 = !{!"llvm.loop.mustprogress"}
!93 = !DILocation(line: 242, column: 10, scope: !64)
!94 = !DILocation(line: 243, column: 3, scope: !64)
!95 = !DILocation(line: 243, column: 16, scope: !64)
!96 = !{!97, !97, i64 0}
!97 = !{!"int", !34, i64 0}
!98 = !DILocation(line: 244, column: 4, scope: !64)
!99 = !DILocation(line: 245, column: 8, scope: !65)
!100 = !DILocation(line: 237, column: 37, scope: !65)
!101 = distinct !{!101, !87, !102, !92}
!102 = !DILocation(line: 245, column: 8, scope: !59)
!103 = !DILocation(line: 249, column: 29, scope: !69)
!104 = !DILocation(line: 249, column: 26, scope: !69)
!105 = !DILocation(line: 250, column: 17, scope: !69)
!106 = distinct !{!106, !107}
!107 = !{!"tapir.loop.grainsize", i32 1}
!108 = !DILocation(line: 257, column: 1, scope: !41)
!109 = distinct !DISubprogram(name: "parallel_for_seq", scope: !1, file: !1, line: 259, type: !42, scopeLine: 260, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !110)
!110 = !{!111, !112, !113, !114, !115}
!111 = !DILocalVariable(name: "start", arg: 1, scope: !109, file: !1, line: 259, type: !44)
!112 = !DILocalVariable(name: "end", arg: 2, scope: !109, file: !1, line: 259, type: !44)
!113 = !DILocalVariable(name: "granularity", arg: 3, scope: !109, file: !1, line: 260, type: !24)
!114 = !DILocalVariable(name: "m", arg: 4, scope: !109, file: !1, line: 260, type: !24)
!115 = !DILocalVariable(name: "res", arg: 5, scope: !109, file: !1, line: 260, type: !47)
!116 = !DILocation(line: 0, scope: !109)
!117 = !DILocation(line: 298, column: 1, scope: !109)
!118 = distinct !DISubprogram(name: "parallel_for_static", scope: !1, file: !1, line: 303, type: !119, scopeLine: 304, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !121)
!119 = !DISubroutineType(types: !120)
!120 = !{null, !44, !44, !24, !24, !47, !4}
!121 = !{!122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !135, !139, !142, !149, !151, !153, !154}
!122 = !DILocalVariable(name: "start", arg: 1, scope: !118, file: !1, line: 303, type: !44)
!123 = !DILocalVariable(name: "end", arg: 2, scope: !118, file: !1, line: 303, type: !44)
!124 = !DILocalVariable(name: "granularity", arg: 3, scope: !118, file: !1, line: 303, type: !24)
!125 = !DILocalVariable(name: "m", arg: 4, scope: !118, file: !1, line: 304, type: !24)
!126 = !DILocalVariable(name: "res", arg: 5, scope: !118, file: !1, line: 304, type: !47)
!127 = !DILocalVariable(name: "resumeCtx", arg: 6, scope: !118, file: !1, line: 304, type: !4)
!128 = !DILocalVariable(name: "size", scope: !118, file: !1, line: 306, type: !67)
!129 = !DILocalVariable(name: "nWorkers", scope: !118, file: !1, line: 307, type: !44)
!130 = !DILocalVariable(name: "static_range", scope: !118, file: !1, line: 308, type: !44)
!131 = !DILocalVariable(name: "i", scope: !132, file: !1, line: 311, type: !67)
!132 = distinct !DILexicalBlock(scope: !133, file: !1, line: 311, column: 5)
!133 = distinct !DILexicalBlock(scope: !134, file: !1, line: 310, column: 27)
!134 = distinct !DILexicalBlock(scope: !118, file: !1, line: 310, column: 6)
!135 = !DILocalVariable(name: "j", scope: !136, file: !1, line: 312, type: !62)
!136 = distinct !DILexicalBlock(scope: !137, file: !1, line: 312, column: 7)
!137 = distinct !DILexicalBlock(scope: !138, file: !1, line: 311, column: 34)
!138 = distinct !DILexicalBlock(scope: !132, file: !1, line: 311, column: 5)
!139 = !DILocalVariable(name: "a", scope: !140, file: !1, line: 315, type: !66)
!140 = distinct !DILexicalBlock(scope: !141, file: !1, line: 312, column: 40)
!141 = distinct !DILexicalBlock(scope: !136, file: !1, line: 312, column: 7)
!142 = !DILocalVariable(name: "parallelCtx", scope: !143, file: !1, line: 327, type: !144)
!143 = distinct !DILexicalBlock(scope: !134, file: !1, line: 319, column: 10)
!144 = !DICompositeType(tag: DW_TAG_array_type, baseType: !145, size: 4096, elements: !147)
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !146, size: 64)
!146 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: null)
!147 = !{!148}
!148 = !DISubrange(count: 64)
!149 = !DILocalVariable(name: "i", scope: !150, file: !1, line: 337, type: !67)
!150 = distinct !DILexicalBlock(scope: !143, file: !1, line: 337, column: 5)
!151 = !DILocalVariable(name: "start_par", scope: !152, file: !1, line: 351, type: !67)
!152 = distinct !DILexicalBlock(scope: !143, file: !1, line: 349, column: 13)
!153 = !DILocalVariable(name: "end_par", scope: !152, file: !1, line: 352, type: !67)
!154 = !DILabel(scope: !143, name: "det_cont", file: !1, line: 349)
!155 = !DILocation(line: 0, scope: !118)
!156 = !DILocation(line: 306, column: 18, scope: !118)
!157 = !DILocation(line: 229, column: 38, scope: !158, inlinedAt: !162)
!158 = distinct !DISubprogram(name: "num_workers", scope: !1, file: !1, line: 229, type: !159, scopeLine: 229, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !161)
!159 = !DISubroutineType(types: !160)
!160 = !{!44}
!161 = !{}
!162 = distinct !DILocation(line: 307, column: 21, scope: !118)
!163 = !DILocation(line: 308, column: 25, scope: !118)
!164 = !DILocation(line: 310, column: 11, scope: !134)
!165 = !DILocation(line: 310, column: 6, scope: !118)
!166 = !DILocation(line: 0, scope: !132)
!167 = !DILocation(line: 311, column: 22, scope: !138)
!168 = !DILocation(line: 311, column: 23, scope: !138)
!169 = !DILocation(line: 311, column: 5, scope: !132)
!170 = !DILocation(line: 312, column: 11, scope: !136)
!171 = !DILocation(line: 312, column: 25, scope: !136)
!172 = !DILocation(line: 312, column: 30, scope: !141)
!173 = !DILocation(line: 312, column: 31, scope: !141)
!174 = !DILocation(line: 312, column: 7, scope: !136)
!175 = !DILocation(line: 312, column: 7, scope: !141)
!176 = !DILocation(line: 311, column: 30, scope: !138)
!177 = distinct !{!177, !169, !178, !92}
!178 = !DILocation(line: 318, column: 5, scope: !132)
!179 = !DILocation(line: 314, column: 9, scope: !140)
!180 = !DILocation(line: 315, column: 2, scope: !140)
!181 = !DILocation(line: 315, column: 15, scope: !140)
!182 = !DILocation(line: 316, column: 3, scope: !140)
!183 = !DILocation(line: 317, column: 7, scope: !141)
!184 = !DILocation(line: 312, column: 36, scope: !141)
!185 = distinct !{!185, !174, !186, !92}
!186 = !DILocation(line: 317, column: 7, scope: !136)
!187 = !DILocation(line: 308, column: 29, scope: !118)
!188 = !DILocation(line: 320, column: 21, scope: !189)
!189 = distinct !DILexicalBlock(scope: !143, file: !1, line: 320, column: 8)
!190 = !DILocation(line: 320, column: 8, scope: !143)
!191 = !DILocation(line: 324, column: 21, scope: !143)
!192 = !DILocation(line: 324, column: 5, scope: !143)
!193 = !DILocation(line: 324, column: 19, scope: !143)
!194 = !{!195, !195, i64 0}
!195 = !{!"any pointer", !34, i64 0}
!196 = !DILocation(line: 327, column: 5, scope: !143)
!197 = !DILocation(line: 327, column: 20, scope: !143)
!198 = !DILocation(line: 335, column: 64, scope: !143)
!199 = !DILocation(line: 335, column: 5, scope: !143)
!200 = !DILocation(line: 0, scope: !150)
!201 = !DILocation(line: 337, column: 19, scope: !202)
!202 = distinct !DILexicalBlock(scope: !150, file: !1, line: 337, column: 5)
!203 = !DILocation(line: 337, column: 5, scope: !150)
!204 = !DILocation(line: 344, column: 38, scope: !143)
!205 = !DILocation(line: 344, column: 5, scope: !143)
!206 = !DILocation(line: 365, column: 3, scope: !134)
!207 = !DILocation(line: 338, column: 7, scope: !208)
!208 = distinct !DILexicalBlock(scope: !202, file: !1, line: 337, column: 35)
!209 = !DILocation(line: 337, column: 31, scope: !202)
!210 = distinct !{!210, !203, !211, !92}
!211 = !DILocation(line: 339, column: 5, scope: !150)
!212 = !DILocation(line: 349, column: 3, scope: !143)
!213 = !DILocation(line: 351, column: 29, scope: !152)
!214 = !DILocation(line: 351, column: 37, scope: !152)
!215 = !DILocation(line: 351, column: 27, scope: !152)
!216 = !DILocation(line: 0, scope: !152)
!217 = !DILocation(line: 352, column: 36, scope: !152)
!218 = !DILocation(line: 352, column: 27, scope: !152)
!219 = !DILocation(line: 352, column: 39, scope: !152)
!220 = !DILocation(line: 352, column: 25, scope: !152)
!221 = !DILocation(line: 353, column: 28, scope: !222)
!222 = distinct !DILexicalBlock(scope: !152, file: !1, line: 353, column: 8)
!223 = !DILocation(line: 353, column: 17, scope: !222)
!224 = !DILocation(line: 353, column: 8, scope: !152)
!225 = !DILocation(line: 359, column: 26, scope: !152)
!226 = !DILocation(line: 359, column: 37, scope: !152)
!227 = !DILocation(line: 359, column: 5, scope: !152)
!228 = !DILocation(line: 363, column: 41, scope: !152)
!229 = !DILocation(line: 363, column: 5, scope: !152)
!230 = !DILocation(line: 366, column: 1, scope: !118)
!231 = !DISubprogram(name: "push_workmsg", scope: !1, file: !1, line: 62, type: !232, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !161)
!232 = !DISubroutineType(types: !233)
!233 = !{null, !4, !67}
!234 = !DISubprogram(name: "resume2scheduler", scope: !1, file: !1, line: 61, type: !235, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !161)
!235 = !DISubroutineType(types: !236)
!236 = !{null, !4, !3}
!237 = !DISubprogram(name: "get_stacklet_ctx", scope: !1, file: !1, line: 64, type: !238, spFlags: DISPFlagOptimized, retainedNodes: !161)
!238 = !DISubroutineType(types: !239)
!239 = !{!4}
!240 = distinct !DISubprogram(name: "startup_cilk", scope: !1, file: !1, line: 370, type: !241, scopeLine: 370, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !243)
!241 = !DISubroutineType(types: !242)
!242 = !{null, !24, !24, !24, !47}
!243 = !{!244, !245, !246, !247, !248}
!244 = !DILocalVariable(name: "n", arg: 1, scope: !240, file: !1, line: 370, type: !24)
!245 = !DILocalVariable(name: "m", arg: 2, scope: !240, file: !1, line: 370, type: !24)
!246 = !DILocalVariable(name: "granularity", arg: 3, scope: !240, file: !1, line: 370, type: !24)
!247 = !DILocalVariable(name: "res", arg: 4, scope: !240, file: !1, line: 370, type: !47)
!248 = !DILocalVariable(name: "sumRes", scope: !240, file: !1, line: 371, type: !16)
!249 = !DILocation(line: 0, scope: !240)
!250 = !DILocation(line: 378, column: 3, scope: !240)
!251 = !DILocation(line: 423, column: 1, scope: !240)
!252 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 429, type: !253, scopeLine: 429, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !255)
!253 = !DISubroutineType(types: !254)
!254 = !{!67, !67, !5}
!255 = !{!256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !268, !271, !272, !273}
!256 = !DILocalVariable(name: "argc", arg: 1, scope: !252, file: !1, line: 429, type: !67)
!257 = !DILocalVariable(name: "argv", arg: 2, scope: !252, file: !1, line: 429, type: !5)
!258 = !DILocalVariable(name: "n", scope: !252, file: !1, line: 431, type: !24)
!259 = !DILocalVariable(name: "m", scope: !252, file: !1, line: 431, type: !24)
!260 = !DILocalVariable(name: "maxGran", scope: !252, file: !1, line: 431, type: !24)
!261 = !DILocalVariable(name: "round", scope: !252, file: !1, line: 431, type: !24)
!262 = !DILocalVariable(name: "result", scope: !252, file: !1, line: 432, type: !47)
!263 = !DILocalVariable(name: "resval", scope: !252, file: !1, line: 446, type: !24)
!264 = !DILocalVariable(name: "len", scope: !252, file: !1, line: 450, type: !44)
!265 = !DILocalVariable(name: "granularity", scope: !252, file: !1, line: 454, type: !24)
!266 = !DILocalVariable(name: "r", scope: !267, file: !1, line: 457, type: !24)
!267 = distinct !DILexicalBlock(scope: !252, file: !1, line: 457, column: 3)
!268 = !DILocalVariable(name: "t1", scope: !269, file: !1, line: 459, type: !18)
!269 = distinct !DILexicalBlock(scope: !270, file: !1, line: 457, column: 31)
!270 = distinct !DILexicalBlock(scope: !267, file: !1, line: 457, column: 3)
!271 = !DILocalVariable(name: "t2", scope: !269, file: !1, line: 459, type: !18)
!272 = !DILocalVariable(name: "runtime_ms", scope: !269, file: !1, line: 463, type: !16)
!273 = !DILocalVariable(name: "i", scope: !274, file: !1, line: 470, type: !24)
!274 = distinct !DILexicalBlock(scope: !252, file: !1, line: 470, column: 3)
!275 = !DILocation(line: 0, scope: !252)
!276 = !DILocation(line: 435, column: 12, scope: !277)
!277 = distinct !DILexicalBlock(scope: !252, file: !1, line: 435, column: 7)
!278 = !DILocation(line: 435, column: 7, scope: !252)
!279 = !DILocation(line: 436, column: 13, scope: !280)
!280 = distinct !DILexicalBlock(scope: !277, file: !1, line: 435, column: 18)
!281 = !DILocation(line: 436, column: 5, scope: !280)
!282 = !DILocation(line: 437, column: 5, scope: !280)
!283 = !DILocation(line: 440, column: 12, scope: !252)
!284 = !DILocalVariable(name: "__nptr", arg: 1, scope: !285, file: !286, line: 283, type: !289)
!285 = distinct !DISubprogram(name: "atol", scope: !286, file: !286, line: 283, type: !287, scopeLine: 284, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !291)
!286 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f7a1412d75d9e3df251dfc21b02d59ef")
!287 = !DISubroutineType(types: !288)
!288 = !{!24, !289}
!289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !290, size: 64)
!290 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!291 = !{!284}
!292 = !DILocation(line: 0, scope: !285, inlinedAt: !293)
!293 = distinct !DILocation(line: 440, column: 7, scope: !252)
!294 = !DILocation(line: 285, column: 10, scope: !285, inlinedAt: !293)
!295 = !DILocation(line: 441, column: 12, scope: !252)
!296 = !DILocation(line: 0, scope: !285, inlinedAt: !297)
!297 = distinct !DILocation(line: 441, column: 7, scope: !252)
!298 = !DILocation(line: 285, column: 10, scope: !285, inlinedAt: !297)
!299 = !DILocation(line: 442, column: 18, scope: !252)
!300 = !DILocation(line: 0, scope: !285, inlinedAt: !301)
!301 = distinct !DILocation(line: 442, column: 13, scope: !252)
!302 = !DILocation(line: 285, column: 10, scope: !285, inlinedAt: !301)
!303 = !DILocation(line: 443, column: 16, scope: !252)
!304 = !DILocation(line: 0, scope: !285, inlinedAt: !305)
!305 = distinct !DILocation(line: 443, column: 11, scope: !252)
!306 = !DILocation(line: 285, column: 10, scope: !285, inlinedAt: !305)
!307 = !DILocation(line: 445, column: 12, scope: !252)
!308 = !DILocation(line: 0, scope: !267)
!309 = !DILocation(line: 457, column: 18, scope: !270)
!310 = !DILocation(line: 457, column: 3, scope: !267)
!311 = !DILocation(line: 466, column: 3, scope: !252)
!312 = !DILocation(line: 0, scope: !274)
!313 = !DILocation(line: 470, column: 18, scope: !314)
!314 = distinct !DILexicalBlock(scope: !274, file: !1, line: 470, column: 3)
!315 = !DILocation(line: 470, column: 3, scope: !274)
!316 = !DILocation(line: 459, column: 5, scope: !269)
!317 = !DILocation(line: 459, column: 20, scope: !269)
!318 = !DILocation(line: 459, column: 24, scope: !269)
!319 = !DILocation(line: 460, column: 5, scope: !269)
!320 = !DILocation(line: 461, column: 5, scope: !269)
!321 = !DILocation(line: 462, column: 5, scope: !269)
!322 = !DILocation(line: 0, scope: !13, inlinedAt: !323)
!323 = distinct !DILocation(line: 463, column: 38, scope: !269)
!324 = !DILocation(line: 34, column: 16, scope: !13, inlinedAt: !323)
!325 = !DILocation(line: 34, column: 43, scope: !13, inlinedAt: !323)
!326 = !DILocation(line: 0, scope: !13, inlinedAt: !327)
!327 = distinct !DILocation(line: 463, column: 50, scope: !269)
!328 = !DILocation(line: 34, column: 16, scope: !13, inlinedAt: !327)
!329 = !DILocation(line: 34, column: 43, scope: !13, inlinedAt: !327)
!330 = !DILocation(line: 34, column: 37, scope: !13, inlinedAt: !323)
!331 = !DILocation(line: 463, column: 49, scope: !269)
!332 = !DILocation(line: 463, column: 62, scope: !269)
!333 = !DILocation(line: 0, scope: !269)
!334 = !DILocation(line: 464, column: 19, scope: !269)
!335 = !DILocation(line: 464, column: 29, scope: !269)
!336 = !DILocation(line: 464, column: 5, scope: !269)
!337 = !DILocation(line: 465, column: 3, scope: !270)
!338 = !DILocation(line: 457, column: 27, scope: !270)
!339 = distinct !{!339, !310, !340, !92}
!340 = !DILocation(line: 465, column: 3, scope: !267)
!341 = distinct !{!341, !315, !342, !92}
!342 = !DILocation(line: 472, column: 3, scope: !274)
!343 = !DILocation(line: 474, column: 3, scope: !252)
!344 = !DILocation(line: 475, column: 3, scope: !252)
!345 = !DILocation(line: 471, column: 5, scope: !346)
!346 = distinct !DILexicalBlock(scope: !314, file: !1, line: 470, column: 27)
!347 = !DILocation(line: 470, column: 23, scope: !314)
!348 = !DISubprogram(name: "gettimeofday", scope: !349, file: !349, line: 72, type: !350, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !161)
!349 = !DIFile(filename: "/usr/include/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b3cbcac52b1954fa045aa74bfcd1a38")
!350 = !DISubroutineType(types: !351)
!351 = !{!67, !352, !353}
!352 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !17)
!353 = !DIDerivedType(tag: DW_TAG_typedef, name: "__timezone_ptr_t", file: !349, line: 62, baseType: !354)
!354 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !355)
!355 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !356, size: 64)
!356 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !349, line: 56, size: 64, elements: !357)
!357 = !{!358, !359}
!358 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !356, file: !349, line: 58, baseType: !67, size: 32)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !356, file: !349, line: 59, baseType: !67, size: 32, offset: 32)
