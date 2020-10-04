import Ponto

main = do
    print(distancia (Ponto2D 1 1) (Ponto2D 0 2))
    print(colineares (Ponto2D 0 0) (Ponto2D 1 1) (Ponto2D 2 2))
    print(colineares (Ponto2D 0 0) (Ponto2D 1 0) (Ponto2D 0 1))
    print(formaTriangulo (Ponto2D 0 0) (Ponto2D 1 1) (Ponto2D 2 2))
    print(formaTriangulo (Ponto2D 2 0) (Ponto2D 1 8) (Ponto2D 1 2))
    print(formaTriangulo (Ponto2D 0 0) (Ponto2D 0 1) (Ponto2D 1 0))
