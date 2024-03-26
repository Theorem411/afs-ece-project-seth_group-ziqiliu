; ModuleID = 'callback.ll'
source_filename = "callback.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@loc = dso_local global i32 0, align 4

; Function Attrs: mustprogress nofree noinline norecurse nounwind uwtable
define dso_local void @_Z11myFunction1i(i32 noundef %x) #0 {
entry:
  %0 = load volatile i32, i32* @loc, align 4, !tbaa !3
  %add = add nsw i32 %0, %x
  store volatile i32 %add, i32* @loc, align 4, !tbaa !3
  ret void
}

; Function Attrs: mustprogress nofree noinline norecurse nounwind uwtable
define dso_local void @_Z11myFunction2i(i32 noundef %x) #0 {
entry:
  %add = add nsw i32 %x, 1
  store volatile i32 %add, i32* @loc, align 4, !tbaa !3
  ret void
}

; Function Attrs: mustprogress noinline uwtable
define dso_local void @_Z14executeFuncPtrPFviEi(void (i32)* nocapture noundef readonly %func, i32 noundef %value) local_unnamed_addr #1 !callback !7 {
entry:
  tail call void %func(i32 noundef %value)
  ret void
}

; Function Attrs: mustprogress noinline uwtable
define dso_local noundef i32 @_Z4demov() local_unnamed_addr #1 {
entry:
  tail call void @_Z14executeFuncPtrPFviEi(void (i32)* noundef nonnull @_Z11myFunction1i, i32 noundef 5)
  tail call void @_Z14executeFuncPtrPFviEi(void (i32)* noundef nonnull @_Z11myFunction2i, i32 noundef 5)
  ret i32 0
}

attributes #0 = { mustprogress nofree noinline norecurse nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress noinline uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{!"clang version 14.0.6 (/afs/ece/project/seth_group/ziqiliu/uli-opencilk-project/clang 7bd465c3ab0afbef62b430a362e3cd897fef2fd6)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!8}
!8 = !{i64 0, i64 1, i1 false}
