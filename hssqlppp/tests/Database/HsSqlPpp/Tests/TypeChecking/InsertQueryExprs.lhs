
> {-# LANGUAGE OverloadedStrings #-}
> module Database.HsSqlPpp.Tests.TypeChecking.InsertQueryExprs
>     (insertQueryExprs) where

> import Database.HsSqlPpp.Internals.TypesInternal
> import Database.HsSqlPpp.Tests.TypeChecking.Utils
> import Database.HsSqlPpp.Types
> import Database.HsSqlPpp.Catalog
> --import Database.HsSqlPpp.TypeChecker


> insertQueryExprs :: Item
> insertQueryExprs =
>   Group "insertQueryExpr"
>       [
>        -- int to bigint
>        InsertQueryExpr
>         [CatCreateTable "t1" [("a", mkCatNameExtra "int4")]
>         ,CatCreateTable "t2" [("b", mkCatNameExtra "int8")]]
>         "insert into t2(b) select a from t1;"
>         $ Right $ CompositeType [("a", mkTypeExtra typeBigInt)]
>        -- null to not null 
>       ,InsertQueryExpr
>         [CatCreateTable "t1" [("a", mkCatNameExtra "int4")]
>         ,CatCreateTable "t2" [("b", mkCatNameExtraNN "int4")]]
>         "insert into t2(b) select a from t1;"
>         $ Right $ CompositeType [("a", mkTypeExtraNN typeInt)]
>        -- not null to null
>       ,InsertQueryExpr
>         [CatCreateTable "t1" [("a", mkCatNameExtraNN "int4")]
>         ,CatCreateTable "t2" [("b", mkCatNameExtra "int4")]]
>         "insert into t2(b) select a from t1;"
>         $ Right $ CompositeType [("a", mkTypeExtra typeInt)]
>        -- implicit column list
>       ,InsertQueryExpr
>         [CatCreateTable "t1" [("a", mkCatNameExtraNN "int4")]
>         ,CatCreateTable "t2" [("b", mkCatNameExtra "int4")]]
>         "insert into t2 select a from t1;"
>         $ Right $ CompositeType [("a", mkTypeExtra typeInt)]
>       ]