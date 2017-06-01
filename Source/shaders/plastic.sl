surface plastic( float Ka = 1, Kd = 1, Ks = 0.5, roughness = 0.1; color SpecColor = 1; )
{
	normal Nf = faceforward(normalize(N), I);
	vector V = -normalize(I);
	Ci = Cs * (Ka * ambient() + Kd * diffuse(Nf)) + Ks * SpecColor * specular (Nf, V, roughness);
	Oi = Os;
	Ci *= Oi;

}