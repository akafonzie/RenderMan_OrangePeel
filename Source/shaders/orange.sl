surface
	oSkinDiff(	
				float pDepth = -2.0, nFactor = 0.5, Ka = 1, Kd = 1, Ks = 0.5, roughness = 0.1,
				trueDisp = 1, rand = 0.5, Kr = .3;
				color specularcolor = 1;
			)
{
	/* Work on color, try and add some variation across the surface  */
	
	normal Nf = faceforward(normalize(N), I);
	vector V = -normalize(I);
	/* use some noise to add some color variation to the object*/
	
	color Cm = color (1.0, 0.22, 0.0);
	point pobj = transform("shader", P); //good to transform into the correct space before calculating noise
	float f = float noise(P);
	float f2 = float noise(f);
	color Ct = mix(Cm, Cs, filterstep(.64, f2));
	
	// add in the env map stuff
	vector Rcurrent = reflect(I, Nf);
	vector RWorld = vtransform("world", Rcurrent);
	color Cr = color environment("envMap.tx", RWorld);
	
	/* out put the culmination of the steps in the shader to the final colour */
	
	Oi = Os;
	Ci *= Oi;
	Ci = Oi * (Ct * (Ka * ambient() + Kd * diffuse(Nf))+ 
			  specularcolor * (Ks * specular(Nf, V, roughness) + 
			  Kr * Cr ));	
	
}