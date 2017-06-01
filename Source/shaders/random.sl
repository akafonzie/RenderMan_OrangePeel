surface basic(
				uniform float Kd = 1.0;
				uniform float Ks = 1.0;
				uniform float roughness = 0.15;
				color specularColor = color(1);
			)
{
	//Local vars
	
	
	varying normal Nn = 0;
	Nn = normalize(N);
	vector V = -normalize(I);
	Oi = Os;
	Ci = Oi * Cs * (
				   (Kd * diffuse(Nn)) +
				   (Ks * specular(Nn, V, roughness) * specularColor)
					);

}


