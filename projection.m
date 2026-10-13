W = 800; H = 600;
n = 0.2; f = 20;
fx = 800; fy = 800;
ox = 400; oy = 400;
Pc = [0.3; -0.15; -6.0; 1];

glProj = @(fx,fy,ox,oy,W,H,n,f) [
    2*fx/W, 0, 1 - 2*ox/W, 0;
    0, 2*fy/H, 1 - 2*oy/H, 0;
    0, 0, -(f+n)/(f-n), -2*f*n/(f-n);
    0, 0, -1, 0 ];

M = glProj(fx, fy, ox, oy, W, H, n, f);

clip = M * Pc; 
ndc = clip(1:3) / clip(4);

u = 0.5 * (ndc(1) + 1.0) * W
v = 0.5 * (ndc(2) + 1.0) * H