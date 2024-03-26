; ModuleID = './template.cpp'
source_filename = "./template.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.anon = type { i32* }
%class.anon.0 = type { i32* }

; Function Attrs: mustprogress noinline norecurse uwtable
define dso_local noundef i32 @main(i32 noundef %argc, i8** noundef %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %start = alloca i64, align 8
  %end = alloca i64, align 8
  %res = alloca i32, align 4
  %f = alloca %class.anon, align 8
  %agg.tmp = alloca %class.anon, align 8
  %g = alloca %class.anon.0, align 8
  %agg.tmp3 = alloca %class.anon.0, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %0, i64 1
  %1 = load i8*, i8** %arrayidx, align 8
  %call = call i64 @atol(i8* noundef %1) #7
  store i64 %call, i64* %start, align 8
  %2 = load i8**, i8*** %argv.addr, align 8
  %arrayidx1 = getelementptr inbounds i8*, i8** %2, i64 2
  %3 = load i8*, i8** %arrayidx1, align 8
  %call2 = call i64 @atol(i8* noundef %3) #7
  store i64 %call2, i64* %end, align 8
  store i32 0, i32* %res, align 4
  %4 = getelementptr inbounds %class.anon, %class.anon* %f, i32 0, i32 0
  store i32* %res, i32** %4, align 8
  %5 = load i64, i64* %start, align 8
  %6 = load i64, i64* %end, align 8
  %7 = bitcast %class.anon* %agg.tmp to i8*
  %8 = bitcast %class.anon* %f to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 8 %8, i64 8, i1 false)
  %coerce.dive = getelementptr inbounds %class.anon, %class.anon* %agg.tmp, i32 0, i32 0
  %9 = load i32*, i32** %coerce.dive, align 8
  call void @"_Z12parallel_forIZ4mainE3$_0EvmmT_l"(i64 noundef %5, i64 noundef %6, i32* %9, i64 noundef 1)
  %10 = getelementptr inbounds %class.anon.0, %class.anon.0* %g, i32 0, i32 0
  store i32* %res, i32** %10, align 8
  %11 = load i64, i64* %start, align 8
  %12 = load i64, i64* %end, align 8
  %13 = bitcast %class.anon.0* %agg.tmp3 to i8*
  %14 = bitcast %class.anon.0* %g to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %13, i8* align 8 %14, i64 8, i1 false)
  %coerce.dive4 = getelementptr inbounds %class.anon.0, %class.anon.0* %agg.tmp3, i32 0, i32 0
  %15 = load i32*, i32** %coerce.dive4, align 8
  call void @"_Z12parallel_forIZ4mainE3$_1EvmmT_l"(i64 noundef %11, i64 noundef %12, i32* %15, i64 noundef 2)
  %16 = load i32, i32* %res, align 4
  ret i32 %16
}

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @atol(i8* noundef) #1

; Function Attrs: mustprogress noinline uwtable
define internal void @"_Z12parallel_forIZ4mainE3$_0EvmmT_l"(i64 noundef %start, i64 noundef %end, i32* %f.coerce, i64 noundef %granularity) #2 {
entry:
  %f = alloca %class.anon, align 8
  %start.addr = alloca i64, align 8
  %end.addr = alloca i64, align 8
  %granularity.addr = alloca i64, align 8
  %syncreg = call token @llvm.syncregion.start()
  %__init = alloca i64, align 8
  %__limit = alloca i64, align 8
  %__begin = alloca i64, align 8
  %__end = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %class.anon, %class.anon* %f, i32 0, i32 0
  store i32* %f.coerce, i32** %coerce.dive, align 8
  store i64 %start, i64* %start.addr, align 8
  store i64 %end, i64* %end.addr, align 8
  store i64 %granularity, i64* %granularity.addr, align 8
  %0 = load i64, i64* %start.addr, align 8
  store i64 %0, i64* %__init, align 8
  %1 = load i64, i64* %end.addr, align 8
  store i64 %1, i64* %__limit, align 8
  %2 = load i64, i64* %__init, align 8
  %3 = load i64, i64* %__limit, align 8
  %cmp = icmp ult i64 %2, %3
  br i1 %cmp, label %pfor.ph, label %pfor.end

