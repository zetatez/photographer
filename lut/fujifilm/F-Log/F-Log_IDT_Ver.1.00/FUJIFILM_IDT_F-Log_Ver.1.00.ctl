// ACES IDT for FUJIFILM F-Log
// FUFJIFILM Corpration
// Version:1.00


float FLogToSceneLinearReflection(float x) {
    if (x > 0.100537775223865)
        return (pow(10,(x - 0.790453) / 0.344676) - 0.009468) / 0.555556;
    else
        return (x - 0.092864) / 8.735631;
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

    float r_lin = FLogToSceneLinearReflection(rIn);
    float g_lin = FLogToSceneLinearReflection(gIn);
    float b_lin = FLogToSceneLinearReflection(bIn);

    rOut = r_lin *  0.70225442114640 + g_lin * 0.18334266960590 + b_lin * 0.11440290924770;
    gOut = r_lin * -0.07108200261915 + g_lin * 1.05471859084908 + b_lin * 0.01636341177007;
    bOut = r_lin * -0.12854056609733 + g_lin * 0.07603368101636 + b_lin * 1.05250688508097;
    aOut = 1.0;

}
