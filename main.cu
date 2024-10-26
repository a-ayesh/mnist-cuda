#include <iostream>
using namespace std;

__global__ void checkCudaKernel() {
    printf("CUDA kernel is running on the GPU!\n");
}

int main() {
    // Check CUDA Device Properties
    int deviceCount;
    cudaGetDeviceCount(&deviceCount);
    if (deviceCount == 0) {
        cout << "No CUDA-compatible device detected.\n";
        return 1;
    } else {
        cout << "CUDA-compatible device found.\n";
    }

    // Launch a kernel to verify execution on the GPU
    checkCudaKernel<<<1, 1>>>();
    cudaDeviceSynchronize(); // Ensure kernel execution completes

    return 0;
}
