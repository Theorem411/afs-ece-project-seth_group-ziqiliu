
__attribute__((noinline))
__attribute__((callback (func, value)))
void executeFuncPtr(void (*func)(int), int value) {
    func(value);
}