pfor.ph:                                          ; preds = %entry
  store i64 0, i64* %__begin, align 8
  %4 = load i64, i64* %__limit, align 8
  %5 = load i64, i64* %__init, align 8
  %sub = sub i64 %4, %5
  %sub1 = sub i64 %sub, 1
  %div = udiv i64 %sub1, 1
  %add = add i64 %div, 1
  store i64 %add, i64* %__end, align 8
  br label %pfor.cond

pfor.cond:                                        ; preds = %pfor.inc, %pfor.ph
  br label %pfor.detach

pfor.detach:                                      ; preds = %pfor.cond
  %6 = load i64, i64* %__init, align 8
  %7 = load i64, i64* %__begin, align 8
  %mul = mul i64 %7, 1
  %add2 = add i64 %6, %mul
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc

pfor.body.entry:                                  ; preds = %pfor.detach
  %i = alloca i64, align 8
  store i64 %add2, i64* %i, align 8
  br label %pfor.body

pfor.body:                                        ; preds = %pfor.body.entry
  %8 = load i64, i64* %i, align 8
  call void @"_ZZ4mainENK3$_0clEm"(%class.anon* noundef nonnull align 8 dereferenceable(8) %f, i64 noundef %8)
  br label %pfor.preattach

pfor.preattach:                                   ; preds = %pfor.body
  reattach within %syncreg, label %pfor.inc

pfor.inc:                                         ; preds = %pfor.preattach, %pfor.detach
  %9 = load i64, i64* %__begin, align 8
  %inc = add i64 %9, 1
  store i64 %inc, i64* %__begin, align 8
  %10 = load i64, i64* %__begin, align 8
  %11 = load i64, i64* %__end, align 8
  %cmp3 = icmp ult i64 %10, %11
  br i1 %cmp3, label %pfor.cond, label %pfor.cond.cleanup, !llvm.loop !4

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %sync.continue

sync.continue:                                    ; preds = %pfor.cond.cleanup
  call void @llvm.sync.unwind(token %syncreg)
  br label %pfor.end

pfor.end:                                         ; preds = %sync.continue, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: mustprogress noinline uwtable
define internal void @"_Z12parallel_forIZ4mainE3$_1EvmmT_l"(i64 noundef %start, i64 noundef %end, i32* %f.coerce, i64 noundef %granularity) #2 {
entry:
  %f = alloca %class.anon.0, align 8
  %start.addr = alloca i64, align 8
  %end.addr = alloca i64, align 8
  %granularity.addr = alloca i64, align 8
  %syncreg = call token @llvm.syncregion.start()
  %__init = alloca i64, align 8
  %__limit = alloca i64, align 8
  %__begin = alloca i64, align 8
  %__end = alloca i64, align 8
  %coerce.dive = getelementptr inbounds %class.anon.0, %class.anon.0* %f, i32 0, i32 0
  store i32* %f.coerce, i32** %coerce.dive, align 8
  store i64 %start, i64* %start.addr, align 8
  store i64 %end, i64* %end.addr, align 8
  store i64 %granularity, i64* %granularity.addr, align 8
  %0 = load i64, i64* %start.addr, align 8
  store i64 %0, i64* %__init, align 8
  %1 = load i64, i64* %end.addr, align 8
  store i64 %1, i64* %__limit, align 8
  %2 = load i64, i64* %__init, align 8
  %3 = load i64, i64* %__limit, align 8
  %cmp = icmp ult i64 %2, %3
  br i1 %cmp, label %pfor.ph, label %pfor.end

pfor.ph:                                          ; preds = %entry
  store i64 0, i64* %__begin, align 8
  %4 = load i64, i64* %__limit, align 8
  %5 = load i64, i64* %__init, align 8
  %sub = sub i64 %4, %5
  %sub1 = sub i64 %sub, 1
  %div = udiv i64 %sub1, 1
  %add = add i64 %div, 1
  store i64 %add, i64* %__end, align 8
  br label %pfor.cond

pfor.cond:                                        ; preds = %pfor.inc, %pfor.ph
  br label %pfor.detach

