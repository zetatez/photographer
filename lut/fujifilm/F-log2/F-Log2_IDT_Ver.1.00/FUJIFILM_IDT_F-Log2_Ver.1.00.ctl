// ACES IDT for FUJIFILM F-Log2
// FUFJIFILM Corpration
// Version:1.00


float FLog2ToSceneLinearReflection(float x) {
    if (x > 0.100686685370811)
        return (pow(10,(x - 0.384316) / 0.245281) - 0.064829) / 5.555556;
    else
        return (x - 0.092864) / 8.799461;
}

void main
(   input varying float rIn,
    input varying float gIn,
    input varying float bIn,
    input varying float aIn,
    output varying float rOut,
    output varying float gOut,
    output varying float bOut,
    output varying float aOut)
{

    float r_lin = FLog2ToSceneLinearReflection(rIn);
    float g_lin = FLog2ToSceneLinearReflection(gIn);
    float b_lin = FLog2ToSceneLinearReflection(bIn);

    rOut = r_lin *  0.62021930886364 + g_lin * 0.18821587793692 + b_lin * 0.19156481319944;
    gOut = r_lin *  0.00494087068593 + g_lin * 0.89909785987571 + b_lin * 0.09596126943836;
    bOut = r_lin * -0.03660757899425 + g_lin * 0.03316228790203 + b_lin * 1.00344529109222;
    aOut = 1.0;

}
