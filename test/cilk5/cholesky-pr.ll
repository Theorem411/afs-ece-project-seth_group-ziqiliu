; ModuleID = './cholesky.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timeval = type { i64, i64 }
%struct.InternalNode = type { [4 x %struct.InternalNode*] }
%struct.LeafNode = type { [4 x [4 x double]] }
%struct.timezone = type { i32, i32 }

@rand_nxt = dso_local local_unnamed_addr global i64 0, align 8, !dbg !0
@.str = private unnamed_addr constant [11 x i8] c"depth >= 2\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"cholesky.c\00", align 1
@__PRETTY_FUNCTION__.get_matrix = private unnamed_addr constant [39 x i8] c"Real get_matrix(int, Matrix, int, int)\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"r < (1 << depth)\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"c < (1 << depth)\00", align 1
@__PRETTY_FUNCTION__.set_matrix = private unnamed_addr constant [47 x i8] c"Matrix set_matrix(int, Matrix, int, int, Real)\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"%6d %6d: %12f\0A\00", align 1
@.str.5 = private unnamed_addr constant [35 x i8] c"a != ((void*)0) && b != ((void*)0)\00", align 1
@__PRETTY_FUNCTION__.mul_and_subT = private unnamed_addr constant [54 x i8] c"Matrix mul_and_subT(int, int, Matrix, Matrix, Matrix)\00", align 1
@.str.6 = private unnamed_addr constant [48 x i8] c"r->child[0] == ((void*)0) || r->child[0] == r00\00", align 1
@.str.7 = private unnamed_addr constant [48 x i8] c"r->child[1] == ((void*)0) || r->child[1] == r01\00", align 1
@.str.8 = private unnamed_addr constant [48 x i8] c"r->child[2] == ((void*)0) || r->child[2] == r10\00", align 1
@.str.9 = private unnamed_addr constant [48 x i8] c"r->child[3] == ((void*)0) || r->child[3] == r11\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"a != ((void*)0)\00", align 1
@__PRETTY_FUNCTION__.backsub = private unnamed_addr constant [36 x i8] c"Matrix backsub(int, Matrix, Matrix)\00", align 1
@.str.11 = private unnamed_addr constant [16 x i8] c"l != ((void*)0)\00", align 1
@.str.12 = private unnamed_addr constant [11 x i8] c"l00 && l11\00", align 1
@__PRETTY_FUNCTION__.cholesky = private unnamed_addr constant [29 x i8] c"Matrix cholesky(int, Matrix)\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"a00\00", align 1
@.str.15 = private unnamed_addr constant [4 x i8] c"a11\00", align 1
@stderr = external dso_local local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.16 = private unnamed_addr constant [480 x i8] c"\0AUsage: cholesky [<cilk-options>] [-n size] [-z nonzeros]\0A                [-f filename] [-benchmark] [-h]\0A\0ADefault: cholesky -n 500 -z 1000\0A\0AThis program performs a divide and conquer Cholesky factorization of a\0Asparse symmetric positive definite matrix (A=LL^T).  Using the fact\0Athat the matrix is symmetric, Cholesky does half the number of\0Aoperations of LU.  The method used is the same as with LU, with work\0ATheta(n^3) and critical path Theta(n lg(n)) for the dense case.  A\0A\00", align 1
@.str.17 = private unnamed_addr constant [279 x i8] c"quad-tree is used to store the nonzero entries of the sparse\0Amatrix. Actual work and critical path are influenced by the sparsity\0A pattern of the matrix.\0A\0AThe input matrix is either read from the provided file or generated\0Arandomly with size and nonzero-elements as specified.\0A\0A\00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"-n\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"-z\00", align 1
@.str.20 = private unnamed_addr constant [3 x i8] c"-c\00", align 1
@.str.21 = private unnamed_addr constant [3 x i8] c"-f\00", align 1
@.str.22 = private unnamed_addr constant [11 x i8] c"-benchmark\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"-h\00", align 1
@.str.24 = private unnamed_addr constant [3 x i8] c"-r\00", align 1
@specifiers = dso_local global [8 x i8*] [i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.24, i32 0, i32 0), i8* null], align 16, !dbg !27
@opt_types = dso_local global [8 x i32] [i32 1, i32 1, i32 4, i32 5, i32 6, i32 4, i32 1, i32 0], align 16, !dbg !35
@.str.25 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.27 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.28 = private unnamed_addr constant [15 x i8] c"sizex == sizey\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [23 x i8] c"int main(int, char **)\00", align 1
@.str.29 = private unnamed_addr constant [12 x i8] c"%lf %lf %lf\00", align 1
@.str.30 = private unnamed_addr constant [7 x i8] c"r >= c\00", align 1
@.str.31 = private unnamed_addr constant [9 x i8] c"r < size\00", align 1
@.str.32 = private unnamed_addr constant [9 x i8] c"c < size\00", align 1
@.str.33 = private unnamed_addr constant [15 x i8] c"PBBS-time: %f\0A\00", align 1
@.str.35 = private unnamed_addr constant [25 x i8] c"\0ACilk Example: cholesky\0A\00", align 1
@.str.36 = private unnamed_addr constant [12 x i8] c"Error: %f\0A\0A\00", align 1
@.str.37 = private unnamed_addr constant [33 x i8] c"Options: original size     = %d\0A\00", align 1
@.str.38 = private unnamed_addr constant [33 x i8] c"         original nonzeros = %d\0A\00", align 1
@.str.39 = private unnamed_addr constant [33 x i8] c"         input nonzeros    = %d\0A\00", align 1
@.str.40 = private unnamed_addr constant [33 x i8] c"         input blocks      = %d\0A\00", align 1
@.str.41 = private unnamed_addr constant [33 x i8] c"         output nonzeros   = %d\0A\00", align 1
@.str.42 = private unnamed_addr constant [34 x i8] c"         output blocks     = %d\0A\0A\00", align 1
@.str.44 = private unnamed_addr constant [16 x i8] c"sqrt error: %f\0A\00", align 1
@str.47 = private unnamed_addr constant [15 x i8] c"out of memory!\00", align 1
@str.49 = private unnamed_addr constant [42 x i8] c"matrix is probably not numerically stable\00", align 1
@str.50 = private unnamed_addr constant [22 x i8] c"Now check result ... \00", align 1
@str.51 = private unnamed_addr constant [18 x i8] c"\0AFile not found!\0A\00", align 1

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i64 @todval(%struct.timeval* nocapture noundef readonly %tp) local_unnamed_addr #0 !dbg !45 {
entry:
  call void @llvm.dbg.value(metadata %struct.timeval* %tp, metadata !60, metadata !DIExpression()), !dbg !61
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 0, !dbg !62
  %0 = load i64, i64* %tv_sec, align 8, !dbg !62, !tbaa !63
  %mul1 = mul i64 %0, 1000000, !dbg !68
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %tp, i64 0, i32 1, !dbg !69
  %1 = load i64, i64* %tv_usec, align 8, !dbg !69, !tbaa !70
  %add = add nsw i64 %mul1, %1, !dbg !71
  ret i64 %add, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable writeonly
define dso_local void @startup_cilk() local_unnamed_addr #2 !dbg !73 {
entry:
  %g = alloca double, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !85
  %g.0.g.0.g.0..sroa_cast = bitcast double* %g to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !86
  call void @llvm.dbg.value(metadata double 2.000000e+00, metadata !77, metadata !DIExpression()), !dbg !85
  store double 2.000000e+00, double* %g, align 8, !dbg !87, !tbaa !88
  call void @llvm.dbg.value(metadata i32 0, metadata !78, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i32 1000, metadata !80, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i32 0, metadata !81, metadata !DIExpression()), !dbg !90
  call void @llvm.dbg.value(metadata i32 1000, metadata !82, metadata !DIExpression()), !dbg !90
  br label %pfor.cond, !dbg !91

pfor.cond:                                        ; preds = %pfor.inc, %entry
  %__begin.0 = phi i32 [ 0, %entry ], [ %inc, %pfor.inc ], !dbg !90
  call void @llvm.dbg.value(metadata i32 %__begin.0, metadata !81, metadata !DIExpression()), !dbg !90
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc, !dbg !92

pfor.body.entry:                                  ; preds = %pfor.cond
  call void @llvm.dbg.value(metadata !DIArgList(i32 0, i32 %__begin.0), metadata !83, metadata !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value)), !dbg !93
  %g.0.g.0.g.0. = load double, double* %g, align 8, !dbg !94, !tbaa !88
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !77, metadata !DIExpression()), !dbg !85
  %call = tail call double @sin(double noundef %g.0.g.0.g.0.) #22, !dbg !96
  call void @llvm.dbg.value(metadata double %g.0.g.0.g.0., metadata !77, metadata !DIExpression()), !dbg !85
  %div3 = fdiv double %g.0.g.0.g.0., %call, !dbg !97
  call void @llvm.dbg.value(metadata double %div3, metadata !77, metadata !DIExpression()), !dbg !85
  store double %div3, double* %g, align 8, !dbg !97, !tbaa !88
  reattach within %syncreg, label %pfor.inc, !dbg !98

pfor.inc:                                         ; preds = %pfor.body.entry, %pfor.cond
  %inc = add nuw nsw i32 %__begin.0, 1, !dbg !99
  call void @llvm.dbg.value(metadata i32 %inc, metadata !81, metadata !DIExpression()), !dbg !90
  %exitcond.not = icmp eq i32 %inc, 1000, !dbg !100
  br i1 %exitcond.not, label %pfor.cond.cleanup, label %pfor.cond, !dbg !101, !llvm.loop !102

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %cleanup, !dbg !101

cleanup:                                          ; preds = %pfor.cond.cleanup
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %g.0.g.0.g.0..sroa_cast), !dbg !105
  ret void, !dbg !105
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
define dso_local i32 @cilk_rand() local_unnamed_addr #6 !dbg !106 {
entry:
  %0 = load i64, i64* @rand_nxt, align 8, !dbg !111, !tbaa !112
  %mul = mul i64 %0, 1103515245, !dbg !113
  %add = add i64 %mul, 12345, !dbg !114
  store i64 %add, i64* @rand_nxt, align 8, !dbg !115, !tbaa !112
  %shr = lshr i64 %add, 16, !dbg !116
  %1 = trunc i64 %shr to i32, !dbg !117
  %conv = and i32 %1, 2147483647, !dbg !117
  call void @llvm.dbg.value(metadata i32 %conv, metadata !110, metadata !DIExpression()), !dbg !118
  ret i32 %conv, !dbg !119
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly
define dso_local void @cilk_srand(i32 noundef %seed) local_unnamed_addr #7 !dbg !120 {
entry:
  call void @llvm.dbg.value(metadata i32 %seed, metadata !124, metadata !DIExpression()), !dbg !125
  %conv = zext i32 %seed to i64, !dbg !126
  store i64 %conv, i64* @rand_nxt, align 8, !dbg !127, !tbaa !112
  ret void, !dbg !128
}

; Function Attrs: nounwind uwtable
define dso_local noalias %struct.InternalNode* @copy_matrix(i32 noundef %depth, %struct.InternalNode* noundef readonly %a) local_unnamed_addr #8 !dbg !129 {
entry:
  %r00 = alloca %struct.InternalNode*, align 8
  %r01 = alloca %struct.InternalNode*, align 8
  %r10 = alloca %struct.InternalNode*, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !145
  call void @llvm.dbg.value(metadata i32 %depth, metadata !134, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !135, metadata !DIExpression()), !dbg !145
  %tobool.not = icmp eq %struct.InternalNode* %a, null, !dbg !146
  br i1 %tobool.not, label %cleanup, label %if.end, !dbg !148

if.end:                                           ; preds = %entry
  %cmp = icmp eq i32 %depth, 2, !dbg !149
  br i1 %cmp, label %if.then1, label %if.end4, !dbg !150

if.then1:                                         ; preds = %if.end
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !137, metadata !DIExpression()), !dbg !151
  %call.i = tail call noalias dereferenceable_or_null(128) i8* @malloc(i64 noundef 128) #22, !dbg !152
  call void @llvm.dbg.value(metadata i8* %call.i, metadata !157, metadata !DIExpression()) #22, !dbg !159
  %cmp.i = icmp eq i8* %call.i, null, !dbg !160
  br i1 %cmp.i, label %if.then.i, label %new_block_leaf.exit, !dbg !162

if.then.i:                                        ; preds = %if.then1
  %puts.i = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str.47, i64 0, i64 0)) #22, !dbg !163
  tail call void @exit(i32 noundef 1) #23, !dbg !165
  unreachable, !dbg !165

new_block_leaf.exit:                              ; preds = %if.then1
  %0 = bitcast i8* %call.i to %struct.InternalNode*, !dbg !166
  call void @llvm.dbg.value(metadata %struct.InternalNode* %0, metadata !157, metadata !DIExpression()) #22, !dbg !159
  call void @llvm.dbg.value(metadata %struct.InternalNode* %0, metadata !136, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata %struct.InternalNode* %0, metadata !140, metadata !DIExpression()), !dbg !151
  %1 = bitcast %struct.InternalNode* %a to i8*, !dbg !167
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(128) %call.i, i8* noundef nonnull align 8 dereferenceable(128) %1, i64 128, i1 false), !dbg !167
  br label %cleanup

if.end4:                                          ; preds = %if.end
  %r00.0.r00.0.r00.0..sroa_cast = bitcast %struct.InternalNode** %r00 to i8*, !dbg !168
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %r00.0.r00.0.r00.0..sroa_cast), !dbg !168
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !141, metadata !DIExpression()), !dbg !145
  store %struct.InternalNode* null, %struct.InternalNode** %r00, align 8, !dbg !169, !tbaa !170
  %r01.0.r01.0.r01.0..sroa_cast = bitcast %struct.InternalNode** %r01 to i8*, !dbg !168
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %r01.0.r01.0.r01.0..sroa_cast), !dbg !168
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !142, metadata !DIExpression()), !dbg !145
  store %struct.InternalNode* null, %struct.InternalNode** %r01, align 8, !dbg !172, !tbaa !170
  %r10.0.r10.0.r10.0..sroa_cast = bitcast %struct.InternalNode** %r10 to i8*, !dbg !168
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %r10.0.r10.0.r10.0..sroa_cast), !dbg !168
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !143, metadata !DIExpression()), !dbg !145
  store %struct.InternalNode* null, %struct.InternalNode** %r10, align 8, !dbg !173, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !144, metadata !DIExpression()), !dbg !145
  %dec = add nsw i32 %depth, -1, !dbg !174
  call void @llvm.dbg.value(metadata i32 %dec, metadata !134, metadata !DIExpression()), !dbg !145
  %arrayidx = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 0, !dbg !175
  %2 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx, align 8, !dbg !175, !tbaa !170
  detach within %syncreg, label %det.achd, label %det.cont.tf, !dbg !176

det.achd:                                         ; preds = %if.end4
  %call5 = tail call %struct.InternalNode* @copy_matrix(i32 noundef %dec, %struct.InternalNode* noundef %2), !dbg !176
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call5, metadata !141, metadata !DIExpression()), !dbg !145
  store %struct.InternalNode* %call5, %struct.InternalNode** %r00, align 8, !dbg !177, !tbaa !170
  reattach within %syncreg, label %det.cont.tf, !dbg !177

det.cont.tf:                                      ; preds = %det.achd, %if.end4
  %arrayidx7 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 1, !dbg !178
  %3 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx7, align 8, !dbg !178, !tbaa !170
  detach within %syncreg, label %det.achd8, label %det.cont10.tf, !dbg !179

det.achd8:                                        ; preds = %det.cont.tf
  %call9 = tail call %struct.InternalNode* @copy_matrix(i32 noundef %dec, %struct.InternalNode* noundef %3), !dbg !179
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call9, metadata !142, metadata !DIExpression()), !dbg !145
  store %struct.InternalNode* %call9, %struct.InternalNode** %r01, align 8, !dbg !180, !tbaa !170
  reattach within %syncreg, label %det.cont10.tf, !dbg !180

det.cont10.tf:                                    ; preds = %det.achd8, %det.cont.tf
  %arrayidx12 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 2, !dbg !181
  %4 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx12, align 8, !dbg !181, !tbaa !170
  detach within %syncreg, label %det.achd13, label %det.cont15, !dbg !182

det.achd13:                                       ; preds = %det.cont10.tf
  %call14 = tail call %struct.InternalNode* @copy_matrix(i32 noundef %dec, %struct.InternalNode* noundef %4), !dbg !182
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call14, metadata !143, metadata !DIExpression()), !dbg !145
  store %struct.InternalNode* %call14, %struct.InternalNode** %r10, align 8, !dbg !183, !tbaa !170
  reattach within %syncreg, label %det.cont15, !dbg !183

det.cont15:                                       ; preds = %det.achd13, %det.cont10.tf
  %arrayidx17 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 3, !dbg !184
  %5 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx17, align 8, !dbg !184, !tbaa !170
  %call18 = tail call %struct.InternalNode* @copy_matrix(i32 noundef %dec, %struct.InternalNode* noundef %5), !dbg !185
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call18, metadata !144, metadata !DIExpression()), !dbg !145
  sync within %syncreg, label %sync.continue, !dbg !186

sync.continue:                                    ; preds = %det.cont15
  %r00.0.r00.0.r00.0. = load %struct.InternalNode*, %struct.InternalNode** %r00, align 8, !dbg !187, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r00.0.r00.0.r00.0., metadata !141, metadata !DIExpression()), !dbg !145
  %r01.0.r01.0.r01.0. = load %struct.InternalNode*, %struct.InternalNode** %r01, align 8, !dbg !188, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r01.0.r01.0.r01.0., metadata !142, metadata !DIExpression()), !dbg !145
  %r10.0.r10.0.r10.0. = load %struct.InternalNode*, %struct.InternalNode** %r10, align 8, !dbg !189, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r10.0.r10.0.r10.0., metadata !143, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r00.0.r00.0.r00.0., metadata !190, metadata !DIExpression()) #22, !dbg !199
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r01.0.r01.0.r01.0., metadata !195, metadata !DIExpression()) #22, !dbg !199
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r10.0.r10.0.r10.0., metadata !196, metadata !DIExpression()) #22, !dbg !199
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call18, metadata !197, metadata !DIExpression()) #22, !dbg !199
  %call.i40 = tail call noalias dereferenceable_or_null(32) i8* @malloc(i64 noundef 32) #22, !dbg !201
  %6 = bitcast i8* %call.i40 to %struct.InternalNode*, !dbg !202
  call void @llvm.dbg.value(metadata %struct.InternalNode* %6, metadata !198, metadata !DIExpression()) #22, !dbg !199
  %cmp.i41 = icmp eq i8* %call.i40, null, !dbg !203
  br i1 %cmp.i41, label %if.then.i43, label %new_internal.exit, !dbg !205

if.then.i43:                                      ; preds = %sync.continue
  %puts.i42 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str.47, i64 0, i64 0)) #22, !dbg !206
  tail call void @exit(i32 noundef 1) #23, !dbg !208
  unreachable, !dbg !208

new_internal.exit:                                ; preds = %sync.continue
  %arrayidx.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %6, i64 0, i32 0, i64 0, !dbg !209
  store %struct.InternalNode* %r00.0.r00.0.r00.0., %struct.InternalNode** %arrayidx.i, align 8, !dbg !210, !tbaa !170
  %arrayidx3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %6, i64 0, i32 0, i64 1, !dbg !211
  store %struct.InternalNode* %r01.0.r01.0.r01.0., %struct.InternalNode** %arrayidx3.i, align 8, !dbg !212, !tbaa !170
  %arrayidx5.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %6, i64 0, i32 0, i64 2, !dbg !213
  store %struct.InternalNode* %r10.0.r10.0.r10.0., %struct.InternalNode** %arrayidx5.i, align 8, !dbg !214, !tbaa !170
  %arrayidx7.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %6, i64 0, i32 0, i64 3, !dbg !215
  store %struct.InternalNode* %call18, %struct.InternalNode** %arrayidx7.i, align 8, !dbg !216, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %6, metadata !136, metadata !DIExpression()), !dbg !145
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %r10.0.r10.0.r10.0..sroa_cast), !dbg !217
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %r01.0.r01.0.r01.0..sroa_cast), !dbg !217
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %r00.0.r00.0.r00.0..sroa_cast), !dbg !217
  br label %cleanup

cleanup:                                          ; preds = %new_internal.exit, %new_block_leaf.exit, %entry
  %retval.0 = phi %struct.InternalNode* [ %0, %new_block_leaf.exit ], [ %6, %new_internal.exit ], [ null, %entry ], !dbg !145
  ret %struct.InternalNode* %retval.0, !dbg !217
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #9

; Function Attrs: nounwind uwtable
define dso_local void @free_matrix(i32 noundef %depth, %struct.InternalNode* noundef %a) local_unnamed_addr #8 !dbg !218 {
entry:
  call void @llvm.dbg.value(metadata i32 %depth, metadata !222, metadata !DIExpression()), !dbg !224
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !223, metadata !DIExpression()), !dbg !224
  %cmp = icmp eq %struct.InternalNode* %a, null, !dbg !225
  br i1 %cmp, label %common.ret, label %if.end, !dbg !227

if.end:                                           ; preds = %entry
  %cmp1 = icmp eq i32 %depth, 2, !dbg !228
  br i1 %cmp1, label %common.ret.sink.split, label %if.else, !dbg !230

common.ret.sink.split:                            ; preds = %if.else, %if.end
  %0 = bitcast %struct.InternalNode* %a to i8*, !dbg !231
  tail call void @free(i8* noundef %0) #22, !dbg !231
  br label %common.ret, !dbg !232

common.ret:                                       ; preds = %common.ret.sink.split, %entry
  ret void, !dbg !232

if.else:                                          ; preds = %if.end
  %dec = add nsw i32 %depth, -1, !dbg !233
  call void @llvm.dbg.value(metadata i32 %dec, metadata !222, metadata !DIExpression()), !dbg !224
  %arrayidx = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 0, !dbg !235
  %1 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx, align 8, !dbg !235, !tbaa !170
  tail call void @free_matrix(i32 noundef %dec, %struct.InternalNode* noundef %1), !dbg !236
  %arrayidx4 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 1, !dbg !237
  %2 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx4, align 8, !dbg !237, !tbaa !170
  tail call void @free_matrix(i32 noundef %dec, %struct.InternalNode* noundef %2), !dbg !238
  %arrayidx6 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 2, !dbg !239
  %3 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx6, align 8, !dbg !239, !tbaa !170
  tail call void @free_matrix(i32 noundef %dec, %struct.InternalNode* noundef %3), !dbg !240
  %arrayidx8 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 3, !dbg !241
  %4 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx8, align 8, !dbg !241, !tbaa !170
  tail call void @free_matrix(i32 noundef %dec, %struct.InternalNode* noundef %4), !dbg !242
  br label %common.ret.sink.split
}

; Function Attrs: inaccessiblemem_or_argmemonly mustprogress nounwind willreturn
declare dso_local void @free(i8* nocapture noundef) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define dso_local double @get_matrix(i32 noundef %depth, %struct.InternalNode* noundef readonly %a, i32 noundef %r, i32 noundef %c) local_unnamed_addr #8 !dbg !243 {
entry:
  call void @llvm.dbg.value(metadata i32 %depth, metadata !247, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !248, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %r, metadata !249, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %c, metadata !250, metadata !DIExpression()), !dbg !256
  %cmp9497101 = icmp sgt i32 %depth, 1, !dbg !257
  br i1 %cmp9497101, label %cond.end.lr.ph.lr.ph, label %cond.false, !dbg !257

cond.end.lr.ph.lr.ph:                             ; preds = %if.else25, %entry
  %c.tr.ph105 = phi i32 [ %c.tr.ph.be, %if.else25 ], [ %c, %entry ]
  %r.tr.ph104 = phi i32 [ %r.tr.ph.be, %if.else25 ], [ %r, %entry ]
  %a.tr.ph103 = phi %struct.InternalNode* [ %a.tr.ph.be, %if.else25 ], [ %a, %entry ]
  %depth.tr.ph102 = phi i32 [ %dec, %if.else25 ], [ %depth, %entry ]
  call void @llvm.dbg.value(metadata i32 %c.tr.ph105, metadata !250, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %r.tr.ph104, metadata !249, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr.ph103, metadata !248, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %depth.tr.ph102, metadata !247, metadata !DIExpression()), !dbg !256
  br label %cond.end.lr.ph, !dbg !257

cond.end.lr.ph:                                   ; preds = %if.else21, %cond.end.lr.ph.lr.ph
  %c.tr.ph76100 = phi i32 [ %c.tr.ph105, %cond.end.lr.ph.lr.ph ], [ %sub, %if.else21 ]
  %a.tr.ph7599 = phi %struct.InternalNode* [ %a.tr.ph103, %cond.end.lr.ph.lr.ph ], [ %2, %if.else21 ]
  %depth.tr.ph7498 = phi i32 [ %depth.tr.ph102, %cond.end.lr.ph.lr.ph ], [ %dec, %if.else21 ]
  call void @llvm.dbg.value(metadata i32 %c.tr.ph76100, metadata !250, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr.ph7599, metadata !248, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %depth.tr.ph7498, metadata !247, metadata !DIExpression()), !dbg !256
  br label %cond.end, !dbg !257

cond.false:                                       ; preds = %if.else25, %if.else21, %if.then19, %entry
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 362, i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @__PRETTY_FUNCTION__.get_matrix, i64 0, i64 0)) #23, !dbg !257
  unreachable, !dbg !257

cond.end:                                         ; preds = %if.then19, %cond.end.lr.ph
  %a.tr96 = phi %struct.InternalNode* [ %a.tr.ph7599, %cond.end.lr.ph ], [ %1, %if.then19 ]
  %depth.tr95 = phi i32 [ %depth.tr.ph7498, %cond.end.lr.ph ], [ %dec, %if.then19 ]
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr96, metadata !248, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %depth.tr95, metadata !247, metadata !DIExpression()), !dbg !256
  %shl = shl nuw i32 1, %depth.tr95, !dbg !258
  %cmp1 = icmp sgt i32 %shl, %r.tr.ph104, !dbg !258
  br i1 %cmp1, label %cond.end4, label %cond.false3, !dbg !258

cond.false3:                                      ; preds = %cond.end
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 363, i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @__PRETTY_FUNCTION__.get_matrix, i64 0, i64 0)) #23, !dbg !258
  unreachable, !dbg !258

cond.end4:                                        ; preds = %cond.end
  %cmp6 = icmp sgt i32 %shl, %c.tr.ph76100, !dbg !259
  br i1 %cmp6, label %cond.end9, label %cond.false8, !dbg !259

cond.false8:                                      ; preds = %cond.end4
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 364, i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @__PRETTY_FUNCTION__.get_matrix, i64 0, i64 0)) #23, !dbg !259
  unreachable, !dbg !259

cond.end9:                                        ; preds = %cond.end4
  %cmp10 = icmp eq %struct.InternalNode* %a.tr96, null, !dbg !260
  br i1 %cmp10, label %return, label %if.end, !dbg !262

if.end:                                           ; preds = %cond.end9
  %cmp11 = icmp eq i32 %depth.tr95, 2, !dbg !263
  br i1 %cmp11, label %if.then12, label %if.else, !dbg !264

if.then12:                                        ; preds = %if.end
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr96, metadata !251, metadata !DIExpression()), !dbg !265
  %block = bitcast %struct.InternalNode* %a.tr96 to [4 x [4 x double]]*, !dbg !266
  %idxprom = sext i32 %r.tr.ph104 to i64, !dbg !266
  %idxprom13 = sext i32 %c.tr.ph76100 to i64, !dbg !266
  %arrayidx14 = getelementptr inbounds [4 x [4 x double]], [4 x [4 x double]]* %block, i64 0, i64 %idxprom, i64 %idxprom13, !dbg !266
  %0 = load double, double* %arrayidx14, align 8, !dbg !266, !tbaa !88
  br label %return

if.else:                                          ; preds = %if.end
  %dec = add nsw i32 %depth.tr95, -1, !dbg !267
  call void @llvm.dbg.value(metadata i32 %dec, metadata !247, metadata !DIExpression()), !dbg !256
  %shl15 = shl nuw i32 1, %dec, !dbg !268
  call void @llvm.dbg.value(metadata i32 %shl15, metadata !254, metadata !DIExpression()), !dbg !269
  %cmp16 = icmp slt i32 %r.tr.ph104, %shl15, !dbg !270
  %cmp18 = icmp slt i32 %c.tr.ph76100, %shl15, !dbg !272
  br i1 %cmp16, label %if.then17, label %if.else25, !dbg !273

if.then17:                                        ; preds = %if.else
  br i1 %cmp18, label %if.then19, label %if.else21, !dbg !274

if.then19:                                        ; preds = %if.then17
  %arrayidx20 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr96, i64 0, i32 0, i64 0, !dbg !276
  %1 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx20, align 8, !dbg !276, !tbaa !170
  call void @llvm.dbg.value(metadata i32 %dec, metadata !247, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata %struct.InternalNode* %1, metadata !248, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %r.tr.ph104, metadata !249, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %c.tr.ph76100, metadata !250, metadata !DIExpression()), !dbg !256
  %cmp = icmp sgt i32 %depth.tr95, 2, !dbg !257
  br i1 %cmp, label %cond.end, label %cond.false, !dbg !257

if.else21:                                        ; preds = %if.then17
  %arrayidx23 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr96, i64 0, i32 0, i64 1, !dbg !278
  %2 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx23, align 8, !dbg !278, !tbaa !170
  %sub = sub nsw i32 %c.tr.ph76100, %shl15, !dbg !279
  call void @llvm.dbg.value(metadata i32 %dec, metadata !247, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata %struct.InternalNode* %2, metadata !248, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %r.tr.ph104, metadata !249, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %sub, metadata !250, metadata !DIExpression()), !dbg !256
  %cmp94 = icmp sgt i32 %depth.tr95, 2, !dbg !257
  br i1 %cmp94, label %cond.end.lr.ph, label %cond.false, !dbg !257

if.else25:                                        ; preds = %if.else
  %arrayidx34 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr96, i64 0, i32 0, i64 3, !dbg !280
  %arrayidx29 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr96, i64 0, i32 0, i64 2, !dbg !280
  %a.tr.ph.be.in = select i1 %cmp18, %struct.InternalNode** %arrayidx29, %struct.InternalNode** %arrayidx34, !dbg !280
  %sub36 = select i1 %cmp18, i32 0, i32 %shl15, !dbg !280
  %c.tr.ph.be = sub nsw i32 %c.tr.ph76100, %sub36, !dbg !280
  %r.tr.ph.be = sub nsw i32 %r.tr.ph104, %shl15, !dbg !282
  %a.tr.ph.be = load %struct.InternalNode*, %struct.InternalNode** %a.tr.ph.be.in, align 8, !dbg !282, !tbaa !170
  call void @llvm.dbg.value(metadata i32 %dec, metadata !247, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr.ph.be, metadata !248, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %r.tr.ph.be, metadata !249, metadata !DIExpression()), !dbg !256
  call void @llvm.dbg.value(metadata i32 %c.tr.ph.be, metadata !250, metadata !DIExpression()), !dbg !256
  %cmp9497 = icmp sgt i32 %depth.tr95, 2, !dbg !257
  br i1 %cmp9497, label %cond.end.lr.ph.lr.ph, label %cond.false, !dbg !257

return:                                           ; preds = %if.then12, %cond.end9
  %retval.1 = phi double [ %0, %if.then12 ], [ 0.000000e+00, %cond.end9 ], !dbg !256
  ret double %retval.1, !dbg !284
}

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8* noundef, i8* noundef, i32 noundef, i8* noundef) local_unnamed_addr #11

; Function Attrs: nounwind uwtable
define dso_local %struct.InternalNode* @set_matrix(i32 noundef %depth, %struct.InternalNode* noundef %a, i32 noundef %r, i32 noundef %c, double noundef %value) local_unnamed_addr #8 !dbg !285 {
entry:
  call void @llvm.dbg.value(metadata i32 %depth, metadata !289, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !290, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i32 %r, metadata !291, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata i32 %c, metadata !292, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata double %value, metadata !293, metadata !DIExpression()), !dbg !299
  %cmp = icmp sgt i32 %depth, 1, !dbg !300
  br i1 %cmp, label %cond.end, label %cond.false, !dbg !300

cond.false:                                       ; preds = %entry
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 400, i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @__PRETTY_FUNCTION__.set_matrix, i64 0, i64 0)) #23, !dbg !300
  unreachable, !dbg !300

cond.end:                                         ; preds = %entry
  %shl = shl nuw i32 1, %depth, !dbg !301
  %cmp1 = icmp sgt i32 %shl, %r, !dbg !301
  br i1 %cmp1, label %cond.end4, label %cond.false3, !dbg !301

cond.false3:                                      ; preds = %cond.end
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 401, i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @__PRETTY_FUNCTION__.set_matrix, i64 0, i64 0)) #23, !dbg !301
  unreachable, !dbg !301

cond.end4:                                        ; preds = %cond.end
  %cmp6 = icmp sgt i32 %shl, %c, !dbg !302
  br i1 %cmp6, label %cond.end9, label %cond.false8, !dbg !302

cond.false8:                                      ; preds = %cond.end4
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 402, i8* noundef getelementptr inbounds ([47 x i8], [47 x i8]* @__PRETTY_FUNCTION__.set_matrix, i64 0, i64 0)) #23, !dbg !302
  unreachable, !dbg !302

cond.end9:                                        ; preds = %cond.end4
  %cmp10 = icmp eq i32 %depth, 2, !dbg !303
  %cmp11 = icmp eq %struct.InternalNode* %a, null, !dbg !304
  br i1 %cmp10, label %if.then, label %if.else16, !dbg !305

if.then:                                          ; preds = %cond.end9
  br i1 %cmp11, label %if.then12, label %if.end, !dbg !306

if.then12:                                        ; preds = %if.then
  %calloc = call dereferenceable_or_null(128) i8* @calloc(i64 1, i64 128), !dbg !307
  call void @llvm.dbg.value(metadata i8* %calloc, metadata !157, metadata !DIExpression()) #22, !dbg !311
  %cmp.i = icmp eq i8* %calloc, null, !dbg !312
  br i1 %cmp.i, label %if.then.i, label %new_block_leaf.exit, !dbg !313

if.then.i:                                        ; preds = %if.then12
  %puts.i = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str.47, i64 0, i64 0)) #22, !dbg !314
  tail call void @exit(i32 noundef 1) #23, !dbg !315
  unreachable, !dbg !315

new_block_leaf.exit:                              ; preds = %if.then12
  %0 = bitcast i8* %calloc to %struct.InternalNode*, !dbg !316
  call void @llvm.dbg.value(metadata %struct.InternalNode* %0, metadata !157, metadata !DIExpression()) #22, !dbg !311
  call void @llvm.dbg.value(metadata %struct.InternalNode* %0, metadata !290, metadata !DIExpression()), !dbg !299
  call void @llvm.dbg.value(metadata %struct.InternalNode* %0, metadata !294, metadata !DIExpression()), !dbg !317
  call void @llvm.dbg.value(metadata i32 0, metadata !318, metadata !DIExpression()) #22, !dbg !327
  call void @llvm.dbg.value(metadata i8* %calloc, metadata !325, metadata !DIExpression()) #22, !dbg !327
  call void @llvm.dbg.value(metadata i32 undef, metadata !318, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #22, !dbg !327
  call void @llvm.dbg.value(metadata i32 undef, metadata !326, metadata !DIExpression()) #22, !dbg !327
  call void @llvm.dbg.value(metadata i32 undef, metadata !326, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !327
  call void @llvm.dbg.value(metadata i32 undef, metadata !318, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #22, !dbg !327
  br label %if.end, !dbg !329

if.end:                                           ; preds = %new_block_leaf.exit, %if.then
  %a.addr.0 = phi %struct.InternalNode* [ %0, %new_block_leaf.exit ], [ %a, %if.then ]
  %A.0 = bitcast %struct.InternalNode* %a.addr.0 to %struct.LeafNode*, !dbg !330
  call void @llvm.dbg.value(metadata %struct.LeafNode* %A.0, metadata !294, metadata !DIExpression()), !dbg !317
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.addr.0, metadata !290, metadata !DIExpression()), !dbg !299
  %idxprom = sext i32 %r to i64, !dbg !331
  %idxprom14 = sext i32 %c to i64, !dbg !331
  %arrayidx15 = getelementptr inbounds %struct.LeafNode, %struct.LeafNode* %A.0, i64 0, i32 0, i64 %idxprom, i64 %idxprom14, !dbg !331
  store double %value, double* %arrayidx15, align 8, !dbg !332, !tbaa !88
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.addr.0, metadata !290, metadata !DIExpression()), !dbg !299
  br label %common.ret

if.else16:                                        ; preds = %cond.end9
  br i1 %cmp11, label %if.then18, label %if.end20, !dbg !333

if.then18:                                        ; preds = %if.else16
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !190, metadata !DIExpression()) #22, !dbg !334
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !195, metadata !DIExpression()) #22, !dbg !334
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !196, metadata !DIExpression()) #22, !dbg !334
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !197, metadata !DIExpression()) #22, !dbg !334
  %call.i104 = tail call noalias dereferenceable_or_null(32) i8* @malloc(i64 noundef 32) #22, !dbg !337
  call void @llvm.dbg.value(metadata i8* %call.i104, metadata !198, metadata !DIExpression()) #22, !dbg !334
  %cmp.i105 = icmp eq i8* %call.i104, null, !dbg !338
  br i1 %cmp.i105, label %if.then.i107, label %new_internal.exit, !dbg !339

if.then.i107:                                     ; preds = %if.then18
  %puts.i106 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str.47, i64 0, i64 0)) #22, !dbg !340
  tail call void @exit(i32 noundef 1) #23, !dbg !341
  unreachable, !dbg !341

new_internal.exit:                                ; preds = %if.then18
  %1 = bitcast i8* %call.i104 to %struct.InternalNode*, !dbg !342
  call void @llvm.dbg.value(metadata %struct.InternalNode* %1, metadata !198, metadata !DIExpression()) #22, !dbg !334
  call void @llvm.dbg.value(metadata i8* %call.i104, metadata !290, metadata !DIExpression()), !dbg !299
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(32) %call.i104, i8 0, i64 32, i1 false), !dbg !343
  br label %if.end20, !dbg !344

if.end20:                                         ; preds = %new_internal.exit, %if.else16
  %a.addr.1 = phi %struct.InternalNode* [ %1, %new_internal.exit ], [ %a, %if.else16 ]
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.addr.1, metadata !290, metadata !DIExpression()), !dbg !299
  %dec = add nsw i32 %depth, -1, !dbg !345
  call void @llvm.dbg.value(metadata i32 %dec, metadata !289, metadata !DIExpression()), !dbg !299
  %shl21 = shl nuw i32 1, %dec, !dbg !346
  call void @llvm.dbg.value(metadata i32 %shl21, metadata !297, metadata !DIExpression()), !dbg !347
  %cmp22 = icmp sgt i32 %shl21, %r, !dbg !348
  %cmp24 = icmp sgt i32 %shl21, %c, !dbg !350
  br i1 %cmp22, label %if.then23, label %if.else37, !dbg !351

if.then23:                                        ; preds = %if.end20
  br i1 %cmp24, label %if.then25, label %if.else30, !dbg !352

common.ret:                                       ; preds = %if.else46, %if.then39, %if.else30, %if.then25, %if.end
  %common.ret.op = phi %struct.InternalNode* [ %a.addr.1, %if.then25 ], [ %a.addr.1, %if.else30 ], [ %a.addr.1, %if.then39 ], [ %a.addr.1, %if.else46 ], [ %a.addr.0, %if.end ]
  ret %struct.InternalNode* %common.ret.op, !dbg !354

if.then25:                                        ; preds = %if.then23
  %arrayidx26 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.addr.1, i64 0, i32 0, i64 0, !dbg !355
  %2 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx26, align 8, !dbg !355, !tbaa !170
  %call27 = tail call %struct.InternalNode* @set_matrix(i32 noundef %dec, %struct.InternalNode* noundef %2, i32 noundef %r, i32 noundef %c, double noundef %value), !dbg !357
  store %struct.InternalNode* %call27, %struct.InternalNode** %arrayidx26, align 8, !dbg !358, !tbaa !170
  br label %common.ret

if.else30:                                        ; preds = %if.then23
  %arrayidx32 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.addr.1, i64 0, i32 0, i64 1, !dbg !359
  %3 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx32, align 8, !dbg !359, !tbaa !170
  %sub = sub nsw i32 %c, %shl21, !dbg !360
  %call33 = tail call %struct.InternalNode* @set_matrix(i32 noundef %dec, %struct.InternalNode* noundef %3, i32 noundef %r, i32 noundef %sub, double noundef %value), !dbg !361
  store %struct.InternalNode* %call33, %struct.InternalNode** %arrayidx32, align 8, !dbg !362, !tbaa !170
  br label %common.ret

if.else37:                                        ; preds = %if.end20
  br i1 %cmp24, label %if.then39, label %if.else46, !dbg !363

if.then39:                                        ; preds = %if.else37
  %arrayidx41 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.addr.1, i64 0, i32 0, i64 2, !dbg !365
  %4 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx41, align 8, !dbg !365, !tbaa !170
  %sub42 = sub nsw i32 %r, %shl21, !dbg !367
  %call43 = tail call %struct.InternalNode* @set_matrix(i32 noundef %dec, %struct.InternalNode* noundef %4, i32 noundef %sub42, i32 noundef %c, double noundef %value), !dbg !368
  store %struct.InternalNode* %call43, %struct.InternalNode** %arrayidx41, align 8, !dbg !369, !tbaa !170
  br label %common.ret

if.else46:                                        ; preds = %if.else37
  %arrayidx48 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.addr.1, i64 0, i32 0, i64 3, !dbg !370
  %5 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx48, align 8, !dbg !370, !tbaa !170
  %sub49 = sub nsw i32 %r, %shl21, !dbg !371
  %sub50 = sub nsw i32 %c, %shl21, !dbg !372
  %call51 = tail call %struct.InternalNode* @set_matrix(i32 noundef %dec, %struct.InternalNode* noundef %5, i32 noundef %sub49, i32 noundef %sub50, double noundef %value), !dbg !373
  store %struct.InternalNode* %call51, %struct.InternalNode** %arrayidx48, align 8, !dbg !374, !tbaa !170
  br label %common.ret
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @print_matrix_aux(i32 noundef %depth, %struct.InternalNode* noundef readonly %a, i32 noundef %r, i32 noundef %c) local_unnamed_addr #12 !dbg !375 {
entry:
  call void @llvm.dbg.value(metadata i32 %depth, metadata !379, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !380, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i32 %r, metadata !381, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i32 %c, metadata !382, metadata !DIExpression()), !dbg !390
  %cmp61 = icmp eq %struct.InternalNode* %a, null, !dbg !391
  br i1 %cmp61, label %if.end24, label %if.end, !dbg !393

if.end:                                           ; preds = %if.else, %entry
  %c.tr65 = phi i32 [ %add16, %if.else ], [ %c, %entry ]
  %r.tr64 = phi i32 [ %add19, %if.else ], [ %r, %entry ]
  %a.tr63 = phi %struct.InternalNode* [ %40, %if.else ], [ %a, %entry ]
  %depth.tr62 = phi i32 [ %dec, %if.else ], [ %depth, %entry ]
  call void @llvm.dbg.value(metadata i32 %c.tr65, metadata !382, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i32 %r.tr64, metadata !381, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr63, metadata !380, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i32 %depth.tr62, metadata !379, metadata !DIExpression()), !dbg !390
  %cmp1 = icmp eq i32 %depth.tr62, 2, !dbg !394
  br i1 %cmp1, label %for.cond.preheader, label %if.else, !dbg !395

for.cond.preheader:                               ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 0, metadata !386, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 0, metadata !386, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 0, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9 = bitcast %struct.InternalNode* %a.tr63 to double*, !dbg !397
  %0 = load double, double* %arrayidx9, align 8, !dbg !397, !tbaa !88
  %call = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %r.tr64, i32 noundef %c.tr65, double noundef %0), !dbg !402
  call void @llvm.dbg.value(metadata i64 1, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 1, metadata !387, metadata !DIExpression()), !dbg !396
  %1 = add i32 %c.tr65, 1, !dbg !403
  %arrayidx9.1 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 0, i32 0, i64 1, !dbg !397
  %2 = bitcast %struct.InternalNode** %arrayidx9.1 to double*, !dbg !397
  %3 = load double, double* %2, align 8, !dbg !397, !tbaa !88
  %call.1 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %r.tr64, i32 noundef %1, double noundef %3), !dbg !402
  call void @llvm.dbg.value(metadata i64 2, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 2, metadata !387, metadata !DIExpression()), !dbg !396
  %4 = add i32 %c.tr65, 2, !dbg !403
  %arrayidx9.2 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 0, i32 0, i64 2, !dbg !397
  %5 = bitcast %struct.InternalNode** %arrayidx9.2 to double*, !dbg !397
  %6 = load double, double* %5, align 8, !dbg !397, !tbaa !88
  %call.2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %r.tr64, i32 noundef %4, double noundef %6), !dbg !402
  call void @llvm.dbg.value(metadata i64 3, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 3, metadata !387, metadata !DIExpression()), !dbg !396
  %7 = add i32 %c.tr65, 3, !dbg !403
  %arrayidx9.3 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 0, i32 0, i64 3, !dbg !397
  %8 = bitcast %struct.InternalNode** %arrayidx9.3 to double*, !dbg !397
  %9 = load double, double* %8, align 8, !dbg !397, !tbaa !88
  %call.3 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %r.tr64, i32 noundef %7, double noundef %9), !dbg !402
  call void @llvm.dbg.value(metadata i64 4, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 1, metadata !386, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 1, metadata !386, metadata !DIExpression()), !dbg !396
  %10 = add i32 %r.tr64, 1
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 0, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.176 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 1, !dbg !397
  %11 = bitcast %struct.InternalNode* %arrayidx9.176 to double*, !dbg !397
  %12 = load double, double* %11, align 8, !dbg !397, !tbaa !88
  %call.177 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %10, i32 noundef %c.tr65, double noundef %12), !dbg !402
  call void @llvm.dbg.value(metadata i64 1, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 1, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.1.1 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 1, i32 0, i64 1, !dbg !397
  %13 = bitcast %struct.InternalNode** %arrayidx9.1.1 to double*, !dbg !397
  %14 = load double, double* %13, align 8, !dbg !397, !tbaa !88
  %call.1.1 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %10, i32 noundef %1, double noundef %14), !dbg !402
  call void @llvm.dbg.value(metadata i64 2, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 2, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.2.1 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 1, i32 0, i64 2, !dbg !397
  %15 = bitcast %struct.InternalNode** %arrayidx9.2.1 to double*, !dbg !397
  %16 = load double, double* %15, align 8, !dbg !397, !tbaa !88
  %call.2.1 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %10, i32 noundef %4, double noundef %16), !dbg !402
  call void @llvm.dbg.value(metadata i64 3, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 3, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.3.1 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 1, i32 0, i64 3, !dbg !397
  %17 = bitcast %struct.InternalNode** %arrayidx9.3.1 to double*, !dbg !397
  %18 = load double, double* %17, align 8, !dbg !397, !tbaa !88
  %call.3.1 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %10, i32 noundef %7, double noundef %18), !dbg !402
  call void @llvm.dbg.value(metadata i64 4, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 2, metadata !386, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 2, metadata !386, metadata !DIExpression()), !dbg !396
  %19 = add i32 %r.tr64, 2
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 0, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.278 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 2, !dbg !397
  %20 = bitcast %struct.InternalNode* %arrayidx9.278 to double*, !dbg !397
  %21 = load double, double* %20, align 8, !dbg !397, !tbaa !88
  %call.279 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %19, i32 noundef %c.tr65, double noundef %21), !dbg !402
  call void @llvm.dbg.value(metadata i64 1, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 1, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.1.2 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 2, i32 0, i64 1, !dbg !397
  %22 = bitcast %struct.InternalNode** %arrayidx9.1.2 to double*, !dbg !397
  %23 = load double, double* %22, align 8, !dbg !397, !tbaa !88
  %call.1.2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %19, i32 noundef %1, double noundef %23), !dbg !402
  call void @llvm.dbg.value(metadata i64 2, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 2, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.2.2 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 2, i32 0, i64 2, !dbg !397
  %24 = bitcast %struct.InternalNode** %arrayidx9.2.2 to double*, !dbg !397
  %25 = load double, double* %24, align 8, !dbg !397, !tbaa !88
  %call.2.2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %19, i32 noundef %4, double noundef %25), !dbg !402
  call void @llvm.dbg.value(metadata i64 3, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 3, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.3.2 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 2, i32 0, i64 3, !dbg !397
  %26 = bitcast %struct.InternalNode** %arrayidx9.3.2 to double*, !dbg !397
  %27 = load double, double* %26, align 8, !dbg !397, !tbaa !88
  %call.3.2 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %19, i32 noundef %7, double noundef %27), !dbg !402
  call void @llvm.dbg.value(metadata i64 4, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 3, metadata !386, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 3, metadata !386, metadata !DIExpression()), !dbg !396
  %28 = add i32 %r.tr64, 3
  call void @llvm.dbg.value(metadata i32 0, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 0, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.380 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 3, !dbg !397
  %29 = bitcast %struct.InternalNode* %arrayidx9.380 to double*, !dbg !397
  %30 = load double, double* %29, align 8, !dbg !397, !tbaa !88
  %call.381 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %28, i32 noundef %c.tr65, double noundef %30), !dbg !402
  call void @llvm.dbg.value(metadata i64 1, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 1, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.1.3 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 3, i32 0, i64 1, !dbg !397
  %31 = bitcast %struct.InternalNode** %arrayidx9.1.3 to double*, !dbg !397
  %32 = load double, double* %31, align 8, !dbg !397, !tbaa !88
  %call.1.3 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %28, i32 noundef %1, double noundef %32), !dbg !402
  call void @llvm.dbg.value(metadata i64 2, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 2, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.2.3 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 3, i32 0, i64 2, !dbg !397
  %33 = bitcast %struct.InternalNode** %arrayidx9.2.3 to double*, !dbg !397
  %34 = load double, double* %33, align 8, !dbg !397, !tbaa !88
  %call.2.3 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %28, i32 noundef %4, double noundef %34), !dbg !402
  call void @llvm.dbg.value(metadata i64 3, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 3, metadata !387, metadata !DIExpression()), !dbg !396
  %arrayidx9.3.3 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 3, i32 0, i64 3, !dbg !397
  %35 = bitcast %struct.InternalNode** %arrayidx9.3.3 to double*, !dbg !397
  %36 = load double, double* %35, align 8, !dbg !397, !tbaa !88
  %call.3.3 = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0), i32 noundef %28, i32 noundef %7, double noundef %36), !dbg !402
  call void @llvm.dbg.value(metadata i64 4, metadata !387, metadata !DIExpression()), !dbg !396
  call void @llvm.dbg.value(metadata i64 4, metadata !386, metadata !DIExpression()), !dbg !396
  br label %if.end24, !dbg !404

if.else:                                          ; preds = %if.end
  %dec = add nsw i32 %depth.tr62, -1, !dbg !405
  call void @llvm.dbg.value(metadata i32 %dec, metadata !379, metadata !DIExpression()), !dbg !390
  %shl = shl nuw i32 1, %dec, !dbg !406
  call void @llvm.dbg.value(metadata i32 %shl, metadata !388, metadata !DIExpression()), !dbg !407
  %arrayidx13 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 0, i32 0, i64 0, !dbg !408
  %37 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx13, align 8, !dbg !408, !tbaa !170
  tail call void @print_matrix_aux(i32 noundef %dec, %struct.InternalNode* noundef %37, i32 noundef %r.tr64, i32 noundef %c.tr65), !dbg !409
  %arrayidx15 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 0, i32 0, i64 1, !dbg !410
  %38 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx15, align 8, !dbg !410, !tbaa !170
  %add16 = add nsw i32 %c.tr65, %shl, !dbg !411
  tail call void @print_matrix_aux(i32 noundef %dec, %struct.InternalNode* noundef %38, i32 noundef %r.tr64, i32 noundef %add16), !dbg !412
  %arrayidx18 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 0, i32 0, i64 2, !dbg !413
  %39 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx18, align 8, !dbg !413, !tbaa !170
  %add19 = add nsw i32 %shl, %r.tr64, !dbg !414
  tail call void @print_matrix_aux(i32 noundef %dec, %struct.InternalNode* noundef %39, i32 noundef %add19, i32 noundef %c.tr65), !dbg !415
  %arrayidx21 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr63, i64 0, i32 0, i64 3, !dbg !416
  %40 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx21, align 8, !dbg !416, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %40, metadata !380, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i32 %add19, metadata !381, metadata !DIExpression()), !dbg !390
  call void @llvm.dbg.value(metadata i32 %add16, metadata !382, metadata !DIExpression()), !dbg !390
  %cmp = icmp eq %struct.InternalNode* %40, null, !dbg !391
  br i1 %cmp, label %if.end24, label %if.end, !dbg !393

if.end24:                                         ; preds = %if.else, %for.cond.preheader, %entry
  ret void, !dbg !404
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @printf(i8* nocapture noundef readonly, ...) local_unnamed_addr #13

; Function Attrs: nofree nounwind uwtable
define dso_local void @print_matrix(i32 noundef %depth, %struct.InternalNode* noundef %a) local_unnamed_addr #12 !dbg !417 {
entry:
  call void @llvm.dbg.value(metadata i32 %depth, metadata !419, metadata !DIExpression()), !dbg !421
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !420, metadata !DIExpression()), !dbg !421
  tail call void @print_matrix_aux(i32 noundef %depth, %struct.InternalNode* noundef %a, i32 noundef 0, i32 noundef 0), !dbg !422
  ret void, !dbg !423
}

; Function Attrs: nofree nosync nounwind readonly uwtable
define dso_local i32 @num_blocks(i32 noundef %depth, %struct.InternalNode* noundef readonly %a) local_unnamed_addr #14 !dbg !424 {
entry:
  call void @llvm.dbg.value(metadata i32 %depth, metadata !428, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !429, metadata !DIExpression()), !dbg !431
  %cmp30 = icmp eq %struct.InternalNode* %a, null, !dbg !432
  br i1 %cmp30, label %cleanup, label %if.end, !dbg !434

if.end:                                           ; preds = %if.end3, %entry
  %a.tr33 = phi %struct.InternalNode* [ %3, %if.end3 ], [ %a, %entry ]
  %depth.tr32 = phi i32 [ %dec, %if.end3 ], [ %depth, %entry ]
  %accumulator.tr31 = phi i32 [ %add15, %if.end3 ], [ 0, %entry ]
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr33, metadata !429, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.value(metadata i32 %depth.tr32, metadata !428, metadata !DIExpression()), !dbg !431
  %cmp1 = icmp eq i32 %depth.tr32, 2, !dbg !435
  br i1 %cmp1, label %cleanup.loopexit, label %if.end3, !dbg !437

if.end3:                                          ; preds = %if.end
  %dec = add nsw i32 %depth.tr32, -1, !dbg !438
  call void @llvm.dbg.value(metadata i32 %dec, metadata !428, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.value(metadata i32 0, metadata !430, metadata !DIExpression()), !dbg !431
  %arrayidx = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr33, i64 0, i32 0, i64 0, !dbg !439
  %0 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx, align 8, !dbg !439, !tbaa !170
  %call = tail call i32 @num_blocks(i32 noundef %dec, %struct.InternalNode* noundef %0), !dbg !440
  call void @llvm.dbg.value(metadata i32 %call, metadata !430, metadata !DIExpression()), !dbg !431
  %arrayidx5 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr33, i64 0, i32 0, i64 1, !dbg !441
  %1 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx5, align 8, !dbg !441, !tbaa !170
  %call6 = tail call i32 @num_blocks(i32 noundef %dec, %struct.InternalNode* noundef %1), !dbg !442
  call void @llvm.dbg.value(metadata i32 undef, metadata !430, metadata !DIExpression()), !dbg !431
  %arrayidx9 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr33, i64 0, i32 0, i64 2, !dbg !443
  %2 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx9, align 8, !dbg !443, !tbaa !170
  %call10 = tail call i32 @num_blocks(i32 noundef %dec, %struct.InternalNode* noundef %2), !dbg !444
  %arrayidx13 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr33, i64 0, i32 0, i64 3, !dbg !445
  %3 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx13, align 8, !dbg !445, !tbaa !170
  %add7 = add i32 %call, %accumulator.tr31, !dbg !446
  %add11 = add i32 %add7, %call6, !dbg !447
  %add15 = add i32 %add11, %call10, !dbg !448
  call void @llvm.dbg.value(metadata i32 %add15, metadata !430, metadata !DIExpression()), !dbg !431
  call void @llvm.dbg.value(metadata %struct.InternalNode* %3, metadata !429, metadata !DIExpression()), !dbg !431
  %cmp = icmp eq %struct.InternalNode* %3, null, !dbg !432
  br i1 %cmp, label %cleanup.loopexit, label %if.end, !dbg !434

cleanup.loopexit:                                 ; preds = %if.end3, %if.end
  %accumulator.tr.lcssa.ph = phi i32 [ %add15, %if.end3 ], [ %accumulator.tr31, %if.end ]
  %retval.0.ph = phi i32 [ 0, %if.end3 ], [ 1, %if.end ]
  %4 = add nsw i32 %retval.0.ph, %accumulator.tr.lcssa.ph, !dbg !448
  br label %cleanup, !dbg !448

cleanup:                                          ; preds = %cleanup.loopexit, %entry
  %accumulator.ret.tr = phi i32 [ %4, %cleanup.loopexit ], [ 0, %entry ], !dbg !448
  ret i32 %accumulator.ret.tr, !dbg !449
}

; Function Attrs: nofree nosync nounwind readonly uwtable
define dso_local i32 @num_nonzeros(i32 noundef %depth, %struct.InternalNode* noundef readonly %a) local_unnamed_addr #14 !dbg !450 {
entry:
  call void @llvm.dbg.value(metadata i32 %depth, metadata !452, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !453, metadata !DIExpression()), !dbg !460
  %cmp58 = icmp eq %struct.InternalNode* %a, null, !dbg !461
  br i1 %cmp58, label %cleanup, label %if.end, !dbg !463

if.end:                                           ; preds = %if.end16, %entry
  %a.tr61 = phi %struct.InternalNode* [ %9, %if.end16 ], [ %a, %entry ]
  %depth.tr60 = phi i32 [ %dec, %if.end16 ], [ %depth, %entry ]
  %accumulator.tr59 = phi i32 [ %add29, %if.end16 ], [ 0, %entry ]
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr61, metadata !453, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 %depth.tr60, metadata !452, metadata !DIExpression()), !dbg !460
  %cmp1 = icmp eq i32 %depth.tr60, 2, !dbg !464
  br i1 %cmp1, label %for.cond.preheader, label %if.end16, !dbg !465

for.cond.preheader:                               ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 0, metadata !458, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 0, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 0, metadata !458, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 0, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 0, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 0, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 0, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 0, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 1, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 1, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  %0 = bitcast %struct.InternalNode* %a.tr61 to <16 x double>*, !dbg !467
  %1 = load <16 x double>, <16 x double>* %0, align 8, !dbg !467, !tbaa !88
  %2 = fcmp une <16 x double> %1, zeroinitializer, !dbg !475
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 2, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 2, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 3, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 3, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 4, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 1, metadata !458, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 1, metadata !458, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 0, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 0, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 1, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 1, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 2, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 2, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 3, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 3, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 4, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 2, metadata !458, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 2, metadata !458, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 0, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 0, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 1, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 1, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 2, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 2, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 3, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 3, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 4, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 3, metadata !458, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 3, metadata !458, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 0, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 0, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 1, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 1, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 2, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 2, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 3, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 3, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  %3 = bitcast <16 x i1> %2 to i16, !dbg !476
  %4 = call i16 @llvm.ctpop.i16(i16 %3), !dbg !476, !range !477
  %5 = zext i16 %4 to i32, !dbg !476
  call void @llvm.dbg.value(metadata i32 %5, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i64 4, metadata !459, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i64 4, metadata !458, metadata !DIExpression()), !dbg !466
  call void @llvm.dbg.value(metadata i32 %5, metadata !454, metadata !DIExpression()), !dbg !460
  br label %cleanup, !dbg !478

if.end16:                                         ; preds = %if.end
  %dec = add nsw i32 %depth.tr60, -1, !dbg !479
  call void @llvm.dbg.value(metadata i32 %dec, metadata !452, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata i32 0, metadata !454, metadata !DIExpression()), !dbg !460
  %arrayidx17 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr61, i64 0, i32 0, i64 0, !dbg !480
  %6 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx17, align 8, !dbg !480, !tbaa !170
  %call = tail call i32 @num_nonzeros(i32 noundef %dec, %struct.InternalNode* noundef %6), !dbg !481
  call void @llvm.dbg.value(metadata i32 %call, metadata !454, metadata !DIExpression()), !dbg !460
  %arrayidx19 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr61, i64 0, i32 0, i64 1, !dbg !482
  %7 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx19, align 8, !dbg !482, !tbaa !170
  %call20 = tail call i32 @num_nonzeros(i32 noundef %dec, %struct.InternalNode* noundef %7), !dbg !483
  call void @llvm.dbg.value(metadata i32 undef, metadata !454, metadata !DIExpression()), !dbg !460
  %arrayidx23 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr61, i64 0, i32 0, i64 2, !dbg !484
  %8 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx23, align 8, !dbg !484, !tbaa !170
  %call24 = tail call i32 @num_nonzeros(i32 noundef %dec, %struct.InternalNode* noundef %8), !dbg !485
  %arrayidx27 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr61, i64 0, i32 0, i64 3, !dbg !486
  %9 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx27, align 8, !dbg !486, !tbaa !170
  %add21 = add i32 %call, %accumulator.tr59, !dbg !487
  %add25 = add i32 %add21, %call20, !dbg !488
  %add29 = add i32 %add25, %call24, !dbg !478
  call void @llvm.dbg.value(metadata i32 %add29, metadata !454, metadata !DIExpression()), !dbg !460
  call void @llvm.dbg.value(metadata %struct.InternalNode* %9, metadata !453, metadata !DIExpression()), !dbg !460
  %cmp = icmp eq %struct.InternalNode* %9, null, !dbg !461
  br i1 %cmp, label %cleanup, label %if.end, !dbg !463

cleanup:                                          ; preds = %if.end16, %for.cond.preheader, %entry
  %accumulator.tr57 = phi i32 [ 0, %entry ], [ %accumulator.tr59, %for.cond.preheader ], [ %add29, %if.end16 ]
  %retval.0 = phi i32 [ 0, %entry ], [ %5, %for.cond.preheader ], [ 0, %if.end16 ], !dbg !460
  %accumulator.ret.tr = add nsw i32 %retval.0, %accumulator.tr57, !dbg !478
  ret i32 %accumulator.ret.tr, !dbg !489
}

; Function Attrs: nofree nosync nounwind readonly uwtable
define dso_local double @mag(i32 noundef %depth, %struct.InternalNode* noundef readonly %a) local_unnamed_addr #14 !dbg !490 {
entry:
  call void @llvm.dbg.value(metadata i32 %depth, metadata !494, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !495, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !496, metadata !DIExpression()), !dbg !502
  %tobool.not = icmp eq %struct.InternalNode* %a, null, !dbg !503
  br i1 %tobool.not, label %common.ret, label %if.end, !dbg !505

if.end:                                           ; preds = %entry
  %cmp = icmp eq i32 %depth, 2, !dbg !506
  br i1 %cmp, label %for.cond.preheader, label %if.else, !dbg !507

for.cond.preheader:                               ; preds = %if.end
  call void @llvm.dbg.value(metadata i32 0, metadata !500, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 0, metadata !500, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i32 0, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 0, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7 = bitcast %struct.InternalNode* %a to double*, !dbg !509
  %0 = load double, double* %arrayidx7, align 8, !dbg !509, !tbaa !88
  %1 = tail call double @llvm.fmuladd.f64(double %0, double %0, double 0.000000e+00), !dbg !514
  call void @llvm.dbg.value(metadata double %1, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 1, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 1, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %1, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.1 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 1, !dbg !509
  %2 = bitcast %struct.InternalNode** %arrayidx7.1 to double*, !dbg !509
  %3 = load double, double* %2, align 8, !dbg !509, !tbaa !88
  %4 = tail call double @llvm.fmuladd.f64(double %3, double %3, double %1), !dbg !514
  call void @llvm.dbg.value(metadata double %4, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 2, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 2, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %4, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.2 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 2, !dbg !509
  %5 = bitcast %struct.InternalNode** %arrayidx7.2 to double*, !dbg !509
  %6 = load double, double* %5, align 8, !dbg !509, !tbaa !88
  %7 = tail call double @llvm.fmuladd.f64(double %6, double %6, double %4), !dbg !514
  call void @llvm.dbg.value(metadata double %7, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 3, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 3, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %7, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.3 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 3, !dbg !509
  %8 = bitcast %struct.InternalNode** %arrayidx7.3 to double*, !dbg !509
  %9 = load double, double* %8, align 8, !dbg !509, !tbaa !88
  %10 = tail call double @llvm.fmuladd.f64(double %9, double %9, double %7), !dbg !514
  call void @llvm.dbg.value(metadata double %10, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 4, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 1, metadata !500, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %10, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 1, metadata !500, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %10, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i32 0, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %10, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 0, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %10, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.163 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 1, !dbg !509
  %11 = bitcast %struct.InternalNode* %arrayidx7.163 to double*, !dbg !509
  %12 = load double, double* %11, align 8, !dbg !509, !tbaa !88
  %13 = tail call double @llvm.fmuladd.f64(double %12, double %12, double %10), !dbg !514
  call void @llvm.dbg.value(metadata double %13, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 1, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 1, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %13, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.1.1 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 1, i32 0, i64 1, !dbg !509
  %14 = bitcast %struct.InternalNode** %arrayidx7.1.1 to double*, !dbg !509
  %15 = load double, double* %14, align 8, !dbg !509, !tbaa !88
  %16 = tail call double @llvm.fmuladd.f64(double %15, double %15, double %13), !dbg !514
  call void @llvm.dbg.value(metadata double %16, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 2, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 2, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %16, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.2.1 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 1, i32 0, i64 2, !dbg !509
  %17 = bitcast %struct.InternalNode** %arrayidx7.2.1 to double*, !dbg !509
  %18 = load double, double* %17, align 8, !dbg !509, !tbaa !88
  %19 = tail call double @llvm.fmuladd.f64(double %18, double %18, double %16), !dbg !514
  call void @llvm.dbg.value(metadata double %19, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 3, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 3, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %19, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.3.1 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 1, i32 0, i64 3, !dbg !509
  %20 = bitcast %struct.InternalNode** %arrayidx7.3.1 to double*, !dbg !509
  %21 = load double, double* %20, align 8, !dbg !509, !tbaa !88
  %22 = tail call double @llvm.fmuladd.f64(double %21, double %21, double %19), !dbg !514
  call void @llvm.dbg.value(metadata double %22, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 4, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 2, metadata !500, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %22, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 2, metadata !500, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %22, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i32 0, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %22, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 0, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %22, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.264 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2, !dbg !509
  %23 = bitcast %struct.InternalNode* %arrayidx7.264 to double*, !dbg !509
  %24 = load double, double* %23, align 8, !dbg !509, !tbaa !88
  %25 = tail call double @llvm.fmuladd.f64(double %24, double %24, double %22), !dbg !514
  call void @llvm.dbg.value(metadata double %25, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 1, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 1, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %25, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.1.2 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2, i32 0, i64 1, !dbg !509
  %26 = bitcast %struct.InternalNode** %arrayidx7.1.2 to double*, !dbg !509
  %27 = load double, double* %26, align 8, !dbg !509, !tbaa !88
  %28 = tail call double @llvm.fmuladd.f64(double %27, double %27, double %25), !dbg !514
  call void @llvm.dbg.value(metadata double %28, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 2, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 2, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %28, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.2.2 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2, i32 0, i64 2, !dbg !509
  %29 = bitcast %struct.InternalNode** %arrayidx7.2.2 to double*, !dbg !509
  %30 = load double, double* %29, align 8, !dbg !509, !tbaa !88
  %31 = tail call double @llvm.fmuladd.f64(double %30, double %30, double %28), !dbg !514
  call void @llvm.dbg.value(metadata double %31, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 3, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 3, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %31, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.3.2 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2, i32 0, i64 3, !dbg !509
  %32 = bitcast %struct.InternalNode** %arrayidx7.3.2 to double*, !dbg !509
  %33 = load double, double* %32, align 8, !dbg !509, !tbaa !88
  %34 = tail call double @llvm.fmuladd.f64(double %33, double %33, double %31), !dbg !514
  call void @llvm.dbg.value(metadata double %34, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 4, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 3, metadata !500, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %34, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 3, metadata !500, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %34, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i32 0, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %34, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 0, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %34, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.365 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, !dbg !509
  %35 = bitcast %struct.InternalNode* %arrayidx7.365 to double*, !dbg !509
  %36 = load double, double* %35, align 8, !dbg !509, !tbaa !88
  %37 = tail call double @llvm.fmuladd.f64(double %36, double %36, double %34), !dbg !514
  call void @llvm.dbg.value(metadata double %37, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 1, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 1, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %37, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.1.3 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, i32 0, i64 1, !dbg !509
  %38 = bitcast %struct.InternalNode** %arrayidx7.1.3 to double*, !dbg !509
  %39 = load double, double* %38, align 8, !dbg !509, !tbaa !88
  %40 = tail call double @llvm.fmuladd.f64(double %39, double %39, double %37), !dbg !514
  call void @llvm.dbg.value(metadata double %40, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 2, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 2, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %40, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.2.3 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, i32 0, i64 2, !dbg !509
  %41 = bitcast %struct.InternalNode** %arrayidx7.2.3 to double*, !dbg !509
  %42 = load double, double* %41, align 8, !dbg !509, !tbaa !88
  %43 = tail call double @llvm.fmuladd.f64(double %42, double %42, double %40), !dbg !514
  call void @llvm.dbg.value(metadata double %43, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 3, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 3, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %43, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx7.3.3 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, i32 0, i64 3, !dbg !509
  %44 = bitcast %struct.InternalNode** %arrayidx7.3.3 to double*, !dbg !509
  %45 = load double, double* %44, align 8, !dbg !509, !tbaa !88
  %46 = tail call double @llvm.fmuladd.f64(double %45, double %45, double %43), !dbg !514
  call void @llvm.dbg.value(metadata double %46, metadata !496, metadata !DIExpression()), !dbg !502
  call void @llvm.dbg.value(metadata i64 4, metadata !501, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata i64 4, metadata !500, metadata !DIExpression()), !dbg !508
  call void @llvm.dbg.value(metadata double %46, metadata !496, metadata !DIExpression()), !dbg !502
  br label %common.ret, !dbg !515

common.ret:                                       ; preds = %if.else, %for.cond.preheader, %entry
  %common.ret.op = phi double [ %add28, %if.else ], [ 0.000000e+00, %entry ], [ %46, %for.cond.preheader ]
  ret double %common.ret.op, !dbg !515

if.else:                                          ; preds = %if.end
  %dec = add nsw i32 %depth, -1, !dbg !516
  call void @llvm.dbg.value(metadata i32 %dec, metadata !494, metadata !DIExpression()), !dbg !502
  %arrayidx16 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 0, !dbg !518
  %47 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx16, align 8, !dbg !518, !tbaa !170
  %call = tail call double @mag(i32 noundef %dec, %struct.InternalNode* noundef %47), !dbg !519
  %add = fadd double %call, 0.000000e+00, !dbg !520
  call void @llvm.dbg.value(metadata double %add, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx18 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 1, !dbg !521
  %48 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx18, align 8, !dbg !521, !tbaa !170
  %call19 = tail call double @mag(i32 noundef %dec, %struct.InternalNode* noundef %48), !dbg !522
  %add20 = fadd double %add, %call19, !dbg !523
  call void @llvm.dbg.value(metadata double %add20, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx22 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 2, !dbg !524
  %49 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx22, align 8, !dbg !524, !tbaa !170
  %call23 = tail call double @mag(i32 noundef %dec, %struct.InternalNode* noundef %49), !dbg !525
  %add24 = fadd double %add20, %call23, !dbg !526
  call void @llvm.dbg.value(metadata double %add24, metadata !496, metadata !DIExpression()), !dbg !502
  %arrayidx26 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 3, !dbg !527
  %50 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx26, align 8, !dbg !527, !tbaa !170
  %call27 = tail call double @mag(i32 noundef %dec, %struct.InternalNode* noundef %50), !dbg !528
  %add28 = fadd double %add24, %call27, !dbg !529
  call void @llvm.dbg.value(metadata double %add28, metadata !496, metadata !DIExpression()), !dbg !502
  br label %common.ret
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: nounwind uwtable
define dso_local %struct.InternalNode* @mul_and_subT(i32 noundef %depth, i32 noundef %lower, %struct.InternalNode* noundef readonly %a, %struct.InternalNode* noundef readonly %b, %struct.InternalNode* noundef %r) local_unnamed_addr #8 !dbg !530 {
entry:
  %r00 = alloca %struct.InternalNode*, align 8
  %r01 = alloca %struct.InternalNode*, align 8
  %r10 = alloca %struct.InternalNode*, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !548
  call void @llvm.dbg.value(metadata i32 %depth, metadata !534, metadata !DIExpression()), !dbg !551
  call void @llvm.dbg.value(metadata i32 %lower, metadata !535, metadata !DIExpression()), !dbg !551
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !536, metadata !DIExpression()), !dbg !551
  call void @llvm.dbg.value(metadata %struct.InternalNode* %b, metadata !537, metadata !DIExpression()), !dbg !551
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r, metadata !538, metadata !DIExpression()), !dbg !551
  %cmp = icmp ne %struct.InternalNode* %a, null, !dbg !552
  %cmp1 = icmp ne %struct.InternalNode* %b, null, !dbg !552
  %or.cond = and i1 %cmp, %cmp1, !dbg !552
  br i1 %or.cond, label %cond.end, label %cond.false, !dbg !552

cond.false:                                       ; preds = %entry
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([35 x i8], [35 x i8]* @.str.5, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 567, i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.mul_and_subT, i64 0, i64 0)) #23, !dbg !552
  unreachable, !dbg !552

cond.end:                                         ; preds = %entry
  %cmp2 = icmp eq i32 %depth, 2, !dbg !553
  br i1 %cmp2, label %if.then, label %if.end20, !dbg !554

if.then:                                          ; preds = %cond.end
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !539, metadata !DIExpression()), !dbg !555
  call void @llvm.dbg.value(metadata %struct.InternalNode* %b, metadata !542, metadata !DIExpression()), !dbg !555
  %cmp3 = icmp eq %struct.InternalNode* %r, null, !dbg !556
  br i1 %cmp3, label %if.then4, label %if.end, !dbg !558

if.then4:                                         ; preds = %if.then
  %calloc = call dereferenceable_or_null(128) i8* @calloc(i64 1, i64 128), !dbg !559
  call void @llvm.dbg.value(metadata i8* %calloc, metadata !157, metadata !DIExpression()) #22, !dbg !562
  %cmp.i = icmp eq i8* %calloc, null, !dbg !563
  br i1 %cmp.i, label %if.then.i, label %new_block_leaf.exit, !dbg !564

if.then.i:                                        ; preds = %if.then4
  %puts.i = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str.47, i64 0, i64 0)) #22, !dbg !565
  tail call void @exit(i32 noundef 1) #23, !dbg !566
  unreachable, !dbg !566

new_block_leaf.exit:                              ; preds = %if.then4
  %0 = bitcast i8* %calloc to %struct.InternalNode*, !dbg !567
  call void @llvm.dbg.value(metadata %struct.InternalNode* %0, metadata !157, metadata !DIExpression()) #22, !dbg !562
  call void @llvm.dbg.value(metadata %struct.InternalNode* %0, metadata !538, metadata !DIExpression()), !dbg !551
  call void @llvm.dbg.value(metadata %struct.InternalNode* %0, metadata !543, metadata !DIExpression()), !dbg !555
  call void @llvm.dbg.value(metadata i32 0, metadata !318, metadata !DIExpression()) #22, !dbg !568
  call void @llvm.dbg.value(metadata i8* %calloc, metadata !325, metadata !DIExpression()) #22, !dbg !568
  call void @llvm.dbg.value(metadata i32 undef, metadata !318, metadata !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #22, !dbg !568
  call void @llvm.dbg.value(metadata i32 undef, metadata !326, metadata !DIExpression()) #22, !dbg !568
  call void @llvm.dbg.value(metadata i32 undef, metadata !326, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !568
  call void @llvm.dbg.value(metadata i32 undef, metadata !318, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #22, !dbg !568
  br label %if.end, !dbg !570

if.end:                                           ; preds = %new_block_leaf.exit, %if.then
  %r.addr.0 = phi %struct.InternalNode* [ %0, %new_block_leaf.exit ], [ %r, %if.then ]
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r.addr.0, metadata !543, metadata !DIExpression()), !dbg !555
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r.addr.0, metadata !538, metadata !DIExpression()), !dbg !551
  %tobool.not = icmp eq i32 %lower, 0, !dbg !571
  br i1 %tobool.not, label %if.else12, label %if.then5, !dbg !573

if.then5:                                         ; preds = %if.end
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r.addr.0, metadata !574, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !579, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata %struct.InternalNode* %b, metadata !580, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i32 0, metadata !581, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !581, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i32 0, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.i = bitcast %struct.InternalNode* %a to double*, !dbg !586
  call void @llvm.dbg.value(metadata i64 0, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx16.i = bitcast %struct.InternalNode* %r.addr.0 to double*
  call void @llvm.dbg.value(metadata i32 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %1 = load double, double* %arrayidx8.i, align 8, !dbg !586, !tbaa !88
  %arrayidx12.i = bitcast %struct.InternalNode* %b to double*, !dbg !596
  %2 = load double, double* %arrayidx12.i, align 8, !dbg !596, !tbaa !88
  %3 = load double, double* %arrayidx16.i, align 8, !dbg !597, !tbaa !88
  %neg.i = fneg double %1, !dbg !597
  %4 = tail call double @llvm.fmuladd.f64(double %neg.i, double %2, double %3) #22, !dbg !597
  store double %4, double* %arrayidx16.i, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 1, !dbg !586
  %5 = bitcast %struct.InternalNode** %arrayidx8.1.i to double*, !dbg !586
  %6 = load double, double* %5, align 8, !dbg !586, !tbaa !88
  %arrayidx12.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 1, !dbg !596
  %7 = bitcast %struct.InternalNode** %arrayidx12.1.i to double*, !dbg !596
  %8 = load double, double* %7, align 8, !dbg !596, !tbaa !88
  %neg.1.i = fneg double %6, !dbg !597
  %9 = tail call double @llvm.fmuladd.f64(double %neg.1.i, double %8, double %4) #22, !dbg !597
  store double %9, double* %arrayidx16.i, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 2, !dbg !586
  %10 = bitcast %struct.InternalNode** %arrayidx8.2.i to double*, !dbg !586
  %11 = load double, double* %10, align 8, !dbg !586, !tbaa !88
  %arrayidx12.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 2, !dbg !596
  %12 = bitcast %struct.InternalNode** %arrayidx12.2.i to double*, !dbg !596
  %13 = load double, double* %12, align 8, !dbg !596, !tbaa !88
  %neg.2.i = fneg double %11, !dbg !597
  %14 = tail call double @llvm.fmuladd.f64(double %neg.2.i, double %13, double %9) #22, !dbg !597
  store double %14, double* %arrayidx16.i, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 3, !dbg !586
  %15 = bitcast %struct.InternalNode** %arrayidx8.3.i to double*, !dbg !586
  %16 = load double, double* %15, align 8, !dbg !586, !tbaa !88
  %arrayidx12.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 3, !dbg !596
  %17 = bitcast %struct.InternalNode** %arrayidx12.3.i to double*, !dbg !596
  %18 = load double, double* %17, align 8, !dbg !596, !tbaa !88
  %neg.3.i = fneg double %16, !dbg !597
  %19 = tail call double @llvm.fmuladd.f64(double %neg.3.i, double %18, double %14) #22, !dbg !597
  store double %19, double* %arrayidx16.i, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !582, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !581, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !581, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i32 0, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.151.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 1, !dbg !586
  %20 = bitcast %struct.InternalNode* %arrayidx8.151.i to double*, !dbg !586
  call void @llvm.dbg.value(metadata i64 0, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx16.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r.addr.0, i64 1
  %21 = bitcast %struct.InternalNode* %arrayidx16.1.i to double*
  call void @llvm.dbg.value(metadata i32 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %22 = load double, double* %20, align 8, !dbg !586, !tbaa !88
  %23 = load double, double* %arrayidx12.i, align 8, !dbg !596, !tbaa !88
  %24 = load double, double* %21, align 8, !dbg !597, !tbaa !88
  %neg.153.i = fneg double %22, !dbg !597
  %25 = tail call double @llvm.fmuladd.f64(double %neg.153.i, double %23, double %24) #22, !dbg !597
  store double %25, double* %21, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.1.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 1, i32 0, i64 1, !dbg !586
  %26 = bitcast %struct.InternalNode** %arrayidx8.1.1.i to double*, !dbg !586
  %27 = load double, double* %26, align 8, !dbg !586, !tbaa !88
  %28 = load double, double* %7, align 8, !dbg !596, !tbaa !88
  %neg.1.1.i = fneg double %27, !dbg !597
  %29 = tail call double @llvm.fmuladd.f64(double %neg.1.1.i, double %28, double %25) #22, !dbg !597
  store double %29, double* %21, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.2.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 1, i32 0, i64 2, !dbg !586
  %30 = bitcast %struct.InternalNode** %arrayidx8.2.1.i to double*, !dbg !586
  %31 = load double, double* %30, align 8, !dbg !586, !tbaa !88
  %32 = load double, double* %12, align 8, !dbg !596, !tbaa !88
  %neg.2.1.i = fneg double %31, !dbg !597
  %33 = tail call double @llvm.fmuladd.f64(double %neg.2.1.i, double %32, double %29) #22, !dbg !597
  store double %33, double* %21, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.3.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 1, i32 0, i64 3, !dbg !586
  %34 = bitcast %struct.InternalNode** %arrayidx8.3.1.i to double*, !dbg !586
  %35 = load double, double* %34, align 8, !dbg !586, !tbaa !88
  %36 = load double, double* %17, align 8, !dbg !596, !tbaa !88
  %neg.3.1.i = fneg double %35, !dbg !597
  %37 = tail call double @llvm.fmuladd.f64(double %neg.3.1.i, double %36, double %33) #22, !dbg !597
  store double %37, double* %21, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !582, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx16.1.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r.addr.0, i64 1, i32 0, i64 1
  %38 = bitcast %struct.InternalNode** %arrayidx16.1.1.i to double*
  call void @llvm.dbg.value(metadata i32 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %39 = load double, double* %20, align 8, !dbg !586, !tbaa !88
  %arrayidx12.152.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 1, !dbg !596
  %40 = bitcast %struct.InternalNode* %arrayidx12.152.1.i to double*, !dbg !596
  %41 = load double, double* %40, align 8, !dbg !596, !tbaa !88
  %42 = load double, double* %38, align 8, !dbg !597, !tbaa !88
  %neg.153.1.i = fneg double %39, !dbg !597
  %43 = tail call double @llvm.fmuladd.f64(double %neg.153.1.i, double %41, double %42) #22, !dbg !597
  store double %43, double* %38, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %44 = load double, double* %26, align 8, !dbg !586, !tbaa !88
  %arrayidx12.1.1.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 1, i32 0, i64 1, !dbg !596
  %45 = bitcast %struct.InternalNode** %arrayidx12.1.1.1.i to double*, !dbg !596
  %46 = load double, double* %45, align 8, !dbg !596, !tbaa !88
  %neg.1.1.1.i = fneg double %44, !dbg !597
  %47 = tail call double @llvm.fmuladd.f64(double %neg.1.1.1.i, double %46, double %43) #22, !dbg !597
  store double %47, double* %38, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %48 = load double, double* %30, align 8, !dbg !586, !tbaa !88
  %arrayidx12.2.1.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 1, i32 0, i64 2, !dbg !596
  %49 = bitcast %struct.InternalNode** %arrayidx12.2.1.1.i to double*, !dbg !596
  %50 = load double, double* %49, align 8, !dbg !596, !tbaa !88
  %neg.2.1.1.i = fneg double %48, !dbg !597
  %51 = tail call double @llvm.fmuladd.f64(double %neg.2.1.1.i, double %50, double %47) #22, !dbg !597
  store double %51, double* %38, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %52 = load double, double* %34, align 8, !dbg !586, !tbaa !88
  %arrayidx12.3.1.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 1, i32 0, i64 3, !dbg !596
  %53 = bitcast %struct.InternalNode** %arrayidx12.3.1.1.i to double*, !dbg !596
  %54 = load double, double* %53, align 8, !dbg !596, !tbaa !88
  %neg.3.1.1.i = fneg double %52, !dbg !597
  %55 = tail call double @llvm.fmuladd.f64(double %neg.3.1.1.i, double %54, double %51) #22, !dbg !597
  store double %55, double* %38, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !582, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !581, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !581, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i32 0, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.254.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2, !dbg !586
  %56 = bitcast %struct.InternalNode* %arrayidx8.254.i to double*, !dbg !586
  call void @llvm.dbg.value(metadata i64 0, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx16.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r.addr.0, i64 2
  %57 = bitcast %struct.InternalNode* %arrayidx16.2.i to double*
  call void @llvm.dbg.value(metadata i32 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %58 = load double, double* %56, align 8, !dbg !586, !tbaa !88
  %59 = load double, double* %arrayidx12.i, align 8, !dbg !596, !tbaa !88
  %60 = load double, double* %57, align 8, !dbg !597, !tbaa !88
  %neg.256.i = fneg double %58, !dbg !597
  %61 = tail call double @llvm.fmuladd.f64(double %neg.256.i, double %59, double %60) #22, !dbg !597
  store double %61, double* %57, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.1.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2, i32 0, i64 1, !dbg !586
  %62 = bitcast %struct.InternalNode** %arrayidx8.1.2.i to double*, !dbg !586
  %63 = load double, double* %62, align 8, !dbg !586, !tbaa !88
  %64 = load double, double* %7, align 8, !dbg !596, !tbaa !88
  %neg.1.2.i = fneg double %63, !dbg !597
  %65 = tail call double @llvm.fmuladd.f64(double %neg.1.2.i, double %64, double %61) #22, !dbg !597
  store double %65, double* %57, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.2.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2, i32 0, i64 2, !dbg !586
  %66 = bitcast %struct.InternalNode** %arrayidx8.2.2.i to double*, !dbg !586
  %67 = load double, double* %66, align 8, !dbg !586, !tbaa !88
  %68 = load double, double* %12, align 8, !dbg !596, !tbaa !88
  %neg.2.2.i = fneg double %67, !dbg !597
  %69 = tail call double @llvm.fmuladd.f64(double %neg.2.2.i, double %68, double %65) #22, !dbg !597
  store double %69, double* %57, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.3.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2, i32 0, i64 3, !dbg !586
  %70 = bitcast %struct.InternalNode** %arrayidx8.3.2.i to double*, !dbg !586
  %71 = load double, double* %70, align 8, !dbg !586, !tbaa !88
  %72 = load double, double* %17, align 8, !dbg !596, !tbaa !88
  %neg.3.2.i = fneg double %71, !dbg !597
  %73 = tail call double @llvm.fmuladd.f64(double %neg.3.2.i, double %72, double %69) #22, !dbg !597
  store double %73, double* %57, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !582, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx16.2.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r.addr.0, i64 2, i32 0, i64 1
  %74 = bitcast %struct.InternalNode** %arrayidx16.2.1.i to double*
  call void @llvm.dbg.value(metadata i32 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %75 = load double, double* %56, align 8, !dbg !586, !tbaa !88
  %76 = load double, double* %40, align 8, !dbg !596, !tbaa !88
  %77 = load double, double* %74, align 8, !dbg !597, !tbaa !88
  %neg.256.1.i = fneg double %75, !dbg !597
  %78 = tail call double @llvm.fmuladd.f64(double %neg.256.1.i, double %76, double %77) #22, !dbg !597
  store double %78, double* %74, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %79 = load double, double* %62, align 8, !dbg !586, !tbaa !88
  %80 = load double, double* %45, align 8, !dbg !596, !tbaa !88
  %neg.1.2.1.i = fneg double %79, !dbg !597
  %81 = tail call double @llvm.fmuladd.f64(double %neg.1.2.1.i, double %80, double %78) #22, !dbg !597
  store double %81, double* %74, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %82 = load double, double* %66, align 8, !dbg !586, !tbaa !88
  %83 = load double, double* %49, align 8, !dbg !596, !tbaa !88
  %neg.2.2.1.i = fneg double %82, !dbg !597
  %84 = tail call double @llvm.fmuladd.f64(double %neg.2.2.1.i, double %83, double %81) #22, !dbg !597
  store double %84, double* %74, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %85 = load double, double* %70, align 8, !dbg !586, !tbaa !88
  %86 = load double, double* %53, align 8, !dbg !596, !tbaa !88
  %neg.3.2.1.i = fneg double %85, !dbg !597
  %87 = tail call double @llvm.fmuladd.f64(double %neg.3.2.1.i, double %86, double %84) #22, !dbg !597
  store double %87, double* %74, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !582, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx16.2.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r.addr.0, i64 2, i32 0, i64 2
  %88 = bitcast %struct.InternalNode** %arrayidx16.2.2.i to double*
  call void @llvm.dbg.value(metadata i32 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %89 = load double, double* %56, align 8, !dbg !586, !tbaa !88
  %arrayidx12.255.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 2, !dbg !596
  %90 = bitcast %struct.InternalNode* %arrayidx12.255.2.i to double*, !dbg !596
  %91 = load double, double* %90, align 8, !dbg !596, !tbaa !88
  %92 = load double, double* %88, align 8, !dbg !597, !tbaa !88
  %neg.256.2.i = fneg double %89, !dbg !597
  %93 = tail call double @llvm.fmuladd.f64(double %neg.256.2.i, double %91, double %92) #22, !dbg !597
  store double %93, double* %88, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %94 = load double, double* %62, align 8, !dbg !586, !tbaa !88
  %arrayidx12.1.2.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 2, i32 0, i64 1, !dbg !596
  %95 = bitcast %struct.InternalNode** %arrayidx12.1.2.2.i to double*, !dbg !596
  %96 = load double, double* %95, align 8, !dbg !596, !tbaa !88
  %neg.1.2.2.i = fneg double %94, !dbg !597
  %97 = tail call double @llvm.fmuladd.f64(double %neg.1.2.2.i, double %96, double %93) #22, !dbg !597
  store double %97, double* %88, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %98 = load double, double* %66, align 8, !dbg !586, !tbaa !88
  %arrayidx12.2.2.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 2, i32 0, i64 2, !dbg !596
  %99 = bitcast %struct.InternalNode** %arrayidx12.2.2.2.i to double*, !dbg !596
  %100 = load double, double* %99, align 8, !dbg !596, !tbaa !88
  %neg.2.2.2.i = fneg double %98, !dbg !597
  %101 = tail call double @llvm.fmuladd.f64(double %neg.2.2.2.i, double %100, double %97) #22, !dbg !597
  store double %101, double* %88, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %102 = load double, double* %70, align 8, !dbg !586, !tbaa !88
  %arrayidx12.3.2.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 2, i32 0, i64 3, !dbg !596
  %103 = bitcast %struct.InternalNode** %arrayidx12.3.2.2.i to double*, !dbg !596
  %104 = load double, double* %103, align 8, !dbg !596, !tbaa !88
  %neg.3.2.2.i = fneg double %102, !dbg !597
  %105 = tail call double @llvm.fmuladd.f64(double %neg.3.2.2.i, double %104, double %101) #22, !dbg !597
  store double %105, double* %88, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !582, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !581, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !581, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i32 0, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.357.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, !dbg !586
  %106 = bitcast %struct.InternalNode* %arrayidx8.357.i to double*, !dbg !586
  call void @llvm.dbg.value(metadata i64 0, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx16.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r.addr.0, i64 3
  %107 = bitcast %struct.InternalNode* %arrayidx16.3.i to double*
  call void @llvm.dbg.value(metadata i32 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %108 = load double, double* %106, align 8, !dbg !586, !tbaa !88
  %109 = load double, double* %arrayidx12.i, align 8, !dbg !596, !tbaa !88
  %110 = load double, double* %107, align 8, !dbg !597, !tbaa !88
  %neg.359.i = fneg double %108, !dbg !597
  %111 = tail call double @llvm.fmuladd.f64(double %neg.359.i, double %109, double %110) #22, !dbg !597
  store double %111, double* %107, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.1.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, i32 0, i64 1, !dbg !586
  %112 = bitcast %struct.InternalNode** %arrayidx8.1.3.i to double*, !dbg !586
  %113 = load double, double* %112, align 8, !dbg !586, !tbaa !88
  %114 = load double, double* %7, align 8, !dbg !596, !tbaa !88
  %neg.1.3.i = fneg double %113, !dbg !597
  %115 = tail call double @llvm.fmuladd.f64(double %neg.1.3.i, double %114, double %111) #22, !dbg !597
  store double %115, double* %107, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.2.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, i32 0, i64 2, !dbg !586
  %116 = bitcast %struct.InternalNode** %arrayidx8.2.3.i to double*, !dbg !586
  %117 = load double, double* %116, align 8, !dbg !586, !tbaa !88
  %118 = load double, double* %12, align 8, !dbg !596, !tbaa !88
  %neg.2.3.i = fneg double %117, !dbg !597
  %119 = tail call double @llvm.fmuladd.f64(double %neg.2.3.i, double %118, double %115) #22, !dbg !597
  store double %119, double* %107, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %arrayidx8.3.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, i32 0, i64 3, !dbg !586
  %120 = bitcast %struct.InternalNode** %arrayidx8.3.3.i to double*, !dbg !586
  %121 = load double, double* %120, align 8, !dbg !586, !tbaa !88
  %122 = load double, double* %17, align 8, !dbg !596, !tbaa !88
  %neg.3.3.i = fneg double %121, !dbg !597
  %123 = tail call double @llvm.fmuladd.f64(double %neg.3.3.i, double %122, double %119) #22, !dbg !597
  store double %123, double* %107, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !582, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx16.3.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r.addr.0, i64 3, i32 0, i64 1
  %124 = bitcast %struct.InternalNode** %arrayidx16.3.1.i to double*
  call void @llvm.dbg.value(metadata i32 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %125 = load double, double* %106, align 8, !dbg !586, !tbaa !88
  %126 = load double, double* %40, align 8, !dbg !596, !tbaa !88
  %127 = load double, double* %124, align 8, !dbg !597, !tbaa !88
  %neg.359.1.i = fneg double %125, !dbg !597
  %128 = tail call double @llvm.fmuladd.f64(double %neg.359.1.i, double %126, double %127) #22, !dbg !597
  store double %128, double* %124, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %129 = load double, double* %112, align 8, !dbg !586, !tbaa !88
  %130 = load double, double* %45, align 8, !dbg !596, !tbaa !88
  %neg.1.3.1.i = fneg double %129, !dbg !597
  %131 = tail call double @llvm.fmuladd.f64(double %neg.1.3.1.i, double %130, double %128) #22, !dbg !597
  store double %131, double* %124, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %132 = load double, double* %116, align 8, !dbg !586, !tbaa !88
  %133 = load double, double* %49, align 8, !dbg !596, !tbaa !88
  %neg.2.3.1.i = fneg double %132, !dbg !597
  %134 = tail call double @llvm.fmuladd.f64(double %neg.2.3.1.i, double %133, double %131) #22, !dbg !597
  store double %134, double* %124, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %135 = load double, double* %120, align 8, !dbg !586, !tbaa !88
  %136 = load double, double* %53, align 8, !dbg !596, !tbaa !88
  %neg.3.3.1.i = fneg double %135, !dbg !597
  %137 = tail call double @llvm.fmuladd.f64(double %neg.3.3.1.i, double %136, double %134) #22, !dbg !597
  store double %137, double* %124, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !582, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx16.3.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r.addr.0, i64 3, i32 0, i64 2
  %138 = bitcast %struct.InternalNode** %arrayidx16.3.2.i to double*
  call void @llvm.dbg.value(metadata i32 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %139 = load double, double* %106, align 8, !dbg !586, !tbaa !88
  %140 = load double, double* %90, align 8, !dbg !596, !tbaa !88
  %141 = load double, double* %138, align 8, !dbg !597, !tbaa !88
  %neg.359.2.i = fneg double %139, !dbg !597
  %142 = tail call double @llvm.fmuladd.f64(double %neg.359.2.i, double %140, double %141) #22, !dbg !597
  store double %142, double* %138, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %143 = load double, double* %112, align 8, !dbg !586, !tbaa !88
  %144 = load double, double* %95, align 8, !dbg !596, !tbaa !88
  %neg.1.3.2.i = fneg double %143, !dbg !597
  %145 = tail call double @llvm.fmuladd.f64(double %neg.1.3.2.i, double %144, double %142) #22, !dbg !597
  store double %145, double* %138, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %146 = load double, double* %116, align 8, !dbg !586, !tbaa !88
  %147 = load double, double* %99, align 8, !dbg !596, !tbaa !88
  %neg.2.3.2.i = fneg double %146, !dbg !597
  %148 = tail call double @llvm.fmuladd.f64(double %neg.2.3.2.i, double %147, double %145) #22, !dbg !597
  store double %148, double* %138, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %149 = load double, double* %120, align 8, !dbg !586, !tbaa !88
  %150 = load double, double* %103, align 8, !dbg !596, !tbaa !88
  %neg.3.3.2.i = fneg double %149, !dbg !597
  %151 = tail call double @llvm.fmuladd.f64(double %neg.3.3.2.i, double %150, double %148) #22, !dbg !597
  store double %151, double* %138, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !582, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !582, metadata !DIExpression()) #22, !dbg !584
  %arrayidx16.3.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r.addr.0, i64 3, i32 0, i64 3
  %152 = bitcast %struct.InternalNode** %arrayidx16.3.3.i to double*
  call void @llvm.dbg.value(metadata i32 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 0, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %153 = load double, double* %106, align 8, !dbg !586, !tbaa !88
  %arrayidx12.358.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 3, !dbg !596
  %154 = bitcast %struct.InternalNode* %arrayidx12.358.3.i to double*, !dbg !596
  %155 = load double, double* %154, align 8, !dbg !596, !tbaa !88
  %156 = load double, double* %152, align 8, !dbg !597, !tbaa !88
  %neg.359.3.i = fneg double %153, !dbg !597
  %157 = tail call double @llvm.fmuladd.f64(double %neg.359.3.i, double %155, double %156) #22, !dbg !597
  store double %157, double* %152, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 1, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %158 = load double, double* %112, align 8, !dbg !586, !tbaa !88
  %arrayidx12.1.3.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 3, i32 0, i64 1, !dbg !596
  %159 = bitcast %struct.InternalNode** %arrayidx12.1.3.3.i to double*, !dbg !596
  %160 = load double, double* %159, align 8, !dbg !596, !tbaa !88
  %neg.1.3.3.i = fneg double %158, !dbg !597
  %161 = tail call double @llvm.fmuladd.f64(double %neg.1.3.3.i, double %160, double %157) #22, !dbg !597
  store double %161, double* %152, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 2, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %162 = load double, double* %116, align 8, !dbg !586, !tbaa !88
  %arrayidx12.2.3.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 3, i32 0, i64 2, !dbg !596
  %163 = bitcast %struct.InternalNode** %arrayidx12.2.3.3.i to double*, !dbg !596
  %164 = load double, double* %163, align 8, !dbg !596, !tbaa !88
  %neg.2.3.3.i = fneg double %162, !dbg !597
  %165 = tail call double @llvm.fmuladd.f64(double %neg.2.3.3.i, double %164, double %161) #22, !dbg !597
  store double %165, double* %152, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 3, metadata !583, metadata !DIExpression()) #22, !dbg !584
  %166 = load double, double* %120, align 8, !dbg !586, !tbaa !88
  %arrayidx12.3.3.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 3, i32 0, i64 3, !dbg !596
  %167 = bitcast %struct.InternalNode** %arrayidx12.3.3.3.i to double*, !dbg !596
  %168 = load double, double* %167, align 8, !dbg !596, !tbaa !88
  %neg.3.3.3.i = fneg double %166, !dbg !597
  %169 = tail call double @llvm.fmuladd.f64(double %neg.3.3.3.i, double %168, double %165) #22, !dbg !597
  store double %169, double* %152, align 8, !dbg !597, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !583, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 4, metadata !582, metadata !DIExpression()) #22, !dbg !584
  call void @llvm.dbg.value(metadata i64 4, metadata !581, metadata !DIExpression()) #22, !dbg !584
  br label %return, !dbg !598

if.else12:                                        ; preds = %if.end
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r.addr.0, metadata !543, metadata !DIExpression()), !dbg !555
  %arraydecay14 = bitcast %struct.InternalNode* %r.addr.0 to [4 x double]*, !dbg !599
  %arraydecay16 = bitcast %struct.InternalNode* %a to [4 x double]*, !dbg !600
  call void @llvm.dbg.value(metadata [4 x double]* %arraydecay14, metadata !601, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata [4 x double]* %arraydecay16, metadata !604, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata %struct.InternalNode* %b, metadata !605, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i32 0, metadata !606, metadata !DIExpression()) #22, !dbg !609
  %arrayidx12.i343 = bitcast %struct.InternalNode* %b to double*
  %arrayidx12.1.i344 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 1
  %170 = bitcast %struct.InternalNode** %arrayidx12.1.i344 to double*
  %arrayidx12.2.i345 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 2
  %171 = bitcast %struct.InternalNode** %arrayidx12.2.i345 to double*
  %arrayidx12.3.i346 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 3
  %172 = bitcast %struct.InternalNode** %arrayidx12.3.i346 to double*
  %arrayidx12.140.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 1
  %173 = bitcast %struct.InternalNode* %arrayidx12.140.i to double*
  %arrayidx12.1.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 1, i32 0, i64 1
  %174 = bitcast %struct.InternalNode** %arrayidx12.1.1.i to double*
  %arrayidx12.2.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 1, i32 0, i64 2
  %175 = bitcast %struct.InternalNode** %arrayidx12.2.1.i to double*
  %arrayidx12.3.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 1, i32 0, i64 3
  %176 = bitcast %struct.InternalNode** %arrayidx12.3.1.i to double*
  %arrayidx12.242.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 2
  %177 = bitcast %struct.InternalNode* %arrayidx12.242.i to double*
  %arrayidx12.1.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 2, i32 0, i64 1
  %178 = bitcast %struct.InternalNode** %arrayidx12.1.2.i to double*
  %arrayidx12.2.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 2, i32 0, i64 2
  %179 = bitcast %struct.InternalNode** %arrayidx12.2.2.i to double*
  %arrayidx12.3.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 2, i32 0, i64 3
  %180 = bitcast %struct.InternalNode** %arrayidx12.3.2.i to double*
  %arrayidx12.344.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 3
  %181 = bitcast %struct.InternalNode* %arrayidx12.344.i to double*
  %arrayidx12.1.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 3, i32 0, i64 1
  %182 = bitcast %struct.InternalNode** %arrayidx12.1.3.i to double*
  %arrayidx12.2.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 3, i32 0, i64 2
  %183 = bitcast %struct.InternalNode** %arrayidx12.2.3.i to double*
  %arrayidx12.3.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 3, i32 0, i64 3
  %184 = bitcast %struct.InternalNode** %arrayidx12.3.3.i to double*
  br label %for.cond1.preheader.i, !dbg !611

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i, %if.else12
  %indvars.iv.i = phi i64 [ 0, %if.else12 ], [ %indvars.iv.next.i, %for.cond1.preheader.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.i, metadata !606, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i32 0, metadata !607, metadata !DIExpression()) #22, !dbg !609
  %arrayidx8.i347 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay16, i64 %indvars.iv.i, i64 0, !dbg !613
  call void @llvm.dbg.value(metadata i64 0, metadata !607, metadata !DIExpression()) #22, !dbg !609
  %arrayidx16.i348 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay14, i64 %indvars.iv.i, i64 0
  call void @llvm.dbg.value(metadata i32 0, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 0, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %185 = load double, double* %arrayidx8.i347, align 8, !dbg !613, !tbaa !88
  %186 = load double, double* %arrayidx12.i343, align 8, !dbg !622, !tbaa !88
  %187 = load double, double* %arrayidx16.i348, align 8, !dbg !623, !tbaa !88
  %neg.i349 = fneg double %185, !dbg !623
  %188 = tail call double @llvm.fmuladd.f64(double %neg.i349, double %186, double %187) #22, !dbg !623
  store double %188, double* %arrayidx16.i348, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 1, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %arrayidx8.1.i350 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay16, i64 %indvars.iv.i, i64 1, !dbg !613
  %189 = load double, double* %arrayidx8.1.i350, align 8, !dbg !613, !tbaa !88
  %190 = load double, double* %170, align 8, !dbg !622, !tbaa !88
  %neg.1.i351 = fneg double %189, !dbg !623
  %191 = tail call double @llvm.fmuladd.f64(double %neg.1.i351, double %190, double %188) #22, !dbg !623
  store double %191, double* %arrayidx16.i348, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 2, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %arrayidx8.2.i352 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay16, i64 %indvars.iv.i, i64 2, !dbg !613
  %192 = load double, double* %arrayidx8.2.i352, align 8, !dbg !613, !tbaa !88
  %193 = load double, double* %171, align 8, !dbg !622, !tbaa !88
  %neg.2.i353 = fneg double %192, !dbg !623
  %194 = tail call double @llvm.fmuladd.f64(double %neg.2.i353, double %193, double %191) #22, !dbg !623
  store double %194, double* %arrayidx16.i348, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 3, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %arrayidx8.3.i354 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay16, i64 %indvars.iv.i, i64 3, !dbg !613
  %195 = load double, double* %arrayidx8.3.i354, align 8, !dbg !613, !tbaa !88
  %196 = load double, double* %172, align 8, !dbg !622, !tbaa !88
  %neg.3.i355 = fneg double %195, !dbg !623
  %197 = tail call double @llvm.fmuladd.f64(double %neg.3.i355, double %196, double %194) #22, !dbg !623
  store double %197, double* %arrayidx16.i348, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 1, metadata !607, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 1, metadata !607, metadata !DIExpression()) #22, !dbg !609
  %arrayidx16.1.i356 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay14, i64 %indvars.iv.i, i64 1
  call void @llvm.dbg.value(metadata i32 0, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 0, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %198 = load double, double* %arrayidx8.i347, align 8, !dbg !613, !tbaa !88
  %199 = load double, double* %173, align 8, !dbg !622, !tbaa !88
  %200 = load double, double* %arrayidx16.1.i356, align 8, !dbg !623, !tbaa !88
  %neg.141.i = fneg double %198, !dbg !623
  %201 = tail call double @llvm.fmuladd.f64(double %neg.141.i, double %199, double %200) #22, !dbg !623
  store double %201, double* %arrayidx16.1.i356, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 1, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %202 = load double, double* %arrayidx8.1.i350, align 8, !dbg !613, !tbaa !88
  %203 = load double, double* %174, align 8, !dbg !622, !tbaa !88
  %neg.1.1.i357 = fneg double %202, !dbg !623
  %204 = tail call double @llvm.fmuladd.f64(double %neg.1.1.i357, double %203, double %201) #22, !dbg !623
  store double %204, double* %arrayidx16.1.i356, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 2, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %205 = load double, double* %arrayidx8.2.i352, align 8, !dbg !613, !tbaa !88
  %206 = load double, double* %175, align 8, !dbg !622, !tbaa !88
  %neg.2.1.i358 = fneg double %205, !dbg !623
  %207 = tail call double @llvm.fmuladd.f64(double %neg.2.1.i358, double %206, double %204) #22, !dbg !623
  store double %207, double* %arrayidx16.1.i356, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 3, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %208 = load double, double* %arrayidx8.3.i354, align 8, !dbg !613, !tbaa !88
  %209 = load double, double* %176, align 8, !dbg !622, !tbaa !88
  %neg.3.1.i359 = fneg double %208, !dbg !623
  %210 = tail call double @llvm.fmuladd.f64(double %neg.3.1.i359, double %209, double %207) #22, !dbg !623
  store double %210, double* %arrayidx16.1.i356, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 2, metadata !607, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 2, metadata !607, metadata !DIExpression()) #22, !dbg !609
  %arrayidx16.2.i360 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay14, i64 %indvars.iv.i, i64 2
  call void @llvm.dbg.value(metadata i32 0, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 0, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %211 = load double, double* %arrayidx8.i347, align 8, !dbg !613, !tbaa !88
  %212 = load double, double* %177, align 8, !dbg !622, !tbaa !88
  %213 = load double, double* %arrayidx16.2.i360, align 8, !dbg !623, !tbaa !88
  %neg.243.i = fneg double %211, !dbg !623
  %214 = tail call double @llvm.fmuladd.f64(double %neg.243.i, double %212, double %213) #22, !dbg !623
  store double %214, double* %arrayidx16.2.i360, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 1, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %215 = load double, double* %arrayidx8.1.i350, align 8, !dbg !613, !tbaa !88
  %216 = load double, double* %178, align 8, !dbg !622, !tbaa !88
  %neg.1.2.i361 = fneg double %215, !dbg !623
  %217 = tail call double @llvm.fmuladd.f64(double %neg.1.2.i361, double %216, double %214) #22, !dbg !623
  store double %217, double* %arrayidx16.2.i360, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 2, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %218 = load double, double* %arrayidx8.2.i352, align 8, !dbg !613, !tbaa !88
  %219 = load double, double* %179, align 8, !dbg !622, !tbaa !88
  %neg.2.2.i362 = fneg double %218, !dbg !623
  %220 = tail call double @llvm.fmuladd.f64(double %neg.2.2.i362, double %219, double %217) #22, !dbg !623
  store double %220, double* %arrayidx16.2.i360, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 3, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %221 = load double, double* %arrayidx8.3.i354, align 8, !dbg !613, !tbaa !88
  %222 = load double, double* %180, align 8, !dbg !622, !tbaa !88
  %neg.3.2.i363 = fneg double %221, !dbg !623
  %223 = tail call double @llvm.fmuladd.f64(double %neg.3.2.i363, double %222, double %220) #22, !dbg !623
  store double %223, double* %arrayidx16.2.i360, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 3, metadata !607, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 3, metadata !607, metadata !DIExpression()) #22, !dbg !609
  %arrayidx16.3.i364 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay14, i64 %indvars.iv.i, i64 3
  call void @llvm.dbg.value(metadata i32 0, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 0, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %224 = load double, double* %arrayidx8.i347, align 8, !dbg !613, !tbaa !88
  %225 = load double, double* %181, align 8, !dbg !622, !tbaa !88
  %226 = load double, double* %arrayidx16.3.i364, align 8, !dbg !623, !tbaa !88
  %neg.345.i = fneg double %224, !dbg !623
  %227 = tail call double @llvm.fmuladd.f64(double %neg.345.i, double %225, double %226) #22, !dbg !623
  store double %227, double* %arrayidx16.3.i364, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 1, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %228 = load double, double* %arrayidx8.1.i350, align 8, !dbg !613, !tbaa !88
  %229 = load double, double* %182, align 8, !dbg !622, !tbaa !88
  %neg.1.3.i365 = fneg double %228, !dbg !623
  %230 = tail call double @llvm.fmuladd.f64(double %neg.1.3.i365, double %229, double %227) #22, !dbg !623
  store double %230, double* %arrayidx16.3.i364, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 2, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %231 = load double, double* %arrayidx8.2.i352, align 8, !dbg !613, !tbaa !88
  %232 = load double, double* %183, align 8, !dbg !622, !tbaa !88
  %neg.2.3.i366 = fneg double %231, !dbg !623
  %233 = tail call double @llvm.fmuladd.f64(double %neg.2.3.i366, double %232, double %230) #22, !dbg !623
  store double %233, double* %arrayidx16.3.i364, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 3, metadata !608, metadata !DIExpression()) #22, !dbg !609
  %234 = load double, double* %arrayidx8.3.i354, align 8, !dbg !613, !tbaa !88
  %235 = load double, double* %184, align 8, !dbg !622, !tbaa !88
  %neg.3.3.i367 = fneg double %234, !dbg !623
  %236 = tail call double @llvm.fmuladd.f64(double %neg.3.3.i367, double %235, double %233) #22, !dbg !623
  store double %236, double* %arrayidx16.3.i364, align 8, !dbg !623, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !608, metadata !DIExpression()) #22, !dbg !609
  call void @llvm.dbg.value(metadata i64 4, metadata !607, metadata !DIExpression()) #22, !dbg !609
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1, !dbg !624
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.i, metadata !606, metadata !DIExpression()) #22, !dbg !609
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, 4, !dbg !625
  br i1 %exitcond.not.i, label %return, label %for.cond1.preheader.i, !dbg !611, !llvm.loop !626

if.end20:                                         ; preds = %cond.end
  %r00.0.r00.0.r00.0..sroa_cast = bitcast %struct.InternalNode** %r00 to i8*, !dbg !629
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %r00.0.r00.0.r00.0..sroa_cast), !dbg !629
  %r01.0.r01.0.r01.0..sroa_cast = bitcast %struct.InternalNode** %r01 to i8*, !dbg !629
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %r01.0.r01.0.r01.0..sroa_cast), !dbg !629
  %r10.0.r10.0.r10.0..sroa_cast = bitcast %struct.InternalNode** %r10 to i8*, !dbg !629
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %r10.0.r10.0.r10.0..sroa_cast), !dbg !629
  %dec = add nsw i32 %depth, -1, !dbg !630
  call void @llvm.dbg.value(metadata i32 %dec, metadata !534, metadata !DIExpression()), !dbg !551
  %cmp21.not = icmp eq %struct.InternalNode* %r, null, !dbg !631
  br i1 %cmp21.not, label %if.else29, label %if.then22, !dbg !633

if.then22:                                        ; preds = %if.end20
  %arrayidx = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r, i64 0, i32 0, i64 0, !dbg !634
  %237 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx, align 8, !dbg !634, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %237, metadata !544, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %237, %struct.InternalNode** %r00, align 8, !dbg !636, !tbaa !170
  %arrayidx24 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r, i64 0, i32 0, i64 1, !dbg !637
  %238 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx24, align 8, !dbg !637, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %238, metadata !545, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %238, %struct.InternalNode** %r01, align 8, !dbg !638, !tbaa !170
  %arrayidx26 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r, i64 0, i32 0, i64 2, !dbg !639
  %239 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx26, align 8, !dbg !639, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %239, metadata !546, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %239, %struct.InternalNode** %r10, align 8, !dbg !640, !tbaa !170
  %arrayidx28 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r, i64 0, i32 0, i64 3, !dbg !641
  %240 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx28, align 8, !dbg !641, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %240, metadata !547, metadata !DIExpression()), !dbg !551
  br label %if.end30, !dbg !642

if.else29:                                        ; preds = %if.end20
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !544, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* null, %struct.InternalNode** %r00, align 8, !dbg !643, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !545, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* null, %struct.InternalNode** %r01, align 8, !dbg !645, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !546, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* null, %struct.InternalNode** %r10, align 8, !dbg !646, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !547, metadata !DIExpression()), !dbg !551
  br label %if.end30

if.end30:                                         ; preds = %if.else29, %if.then22
  %r10.0.r10.0.r10.0. = phi %struct.InternalNode* [ null, %if.else29 ], [ %239, %if.then22 ]
  %r01.0.r01.0.r01.0. = phi %struct.InternalNode* [ null, %if.else29 ], [ %238, %if.then22 ]
  %r00.0.r00.0.r00.0. = phi %struct.InternalNode* [ null, %if.else29 ], [ %237, %if.then22 ]
  %r11.0 = phi %struct.InternalNode* [ null, %if.else29 ], [ %240, %if.then22 ], !dbg !647
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r11.0, metadata !547, metadata !DIExpression()), !dbg !551
  %arrayidx32 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 0, !dbg !648
  %241 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx32, align 8, !dbg !648, !tbaa !170
  %tobool33.not = icmp eq %struct.InternalNode* %241, null, !dbg !648
  br i1 %tobool33.not, label %if.end44, label %land.lhs.true34, !dbg !649

land.lhs.true34:                                  ; preds = %if.end30
  %arrayidx36 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 0, !dbg !650
  %242 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx36, align 8, !dbg !650, !tbaa !170
  %tobool37.not = icmp eq %struct.InternalNode* %242, null, !dbg !650
  br i1 %tobool37.not, label %if.end44, label %if.then38.tf, !dbg !651

if.then38.tf:                                     ; preds = %land.lhs.true34
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r00.0.r00.0.r00.0., metadata !544, metadata !DIExpression()), !dbg !551
  detach within %syncreg, label %det.achd, label %if.end44, !dbg !652

det.achd:                                         ; preds = %if.then38.tf
  %call43 = tail call %struct.InternalNode* @mul_and_subT(i32 noundef %dec, i32 noundef %lower, %struct.InternalNode* noundef nonnull %241, %struct.InternalNode* noundef nonnull %242, %struct.InternalNode* noundef %r00.0.r00.0.r00.0.), !dbg !652
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call43, metadata !544, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %call43, %struct.InternalNode** %r00, align 8, !dbg !653, !tbaa !170
  reattach within %syncreg, label %if.end44, !dbg !653

if.end44:                                         ; preds = %det.achd, %if.then38.tf, %land.lhs.true34, %if.end30
  %tobool45.not = icmp eq i32 %lower, 0, !dbg !654
  br i1 %tobool45.not, label %land.lhs.true46, label %if.end62, !dbg !656

land.lhs.true46:                                  ; preds = %if.end44
  %243 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx32, align 8, !dbg !657, !tbaa !170
  %tobool49.not = icmp eq %struct.InternalNode* %243, null, !dbg !657
  br i1 %tobool49.not, label %if.end62, label %land.lhs.true50, !dbg !658

land.lhs.true50:                                  ; preds = %land.lhs.true46
  %arrayidx52 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 2, !dbg !659
  %244 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx52, align 8, !dbg !659, !tbaa !170
  %tobool53.not = icmp eq %struct.InternalNode* %244, null, !dbg !659
  br i1 %tobool53.not, label %if.end62, label %if.then54.tf, !dbg !660

if.then54.tf:                                     ; preds = %land.lhs.true50
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r01.0.r01.0.r01.0., metadata !545, metadata !DIExpression()), !dbg !551
  detach within %syncreg, label %det.achd59, label %if.end62, !dbg !661

det.achd59:                                       ; preds = %if.then54.tf
  %call60 = tail call %struct.InternalNode* @mul_and_subT(i32 noundef %dec, i32 noundef 0, %struct.InternalNode* noundef nonnull %243, %struct.InternalNode* noundef nonnull %244, %struct.InternalNode* noundef %r01.0.r01.0.r01.0.), !dbg !661
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call60, metadata !545, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %call60, %struct.InternalNode** %r01, align 8, !dbg !663, !tbaa !170
  reattach within %syncreg, label %if.end62, !dbg !663

if.end62:                                         ; preds = %det.achd59, %if.then54.tf, %land.lhs.true50, %land.lhs.true46, %if.end44
  %arrayidx64 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 2, !dbg !664
  %245 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx64, align 8, !dbg !664, !tbaa !170
  %tobool65.not = icmp eq %struct.InternalNode* %245, null, !dbg !664
  br i1 %tobool65.not, label %if.end78, label %land.lhs.true66, !dbg !666

land.lhs.true66:                                  ; preds = %if.end62
  %arrayidx68 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 0, !dbg !667
  %246 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx68, align 8, !dbg !667, !tbaa !170
  %tobool69.not = icmp eq %struct.InternalNode* %246, null, !dbg !667
  br i1 %tobool69.not, label %if.end78, label %if.then70.tf, !dbg !668

if.then70.tf:                                     ; preds = %land.lhs.true66
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r10.0.r10.0.r10.0., metadata !546, metadata !DIExpression()), !dbg !551
  detach within %syncreg, label %det.achd75, label %if.end78, !dbg !669

det.achd75:                                       ; preds = %if.then70.tf
  %call76 = tail call %struct.InternalNode* @mul_and_subT(i32 noundef %dec, i32 noundef 0, %struct.InternalNode* noundef nonnull %245, %struct.InternalNode* noundef nonnull %246, %struct.InternalNode* noundef %r10.0.r10.0.r10.0.), !dbg !669
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call76, metadata !546, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %call76, %struct.InternalNode** %r10, align 8, !dbg !671, !tbaa !170
  reattach within %syncreg, label %if.end78, !dbg !671

if.end78:                                         ; preds = %det.achd75, %if.then70.tf, %land.lhs.true66, %if.end62
  %247 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx64, align 8, !dbg !672, !tbaa !170
  %tobool81.not = icmp eq %struct.InternalNode* %247, null, !dbg !672
  br i1 %tobool81.not, label %if.end94, label %land.lhs.true82, !dbg !674

land.lhs.true82:                                  ; preds = %if.end78
  %arrayidx84 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 2, !dbg !675
  %248 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx84, align 8, !dbg !675, !tbaa !170
  %tobool85.not = icmp eq %struct.InternalNode* %248, null, !dbg !675
  br i1 %tobool85.not, label %if.end94, label %if.then86, !dbg !676

if.then86:                                        ; preds = %land.lhs.true82
  %call92 = tail call %struct.InternalNode* @mul_and_subT(i32 noundef %dec, i32 noundef %lower, %struct.InternalNode* noundef nonnull %247, %struct.InternalNode* noundef nonnull %248, %struct.InternalNode* noundef %r11.0), !dbg !677
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call92, metadata !547, metadata !DIExpression()), !dbg !551
  br label %if.end94, !dbg !679

if.end94:                                         ; preds = %if.then86, %land.lhs.true82, %if.end78
  %r11.1 = phi %struct.InternalNode* [ %call92, %if.then86 ], [ %r11.0, %land.lhs.true82 ], [ %r11.0, %if.end78 ], !dbg !551
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r11.1, metadata !547, metadata !DIExpression()), !dbg !551
  sync within %syncreg, label %sync.continue, !dbg !680

sync.continue:                                    ; preds = %if.end94
  %arrayidx96 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 1, !dbg !681
  %249 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx96, align 8, !dbg !681, !tbaa !170
  %tobool97.not = icmp eq %struct.InternalNode* %249, null, !dbg !681
  br i1 %tobool97.not, label %if.end110, label %land.lhs.true98, !dbg !683

land.lhs.true98:                                  ; preds = %sync.continue
  %arrayidx100 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 1, !dbg !684
  %250 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx100, align 8, !dbg !684, !tbaa !170
  %tobool101.not = icmp eq %struct.InternalNode* %250, null, !dbg !684
  br i1 %tobool101.not, label %if.end110, label %if.then102.tf, !dbg !685

if.then102.tf:                                    ; preds = %land.lhs.true98
  %r00.0.r00.0.r00.0.248 = load %struct.InternalNode*, %struct.InternalNode** %r00, align 8, !dbg !686, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r00.0.r00.0.r00.0.248, metadata !544, metadata !DIExpression()), !dbg !551
  detach within %syncreg, label %det.achd107, label %if.end110, !dbg !688

det.achd107:                                      ; preds = %if.then102.tf
  %call108 = tail call %struct.InternalNode* @mul_and_subT(i32 noundef %dec, i32 noundef %lower, %struct.InternalNode* noundef nonnull %249, %struct.InternalNode* noundef nonnull %250, %struct.InternalNode* noundef %r00.0.r00.0.r00.0.248), !dbg !688
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call108, metadata !544, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %call108, %struct.InternalNode** %r00, align 8, !dbg !689, !tbaa !170
  reattach within %syncreg, label %if.end110, !dbg !689

if.end110:                                        ; preds = %det.achd107, %if.then102.tf, %land.lhs.true98, %sync.continue
  br i1 %tobool45.not, label %land.lhs.true112, label %if.end128, !dbg !690

land.lhs.true112:                                 ; preds = %if.end110
  %251 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx96, align 8, !dbg !692, !tbaa !170
  %tobool115.not = icmp eq %struct.InternalNode* %251, null, !dbg !692
  br i1 %tobool115.not, label %if.end128, label %land.lhs.true116, !dbg !693

land.lhs.true116:                                 ; preds = %land.lhs.true112
  %arrayidx118 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 3, !dbg !694
  %252 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx118, align 8, !dbg !694, !tbaa !170
  %tobool119.not = icmp eq %struct.InternalNode* %252, null, !dbg !694
  br i1 %tobool119.not, label %if.end128, label %if.then120.tf, !dbg !695

if.then120.tf:                                    ; preds = %land.lhs.true116
  %r01.0.r01.0.r01.0.242 = load %struct.InternalNode*, %struct.InternalNode** %r01, align 8, !dbg !696, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r01.0.r01.0.r01.0.242, metadata !545, metadata !DIExpression()), !dbg !551
  detach within %syncreg, label %det.achd125, label %if.end128, !dbg !698

det.achd125:                                      ; preds = %if.then120.tf
  %call126 = tail call %struct.InternalNode* @mul_and_subT(i32 noundef %dec, i32 noundef 0, %struct.InternalNode* noundef nonnull %251, %struct.InternalNode* noundef nonnull %252, %struct.InternalNode* noundef %r01.0.r01.0.r01.0.242), !dbg !698
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call126, metadata !545, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %call126, %struct.InternalNode** %r01, align 8, !dbg !699, !tbaa !170
  reattach within %syncreg, label %if.end128, !dbg !699

if.end128:                                        ; preds = %det.achd125, %if.then120.tf, %land.lhs.true116, %land.lhs.true112, %if.end110
  %arrayidx130 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 3, !dbg !700
  %253 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx130, align 8, !dbg !700, !tbaa !170
  %tobool131.not = icmp eq %struct.InternalNode* %253, null, !dbg !700
  br i1 %tobool131.not, label %if.end144, label %land.lhs.true132, !dbg !702

land.lhs.true132:                                 ; preds = %if.end128
  %arrayidx134 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 1, !dbg !703
  %254 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx134, align 8, !dbg !703, !tbaa !170
  %tobool135.not = icmp eq %struct.InternalNode* %254, null, !dbg !703
  br i1 %tobool135.not, label %if.end144, label %if.then136.tf, !dbg !704

if.then136.tf:                                    ; preds = %land.lhs.true132
  %r10.0.r10.0.r10.0.236 = load %struct.InternalNode*, %struct.InternalNode** %r10, align 8, !dbg !705, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r10.0.r10.0.r10.0.236, metadata !546, metadata !DIExpression()), !dbg !551
  detach within %syncreg, label %det.achd141, label %if.end144, !dbg !707

det.achd141:                                      ; preds = %if.then136.tf
  %call142 = tail call %struct.InternalNode* @mul_and_subT(i32 noundef %dec, i32 noundef 0, %struct.InternalNode* noundef nonnull %253, %struct.InternalNode* noundef nonnull %254, %struct.InternalNode* noundef %r10.0.r10.0.r10.0.236), !dbg !707
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call142, metadata !546, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %call142, %struct.InternalNode** %r10, align 8, !dbg !708, !tbaa !170
  reattach within %syncreg, label %if.end144, !dbg !708

if.end144:                                        ; preds = %det.achd141, %if.then136.tf, %land.lhs.true132, %if.end128
  %255 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx130, align 8, !dbg !709, !tbaa !170
  %tobool147.not = icmp eq %struct.InternalNode* %255, null, !dbg !709
  br i1 %tobool147.not, label %if.end160, label %land.lhs.true148, !dbg !711

land.lhs.true148:                                 ; preds = %if.end144
  %arrayidx150 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %b, i64 0, i32 0, i64 3, !dbg !712
  %256 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx150, align 8, !dbg !712, !tbaa !170
  %tobool151.not = icmp eq %struct.InternalNode* %256, null, !dbg !712
  br i1 %tobool151.not, label %if.end160, label %if.then152, !dbg !713

if.then152:                                       ; preds = %land.lhs.true148
  %call158 = tail call %struct.InternalNode* @mul_and_subT(i32 noundef %dec, i32 noundef %lower, %struct.InternalNode* noundef nonnull %255, %struct.InternalNode* noundef nonnull %256, %struct.InternalNode* noundef %r11.1), !dbg !714
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call158, metadata !547, metadata !DIExpression()), !dbg !551
  br label %if.end160, !dbg !716

if.end160:                                        ; preds = %if.then152, %land.lhs.true148, %if.end144
  %r11.2 = phi %struct.InternalNode* [ %call158, %if.then152 ], [ %r11.1, %land.lhs.true148 ], [ %r11.1, %if.end144 ], !dbg !551
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r11.2, metadata !547, metadata !DIExpression()), !dbg !551
  sync within %syncreg, label %sync.continue161, !dbg !717

sync.continue161:                                 ; preds = %if.end160
  br i1 %cmp21.not, label %if.then163, label %if.else173, !dbg !718

if.then163:                                       ; preds = %sync.continue161
  %r00.0.r00.0.r00.0.249 = load %struct.InternalNode*, %struct.InternalNode** %r00, align 8, !dbg !719, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r00.0.r00.0.r00.0.249, metadata !544, metadata !DIExpression()), !dbg !551
  %tobool164 = icmp ne %struct.InternalNode* %r00.0.r00.0.r00.0.249, null, !dbg !719
  %r01.0.r01.0.r01.0.246 = load %struct.InternalNode*, %struct.InternalNode** %r01, align 8
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r01.0.r01.0.r01.0.246, metadata !545, metadata !DIExpression()), !dbg !551
  %tobool165 = icmp ne %struct.InternalNode* %r01.0.r01.0.r01.0.246, null
  %or.cond227 = select i1 %tobool164, i1 true, i1 %tobool165, !dbg !723
  %r10.0.r10.0.r10.0.240 = load %struct.InternalNode*, %struct.InternalNode** %r10, align 8
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r10.0.r10.0.r10.0.240, metadata !546, metadata !DIExpression()), !dbg !551
  %tobool167 = icmp ne %struct.InternalNode* %r10.0.r10.0.r10.0.240, null
  %or.cond228 = select i1 %or.cond227, i1 true, i1 %tobool167, !dbg !723
  %tobool169 = icmp ne %struct.InternalNode* %r11.2, null
  %or.cond229 = select i1 %or.cond228, i1 true, i1 %tobool169, !dbg !723
  br i1 %or.cond229, label %if.then170, label %if.end226, !dbg !723

if.then170:                                       ; preds = %if.then163
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r00.0.r00.0.r00.0.249, metadata !190, metadata !DIExpression()) #22, !dbg !724
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r01.0.r01.0.r01.0.246, metadata !195, metadata !DIExpression()) #22, !dbg !724
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r10.0.r10.0.r10.0.240, metadata !196, metadata !DIExpression()) #22, !dbg !724
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r11.2, metadata !197, metadata !DIExpression()) #22, !dbg !724
  %call.i368 = tail call noalias dereferenceable_or_null(32) i8* @malloc(i64 noundef 32) #22, !dbg !726
  %257 = bitcast i8* %call.i368 to %struct.InternalNode*, !dbg !727
  call void @llvm.dbg.value(metadata %struct.InternalNode* %257, metadata !198, metadata !DIExpression()) #22, !dbg !724
  %cmp.i369 = icmp eq i8* %call.i368, null, !dbg !728
  br i1 %cmp.i369, label %if.then.i371, label %new_internal.exit, !dbg !729

if.then.i371:                                     ; preds = %if.then170
  %puts.i370 = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @str.47, i64 0, i64 0)) #22, !dbg !730
  tail call void @exit(i32 noundef 1) #23, !dbg !731
  unreachable, !dbg !731

new_internal.exit:                                ; preds = %if.then170
  %arrayidx.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %257, i64 0, i32 0, i64 0, !dbg !732
  store %struct.InternalNode* %r00.0.r00.0.r00.0.249, %struct.InternalNode** %arrayidx.i, align 8, !dbg !733, !tbaa !170
  %arrayidx3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %257, i64 0, i32 0, i64 1, !dbg !734
  store %struct.InternalNode* %r01.0.r01.0.r01.0.246, %struct.InternalNode** %arrayidx3.i, align 8, !dbg !735, !tbaa !170
  %arrayidx5.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %257, i64 0, i32 0, i64 2, !dbg !736
  store %struct.InternalNode* %r10.0.r10.0.r10.0.240, %struct.InternalNode** %arrayidx5.i, align 8, !dbg !737, !tbaa !170
  %arrayidx7.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %257, i64 0, i32 0, i64 3, !dbg !738
  call void @llvm.dbg.value(metadata %struct.InternalNode* %257, metadata !538, metadata !DIExpression()), !dbg !551
  br label %if.end226.sink.split, !dbg !739

if.else173:                                       ; preds = %sync.continue161
  %arrayidx175 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r, i64 0, i32 0, i64 0, !dbg !740
  %258 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx175, align 8, !dbg !740, !tbaa !170
  %cmp176 = icmp eq %struct.InternalNode* %258, null, !dbg !740
  %r00.0.r00.0.r00.0.251 = load %struct.InternalNode*, %struct.InternalNode** %r00, align 8, !dbg !740
  %cmp180 = icmp eq %struct.InternalNode* %258, %r00.0.r00.0.r00.0.251, !dbg !740
  %or.cond339 = select i1 %cmp176, i1 true, i1 %cmp180, !dbg !740
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r00.0.r00.0.r00.0.251, metadata !544, metadata !DIExpression()), !dbg !551
  br i1 %or.cond339, label %cond.end184, label %cond.false182, !dbg !740

cond.false182:                                    ; preds = %if.else173
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([48 x i8], [48 x i8]* @.str.6, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 654, i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.mul_and_subT, i64 0, i64 0)) #23, !dbg !740
  unreachable, !dbg !740

cond.end184:                                      ; preds = %if.else173
  %arrayidx186 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r, i64 0, i32 0, i64 1, !dbg !742
  %259 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx186, align 8, !dbg !742, !tbaa !170
  %cmp187 = icmp eq %struct.InternalNode* %259, null, !dbg !742
  %r01.0.r01.0.r01.0.244 = load %struct.InternalNode*, %struct.InternalNode** %r01, align 8, !dbg !742
  %cmp191 = icmp eq %struct.InternalNode* %259, %r01.0.r01.0.r01.0.244, !dbg !742
  %or.cond340 = select i1 %cmp187, i1 true, i1 %cmp191, !dbg !742
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r01.0.r01.0.r01.0.244, metadata !545, metadata !DIExpression()), !dbg !551
  br i1 %or.cond340, label %cond.end195, label %cond.false193, !dbg !742

cond.false193:                                    ; preds = %cond.end184
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([48 x i8], [48 x i8]* @.str.7, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 655, i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.mul_and_subT, i64 0, i64 0)) #23, !dbg !742
  unreachable, !dbg !742

cond.end195:                                      ; preds = %cond.end184
  %arrayidx197 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r, i64 0, i32 0, i64 2, !dbg !743
  %260 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx197, align 8, !dbg !743, !tbaa !170
  %cmp198 = icmp eq %struct.InternalNode* %260, null, !dbg !743
  %r10.0.r10.0.r10.0.238 = load %struct.InternalNode*, %struct.InternalNode** %r10, align 8, !dbg !743
  %cmp202 = icmp eq %struct.InternalNode* %260, %r10.0.r10.0.r10.0.238, !dbg !743
  %or.cond341 = select i1 %cmp198, i1 true, i1 %cmp202, !dbg !743
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r10.0.r10.0.r10.0.238, metadata !546, metadata !DIExpression()), !dbg !551
  br i1 %or.cond341, label %cond.end206, label %cond.false204, !dbg !743

cond.false204:                                    ; preds = %cond.end195
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([48 x i8], [48 x i8]* @.str.8, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 656, i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.mul_and_subT, i64 0, i64 0)) #23, !dbg !743
  unreachable, !dbg !743

cond.end206:                                      ; preds = %cond.end195
  %arrayidx208 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %r, i64 0, i32 0, i64 3, !dbg !744
  %261 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx208, align 8, !dbg !744, !tbaa !170
  %cmp209 = icmp eq %struct.InternalNode* %261, null, !dbg !744
  %cmp213 = icmp eq %struct.InternalNode* %261, %r11.2, !dbg !744
  %or.cond342 = select i1 %cmp209, i1 true, i1 %cmp213, !dbg !744
  br i1 %or.cond342, label %cond.end217, label %cond.false215, !dbg !744

cond.false215:                                    ; preds = %cond.end206
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([48 x i8], [48 x i8]* @.str.9, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 657, i8* noundef getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.mul_and_subT, i64 0, i64 0)) #23, !dbg !744
  unreachable, !dbg !744

cond.end217:                                      ; preds = %cond.end206
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r00.0.r00.0.r00.0.251, metadata !544, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %r00.0.r00.0.r00.0.251, %struct.InternalNode** %arrayidx175, align 8, !dbg !745, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r01.0.r01.0.r01.0.244, metadata !545, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %r01.0.r01.0.r01.0.244, %struct.InternalNode** %arrayidx186, align 8, !dbg !746, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r10.0.r10.0.r10.0.238, metadata !546, metadata !DIExpression()), !dbg !551
  store %struct.InternalNode* %r10.0.r10.0.r10.0.238, %struct.InternalNode** %arrayidx197, align 8, !dbg !747, !tbaa !170
  br label %if.end226.sink.split

if.end226.sink.split:                             ; preds = %cond.end217, %new_internal.exit
  %arrayidx7.i.sink = phi %struct.InternalNode** [ %arrayidx7.i, %new_internal.exit ], [ %arrayidx208, %cond.end217 ]
  %r.addr.1.ph = phi %struct.InternalNode* [ %257, %new_internal.exit ], [ %r, %cond.end217 ]
  store %struct.InternalNode* %r11.2, %struct.InternalNode** %arrayidx7.i.sink, align 8, !dbg !748, !tbaa !170
  br label %if.end226, !dbg !749

if.end226:                                        ; preds = %if.end226.sink.split, %if.then163
  %r.addr.1 = phi %struct.InternalNode* [ null, %if.then163 ], [ %r.addr.1.ph, %if.end226.sink.split ]
  call void @llvm.dbg.value(metadata %struct.InternalNode* %r.addr.1, metadata !538, metadata !DIExpression()), !dbg !551
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %r10.0.r10.0.r10.0..sroa_cast), !dbg !749
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %r01.0.r01.0.r01.0..sroa_cast), !dbg !749
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %r00.0.r00.0.r00.0..sroa_cast), !dbg !749
  br label %return

return:                                           ; preds = %if.end226, %for.cond1.preheader.i, %if.then5
  %retval.0 = phi %struct.InternalNode* [ %r.addr.1, %if.end226 ], [ %r.addr.0, %if.then5 ], [ %r.addr.0, %for.cond1.preheader.i ], !dbg !551
  ret %struct.InternalNode* %retval.0, !dbg !749
}

; Function Attrs: nounwind uwtable
define dso_local %struct.InternalNode* @backsub(i32 noundef %depth, %struct.InternalNode* noundef returned %a, %struct.InternalNode* noundef readonly %l) local_unnamed_addr #8 !dbg !750 {
entry:
  %a00 = alloca %struct.InternalNode*, align 8
  %a01 = alloca %struct.InternalNode*, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !768
  call void @llvm.dbg.value(metadata i32 %depth, metadata !754, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !755, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata %struct.InternalNode* %l, metadata !756, metadata !DIExpression()), !dbg !771
  %cmp.not = icmp eq %struct.InternalNode* %a, null, !dbg !772
  br i1 %cmp.not, label %cond.false, label %cond.end, !dbg !772

cond.false:                                       ; preds = %entry
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.10, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 674, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @__PRETTY_FUNCTION__.backsub, i64 0, i64 0)) #23, !dbg !772
  unreachable, !dbg !772

cond.end:                                         ; preds = %entry
  %cmp1.not = icmp eq %struct.InternalNode* %l, null, !dbg !773
  br i1 %cmp1.not, label %cond.false3, label %cond.end4, !dbg !773

cond.false3:                                      ; preds = %cond.end
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.11, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 675, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @__PRETTY_FUNCTION__.backsub, i64 0, i64 0)) #23, !dbg !773
  unreachable, !dbg !773

cond.end4:                                        ; preds = %cond.end
  %cmp5 = icmp eq i32 %depth, 2, !dbg !774
  br i1 %cmp5, label %if.then, label %if.end, !dbg !775

if.then:                                          ; preds = %cond.end4
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !757, metadata !DIExpression()), !dbg !776
  call void @llvm.dbg.value(metadata %struct.InternalNode* %l, metadata !760, metadata !DIExpression()), !dbg !776
  %arraydecay = bitcast %struct.InternalNode* %a to [4 x double]*, !dbg !777
  %arraydecay7 = bitcast %struct.InternalNode* %l to [4 x double]*, !dbg !778
  call void @llvm.dbg.value(metadata [4 x double]* %arraydecay, metadata !779, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata [4 x double]* %arraydecay7, metadata !784, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i32 0, metadata !785, metadata !DIExpression()) #22, !dbg !788
  %arrayidx24.i = bitcast %struct.InternalNode* %a to double*
  %arrayidx24.1.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 1
  %0 = bitcast %struct.InternalNode* %arrayidx24.1.i to double*
  %arrayidx24.2.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2
  %1 = bitcast %struct.InternalNode* %arrayidx24.2.i to double*
  %arrayidx24.3.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3
  %2 = bitcast %struct.InternalNode* %arrayidx24.3.i to double*
  %arrayidx12.us.i = bitcast %struct.InternalNode* %a to double*
  %arrayidx12.us.i.1 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 1
  %3 = bitcast %struct.InternalNode** %arrayidx12.us.i.1 to double*
  %arrayidx12.us.i.2 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 2
  %4 = bitcast %struct.InternalNode** %arrayidx12.us.i.2 to double*
  br label %for.cond1.preheader.i, !dbg !790

for.cond1.preheader.i:                            ; preds = %for.inc28.i, %if.then
  %indvars.iv67.i = phi i64 [ 0, %if.then ], [ %indvars.iv.next68.i, %for.inc28.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv67.i, metadata !785, metadata !DIExpression()) #22, !dbg !788
  %cmp551.not.i = icmp eq i64 %indvars.iv67.i, 0
  %arrayidx20.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 %indvars.iv67.i
  call void @llvm.dbg.value(metadata i32 0, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i64 0, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i64 0, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i32 0, metadata !787, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i32 0, metadata !787, metadata !DIExpression()) #22, !dbg !788
  br i1 %cmp551.not.i, label %for.cond4.preheader.preheader.i, label %for.cond4.preheader.us.preheader.i, !dbg !792

for.cond4.preheader.us.preheader.i:               ; preds = %for.cond1.preheader.i
  %arrayidx16.us.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 0, i64 %indvars.iv67.i
  %.pre.i = load double, double* %arrayidx16.us.i, align 8, !dbg !799, !tbaa !88
  call void @llvm.dbg.value(metadata i64 0, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 0, !dbg !802
  %5 = load double, double* %arrayidx8.us.i, align 8, !dbg !802, !tbaa !88
  %6 = load double, double* %arrayidx12.us.i, align 8, !dbg !803, !tbaa !88
  %neg.us.i = fneg double %5, !dbg !799
  %7 = tail call double @llvm.fmuladd.f64(double %neg.us.i, double %6, double %.pre.i) #22, !dbg !799
  store double %7, double* %arrayidx16.us.i, align 8, !dbg !799, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %exitcond.not.i = icmp eq i64 %indvars.iv67.i, 1, !dbg !804
  br i1 %exitcond.not.i, label %for.cond4.for.end_crit_edge.us.i, label %for.body6.us.i.1, !dbg !792, !llvm.loop !805

for.cond4.preheader.preheader.i:                  ; preds = %for.cond1.preheader.i
  %8 = load double, double* %arrayidx20.i, align 8, !dbg !807, !tbaa !88
  %9 = load double, double* %arrayidx24.i, align 8, !dbg !808, !tbaa !88
  %div.i = fdiv double %9, %8, !dbg !808
  store double %div.i, double* %arrayidx24.i, align 8, !dbg !808, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i64 1, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i32 0, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %10 = load double, double* %arrayidx20.i, align 8, !dbg !807, !tbaa !88
  %11 = load double, double* %0, align 8, !dbg !808, !tbaa !88
  %div.1.i = fdiv double %11, %10, !dbg !808
  store double %div.1.i, double* %0, align 8, !dbg !808, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i64 2, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i32 0, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %12 = load double, double* %arrayidx20.i, align 8, !dbg !807, !tbaa !88
  %13 = load double, double* %1, align 8, !dbg !808, !tbaa !88
  %div.2.i = fdiv double %13, %12, !dbg !808
  store double %div.2.i, double* %1, align 8, !dbg !808, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i64 3, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i32 0, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %14 = load double, double* %2, align 8, !dbg !808, !tbaa !88
  call void @llvm.dbg.value(metadata i64 4, metadata !786, metadata !DIExpression()) #22, !dbg !788
  br label %for.inc28.i, !dbg !809

for.body6.us.i.1:                                 ; preds = %for.cond4.preheader.us.preheader.i
  call void @llvm.dbg.value(metadata i64 1, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.i.1 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 1, !dbg !802
  %15 = load double, double* %arrayidx8.us.i.1, align 8, !dbg !802, !tbaa !88
  %16 = load double, double* %3, align 8, !dbg !803, !tbaa !88
  %neg.us.i.1 = fneg double %15, !dbg !799
  %17 = tail call double @llvm.fmuladd.f64(double %neg.us.i.1, double %16, double %7) #22, !dbg !799
  store double %17, double* %arrayidx16.us.i, align 8, !dbg !799, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv67.i, 2, !dbg !804
  br i1 %exitcond.not.i.1, label %for.cond4.for.end_crit_edge.us.i, label %for.body6.us.i.2, !dbg !792, !llvm.loop !805

for.body6.us.i.2:                                 ; preds = %for.body6.us.i.1
  call void @llvm.dbg.value(metadata i64 2, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.i.2 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 2, !dbg !802
  %18 = load double, double* %arrayidx8.us.i.2, align 8, !dbg !802, !tbaa !88
  %19 = load double, double* %4, align 8, !dbg !803, !tbaa !88
  %neg.us.i.2 = fneg double %18, !dbg !799
  %20 = tail call double @llvm.fmuladd.f64(double %neg.us.i.2, double %19, double %17) #22, !dbg !799
  store double %20, double* %arrayidx16.us.i, align 8, !dbg !799, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !787, metadata !DIExpression()) #22, !dbg !788
  br label %for.cond4.for.end_crit_edge.us.i

for.cond4.for.end_crit_edge.us.i:                 ; preds = %for.body6.us.i.2, %for.body6.us.i.1, %for.cond4.preheader.us.preheader.i
  %.lcssa = phi double [ %7, %for.cond4.preheader.us.preheader.i ], [ %17, %for.body6.us.i.1 ], [ %20, %for.body6.us.i.2 ], !dbg !799
  %21 = load double, double* %arrayidx20.i, align 8, !dbg !807, !tbaa !88
  %div.us.i = fdiv double %.lcssa, %21, !dbg !808
  store double %div.us.i, double* %arrayidx16.us.i, align 8, !dbg !808, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i64 1, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i32 0, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx16.us.1.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 1, i64 %indvars.iv67.i
  %.pre71.i = load double, double* %arrayidx16.us.1.i, align 8, !dbg !799, !tbaa !88
  %xtraiter = and i64 %indvars.iv67.i, 1, !dbg !792
  %22 = icmp eq i64 %indvars.iv67.i, 1, !dbg !792
  br i1 %22, label %for.cond4.for.end_crit_edge.us.1.i.unr-lcssa, label %for.cond4.for.end_crit_edge.us.i.new, !dbg !792

for.cond4.for.end_crit_edge.us.i.new:             ; preds = %for.cond4.for.end_crit_edge.us.i
  %unroll_iter = and i64 %indvars.iv67.i, 9223372036854775806, !dbg !792
  br label %for.body6.us.1.i, !dbg !792

for.body6.us.1.i:                                 ; preds = %for.body6.us.1.i, %for.cond4.for.end_crit_edge.us.i.new
  %23 = phi double [ %.pre71.i, %for.cond4.for.end_crit_edge.us.i.new ], [ %29, %for.body6.us.1.i ], !dbg !799
  %indvars.iv.1.i = phi i64 [ 0, %for.cond4.for.end_crit_edge.us.i.new ], [ %indvars.iv.next.1.i.1, %for.body6.us.1.i ]
  %niter = phi i64 [ 0, %for.cond4.for.end_crit_edge.us.i.new ], [ %niter.next.1, %for.body6.us.1.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.1.i, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.1.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 %indvars.iv.1.i, !dbg !802
  %24 = load double, double* %arrayidx8.us.1.i, align 8, !dbg !802, !tbaa !88
  %arrayidx12.us.1.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 1, i64 %indvars.iv.1.i, !dbg !803
  %25 = load double, double* %arrayidx12.us.1.i, align 8, !dbg !803, !tbaa !88
  %neg.us.1.i = fneg double %24, !dbg !799
  %26 = tail call double @llvm.fmuladd.f64(double %neg.us.1.i, double %25, double %23) #22, !dbg !799
  store double %26, double* %arrayidx16.us.1.i, align 8, !dbg !799, !tbaa !88
  %indvars.iv.next.1.i = or i64 %indvars.iv.1.i, 1, !dbg !810
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i, metadata !787, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.1.i.1 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 %indvars.iv.next.1.i, !dbg !802
  %27 = load double, double* %arrayidx8.us.1.i.1, align 8, !dbg !802, !tbaa !88
  %arrayidx12.us.1.i.1 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 1, i64 %indvars.iv.next.1.i, !dbg !803
  %28 = load double, double* %arrayidx12.us.1.i.1, align 8, !dbg !803, !tbaa !88
  %neg.us.1.i.1 = fneg double %27, !dbg !799
  %29 = tail call double @llvm.fmuladd.f64(double %neg.us.1.i.1, double %28, double %26) #22, !dbg !799
  store double %29, double* %arrayidx16.us.1.i, align 8, !dbg !799, !tbaa !88
  %indvars.iv.next.1.i.1 = add nuw nsw i64 %indvars.iv.1.i, 2, !dbg !810
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.1.i.1, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %niter.next.1 = add i64 %niter, 2, !dbg !792
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter, !dbg !792
  br i1 %niter.ncmp.1, label %for.cond4.for.end_crit_edge.us.1.i.unr-lcssa, label %for.body6.us.1.i, !dbg !792, !llvm.loop !811

for.cond4.for.end_crit_edge.us.1.i.unr-lcssa:     ; preds = %for.body6.us.1.i, %for.cond4.for.end_crit_edge.us.i
  %.lcssa148.ph = phi double [ undef, %for.cond4.for.end_crit_edge.us.i ], [ %29, %for.body6.us.1.i ]
  %.unr = phi double [ %.pre71.i, %for.cond4.for.end_crit_edge.us.i ], [ %29, %for.body6.us.1.i ]
  %indvars.iv.1.i.unr = phi i64 [ 0, %for.cond4.for.end_crit_edge.us.i ], [ %indvars.iv.next.1.i.1, %for.body6.us.1.i ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0, !dbg !792
  br i1 %lcmp.mod.not, label %for.cond4.for.end_crit_edge.us.1.i, label %for.body6.us.1.i.epil, !dbg !792

for.body6.us.1.i.epil:                            ; preds = %for.cond4.for.end_crit_edge.us.1.i.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.1.i.unr, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.1.i.epil = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 %indvars.iv.1.i.unr, !dbg !802
  %30 = load double, double* %arrayidx8.us.1.i.epil, align 8, !dbg !802, !tbaa !88
  %arrayidx12.us.1.i.epil = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 1, i64 %indvars.iv.1.i.unr, !dbg !803
  %31 = load double, double* %arrayidx12.us.1.i.epil, align 8, !dbg !803, !tbaa !88
  %neg.us.1.i.epil = fneg double %30, !dbg !799
  %32 = tail call double @llvm.fmuladd.f64(double %neg.us.1.i.epil, double %31, double %.unr) #22, !dbg !799
  store double %32, double* %arrayidx16.us.1.i, align 8, !dbg !799, !tbaa !88
  call void @llvm.dbg.value(metadata i64 %indvars.iv.1.i.unr, metadata !787, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !788
  br label %for.cond4.for.end_crit_edge.us.1.i, !dbg !807

for.cond4.for.end_crit_edge.us.1.i:               ; preds = %for.body6.us.1.i.epil, %for.cond4.for.end_crit_edge.us.1.i.unr-lcssa
  %.lcssa148 = phi double [ %.lcssa148.ph, %for.cond4.for.end_crit_edge.us.1.i.unr-lcssa ], [ %32, %for.body6.us.1.i.epil ], !dbg !799
  %33 = load double, double* %arrayidx20.i, align 8, !dbg !807, !tbaa !88
  %div.us.1.i = fdiv double %.lcssa148, %33, !dbg !808
  store double %div.us.1.i, double* %arrayidx16.us.1.i, align 8, !dbg !808, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i64 2, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i32 0, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx16.us.2.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 2, i64 %indvars.iv67.i
  %.pre72.i = load double, double* %arrayidx16.us.2.i, align 8, !dbg !799, !tbaa !88
  %xtraiter152 = and i64 %indvars.iv67.i, 1, !dbg !792
  %34 = icmp eq i64 %indvars.iv67.i, 1, !dbg !792
  br i1 %34, label %for.cond4.for.end_crit_edge.us.2.i.unr-lcssa, label %for.cond4.for.end_crit_edge.us.1.i.new, !dbg !792

for.cond4.for.end_crit_edge.us.1.i.new:           ; preds = %for.cond4.for.end_crit_edge.us.1.i
  %unroll_iter156 = and i64 %indvars.iv67.i, 9223372036854775806, !dbg !792
  br label %for.body6.us.2.i, !dbg !792

for.body6.us.2.i:                                 ; preds = %for.body6.us.2.i, %for.cond4.for.end_crit_edge.us.1.i.new
  %35 = phi double [ %.pre72.i, %for.cond4.for.end_crit_edge.us.1.i.new ], [ %41, %for.body6.us.2.i ], !dbg !799
  %indvars.iv.2.i = phi i64 [ 0, %for.cond4.for.end_crit_edge.us.1.i.new ], [ %indvars.iv.next.2.i.1, %for.body6.us.2.i ]
  %niter157 = phi i64 [ 0, %for.cond4.for.end_crit_edge.us.1.i.new ], [ %niter157.next.1, %for.body6.us.2.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.2.i, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.2.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 %indvars.iv.2.i, !dbg !802
  %36 = load double, double* %arrayidx8.us.2.i, align 8, !dbg !802, !tbaa !88
  %arrayidx12.us.2.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 2, i64 %indvars.iv.2.i, !dbg !803
  %37 = load double, double* %arrayidx12.us.2.i, align 8, !dbg !803, !tbaa !88
  %neg.us.2.i = fneg double %36, !dbg !799
  %38 = tail call double @llvm.fmuladd.f64(double %neg.us.2.i, double %37, double %35) #22, !dbg !799
  store double %38, double* %arrayidx16.us.2.i, align 8, !dbg !799, !tbaa !88
  %indvars.iv.next.2.i = or i64 %indvars.iv.2.i, 1, !dbg !810
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.2.i, metadata !787, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.2.i, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.2.i.1 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 %indvars.iv.next.2.i, !dbg !802
  %39 = load double, double* %arrayidx8.us.2.i.1, align 8, !dbg !802, !tbaa !88
  %arrayidx12.us.2.i.1 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 2, i64 %indvars.iv.next.2.i, !dbg !803
  %40 = load double, double* %arrayidx12.us.2.i.1, align 8, !dbg !803, !tbaa !88
  %neg.us.2.i.1 = fneg double %39, !dbg !799
  %41 = tail call double @llvm.fmuladd.f64(double %neg.us.2.i.1, double %40, double %38) #22, !dbg !799
  store double %41, double* %arrayidx16.us.2.i, align 8, !dbg !799, !tbaa !88
  %indvars.iv.next.2.i.1 = add nuw nsw i64 %indvars.iv.2.i, 2, !dbg !810
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.2.i.1, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %niter157.next.1 = add i64 %niter157, 2, !dbg !792
  %niter157.ncmp.1 = icmp eq i64 %niter157.next.1, %unroll_iter156, !dbg !792
  br i1 %niter157.ncmp.1, label %for.cond4.for.end_crit_edge.us.2.i.unr-lcssa, label %for.body6.us.2.i, !dbg !792, !llvm.loop !812

for.cond4.for.end_crit_edge.us.2.i.unr-lcssa:     ; preds = %for.body6.us.2.i, %for.cond4.for.end_crit_edge.us.1.i
  %.lcssa149.ph = phi double [ undef, %for.cond4.for.end_crit_edge.us.1.i ], [ %41, %for.body6.us.2.i ]
  %.unr153 = phi double [ %.pre72.i, %for.cond4.for.end_crit_edge.us.1.i ], [ %41, %for.body6.us.2.i ]
  %indvars.iv.2.i.unr = phi i64 [ 0, %for.cond4.for.end_crit_edge.us.1.i ], [ %indvars.iv.next.2.i.1, %for.body6.us.2.i ]
  %lcmp.mod154.not = icmp eq i64 %xtraiter152, 0, !dbg !792
  br i1 %lcmp.mod154.not, label %for.cond4.for.end_crit_edge.us.2.i, label %for.body6.us.2.i.epil, !dbg !792

for.body6.us.2.i.epil:                            ; preds = %for.cond4.for.end_crit_edge.us.2.i.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.2.i.unr, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.2.i.epil = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 %indvars.iv.2.i.unr, !dbg !802
  %42 = load double, double* %arrayidx8.us.2.i.epil, align 8, !dbg !802, !tbaa !88
  %arrayidx12.us.2.i.epil = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 2, i64 %indvars.iv.2.i.unr, !dbg !803
  %43 = load double, double* %arrayidx12.us.2.i.epil, align 8, !dbg !803, !tbaa !88
  %neg.us.2.i.epil = fneg double %42, !dbg !799
  %44 = tail call double @llvm.fmuladd.f64(double %neg.us.2.i.epil, double %43, double %.unr153) #22, !dbg !799
  store double %44, double* %arrayidx16.us.2.i, align 8, !dbg !799, !tbaa !88
  call void @llvm.dbg.value(metadata i64 %indvars.iv.2.i.unr, metadata !787, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !788
  br label %for.cond4.for.end_crit_edge.us.2.i, !dbg !807

for.cond4.for.end_crit_edge.us.2.i:               ; preds = %for.body6.us.2.i.epil, %for.cond4.for.end_crit_edge.us.2.i.unr-lcssa
  %.lcssa149 = phi double [ %.lcssa149.ph, %for.cond4.for.end_crit_edge.us.2.i.unr-lcssa ], [ %44, %for.body6.us.2.i.epil ], !dbg !799
  %45 = load double, double* %arrayidx20.i, align 8, !dbg !807, !tbaa !88
  %div.us.2.i = fdiv double %.lcssa149, %45, !dbg !808
  store double %div.us.2.i, double* %arrayidx16.us.2.i, align 8, !dbg !808, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i64 3, metadata !786, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i32 0, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx16.us.3.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 3, i64 %indvars.iv67.i
  %.pre73.i = load double, double* %arrayidx16.us.3.i, align 8, !dbg !799, !tbaa !88
  %xtraiter158 = and i64 %indvars.iv67.i, 1, !dbg !792
  %46 = icmp eq i64 %indvars.iv67.i, 1, !dbg !792
  br i1 %46, label %for.inc28.i.loopexit.unr-lcssa, label %for.cond4.for.end_crit_edge.us.2.i.new, !dbg !792

for.cond4.for.end_crit_edge.us.2.i.new:           ; preds = %for.cond4.for.end_crit_edge.us.2.i
  %unroll_iter162 = and i64 %indvars.iv67.i, 9223372036854775806, !dbg !792
  br label %for.body6.us.3.i, !dbg !792

for.body6.us.3.i:                                 ; preds = %for.body6.us.3.i, %for.cond4.for.end_crit_edge.us.2.i.new
  %47 = phi double [ %.pre73.i, %for.cond4.for.end_crit_edge.us.2.i.new ], [ %53, %for.body6.us.3.i ], !dbg !799
  %indvars.iv.3.i = phi i64 [ 0, %for.cond4.for.end_crit_edge.us.2.i.new ], [ %indvars.iv.next.3.i.1, %for.body6.us.3.i ]
  %niter163 = phi i64 [ 0, %for.cond4.for.end_crit_edge.us.2.i.new ], [ %niter163.next.1, %for.body6.us.3.i ]
  call void @llvm.dbg.value(metadata i64 %indvars.iv.3.i, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.3.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 %indvars.iv.3.i, !dbg !802
  %48 = load double, double* %arrayidx8.us.3.i, align 8, !dbg !802, !tbaa !88
  %arrayidx12.us.3.i = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 3, i64 %indvars.iv.3.i, !dbg !803
  %49 = load double, double* %arrayidx12.us.3.i, align 8, !dbg !803, !tbaa !88
  %neg.us.3.i = fneg double %48, !dbg !799
  %50 = tail call double @llvm.fmuladd.f64(double %neg.us.3.i, double %49, double %47) #22, !dbg !799
  store double %50, double* %arrayidx16.us.3.i, align 8, !dbg !799, !tbaa !88
  %indvars.iv.next.3.i = or i64 %indvars.iv.3.i, 1, !dbg !810
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.3.i, metadata !787, metadata !DIExpression()) #22, !dbg !788
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.3.i, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.3.i.1 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 %indvars.iv.next.3.i, !dbg !802
  %51 = load double, double* %arrayidx8.us.3.i.1, align 8, !dbg !802, !tbaa !88
  %arrayidx12.us.3.i.1 = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 3, i64 %indvars.iv.next.3.i, !dbg !803
  %52 = load double, double* %arrayidx12.us.3.i.1, align 8, !dbg !803, !tbaa !88
  %neg.us.3.i.1 = fneg double %51, !dbg !799
  %53 = tail call double @llvm.fmuladd.f64(double %neg.us.3.i.1, double %52, double %50) #22, !dbg !799
  store double %53, double* %arrayidx16.us.3.i, align 8, !dbg !799, !tbaa !88
  %indvars.iv.next.3.i.1 = add nuw nsw i64 %indvars.iv.3.i, 2, !dbg !810
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next.3.i.1, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %niter163.next.1 = add i64 %niter163, 2, !dbg !792
  %niter163.ncmp.1 = icmp eq i64 %niter163.next.1, %unroll_iter162, !dbg !792
  br i1 %niter163.ncmp.1, label %for.inc28.i.loopexit.unr-lcssa, label %for.body6.us.3.i, !dbg !792, !llvm.loop !813

for.inc28.i.loopexit.unr-lcssa:                   ; preds = %for.body6.us.3.i, %for.cond4.for.end_crit_edge.us.2.i
  %.lcssa150.ph = phi double [ undef, %for.cond4.for.end_crit_edge.us.2.i ], [ %53, %for.body6.us.3.i ]
  %.unr159 = phi double [ %.pre73.i, %for.cond4.for.end_crit_edge.us.2.i ], [ %53, %for.body6.us.3.i ]
  %indvars.iv.3.i.unr = phi i64 [ 0, %for.cond4.for.end_crit_edge.us.2.i ], [ %indvars.iv.next.3.i.1, %for.body6.us.3.i ]
  %lcmp.mod160.not = icmp eq i64 %xtraiter158, 0, !dbg !792
  br i1 %lcmp.mod160.not, label %for.inc28.i, label %for.body6.us.3.i.epil, !dbg !792

for.body6.us.3.i.epil:                            ; preds = %for.inc28.i.loopexit.unr-lcssa
  call void @llvm.dbg.value(metadata i64 %indvars.iv.3.i.unr, metadata !787, metadata !DIExpression()) #22, !dbg !788
  %arrayidx8.us.3.i.epil = getelementptr inbounds [4 x double], [4 x double]* %arraydecay7, i64 %indvars.iv67.i, i64 %indvars.iv.3.i.unr, !dbg !802
  %54 = load double, double* %arrayidx8.us.3.i.epil, align 8, !dbg !802, !tbaa !88
  %arrayidx12.us.3.i.epil = getelementptr inbounds [4 x double], [4 x double]* %arraydecay, i64 3, i64 %indvars.iv.3.i.unr, !dbg !803
  %55 = load double, double* %arrayidx12.us.3.i.epil, align 8, !dbg !803, !tbaa !88
  %neg.us.3.i.epil = fneg double %54, !dbg !799
  %56 = tail call double @llvm.fmuladd.f64(double %neg.us.3.i.epil, double %55, double %.unr159) #22, !dbg !799
  store double %56, double* %arrayidx16.us.3.i, align 8, !dbg !799, !tbaa !88
  call void @llvm.dbg.value(metadata i64 %indvars.iv.3.i.unr, metadata !787, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !788
  br label %for.inc28.i, !dbg !807

for.inc28.i:                                      ; preds = %for.body6.us.3.i.epil, %for.inc28.i.loopexit.unr-lcssa, %for.cond4.preheader.preheader.i
  %.lcssa.sink.i = phi double [ %14, %for.cond4.preheader.preheader.i ], [ %.lcssa150.ph, %for.inc28.i.loopexit.unr-lcssa ], [ %56, %for.body6.us.3.i.epil ]
  %arrayidx16.us.3.sink.i = phi double* [ %2, %for.cond4.preheader.preheader.i ], [ %arrayidx16.us.3.i, %for.inc28.i.loopexit.unr-lcssa ], [ %arrayidx16.us.3.i, %for.body6.us.3.i.epil ]
  %.sink.i = load double, double* %arrayidx20.i, align 8, !dbg !807, !tbaa !88
  %div.us.3.i = fdiv double %.lcssa.sink.i, %.sink.i, !dbg !808
  store double %div.us.3.i, double* %arrayidx16.us.3.sink.i, align 8, !dbg !808, !tbaa !88
  %indvars.iv.next68.i = add nuw nsw i64 %indvars.iv67.i, 1, !dbg !809
  call void @llvm.dbg.value(metadata i64 %indvars.iv.next68.i, metadata !785, metadata !DIExpression()) #22, !dbg !788
  %exitcond70.not.i = icmp eq i64 %indvars.iv.next68.i, 4, !dbg !814
  br i1 %exitcond70.not.i, label %return, label %for.cond1.preheader.i, !dbg !790, !llvm.loop !815

if.end:                                           ; preds = %cond.end4
  %a00.0.a00.0.a00.0..sroa_cast = bitcast %struct.InternalNode** %a00 to i8*, !dbg !817
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %a00.0.a00.0.a00.0..sroa_cast), !dbg !817
  %a01.0.a01.0.a01.0..sroa_cast = bitcast %struct.InternalNode** %a01 to i8*, !dbg !817
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %a01.0.a01.0.a01.0..sroa_cast), !dbg !817
  %dec = add nsw i32 %depth, -1, !dbg !818
  call void @llvm.dbg.value(metadata i32 %dec, metadata !754, metadata !DIExpression()), !dbg !771
  %arrayidx = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 0, !dbg !819
  %57 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx, align 8, !dbg !819, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %57, metadata !761, metadata !DIExpression()), !dbg !771
  store %struct.InternalNode* %57, %struct.InternalNode** %a00, align 8, !dbg !820, !tbaa !170
  %arrayidx9 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 1, !dbg !821
  %58 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx9, align 8, !dbg !821, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %58, metadata !762, metadata !DIExpression()), !dbg !771
  store %struct.InternalNode* %58, %struct.InternalNode** %a01, align 8, !dbg !822, !tbaa !170
  %arrayidx11 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 2, !dbg !823
  %59 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx11, align 8, !dbg !823, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %59, metadata !763, metadata !DIExpression()), !dbg !771
  %arrayidx13 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 3, !dbg !824
  %60 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx13, align 8, !dbg !824, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %60, metadata !764, metadata !DIExpression()), !dbg !771
  %arrayidx15 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %l, i64 0, i32 0, i64 0, !dbg !825
  %61 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx15, align 8, !dbg !825, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %61, metadata !765, metadata !DIExpression()), !dbg !771
  %arrayidx17 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %l, i64 0, i32 0, i64 2, !dbg !826
  %62 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx17, align 8, !dbg !826, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %62, metadata !766, metadata !DIExpression()), !dbg !771
  %arrayidx19 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %l, i64 0, i32 0, i64 3, !dbg !827
  %63 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx19, align 8, !dbg !827, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %63, metadata !767, metadata !DIExpression()), !dbg !771
  %tobool = icmp ne %struct.InternalNode* %61, null, !dbg !828
  %tobool20 = icmp ne %struct.InternalNode* %63, null, !dbg !828
  %or.cond = select i1 %tobool, i1 %tobool20, i1 false, !dbg !828
  br i1 %or.cond, label %cond.end23, label %cond.false22, !dbg !828

cond.false22:                                     ; preds = %if.end
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.12, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 699, i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @__PRETTY_FUNCTION__.backsub, i64 0, i64 0)) #23, !dbg !828
  unreachable, !dbg !828

cond.end23:                                       ; preds = %if.end
  call void @llvm.dbg.value(metadata %struct.InternalNode* %57, metadata !761, metadata !DIExpression()), !dbg !771
  %tobool24.not = icmp eq %struct.InternalNode* %57, null, !dbg !829
  br i1 %tobool24.not, label %if.end26, label %if.then25.tf, !dbg !830

if.then25.tf:                                     ; preds = %cond.end23
  call void @llvm.dbg.value(metadata %struct.InternalNode* %57, metadata !761, metadata !DIExpression()), !dbg !771
  detach within %syncreg, label %det.achd, label %if.end26, !dbg !831

det.achd:                                         ; preds = %if.then25.tf
  %call = tail call %struct.InternalNode* @backsub(i32 noundef %dec, %struct.InternalNode* noundef nonnull %57, %struct.InternalNode* noundef nonnull %61), !dbg !831
  call void @llvm.dbg.value(metadata %struct.InternalNode* %57, metadata !761, metadata !DIExpression()), !dbg !771
  store %struct.InternalNode* %57, %struct.InternalNode** %a00, align 8, !dbg !832, !tbaa !170
  reattach within %syncreg, label %if.end26, !dbg !832

if.end26:                                         ; preds = %det.achd, %if.then25.tf, %cond.end23
  %tobool27.not = icmp eq %struct.InternalNode* %59, null, !dbg !833
  br i1 %tobool27.not, label %if.end32, label %if.then28, !dbg !835

if.then28:                                        ; preds = %if.end26
  %call30 = tail call %struct.InternalNode* @backsub(i32 noundef %dec, %struct.InternalNode* noundef nonnull %59, %struct.InternalNode* noundef nonnull %61), !dbg !836
  call void @llvm.dbg.value(metadata %struct.InternalNode* %59, metadata !763, metadata !DIExpression()), !dbg !771
  br label %if.end32, !dbg !838

if.end32:                                         ; preds = %if.then28, %if.end26
  call void @llvm.dbg.value(metadata %struct.InternalNode* %59, metadata !763, metadata !DIExpression()), !dbg !771
  sync within %syncreg, label %sync.continue, !dbg !839

sync.continue:                                    ; preds = %if.end32
  %a00.0.a00.0.a00.0.97 = load %struct.InternalNode*, %struct.InternalNode** %a00, align 8, !dbg !840, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a00.0.a00.0.a00.0.97, metadata !761, metadata !DIExpression()), !dbg !771
  %tobool33 = icmp ne %struct.InternalNode* %a00.0.a00.0.a00.0.97, null, !dbg !840
  %tobool35 = icmp ne %struct.InternalNode* %62, null
  %or.cond71 = select i1 %tobool33, i1 %tobool35, i1 false, !dbg !842
  br i1 %or.cond71, label %if.then36.tf, label %if.end40, !dbg !842

if.then36.tf:                                     ; preds = %sync.continue
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a00.0.a00.0.a00.0.97, metadata !761, metadata !DIExpression()), !dbg !771
  call void @llvm.dbg.value(metadata %struct.InternalNode* %58, metadata !762, metadata !DIExpression()), !dbg !771
  detach within %syncreg, label %det.achd37, label %if.end40, !dbg !843

det.achd37:                                       ; preds = %if.then36.tf
  %call38 = tail call %struct.InternalNode* @mul_and_subT(i32 noundef %dec, i32 noundef 0, %struct.InternalNode* noundef nonnull %a00.0.a00.0.a00.0.97, %struct.InternalNode* noundef nonnull %62, %struct.InternalNode* noundef %58), !dbg !843
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call38, metadata !762, metadata !DIExpression()), !dbg !771
  store %struct.InternalNode* %call38, %struct.InternalNode** %a01, align 8, !dbg !845, !tbaa !170
  reattach within %syncreg, label %if.end40, !dbg !845

if.end40:                                         ; preds = %det.achd37, %if.then36.tf, %sync.continue
  %tobool41 = icmp ne %struct.InternalNode* %59, null, !dbg !846
  %or.cond72 = select i1 %tobool41, i1 %tobool35, i1 false, !dbg !848
  br i1 %or.cond72, label %if.then44, label %if.end48, !dbg !848

if.then44:                                        ; preds = %if.end40
  %call46 = tail call %struct.InternalNode* @mul_and_subT(i32 noundef %dec, i32 noundef 0, %struct.InternalNode* noundef nonnull %59, %struct.InternalNode* noundef nonnull %62, %struct.InternalNode* noundef %60), !dbg !849
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call46, metadata !764, metadata !DIExpression()), !dbg !771
  br label %if.end48, !dbg !851

if.end48:                                         ; preds = %if.then44, %if.end40
  %a11.0 = phi %struct.InternalNode* [ %call46, %if.then44 ], [ %60, %if.end40 ], !dbg !771
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a11.0, metadata !764, metadata !DIExpression()), !dbg !771
  sync within %syncreg, label %sync.continue49, !dbg !852

sync.continue49:                                  ; preds = %if.end48
  %a01.0.a01.0.a01.0.92 = load %struct.InternalNode*, %struct.InternalNode** %a01, align 8, !dbg !853, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a01.0.a01.0.a01.0.92, metadata !762, metadata !DIExpression()), !dbg !771
  %tobool50.not = icmp eq %struct.InternalNode* %a01.0.a01.0.a01.0.92, null, !dbg !853
  br i1 %tobool50.not, label %if.end55, label %if.then51.tf, !dbg !855

if.then51.tf:                                     ; preds = %sync.continue49
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a01.0.a01.0.a01.0.92, metadata !762, metadata !DIExpression()), !dbg !771
  detach within %syncreg, label %det.achd52, label %if.end55, !dbg !856

det.achd52:                                       ; preds = %if.then51.tf
  %call53 = tail call %struct.InternalNode* @backsub(i32 noundef %dec, %struct.InternalNode* noundef nonnull %a01.0.a01.0.a01.0.92, %struct.InternalNode* noundef nonnull %63), !dbg !856
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a01.0.a01.0.a01.0.92, metadata !762, metadata !DIExpression()), !dbg !771
  reattach within %syncreg, label %if.end55, !dbg !858

if.end55:                                         ; preds = %det.achd52, %if.then51.tf, %sync.continue49
  %tobool56.not = icmp eq %struct.InternalNode* %a11.0, null, !dbg !859
  br i1 %tobool56.not, label %if.end61, label %if.then57, !dbg !861

if.then57:                                        ; preds = %if.end55
  %call59 = tail call %struct.InternalNode* @backsub(i32 noundef %dec, %struct.InternalNode* noundef nonnull %a11.0, %struct.InternalNode* noundef nonnull %63), !dbg !862
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a11.0, metadata !764, metadata !DIExpression()), !dbg !771
  br label %if.end61, !dbg !864

if.end61:                                         ; preds = %if.then57, %if.end55
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a11.0, metadata !764, metadata !DIExpression()), !dbg !771
  sync within %syncreg, label %sync.continue62, !dbg !865

sync.continue62:                                  ; preds = %if.end61
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a00.0.a00.0.a00.0.97, metadata !761, metadata !DIExpression()), !dbg !771
  store %struct.InternalNode* %a00.0.a00.0.a00.0.97, %struct.InternalNode** %arrayidx, align 8, !dbg !866, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a01.0.a01.0.a01.0.92, metadata !762, metadata !DIExpression()), !dbg !771
  store %struct.InternalNode* %a01.0.a01.0.a01.0.92, %struct.InternalNode** %arrayidx9, align 8, !dbg !867, !tbaa !170
  store %struct.InternalNode* %59, %struct.InternalNode** %arrayidx11, align 8, !dbg !868, !tbaa !170
  store %struct.InternalNode* %a11.0, %struct.InternalNode** %arrayidx13, align 8, !dbg !869, !tbaa !170
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %a01.0.a01.0.a01.0..sroa_cast), !dbg !870
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %a00.0.a00.0.a00.0..sroa_cast), !dbg !870
  br label %return

return:                                           ; preds = %sync.continue62, %for.inc28.i
  ret %struct.InternalNode* %a, !dbg !870
}

; Function Attrs: nounwind uwtable
define dso_local %struct.InternalNode* @cholesky(i32 noundef %depth, %struct.InternalNode* noundef returned %a) local_unnamed_addr #8 !dbg !871 {
entry:
  %a00 = alloca %struct.InternalNode*, align 8
  %syncreg = tail call token @llvm.syncregion.start(), !dbg !881
  call void @llvm.dbg.value(metadata i32 %depth, metadata !873, metadata !DIExpression()), !dbg !884
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !874, metadata !DIExpression()), !dbg !884
  %cmp.not = icmp eq %struct.InternalNode* %a, null, !dbg !885
  br i1 %cmp.not, label %cond.false, label %cond.end, !dbg !885

cond.false:                                       ; preds = %entry
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.10, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 739, i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.cholesky, i64 0, i64 0)) #23, !dbg !885
  unreachable, !dbg !885

cond.end:                                         ; preds = %entry
  %cmp1 = icmp eq i32 %depth, 2, !dbg !886
  br i1 %cmp1, label %if.then, label %if.end, !dbg !887

if.then:                                          ; preds = %cond.end
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !875, metadata !DIExpression()), !dbg !888
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !889, metadata !DIExpression()) #22, !dbg !899
  call void @llvm.dbg.value(metadata i32 0, metadata !894, metadata !DIExpression()) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 0, metadata !894, metadata !DIExpression()) #22, !dbg !899
  %arrayidx2.i = bitcast %struct.InternalNode* %a to double*, !dbg !901
  %0 = load double, double* %arrayidx2.i, align 8, !dbg !901, !tbaa !88
  %cmp3.i = fcmp olt double %0, 0.000000e+00, !dbg !903
  br i1 %cmp3.i, label %if.then.i, label %for.cond.loopexit.i, !dbg !904

for.cond.loopexit.i:                              ; preds = %if.then
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a, metadata !889, metadata !DIExpression()) #22, !dbg !899
  %call13.i = tail call double @sqrt(double noundef %0) #22, !dbg !905
  call void @llvm.dbg.value(metadata double %call13.i, metadata !895, metadata !DIExpression()) #22, !dbg !906
  call void @llvm.dbg.value(metadata i64 0, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %1 = load double, double* %arrayidx2.i, align 8, !dbg !907, !tbaa !88
  %div.i = fdiv double %1, %call13.i, !dbg !907
  store double %div.i, double* %arrayidx2.i, align 8, !dbg !907, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %arrayidx20.1176.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 1, !dbg !911
  %2 = bitcast %struct.InternalNode* %arrayidx20.1176.i to double*, !dbg !911
  %3 = load double, double* %2, align 8, !dbg !907, !tbaa !88
  %arrayidx20.2179.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2, !dbg !911
  %4 = bitcast %struct.InternalNode* %arrayidx20.2179.i to double*, !dbg !911
  %5 = load double, double* %4, align 8, !dbg !907, !tbaa !88
  %6 = insertelement <2 x double> poison, double %3, i64 0, !dbg !907
  %7 = insertelement <2 x double> %6, double %5, i64 1, !dbg !907
  %8 = insertelement <2 x double> poison, double %call13.i, i64 0, !dbg !907
  %9 = shufflevector <2 x double> %8, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !907
  %10 = fdiv <2 x double> %7, %9, !dbg !907
  %11 = extractelement <2 x double> %10, i64 0, !dbg !907
  store double %11, double* %2, align 8, !dbg !907, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %12 = extractelement <2 x double> %10, i64 1, !dbg !907
  store double %12, double* %4, align 8, !dbg !907, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %arrayidx20.3183.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, !dbg !911
  %13 = bitcast %struct.InternalNode* %arrayidx20.3183.i to double*, !dbg !911
  %14 = load double, double* %13, align 8, !dbg !907, !tbaa !88
  %div.3184.i = fdiv double %14, %call13.i, !dbg !907
  store double %div.3184.i, double* %13, align 8, !dbg !907, !tbaa !88
  call void @llvm.dbg.value(metadata i64 1, metadata !893, metadata !DIExpression()) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 1, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %arrayidx38.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 1, i32 0, i64 1, !dbg !912
  %15 = bitcast %struct.InternalNode** %arrayidx38.i to double*, !dbg !912
  %16 = load double, double* %15, align 8, !dbg !919, !tbaa !88
  %neg.i = fneg double %11, !dbg !919
  %17 = tail call double @llvm.fmuladd.f64(double %neg.i, double %11, double %16) #22, !dbg !919
  store double %17, double* %15, align 8, !dbg !919, !tbaa !88
  %arrayidx38.1161.phi.trans.insert.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2, i32 0, i64 1
  %18 = bitcast %struct.InternalNode** %arrayidx38.1161.phi.trans.insert.i to double*
  call void @llvm.dbg.value(metadata i64 2, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %neg.1162.i = fneg double %12, !dbg !919
  %arrayidx38.2169.phi.trans.insert.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, i32 0, i64 1
  %19 = bitcast %struct.InternalNode** %arrayidx38.2169.phi.trans.insert.i to double*
  call void @llvm.dbg.value(metadata i64 3, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %neg.2170.i = fneg double %div.3184.i, !dbg !919
  call void @llvm.dbg.value(metadata i64 2, metadata !893, metadata !DIExpression()) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 2, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %arrayidx38.1133.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 2, i32 0, i64 2, !dbg !912
  %20 = bitcast %struct.InternalNode** %arrayidx38.1133.i to double*, !dbg !912
  %21 = bitcast %struct.InternalNode** %arrayidx38.1161.phi.trans.insert.i to <2 x double>*, !dbg !919
  %22 = load <2 x double>, <2 x double>* %21, align 8, !dbg !919, !tbaa !88
  %23 = insertelement <2 x double> poison, double %neg.1162.i, i64 0, !dbg !919
  %24 = shufflevector <2 x double> %23, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !919
  %25 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %24, <2 x double> %10, <2 x double> %22), !dbg !919
  store <2 x double> %25, <2 x double>* %21, align 8, !dbg !919, !tbaa !88
  %arrayidx38.1133.1.phi.trans.insert.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, i32 0, i64 2
  %26 = bitcast %struct.InternalNode** %arrayidx38.1133.1.phi.trans.insert.i to double*
  %27 = bitcast %struct.InternalNode** %arrayidx38.2169.phi.trans.insert.i to <2 x double>*, !dbg !919
  %28 = load <2 x double>, <2 x double>* %27, align 8, !dbg !919, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %29 = insertelement <2 x double> poison, double %neg.2170.i, i64 0, !dbg !919
  %30 = shufflevector <2 x double> %29, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !919
  %31 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %30, <2 x double> %10, <2 x double> %28), !dbg !919
  store <2 x double> %31, <2 x double>* %27, align 8, !dbg !919, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !893, metadata !DIExpression()) #22, !dbg !899
  %arrayidx38.2145.i = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 3, i32 0, i64 3, !dbg !912
  %32 = bitcast %struct.InternalNode** %arrayidx38.2145.i to double*, !dbg !912
  %33 = load double, double* %32, align 8, !dbg !919, !tbaa !88
  %34 = tail call double @llvm.fmuladd.f64(double %neg.2170.i, double %div.3184.i, double %33) #22, !dbg !919
  store double %34, double* %32, align 8, !dbg !919, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !892, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 4, metadata !893, metadata !DIExpression()) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 1, metadata !894, metadata !DIExpression()) #22, !dbg !899
  %cmp3.1.i = fcmp olt double %17, 0.000000e+00, !dbg !903
  br i1 %cmp3.1.i, label %if.then.i, label %for.cond.loopexit.1.i, !dbg !904

for.cond.loopexit.1.i:                            ; preds = %for.cond.loopexit.i
  %call13.1.i = tail call double @sqrt(double noundef %17) #22, !dbg !905
  call void @llvm.dbg.value(metadata double %call13.1.i, metadata !895, metadata !DIExpression()) #22, !dbg !906
  call void @llvm.dbg.value(metadata i64 1, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %35 = load double, double* %15, align 8, !dbg !907, !tbaa !88
  %div.1.i = fdiv double %35, %call13.1.i, !dbg !907
  store double %div.1.i, double* %15, align 8, !dbg !907, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %36 = load double, double* %18, align 8, !dbg !907, !tbaa !88
  %37 = load double, double* %19, align 8, !dbg !907, !tbaa !88
  %38 = insertelement <2 x double> poison, double %36, i64 0, !dbg !907
  %39 = insertelement <2 x double> %38, double %37, i64 1, !dbg !907
  %40 = insertelement <2 x double> poison, double %call13.1.i, i64 0, !dbg !907
  %41 = shufflevector <2 x double> %40, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !907
  %42 = fdiv <2 x double> %39, %41, !dbg !907
  %43 = extractelement <2 x double> %42, i64 0, !dbg !907
  store double %43, double* %18, align 8, !dbg !907, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %44 = extractelement <2 x double> %42, i64 1, !dbg !907
  store double %44, double* %19, align 8, !dbg !907, !tbaa !88
  call void @llvm.dbg.value(metadata i64 2, metadata !893, metadata !DIExpression()) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 2, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %45 = load double, double* %20, align 8, !dbg !919, !tbaa !88
  %neg.1.i = fneg double %43, !dbg !919
  %46 = tail call double @llvm.fmuladd.f64(double %neg.1.i, double %43, double %45) #22, !dbg !919
  store double %46, double* %20, align 8, !dbg !919, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %neg.1.1123.i = fneg double %44, !dbg !919
  call void @llvm.dbg.value(metadata i64 3, metadata !893, metadata !DIExpression()) #22, !dbg !899
  %47 = bitcast %struct.InternalNode** %arrayidx38.1133.1.phi.trans.insert.i to <2 x double>*, !dbg !919
  %48 = load <2 x double>, <2 x double>* %47, align 8, !dbg !919, !tbaa !88
  %49 = insertelement <2 x double> poison, double %neg.1.1123.i, i64 0, !dbg !919
  %50 = shufflevector <2 x double> %49, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !919
  %51 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %50, <2 x double> %42, <2 x double> %48), !dbg !919
  store <2 x double> %51, <2 x double>* %47, align 8, !dbg !919, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !892, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 4, metadata !893, metadata !DIExpression()) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 2, metadata !894, metadata !DIExpression()) #22, !dbg !899
  %cmp3.2.i = fcmp olt double %46, 0.000000e+00, !dbg !903
  br i1 %cmp3.2.i, label %if.then.i, label %for.cond.loopexit.2.i, !dbg !904

for.cond.loopexit.2.i:                            ; preds = %for.cond.loopexit.1.i
  %call13.2.i = tail call double @sqrt(double noundef %46) #22, !dbg !905
  call void @llvm.dbg.value(metadata double %call13.2.i, metadata !895, metadata !DIExpression()) #22, !dbg !906
  call void @llvm.dbg.value(metadata i64 2, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %52 = load double, double* %20, align 8, !dbg !907, !tbaa !88
  %div.2.i = fdiv double %52, %call13.2.i, !dbg !907
  store double %div.2.i, double* %20, align 8, !dbg !907, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %53 = load double, double* %26, align 8, !dbg !907, !tbaa !88
  %div.2.1.i = fdiv double %53, %call13.2.i, !dbg !907
  store double %div.2.1.i, double* %26, align 8, !dbg !907, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !893, metadata !DIExpression()) #22, !dbg !899
  %54 = load double, double* %32, align 8, !dbg !919, !tbaa !88
  %neg.2.i = fneg double %div.2.1.i, !dbg !919
  %55 = tail call double @llvm.fmuladd.f64(double %neg.2.i, double %div.2.1.i, double %54) #22, !dbg !919
  store double %55, double* %32, align 8, !dbg !919, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !892, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 3, metadata !893, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 3, metadata !894, metadata !DIExpression()) #22, !dbg !899
  %cmp3.3.i = fcmp olt double %55, 0.000000e+00, !dbg !903
  br i1 %cmp3.3.i, label %if.then.i, label %block_cholesky.exit, !dbg !904

if.then.i:                                        ; preds = %for.cond.loopexit.2.i, %for.cond.loopexit.1.i, %for.cond.loopexit.i, %if.then
  %.lcssa.i = phi double [ %0, %if.then ], [ %17, %for.cond.loopexit.i ], [ %46, %for.cond.loopexit.1.i ], [ %55, %for.cond.loopexit.2.i ], !dbg !901
  %call.i = tail call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([16 x i8], [16 x i8]* @.str.44, i64 0, i64 0), double noundef %.lcssa.i) #22, !dbg !920
  %puts94.i = tail call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([42 x i8], [42 x i8]* @str.49, i64 0, i64 0)) #22, !dbg !922
  tail call void @exit(i32 noundef 9) #23, !dbg !923
  unreachable, !dbg !923

block_cholesky.exit:                              ; preds = %for.cond.loopexit.2.i
  %call13.3.i = tail call double @sqrt(double noundef %55) #22, !dbg !905
  call void @llvm.dbg.value(metadata double %call13.3.i, metadata !895, metadata !DIExpression()) #22, !dbg !906
  call void @llvm.dbg.value(metadata i64 3, metadata !892, metadata !DIExpression()) #22, !dbg !899
  %56 = load double, double* %32, align 8, !dbg !907, !tbaa !88
  %div.3.i = fdiv double %56, %call13.3.i, !dbg !907
  store double %div.3.i, double* %32, align 8, !dbg !907, !tbaa !88
  call void @llvm.dbg.value(metadata i64 3, metadata !892, metadata !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value)) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 4, metadata !893, metadata !DIExpression()) #22, !dbg !899
  call void @llvm.dbg.value(metadata i64 4, metadata !894, metadata !DIExpression()) #22, !dbg !899
  br label %return

if.end:                                           ; preds = %cond.end
  %a00.0.a00.0.a00.0..sroa_cast = bitcast %struct.InternalNode** %a00 to i8*, !dbg !924
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %a00.0.a00.0.a00.0..sroa_cast), !dbg !924
  %dec = add nsw i32 %depth, -1, !dbg !925
  call void @llvm.dbg.value(metadata i32 %dec, metadata !873, metadata !DIExpression()), !dbg !884
  %arrayidx = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 0, !dbg !926
  %57 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx, align 8, !dbg !926, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %57, metadata !878, metadata !DIExpression()), !dbg !884
  store %struct.InternalNode* %57, %struct.InternalNode** %a00, align 8, !dbg !927, !tbaa !170
  %arrayidx3 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 2, !dbg !928
  %58 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx3, align 8, !dbg !928, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %58, metadata !879, metadata !DIExpression()), !dbg !884
  %arrayidx5 = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a, i64 0, i32 0, i64 3, !dbg !929
  %59 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx5, align 8, !dbg !929, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %59, metadata !880, metadata !DIExpression()), !dbg !884
  %tobool.not = icmp eq %struct.InternalNode* %57, null, !dbg !930
  br i1 %tobool.not, label %cond.false7, label %cond.end8, !dbg !930

cond.false7:                                      ; preds = %if.end
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 756, i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.cholesky, i64 0, i64 0)) #23, !dbg !930
  unreachable, !dbg !930

cond.end8:                                        ; preds = %if.end
  %tobool9.not = icmp eq %struct.InternalNode* %58, null, !dbg !931
  br i1 %tobool9.not, label %if.then10.tf, label %cond.end23, !dbg !932

if.then10.tf:                                     ; preds = %cond.end8
  call void @llvm.dbg.value(metadata %struct.InternalNode* %57, metadata !878, metadata !DIExpression()), !dbg !884
  detach within %syncreg, label %det.achd, label %det.cont, !dbg !933

det.achd:                                         ; preds = %if.then10.tf
  %call = tail call %struct.InternalNode* @cholesky(i32 noundef %dec, %struct.InternalNode* noundef nonnull %57), !dbg !933
  call void @llvm.dbg.value(metadata %struct.InternalNode* %57, metadata !878, metadata !DIExpression()), !dbg !884
  store %struct.InternalNode* %57, %struct.InternalNode** %a00, align 8, !dbg !934, !tbaa !170
  reattach within %syncreg, label %det.cont, !dbg !934

det.cont:                                         ; preds = %det.achd, %if.then10.tf
  %call11 = tail call %struct.InternalNode* @cholesky(i32 noundef %dec, %struct.InternalNode* noundef %59), !dbg !935
  call void @llvm.dbg.value(metadata %struct.InternalNode* %59, metadata !880, metadata !DIExpression()), !dbg !884
  sync within %syncreg, label %if.end36, !dbg !936

cond.end23:                                       ; preds = %cond.end8
  %call12 = tail call %struct.InternalNode* @cholesky(i32 noundef %dec, %struct.InternalNode* noundef nonnull %57), !dbg !937
  call void @llvm.dbg.value(metadata %struct.InternalNode* %57, metadata !878, metadata !DIExpression()), !dbg !884
  store %struct.InternalNode* %57, %struct.InternalNode** %a00, align 8, !dbg !939, !tbaa !170
  %call18 = tail call %struct.InternalNode* @backsub(i32 noundef %dec, %struct.InternalNode* noundef nonnull %58, %struct.InternalNode* noundef nonnull %57), !dbg !940
  call void @llvm.dbg.value(metadata %struct.InternalNode* %58, metadata !879, metadata !DIExpression()), !dbg !884
  %call24 = tail call %struct.InternalNode* @mul_and_subT(i32 noundef %dec, i32 noundef 1, %struct.InternalNode* noundef nonnull %58, %struct.InternalNode* noundef nonnull %58, %struct.InternalNode* noundef %59), !dbg !941
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call24, metadata !880, metadata !DIExpression()), !dbg !884
  %tobool25.not = icmp eq %struct.InternalNode* %call24, null, !dbg !942
  br i1 %tobool25.not, label %cond.false27, label %cond.end29, !dbg !942

cond.false27:                                     ; preds = %cond.end23
  tail call void @__assert_fail(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.15, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 771, i8* noundef getelementptr inbounds ([29 x i8], [29 x i8]* @__PRETTY_FUNCTION__.cholesky, i64 0, i64 0)) #23, !dbg !942
  unreachable, !dbg !942

cond.end29:                                       ; preds = %cond.end23
  %call30 = tail call %struct.InternalNode* @cholesky(i32 noundef %dec, %struct.InternalNode* noundef nonnull %call24), !dbg !943
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call24, metadata !880, metadata !DIExpression()), !dbg !884
  br label %if.end36, !dbg !944

if.end36:                                         ; preds = %cond.end29, %det.cont
  %a11.0 = phi %struct.InternalNode* [ %call24, %cond.end29 ], [ %59, %det.cont ], !dbg !945
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a11.0, metadata !880, metadata !DIExpression()), !dbg !884
  call void @llvm.dbg.value(metadata %struct.InternalNode* %58, metadata !879, metadata !DIExpression()), !dbg !884
  %a00.0.a00.0.a00.0.59 = load %struct.InternalNode*, %struct.InternalNode** %a00, align 8, !dbg !946, !tbaa !170
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a00.0.a00.0.a00.0.59, metadata !878, metadata !DIExpression()), !dbg !884
  store %struct.InternalNode* %a00.0.a00.0.a00.0.59, %struct.InternalNode** %arrayidx, align 8, !dbg !947, !tbaa !170
  store %struct.InternalNode* %58, %struct.InternalNode** %arrayidx3, align 8, !dbg !948, !tbaa !170
  store %struct.InternalNode* %a11.0, %struct.InternalNode** %arrayidx5, align 8, !dbg !949, !tbaa !170
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %a00.0.a00.0.a00.0..sroa_cast), !dbg !950
  br label %return

return:                                           ; preds = %if.end36, %block_cholesky.exit
  ret %struct.InternalNode* %a, !dbg !950
}

; Function Attrs: nofree norecurse nosync nounwind readnone uwtable
define dso_local i32 @logarithm(i32 noundef %size) local_unnamed_addr #15 !dbg !951 {
entry:
  call void @llvm.dbg.value(metadata i32 %size, metadata !955, metadata !DIExpression()), !dbg !957
  call void @llvm.dbg.value(metadata i32 0, metadata !956, metadata !DIExpression()), !dbg !957
  br label %while.cond, !dbg !958

while.cond:                                       ; preds = %while.cond, %entry
  %k.0 = phi i32 [ 0, %entry ], [ %inc, %while.cond ], !dbg !957
  call void @llvm.dbg.value(metadata i32 %k.0, metadata !956, metadata !DIExpression()), !dbg !957
  %shl = shl nuw i32 1, %k.0, !dbg !959
  %cmp = icmp slt i32 %shl, %size, !dbg !960
  %inc = add nuw nsw i32 %k.0, 1, !dbg !961
  call void @llvm.dbg.value(metadata i32 %inc, metadata !956, metadata !DIExpression()), !dbg !957
  br i1 %cmp, label %while.cond, label %while.end, !dbg !958, !llvm.loop !962

while.end:                                        ; preds = %while.cond
  ret i32 %k.0, !dbg !963
}

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @usage() local_unnamed_addr #12 !dbg !964 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !966, !tbaa !170
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([480 x i8], [480 x i8]* @.str.16, i64 0, i64 0), i64 479, i64 1, %struct._IO_FILE* %0) #24, !dbg !967
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !968, !tbaa !170
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([279 x i8], [279 x i8]* @.str.17, i64 0, i64 0), i64 278, i64 1, %struct._IO_FILE* %2) #24, !dbg !969
  ret i32 1, !dbg !970
}

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @fprintf(%struct._IO_FILE* nocapture noundef, i8* nocapture noundef readonly, ...) local_unnamed_addr #13

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, i8** noundef %argv) local_unnamed_addr #8 !dbg !971 {
entry:
  %size = alloca i32, align 4
  %nonzeros = alloca i32, align 4
  %benchmark = alloca i32, align 4
  %help = alloca i32, align 4
  %check = alloca i32, align 4
  %round = alloca i32, align 4
  %buf = alloca [1000 x i8], align 16
  %filename = alloca [100 x i8], align 16
  %sizex = alloca i32, align 4
  %sizey = alloca i32, align 4
  %fr = alloca double, align 8
  %fc = alloca double, align 8
  %val = alloca double, align 8
  %t1 = alloca %struct.timeval, align 8
  %t2 = alloca %struct.timeval, align 8
  call void @llvm.dbg.value(metadata i32 %argc, metadata !977, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i8** %argv, metadata !978, metadata !DIExpression()), !dbg !1090
  %0 = bitcast i32* %size to i8*, !dbg !1091
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %0) #22, !dbg !1091
  %1 = bitcast i32* %nonzeros to i8*, !dbg !1091
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #22, !dbg !1091
  %2 = bitcast i32* %benchmark to i8*, !dbg !1091
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #22, !dbg !1091
  %3 = bitcast i32* %help to i8*, !dbg !1091
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #22, !dbg !1091
  %4 = bitcast i32* %check to i8*, !dbg !1091
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #22, !dbg !1091
  call void @llvm.dbg.value(metadata i32 1, metadata !987, metadata !DIExpression()), !dbg !1090
  store i32 1, i32* %check, align 4, !dbg !1092, !tbaa !1093
  %5 = bitcast i32* %round to i8*, !dbg !1091
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #22, !dbg !1091
  call void @llvm.dbg.value(metadata i32 1, metadata !988, metadata !DIExpression()), !dbg !1090
  store i32 1, i32* %round, align 4, !dbg !1095, !tbaa !1093
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !993, metadata !DIExpression()), !dbg !1090
  %6 = getelementptr inbounds [1000 x i8], [1000 x i8]* %buf, i64 0, i64 0, !dbg !1096
  call void @llvm.lifetime.start.p0i8(i64 1000, i8* nonnull %6) #22, !dbg !1096
  call void @llvm.dbg.declare(metadata [1000 x i8]* %buf, metadata !994, metadata !DIExpression()), !dbg !1097
  %7 = getelementptr inbounds [100 x i8], [100 x i8]* %filename, i64 0, i64 0, !dbg !1096
  call void @llvm.lifetime.start.p0i8(i64 100, i8* nonnull %7) #22, !dbg !1096
  call void @llvm.dbg.declare(metadata [100 x i8]* %filename, metadata !998, metadata !DIExpression()), !dbg !1098
  %8 = bitcast i32* %sizex to i8*, !dbg !1099
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #22, !dbg !1099
  %9 = bitcast i32* %sizey to i8*, !dbg !1099
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #22, !dbg !1099
  store i8 0, i8* %7, align 16, !dbg !1100, !tbaa !1101
  call void @llvm.dbg.value(metadata i32 500, metadata !981, metadata !DIExpression()), !dbg !1090
  store i32 500, i32* %size, align 4, !dbg !1102, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 1000, metadata !983, metadata !DIExpression()), !dbg !1090
  store i32 1000, i32* %nonzeros, align 4, !dbg !1103, !tbaa !1093
  call void @llvm.dbg.value(metadata i32* %size, metadata !981, metadata !DIExpression(DW_OP_deref)), !dbg !1090
  call void @llvm.dbg.value(metadata i32* %nonzeros, metadata !983, metadata !DIExpression(DW_OP_deref)), !dbg !1090
  call void @llvm.dbg.value(metadata i32* %benchmark, metadata !985, metadata !DIExpression(DW_OP_deref)), !dbg !1090
  call void @llvm.dbg.value(metadata i32* %help, metadata !986, metadata !DIExpression(DW_OP_deref)), !dbg !1090
  call void @llvm.dbg.value(metadata i32* %check, metadata !987, metadata !DIExpression(DW_OP_deref)), !dbg !1090
  call void @llvm.dbg.value(metadata i32* %round, metadata !988, metadata !DIExpression(DW_OP_deref)), !dbg !1090
  call void (i32, i8**, i8**, i32*, ...) @get_options(i32 noundef %argc, i8** noundef %argv, i8** noundef getelementptr inbounds ([8 x i8*], [8 x i8*]* @specifiers, i64 0, i64 0), i32* noundef getelementptr inbounds ([8 x i32], [8 x i32]* @opt_types, i64 0, i64 0), i32* noundef nonnull %size, i32* noundef nonnull %nonzeros, i32* noundef nonnull %check, i8* noundef nonnull %7, i32* noundef nonnull %benchmark, i32* noundef nonnull %help, i32* noundef nonnull %round) #22, !dbg !1104
  call void @startup_cilk(), !dbg !1105
  call void @llvm.dbg.value(metadata i32 0, metadata !1061, metadata !DIExpression()), !dbg !1106
  call void @llvm.dbg.value(metadata double 0.000000e+00, metadata !993, metadata !DIExpression()), !dbg !1090
  %10 = load i32, i32* %round, align 4, !dbg !1107, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %10, metadata !988, metadata !DIExpression()), !dbg !1090
  %cmp407 = icmp sgt i32 %10, 0, !dbg !1108
  br i1 %cmp407, label %for.body.lr.ph, label %cleanup150, !dbg !1109

for.body.lr.ph:                                   ; preds = %entry
  %11 = bitcast double* %fr to i8*
  %12 = bitcast double* %fc to i8*
  %13 = bitcast double* %val to i8*
  %tv_sec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 0
  %tv_usec.i = getelementptr inbounds %struct.timeval, %struct.timeval* %t2, i64 0, i32 1
  %tv_sec.i272 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 0
  %tv_usec.i274 = getelementptr inbounds %struct.timeval, %struct.timeval* %t1, i64 0, i32 1
  br label %for.body, !dbg !1109

for.body:                                         ; preds = %if.end141, %for.body.lr.ph
  %error.0409 = phi double [ 0.000000e+00, %for.body.lr.ph ], [ %error.1, %if.end141 ]
  %r.0408 = phi i32 [ 0, %for.body.lr.ph ], [ %inc149, %if.end141 ]
  call void @llvm.dbg.value(metadata double %error.0409, metadata !993, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 %r.0408, metadata !1061, metadata !DIExpression()), !dbg !1106
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !979, metadata !DIExpression()), !dbg !1090
  %14 = load i32, i32* %help, align 4, !dbg !1110, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %14, metadata !986, metadata !DIExpression()), !dbg !1090
  %tobool.not = icmp eq i32 %14, 0, !dbg !1110
  br i1 %tobool.not, label %if.end, label %if.then, !dbg !1112

if.then:                                          ; preds = %for.body
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1113, !tbaa !170
  %16 = call i64 @fwrite(i8* getelementptr inbounds ([480 x i8], [480 x i8]* @.str.16, i64 0, i64 0), i64 479, i64 1, %struct._IO_FILE* %15) #25, !dbg !1115
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1116, !tbaa !170
  %18 = call i64 @fwrite(i8* getelementptr inbounds ([279 x i8], [279 x i8]* @.str.17, i64 0, i64 0), i64 278, i64 1, %struct._IO_FILE* %17) #25, !dbg !1117
  br label %cleanup150, !dbg !1118

if.end:                                           ; preds = %for.body
  %19 = load i32, i32* %benchmark, align 4, !dbg !1119, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %19, metadata !985, metadata !DIExpression()), !dbg !1090
  switch i32 %19, label %if.end8 [
    i32 3, label %sw.bb6
    i32 1, label %sw.bb
    i32 2, label %sw.bb4
  ], !dbg !1121

sw.bb:                                            ; preds = %if.end
  store i8 0, i8* %7, align 16, !dbg !1122, !tbaa !1101
  call void @llvm.dbg.value(metadata i32 128, metadata !981, metadata !DIExpression()), !dbg !1090
  store i32 128, i32* %size, align 4, !dbg !1125, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 100, metadata !983, metadata !DIExpression()), !dbg !1090
  store i32 100, i32* %nonzeros, align 4, !dbg !1126, !tbaa !1093
  br label %if.else, !dbg !1127

sw.bb4:                                           ; preds = %if.end
  store i8 0, i8* %7, align 16, !dbg !1128, !tbaa !1101
  call void @llvm.dbg.value(metadata i32 1000, metadata !981, metadata !DIExpression()), !dbg !1090
  store i32 1000, i32* %size, align 4, !dbg !1129, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 10000, metadata !983, metadata !DIExpression()), !dbg !1090
  store i32 10000, i32* %nonzeros, align 4, !dbg !1130, !tbaa !1093
  br label %if.else, !dbg !1131

sw.bb6:                                           ; preds = %if.end
  store i8 0, i8* %7, align 16, !dbg !1132, !tbaa !1101
  call void @llvm.dbg.value(metadata i32 2000, metadata !981, metadata !DIExpression()), !dbg !1090
  store i32 2000, i32* %size, align 4, !dbg !1133, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 10000, metadata !983, metadata !DIExpression()), !dbg !1090
  store i32 10000, i32* %nonzeros, align 4, !dbg !1134, !tbaa !1093
  br label %if.else, !dbg !1135

if.end8:                                          ; preds = %if.end
  %.pr = load i8, i8* %7, align 16, !dbg !1136, !tbaa !1101
  %tobool10.not = icmp eq i8 %.pr, 0, !dbg !1136
  br i1 %tobool10.not, label %if.end8.if.else_crit_edge, label %if.then11, !dbg !1137

if.end8.if.else_crit_edge:                        ; preds = %if.end8
  %.pre = load i32, i32* %size, align 4, !dbg !1138, !tbaa !1093
  br label %if.else, !dbg !1137

if.then11:                                        ; preds = %if.end8
  %call13 = call %struct._IO_FILE* @fopen(i8* noundef nonnull %7, i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.25, i64 0, i64 0)), !dbg !1139
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call13, metadata !1004, metadata !DIExpression()), !dbg !1090
  %cmp14 = icmp eq %struct._IO_FILE* %call13, null, !dbg !1140
  br i1 %cmp14, label %if.then15, label %do.body, !dbg !1142

if.then15:                                        ; preds = %if.then11
  %puts256 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([18 x i8], [18 x i8]* @str.51, i64 0, i64 0)), !dbg !1143
  br label %cleanup150, !dbg !1145

do.body:                                          ; preds = %do.body, %if.then11
  %call19 = call i8* @fgets(i8* noundef nonnull %6, i32 noundef 1000, %struct._IO_FILE* noundef nonnull %call13), !dbg !1146
  %20 = load i8, i8* %6, align 16, !dbg !1147, !tbaa !1101
  %cmp21 = icmp eq i8 %20, 37, !dbg !1148
  br i1 %cmp21, label %do.body, label %do.end, !dbg !1146, !llvm.loop !1149

do.end:                                           ; preds = %do.body
  call void @llvm.dbg.value(metadata i32* %sizex, metadata !1002, metadata !DIExpression(DW_OP_deref)), !dbg !1090
  call void @llvm.dbg.value(metadata i32* %sizey, metadata !1003, metadata !DIExpression(DW_OP_deref)), !dbg !1090
  %call24 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* noundef nonnull %6, i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.27, i64 0, i64 0), i32* noundef nonnull %sizex, i32* noundef nonnull %sizey) #22, !dbg !1152
  %21 = load i32, i32* %sizex, align 4, !dbg !1153, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %21, metadata !1002, metadata !DIExpression()), !dbg !1090
  %22 = load i32, i32* %sizey, align 4, !dbg !1153, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %22, metadata !1003, metadata !DIExpression()), !dbg !1090
  %cmp25 = icmp eq i32 %21, %22, !dbg !1153
  br i1 %cmp25, label %cond.end, label %cond.false, !dbg !1153

cond.false:                                       ; preds = %do.end
  call void @__assert_fail(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.28, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 887, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #23, !dbg !1153
  unreachable, !dbg !1153

cond.end:                                         ; preds = %do.end
  call void @llvm.dbg.value(metadata i32 %21, metadata !981, metadata !DIExpression()), !dbg !1090
  store i32 %21, i32* %size, align 4, !dbg !1154, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %21, metadata !955, metadata !DIExpression()), !dbg !1155
  call void @llvm.dbg.value(metadata i32 0, metadata !956, metadata !DIExpression()), !dbg !1155
  br label %while.cond.i, !dbg !1157

while.cond.i:                                     ; preds = %while.cond.i, %cond.end
  %k.0.i = phi i32 [ 0, %cond.end ], [ %inc.i, %while.cond.i ], !dbg !1155
  call void @llvm.dbg.value(metadata i32 %k.0.i, metadata !956, metadata !DIExpression()), !dbg !1155
  %shl.i = shl nuw i32 1, %k.0.i, !dbg !1158
  %cmp.i = icmp slt i32 %shl.i, %21, !dbg !1159
  %inc.i = add nuw nsw i32 %k.0.i, 1, !dbg !1160
  call void @llvm.dbg.value(metadata i32 %inc.i, metadata !956, metadata !DIExpression()), !dbg !1155
  br i1 %cmp.i, label %while.cond.i, label %logarithm.exit, !dbg !1157, !llvm.loop !1161

logarithm.exit:                                   ; preds = %while.cond.i
  call void @llvm.dbg.value(metadata i32 %k.0.i, metadata !982, metadata !DIExpression()), !dbg !1090
  call void @srand(i32 noundef 61066) #22, !dbg !1162
  call void @llvm.dbg.value(metadata i32 61066, metadata !124, metadata !DIExpression()), !dbg !1163
  store i64 61066, i64* @rand_nxt, align 8, !dbg !1165, !tbaa !112
  call void @llvm.dbg.value(metadata i32 0, metadata !983, metadata !DIExpression()), !dbg !1090
  store i32 0, i32* %nonzeros, align 4, !dbg !1166, !tbaa !1093
  br label %while.cond, !dbg !1167

while.cond:                                       ; preds = %cleanup, %logarithm.exit
  %A.0 = phi %struct.InternalNode* [ null, %logarithm.exit ], [ %call72, %cleanup ], !dbg !1168
  call void @llvm.dbg.value(metadata %struct.InternalNode* %A.0, metadata !979, metadata !DIExpression()), !dbg !1090
  %call28 = call i32 @feof(%struct._IO_FILE* noundef nonnull %call13) #22, !dbg !1169
  %tobool29.not = icmp eq i32 %call28, 0, !dbg !1170
  br i1 %tobool29.not, label %while.body, label %if.end107, !dbg !1167

while.body:                                       ; preds = %while.cond
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %11) #22, !dbg !1171
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #22, !dbg !1171
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %13) #22, !dbg !1172
  %call32 = call i8* @fgets(i8* noundef nonnull %6, i32 noundef 1000, %struct._IO_FILE* noundef nonnull %call13), !dbg !1173
  call void @llvm.dbg.value(metadata double* %fr, metadata !1063, metadata !DIExpression(DW_OP_deref)), !dbg !1174
  call void @llvm.dbg.value(metadata double* %fc, metadata !1069, metadata !DIExpression(DW_OP_deref)), !dbg !1174
  call void @llvm.dbg.value(metadata double* %val, metadata !1072, metadata !DIExpression(DW_OP_deref)), !dbg !1174
  %call34 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* noundef nonnull %6, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.29, i64 0, i64 0), double* noundef nonnull %fr, double* noundef nonnull %fc, double* noundef nonnull %val) #22, !dbg !1175
  call void @llvm.dbg.value(metadata i32 %call34, metadata !1073, metadata !DIExpression()), !dbg !1174
  %23 = load double, double* %fr, align 8, !dbg !1176, !tbaa !88
  call void @llvm.dbg.value(metadata double %23, metadata !1063, metadata !DIExpression()), !dbg !1174
  %conv35 = fptosi double %23 to i32, !dbg !1176
  call void @llvm.dbg.value(metadata i32 %conv35, metadata !1070, metadata !DIExpression()), !dbg !1174
  %24 = load double, double* %fc, align 8, !dbg !1177, !tbaa !88
  call void @llvm.dbg.value(metadata double %24, metadata !1069, metadata !DIExpression()), !dbg !1174
  %conv36 = fptosi double %24 to i32, !dbg !1177
  call void @llvm.dbg.value(metadata i32 %conv36, metadata !1071, metadata !DIExpression()), !dbg !1174
  %cmp37 = icmp slt i32 %call34, 1, !dbg !1178
  br i1 %cmp37, label %cleanup.thread, label %if.end40, !dbg !1180

cleanup.thread:                                   ; preds = %while.body
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call72, metadata !979, metadata !DIExpression()), !dbg !1090
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13) #22, !dbg !1181
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #22, !dbg !1181
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %11) #22, !dbg !1181
  br label %if.end107

if.end40:                                         ; preds = %while.body
  %cmp41 = icmp eq i32 %call34, 2, !dbg !1182
  br i1 %cmp41, label %if.then43, label %if.end51, !dbg !1183

if.then43:                                        ; preds = %if.end40
  %call44 = call i32 @rand() #22, !dbg !1184
  %conv45 = sitofp i32 %call44 to double, !dbg !1185
  %div = fdiv double %conv45, 0x41DFFFFFFFC00000, !dbg !1186
  call void @llvm.dbg.value(metadata double %div, metadata !1074, metadata !DIExpression()), !dbg !1187
  %cmp46 = icmp eq i32 %conv35, %conv36, !dbg !1188
  %mul = fmul double %div, 1.000000e+05, !dbg !1189
  %cond = select i1 %cmp46, double %mul, double %div, !dbg !1189
  call void @llvm.dbg.value(metadata double %cond, metadata !1072, metadata !DIExpression()), !dbg !1174
  store double %cond, double* %val, align 8, !dbg !1190, !tbaa !88
  br label %if.end51, !dbg !1191

if.end51:                                         ; preds = %if.then43, %if.end40
  %dec = add nsw i32 %conv35, -1, !dbg !1192
  call void @llvm.dbg.value(metadata i32 %dec, metadata !1070, metadata !DIExpression()), !dbg !1174
  %dec52 = add nsw i32 %conv36, -1, !dbg !1193
  call void @llvm.dbg.value(metadata i32 %dec52, metadata !1071, metadata !DIExpression()), !dbg !1174
  %cmp53 = icmp slt i32 %conv35, %conv36, !dbg !1194
  %spec.select = select i1 %cmp53, i32 %dec52, i32 %dec, !dbg !1195
  %spec.select257 = select i1 %cmp53, i32 %dec, i32 %dec52, !dbg !1195
  call void @llvm.dbg.value(metadata i32 %spec.select257, metadata !1071, metadata !DIExpression()), !dbg !1174
  call void @llvm.dbg.value(metadata i32 %spec.select, metadata !1070, metadata !DIExpression()), !dbg !1174
  %cmp57.not = icmp slt i32 %spec.select, %spec.select257, !dbg !1196
  br i1 %cmp57.not, label %cond.false60, label %cond.end61, !dbg !1196

cond.false60:                                     ; preds = %if.end51
  call void @__assert_fail(i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.30, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 930, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #23, !dbg !1196
  unreachable, !dbg !1196

cond.end61:                                       ; preds = %if.end51
  %25 = load i32, i32* %size, align 4, !dbg !1197, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %25, metadata !981, metadata !DIExpression()), !dbg !1090
  %cmp62 = icmp slt i32 %spec.select, %25, !dbg !1197
  br i1 %cmp62, label %cond.end66, label %cond.false65, !dbg !1197

cond.false65:                                     ; preds = %cond.end61
  call void @__assert_fail(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.31, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 931, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #23, !dbg !1197
  unreachable, !dbg !1197

cond.end66:                                       ; preds = %cond.end61
  %cmp67 = icmp slt i32 %spec.select257, %25, !dbg !1198
  br i1 %cmp67, label %cleanup, label %cond.false70, !dbg !1198

cond.false70:                                     ; preds = %cond.end66
  call void @__assert_fail(i8* noundef getelementptr inbounds ([9 x i8], [9 x i8]* @.str.32, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 932, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #23, !dbg !1198
  unreachable, !dbg !1198

cleanup:                                          ; preds = %cond.end66
  %26 = load double, double* %val, align 8, !dbg !1199, !tbaa !88
  call void @llvm.dbg.value(metadata double %26, metadata !1072, metadata !DIExpression()), !dbg !1174
  %call72 = call %struct.InternalNode* @set_matrix(i32 noundef %k.0.i, %struct.InternalNode* noundef %A.0, i32 noundef %spec.select, i32 noundef %spec.select257, double noundef %26), !dbg !1200
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call72, metadata !979, metadata !DIExpression()), !dbg !1090
  %27 = load i32, i32* %nonzeros, align 4, !dbg !1201, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %27, metadata !983, metadata !DIExpression()), !dbg !1090
  %inc = add nsw i32 %27, 1, !dbg !1201
  call void @llvm.dbg.value(metadata i32 %inc, metadata !983, metadata !DIExpression()), !dbg !1090
  store i32 %inc, i32* %nonzeros, align 4, !dbg !1201, !tbaa !1093
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13) #22, !dbg !1181
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #22, !dbg !1181
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %11) #22, !dbg !1181
  br label %while.cond

if.else:                                          ; preds = %if.end8.if.else_crit_edge, %sw.bb6, %sw.bb4, %sw.bb
  %28 = phi i32 [ %.pre, %if.end8.if.else_crit_edge ], [ 2000, %sw.bb6 ], [ 1000, %sw.bb4 ], [ 128, %sw.bb ], !dbg !1138
  call void @llvm.dbg.value(metadata i32 %28, metadata !981, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 %28, metadata !955, metadata !DIExpression()), !dbg !1202
  call void @llvm.dbg.value(metadata i32 0, metadata !956, metadata !DIExpression()), !dbg !1202
  br label %while.cond.i263, !dbg !1204

while.cond.i263:                                  ; preds = %while.cond.i263, %if.else
  %k.0.i259 = phi i32 [ 0, %if.else ], [ %inc.i262, %while.cond.i263 ], !dbg !1202
  call void @llvm.dbg.value(metadata i32 %k.0.i259, metadata !956, metadata !DIExpression()), !dbg !1202
  %shl.i260 = shl nuw i32 1, %k.0.i259, !dbg !1205
  %cmp.i261 = icmp slt i32 %shl.i260, %28, !dbg !1206
  %inc.i262 = add nuw nsw i32 %k.0.i259, 1, !dbg !1207
  call void @llvm.dbg.value(metadata i32 %inc.i262, metadata !956, metadata !DIExpression()), !dbg !1202
  br i1 %cmp.i261, label %while.cond.i263, label %for.cond79.preheader, !dbg !1204, !llvm.loop !1208

for.cond79.preheader:                             ; preds = %while.cond.i263
  call void @llvm.dbg.value(metadata %struct.InternalNode* null, metadata !979, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 0, metadata !984, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 %28, metadata !981, metadata !DIExpression()), !dbg !1090
  %cmp80354 = icmp sgt i32 %28, 0, !dbg !1209
  br i1 %cmp80354, label %for.body82, label %for.cond85.preheader, !dbg !1212

for.cond85.preheader:                             ; preds = %for.body82, %for.cond79.preheader
  %29 = phi i32 [ %28, %for.cond79.preheader ], [ %39, %for.body82 ], !dbg !1213
  %A.2.lcssa = phi %struct.InternalNode* [ null, %for.cond79.preheader ], [ %call83, %for.body82 ], !dbg !1214
  call void @llvm.dbg.value(metadata %struct.InternalNode* %A.2.lcssa, metadata !979, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 0, metadata !984, metadata !DIExpression()), !dbg !1090
  %30 = load i32, i32* %nonzeros, align 4, !dbg !1215, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %30, metadata !983, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 %29, metadata !981, metadata !DIExpression()), !dbg !1090
  %cmp86388 = icmp sgt i32 %30, %29, !dbg !1216
  br i1 %cmp86388, label %again.preheader.lr.ph, label %if.end107, !dbg !1217

again.preheader.lr.ph:                            ; preds = %for.cond85.preheader
  %cmp9497101.i = icmp ugt i32 %k.0.i259, 1
  br i1 %cmp9497101.i, label %again.preheader.us, label %again.preheader, !dbg !1218

again.preheader.us:                               ; preds = %if.end102.us, %again.preheader.lr.ph
  %31 = phi i32 [ %33, %if.end102.us ], [ %29, %again.preheader.lr.ph ]
  %A.3390.us = phi %struct.InternalNode* [ %call103.us, %if.end102.us ], [ %A.2.lcssa, %again.preheader.lr.ph ]
  %i.1389.us = phi i32 [ %inc105.us, %if.end102.us ], [ 0, %again.preheader.lr.ph ]
  call void @llvm.dbg.value(metadata %struct.InternalNode* %A.3390.us, metadata !979, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 %i.1389.us, metadata !984, metadata !DIExpression()), !dbg !1090
  %rand_nxt.promoted.us = load i64, i64* @rand_nxt, align 8, !tbaa !112
  br label %again.us.us, !dbg !1221

if.end102.us:                                     ; preds = %get_matrix.exit.us.us, %cond.end9.i.us.us
  store i64 %add.i266.us.us, i64* @rand_nxt, align 8, !dbg !1222, !tbaa !112
  %call103.us = call %struct.InternalNode* @set_matrix(i32 noundef %k.0.i259, %struct.InternalNode* noundef %A.3390.us, i32 noundef %rem.us.us, i32 noundef %rem93.us.us, double noundef 1.000000e-01), !dbg !1223
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call103.us, metadata !979, metadata !DIExpression()), !dbg !1090
  %inc105.us = add nuw nsw i32 %i.1389.us, 1, !dbg !1224
  call void @llvm.dbg.value(metadata i32 %inc105.us, metadata !984, metadata !DIExpression()), !dbg !1090
  %32 = load i32, i32* %nonzeros, align 4, !dbg !1215, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %32, metadata !983, metadata !DIExpression()), !dbg !1090
  %33 = load i32, i32* %size, align 4, !dbg !1213, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %33, metadata !981, metadata !DIExpression()), !dbg !1090
  %sub.us = sub nsw i32 %32, %33, !dbg !1225
  %cmp86.us = icmp slt i32 %inc105.us, %sub.us, !dbg !1216
  br i1 %cmp86.us, label %again.preheader.us, label %if.end107, !dbg !1217, !llvm.loop !1226

again.us.us:                                      ; preds = %again.us.us.backedge, %again.preheader.us
  %add.i266357.us.us = phi i64 [ %rand_nxt.promoted.us, %again.preheader.us ], [ %add.i266.us.us, %again.us.us.backedge ], !dbg !1228
  call void @llvm.dbg.label(metadata !1089), !dbg !1228
  %mul.i.us.us = mul i64 %add.i266357.us.us, 1103515245, !dbg !1229
  %add.i.us.us = add i64 %mul.i.us.us, 12345, !dbg !1231
  %shr.i.us.us = lshr i64 %add.i.us.us, 16, !dbg !1232
  %34 = trunc i64 %shr.i.us.us to i32, !dbg !1233
  %conv.i.us.us = and i32 %34, 2147483647, !dbg !1233
  call void @llvm.dbg.value(metadata i32 %conv.i.us.us, metadata !110, metadata !DIExpression()), !dbg !1234
  call void @llvm.dbg.value(metadata i32 %31, metadata !981, metadata !DIExpression()), !dbg !1090
  %rem.us.us = srem i32 %conv.i.us.us, %31, !dbg !1235
  call void @llvm.dbg.value(metadata i32 %rem.us.us, metadata !1080, metadata !DIExpression()), !dbg !1222
  %mul.i265.us.us = mul i64 %add.i.us.us, 1103515245, !dbg !1236
  %add.i266.us.us = add i64 %mul.i265.us.us, 12345, !dbg !1238
  %shr.i267.us.us = lshr i64 %add.i266.us.us, 16, !dbg !1239
  %35 = trunc i64 %shr.i267.us.us to i32, !dbg !1240
  %conv.i268.us.us = and i32 %35, 2147483647, !dbg !1240
  call void @llvm.dbg.value(metadata i32 %conv.i268.us.us, metadata !110, metadata !DIExpression()), !dbg !1241
  %rem93.us.us = srem i32 %conv.i268.us.us, %31, !dbg !1242
  call void @llvm.dbg.value(metadata i32 %rem93.us.us, metadata !1085, metadata !DIExpression()), !dbg !1222
  %cmp94.not.us.us = icmp ugt i32 %rem.us.us, %rem93.us.us, !dbg !1243
  br i1 %cmp94.not.us.us, label %cond.end.lr.ph.lr.ph.i.us.us, label %again.us.us.backedge, !dbg !1221

cond.end.lr.ph.lr.ph.i.us.us:                     ; preds = %if.else25.i.us.us, %again.us.us
  %c.tr.ph105.i.us.us = phi i32 [ %c.tr.ph.be.i.us.us, %if.else25.i.us.us ], [ %rem93.us.us, %again.us.us ]
  %r.tr.ph104.i.us.us = phi i32 [ %r.tr.ph.be.i.us.us, %if.else25.i.us.us ], [ %rem.us.us, %again.us.us ]
  %a.tr.ph103.i.us.us = phi %struct.InternalNode* [ %a.tr.ph.be.i.us.us, %if.else25.i.us.us ], [ %A.3390.us, %again.us.us ]
  %depth.tr.ph102.i.us.us = phi i32 [ %dec.i.us.us, %if.else25.i.us.us ], [ %k.0.i259, %again.us.us ]
  call void @llvm.dbg.value(metadata i32 %c.tr.ph105.i.us.us, metadata !250, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata i32 %r.tr.ph104.i.us.us, metadata !249, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr.ph103.i.us.us, metadata !248, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata i32 %depth.tr.ph102.i.us.us, metadata !247, metadata !DIExpression()) #22, !dbg !1245
  br label %cond.end.lr.ph.i.us.us, !dbg !1218

cond.end.lr.ph.i.us.us:                           ; preds = %if.else21.i.us.us, %cond.end.lr.ph.lr.ph.i.us.us
  %c.tr.ph76100.i.us.us = phi i32 [ %c.tr.ph105.i.us.us, %cond.end.lr.ph.lr.ph.i.us.us ], [ %sub.i.us.us, %if.else21.i.us.us ]
  %a.tr.ph7599.i.us.us = phi %struct.InternalNode* [ %a.tr.ph103.i.us.us, %cond.end.lr.ph.lr.ph.i.us.us ], [ %36, %if.else21.i.us.us ]
  %depth.tr.ph7498.i.us.us = phi i32 [ %depth.tr.ph102.i.us.us, %cond.end.lr.ph.lr.ph.i.us.us ], [ %dec.i.us.us, %if.else21.i.us.us ]
  call void @llvm.dbg.value(metadata i32 %c.tr.ph76100.i.us.us, metadata !250, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr.ph7599.i.us.us, metadata !248, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata i32 %depth.tr.ph7498.i.us.us, metadata !247, metadata !DIExpression()) #22, !dbg !1245
  br label %cond.end.i.us.us, !dbg !1218

cond.end.i.us.us:                                 ; preds = %if.then19.i.us.us, %cond.end.lr.ph.i.us.us
  %a.tr96.i.us.us = phi %struct.InternalNode* [ %a.tr.ph7599.i.us.us, %cond.end.lr.ph.i.us.us ], [ %37, %if.then19.i.us.us ]
  %depth.tr95.i.us.us = phi i32 [ %depth.tr.ph7498.i.us.us, %cond.end.lr.ph.i.us.us ], [ %dec.i.us.us, %if.then19.i.us.us ]
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr96.i.us.us, metadata !248, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata i32 %depth.tr95.i.us.us, metadata !247, metadata !DIExpression()) #22, !dbg !1245
  %shl.i269.us.us = shl nuw i32 1, %depth.tr95.i.us.us, !dbg !1246
  %cmp1.i.us.us = icmp sgt i32 %shl.i269.us.us, %r.tr.ph104.i.us.us, !dbg !1246
  br i1 %cmp1.i.us.us, label %cond.end4.i.us.us, label %cond.false3.i, !dbg !1246

cond.end4.i.us.us:                                ; preds = %cond.end.i.us.us
  %cmp6.i.us.us = icmp sgt i32 %shl.i269.us.us, %c.tr.ph76100.i.us.us, !dbg !1247
  br i1 %cmp6.i.us.us, label %cond.end9.i.us.us, label %cond.false8.i, !dbg !1247

cond.end9.i.us.us:                                ; preds = %cond.end4.i.us.us
  %cmp10.i.us.us = icmp eq %struct.InternalNode* %a.tr96.i.us.us, null, !dbg !1248
  br i1 %cmp10.i.us.us, label %if.end102.us, label %if.end.i.us.us, !dbg !1249

if.end.i.us.us:                                   ; preds = %cond.end9.i.us.us
  %cmp11.i.us.us = icmp eq i32 %depth.tr95.i.us.us, 2, !dbg !1250
  br i1 %cmp11.i.us.us, label %get_matrix.exit.us.us, label %if.else.i.us.us, !dbg !1251

if.else.i.us.us:                                  ; preds = %if.end.i.us.us
  %dec.i.us.us = add nsw i32 %depth.tr95.i.us.us, -1, !dbg !1252
  call void @llvm.dbg.value(metadata i32 %dec.i.us.us, metadata !247, metadata !DIExpression()) #22, !dbg !1245
  %shl15.i.us.us = shl nuw i32 1, %dec.i.us.us, !dbg !1253
  call void @llvm.dbg.value(metadata i32 %shl15.i.us.us, metadata !254, metadata !DIExpression()) #22, !dbg !1254
  %cmp16.i.us.us = icmp slt i32 %r.tr.ph104.i.us.us, %shl15.i.us.us, !dbg !1255
  %cmp18.i.us.us = icmp slt i32 %c.tr.ph76100.i.us.us, %shl15.i.us.us, !dbg !1256
  br i1 %cmp16.i.us.us, label %if.then17.i.us.us, label %if.else25.i.us.us, !dbg !1257

if.else25.i.us.us:                                ; preds = %if.else.i.us.us
  %arrayidx34.i.us.us = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr96.i.us.us, i64 0, i32 0, i64 3, !dbg !1258
  %arrayidx29.i.us.us = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr96.i.us.us, i64 0, i32 0, i64 2, !dbg !1258
  %a.tr.ph.be.in.i.us.us = select i1 %cmp18.i.us.us, %struct.InternalNode** %arrayidx29.i.us.us, %struct.InternalNode** %arrayidx34.i.us.us, !dbg !1258
  %sub36.i.us.us = select i1 %cmp18.i.us.us, i32 0, i32 %shl15.i.us.us, !dbg !1258
  %c.tr.ph.be.i.us.us = sub nsw i32 %c.tr.ph76100.i.us.us, %sub36.i.us.us, !dbg !1258
  %r.tr.ph.be.i.us.us = sub nsw i32 %r.tr.ph104.i.us.us, %shl15.i.us.us, !dbg !1259
  %a.tr.ph.be.i.us.us = load %struct.InternalNode*, %struct.InternalNode** %a.tr.ph.be.in.i.us.us, align 8, !dbg !1259, !tbaa !170
  call void @llvm.dbg.value(metadata i32 %dec.i.us.us, metadata !247, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr.ph.be.i.us.us, metadata !248, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata i32 %r.tr.ph.be.i.us.us, metadata !249, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata i32 %c.tr.ph.be.i.us.us, metadata !250, metadata !DIExpression()) #22, !dbg !1245
  %cmp9497.i.us.us = icmp sgt i32 %depth.tr95.i.us.us, 2, !dbg !1218
  br i1 %cmp9497.i.us.us, label %cond.end.lr.ph.lr.ph.i.us.us, label %cond.false.i, !dbg !1218

if.then17.i.us.us:                                ; preds = %if.else.i.us.us
  br i1 %cmp18.i.us.us, label %if.then19.i.us.us, label %if.else21.i.us.us, !dbg !1260

if.else21.i.us.us:                                ; preds = %if.then17.i.us.us
  %arrayidx23.i.us.us = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr96.i.us.us, i64 0, i32 0, i64 1, !dbg !1261
  %36 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx23.i.us.us, align 8, !dbg !1261, !tbaa !170
  %sub.i.us.us = sub nsw i32 %c.tr.ph76100.i.us.us, %shl15.i.us.us, !dbg !1262
  call void @llvm.dbg.value(metadata i32 %dec.i.us.us, metadata !247, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata %struct.InternalNode* %36, metadata !248, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata i32 %r.tr.ph104.i.us.us, metadata !249, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata i32 %sub.i.us.us, metadata !250, metadata !DIExpression()) #22, !dbg !1245
  %cmp94.i.us.us = icmp sgt i32 %depth.tr95.i.us.us, 2, !dbg !1218
  br i1 %cmp94.i.us.us, label %cond.end.lr.ph.i.us.us, label %cond.false.i, !dbg !1218

if.then19.i.us.us:                                ; preds = %if.then17.i.us.us
  %arrayidx20.i.us.us = getelementptr inbounds %struct.InternalNode, %struct.InternalNode* %a.tr96.i.us.us, i64 0, i32 0, i64 0, !dbg !1263
  %37 = load %struct.InternalNode*, %struct.InternalNode** %arrayidx20.i.us.us, align 8, !dbg !1263, !tbaa !170
  call void @llvm.dbg.value(metadata i32 %dec.i.us.us, metadata !247, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata %struct.InternalNode* %37, metadata !248, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata i32 %r.tr.ph104.i.us.us, metadata !249, metadata !DIExpression()) #22, !dbg !1245
  call void @llvm.dbg.value(metadata i32 %c.tr.ph76100.i.us.us, metadata !250, metadata !DIExpression()) #22, !dbg !1245
  %cmp.i270.us.us = icmp sgt i32 %depth.tr95.i.us.us, 2, !dbg !1218
  br i1 %cmp.i270.us.us, label %cond.end.i.us.us, label %cond.false.i, !dbg !1218

get_matrix.exit.us.us:                            ; preds = %if.end.i.us.us
  call void @llvm.dbg.value(metadata %struct.InternalNode* %a.tr96.i.us.us, metadata !251, metadata !DIExpression()) #22, !dbg !1264
  %block.i.us.us = bitcast %struct.InternalNode* %a.tr96.i.us.us to [4 x [4 x double]]*, !dbg !1265
  %idxprom.i.us.us = sext i32 %r.tr.ph104.i.us.us to i64, !dbg !1265
  %idxprom13.i.us.us = sext i32 %c.tr.ph76100.i.us.us to i64, !dbg !1265
  %arrayidx14.i.us.us = getelementptr inbounds [4 x [4 x double]], [4 x [4 x double]]* %block.i.us.us, i64 0, i64 %idxprom.i.us.us, i64 %idxprom13.i.us.us, !dbg !1265
  %38 = load double, double* %arrayidx14.i.us.us, align 8, !dbg !1265, !tbaa !88
  %cmp99.us.us = fcmp une double %38, 0.000000e+00, !dbg !1266
  br i1 %cmp99.us.us, label %again.us.us.backedge, label %if.end102.us, !dbg !1267

again.us.us.backedge:                             ; preds = %get_matrix.exit.us.us, %again.us.us
  br label %again.us.us, !dbg !1228

for.body82:                                       ; preds = %for.body82, %for.cond79.preheader
  %A.2356 = phi %struct.InternalNode* [ %call83, %for.body82 ], [ null, %for.cond79.preheader ]
  %i.0355 = phi i32 [ %inc84, %for.body82 ], [ 0, %for.cond79.preheader ]
  call void @llvm.dbg.value(metadata %struct.InternalNode* %A.2356, metadata !979, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 %i.0355, metadata !984, metadata !DIExpression()), !dbg !1090
  %call83 = call %struct.InternalNode* @set_matrix(i32 noundef %k.0.i259, %struct.InternalNode* noundef %A.2356, i32 noundef %i.0355, i32 noundef %i.0355, double noundef 1.000000e+00), !dbg !1268
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call83, metadata !979, metadata !DIExpression()), !dbg !1090
  %inc84 = add nuw nsw i32 %i.0355, 1, !dbg !1270
  call void @llvm.dbg.value(metadata i32 %inc84, metadata !984, metadata !DIExpression()), !dbg !1090
  %39 = load i32, i32* %size, align 4, !dbg !1271, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %39, metadata !981, metadata !DIExpression()), !dbg !1090
  %cmp80 = icmp slt i32 %inc84, %39, !dbg !1209
  br i1 %cmp80, label %for.body82, label %for.cond85.preheader, !dbg !1212, !llvm.loop !1272

again.preheader:                                  ; preds = %again.preheader.lr.ph
  call void @llvm.dbg.value(metadata %struct.InternalNode* %A.2.lcssa, metadata !979, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 0, metadata !984, metadata !DIExpression()), !dbg !1090
  %rand_nxt.promoted = load i64, i64* @rand_nxt, align 8, !tbaa !112
  br label %again, !dbg !1221

again:                                            ; preds = %again, %again.preheader
  %add.i266357 = phi i64 [ %add.i266, %again ], [ %rand_nxt.promoted, %again.preheader ], !dbg !1228
  call void @llvm.dbg.label(metadata !1089), !dbg !1228
  %mul.i = mul i64 %add.i266357, 1103515245, !dbg !1229
  %add.i = add i64 %mul.i, 12345, !dbg !1231
  %shr.i = lshr i64 %add.i, 16, !dbg !1232
  %40 = trunc i64 %shr.i to i32, !dbg !1233
  %conv.i = and i32 %40, 2147483647, !dbg !1233
  call void @llvm.dbg.value(metadata i32 %conv.i, metadata !110, metadata !DIExpression()), !dbg !1234
  call void @llvm.dbg.value(metadata i32 %29, metadata !981, metadata !DIExpression()), !dbg !1090
  %rem = srem i32 %conv.i, %29, !dbg !1235
  call void @llvm.dbg.value(metadata i32 %rem, metadata !1080, metadata !DIExpression()), !dbg !1222
  %mul.i265 = mul i64 %add.i, 1103515245, !dbg !1236
  %add.i266 = add i64 %mul.i265, 12345, !dbg !1238
  %shr.i267 = lshr i64 %add.i266, 16, !dbg !1239
  %41 = trunc i64 %shr.i267 to i32, !dbg !1240
  %conv.i268 = and i32 %41, 2147483647, !dbg !1240
  call void @llvm.dbg.value(metadata i32 %conv.i268, metadata !110, metadata !DIExpression()), !dbg !1241
  %rem93 = srem i32 %conv.i268, %29, !dbg !1242
  call void @llvm.dbg.value(metadata i32 %rem93, metadata !1085, metadata !DIExpression()), !dbg !1222
  %cmp94.not = icmp ugt i32 %rem, %rem93, !dbg !1243
  br i1 %cmp94.not, label %cond.false.i, label %again, !dbg !1221

cond.false.i:                                     ; preds = %again, %if.then19.i.us.us, %if.else21.i.us.us, %if.else25.i.us.us
  %add.i266.lcssa.sink = phi i64 [ %add.i266, %again ], [ %add.i266.us.us, %if.then19.i.us.us ], [ %add.i266.us.us, %if.else21.i.us.us ], [ %add.i266.us.us, %if.else25.i.us.us ]
  store i64 %add.i266.lcssa.sink, i64* @rand_nxt, align 8, !dbg !1222, !tbaa !112
  call void @__assert_fail(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 362, i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @__PRETTY_FUNCTION__.get_matrix, i64 0, i64 0)) #23, !dbg !1218
  unreachable, !dbg !1218

cond.false3.i:                                    ; preds = %cond.end.i.us.us
  store i64 %add.i266.us.us, i64* @rand_nxt, align 8, !dbg !1222, !tbaa !112
  call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 363, i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @__PRETTY_FUNCTION__.get_matrix, i64 0, i64 0)) #23, !dbg !1246
  unreachable, !dbg !1246

cond.false8.i:                                    ; preds = %cond.end4.i.us.us
  store i64 %add.i266.us.us, i64* @rand_nxt, align 8, !dbg !1222, !tbaa !112
  call void @__assert_fail(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0), i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 noundef 364, i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @__PRETTY_FUNCTION__.get_matrix, i64 0, i64 0)) #23, !dbg !1247
  unreachable, !dbg !1247

if.end107:                                        ; preds = %if.end102.us, %for.cond85.preheader, %cleanup.thread, %while.cond
  %shl.pre-phi = phi i32 [ %shl.i260, %for.cond85.preheader ], [ %shl.i, %cleanup.thread ], [ %shl.i260, %if.end102.us ], [ %shl.i, %while.cond ]
  %depth.0 = phi i32 [ %k.0.i259, %for.cond85.preheader ], [ %k.0.i, %cleanup.thread ], [ %k.0.i259, %if.end102.us ], [ %k.0.i, %while.cond ], !dbg !1274
  %A.4 = phi %struct.InternalNode* [ %A.2.lcssa, %for.cond85.preheader ], [ %A.0, %cleanup.thread ], [ %call103.us, %if.end102.us ], [ %A.0, %while.cond ], !dbg !1168
  call void @llvm.dbg.value(metadata %struct.InternalNode* %A.4, metadata !979, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 %depth.0, metadata !982, metadata !DIExpression()), !dbg !1090
  %42 = load i32, i32* %size, align 4, !dbg !1275, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %42, metadata !981, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 %42, metadata !984, metadata !DIExpression()), !dbg !1090
  %cmp109403 = icmp slt i32 %42, %shl.pre-phi, !dbg !1277
  br i1 %cmp109403, label %for.body111, label %for.end115, !dbg !1279

for.body111:                                      ; preds = %for.body111, %if.end107
  %A.5405 = phi %struct.InternalNode* [ %call112, %for.body111 ], [ %A.4, %if.end107 ]
  %i.2404 = phi i32 [ %inc114, %for.body111 ], [ %42, %if.end107 ]
  call void @llvm.dbg.value(metadata %struct.InternalNode* %A.5405, metadata !979, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 %i.2404, metadata !984, metadata !DIExpression()), !dbg !1090
  %call112 = call %struct.InternalNode* @set_matrix(i32 noundef %depth.0, %struct.InternalNode* noundef %A.5405, i32 noundef %i.2404, i32 noundef %i.2404, double noundef 1.000000e+00), !dbg !1280
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call112, metadata !979, metadata !DIExpression()), !dbg !1090
  %inc114 = add i32 %i.2404, 1, !dbg !1282
  call void @llvm.dbg.value(metadata i32 %inc114, metadata !984, metadata !DIExpression()), !dbg !1090
  %exitcond.not = icmp eq i32 %inc114, %shl.pre-phi, !dbg !1277
  br i1 %exitcond.not, label %for.end115, label %for.body111, !dbg !1279, !llvm.loop !1283

for.end115:                                       ; preds = %for.body111, %if.end107
  %A.5.lcssa = phi %struct.InternalNode* [ %A.4, %if.end107 ], [ %call112, %for.body111 ], !dbg !1214
  %call116 = call %struct.InternalNode* @copy_matrix(i32 noundef %depth.0, %struct.InternalNode* noundef %A.5.lcssa), !dbg !1285
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call116, metadata !980, metadata !DIExpression()), !dbg !1090
  %call117 = call i32 @num_blocks(i32 noundef %depth.0, %struct.InternalNode* noundef %call116), !dbg !1286
  call void @llvm.dbg.value(metadata i32 %call117, metadata !990, metadata !DIExpression()), !dbg !1090
  %call118 = call i32 @num_nonzeros(i32 noundef %depth.0, %struct.InternalNode* noundef %call116), !dbg !1287
  call void @llvm.dbg.value(metadata i32 %call118, metadata !989, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.declare(metadata %struct.timeval* %t1, metadata !1086, metadata !DIExpression()), !dbg !1288
  call void @llvm.dbg.declare(metadata %struct.timeval* %t2, metadata !1087, metadata !DIExpression()), !dbg !1289
  %call119 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t1, %struct.timezone* noundef null) #22, !dbg !1290
  %call120 = call %struct.InternalNode* @cholesky(i32 noundef %depth.0, %struct.InternalNode* noundef %call116), !dbg !1291
  %call121 = call i32 @gettimeofday(%struct.timeval* noundef nonnull %t2, %struct.timezone* noundef null) #22, !dbg !1292
  call void @llvm.dbg.value(metadata %struct.timeval* %t2, metadata !60, metadata !DIExpression()), !dbg !1293
  %43 = load i64, i64* %tv_sec.i, align 8, !dbg !1295, !tbaa !63
  %44 = load i64, i64* %tv_usec.i, align 8, !dbg !1296, !tbaa !70
  call void @llvm.dbg.value(metadata %struct.timeval* %t1, metadata !60, metadata !DIExpression()), !dbg !1297
  %45 = load i64, i64* %tv_sec.i272, align 8, !dbg !1299, !tbaa !63
  %46 = load i64, i64* %tv_usec.i274, align 8, !dbg !1300, !tbaa !70
  %reass.add = sub i64 %43, %45
  %reass.mul = mul i64 %reass.add, 1000000
  %add.i271 = sub i64 %44, %46, !dbg !1301
  %sub124 = add i64 %add.i271, %reass.mul, !dbg !1302
  %div125 = udiv i64 %sub124, 1000, !dbg !1303
  call void @llvm.dbg.value(metadata i64 %div125, metadata !1088, metadata !DIExpression()), !dbg !1214
  %conv126 = uitofp i64 %div125 to double, !dbg !1304
  %div127 = fdiv double %conv126, 1.000000e+03, !dbg !1305
  %call128 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([15 x i8], [15 x i8]* @.str.33, i64 0, i64 0), double noundef %div127), !dbg !1306
  %call129 = call i32 @num_blocks(i32 noundef %depth.0, %struct.InternalNode* noundef %call116), !dbg !1307
  call void @llvm.dbg.value(metadata i32 %call129, metadata !992, metadata !DIExpression()), !dbg !1090
  %call130 = call i32 @num_nonzeros(i32 noundef %depth.0, %struct.InternalNode* noundef %call116), !dbg !1308
  call void @llvm.dbg.value(metadata i32 %call130, metadata !991, metadata !DIExpression()), !dbg !1090
  %47 = load i32, i32* %check, align 4, !dbg !1309, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %47, metadata !987, metadata !DIExpression()), !dbg !1090
  %tobool131.not = icmp eq i32 %47, 0, !dbg !1309
  br i1 %tobool131.not, label %if.end136, label %if.then132, !dbg !1311

if.then132:                                       ; preds = %for.end115
  %puts = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([22 x i8], [22 x i8]* @str.50, i64 0, i64 0)), !dbg !1312
  %call134 = call %struct.InternalNode* @mul_and_subT(i32 noundef %depth.0, i32 noundef 1, %struct.InternalNode* noundef %call116, %struct.InternalNode* noundef %call116, %struct.InternalNode* noundef %A.5.lcssa), !dbg !1314
  call void @llvm.dbg.value(metadata %struct.InternalNode* %call134, metadata !979, metadata !DIExpression()), !dbg !1090
  %call135 = call double @mag(i32 noundef %depth.0, %struct.InternalNode* noundef %call134), !dbg !1315
  call void @llvm.dbg.value(metadata double %call135, metadata !993, metadata !DIExpression()), !dbg !1090
  br label %if.end136, !dbg !1316

if.end136:                                        ; preds = %if.then132, %for.end115
  %error.1 = phi double [ %call135, %if.then132 ], [ %error.0409, %for.end115 ], !dbg !1090
  %A.6 = phi %struct.InternalNode* [ %call134, %if.then132 ], [ %A.5.lcssa, %for.end115 ], !dbg !1214
  call void @llvm.dbg.value(metadata %struct.InternalNode* %A.6, metadata !979, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata double %error.1, metadata !993, metadata !DIExpression()), !dbg !1090
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1317, !tbaa !170
  %49 = call i64 @fwrite(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.35, i64 0, i64 0), i64 24, i64 1, %struct._IO_FILE* %48) #24, !dbg !1318
  %50 = load i32, i32* %check, align 4, !dbg !1319, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %50, metadata !987, metadata !DIExpression()), !dbg !1090
  %tobool138.not = icmp eq i32 %50, 0, !dbg !1319
  br i1 %tobool138.not, label %if.end141, label %if.then139, !dbg !1321

if.then139:                                       ; preds = %if.end136
  %call140 = call i32 (i8*, ...) @printf(i8* noundef nonnull dereferenceable(1) getelementptr inbounds ([12 x i8], [12 x i8]* @.str.36, i64 0, i64 0), double noundef %error.1), !dbg !1322
  br label %if.end141, !dbg !1324

if.end141:                                        ; preds = %if.then139, %if.end136
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1325, !tbaa !170
  %52 = load i32, i32* %size, align 4, !dbg !1326, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %52, metadata !981, metadata !DIExpression()), !dbg !1090
  %call142 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %51, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.37, i64 0, i64 0), i32 noundef %52) #24, !dbg !1327
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1328, !tbaa !170
  %54 = load i32, i32* %nonzeros, align 4, !dbg !1329, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %54, metadata !983, metadata !DIExpression()), !dbg !1090
  %call143 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %53, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.38, i64 0, i64 0), i32 noundef %54) #24, !dbg !1330
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1331, !tbaa !170
  %call144 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %55, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.39, i64 0, i64 0), i32 noundef %call118) #24, !dbg !1332
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1333, !tbaa !170
  %call145 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %56, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.40, i64 0, i64 0), i32 noundef %call117) #24, !dbg !1334
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1335, !tbaa !170
  %call146 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %57, i8* noundef getelementptr inbounds ([33 x i8], [33 x i8]* @.str.41, i64 0, i64 0), i32 noundef %call130) #24, !dbg !1336
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !dbg !1337, !tbaa !170
  %call147 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %58, i8* noundef getelementptr inbounds ([34 x i8], [34 x i8]* @.str.42, i64 0, i64 0), i32 noundef %call129) #24, !dbg !1338
  call void @free_matrix(i32 noundef %depth.0, %struct.InternalNode* noundef %A.6), !dbg !1339
  call void @free_matrix(i32 noundef %depth.0, %struct.InternalNode* noundef %call116), !dbg !1340
  %inc149 = add nuw nsw i32 %r.0408, 1, !dbg !1341
  call void @llvm.dbg.value(metadata double %error.1, metadata !993, metadata !DIExpression()), !dbg !1090
  call void @llvm.dbg.value(metadata i32 %inc149, metadata !1061, metadata !DIExpression()), !dbg !1106
  %59 = load i32, i32* %round, align 4, !dbg !1107, !tbaa !1093
  call void @llvm.dbg.value(metadata i32 %59, metadata !988, metadata !DIExpression()), !dbg !1090
  %cmp = icmp slt i32 %inc149, %59, !dbg !1108
  br i1 %cmp, label %for.body, label %cleanup150, !dbg !1109, !llvm.loop !1342

cleanup150:                                       ; preds = %if.end141, %if.then15, %if.then, %entry
  %60 = phi i32 [ 1, %if.then15 ], [ 1, %if.then ], [ 0, %entry ], [ 0, %if.end141 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #22, !dbg !1344
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #22, !dbg !1344
  call void @llvm.lifetime.end.p0i8(i64 100, i8* nonnull %7) #22, !dbg !1344
  call void @llvm.lifetime.end.p0i8(i64 1000, i8* nonnull %6) #22, !dbg !1344
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #22, !dbg !1344
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #22, !dbg !1344
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #22, !dbg !1344
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #22, !dbg !1344
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1) #22, !dbg !1344
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %0) #22, !dbg !1344
  ret i32 %60, !dbg !1344
}

declare !dbg !1345 dso_local void @get_options(i32 noundef, i8** noundef, i8** noundef, i32* noundef, ...) local_unnamed_addr #16

; Function Attrs: nofree nounwind
declare dso_local noalias noundef %struct._IO_FILE* @fopen(i8* nocapture noundef readonly, i8* nocapture noundef readonly) local_unnamed_addr #13

; Function Attrs: nofree nounwind
declare !dbg !1351 dso_local noundef i8* @fgets(i8* noundef, i32 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #13

; Function Attrs: nofree nounwind
declare dso_local noundef i32 @__isoc99_sscanf(i8* nocapture noundef readonly, i8* nocapture noundef readonly, ...) local_unnamed_addr #13

; Function Attrs: nounwind
declare !dbg !1356 dso_local void @srand(i32 noundef) local_unnamed_addr #17

; Function Attrs: nofree nounwind
declare !dbg !1358 dso_local noundef i32 @feof(%struct._IO_FILE* nocapture noundef) local_unnamed_addr #13

; Function Attrs: nounwind
declare !dbg !1361 dso_local i32 @rand() local_unnamed_addr #17

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nofree nounwind
declare !dbg !1362 dso_local noundef i32 @gettimeofday(%struct.timeval* nocapture noundef, %struct.timezone* nocapture noundef) local_unnamed_addr #13

; Function Attrs: inaccessiblememonly mustprogress nofree nounwind willreturn
declare dso_local noalias noundef i8* @malloc(i64 noundef) local_unnamed_addr #18

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) local_unnamed_addr #11

; Function Attrs: mustprogress nofree nounwind willreturn writeonly
declare dso_local double @sqrt(double noundef) local_unnamed_addr #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

; Function Attrs: nofree nounwind
declare noundef i32 @puts(i8* nocapture noundef readonly) local_unnamed_addr #19

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(i8* nocapture noundef, i64 noundef, i64 noundef, %struct._IO_FILE* nocapture noundef) local_unnamed_addr #19

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #20

; Function Attrs: inaccessiblememonly nofree nounwind willreturn
declare noalias noundef i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #21

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i16 @llvm.ctpop.i16(i16) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { noinline nounwind uwtable writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { mustprogress nofree nounwind willreturn writeonly "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { argmemonly nofree nounwind willreturn }
attributes #10 = { inaccessiblemem_or_argmemonly mustprogress nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { noreturn nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nofree nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nofree nosync nounwind readonly uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nofree norecurse nosync nounwind readnone uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nounwind "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #18 = { inaccessiblememonly mustprogress nofree nounwind willreturn "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #19 = { nofree nounwind }
attributes #20 = { argmemonly nofree nounwind willreturn writeonly }
attributes #21 = { inaccessiblememonly nofree nounwind willreturn }
attributes #22 = { nounwind }
attributes #23 = { noreturn nounwind }
attributes #24 = { cold }
attributes #25 = { cold nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!40, !41, !42, !43}
!llvm.ident = !{!44}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "rand_nxt", scope: !2, file: !3, line: 72, type: !39, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !26, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "cholesky.c", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "c1132dab1bcca369a1396a6b7344aa91")
!4 = !{!5, !6, !17, !14, !18}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "LeafNode", file: !3, line: 114, baseType: !8)
!8 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 112, size: 1024, elements: !9)
!9 = !{!10}
!10 = !DIDerivedType(tag: DW_TAG_member, name: "block", scope: !8, file: !3, line: 113, baseType: !11, size: 1024)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "Block", file: !3, line: 94, baseType: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 1024, elements: !15)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "Real", file: !3, line: 89, baseType: !14)
!14 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!15 = !{!16, !16}
!16 = !DISubrange(count: 4)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "InternalNode", file: !3, line: 110, baseType: !20)
!20 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "InternalNode", file: !3, line: 108, size: 256, elements: !21)
!21 = !{!22}
!22 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !20, file: !3, line: 109, baseType: !23, size: 256)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 256, elements: !25)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!25 = !{!16}
!26 = !{!0, !27, !35}
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "specifiers", scope: !2, file: !3, line: 822, type: !29, isLocal: false, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !30, size: 512, elements: !33)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!32 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!33 = !{!34}
!34 = !DISubrange(count: 8)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "opt_types", scope: !2, file: !3, line: 823, type: !37, isLocal: false, isDefinition: true)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 256, elements: !33)
!38 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!39 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!40 = !{i32 7, !"Dwarf Version", i32 5}
!41 = !{i32 2, !"Debug Info Version", i32 3}
!42 = !{i32 1, !"wchar_size", i32 4}
!43 = !{i32 7, !"uwtable", i32 1}
!44 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang f7f98d0501c44ae6a93ca00ec068035f8853103e)"}
!45 = distinct !DISubprogram(name: "todval", scope: !3, file: !3, line: 60, type: !46, scopeLine: 60, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !59)
!46 = !DISubroutineType(types: !47)
!47 = !{!48, !49}
!48 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timeval", file: !51, line: 30, size: 128, elements: !52)
!51 = !DIFile(filename: "/usr/include/bits/time.h", directory: "", checksumkind: CSK_MD5, checksum: "7275d681a2390320bc78ae3cf595b8d2")
!52 = !{!53, !57}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !50, file: !51, line: 32, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !55, line: 148, baseType: !56)
!55 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "77efac6352c67c8f56830ba4c854379f")
!56 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "tv_usec", scope: !50, file: !51, line: 33, baseType: !58, size: 64, offset: 64)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__suseconds_t", file: !55, line: 150, baseType: !56)
!59 = !{!60}
!60 = !DILocalVariable(name: "tp", arg: 1, scope: !45, file: !3, line: 60, type: !49)
!61 = !DILocation(line: 0, scope: !45)
!62 = !DILocation(line: 61, column: 16, scope: !45)
!63 = !{!64, !65, i64 0}
!64 = !{!"timeval", !65, i64 0, !65, i64 8}
!65 = !{!"long", !66, i64 0}
!66 = !{!"omnipotent char", !67, i64 0}
!67 = !{!"Simple C/C++ TBAA"}
!68 = !DILocation(line: 61, column: 30, scope: !45)
!69 = !DILocation(line: 61, column: 43, scope: !45)
!70 = !{!64, !65, i64 8}
!71 = !DILocation(line: 61, column: 37, scope: !45)
!72 = !DILocation(line: 61, column: 5, scope: !45)
!73 = distinct !DISubprogram(name: "startup_cilk", scope: !3, file: !3, line: 65, type: !74, scopeLine: 65, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !76)
!74 = !DISubroutineType(types: !75)
!75 = !{null}
!76 = !{!77, !78, !80, !81, !82, !83}
!77 = !DILocalVariable(name: "g", scope: !73, file: !3, line: 66, type: !14)
!78 = !DILocalVariable(name: "__init", scope: !79, type: !38, flags: DIFlagArtificial)
!79 = distinct !DILexicalBlock(scope: !73, file: !3, line: 67, column: 3)
!80 = !DILocalVariable(name: "__limit", scope: !79, type: !38, flags: DIFlagArtificial)
!81 = !DILocalVariable(name: "__begin", scope: !79, type: !38, flags: DIFlagArtificial)
!82 = !DILocalVariable(name: "__end", scope: !79, type: !38, flags: DIFlagArtificial)
!83 = !DILocalVariable(name: "i", scope: !84, file: !3, line: 67, type: !38)
!84 = distinct !DILexicalBlock(scope: !79, file: !3, line: 67, column: 3)
!85 = !DILocation(line: 0, scope: !73)
!86 = !DILocation(line: 66, column: 3, scope: !73)
!87 = !DILocation(line: 66, column: 10, scope: !73)
!88 = !{!89, !89, i64 0}
!89 = !{!"double", !66, i64 0}
!90 = !DILocation(line: 0, scope: !79)
!91 = !DILocation(line: 67, column: 24, scope: !79)
!92 = !DILocation(line: 67, column: 3, scope: !79)
!93 = !DILocation(line: 0, scope: !84)
!94 = !DILocation(line: 68, column: 14, scope: !95)
!95 = distinct !DILexicalBlock(scope: !84, file: !3, line: 67, column: 36)
!96 = !DILocation(line: 68, column: 10, scope: !95)
!97 = !DILocation(line: 68, column: 7, scope: !95)
!98 = !DILocation(line: 69, column: 3, scope: !95)
!99 = !DILocation(line: 67, column: 32, scope: !84)
!100 = !DILocation(line: 67, column: 24, scope: !84)
!101 = !DILocation(line: 67, column: 3, scope: !84)
!102 = distinct !{!102, !92, !103, !104}
!103 = !DILocation(line: 69, column: 3, scope: !79)
!104 = !{!"tapir.loop.spawn.strategy", i32 1}
!105 = !DILocation(line: 70, column: 1, scope: !73)
!106 = distinct !DISubprogram(name: "cilk_rand", scope: !3, file: !3, line: 74, type: !107, scopeLine: 74, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !109)
!107 = !DISubroutineType(types: !108)
!108 = !{!38}
!109 = !{!110}
!110 = !DILocalVariable(name: "result", scope: !106, file: !3, line: 75, type: !38)
!111 = !DILocation(line: 76, column: 14, scope: !106)
!112 = !{!65, !65, i64 0}
!113 = !DILocation(line: 76, column: 23, scope: !106)
!114 = !DILocation(line: 76, column: 36, scope: !106)
!115 = !DILocation(line: 76, column: 12, scope: !106)
!116 = !DILocation(line: 77, column: 22, scope: !106)
!117 = !DILocation(line: 77, column: 12, scope: !106)
!118 = !DILocation(line: 0, scope: !106)
!119 = !DILocation(line: 78, column: 3, scope: !106)
!120 = distinct !DISubprogram(name: "cilk_srand", scope: !3, file: !3, line: 81, type: !121, scopeLine: 81, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !123)
!121 = !DISubroutineType(types: !122)
!122 = !{null, !5}
!123 = !{!124}
!124 = !DILocalVariable(name: "seed", arg: 1, scope: !120, file: !3, line: 81, type: !5)
!125 = !DILocation(line: 0, scope: !120)
!126 = !DILocation(line: 82, column: 14, scope: !120)
!127 = !DILocation(line: 82, column: 12, scope: !120)
!128 = !DILocation(line: 83, column: 1, scope: !120)
!129 = distinct !DISubprogram(name: "copy_matrix", scope: !3, file: !3, line: 297, type: !130, scopeLine: 297, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !133)
!130 = !DISubroutineType(types: !131)
!131 = !{!132, !38, !132}
!132 = !DIDerivedType(tag: DW_TAG_typedef, name: "Matrix", file: !3, line: 116, baseType: !18)
!133 = !{!134, !135, !136, !137, !140, !141, !142, !143, !144}
!134 = !DILocalVariable(name: "depth", arg: 1, scope: !129, file: !3, line: 297, type: !38)
!135 = !DILocalVariable(name: "a", arg: 2, scope: !129, file: !3, line: 297, type: !132)
!136 = !DILocalVariable(name: "r", scope: !129, file: !3, line: 299, type: !132)
!137 = !DILocalVariable(name: "A", scope: !138, file: !3, line: 306, type: !6)
!138 = distinct !DILexicalBlock(scope: !139, file: !3, line: 305, column: 29)
!139 = distinct !DILexicalBlock(scope: !129, file: !3, line: 305, column: 7)
!140 = !DILocalVariable(name: "R", scope: !138, file: !3, line: 307, type: !6)
!141 = !DILocalVariable(name: "r00", scope: !129, file: !3, line: 315, type: !132)
!142 = !DILocalVariable(name: "r01", scope: !129, file: !3, line: 315, type: !132)
!143 = !DILocalVariable(name: "r10", scope: !129, file: !3, line: 315, type: !132)
!144 = !DILocalVariable(name: "r11", scope: !129, file: !3, line: 315, type: !132)
!145 = !DILocation(line: 0, scope: !129)
!146 = !DILocation(line: 301, column: 8, scope: !147)
!147 = distinct !DILexicalBlock(scope: !129, file: !3, line: 301, column: 7)
!148 = !DILocation(line: 301, column: 7, scope: !129)
!149 = !DILocation(line: 305, column: 13, scope: !139)
!150 = !DILocation(line: 305, column: 7, scope: !129)
!151 = !DILocation(line: 0, scope: !138)
!152 = !DILocation(line: 264, column: 33, scope: !153, inlinedAt: !158)
!153 = distinct !DISubprogram(name: "new_block_leaf", scope: !3, file: !3, line: 262, type: !154, scopeLine: 262, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !156)
!154 = !DISubroutineType(types: !155)
!155 = !{!18}
!156 = !{!157}
!157 = !DILocalVariable(name: "leaf", scope: !153, file: !3, line: 264, type: !6)
!158 = distinct !DILocation(line: 308, column: 9, scope: !138)
!159 = !DILocation(line: 0, scope: !153, inlinedAt: !158)
!160 = !DILocation(line: 266, column: 12, scope: !161, inlinedAt: !158)
!161 = distinct !DILexicalBlock(scope: !153, file: !3, line: 266, column: 7)
!162 = !DILocation(line: 266, column: 7, scope: !153, inlinedAt: !158)
!163 = !DILocation(line: 267, column: 5, scope: !164, inlinedAt: !158)
!164 = distinct !DILexicalBlock(scope: !161, file: !3, line: 266, column: 21)
!165 = !DILocation(line: 268, column: 5, scope: !164, inlinedAt: !158)
!166 = !DILocation(line: 270, column: 10, scope: !153, inlinedAt: !158)
!167 = !DILocation(line: 310, column: 5, scope: !138)
!168 = !DILocation(line: 315, column: 3, scope: !129)
!169 = !DILocation(line: 315, column: 10, scope: !129)
!170 = !{!171, !171, i64 0}
!171 = !{!"any pointer", !66, i64 0}
!172 = !DILocation(line: 315, column: 22, scope: !129)
!173 = !DILocation(line: 315, column: 34, scope: !129)
!174 = !DILocation(line: 317, column: 8, scope: !129)
!175 = !DILocation(line: 319, column: 39, scope: !129)
!176 = !DILocation(line: 319, column: 20, scope: !129)
!177 = !DILocation(line: 319, column: 7, scope: !129)
!178 = !DILocation(line: 320, column: 39, scope: !129)
!179 = !DILocation(line: 320, column: 20, scope: !129)
!180 = !DILocation(line: 320, column: 7, scope: !129)
!181 = !DILocation(line: 321, column: 39, scope: !129)
!182 = !DILocation(line: 321, column: 20, scope: !129)
!183 = !DILocation(line: 321, column: 7, scope: !129)
!184 = !DILocation(line: 322, column: 28, scope: !129)
!185 = !DILocation(line: 322, column: 9, scope: !129)
!186 = !DILocation(line: 324, column: 3, scope: !129)
!187 = !DILocation(line: 326, column: 21, scope: !129)
!188 = !DILocation(line: 326, column: 26, scope: !129)
!189 = !DILocation(line: 326, column: 31, scope: !129)
!190 = !DILocalVariable(name: "a00", arg: 1, scope: !191, file: !3, line: 277, type: !18)
!191 = distinct !DISubprogram(name: "new_internal", scope: !3, file: !3, line: 277, type: !192, scopeLine: 278, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !194)
!192 = !DISubroutineType(types: !193)
!193 = !{!18, !18, !18, !18, !18}
!194 = !{!190, !195, !196, !197, !198}
!195 = !DILocalVariable(name: "a01", arg: 2, scope: !191, file: !3, line: 277, type: !18)
!196 = !DILocalVariable(name: "a10", arg: 3, scope: !191, file: !3, line: 278, type: !18)
!197 = !DILocalVariable(name: "a11", arg: 4, scope: !191, file: !3, line: 278, type: !18)
!198 = !DILocalVariable(name: "node", scope: !191, file: !3, line: 280, type: !18)
!199 = !DILocation(line: 0, scope: !191, inlinedAt: !200)
!200 = distinct !DILocation(line: 326, column: 7, scope: !129)
!201 = !DILocation(line: 280, column: 41, scope: !191, inlinedAt: !200)
!202 = !DILocation(line: 280, column: 24, scope: !191, inlinedAt: !200)
!203 = !DILocation(line: 282, column: 12, scope: !204, inlinedAt: !200)
!204 = distinct !DILexicalBlock(scope: !191, file: !3, line: 282, column: 7)
!205 = !DILocation(line: 282, column: 7, scope: !191, inlinedAt: !200)
!206 = !DILocation(line: 283, column: 5, scope: !207, inlinedAt: !200)
!207 = distinct !DILexicalBlock(scope: !204, file: !3, line: 282, column: 21)
!208 = !DILocation(line: 284, column: 5, scope: !207, inlinedAt: !200)
!209 = !DILocation(line: 286, column: 3, scope: !191, inlinedAt: !200)
!210 = !DILocation(line: 286, column: 20, scope: !191, inlinedAt: !200)
!211 = !DILocation(line: 287, column: 3, scope: !191, inlinedAt: !200)
!212 = !DILocation(line: 287, column: 20, scope: !191, inlinedAt: !200)
!213 = !DILocation(line: 288, column: 3, scope: !191, inlinedAt: !200)
!214 = !DILocation(line: 288, column: 20, scope: !191, inlinedAt: !200)
!215 = !DILocation(line: 289, column: 3, scope: !191, inlinedAt: !200)
!216 = !DILocation(line: 289, column: 20, scope: !191, inlinedAt: !200)
!217 = !DILocation(line: 329, column: 1, scope: !129)
!218 = distinct !DISubprogram(name: "free_matrix", scope: !3, file: !3, line: 335, type: !219, scopeLine: 335, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !221)
!219 = !DISubroutineType(types: !220)
!220 = !{null, !38, !132}
!221 = !{!222, !223}
!222 = !DILocalVariable(name: "depth", arg: 1, scope: !218, file: !3, line: 335, type: !38)
!223 = !DILocalVariable(name: "a", arg: 2, scope: !218, file: !3, line: 335, type: !132)
!224 = !DILocation(line: 0, scope: !218)
!225 = !DILocation(line: 337, column: 9, scope: !226)
!226 = distinct !DILexicalBlock(scope: !218, file: !3, line: 337, column: 7)
!227 = !DILocation(line: 337, column: 7, scope: !218)
!228 = !DILocation(line: 339, column: 13, scope: !229)
!229 = distinct !DILexicalBlock(scope: !218, file: !3, line: 339, column: 7)
!230 = !DILocation(line: 339, column: 7, scope: !218)
!231 = !DILocation(line: 0, scope: !229)
!232 = !DILocation(line: 350, column: 1, scope: !218)
!233 = !DILocation(line: 343, column: 10, scope: !234)
!234 = distinct !DILexicalBlock(scope: !229, file: !3, line: 341, column: 10)
!235 = !DILocation(line: 344, column: 25, scope: !234)
!236 = !DILocation(line: 344, column: 5, scope: !234)
!237 = !DILocation(line: 345, column: 25, scope: !234)
!238 = !DILocation(line: 345, column: 5, scope: !234)
!239 = !DILocation(line: 346, column: 25, scope: !234)
!240 = !DILocation(line: 346, column: 5, scope: !234)
!241 = !DILocation(line: 347, column: 25, scope: !234)
!242 = !DILocation(line: 347, column: 5, scope: !234)
!243 = distinct !DISubprogram(name: "get_matrix", scope: !3, file: !3, line: 360, type: !244, scopeLine: 360, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !246)
!244 = !DISubroutineType(types: !245)
!245 = !{!13, !38, !132, !38, !38}
!246 = !{!247, !248, !249, !250, !251, !254}
!247 = !DILocalVariable(name: "depth", arg: 1, scope: !243, file: !3, line: 360, type: !38)
!248 = !DILocalVariable(name: "a", arg: 2, scope: !243, file: !3, line: 360, type: !132)
!249 = !DILocalVariable(name: "r", arg: 3, scope: !243, file: !3, line: 360, type: !38)
!250 = !DILocalVariable(name: "c", arg: 4, scope: !243, file: !3, line: 360, type: !38)
!251 = !DILocalVariable(name: "A", scope: !252, file: !3, line: 370, type: !6)
!252 = distinct !DILexicalBlock(scope: !253, file: !3, line: 369, column: 29)
!253 = distinct !DILexicalBlock(scope: !243, file: !3, line: 369, column: 7)
!254 = !DILocalVariable(name: "mid", scope: !255, file: !3, line: 374, type: !38)
!255 = distinct !DILexicalBlock(scope: !253, file: !3, line: 373, column: 10)
!256 = !DILocation(line: 0, scope: !243)
!257 = !DILocation(line: 362, column: 3, scope: !243)
!258 = !DILocation(line: 363, column: 3, scope: !243)
!259 = !DILocation(line: 364, column: 3, scope: !243)
!260 = !DILocation(line: 366, column: 9, scope: !261)
!261 = distinct !DILexicalBlock(scope: !243, file: !3, line: 366, column: 7)
!262 = !DILocation(line: 366, column: 7, scope: !243)
!263 = !DILocation(line: 369, column: 13, scope: !253)
!264 = !DILocation(line: 369, column: 7, scope: !243)
!265 = !DILocation(line: 0, scope: !252)
!266 = !DILocation(line: 371, column: 12, scope: !252)
!267 = !DILocation(line: 376, column: 10, scope: !255)
!268 = !DILocation(line: 377, column: 13, scope: !255)
!269 = !DILocation(line: 0, scope: !255)
!270 = !DILocation(line: 379, column: 11, scope: !271)
!271 = distinct !DILexicalBlock(scope: !255, file: !3, line: 379, column: 9)
!272 = !DILocation(line: 0, scope: !271)
!273 = !DILocation(line: 379, column: 9, scope: !255)
!274 = !DILocation(line: 380, column: 11, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !3, line: 379, column: 18)
!276 = !DILocation(line: 381, column: 35, scope: !277)
!277 = distinct !DILexicalBlock(scope: !275, file: !3, line: 380, column: 11)
!278 = !DILocation(line: 383, column: 35, scope: !277)
!279 = !DILocation(line: 383, column: 55, scope: !277)
!280 = !DILocation(line: 386, column: 11, scope: !281)
!281 = distinct !DILexicalBlock(scope: !271, file: !3, line: 385, column: 10)
!282 = !DILocation(line: 0, scope: !283)
!283 = distinct !DILexicalBlock(scope: !281, file: !3, line: 386, column: 11)
!284 = !DILocation(line: 392, column: 1, scope: !243)
!285 = distinct !DISubprogram(name: "set_matrix", scope: !3, file: !3, line: 398, type: !286, scopeLine: 398, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !288)
!286 = !DISubroutineType(types: !287)
!287 = !{!132, !38, !132, !38, !38, !13}
!288 = !{!289, !290, !291, !292, !293, !294, !297}
!289 = !DILocalVariable(name: "depth", arg: 1, scope: !285, file: !3, line: 398, type: !38)
!290 = !DILocalVariable(name: "a", arg: 2, scope: !285, file: !3, line: 398, type: !132)
!291 = !DILocalVariable(name: "r", arg: 3, scope: !285, file: !3, line: 398, type: !38)
!292 = !DILocalVariable(name: "c", arg: 4, scope: !285, file: !3, line: 398, type: !38)
!293 = !DILocalVariable(name: "value", arg: 5, scope: !285, file: !3, line: 398, type: !13)
!294 = !DILocalVariable(name: "A", scope: !295, file: !3, line: 405, type: !6)
!295 = distinct !DILexicalBlock(scope: !296, file: !3, line: 404, column: 29)
!296 = distinct !DILexicalBlock(scope: !285, file: !3, line: 404, column: 7)
!297 = !DILocalVariable(name: "mid", scope: !298, file: !3, line: 417, type: !38)
!298 = distinct !DILexicalBlock(scope: !296, file: !3, line: 416, column: 10)
!299 = !DILocation(line: 0, scope: !285)
!300 = !DILocation(line: 400, column: 3, scope: !285)
!301 = !DILocation(line: 401, column: 3, scope: !285)
!302 = !DILocation(line: 402, column: 3, scope: !285)
!303 = !DILocation(line: 404, column: 13, scope: !296)
!304 = !DILocation(line: 0, scope: !296)
!305 = !DILocation(line: 404, column: 7, scope: !285)
!306 = !DILocation(line: 406, column: 9, scope: !295)
!307 = !DILocation(line: 264, column: 33, scope: !153, inlinedAt: !308)
!308 = distinct !DILocation(line: 407, column: 11, scope: !309)
!309 = distinct !DILexicalBlock(scope: !310, file: !3, line: 406, column: 20)
!310 = distinct !DILexicalBlock(scope: !295, file: !3, line: 406, column: 9)
!311 = !DILocation(line: 0, scope: !153, inlinedAt: !308)
!312 = !DILocation(line: 266, column: 12, scope: !161, inlinedAt: !308)
!313 = !DILocation(line: 266, column: 7, scope: !153, inlinedAt: !308)
!314 = !DILocation(line: 267, column: 5, scope: !164, inlinedAt: !308)
!315 = !DILocation(line: 268, column: 5, scope: !164, inlinedAt: !308)
!316 = !DILocation(line: 270, column: 10, scope: !153, inlinedAt: !308)
!317 = !DILocation(line: 0, scope: !295)
!318 = !DILocalVariable(name: "i", scope: !319, file: !3, line: 245, type: !38)
!319 = distinct !DISubprogram(name: "block_zero", scope: !3, file: !3, line: 243, type: !320, scopeLine: 243, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !324)
!320 = !DISubroutineType(types: !321)
!321 = !{null, !322}
!322 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !323, size: 64)
!323 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 256, elements: !25)
!324 = !{!325, !318, !326}
!325 = !DILocalVariable(name: "B", arg: 1, scope: !319, file: !3, line: 243, type: !322)
!326 = !DILocalVariable(name: "k", scope: !319, file: !3, line: 245, type: !38)
!327 = !DILocation(line: 0, scope: !319, inlinedAt: !328)
!328 = distinct !DILocation(line: 409, column: 7, scope: !309)
!329 = !DILocation(line: 411, column: 5, scope: !309)
!330 = !DILocation(line: 0, scope: !310)
!331 = !DILocation(line: 414, column: 5, scope: !295)
!332 = !DILocation(line: 414, column: 28, scope: !295)
!333 = !DILocation(line: 419, column: 9, scope: !298)
!334 = !DILocation(line: 0, scope: !191, inlinedAt: !335)
!335 = distinct !DILocation(line: 420, column: 11, scope: !336)
!336 = distinct !DILexicalBlock(scope: !298, file: !3, line: 419, column: 9)
!337 = !DILocation(line: 280, column: 41, scope: !191, inlinedAt: !335)
!338 = !DILocation(line: 282, column: 12, scope: !204, inlinedAt: !335)
!339 = !DILocation(line: 282, column: 7, scope: !191, inlinedAt: !335)
!340 = !DILocation(line: 283, column: 5, scope: !207, inlinedAt: !335)
!341 = !DILocation(line: 284, column: 5, scope: !207, inlinedAt: !335)
!342 = !DILocation(line: 280, column: 24, scope: !191, inlinedAt: !335)
!343 = !DILocation(line: 287, column: 20, scope: !191, inlinedAt: !335)
!344 = !DILocation(line: 420, column: 7, scope: !336)
!345 = !DILocation(line: 422, column: 10, scope: !298)
!346 = !DILocation(line: 423, column: 13, scope: !298)
!347 = !DILocation(line: 0, scope: !298)
!348 = !DILocation(line: 425, column: 11, scope: !349)
!349 = distinct !DILexicalBlock(scope: !298, file: !3, line: 425, column: 9)
!350 = !DILocation(line: 0, scope: !349)
!351 = !DILocation(line: 425, column: 9, scope: !298)
!352 = !DILocation(line: 426, column: 11, scope: !353)
!353 = distinct !DILexicalBlock(scope: !349, file: !3, line: 425, column: 18)
!354 = !DILocation(line: 442, column: 3, scope: !285)
!355 = !DILocation(line: 427, column: 44, scope: !356)
!356 = distinct !DILexicalBlock(scope: !353, file: !3, line: 426, column: 11)
!357 = !DILocation(line: 427, column: 25, scope: !356)
!358 = !DILocation(line: 427, column: 23, scope: !356)
!359 = !DILocation(line: 429, column: 44, scope: !356)
!360 = !DILocation(line: 430, column: 18, scope: !356)
!361 = !DILocation(line: 429, column: 25, scope: !356)
!362 = !DILocation(line: 429, column: 23, scope: !356)
!363 = !DILocation(line: 433, column: 11, scope: !364)
!364 = distinct !DILexicalBlock(scope: !349, file: !3, line: 432, column: 12)
!365 = !DILocation(line: 434, column: 44, scope: !366)
!366 = distinct !DILexicalBlock(scope: !364, file: !3, line: 433, column: 11)
!367 = !DILocation(line: 435, column: 15, scope: !366)
!368 = !DILocation(line: 434, column: 25, scope: !366)
!369 = !DILocation(line: 434, column: 23, scope: !366)
!370 = !DILocation(line: 437, column: 44, scope: !366)
!371 = !DILocation(line: 438, column: 15, scope: !366)
!372 = !DILocation(line: 438, column: 24, scope: !366)
!373 = !DILocation(line: 437, column: 25, scope: !366)
!374 = !DILocation(line: 437, column: 23, scope: !366)
!375 = distinct !DISubprogram(name: "print_matrix_aux", scope: !3, file: !3, line: 446, type: !376, scopeLine: 446, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !378)
!376 = !DISubroutineType(types: !377)
!377 = !{null, !38, !132, !38, !38}
!378 = !{!379, !380, !381, !382, !383, !386, !387, !388}
!379 = !DILocalVariable(name: "depth", arg: 1, scope: !375, file: !3, line: 446, type: !38)
!380 = !DILocalVariable(name: "a", arg: 2, scope: !375, file: !3, line: 446, type: !132)
!381 = !DILocalVariable(name: "r", arg: 3, scope: !375, file: !3, line: 446, type: !38)
!382 = !DILocalVariable(name: "c", arg: 4, scope: !375, file: !3, line: 446, type: !38)
!383 = !DILocalVariable(name: "A", scope: !384, file: !3, line: 452, type: !6)
!384 = distinct !DILexicalBlock(scope: !385, file: !3, line: 451, column: 29)
!385 = distinct !DILexicalBlock(scope: !375, file: !3, line: 451, column: 7)
!386 = !DILocalVariable(name: "i", scope: !384, file: !3, line: 453, type: !38)
!387 = !DILocalVariable(name: "j", scope: !384, file: !3, line: 453, type: !38)
!388 = !DILocalVariable(name: "mid", scope: !389, file: !3, line: 459, type: !38)
!389 = distinct !DILexicalBlock(scope: !385, file: !3, line: 458, column: 10)
!390 = !DILocation(line: 0, scope: !375)
!391 = !DILocation(line: 448, column: 9, scope: !392)
!392 = distinct !DILexicalBlock(scope: !375, file: !3, line: 448, column: 7)
!393 = !DILocation(line: 448, column: 7, scope: !375)
!394 = !DILocation(line: 451, column: 13, scope: !385)
!395 = !DILocation(line: 451, column: 7, scope: !375)
!396 = !DILocation(line: 0, scope: !384)
!397 = !DILocation(line: 456, column: 50, scope: !398)
!398 = distinct !DILexicalBlock(scope: !399, file: !3, line: 455, column: 7)
!399 = distinct !DILexicalBlock(scope: !400, file: !3, line: 455, column: 7)
!400 = distinct !DILexicalBlock(scope: !401, file: !3, line: 454, column: 5)
!401 = distinct !DILexicalBlock(scope: !384, file: !3, line: 454, column: 5)
!402 = !DILocation(line: 456, column: 9, scope: !398)
!403 = !DILocation(line: 456, column: 45, scope: !398)
!404 = !DILocation(line: 467, column: 1, scope: !375)
!405 = !DILocation(line: 460, column: 10, scope: !389)
!406 = !DILocation(line: 461, column: 13, scope: !389)
!407 = !DILocation(line: 0, scope: !389)
!408 = !DILocation(line: 462, column: 30, scope: !389)
!409 = !DILocation(line: 462, column: 5, scope: !389)
!410 = !DILocation(line: 463, column: 30, scope: !389)
!411 = !DILocation(line: 463, column: 50, scope: !389)
!412 = !DILocation(line: 463, column: 5, scope: !389)
!413 = !DILocation(line: 464, column: 30, scope: !389)
!414 = !DILocation(line: 464, column: 47, scope: !389)
!415 = !DILocation(line: 464, column: 5, scope: !389)
!416 = !DILocation(line: 465, column: 30, scope: !389)
!417 = distinct !DISubprogram(name: "print_matrix", scope: !3, file: !3, line: 473, type: !219, scopeLine: 473, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !418)
!418 = !{!419, !420}
!419 = !DILocalVariable(name: "depth", arg: 1, scope: !417, file: !3, line: 473, type: !38)
!420 = !DILocalVariable(name: "a", arg: 2, scope: !417, file: !3, line: 473, type: !132)
!421 = !DILocation(line: 0, scope: !417)
!422 = !DILocation(line: 474, column: 3, scope: !417)
!423 = !DILocation(line: 475, column: 1, scope: !417)
!424 = distinct !DISubprogram(name: "num_blocks", scope: !3, file: !3, line: 481, type: !425, scopeLine: 481, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !427)
!425 = !DISubroutineType(types: !426)
!426 = !{!38, !38, !132}
!427 = !{!428, !429, !430}
!428 = !DILocalVariable(name: "depth", arg: 1, scope: !424, file: !3, line: 481, type: !38)
!429 = !DILocalVariable(name: "a", arg: 2, scope: !424, file: !3, line: 481, type: !132)
!430 = !DILocalVariable(name: "res", scope: !424, file: !3, line: 483, type: !38)
!431 = !DILocation(line: 0, scope: !424)
!432 = !DILocation(line: 484, column: 9, scope: !433)
!433 = distinct !DILexicalBlock(scope: !424, file: !3, line: 484, column: 7)
!434 = !DILocation(line: 484, column: 7, scope: !424)
!435 = !DILocation(line: 486, column: 13, scope: !436)
!436 = distinct !DILexicalBlock(scope: !424, file: !3, line: 486, column: 7)
!437 = !DILocation(line: 486, column: 7, scope: !424)
!438 = !DILocation(line: 489, column: 8, scope: !424)
!439 = !DILocation(line: 491, column: 29, scope: !424)
!440 = !DILocation(line: 491, column: 10, scope: !424)
!441 = !DILocation(line: 492, column: 29, scope: !424)
!442 = !DILocation(line: 492, column: 10, scope: !424)
!443 = !DILocation(line: 493, column: 29, scope: !424)
!444 = !DILocation(line: 493, column: 10, scope: !424)
!445 = !DILocation(line: 494, column: 29, scope: !424)
!446 = !DILocation(line: 492, column: 7, scope: !424)
!447 = !DILocation(line: 493, column: 7, scope: !424)
!448 = !DILocation(line: 494, column: 7, scope: !424)
!449 = !DILocation(line: 496, column: 1, scope: !424)
!450 = distinct !DISubprogram(name: "num_nonzeros", scope: !3, file: !3, line: 502, type: !425, scopeLine: 502, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !451)
!451 = !{!452, !453, !454, !455, !458, !459}
!452 = !DILocalVariable(name: "depth", arg: 1, scope: !450, file: !3, line: 502, type: !38)
!453 = !DILocalVariable(name: "a", arg: 2, scope: !450, file: !3, line: 502, type: !132)
!454 = !DILocalVariable(name: "res", scope: !450, file: !3, line: 504, type: !38)
!455 = !DILocalVariable(name: "A", scope: !456, file: !3, line: 508, type: !6)
!456 = distinct !DILexicalBlock(scope: !457, file: !3, line: 507, column: 29)
!457 = distinct !DILexicalBlock(scope: !450, file: !3, line: 507, column: 7)
!458 = !DILocalVariable(name: "i", scope: !456, file: !3, line: 509, type: !38)
!459 = !DILocalVariable(name: "j", scope: !456, file: !3, line: 509, type: !38)
!460 = !DILocation(line: 0, scope: !450)
!461 = !DILocation(line: 505, column: 9, scope: !462)
!462 = distinct !DILexicalBlock(scope: !450, file: !3, line: 505, column: 7)
!463 = !DILocation(line: 505, column: 7, scope: !450)
!464 = !DILocation(line: 507, column: 13, scope: !457)
!465 = !DILocation(line: 507, column: 7, scope: !450)
!466 = !DILocation(line: 0, scope: !456)
!467 = !DILocation(line: 513, column: 13, scope: !468)
!468 = distinct !DILexicalBlock(scope: !469, file: !3, line: 513, column: 13)
!469 = distinct !DILexicalBlock(scope: !470, file: !3, line: 512, column: 40)
!470 = distinct !DILexicalBlock(scope: !471, file: !3, line: 512, column: 7)
!471 = distinct !DILexicalBlock(scope: !472, file: !3, line: 512, column: 7)
!472 = distinct !DILexicalBlock(scope: !473, file: !3, line: 511, column: 38)
!473 = distinct !DILexicalBlock(scope: !474, file: !3, line: 511, column: 5)
!474 = distinct !DILexicalBlock(scope: !456, file: !3, line: 511, column: 5)
!475 = !DILocation(line: 513, column: 36, scope: !468)
!476 = !DILocation(line: 513, column: 13, scope: !469)
!477 = !{i16 0, i16 17}
!478 = !DILocation(line: 524, column: 7, scope: !450)
!479 = !DILocation(line: 519, column: 8, scope: !450)
!480 = !DILocation(line: 521, column: 31, scope: !450)
!481 = !DILocation(line: 521, column: 10, scope: !450)
!482 = !DILocation(line: 522, column: 31, scope: !450)
!483 = !DILocation(line: 522, column: 10, scope: !450)
!484 = !DILocation(line: 523, column: 31, scope: !450)
!485 = !DILocation(line: 523, column: 10, scope: !450)
!486 = !DILocation(line: 524, column: 31, scope: !450)
!487 = !DILocation(line: 522, column: 7, scope: !450)
!488 = !DILocation(line: 523, column: 7, scope: !450)
!489 = !DILocation(line: 526, column: 1, scope: !450)
!490 = distinct !DISubprogram(name: "mag", scope: !3, file: !3, line: 532, type: !491, scopeLine: 532, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !493)
!491 = !DISubroutineType(types: !492)
!492 = !{!13, !38, !132}
!493 = !{!494, !495, !496, !497, !500, !501}
!494 = !DILocalVariable(name: "depth", arg: 1, scope: !490, file: !3, line: 532, type: !38)
!495 = !DILocalVariable(name: "a", arg: 2, scope: !490, file: !3, line: 532, type: !132)
!496 = !DILocalVariable(name: "res", scope: !490, file: !3, line: 534, type: !13)
!497 = !DILocalVariable(name: "A", scope: !498, file: !3, line: 539, type: !6)
!498 = distinct !DILexicalBlock(scope: !499, file: !3, line: 538, column: 29)
!499 = distinct !DILexicalBlock(scope: !490, file: !3, line: 538, column: 7)
!500 = !DILocalVariable(name: "i", scope: !498, file: !3, line: 540, type: !38)
!501 = !DILocalVariable(name: "j", scope: !498, file: !3, line: 540, type: !38)
!502 = !DILocation(line: 0, scope: !490)
!503 = !DILocation(line: 535, column: 8, scope: !504)
!504 = distinct !DILexicalBlock(scope: !490, file: !3, line: 535, column: 7)
!505 = !DILocation(line: 535, column: 7, scope: !490)
!506 = !DILocation(line: 538, column: 13, scope: !499)
!507 = !DILocation(line: 538, column: 7, scope: !490)
!508 = !DILocation(line: 0, scope: !498)
!509 = !DILocation(line: 543, column: 16, scope: !510)
!510 = distinct !DILexicalBlock(scope: !511, file: !3, line: 542, column: 7)
!511 = distinct !DILexicalBlock(scope: !512, file: !3, line: 542, column: 7)
!512 = distinct !DILexicalBlock(scope: !513, file: !3, line: 541, column: 5)
!513 = distinct !DILexicalBlock(scope: !498, file: !3, line: 541, column: 5)
!514 = !DILocation(line: 543, column: 13, scope: !510)
!515 = !DILocation(line: 554, column: 1, scope: !490)
!516 = !DILocation(line: 546, column: 10, scope: !517)
!517 = distinct !DILexicalBlock(scope: !499, file: !3, line: 545, column: 10)
!518 = !DILocation(line: 547, column: 24, scope: !517)
!519 = !DILocation(line: 547, column: 12, scope: !517)
!520 = !DILocation(line: 547, column: 9, scope: !517)
!521 = !DILocation(line: 548, column: 24, scope: !517)
!522 = !DILocation(line: 548, column: 12, scope: !517)
!523 = !DILocation(line: 548, column: 9, scope: !517)
!524 = !DILocation(line: 549, column: 24, scope: !517)
!525 = !DILocation(line: 549, column: 12, scope: !517)
!526 = !DILocation(line: 549, column: 9, scope: !517)
!527 = !DILocation(line: 550, column: 24, scope: !517)
!528 = !DILocation(line: 550, column: 12, scope: !517)
!529 = !DILocation(line: 550, column: 9, scope: !517)
!530 = distinct !DISubprogram(name: "mul_and_subT", scope: !3, file: !3, line: 565, type: !531, scopeLine: 565, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !533)
!531 = !DISubroutineType(types: !532)
!532 = !{!132, !38, !38, !132, !132, !132}
!533 = !{!534, !535, !536, !537, !538, !539, !542, !543, !544, !545, !546, !547}
!534 = !DILocalVariable(name: "depth", arg: 1, scope: !530, file: !3, line: 565, type: !38)
!535 = !DILocalVariable(name: "lower", arg: 2, scope: !530, file: !3, line: 565, type: !38)
!536 = !DILocalVariable(name: "a", arg: 3, scope: !530, file: !3, line: 565, type: !132)
!537 = !DILocalVariable(name: "b", arg: 4, scope: !530, file: !3, line: 565, type: !132)
!538 = !DILocalVariable(name: "r", arg: 5, scope: !530, file: !3, line: 565, type: !132)
!539 = !DILocalVariable(name: "A", scope: !540, file: !3, line: 570, type: !6)
!540 = distinct !DILexicalBlock(scope: !541, file: !3, line: 569, column: 29)
!541 = distinct !DILexicalBlock(scope: !530, file: !3, line: 569, column: 7)
!542 = !DILocalVariable(name: "B", scope: !540, file: !3, line: 571, type: !6)
!543 = !DILocalVariable(name: "R", scope: !540, file: !3, line: 572, type: !6)
!544 = !DILocalVariable(name: "r00", scope: !530, file: !3, line: 590, type: !132)
!545 = !DILocalVariable(name: "r01", scope: !530, file: !3, line: 590, type: !132)
!546 = !DILocalVariable(name: "r10", scope: !530, file: !3, line: 590, type: !132)
!547 = !DILocalVariable(name: "r11", scope: !530, file: !3, line: 590, type: !132)
!548 = !DILocation(line: 0, scope: !549)
!549 = distinct !DILexicalBlock(scope: !550, file: !3, line: 607, column: 41)
!550 = distinct !DILexicalBlock(scope: !530, file: !3, line: 607, column: 7)
!551 = !DILocation(line: 0, scope: !530)
!552 = !DILocation(line: 567, column: 3, scope: !530)
!553 = !DILocation(line: 569, column: 13, scope: !541)
!554 = !DILocation(line: 569, column: 7, scope: !530)
!555 = !DILocation(line: 0, scope: !540)
!556 = !DILocation(line: 574, column: 11, scope: !557)
!557 = distinct !DILexicalBlock(scope: !540, file: !3, line: 574, column: 9)
!558 = !DILocation(line: 574, column: 9, scope: !540)
!559 = !DILocation(line: 264, column: 33, scope: !153, inlinedAt: !560)
!560 = distinct !DILocation(line: 575, column: 11, scope: !561)
!561 = distinct !DILexicalBlock(scope: !557, file: !3, line: 574, column: 20)
!562 = !DILocation(line: 0, scope: !153, inlinedAt: !560)
!563 = !DILocation(line: 266, column: 12, scope: !161, inlinedAt: !560)
!564 = !DILocation(line: 266, column: 7, scope: !153, inlinedAt: !560)
!565 = !DILocation(line: 267, column: 5, scope: !164, inlinedAt: !560)
!566 = !DILocation(line: 268, column: 5, scope: !164, inlinedAt: !560)
!567 = !DILocation(line: 270, column: 10, scope: !153, inlinedAt: !560)
!568 = !DILocation(line: 0, scope: !319, inlinedAt: !569)
!569 = distinct !DILocation(line: 577, column: 7, scope: !561)
!570 = !DILocation(line: 579, column: 5, scope: !561)
!571 = !DILocation(line: 582, column: 9, scope: !572)
!572 = distinct !DILexicalBlock(scope: !540, file: !3, line: 582, column: 9)
!573 = !DILocation(line: 582, column: 9, scope: !540)
!574 = !DILocalVariable(name: "B", arg: 1, scope: !575, file: !3, line: 153, type: !322)
!575 = distinct !DISubprogram(name: "block_schur_half", scope: !3, file: !3, line: 153, type: !576, scopeLine: 153, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !578)
!576 = !DISubroutineType(types: !577)
!577 = !{null, !322, !322, !322}
!578 = !{!574, !579, !580, !581, !582, !583}
!579 = !DILocalVariable(name: "A", arg: 2, scope: !575, file: !3, line: 153, type: !322)
!580 = !DILocalVariable(name: "C", arg: 3, scope: !575, file: !3, line: 153, type: !322)
!581 = !DILocalVariable(name: "i", scope: !575, file: !3, line: 155, type: !38)
!582 = !DILocalVariable(name: "j", scope: !575, file: !3, line: 155, type: !38)
!583 = !DILocalVariable(name: "k", scope: !575, file: !3, line: 155, type: !38)
!584 = !DILocation(line: 0, scope: !575, inlinedAt: !585)
!585 = distinct !DILocation(line: 583, column: 7, scope: !572)
!586 = !DILocation(line: 164, column: 28, scope: !587, inlinedAt: !585)
!587 = distinct !DILexicalBlock(scope: !588, file: !3, line: 163, column: 40)
!588 = distinct !DILexicalBlock(scope: !589, file: !3, line: 163, column: 7)
!589 = distinct !DILexicalBlock(scope: !590, file: !3, line: 163, column: 7)
!590 = distinct !DILexicalBlock(scope: !591, file: !3, line: 162, column: 48)
!591 = distinct !DILexicalBlock(scope: !592, file: !3, line: 162, column: 5)
!592 = distinct !DILexicalBlock(scope: !593, file: !3, line: 162, column: 5)
!593 = distinct !DILexicalBlock(scope: !594, file: !3, line: 161, column: 36)
!594 = distinct !DILexicalBlock(scope: !595, file: !3, line: 161, column: 3)
!595 = distinct !DILexicalBlock(scope: !575, file: !3, line: 161, column: 3)
!596 = !DILocation(line: 164, column: 46, scope: !587, inlinedAt: !585)
!597 = !DILocation(line: 164, column: 25, scope: !587, inlinedAt: !585)
!598 = !DILocation(line: 583, column: 7, scope: !572)
!599 = !DILocation(line: 585, column: 25, scope: !572)
!600 = !DILocation(line: 585, column: 35, scope: !572)
!601 = !DILocalVariable(name: "B", arg: 1, scope: !602, file: !3, line: 137, type: !322)
!602 = distinct !DISubprogram(name: "block_schur_full", scope: !3, file: !3, line: 137, type: !576, scopeLine: 137, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !603)
!603 = !{!601, !604, !605, !606, !607, !608}
!604 = !DILocalVariable(name: "A", arg: 2, scope: !602, file: !3, line: 137, type: !322)
!605 = !DILocalVariable(name: "C", arg: 3, scope: !602, file: !3, line: 137, type: !322)
!606 = !DILocalVariable(name: "i", scope: !602, file: !3, line: 139, type: !38)
!607 = !DILocalVariable(name: "j", scope: !602, file: !3, line: 139, type: !38)
!608 = !DILocalVariable(name: "k", scope: !602, file: !3, line: 139, type: !38)
!609 = !DILocation(line: 0, scope: !602, inlinedAt: !610)
!610 = distinct !DILocation(line: 585, column: 7, scope: !572)
!611 = !DILocation(line: 140, column: 3, scope: !612, inlinedAt: !610)
!612 = distinct !DILexicalBlock(scope: !602, file: !3, line: 140, column: 3)
!613 = !DILocation(line: 143, column: 28, scope: !614, inlinedAt: !610)
!614 = distinct !DILexicalBlock(scope: !615, file: !3, line: 142, column: 40)
!615 = distinct !DILexicalBlock(scope: !616, file: !3, line: 142, column: 7)
!616 = distinct !DILexicalBlock(scope: !617, file: !3, line: 142, column: 7)
!617 = distinct !DILexicalBlock(scope: !618, file: !3, line: 141, column: 38)
!618 = distinct !DILexicalBlock(scope: !619, file: !3, line: 141, column: 5)
!619 = distinct !DILexicalBlock(scope: !620, file: !3, line: 141, column: 5)
!620 = distinct !DILexicalBlock(scope: !621, file: !3, line: 140, column: 36)
!621 = distinct !DILexicalBlock(scope: !612, file: !3, line: 140, column: 3)
!622 = !DILocation(line: 143, column: 46, scope: !614, inlinedAt: !610)
!623 = !DILocation(line: 143, column: 25, scope: !614, inlinedAt: !610)
!624 = !DILocation(line: 140, column: 32, scope: !621, inlinedAt: !610)
!625 = !DILocation(line: 140, column: 17, scope: !621, inlinedAt: !610)
!626 = distinct !{!626, !611, !627, !628}
!627 = !DILocation(line: 146, column: 3, scope: !612, inlinedAt: !610)
!628 = !{!"llvm.loop.mustprogress"}
!629 = !DILocation(line: 590, column: 3, scope: !530)
!630 = !DILocation(line: 592, column: 8, scope: !530)
!631 = !DILocation(line: 594, column: 9, scope: !632)
!632 = distinct !DILexicalBlock(scope: !530, file: !3, line: 594, column: 7)
!633 = !DILocation(line: 594, column: 7, scope: !530)
!634 = !DILocation(line: 595, column: 11, scope: !635)
!635 = distinct !DILexicalBlock(scope: !632, file: !3, line: 594, column: 18)
!636 = !DILocation(line: 595, column: 9, scope: !635)
!637 = !DILocation(line: 596, column: 11, scope: !635)
!638 = !DILocation(line: 596, column: 9, scope: !635)
!639 = !DILocation(line: 597, column: 11, scope: !635)
!640 = !DILocation(line: 597, column: 9, scope: !635)
!641 = !DILocation(line: 598, column: 11, scope: !635)
!642 = !DILocation(line: 600, column: 3, scope: !635)
!643 = !DILocation(line: 601, column: 9, scope: !644)
!644 = distinct !DILexicalBlock(scope: !632, file: !3, line: 600, column: 10)
!645 = !DILocation(line: 602, column: 9, scope: !644)
!646 = !DILocation(line: 603, column: 9, scope: !644)
!647 = !DILocation(line: 0, scope: !632)
!648 = !DILocation(line: 607, column: 7, scope: !550)
!649 = !DILocation(line: 607, column: 21, scope: !550)
!650 = !DILocation(line: 607, column: 24, scope: !550)
!651 = !DILocation(line: 607, column: 7, scope: !530)
!652 = !DILocation(line: 608, column: 22, scope: !549)
!653 = !DILocation(line: 608, column: 9, scope: !549)
!654 = !DILocation(line: 612, column: 8, scope: !655)
!655 = distinct !DILexicalBlock(scope: !530, file: !3, line: 612, column: 7)
!656 = !DILocation(line: 612, column: 14, scope: !655)
!657 = !DILocation(line: 612, column: 17, scope: !655)
!658 = !DILocation(line: 612, column: 31, scope: !655)
!659 = !DILocation(line: 612, column: 34, scope: !655)
!660 = !DILocation(line: 612, column: 7, scope: !530)
!661 = !DILocation(line: 613, column: 22, scope: !662)
!662 = distinct !DILexicalBlock(scope: !655, file: !3, line: 612, column: 51)
!663 = !DILocation(line: 613, column: 9, scope: !662)
!664 = !DILocation(line: 617, column: 7, scope: !665)
!665 = distinct !DILexicalBlock(scope: !530, file: !3, line: 617, column: 7)
!666 = !DILocation(line: 617, column: 21, scope: !665)
!667 = !DILocation(line: 617, column: 24, scope: !665)
!668 = !DILocation(line: 617, column: 7, scope: !530)
!669 = !DILocation(line: 618, column: 22, scope: !670)
!670 = distinct !DILexicalBlock(scope: !665, file: !3, line: 617, column: 41)
!671 = !DILocation(line: 618, column: 9, scope: !670)
!672 = !DILocation(line: 622, column: 7, scope: !673)
!673 = distinct !DILexicalBlock(scope: !530, file: !3, line: 622, column: 7)
!674 = !DILocation(line: 622, column: 21, scope: !673)
!675 = !DILocation(line: 622, column: 24, scope: !673)
!676 = !DILocation(line: 622, column: 7, scope: !530)
!677 = !DILocation(line: 623, column: 22, scope: !678)
!678 = distinct !DILexicalBlock(scope: !673, file: !3, line: 622, column: 41)
!679 = !DILocation(line: 623, column: 9, scope: !678)
!680 = !DILocation(line: 626, column: 3, scope: !530)
!681 = !DILocation(line: 628, column: 7, scope: !682)
!682 = distinct !DILexicalBlock(scope: !530, file: !3, line: 628, column: 7)
!683 = !DILocation(line: 628, column: 21, scope: !682)
!684 = !DILocation(line: 628, column: 24, scope: !682)
!685 = !DILocation(line: 628, column: 7, scope: !530)
!686 = !DILocation(line: 630, column: 41, scope: !687)
!687 = distinct !DILexicalBlock(scope: !682, file: !3, line: 628, column: 41)
!688 = !DILocation(line: 629, column: 22, scope: !687)
!689 = !DILocation(line: 629, column: 9, scope: !687)
!690 = !DILocation(line: 633, column: 14, scope: !691)
!691 = distinct !DILexicalBlock(scope: !530, file: !3, line: 633, column: 7)
!692 = !DILocation(line: 633, column: 17, scope: !691)
!693 = !DILocation(line: 633, column: 31, scope: !691)
!694 = !DILocation(line: 633, column: 34, scope: !691)
!695 = !DILocation(line: 633, column: 7, scope: !530)
!696 = !DILocation(line: 635, column: 41, scope: !697)
!697 = distinct !DILexicalBlock(scope: !691, file: !3, line: 633, column: 51)
!698 = !DILocation(line: 634, column: 22, scope: !697)
!699 = !DILocation(line: 634, column: 9, scope: !697)
!700 = !DILocation(line: 638, column: 7, scope: !701)
!701 = distinct !DILexicalBlock(scope: !530, file: !3, line: 638, column: 7)
!702 = !DILocation(line: 638, column: 21, scope: !701)
!703 = !DILocation(line: 638, column: 24, scope: !701)
!704 = !DILocation(line: 638, column: 7, scope: !530)
!705 = !DILocation(line: 640, column: 41, scope: !706)
!706 = distinct !DILexicalBlock(scope: !701, file: !3, line: 638, column: 41)
!707 = !DILocation(line: 639, column: 22, scope: !706)
!708 = !DILocation(line: 639, column: 9, scope: !706)
!709 = !DILocation(line: 643, column: 7, scope: !710)
!710 = distinct !DILexicalBlock(scope: !530, file: !3, line: 643, column: 7)
!711 = !DILocation(line: 643, column: 21, scope: !710)
!712 = !DILocation(line: 643, column: 24, scope: !710)
!713 = !DILocation(line: 643, column: 7, scope: !530)
!714 = !DILocation(line: 644, column: 22, scope: !715)
!715 = distinct !DILexicalBlock(scope: !710, file: !3, line: 643, column: 41)
!716 = !DILocation(line: 644, column: 9, scope: !715)
!717 = !DILocation(line: 647, column: 3, scope: !530)
!718 = !DILocation(line: 649, column: 7, scope: !530)
!719 = !DILocation(line: 650, column: 9, scope: !720)
!720 = distinct !DILexicalBlock(scope: !721, file: !3, line: 650, column: 9)
!721 = distinct !DILexicalBlock(scope: !722, file: !3, line: 649, column: 18)
!722 = distinct !DILexicalBlock(scope: !530, file: !3, line: 649, column: 7)
!723 = !DILocation(line: 650, column: 13, scope: !720)
!724 = !DILocation(line: 0, scope: !191, inlinedAt: !725)
!725 = distinct !DILocation(line: 651, column: 11, scope: !720)
!726 = !DILocation(line: 280, column: 41, scope: !191, inlinedAt: !725)
!727 = !DILocation(line: 280, column: 24, scope: !191, inlinedAt: !725)
!728 = !DILocation(line: 282, column: 12, scope: !204, inlinedAt: !725)
!729 = !DILocation(line: 282, column: 7, scope: !191, inlinedAt: !725)
!730 = !DILocation(line: 283, column: 5, scope: !207, inlinedAt: !725)
!731 = !DILocation(line: 284, column: 5, scope: !207, inlinedAt: !725)
!732 = !DILocation(line: 286, column: 3, scope: !191, inlinedAt: !725)
!733 = !DILocation(line: 286, column: 20, scope: !191, inlinedAt: !725)
!734 = !DILocation(line: 287, column: 3, scope: !191, inlinedAt: !725)
!735 = !DILocation(line: 287, column: 20, scope: !191, inlinedAt: !725)
!736 = !DILocation(line: 288, column: 3, scope: !191, inlinedAt: !725)
!737 = !DILocation(line: 288, column: 20, scope: !191, inlinedAt: !725)
!738 = !DILocation(line: 289, column: 3, scope: !191, inlinedAt: !725)
!739 = !DILocation(line: 651, column: 7, scope: !720)
!740 = !DILocation(line: 654, column: 5, scope: !741)
!741 = distinct !DILexicalBlock(scope: !722, file: !3, line: 653, column: 10)
!742 = !DILocation(line: 655, column: 5, scope: !741)
!743 = !DILocation(line: 656, column: 5, scope: !741)
!744 = !DILocation(line: 657, column: 5, scope: !741)
!745 = !DILocation(line: 658, column: 19, scope: !741)
!746 = !DILocation(line: 659, column: 19, scope: !741)
!747 = !DILocation(line: 660, column: 19, scope: !741)
!748 = !DILocation(line: 0, scope: !722)
!749 = !DILocation(line: 665, column: 1, scope: !530)
!750 = distinct !DISubprogram(name: "backsub", scope: !3, file: !3, line: 672, type: !751, scopeLine: 672, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !753)
!751 = !DISubroutineType(types: !752)
!752 = !{!132, !38, !132, !132}
!753 = !{!754, !755, !756, !757, !760, !761, !762, !763, !764, !765, !766, !767}
!754 = !DILocalVariable(name: "depth", arg: 1, scope: !750, file: !3, line: 672, type: !38)
!755 = !DILocalVariable(name: "a", arg: 2, scope: !750, file: !3, line: 672, type: !132)
!756 = !DILocalVariable(name: "l", arg: 3, scope: !750, file: !3, line: 672, type: !132)
!757 = !DILocalVariable(name: "A", scope: !758, file: !3, line: 678, type: !6)
!758 = distinct !DILexicalBlock(scope: !759, file: !3, line: 677, column: 29)
!759 = distinct !DILexicalBlock(scope: !750, file: !3, line: 677, column: 7)
!760 = !DILocalVariable(name: "L", scope: !758, file: !3, line: 679, type: !6)
!761 = !DILocalVariable(name: "a00", scope: !750, file: !3, line: 685, type: !132)
!762 = !DILocalVariable(name: "a01", scope: !750, file: !3, line: 685, type: !132)
!763 = !DILocalVariable(name: "a10", scope: !750, file: !3, line: 685, type: !132)
!764 = !DILocalVariable(name: "a11", scope: !750, file: !3, line: 685, type: !132)
!765 = !DILocalVariable(name: "l00", scope: !750, file: !3, line: 686, type: !132)
!766 = !DILocalVariable(name: "l10", scope: !750, file: !3, line: 686, type: !132)
!767 = !DILocalVariable(name: "l11", scope: !750, file: !3, line: 686, type: !132)
!768 = !DILocation(line: 0, scope: !769)
!769 = distinct !DILexicalBlock(scope: !770, file: !3, line: 701, column: 12)
!770 = distinct !DILexicalBlock(scope: !750, file: !3, line: 701, column: 7)
!771 = !DILocation(line: 0, scope: !750)
!772 = !DILocation(line: 674, column: 3, scope: !750)
!773 = !DILocation(line: 675, column: 3, scope: !750)
!774 = !DILocation(line: 677, column: 13, scope: !759)
!775 = !DILocation(line: 677, column: 7, scope: !750)
!776 = !DILocation(line: 0, scope: !758)
!777 = !DILocation(line: 680, column: 20, scope: !758)
!778 = !DILocation(line: 680, column: 30, scope: !758)
!779 = !DILocalVariable(name: "B", arg: 1, scope: !780, file: !3, line: 175, type: !322)
!780 = distinct !DISubprogram(name: "block_backsub", scope: !3, file: !3, line: 175, type: !781, scopeLine: 175, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !783)
!781 = !DISubroutineType(types: !782)
!782 = !{null, !322, !322}
!783 = !{!779, !784, !785, !786, !787}
!784 = !DILocalVariable(name: "U", arg: 2, scope: !780, file: !3, line: 175, type: !322)
!785 = !DILocalVariable(name: "i", scope: !780, file: !3, line: 177, type: !38)
!786 = !DILocalVariable(name: "j", scope: !780, file: !3, line: 177, type: !38)
!787 = !DILocalVariable(name: "k", scope: !780, file: !3, line: 177, type: !38)
!788 = !DILocation(line: 0, scope: !780, inlinedAt: !789)
!789 = distinct !DILocation(line: 680, column: 5, scope: !758)
!790 = !DILocation(line: 180, column: 3, scope: !791, inlinedAt: !789)
!791 = distinct !DILexicalBlock(scope: !780, file: !3, line: 180, column: 3)
!792 = !DILocation(line: 182, column: 7, scope: !793, inlinedAt: !789)
!793 = distinct !DILexicalBlock(scope: !794, file: !3, line: 182, column: 7)
!794 = distinct !DILexicalBlock(scope: !795, file: !3, line: 181, column: 38)
!795 = distinct !DILexicalBlock(scope: !796, file: !3, line: 181, column: 5)
!796 = distinct !DILexicalBlock(scope: !797, file: !3, line: 181, column: 5)
!797 = distinct !DILexicalBlock(scope: !798, file: !3, line: 180, column: 36)
!798 = distinct !DILexicalBlock(scope: !791, file: !3, line: 180, column: 3)
!799 = !DILocation(line: 183, column: 25, scope: !800, inlinedAt: !789)
!800 = distinct !DILexicalBlock(scope: !801, file: !3, line: 182, column: 31)
!801 = distinct !DILexicalBlock(scope: !793, file: !3, line: 182, column: 7)
!802 = !DILocation(line: 183, column: 28, scope: !800, inlinedAt: !789)
!803 = !DILocation(line: 183, column: 46, scope: !800, inlinedAt: !789)
!804 = !DILocation(line: 182, column: 21, scope: !801, inlinedAt: !789)
!805 = distinct !{!805, !792, !806, !628}
!806 = !DILocation(line: 184, column: 7, scope: !793, inlinedAt: !789)
!807 = !DILocation(line: 185, column: 26, scope: !794, inlinedAt: !789)
!808 = !DILocation(line: 185, column: 23, scope: !794, inlinedAt: !789)
!809 = !DILocation(line: 180, column: 32, scope: !798, inlinedAt: !789)
!810 = !DILocation(line: 182, column: 27, scope: !801, inlinedAt: !789)
!811 = distinct !{!811, !792, !806, !628}
!812 = distinct !{!812, !792, !806, !628}
!813 = distinct !{!813, !792, !806, !628}
!814 = !DILocation(line: 180, column: 17, scope: !798, inlinedAt: !789)
!815 = distinct !{!815, !790, !816, !628}
!816 = !DILocation(line: 187, column: 3, scope: !791, inlinedAt: !789)
!817 = !DILocation(line: 685, column: 3, scope: !750)
!818 = !DILocation(line: 688, column: 8, scope: !750)
!819 = !DILocation(line: 690, column: 9, scope: !750)
!820 = !DILocation(line: 690, column: 7, scope: !750)
!821 = !DILocation(line: 691, column: 9, scope: !750)
!822 = !DILocation(line: 691, column: 7, scope: !750)
!823 = !DILocation(line: 692, column: 9, scope: !750)
!824 = !DILocation(line: 693, column: 9, scope: !750)
!825 = !DILocation(line: 695, column: 9, scope: !750)
!826 = !DILocation(line: 696, column: 9, scope: !750)
!827 = !DILocation(line: 697, column: 9, scope: !750)
!828 = !DILocation(line: 699, column: 3, scope: !750)
!829 = !DILocation(line: 701, column: 7, scope: !770)
!830 = !DILocation(line: 701, column: 7, scope: !750)
!831 = !DILocation(line: 702, column: 22, scope: !769)
!832 = !DILocation(line: 702, column: 9, scope: !769)
!833 = !DILocation(line: 704, column: 7, scope: !834)
!834 = distinct !DILexicalBlock(scope: !750, file: !3, line: 704, column: 7)
!835 = !DILocation(line: 704, column: 7, scope: !750)
!836 = !DILocation(line: 705, column: 22, scope: !837)
!837 = distinct !DILexicalBlock(scope: !834, file: !3, line: 704, column: 12)
!838 = !DILocation(line: 705, column: 9, scope: !837)
!839 = !DILocation(line: 707, column: 3, scope: !750)
!840 = !DILocation(line: 709, column: 7, scope: !841)
!841 = distinct !DILexicalBlock(scope: !750, file: !3, line: 709, column: 7)
!842 = !DILocation(line: 709, column: 11, scope: !841)
!843 = !DILocation(line: 710, column: 22, scope: !844)
!844 = distinct !DILexicalBlock(scope: !841, file: !3, line: 709, column: 19)
!845 = !DILocation(line: 710, column: 9, scope: !844)
!846 = !DILocation(line: 712, column: 7, scope: !847)
!847 = distinct !DILexicalBlock(scope: !750, file: !3, line: 712, column: 7)
!848 = !DILocation(line: 712, column: 11, scope: !847)
!849 = !DILocation(line: 713, column: 22, scope: !850)
!850 = distinct !DILexicalBlock(scope: !847, file: !3, line: 712, column: 19)
!851 = !DILocation(line: 713, column: 9, scope: !850)
!852 = !DILocation(line: 715, column: 3, scope: !750)
!853 = !DILocation(line: 717, column: 7, scope: !854)
!854 = distinct !DILexicalBlock(scope: !750, file: !3, line: 717, column: 7)
!855 = !DILocation(line: 717, column: 7, scope: !750)
!856 = !DILocation(line: 718, column: 22, scope: !857)
!857 = distinct !DILexicalBlock(scope: !854, file: !3, line: 717, column: 12)
!858 = !DILocation(line: 718, column: 9, scope: !857)
!859 = !DILocation(line: 720, column: 7, scope: !860)
!860 = distinct !DILexicalBlock(scope: !750, file: !3, line: 720, column: 7)
!861 = !DILocation(line: 720, column: 7, scope: !750)
!862 = !DILocation(line: 721, column: 22, scope: !863)
!863 = distinct !DILexicalBlock(scope: !860, file: !3, line: 720, column: 12)
!864 = !DILocation(line: 721, column: 9, scope: !863)
!865 = !DILocation(line: 723, column: 3, scope: !750)
!866 = !DILocation(line: 725, column: 17, scope: !750)
!867 = !DILocation(line: 726, column: 17, scope: !750)
!868 = !DILocation(line: 727, column: 17, scope: !750)
!869 = !DILocation(line: 728, column: 17, scope: !750)
!870 = !DILocation(line: 731, column: 1, scope: !750)
!871 = distinct !DISubprogram(name: "cholesky", scope: !3, file: !3, line: 737, type: !130, scopeLine: 737, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !872)
!872 = !{!873, !874, !875, !878, !879, !880}
!873 = !DILocalVariable(name: "depth", arg: 1, scope: !871, file: !3, line: 737, type: !38)
!874 = !DILocalVariable(name: "a", arg: 2, scope: !871, file: !3, line: 737, type: !132)
!875 = !DILocalVariable(name: "A", scope: !876, file: !3, line: 742, type: !6)
!876 = distinct !DILexicalBlock(scope: !877, file: !3, line: 741, column: 29)
!877 = distinct !DILexicalBlock(scope: !871, file: !3, line: 741, column: 7)
!878 = !DILocalVariable(name: "a00", scope: !871, file: !3, line: 748, type: !132)
!879 = !DILocalVariable(name: "a10", scope: !871, file: !3, line: 748, type: !132)
!880 = !DILocalVariable(name: "a11", scope: !871, file: !3, line: 748, type: !132)
!881 = !DILocation(line: 0, scope: !882)
!882 = distinct !DILexicalBlock(scope: !883, file: !3, line: 758, column: 12)
!883 = distinct !DILexicalBlock(scope: !871, file: !3, line: 758, column: 6)
!884 = !DILocation(line: 0, scope: !871)
!885 = !DILocation(line: 739, column: 3, scope: !871)
!886 = !DILocation(line: 741, column: 13, scope: !877)
!887 = !DILocation(line: 741, column: 7, scope: !871)
!888 = !DILocation(line: 0, scope: !876)
!889 = !DILocalVariable(name: "B", arg: 1, scope: !890, file: !3, line: 213, type: !322)
!890 = distinct !DISubprogram(name: "block_cholesky", scope: !3, file: !3, line: 213, type: !320, scopeLine: 213, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !891)
!891 = !{!889, !892, !893, !894, !895}
!892 = !DILocalVariable(name: "i", scope: !890, file: !3, line: 215, type: !38)
!893 = !DILocalVariable(name: "j", scope: !890, file: !3, line: 215, type: !38)
!894 = !DILocalVariable(name: "k", scope: !890, file: !3, line: 215, type: !38)
!895 = !DILocalVariable(name: "x", scope: !896, file: !3, line: 218, type: !13)
!896 = distinct !DILexicalBlock(scope: !897, file: !3, line: 217, column: 36)
!897 = distinct !DILexicalBlock(scope: !898, file: !3, line: 217, column: 3)
!898 = distinct !DILexicalBlock(scope: !890, file: !3, line: 217, column: 3)
!899 = !DILocation(line: 0, scope: !890, inlinedAt: !900)
!900 = distinct !DILocation(line: 743, column: 5, scope: !876)
!901 = !DILocation(line: 219, column: 9, scope: !902, inlinedAt: !900)
!902 = distinct !DILexicalBlock(scope: !896, file: !3, line: 219, column: 9)
!903 = !DILocation(line: 219, column: 25, scope: !902, inlinedAt: !900)
!904 = !DILocation(line: 219, column: 9, scope: !896, inlinedAt: !900)
!905 = !DILocation(line: 224, column: 9, scope: !896, inlinedAt: !900)
!906 = !DILocation(line: 0, scope: !896, inlinedAt: !900)
!907 = !DILocation(line: 226, column: 23, scope: !908, inlinedAt: !900)
!908 = distinct !DILexicalBlock(scope: !909, file: !3, line: 225, column: 38)
!909 = distinct !DILexicalBlock(scope: !910, file: !3, line: 225, column: 5)
!910 = distinct !DILexicalBlock(scope: !896, file: !3, line: 225, column: 5)
!911 = !DILocation(line: 226, column: 7, scope: !908, inlinedAt: !900)
!912 = !DILocation(line: 230, column: 9, scope: !913, inlinedAt: !900)
!913 = distinct !DILexicalBlock(scope: !914, file: !3, line: 229, column: 40)
!914 = distinct !DILexicalBlock(scope: !915, file: !3, line: 229, column: 7)
!915 = distinct !DILexicalBlock(scope: !916, file: !3, line: 229, column: 7)
!916 = distinct !DILexicalBlock(scope: !917, file: !3, line: 228, column: 42)
!917 = distinct !DILexicalBlock(scope: !918, file: !3, line: 228, column: 5)
!918 = distinct !DILexicalBlock(scope: !896, file: !3, line: 228, column: 5)
!919 = !DILocation(line: 230, column: 25, scope: !913, inlinedAt: !900)
!920 = !DILocation(line: 220, column: 7, scope: !921, inlinedAt: !900)
!921 = distinct !DILexicalBlock(scope: !902, file: !3, line: 219, column: 32)
!922 = !DILocation(line: 221, column: 7, scope: !921, inlinedAt: !900)
!923 = !DILocation(line: 222, column: 7, scope: !921, inlinedAt: !900)
!924 = !DILocation(line: 748, column: 3, scope: !871)
!925 = !DILocation(line: 750, column: 8, scope: !871)
!926 = !DILocation(line: 752, column: 9, scope: !871)
!927 = !DILocation(line: 752, column: 7, scope: !871)
!928 = !DILocation(line: 753, column: 9, scope: !871)
!929 = !DILocation(line: 754, column: 9, scope: !871)
!930 = !DILocation(line: 756, column: 3, scope: !871)
!931 = !DILocation(line: 758, column: 7, scope: !883)
!932 = !DILocation(line: 758, column: 6, scope: !871)
!933 = !DILocation(line: 759, column: 22, scope: !882)
!934 = !DILocation(line: 759, column: 9, scope: !882)
!935 = !DILocation(line: 760, column: 11, scope: !882)
!936 = !DILocation(line: 761, column: 5, scope: !882)
!937 = !DILocation(line: 764, column: 11, scope: !938)
!938 = distinct !DILexicalBlock(scope: !883, file: !3, line: 763, column: 10)
!939 = !DILocation(line: 764, column: 9, scope: !938)
!940 = !DILocation(line: 767, column: 11, scope: !938)
!941 = !DILocation(line: 770, column: 11, scope: !938)
!942 = !DILocation(line: 771, column: 5, scope: !938)
!943 = !DILocation(line: 773, column: 11, scope: !938)
!944 = !DILocation(line: 774, column: 5, scope: !938)
!945 = !DILocation(line: 0, scope: !883)
!946 = !DILocation(line: 777, column: 19, scope: !871)
!947 = !DILocation(line: 777, column: 17, scope: !871)
!948 = !DILocation(line: 778, column: 17, scope: !871)
!949 = !DILocation(line: 779, column: 17, scope: !871)
!950 = !DILocation(line: 782, column: 1, scope: !871)
!951 = distinct !DISubprogram(name: "logarithm", scope: !3, file: !3, line: 785, type: !952, scopeLine: 785, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !954)
!952 = !DISubroutineType(types: !953)
!953 = !{!38, !38}
!954 = !{!955, !956}
!955 = !DILocalVariable(name: "size", arg: 1, scope: !951, file: !3, line: 785, type: !38)
!956 = !DILocalVariable(name: "k", scope: !951, file: !3, line: 786, type: !38)
!957 = !DILocation(line: 0, scope: !951)
!958 = !DILocation(line: 788, column: 3, scope: !951)
!959 = !DILocation(line: 788, column: 13, scope: !951)
!960 = !DILocation(line: 788, column: 19, scope: !951)
!961 = !DILocation(line: 789, column: 6, scope: !951)
!962 = distinct !{!962, !958, !961, !628}
!963 = !DILocation(line: 790, column: 3, scope: !951)
!964 = distinct !DISubprogram(name: "usage", scope: !3, file: !3, line: 794, type: !107, scopeLine: 794, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !965)
!965 = !{}
!966 = !DILocation(line: 795, column: 12, scope: !964)
!967 = !DILocation(line: 795, column: 3, scope: !964)
!968 = !DILocation(line: 812, column: 12, scope: !964)
!969 = !DILocation(line: 812, column: 3, scope: !964)
!970 = !DILocation(line: 819, column: 3, scope: !964)
!971 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 826, type: !972, scopeLine: 826, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !976)
!972 = !DISubroutineType(types: !973)
!973 = !{!38, !38, !974}
!974 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !975, size: 64)
!975 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!976 = !{!977, !978, !979, !980, !981, !982, !983, !984, !985, !986, !987, !988, !989, !990, !991, !992, !993, !994, !998, !1002, !1003, !1004, !1061, !1063, !1069, !1070, !1071, !1072, !1073, !1074, !1077, !1080, !1085, !1086, !1087, !1088, !1089}
!977 = !DILocalVariable(name: "argc", arg: 1, scope: !971, file: !3, line: 826, type: !38)
!978 = !DILocalVariable(name: "argv", arg: 2, scope: !971, file: !3, line: 826, type: !974)
!979 = !DILocalVariable(name: "A", scope: !971, file: !3, line: 828, type: !132)
!980 = !DILocalVariable(name: "R", scope: !971, file: !3, line: 828, type: !132)
!981 = !DILocalVariable(name: "size", scope: !971, file: !3, line: 829, type: !38)
!982 = !DILocalVariable(name: "depth", scope: !971, file: !3, line: 829, type: !38)
!983 = !DILocalVariable(name: "nonzeros", scope: !971, file: !3, line: 829, type: !38)
!984 = !DILocalVariable(name: "i", scope: !971, file: !3, line: 829, type: !38)
!985 = !DILocalVariable(name: "benchmark", scope: !971, file: !3, line: 829, type: !38)
!986 = !DILocalVariable(name: "help", scope: !971, file: !3, line: 829, type: !38)
!987 = !DILocalVariable(name: "check", scope: !971, file: !3, line: 829, type: !38)
!988 = !DILocalVariable(name: "round", scope: !971, file: !3, line: 829, type: !38)
!989 = !DILocalVariable(name: "input_nonzeros", scope: !971, file: !3, line: 830, type: !38)
!990 = !DILocalVariable(name: "input_blocks", scope: !971, file: !3, line: 830, type: !38)
!991 = !DILocalVariable(name: "output_nonzeros", scope: !971, file: !3, line: 830, type: !38)
!992 = !DILocalVariable(name: "output_blocks", scope: !971, file: !3, line: 830, type: !38)
!993 = !DILocalVariable(name: "error", scope: !971, file: !3, line: 831, type: !13)
!994 = !DILocalVariable(name: "buf", scope: !971, file: !3, line: 832, type: !995)
!995 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 8000, elements: !996)
!996 = !{!997}
!997 = !DISubrange(count: 1000)
!998 = !DILocalVariable(name: "filename", scope: !971, file: !3, line: 832, type: !999)
!999 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 800, elements: !1000)
!1000 = !{!1001}
!1001 = !DISubrange(count: 100)
!1002 = !DILocalVariable(name: "sizex", scope: !971, file: !3, line: 833, type: !38)
!1003 = !DILocalVariable(name: "sizey", scope: !971, file: !3, line: 833, type: !38)
!1004 = !DILocalVariable(name: "f", scope: !971, file: !3, line: 834, type: !1005)
!1005 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1006, size: 64)
!1006 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1007, line: 48, baseType: !1008)
!1007 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "ccadb277f847191065ca006254171e90")
!1008 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !1009, line: 246, size: 1728, elements: !1010)
!1009 = !DIFile(filename: "/usr/include/libio.h", directory: "", checksumkind: CSK_MD5, checksum: "93df651ae2428563d8c372201ea10863")
!1010 = !{!1011, !1012, !1013, !1014, !1015, !1016, !1017, !1018, !1019, !1020, !1021, !1022, !1023, !1031, !1032, !1033, !1034, !1036, !1038, !1040, !1044, !1047, !1049, !1050, !1051, !1052, !1053, !1056, !1057}
!1011 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !1008, file: !1009, line: 247, baseType: !38, size: 32)
!1012 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !1008, file: !1009, line: 252, baseType: !975, size: 64, offset: 64)
!1013 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !1008, file: !1009, line: 253, baseType: !975, size: 64, offset: 128)
!1014 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !1008, file: !1009, line: 254, baseType: !975, size: 64, offset: 192)
!1015 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !1008, file: !1009, line: 255, baseType: !975, size: 64, offset: 256)
!1016 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !1008, file: !1009, line: 256, baseType: !975, size: 64, offset: 320)
!1017 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !1008, file: !1009, line: 257, baseType: !975, size: 64, offset: 384)
!1018 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !1008, file: !1009, line: 258, baseType: !975, size: 64, offset: 448)
!1019 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !1008, file: !1009, line: 259, baseType: !975, size: 64, offset: 512)
!1020 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !1008, file: !1009, line: 261, baseType: !975, size: 64, offset: 576)
!1021 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !1008, file: !1009, line: 262, baseType: !975, size: 64, offset: 640)
!1022 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !1008, file: !1009, line: 263, baseType: !975, size: 64, offset: 704)
!1023 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !1008, file: !1009, line: 265, baseType: !1024, size: 64, offset: 768)
!1024 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1025, size: 64)
!1025 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !1009, line: 161, size: 192, elements: !1026)
!1026 = !{!1027, !1028, !1030}
!1027 = !DIDerivedType(tag: DW_TAG_member, name: "_next", scope: !1025, file: !1009, line: 162, baseType: !1024, size: 64)
!1028 = !DIDerivedType(tag: DW_TAG_member, name: "_sbuf", scope: !1025, file: !1009, line: 163, baseType: !1029, size: 64, offset: 64)
!1029 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1008, size: 64)
!1030 = !DIDerivedType(tag: DW_TAG_member, name: "_pos", scope: !1025, file: !1009, line: 167, baseType: !38, size: 32, offset: 128)
!1031 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !1008, file: !1009, line: 267, baseType: !1029, size: 64, offset: 832)
!1032 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !1008, file: !1009, line: 269, baseType: !38, size: 32, offset: 896)
!1033 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !1008, file: !1009, line: 273, baseType: !38, size: 32, offset: 928)
!1034 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !1008, file: !1009, line: 275, baseType: !1035, size: 64, offset: 960)
!1035 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !55, line: 140, baseType: !56)
!1036 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !1008, file: !1009, line: 279, baseType: !1037, size: 16, offset: 1024)
!1037 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1038 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !1008, file: !1009, line: 280, baseType: !1039, size: 8, offset: 1040)
!1039 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1040 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !1008, file: !1009, line: 281, baseType: !1041, size: 8, offset: 1048)
!1041 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 8, elements: !1042)
!1042 = !{!1043}
!1043 = !DISubrange(count: 1)
!1044 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !1008, file: !1009, line: 285, baseType: !1045, size: 64, offset: 1088)
!1045 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1046, size: 64)
!1046 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !1009, line: 155, baseType: null)
!1047 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !1008, file: !1009, line: 294, baseType: !1048, size: 64, offset: 1152)
!1048 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !55, line: 141, baseType: !56)
!1049 = !DIDerivedType(tag: DW_TAG_member, name: "__pad1", scope: !1008, file: !1009, line: 303, baseType: !17, size: 64, offset: 1216)
!1050 = !DIDerivedType(tag: DW_TAG_member, name: "__pad2", scope: !1008, file: !1009, line: 304, baseType: !17, size: 64, offset: 1280)
!1051 = !DIDerivedType(tag: DW_TAG_member, name: "__pad3", scope: !1008, file: !1009, line: 305, baseType: !17, size: 64, offset: 1344)
!1052 = !DIDerivedType(tag: DW_TAG_member, name: "__pad4", scope: !1008, file: !1009, line: 306, baseType: !17, size: 64, offset: 1408)
!1053 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !1008, file: !1009, line: 307, baseType: !1054, size: 64, offset: 1472)
!1054 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1055, line: 46, baseType: !39)
!1055 = !DIFile(filename: "ece.cmu.edu/project/seth_group/ziqiliu/uli-opencilk-project/build/lib/clang/14.0.6/include/stddef.h", directory: "/afs", checksumkind: CSK_MD5, checksum: "2499dd2361b915724b073282bea3a7bc")
!1056 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !1008, file: !1009, line: 309, baseType: !38, size: 32, offset: 1536)
!1057 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !1008, file: !1009, line: 311, baseType: !1058, size: 160, offset: 1568)
!1058 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 160, elements: !1059)
!1059 = !{!1060}
!1060 = !DISubrange(count: 20)
!1061 = !DILocalVariable(name: "r", scope: !1062, file: !3, line: 848, type: !38)
!1062 = distinct !DILexicalBlock(scope: !971, file: !3, line: 848, column: 3)
!1063 = !DILocalVariable(name: "fr", scope: !1064, file: !3, line: 899, type: !14)
!1064 = distinct !DILexicalBlock(scope: !1065, file: !3, line: 897, column: 24)
!1065 = distinct !DILexicalBlock(scope: !1066, file: !3, line: 875, column: 21)
!1066 = distinct !DILexicalBlock(scope: !1067, file: !3, line: 875, column: 8)
!1067 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 848, column: 30)
!1068 = distinct !DILexicalBlock(scope: !1062, file: !3, line: 848, column: 3)
!1069 = !DILocalVariable(name: "fc", scope: !1064, file: !3, line: 899, type: !14)
!1070 = !DILocalVariable(name: "r", scope: !1064, file: !3, line: 900, type: !38)
!1071 = !DILocalVariable(name: "c", scope: !1064, file: !3, line: 900, type: !38)
!1072 = !DILocalVariable(name: "val", scope: !1064, file: !3, line: 901, type: !13)
!1073 = !DILocalVariable(name: "res", scope: !1064, file: !3, line: 902, type: !38)
!1074 = !DILocalVariable(name: "rnd", scope: !1075, file: !3, line: 918, type: !14)
!1075 = distinct !DILexicalBlock(scope: !1076, file: !3, line: 917, column: 4)
!1076 = distinct !DILexicalBlock(scope: !1064, file: !3, line: 916, column: 6)
!1077 = !DILocalVariable(name: "t", scope: !1078, file: !3, line: 926, type: !38)
!1078 = distinct !DILexicalBlock(scope: !1079, file: !3, line: 925, column: 4)
!1079 = distinct !DILexicalBlock(scope: !1064, file: !3, line: 924, column: 6)
!1080 = !DILocalVariable(name: "r", scope: !1081, file: !3, line: 949, type: !38)
!1081 = distinct !DILexicalBlock(scope: !1082, file: !3, line: 948, column: 44)
!1082 = distinct !DILexicalBlock(scope: !1083, file: !3, line: 948, column: 7)
!1083 = distinct !DILexicalBlock(scope: !1084, file: !3, line: 948, column: 7)
!1084 = distinct !DILexicalBlock(scope: !1066, file: !3, line: 937, column: 12)
!1085 = !DILocalVariable(name: "c", scope: !1081, file: !3, line: 949, type: !38)
!1086 = !DILocalVariable(name: "t1", scope: !1067, file: !3, line: 972, type: !50)
!1087 = !DILocalVariable(name: "t2", scope: !1067, file: !3, line: 972, type: !50)
!1088 = !DILocalVariable(name: "runtime_ms", scope: !1067, file: !3, line: 978, type: !48)
!1089 = !DILabel(scope: !1081, name: "again", file: !3, line: 950)
!1090 = !DILocation(line: 0, scope: !971)
!1091 = !DILocation(line: 829, column: 3, scope: !971)
!1092 = !DILocation(line: 829, column: 50, scope: !971)
!1093 = !{!1094, !1094, i64 0}
!1094 = !{!"int", !66, i64 0}
!1095 = !DILocation(line: 829, column: 61, scope: !971)
!1096 = !DILocation(line: 832, column: 3, scope: !971)
!1097 = !DILocation(line: 832, column: 8, scope: !971)
!1098 = !DILocation(line: 832, column: 19, scope: !971)
!1099 = !DILocation(line: 833, column: 3, scope: !971)
!1100 = !DILocation(line: 839, column: 15, scope: !971)
!1101 = !{!66, !66, i64 0}
!1102 = !DILocation(line: 840, column: 8, scope: !971)
!1103 = !DILocation(line: 841, column: 12, scope: !971)
!1104 = !DILocation(line: 843, column: 3, scope: !971)
!1105 = !DILocation(line: 847, column: 3, scope: !971)
!1106 = !DILocation(line: 0, scope: !1062)
!1107 = !DILocation(line: 848, column: 18, scope: !1068)
!1108 = !DILocation(line: 848, column: 17, scope: !1068)
!1109 = !DILocation(line: 848, column: 3, scope: !1062)
!1110 = !DILocation(line: 852, column: 8, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1067, file: !3, line: 852, column: 8)
!1112 = !DILocation(line: 852, column: 8, scope: !1067)
!1113 = !DILocation(line: 795, column: 12, scope: !964, inlinedAt: !1114)
!1114 = distinct !DILocation(line: 853, column: 14, scope: !1111)
!1115 = !DILocation(line: 795, column: 3, scope: !964, inlinedAt: !1114)
!1116 = !DILocation(line: 812, column: 12, scope: !964, inlinedAt: !1114)
!1117 = !DILocation(line: 812, column: 3, scope: !964, inlinedAt: !1114)
!1118 = !DILocation(line: 853, column: 7, scope: !1111)
!1119 = !DILocation(line: 855, column: 8, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1067, file: !3, line: 855, column: 8)
!1121 = !DILocation(line: 855, column: 8, scope: !1067)
!1122 = !DILocation(line: 858, column: 21, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1124, file: !3, line: 856, column: 25)
!1124 = distinct !DILexicalBlock(scope: !1120, file: !3, line: 855, column: 19)
!1125 = !DILocation(line: 859, column: 14, scope: !1123)
!1126 = !DILocation(line: 860, column: 18, scope: !1123)
!1127 = !DILocation(line: 861, column: 9, scope: !1123)
!1128 = !DILocation(line: 863, column: 21, scope: !1123)
!1129 = !DILocation(line: 864, column: 14, scope: !1123)
!1130 = !DILocation(line: 865, column: 18, scope: !1123)
!1131 = !DILocation(line: 866, column: 9, scope: !1123)
!1132 = !DILocation(line: 868, column: 21, scope: !1123)
!1133 = !DILocation(line: 869, column: 14, scope: !1123)
!1134 = !DILocation(line: 870, column: 18, scope: !1123)
!1135 = !DILocation(line: 871, column: 9, scope: !1123)
!1136 = !DILocation(line: 875, column: 8, scope: !1066)
!1137 = !DILocation(line: 875, column: 8, scope: !1067)
!1138 = !DILocation(line: 940, column: 26, scope: !1084)
!1139 = !DILocation(line: 876, column: 11, scope: !1065)
!1140 = !DILocation(line: 877, column: 12, scope: !1141)
!1141 = distinct !DILexicalBlock(scope: !1065, file: !3, line: 877, column: 10)
!1142 = !DILocation(line: 877, column: 10, scope: !1065)
!1143 = !DILocation(line: 878, column: 2, scope: !1144)
!1144 = distinct !DILexicalBlock(scope: !1141, file: !3, line: 877, column: 21)
!1145 = !DILocation(line: 879, column: 2, scope: !1144)
!1146 = !DILocation(line: 883, column: 2, scope: !1065)
!1147 = !DILocation(line: 884, column: 14, scope: !1065)
!1148 = !DILocation(line: 884, column: 21, scope: !1065)
!1149 = distinct !{!1149, !1150, !1151, !628}
!1150 = !DILocation(line: 882, column: 7, scope: !1065)
!1151 = !DILocation(line: 884, column: 27, scope: !1065)
!1152 = !DILocation(line: 886, column: 7, scope: !1065)
!1153 = !DILocation(line: 887, column: 7, scope: !1065)
!1154 = !DILocation(line: 888, column: 12, scope: !1065)
!1155 = !DILocation(line: 0, scope: !951, inlinedAt: !1156)
!1156 = distinct !DILocation(line: 890, column: 15, scope: !1065)
!1157 = !DILocation(line: 788, column: 3, scope: !951, inlinedAt: !1156)
!1158 = !DILocation(line: 788, column: 13, scope: !951, inlinedAt: !1156)
!1159 = !DILocation(line: 788, column: 19, scope: !951, inlinedAt: !1156)
!1160 = !DILocation(line: 789, column: 6, scope: !951, inlinedAt: !1156)
!1161 = distinct !{!1161, !1157, !1160, !628}
!1162 = !DILocation(line: 892, column: 7, scope: !1065)
!1163 = !DILocation(line: 0, scope: !120, inlinedAt: !1164)
!1164 = distinct !DILocation(line: 893, column: 7, scope: !1065)
!1165 = !DILocation(line: 82, column: 12, scope: !120, inlinedAt: !1164)
!1166 = !DILocation(line: 895, column: 16, scope: !1065)
!1167 = !DILocation(line: 897, column: 7, scope: !1065)
!1168 = !DILocation(line: 850, column: 7, scope: !1067)
!1169 = !DILocation(line: 897, column: 14, scope: !1065)
!1170 = !DILocation(line: 897, column: 13, scope: !1065)
!1171 = !DILocation(line: 899, column: 2, scope: !1064)
!1172 = !DILocation(line: 901, column: 2, scope: !1064)
!1173 = !DILocation(line: 904, column: 2, scope: !1064)
!1174 = !DILocation(line: 0, scope: !1064)
!1175 = !DILocation(line: 906, column: 8, scope: !1064)
!1176 = !DILocation(line: 907, column: 6, scope: !1064)
!1177 = !DILocation(line: 908, column: 6, scope: !1064)
!1178 = !DILocation(line: 909, column: 10, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1064, file: !3, line: 909, column: 6)
!1180 = !DILocation(line: 909, column: 6, scope: !1064)
!1181 = !DILocation(line: 935, column: 7, scope: !1065)
!1182 = !DILocation(line: 916, column: 10, scope: !1076)
!1183 = !DILocation(line: 916, column: 6, scope: !1064)
!1184 = !DILocation(line: 918, column: 29, scope: !1075)
!1185 = !DILocation(line: 918, column: 20, scope: !1075)
!1186 = !DILocation(line: 918, column: 38, scope: !1075)
!1187 = !DILocation(line: 0, scope: !1075)
!1188 = !DILocation(line: 919, column: 15, scope: !1075)
!1189 = !DILocation(line: 919, column: 13, scope: !1075)
!1190 = !DILocation(line: 919, column: 10, scope: !1075)
!1191 = !DILocation(line: 920, column: 4, scope: !1075)
!1192 = !DILocation(line: 922, column: 3, scope: !1064)
!1193 = !DILocation(line: 923, column: 3, scope: !1064)
!1194 = !DILocation(line: 924, column: 8, scope: !1079)
!1195 = !DILocation(line: 924, column: 6, scope: !1064)
!1196 = !DILocation(line: 930, column: 2, scope: !1064)
!1197 = !DILocation(line: 931, column: 2, scope: !1064)
!1198 = !DILocation(line: 932, column: 2, scope: !1064)
!1199 = !DILocation(line: 933, column: 34, scope: !1064)
!1200 = !DILocation(line: 933, column: 6, scope: !1064)
!1201 = !DILocation(line: 934, column: 10, scope: !1064)
!1202 = !DILocation(line: 0, scope: !951, inlinedAt: !1203)
!1203 = distinct !DILocation(line: 940, column: 15, scope: !1084)
!1204 = !DILocation(line: 788, column: 3, scope: !951, inlinedAt: !1203)
!1205 = !DILocation(line: 788, column: 13, scope: !951, inlinedAt: !1203)
!1206 = !DILocation(line: 788, column: 19, scope: !951, inlinedAt: !1203)
!1207 = !DILocation(line: 789, column: 6, scope: !951, inlinedAt: !1203)
!1208 = distinct !{!1208, !1204, !1207, !628}
!1209 = !DILocation(line: 943, column: 20, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1211, file: !3, line: 943, column: 7)
!1211 = distinct !DILexicalBlock(scope: !1084, file: !3, line: 943, column: 7)
!1212 = !DILocation(line: 943, column: 7, scope: !1211)
!1213 = !DILocation(line: 948, column: 33, scope: !1082)
!1214 = !DILocation(line: 0, scope: !1067)
!1215 = !DILocation(line: 948, column: 22, scope: !1082)
!1216 = !DILocation(line: 948, column: 20, scope: !1082)
!1217 = !DILocation(line: 948, column: 7, scope: !1083)
!1218 = !DILocation(line: 362, column: 3, scope: !243, inlinedAt: !1219)
!1219 = distinct !DILocation(line: 955, column: 6, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1081, file: !3, line: 955, column: 6)
!1221 = !DILocation(line: 953, column: 6, scope: !1081)
!1222 = !DILocation(line: 0, scope: !1081)
!1223 = !DILocation(line: 957, column: 6, scope: !1081)
!1224 = !DILocation(line: 948, column: 40, scope: !1082)
!1225 = !DILocation(line: 948, column: 31, scope: !1082)
!1226 = distinct !{!1226, !1217, !1227, !628}
!1227 = !DILocation(line: 958, column: 7, scope: !1083)
!1228 = !DILocation(line: 950, column: 7, scope: !1081)
!1229 = !DILocation(line: 76, column: 23, scope: !106, inlinedAt: !1230)
!1230 = distinct !DILocation(line: 951, column: 6, scope: !1081)
!1231 = !DILocation(line: 76, column: 36, scope: !106, inlinedAt: !1230)
!1232 = !DILocation(line: 77, column: 22, scope: !106, inlinedAt: !1230)
!1233 = !DILocation(line: 77, column: 12, scope: !106, inlinedAt: !1230)
!1234 = !DILocation(line: 0, scope: !106, inlinedAt: !1230)
!1235 = !DILocation(line: 951, column: 19, scope: !1081)
!1236 = !DILocation(line: 76, column: 23, scope: !106, inlinedAt: !1237)
!1237 = distinct !DILocation(line: 952, column: 6, scope: !1081)
!1238 = !DILocation(line: 76, column: 36, scope: !106, inlinedAt: !1237)
!1239 = !DILocation(line: 77, column: 22, scope: !106, inlinedAt: !1237)
!1240 = !DILocation(line: 77, column: 12, scope: !106, inlinedAt: !1237)
!1241 = !DILocation(line: 0, scope: !106, inlinedAt: !1237)
!1242 = !DILocation(line: 952, column: 19, scope: !1081)
!1243 = !DILocation(line: 953, column: 8, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1081, file: !3, line: 953, column: 6)
!1245 = !DILocation(line: 0, scope: !243, inlinedAt: !1219)
!1246 = !DILocation(line: 363, column: 3, scope: !243, inlinedAt: !1219)
!1247 = !DILocation(line: 364, column: 3, scope: !243, inlinedAt: !1219)
!1248 = !DILocation(line: 366, column: 9, scope: !261, inlinedAt: !1219)
!1249 = !DILocation(line: 366, column: 7, scope: !243, inlinedAt: !1219)
!1250 = !DILocation(line: 369, column: 13, scope: !253, inlinedAt: !1219)
!1251 = !DILocation(line: 369, column: 7, scope: !243, inlinedAt: !1219)
!1252 = !DILocation(line: 376, column: 10, scope: !255, inlinedAt: !1219)
!1253 = !DILocation(line: 377, column: 13, scope: !255, inlinedAt: !1219)
!1254 = !DILocation(line: 0, scope: !255, inlinedAt: !1219)
!1255 = !DILocation(line: 379, column: 11, scope: !271, inlinedAt: !1219)
!1256 = !DILocation(line: 0, scope: !271, inlinedAt: !1219)
!1257 = !DILocation(line: 379, column: 9, scope: !255, inlinedAt: !1219)
!1258 = !DILocation(line: 386, column: 11, scope: !281, inlinedAt: !1219)
!1259 = !DILocation(line: 0, scope: !283, inlinedAt: !1219)
!1260 = !DILocation(line: 380, column: 11, scope: !275, inlinedAt: !1219)
!1261 = !DILocation(line: 383, column: 35, scope: !277, inlinedAt: !1219)
!1262 = !DILocation(line: 383, column: 55, scope: !277, inlinedAt: !1219)
!1263 = !DILocation(line: 381, column: 35, scope: !277, inlinedAt: !1219)
!1264 = !DILocation(line: 0, scope: !252, inlinedAt: !1219)
!1265 = !DILocation(line: 371, column: 12, scope: !252, inlinedAt: !1219)
!1266 = !DILocation(line: 955, column: 34, scope: !1220)
!1267 = !DILocation(line: 955, column: 6, scope: !1081)
!1268 = !DILocation(line: 944, column: 6, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1210, file: !3, line: 943, column: 33)
!1270 = !DILocation(line: 943, column: 29, scope: !1210)
!1271 = !DILocation(line: 943, column: 22, scope: !1210)
!1272 = distinct !{!1272, !1212, !1273, !628}
!1273 = !DILocation(line: 945, column: 7, scope: !1211)
!1274 = !DILocation(line: 0, scope: !1066)
!1275 = !DILocation(line: 962, column: 13, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1067, file: !3, line: 962, column: 5)
!1277 = !DILocation(line: 962, column: 21, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1276, file: !3, line: 962, column: 5)
!1279 = !DILocation(line: 962, column: 5, scope: !1276)
!1280 = !DILocation(line: 963, column: 11, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1278, file: !3, line: 962, column: 42)
!1282 = !DILocation(line: 962, column: 38, scope: !1278)
!1283 = distinct !{!1283, !1279, !1284, !628}
!1284 = !DILocation(line: 964, column: 5, scope: !1276)
!1285 = !DILocation(line: 967, column: 9, scope: !1067)
!1286 = !DILocation(line: 969, column: 20, scope: !1067)
!1287 = !DILocation(line: 970, column: 22, scope: !1067)
!1288 = !DILocation(line: 972, column: 20, scope: !1067)
!1289 = !DILocation(line: 972, column: 24, scope: !1067)
!1290 = !DILocation(line: 973, column: 5, scope: !1067)
!1291 = !DILocation(line: 975, column: 9, scope: !1067)
!1292 = !DILocation(line: 977, column: 5, scope: !1067)
!1293 = !DILocation(line: 0, scope: !45, inlinedAt: !1294)
!1294 = distinct !DILocation(line: 978, column: 38, scope: !1067)
!1295 = !DILocation(line: 61, column: 16, scope: !45, inlinedAt: !1294)
!1296 = !DILocation(line: 61, column: 43, scope: !45, inlinedAt: !1294)
!1297 = !DILocation(line: 0, scope: !45, inlinedAt: !1298)
!1298 = distinct !DILocation(line: 978, column: 50, scope: !1067)
!1299 = !DILocation(line: 61, column: 16, scope: !45, inlinedAt: !1298)
!1300 = !DILocation(line: 61, column: 43, scope: !45, inlinedAt: !1298)
!1301 = !DILocation(line: 61, column: 37, scope: !45, inlinedAt: !1294)
!1302 = !DILocation(line: 978, column: 49, scope: !1067)
!1303 = !DILocation(line: 978, column: 62, scope: !1067)
!1304 = !DILocation(line: 979, column: 31, scope: !1067)
!1305 = !DILocation(line: 979, column: 41, scope: !1067)
!1306 = !DILocation(line: 979, column: 5, scope: !1067)
!1307 = !DILocation(line: 981, column: 21, scope: !1067)
!1308 = !DILocation(line: 982, column: 23, scope: !1067)
!1309 = !DILocation(line: 987, column: 8, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1067, file: !3, line: 987, column: 8)
!1311 = !DILocation(line: 987, column: 8, scope: !1067)
!1312 = !DILocation(line: 988, column: 7, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1310, file: !3, line: 987, column: 15)
!1314 = !DILocation(line: 989, column: 11, scope: !1313)
!1315 = !DILocation(line: 990, column: 15, scope: !1313)
!1316 = !DILocation(line: 991, column: 5, scope: !1313)
!1317 = !DILocation(line: 993, column: 14, scope: !1067)
!1318 = !DILocation(line: 993, column: 5, scope: !1067)
!1319 = !DILocation(line: 994, column: 9, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1067, file: !3, line: 994, column: 9)
!1321 = !DILocation(line: 994, column: 9, scope: !1067)
!1322 = !DILocation(line: 995, column: 7, scope: !1323)
!1323 = distinct !DILexicalBlock(scope: !1320, file: !3, line: 994, column: 16)
!1324 = !DILocation(line: 996, column: 5, scope: !1323)
!1325 = !DILocation(line: 998, column: 14, scope: !1067)
!1326 = !DILocation(line: 998, column: 59, scope: !1067)
!1327 = !DILocation(line: 998, column: 5, scope: !1067)
!1328 = !DILocation(line: 999, column: 14, scope: !1067)
!1329 = !DILocation(line: 999, column: 59, scope: !1067)
!1330 = !DILocation(line: 999, column: 5, scope: !1067)
!1331 = !DILocation(line: 1000, column: 14, scope: !1067)
!1332 = !DILocation(line: 1000, column: 5, scope: !1067)
!1333 = !DILocation(line: 1001, column: 14, scope: !1067)
!1334 = !DILocation(line: 1001, column: 5, scope: !1067)
!1335 = !DILocation(line: 1002, column: 14, scope: !1067)
!1336 = !DILocation(line: 1002, column: 5, scope: !1067)
!1337 = !DILocation(line: 1003, column: 14, scope: !1067)
!1338 = !DILocation(line: 1003, column: 5, scope: !1067)
!1339 = !DILocation(line: 1006, column: 5, scope: !1067)
!1340 = !DILocation(line: 1007, column: 5, scope: !1067)
!1341 = !DILocation(line: 848, column: 26, scope: !1068)
!1342 = distinct !{!1342, !1109, !1343, !628}
!1343 = !DILocation(line: 1008, column: 3, scope: !1062)
!1344 = !DILocation(line: 1010, column: 1, scope: !971)
!1345 = !DISubprogram(name: "get_options", scope: !1346, file: !1346, line: 20, type: !1347, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !965)
!1346 = !DIFile(filename: "./getoptions.h", directory: "/afs/ece/project/seth_group/ziqiliu/test/cilk5", checksumkind: CSK_MD5, checksum: "bf060e74fdb298e4a85522e522cd3a24")
!1347 = !DISubroutineType(types: !1348)
!1348 = !{null, !38, !974, !1349, !1350, null}
!1349 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 64)
!1350 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!1351 = !DISubprogram(name: "fgets", scope: !1007, file: !1007, line: 622, type: !1352, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !965)
!1352 = !DISubroutineType(types: !1353)
!1353 = !{!975, !1354, !38, !1355}
!1354 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !975)
!1355 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1005)
!1356 = !DISubprogram(name: "srand", scope: !1357, file: !1357, line: 376, type: !121, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !965)
!1357 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "f7a1412d75d9e3df251dfc21b02d59ef")
!1358 = !DISubprogram(name: "feof", scope: !1007, file: !1007, line: 828, type: !1359, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !965)
!1359 = !DISubroutineType(types: !1360)
!1360 = !{!38, !1005}
!1361 = !DISubprogram(name: "rand", scope: !1357, file: !1357, line: 374, type: !107, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !965)
!1362 = !DISubprogram(name: "gettimeofday", scope: !1363, file: !1363, line: 72, type: !1364, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !965)
!1363 = !DIFile(filename: "/usr/include/sys/time.h", directory: "", checksumkind: CSK_MD5, checksum: "3b3cbcac52b1954fa045aa74bfcd1a38")
!1364 = !DISubroutineType(types: !1365)
!1365 = !{!38, !1366, !1367}
!1366 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !49)
!1367 = !DIDerivedType(tag: DW_TAG_typedef, name: "__timezone_ptr_t", file: !1363, line: 62, baseType: !1368)
!1368 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1369)
!1369 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1370, size: 64)
!1370 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timezone", file: !1363, line: 56, size: 64, elements: !1371)
!1371 = !{!1372, !1373}
!1372 = !DIDerivedType(tag: DW_TAG_member, name: "tz_minuteswest", scope: !1370, file: !1363, line: 58, baseType: !38, size: 32)
!1373 = !DIDerivedType(tag: DW_TAG_member, name: "tz_dsttime", scope: !1370, file: !1363, line: 59, baseType: !38, size: 32, offset: 32)
