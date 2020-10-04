module Ponto (Ponto (Ponto2D), distancia, colineares, formaTriangulo) where

data Ponto = Ponto2D Float Float deriving Show

distancia :: Ponto -> Ponto -> Float
distancia (Ponto2D x0 y0) (Ponto2D x1 y1) = sqrt((x0-x1)^2 + (y0-y1)^2)

colineares :: Ponto -> Ponto -> Ponto -> Bool
colineares (Ponto2D x0 y0) (Ponto2D x1 y1) (Ponto2D x2 y2) = x0*y1+x1*y2+x2*y0-x0*y2-x1*y0-x2*y1 == 0

formaTriangulo :: Ponto -> Ponto -> Ponto -> Bool
formaTriangulo p0 p1 p2 = ((distancia p0 p1) + (distancia p1 p2) > (distancia p0 p2) &&
                           (distancia p0 p1) + (distancia p0 p2) > (distancia p1 p2) &&
                           (distancia p0 p2) + (distancia p1 p2) > (distancia p0 p1))