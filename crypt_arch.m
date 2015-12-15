%crypt_arch
%testing matrix multiplication output for diffusion
input = [201,251,146,245;175,218,170,107;212,201,215,67;242,182,89,106];
shift = [201,251,146,245;218,170,107,175;215,67,212,201;106,242,182,89];
multi = [2,1,1,3;3,2,1,1;1,3,2,1;1,1,3,2];
dec2hex(shift*multi)
