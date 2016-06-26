mkdir crossllvm
cd crossllvm
git clone http://llvm.org/git/llvm.git
cd llvm/tools
git clone http://llvm.org/git/clang.git
git clone http://llvm.org/git/lld.git
cd ../projects
git clone http://llvm.org/git/compiler-rt.git
cd ../..
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$PS4DEV/toolchain -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_DEFAULT_TARGET_TRIPLE=x86_64-scei-ps4 -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCOMPILER_RT_BUILD_BUILTINS:BOOL=OFF -DCOMPILER_RT_BUILD_SANITIZERS:BOOL=OFF -DCOMPILER_RT_CAN_EXECUTE_TESTS:BOOL=OFF -DCOMPILER_RT_INCLUDE_TESTS:BOOL=OFF -DLLVM_TOOL_COMPILER_RT_BUILD:BOOL=OFF  -DCLANG_BUILD_EXAMPLES:BOOL=ON -DLLVM_TARGETS_TO_BUILD=X86 -DCMAKE_C_FLAGS="-Wdocumentation -Wno-documentation-deprecated-sync" -DCMAKE_CXX_FLAGS="-std=c++11 -Wdocumentation -Wno-documentation-deprecated-sync" -DLLVM_LIT_ARGS="-v" ../llvm
cmake --build . -- -j16
cmake --build . --target install
