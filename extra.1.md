# Modify F matrix for cropped views

Cut the image_1 to $(575, 374), (748, 728)$,

image_2 to $(952, 328), (1139, 785)$.

##
Assume $(x_1,y_1)$ is the top-left corner of the cutting image, $(x_2, y_2)$ is the bottom-right of the cutting image.

Define
$$
x_i' = x_i - x_1 + 1\\
y_i' = y_i - y_1 + 1\\
x_1 \le x_i \le x_2,\quad y_1 \le y_i \le y_2
$$

We want to transform
$$
(x_i, y_i) \to (x_i', y_i')
$$

Define 
$$
p = \begin{bmatrix}
    x_i\\
    y_i\\
    1
\end{bmatrix}\\
p' = \begin{bmatrix}
    x_i'\\
    y_i'\\
    1
\end{bmatrix}
$$
then
$$
\begin{bmatrix}
    x_i'\\
    y_i\\
    1
\end{bmatrix}
= \begin{bmatrix}
    1 & 0 & 1 - x_1\\
    0 & 1 & 1 - y_1\\
    0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
    x_i\\
    y_i\\
    1
\end{bmatrix}
$$
Let
$$
T = \begin{bmatrix}
    1 & 0 & 1 - x_i\\
    0 & 1 & 1 - y_i\\
    0 & 0 & 1
\end{bmatrix}
$$
then
$$
p' = Tp
$$

Assume $w$ is the 3D coordinate for $p$, so
$$
p = K P w\\
Tp = T K P w\\
p' = (TK) P w
$$

So the new instinct matrix $K' = TK$.