pfor.detach:                                      ; preds = %pfor.cond
  %6 = load i64, i64* %__init, align 8
  %7 = load i64, i64* %__begin, align 8
  %mul = mul i64 %7, 1
  %add2 = add i64 %6, %mul
  detach within %syncreg, label %pfor.body.entry, label %pfor.inc

pfor.body.entry:                                  ; preds = %pfor.detach
  %i = alloca i64, align 8
  store i64 %add2, i64* %i, align 8
  br label %pfor.body

pfor.body:                                        ; preds = %pfor.body.entry
  %8 = load i64, i64* %i, align 8
  call void @"_ZZ4mainENK3$_1clEm"(%class.anon.0* noundef nonnull align 8 dereferenceable(8) %f, i64 noundef %8)
  br label %pfor.preattach

pfor.preattach:                                   ; preds = %pfor.body
  reattach within %syncreg, label %pfor.inc

pfor.inc:                                         ; preds = %pfor.preattach, %pfor.detach
  %9 = load i64, i64* %__begin, align 8
  %inc = add i64 %9, 1
  store i64 %inc, i64* %__begin, align 8
  %10 = load i64, i64* %__begin, align 8
  %11 = load i64, i64* %__end, align 8
  %cmp3 = icmp ult i64 %10, %11
  br i1 %cmp3, label %pfor.cond, label %pfor.cond.cleanup, !llvm.loop !6

pfor.cond.cleanup:                                ; preds = %pfor.inc
  sync within %syncreg, label %sync.continue

sync.continue:                                    ; preds = %pfor.cond.cleanup
  call void @llvm.sync.unwind(token %syncreg)
  br label %pfor.end

pfor.end:                                         ; preds = %sync.continue, %entry
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare token @llvm.syncregion.start() #4

; Function Attrs: mustprogress noinline nounwind uwtable
define internal void @"_ZZ4mainENK3$_0clEm"(%class.anon* noundef nonnull align 8 dereferenceable(8) %this, i64 noundef %i) #5 align 2 {
entry:
  %this.addr = alloca %class.anon*, align 8
  %i.addr = alloca i64, align 8
  store %class.anon* %this, %class.anon** %this.addr, align 8
  store i64 %i, i64* %i.addr, align 8
  %this1 = load %class.anon*, %class.anon** %this.addr, align 8
  %0 = load i64, i64* %i.addr, align 8
  %1 = getelementptr inbounds %class.anon, %class.anon* %this1, i32 0, i32 0
  %2 = load i32*, i32** %1, align 8
  %3 = load i32, i32* %2, align 4
  %conv = sext i32 %3 to i64
  %add = add i64 %conv, %0
  %conv2 = trunc i64 %add to i32
  store i32 %conv2, i32* %2, align 4
  ret void
}

; Function Attrs: argmemonly willreturn
declare void @llvm.sync.unwind(token) #6

; Function Attrs: mustprogress noinline nounwind uwtable
define internal void @"_ZZ4mainENK3$_1clEm"(%class.anon.0* noundef nonnull align 8 dereferenceable(8) %this, i64 noundef %i) #5 align 2 {
entry:
  %this.addr = alloca %class.anon.0*, align 8
  %i.addr = alloca i64, align 8
  store %class.anon.0* %this, %class.anon.0** %this.addr, align 8
  store i64 %i, i64* %i.addr, align 8
  %this1 = load %class.anon.0*, %class.anon.0** %this.addr, align 8
  %0 = load i64, i64* %i.addr, align 8
  %mul = mul i64 2, %0
  %1 = getelementptr inbounds %class.anon.0, %class.anon.0* %this1, i32 0, i32 0
  %2 = load i32*, i32** %1, align 8
  %3 = load i32, i32* %2, align 4
  %conv = sext i32 %3 to i64
  %add = add i64 %conv, %mul
  %conv2 = trunc i64 %add to i32
  store i32 %conv2, i32* %2, align 4
  ret void
}

attributes #0 = { mustprogress noinline norecurse uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress noinline uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { mustprogress noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly willreturn }
attributes #7 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang a9be1306ca6ed5a9814f041c1db11a9ffe20487b)"}
!4 = distinct !{!4, !5}
!5 = !{!"tapir.loop.spawn.strategy", i32 1}
!6 = distinct !{!6, !5}
