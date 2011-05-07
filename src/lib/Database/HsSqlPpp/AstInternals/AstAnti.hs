{-
This file is autogenerated, to generate: load this file (MakeAntiNodes.lhs)
into ghci and run:
nwriteAntiNodes
n\nThe path might need tweaking.
n-}
{-# LANGUAGE DeriveDataTypeable #-}
module Database.HsSqlPpp.AstInternals.AstAnti
       (convertStatements, convertScalarExpr, attributeDef, queryExpr,
        Statement(..), QueryExpr(..), WithQuery(..), FnBody(..),
        TableRef(..), TableAlias(..), JoinExpr(..), JoinType(..),
        SelectList(..), SelectItem(..), CopySource(..), AttributeDef(..),
        RowConstraint(..), AlterTableAction(..), Constraint(..),
        TypeAttributeDef(..), ParamDef(..), VarDef(..), RaiseType(..),
        CombineType(..), Volatility(..), Language(..), TypeName(..),
        DropType(..), Cascade(..), Direction(..), Distinct(..),
        Natural(..), IfExists(..), Replace(..), RestartIdentity(..),
        ScalarExpr(..), SQIdentifier(..), IntervalField(..),
        ExtractField(..), FrameClause(..), InList(..), LiftFlavour(..),
        TriggerWhen(..), TriggerEvent(..), TriggerFire(..), SetValue(..),
        WithQueryList, StatementList, ScalarExprListStatementListPairList,
        ScalarExprListStatementListPair, ScalarExprList, ParamDefList,
        AttributeDefList, ConstraintList, TypeAttributeDefList,
        TypeNameList, StringTypeNameListPair, StringTypeNameListPairList,
        ScalarExprStatementListPairList,
        CaseScalarExprListScalarExprPairList, MaybeScalarExpr,
        TableRefList, ScalarExprListList, SelectItemList, OnExpr,
        RowConstraintList, VarDefList, ScalarExprStatementListPair,
        CaseScalarExprListScalarExprPair, ScalarExprDirectionPair,
        ScalarExprDirectionPairList, MaybeBoolExpr, MaybeSelectList,
        AlterTableActionList)
       where
import Data.Generics
import Database.HsSqlPpp.AstInternals.AstAnnotation
import qualified Database.HsSqlPpp.AstInternals.AstInternal as A
 
convertStatements :: [Statement] -> [A.Statement]
convertStatements = statementList
 
convertScalarExpr :: ScalarExpr -> A.ScalarExpr
convertScalarExpr = scalarExpr
 
data JoinType = Inner
              | LeftOuter
              | RightOuter
              | FullOuter
              | Cross
              deriving (Show, Eq, Typeable, Data)
 
data CopySource = CopyFilename String
                | Stdin
                deriving (Show, Eq, Typeable, Data)
 
data SetValue = SetStr Annotation String
              | SetId Annotation String
              | SetNum Annotation Double
              deriving (Show, Eq, Typeable, Data)
 
data TriggerWhen = TriggerBefore
                 | TriggerAfter
                 deriving (Show, Eq, Typeable, Data)
 
data TriggerEvent = TInsert
                  | TUpdate
                  | TDelete
                  | AntiTriggerEvent String
                  deriving (Show, Eq, Typeable, Data)
 
data TriggerFire = EachRow
                 | EachStatement
                 deriving (Show, Eq, Typeable, Data)
 
data RaiseType = RNotice
               | RException
               | RError
               deriving (Show, Eq, Typeable, Data)
 
data CombineType = Except
                 | Union
                 | Intersect
                 | UnionAll
                 deriving (Show, Eq, Typeable, Data)
 
data Volatility = Volatile
                | Stable
                | Immutable
                deriving (Show, Eq, Typeable, Data)
 
data Language = Sql
              | Plpgsql
              deriving (Show, Eq, Typeable, Data)
 
data DropType = Table
              | Domain
              | View
              | Type
              deriving (Show, Eq, Typeable, Data)
 
data Cascade = Cascade
             | Restrict
             deriving (Show, Eq, Typeable, Data)
 
data Direction = Asc
               | Desc
               deriving (Show, Eq, Typeable, Data)
 
data Distinct = Distinct
              | Dupes
              deriving (Show, Eq, Typeable, Data)
 
data Natural = Natural
             | Unnatural
             deriving (Show, Eq, Typeable, Data)
 
data IfExists = Require
              | IfExists
              deriving (Show, Eq, Typeable, Data)
 
data Replace = Replace
             | NoReplace
             deriving (Show, Eq, Typeable, Data)
 
data RestartIdentity = RestartIdentity
                     | ContinueIdentity
                     deriving (Show, Eq, Typeable, Data)
 
data LiftFlavour = LiftAny
                 | LiftAll
                 deriving (Show, Eq, Typeable, Data)
 
data IntervalField = IntervalYear
                   | IntervalMonth
                   | IntervalDay
                   | IntervalHour
                   | IntervalMinute
                   | IntervalSecond
                   | IntervalYearToMonth
                   | IntervalDayToHour
                   | IntervalDayToMinute
                   | IntervalDayToSecond
                   | IntervalHourToMinute
                   | IntervalHourToSecond
                   | IntervalMinuteToSecond
                   deriving (Show, Eq, Typeable, Data)
 
data ExtractField = ExtractCentury
                  | ExtractDay
                  | ExtractDecade
                  | ExtractDow
                  | ExtractDoy
                  | ExtractEpoch
                  | ExtractHour
                  | ExtractIsodow
                  | ExtractIsoyear
                  | ExtractMicroseconds
                  | ExtractMillennium
                  | ExtractMilliseconds
                  | ExtractMinute
                  | ExtractMonth
                  | ExtractQuarter
                  | ExtractSecond
                  | ExtractTimezone
                  | ExtractTimezoneHour
                  | ExtractTimezoneMinute
                  | ExtractWeek
                  | ExtractYear
                  deriving (Show, Eq, Typeable, Data)
 
data FrameClause = FrameUnboundedPreceding
                 | FrameUnboundedFull
                 | FrameRowsUnboundedPreceding
                 deriving (Show, Eq, Typeable, Data)
 
data AlterTableAction = AddConstraint Annotation Constraint
                      | AlterColumnDefault Annotation String ScalarExpr
                      deriving (Data, Eq, Show, Typeable)
 
data AttributeDef = AttributeDef Annotation String TypeName
                                 MaybeScalarExpr RowConstraintList
                  deriving (Data, Eq, Show, Typeable)
 
data Constraint = CheckConstraint Annotation String ScalarExpr
                | PrimaryKeyConstraint Annotation String [String]
                | ReferenceConstraint Annotation String [String] String [String]
                                      Cascade Cascade
                | UniqueConstraint Annotation String [String]
                deriving (Data, Eq, Show, Typeable)
 
data FnBody = PlpgsqlFnBody Annotation Statement
            | SqlFnBody Annotation StatementList
            deriving (Data, Eq, Show, Typeable)
 
data InList = InList Annotation ScalarExprList
            | InQueryExpr Annotation QueryExpr
            deriving (Data, Eq, Show, Typeable)
 
data JoinExpr = JoinOn Annotation ScalarExpr
              | JoinUsing Annotation [String]
              deriving (Data, Eq, Show, Typeable)
 
data ParamDef = ParamDef Annotation String TypeName
              | ParamDefTp Annotation TypeName
              deriving (Data, Eq, Show, Typeable)
 
data QueryExpr = CombineQueryExpr Annotation CombineType QueryExpr
                                  QueryExpr
               | Select Annotation Distinct SelectList TableRefList MaybeBoolExpr
                        ScalarExprList MaybeBoolExpr ScalarExprDirectionPairList
                        MaybeScalarExpr MaybeScalarExpr
               | Values Annotation ScalarExprListList
               | WithQueryExpr Annotation WithQueryList QueryExpr
               deriving (Data, Eq, Show, Typeable)
 
data RowConstraint = NotNullConstraint Annotation String
                   | NullConstraint Annotation String
                   | RowCheckConstraint Annotation String ScalarExpr
                   | RowPrimaryKeyConstraint Annotation String
                   | RowReferenceConstraint Annotation String String (Maybe String)
                                            Cascade Cascade
                   | RowUniqueConstraint Annotation String
                   deriving (Data, Eq, Show, Typeable)
 
data SQIdentifier = SQIdentifier Annotation [String]
                  deriving (Data, Eq, Show, Typeable)
 
data ScalarExpr = BooleanLit Annotation Bool
                | Case Annotation CaseScalarExprListScalarExprPairList
                       MaybeScalarExpr
                | CaseSimple Annotation ScalarExpr
                             CaseScalarExprListScalarExprPairList MaybeScalarExpr
                | Cast Annotation ScalarExpr TypeName
                | Exists Annotation QueryExpr
                | Extract Annotation ExtractField ScalarExpr
                | FloatLit Annotation String
                | FunCall Annotation String ScalarExprList
                | Identifier Annotation String
                | InPredicate Annotation ScalarExpr Bool InList
                | IntegerLit Annotation Integer
                | Interval Annotation String IntervalField (Maybe Int)
                | LiftOperator Annotation String LiftFlavour ScalarExprList
                | NullLit Annotation
                | Placeholder Annotation
                | PositionalArg Annotation Integer
                | QIdentifier Annotation ScalarExpr String
                | ScalarSubQuery Annotation QueryExpr
                | StringLit Annotation String
                | TypedStringLit Annotation TypeName String
                | WindowFn Annotation ScalarExpr ScalarExprList ScalarExprList
                           Direction FrameClause
                | AntiScalarExpr String
                deriving (Data, Eq, Show, Typeable)
 
data SelectItem = SelExp Annotation ScalarExpr
                | SelectItem Annotation ScalarExpr String
                deriving (Data, Eq, Show, Typeable)
 
data SelectList = SelectList Annotation SelectItemList
                deriving (Data, Eq, Show, Typeable)
 
data Statement = AlterSequence Annotation String SQIdentifier
               | AlterTable Annotation String AlterTableActionList
               | Assignment Annotation ScalarExpr ScalarExpr
               | Block Annotation (Maybe String) VarDefList StatementList
               | CaseStatement Annotation ScalarExprListStatementListPairList
                               StatementList
               | CaseStatementSimple Annotation ScalarExpr
                                     ScalarExprListStatementListPairList StatementList
               | ContinueStatement Annotation (Maybe String)
               | Copy Annotation String [String] CopySource
               | CopyData Annotation String
               | CreateDomain Annotation String TypeName String MaybeBoolExpr
               | CreateFunction Annotation String ParamDefList TypeName Replace
                                Language FnBody Volatility
               | CreateLanguage Annotation String
               | CreateSequence Annotation String Integer Integer Integer Integer
                                Integer
               | CreateTable Annotation String AttributeDefList ConstraintList
               | CreateTableAs Annotation String QueryExpr
               | CreateTrigger Annotation String TriggerWhen [TriggerEvent] String
                               TriggerFire String ScalarExprList
               | CreateType Annotation String TypeAttributeDefList
               | CreateView Annotation String (Maybe [String]) QueryExpr
               | Delete Annotation SQIdentifier TableRefList MaybeBoolExpr
                        MaybeSelectList
               | DropFunction Annotation IfExists StringTypeNameListPairList
                              Cascade
               | DropSomething Annotation DropType IfExists [String] Cascade
               | Execute Annotation ScalarExpr
               | ExitStatement Annotation (Maybe String)
               | ForIntegerStatement Annotation (Maybe String) ScalarExpr
                                     ScalarExpr ScalarExpr StatementList
               | ForQueryStatement Annotation (Maybe String) ScalarExpr QueryExpr
                                   StatementList
               | If Annotation ScalarExprStatementListPairList StatementList
               | Insert Annotation SQIdentifier [String] QueryExpr MaybeSelectList
               | Into Annotation Bool ScalarExprList Statement
               | LoopStatement Annotation (Maybe String) StatementList
               | Notify Annotation String
               | NullStatement Annotation
               | Perform Annotation ScalarExpr
               | QueryStatement Annotation QueryExpr
               | Raise Annotation RaiseType String ScalarExprList
               | Return Annotation MaybeScalarExpr
               | ReturnNext Annotation ScalarExpr
               | ReturnQuery Annotation QueryExpr
               | Set Annotation String [SetValue]
               | Truncate Annotation [String] RestartIdentity Cascade
               | Update Annotation SQIdentifier ScalarExprList TableRefList
                        MaybeBoolExpr MaybeSelectList
               | WhileStatement Annotation (Maybe String) ScalarExpr StatementList
               | AntiStatement String
               deriving (Data, Eq, Show, Typeable)
 
data TableAlias = FullAlias Annotation String [String]
                | NoAlias Annotation
                | TableAlias Annotation String
                deriving (Data, Eq, Show, Typeable)
 
data TableRef = FunTref Annotation ScalarExpr TableAlias
              | JoinTref Annotation TableRef Natural JoinType TableRef OnExpr
                         TableAlias
              | SubTref Annotation QueryExpr TableAlias
              | Tref Annotation SQIdentifier TableAlias
              deriving (Data, Eq, Show, Typeable)
 
data TypeAttributeDef = TypeAttDef Annotation String TypeName
                      deriving (Data, Eq, Show, Typeable)
 
data TypeName = ArrayTypeName Annotation TypeName
              | Prec2TypeName Annotation String Integer Integer
              | PrecTypeName Annotation String Integer
              | SetOfTypeName Annotation TypeName
              | SimpleTypeName Annotation String
              deriving (Data, Eq, Show, Typeable)
 
data VarDef = ParamAlias Annotation String Integer
            | VarAlias Annotation String String
            | VarDef Annotation String TypeName (Maybe ScalarExpr)
            deriving (Data, Eq, Show, Typeable)
 
data WithQuery = WithQuery Annotation String (Maybe [String])
                           QueryExpr
               deriving (Data, Eq, Show, Typeable)
 
type AlterTableActionList = [AlterTableAction]
 
type AttributeDefList = [AttributeDef]
 
type CaseScalarExprListScalarExprPair =
     (ScalarExprList, ScalarExpr)
 
type CaseScalarExprListScalarExprPairList =
     [CaseScalarExprListScalarExprPair]
 
type ConstraintList = [Constraint]
 
type MaybeBoolExpr = Maybe ScalarExpr
 
type MaybeScalarExpr = Maybe ScalarExpr
 
type MaybeSelectList = Maybe SelectList
 
type OnExpr = Maybe JoinExpr
 
type ParamDefList = [ParamDef]
 
type RowConstraintList = [RowConstraint]
 
type ScalarExprDirectionPair = (ScalarExpr, Direction)
 
type ScalarExprDirectionPairList = [ScalarExprDirectionPair]
 
type ScalarExprList = [ScalarExpr]
 
type ScalarExprListList = [ScalarExprList]
 
type ScalarExprListStatementListPair =
     (ScalarExprList, StatementList)
 
type ScalarExprListStatementListPairList =
     [ScalarExprListStatementListPair]
 
type ScalarExprStatementListPair = (ScalarExpr, StatementList)
 
type ScalarExprStatementListPairList =
     [ScalarExprStatementListPair]
 
type SelectItemList = [SelectItem]
 
type StatementList = [Statement]
 
type StringTypeNameListPair = (String, TypeNameList)
 
type StringTypeNameListPairList = [StringTypeNameListPair]
 
type TableRefList = [TableRef]
 
type TypeAttributeDefList = [TypeAttributeDef]
 
type TypeNameList = [TypeName]
 
type VarDefList = [VarDef]
 
type WithQueryList = [WithQuery]
 
joinType :: JoinType -> A.JoinType
joinType x
  = case x of
        Inner -> A.Inner
        LeftOuter -> A.LeftOuter
        RightOuter -> A.RightOuter
        FullOuter -> A.FullOuter
        Cross -> A.Cross
 
copySource :: CopySource -> A.CopySource
copySource x
  = case x of
        CopyFilename a1 -> A.CopyFilename a1
        Stdin -> A.Stdin
 
setValue :: SetValue -> A.SetValue
setValue x
  = case x of
        SetStr a1 a2 -> A.SetStr a1 a2
        SetId a1 a2 -> A.SetId a1 a2
        SetNum a1 a2 -> A.SetNum a1 a2
 
triggerWhen :: TriggerWhen -> A.TriggerWhen
triggerWhen x
  = case x of
        TriggerBefore -> A.TriggerBefore
        TriggerAfter -> A.TriggerAfter
 
triggerEvent :: TriggerEvent -> A.TriggerEvent
triggerEvent x
  = case x of
        TInsert -> A.TInsert
        TUpdate -> A.TUpdate
        TDelete -> A.TDelete
        AntiTriggerEvent _ -> error "can't convert anti triggerEvent"
 
triggerFire :: TriggerFire -> A.TriggerFire
triggerFire x
  = case x of
        EachRow -> A.EachRow
        EachStatement -> A.EachStatement
 
raiseType :: RaiseType -> A.RaiseType
raiseType x
  = case x of
        RNotice -> A.RNotice
        RException -> A.RException
        RError -> A.RError
 
combineType :: CombineType -> A.CombineType
combineType x
  = case x of
        Except -> A.Except
        Union -> A.Union
        Intersect -> A.Intersect
        UnionAll -> A.UnionAll
 
volatility :: Volatility -> A.Volatility
volatility x
  = case x of
        Volatile -> A.Volatile
        Stable -> A.Stable
        Immutable -> A.Immutable
 
language :: Language -> A.Language
language x
  = case x of
        Sql -> A.Sql
        Plpgsql -> A.Plpgsql
 
dropType :: DropType -> A.DropType
dropType x
  = case x of
        Table -> A.Table
        Domain -> A.Domain
        View -> A.View
        Type -> A.Type
 
cascade :: Cascade -> A.Cascade
cascade x
  = case x of
        Cascade -> A.Cascade
        Restrict -> A.Restrict
 
direction :: Direction -> A.Direction
direction x
  = case x of
        Asc -> A.Asc
        Desc -> A.Desc
 
distinct :: Distinct -> A.Distinct
distinct x
  = case x of
        Distinct -> A.Distinct
        Dupes -> A.Dupes
 
natural :: Natural -> A.Natural
natural x
  = case x of
        Natural -> A.Natural
        Unnatural -> A.Unnatural
 
ifExists :: IfExists -> A.IfExists
ifExists x
  = case x of
        Require -> A.Require
        IfExists -> A.IfExists
 
replace :: Replace -> A.Replace
replace x
  = case x of
        Replace -> A.Replace
        NoReplace -> A.NoReplace
 
restartIdentity :: RestartIdentity -> A.RestartIdentity
restartIdentity x
  = case x of
        RestartIdentity -> A.RestartIdentity
        ContinueIdentity -> A.ContinueIdentity
 
liftFlavour :: LiftFlavour -> A.LiftFlavour
liftFlavour x
  = case x of
        LiftAny -> A.LiftAny
        LiftAll -> A.LiftAll
 
intervalField :: IntervalField -> A.IntervalField
intervalField x
  = case x of
        IntervalYear -> A.IntervalYear
        IntervalMonth -> A.IntervalMonth
        IntervalDay -> A.IntervalDay
        IntervalHour -> A.IntervalHour
        IntervalMinute -> A.IntervalMinute
        IntervalSecond -> A.IntervalSecond
        IntervalYearToMonth -> A.IntervalYearToMonth
        IntervalDayToHour -> A.IntervalDayToHour
        IntervalDayToMinute -> A.IntervalDayToMinute
        IntervalDayToSecond -> A.IntervalDayToSecond
        IntervalHourToMinute -> A.IntervalHourToMinute
        IntervalHourToSecond -> A.IntervalHourToSecond
        IntervalMinuteToSecond -> A.IntervalMinuteToSecond
 
extractField :: ExtractField -> A.ExtractField
extractField x
  = case x of
        ExtractCentury -> A.ExtractCentury
        ExtractDay -> A.ExtractDay
        ExtractDecade -> A.ExtractDecade
        ExtractDow -> A.ExtractDow
        ExtractDoy -> A.ExtractDoy
        ExtractEpoch -> A.ExtractEpoch
        ExtractHour -> A.ExtractHour
        ExtractIsodow -> A.ExtractIsodow
        ExtractIsoyear -> A.ExtractIsoyear
        ExtractMicroseconds -> A.ExtractMicroseconds
        ExtractMillennium -> A.ExtractMillennium
        ExtractMilliseconds -> A.ExtractMilliseconds
        ExtractMinute -> A.ExtractMinute
        ExtractMonth -> A.ExtractMonth
        ExtractQuarter -> A.ExtractQuarter
        ExtractSecond -> A.ExtractSecond
        ExtractTimezone -> A.ExtractTimezone
        ExtractTimezoneHour -> A.ExtractTimezoneHour
        ExtractTimezoneMinute -> A.ExtractTimezoneMinute
        ExtractWeek -> A.ExtractWeek
        ExtractYear -> A.ExtractYear
 
frameClause :: FrameClause -> A.FrameClause
frameClause x
  = case x of
        FrameUnboundedPreceding -> A.FrameUnboundedPreceding
        FrameUnboundedFull -> A.FrameUnboundedFull
        FrameRowsUnboundedPreceding -> A.FrameRowsUnboundedPreceding
 
alterTableAction :: AlterTableAction -> A.AlterTableAction
alterTableAction x
  = case x of
        AddConstraint a1 a2 -> A.AddConstraint a1 (constraint a2)
        AlterColumnDefault a1 a2 a3 -> A.AlterColumnDefault a1 a2
                                         (scalarExpr a3)
 
attributeDef :: AttributeDef -> A.AttributeDef
attributeDef x
  = case x of
        AttributeDef a1 a2 a3 a4 a5 -> A.AttributeDef a1 a2 (typeName a3)
                                         (maybeScalarExpr a4)
                                         (rowConstraintList a5)
 
constraint :: Constraint -> A.Constraint
constraint x
  = case x of
        CheckConstraint a1 a2 a3 -> A.CheckConstraint a1 a2 (scalarExpr a3)
        PrimaryKeyConstraint a1 a2 a3 -> A.PrimaryKeyConstraint a1 a2 a3
        ReferenceConstraint a1 a2 a3 a4 a5 a6 a7 -> A.ReferenceConstraint
                                                      a1
                                                      a2
                                                      a3
                                                      a4
                                                      a5
                                                      (cascade a6)
                                                      (cascade a7)
        UniqueConstraint a1 a2 a3 -> A.UniqueConstraint a1 a2 a3
 
fnBody :: FnBody -> A.FnBody
fnBody x
  = case x of
        PlpgsqlFnBody a1 a2 -> A.PlpgsqlFnBody a1 (statement a2)
        SqlFnBody a1 a2 -> A.SqlFnBody a1 (statementList a2)
 
inList :: InList -> A.InList
inList x
  = case x of
        InList a1 a2 -> A.InList a1 (scalarExprList a2)
        InQueryExpr a1 a2 -> A.InQueryExpr a1 (queryExpr a2)
 
joinExpr :: JoinExpr -> A.JoinExpr
joinExpr x
  = case x of
        JoinOn a1 a2 -> A.JoinOn a1 (scalarExpr a2)
        JoinUsing a1 a2 -> A.JoinUsing a1 a2
 
paramDef :: ParamDef -> A.ParamDef
paramDef x
  = case x of
        ParamDef a1 a2 a3 -> A.ParamDef a1 a2 (typeName a3)
        ParamDefTp a1 a2 -> A.ParamDefTp a1 (typeName a2)
 
queryExpr :: QueryExpr -> A.QueryExpr
queryExpr x
  = case x of
        CombineQueryExpr a1 a2 a3 a4 -> A.CombineQueryExpr a1
                                          (combineType a2)
                                          (queryExpr a3)
                                          (queryExpr a4)
        Select a1 a2 a3 a4 a5 a6 a7 a8 a9 a10 -> A.Select a1 (distinct a2)
                                                   (selectList a3)
                                                   (tableRefList a4)
                                                   (maybeBoolExpr a5)
                                                   (scalarExprList a6)
                                                   (maybeBoolExpr a7)
                                                   (scalarExprDirectionPairList a8)
                                                   (maybeScalarExpr a9)
                                                   (maybeScalarExpr a10)
        Values a1 a2 -> A.Values a1 (scalarExprListList a2)
        WithQueryExpr a1 a2 a3 -> A.WithQueryExpr a1 (withQueryList a2)
                                    (queryExpr a3)
 
rowConstraint :: RowConstraint -> A.RowConstraint
rowConstraint x
  = case x of
        NotNullConstraint a1 a2 -> A.NotNullConstraint a1 a2
        NullConstraint a1 a2 -> A.NullConstraint a1 a2
        RowCheckConstraint a1 a2 a3 -> A.RowCheckConstraint a1 a2
                                         (scalarExpr a3)
        RowPrimaryKeyConstraint a1 a2 -> A.RowPrimaryKeyConstraint a1 a2
        RowReferenceConstraint a1 a2 a3 a4 a5
          a6 -> A.RowReferenceConstraint a1 a2 a3 a4 (cascade a5)
                  (cascade a6)
        RowUniqueConstraint a1 a2 -> A.RowUniqueConstraint a1 a2
 
sQIdentifier :: SQIdentifier -> A.SQIdentifier
sQIdentifier x
  = case x of
        SQIdentifier a1 a2 -> A.SQIdentifier a1 a2
 
scalarExpr :: ScalarExpr -> A.ScalarExpr
scalarExpr x
  = case x of
        BooleanLit a1 a2 -> A.BooleanLit a1 a2
        Case a1 a2 a3 -> A.Case a1
                           (caseScalarExprListScalarExprPairList a2)
                           (maybeScalarExpr a3)
        CaseSimple a1 a2 a3 a4 -> A.CaseSimple a1 (scalarExpr a2)
                                    (caseScalarExprListScalarExprPairList a3)
                                    (maybeScalarExpr a4)
        Cast a1 a2 a3 -> A.Cast a1 (scalarExpr a2) (typeName a3)
        Exists a1 a2 -> A.Exists a1 (queryExpr a2)
        Extract a1 a2 a3 -> A.Extract a1 (extractField a2) (scalarExpr a3)
        FloatLit a1 a2 -> A.FloatLit a1 a2
        FunCall a1 a2 a3 -> A.FunCall a1 a2 (scalarExprList a3)
        Identifier a1 a2 -> A.Identifier a1 a2
        InPredicate a1 a2 a3 a4 -> A.InPredicate a1 (scalarExpr a2) a3
                                     (inList a4)
        IntegerLit a1 a2 -> A.IntegerLit a1 a2
        Interval a1 a2 a3 a4 -> A.Interval a1 a2 (intervalField a3) a4
        LiftOperator a1 a2 a3 a4 -> A.LiftOperator a1 a2 (liftFlavour a3)
                                      (scalarExprList a4)
        NullLit a1 -> A.NullLit a1
        Placeholder a1 -> A.Placeholder a1
        PositionalArg a1 a2 -> A.PositionalArg a1 a2
        QIdentifier a1 a2 a3 -> A.QIdentifier a1 (scalarExpr a2) a3
        ScalarSubQuery a1 a2 -> A.ScalarSubQuery a1 (queryExpr a2)
        StringLit a1 a2 -> A.StringLit a1 a2
        TypedStringLit a1 a2 a3 -> A.TypedStringLit a1 (typeName a2) a3
        WindowFn a1 a2 a3 a4 a5 a6 -> A.WindowFn a1 (scalarExpr a2)
                                        (scalarExprList a3)
                                        (scalarExprList a4)
                                        (direction a5)
                                        (frameClause a6)
        AntiScalarExpr _ -> error "can't convert anti scalarExpr"
 
selectItem :: SelectItem -> A.SelectItem
selectItem x
  = case x of
        SelExp a1 a2 -> A.SelExp a1 (scalarExpr a2)
        SelectItem a1 a2 a3 -> A.SelectItem a1 (scalarExpr a2) a3
 
selectList :: SelectList -> A.SelectList
selectList x
  = case x of
        SelectList a1 a2 -> A.SelectList a1 (selectItemList a2)
 
statement :: Statement -> A.Statement
statement x
  = case x of
        AlterSequence a1 a2 a3 -> A.AlterSequence a1 a2 (sQIdentifier a3)
        AlterTable a1 a2 a3 -> A.AlterTable a1 a2 (alterTableActionList a3)
        Assignment a1 a2 a3 -> A.Assignment a1 (scalarExpr a2)
                                 (scalarExpr a3)
        Block a1 a2 a3 a4 -> A.Block a1 a2 (varDefList a3)
                               (statementList a4)
        CaseStatement a1 a2 a3 -> A.CaseStatement a1
                                    (scalarExprListStatementListPairList a2)
                                    (statementList a3)
        CaseStatementSimple a1 a2 a3 a4 -> A.CaseStatementSimple a1
                                             (scalarExpr a2)
                                             (scalarExprListStatementListPairList a3)
                                             (statementList a4)
        ContinueStatement a1 a2 -> A.ContinueStatement a1 a2
        Copy a1 a2 a3 a4 -> A.Copy a1 a2 a3 (copySource a4)
        CopyData a1 a2 -> A.CopyData a1 a2
        CreateDomain a1 a2 a3 a4 a5 -> A.CreateDomain a1 a2 (typeName a3)
                                         a4
                                         (maybeBoolExpr a5)
        CreateFunction a1 a2 a3 a4 a5 a6 a7 a8 -> A.CreateFunction a1 a2
                                                    (paramDefList a3)
                                                    (typeName a4)
                                                    (replace a5)
                                                    (language a6)
                                                    (fnBody a7)
                                                    (volatility a8)
        CreateLanguage a1 a2 -> A.CreateLanguage a1 a2
        CreateSequence a1 a2 a3 a4 a5 a6 a7 -> A.CreateSequence a1 a2 a3 a4
                                                 a5
                                                 a6
                                                 a7
        CreateTable a1 a2 a3 a4 -> A.CreateTable a1 a2
                                     (attributeDefList a3)
                                     (constraintList a4)
        CreateTableAs a1 a2 a3 -> A.CreateTableAs a1 a2 (queryExpr a3)
        CreateTrigger a1 a2 a3 a4 a5 a6 a7 a8 -> A.CreateTrigger a1 a2
                                                   (triggerWhen a3)
                                                   (fmap triggerEvent a4)
                                                   a5
                                                   (triggerFire a6)
                                                   a7
                                                   (scalarExprList a8)
        CreateType a1 a2 a3 -> A.CreateType a1 a2 (typeAttributeDefList a3)
        CreateView a1 a2 a3 a4 -> A.CreateView a1 a2 a3 (queryExpr a4)
        Delete a1 a2 a3 a4 a5 -> A.Delete a1 (sQIdentifier a2)
                                   (tableRefList a3)
                                   (maybeBoolExpr a4)
                                   (maybeSelectList a5)
        DropFunction a1 a2 a3 a4 -> A.DropFunction a1 (ifExists a2)
                                      (stringTypeNameListPairList a3)
                                      (cascade a4)
        DropSomething a1 a2 a3 a4 a5 -> A.DropSomething a1 (dropType a2)
                                          (ifExists a3)
                                          a4
                                          (cascade a5)
        Execute a1 a2 -> A.Execute a1 (scalarExpr a2)
        ExitStatement a1 a2 -> A.ExitStatement a1 a2
        ForIntegerStatement a1 a2 a3 a4 a5 a6 -> A.ForIntegerStatement a1
                                                   a2
                                                   (scalarExpr a3)
                                                   (scalarExpr a4)
                                                   (scalarExpr a5)
                                                   (statementList a6)
        ForQueryStatement a1 a2 a3 a4 a5 -> A.ForQueryStatement a1 a2
                                              (scalarExpr a3)
                                              (queryExpr a4)
                                              (statementList a5)
        If a1 a2 a3 -> A.If a1 (scalarExprStatementListPairList a2)
                         (statementList a3)
        Insert a1 a2 a3 a4 a5 -> A.Insert a1 (sQIdentifier a2) a3
                                   (queryExpr a4)
                                   (maybeSelectList a5)
        Into a1 a2 a3 a4 -> A.Into a1 a2 (scalarExprList a3) (statement a4)
        LoopStatement a1 a2 a3 -> A.LoopStatement a1 a2 (statementList a3)
        Notify a1 a2 -> A.Notify a1 a2
        NullStatement a1 -> A.NullStatement a1
        Perform a1 a2 -> A.Perform a1 (scalarExpr a2)
        QueryStatement a1 a2 -> A.QueryStatement a1 (queryExpr a2)
        Raise a1 a2 a3 a4 -> A.Raise a1 (raiseType a2) a3
                               (scalarExprList a4)
        Return a1 a2 -> A.Return a1 (maybeScalarExpr a2)
        ReturnNext a1 a2 -> A.ReturnNext a1 (scalarExpr a2)
        ReturnQuery a1 a2 -> A.ReturnQuery a1 (queryExpr a2)
        Set a1 a2 a3 -> A.Set a1 a2 (fmap setValue a3)
        Truncate a1 a2 a3 a4 -> A.Truncate a1 a2 (restartIdentity a3)
                                  (cascade a4)
        Update a1 a2 a3 a4 a5 a6 -> A.Update a1 (sQIdentifier a2)
                                      (scalarExprList a3)
                                      (tableRefList a4)
                                      (maybeBoolExpr a5)
                                      (maybeSelectList a6)
        WhileStatement a1 a2 a3 a4 -> A.WhileStatement a1 a2
                                        (scalarExpr a3)
                                        (statementList a4)
        AntiStatement _ -> error "can't convert anti statement"
 
tableAlias :: TableAlias -> A.TableAlias
tableAlias x
  = case x of
        FullAlias a1 a2 a3 -> A.FullAlias a1 a2 a3
        NoAlias a1 -> A.NoAlias a1
        TableAlias a1 a2 -> A.TableAlias a1 a2
 
tableRef :: TableRef -> A.TableRef
tableRef x
  = case x of
        FunTref a1 a2 a3 -> A.FunTref a1 (scalarExpr a2) (tableAlias a3)
        JoinTref a1 a2 a3 a4 a5 a6 a7 -> A.JoinTref a1 (tableRef a2)
                                           (natural a3)
                                           (joinType a4)
                                           (tableRef a5)
                                           (onExpr a6)
                                           (tableAlias a7)
        SubTref a1 a2 a3 -> A.SubTref a1 (queryExpr a2) (tableAlias a3)
        Tref a1 a2 a3 -> A.Tref a1 (sQIdentifier a2) (tableAlias a3)
 
typeAttributeDef :: TypeAttributeDef -> A.TypeAttributeDef
typeAttributeDef x
  = case x of
        TypeAttDef a1 a2 a3 -> A.TypeAttDef a1 a2 (typeName a3)
 
typeName :: TypeName -> A.TypeName
typeName x
  = case x of
        ArrayTypeName a1 a2 -> A.ArrayTypeName a1 (typeName a2)
        Prec2TypeName a1 a2 a3 a4 -> A.Prec2TypeName a1 a2 a3 a4
        PrecTypeName a1 a2 a3 -> A.PrecTypeName a1 a2 a3
        SetOfTypeName a1 a2 -> A.SetOfTypeName a1 (typeName a2)
        SimpleTypeName a1 a2 -> A.SimpleTypeName a1 a2
 
varDef :: VarDef -> A.VarDef
varDef x
  = case x of
        ParamAlias a1 a2 a3 -> A.ParamAlias a1 a2 a3
        VarAlias a1 a2 a3 -> A.VarAlias a1 a2 a3
        VarDef a1 a2 a3 a4 -> A.VarDef a1 a2 (typeName a3)
                                (maybeScalarExpr a4)
 
withQuery :: WithQuery -> A.WithQuery
withQuery x
  = case x of
        WithQuery a1 a2 a3 a4 -> A.WithQuery a1 a2 a3 (queryExpr a4)
 
alterTableActionList ::
                     AlterTableActionList -> A.AlterTableActionList
alterTableActionList = fmap alterTableAction
 
attributeDefList :: AttributeDefList -> A.AttributeDefList
attributeDefList = fmap attributeDef
 
caseScalarExprListScalarExprPair ::
                                 CaseScalarExprListScalarExprPair ->
                                   A.CaseScalarExprListScalarExprPair
caseScalarExprListScalarExprPair (a, b)
  = (scalarExprList a, scalarExpr b)
 
caseScalarExprListScalarExprPairList ::
                                     CaseScalarExprListScalarExprPairList ->
                                       A.CaseScalarExprListScalarExprPairList
caseScalarExprListScalarExprPairList
  = fmap caseScalarExprListScalarExprPair
 
constraintList :: ConstraintList -> A.ConstraintList
constraintList = fmap constraint
 
maybeBoolExpr :: MaybeBoolExpr -> A.MaybeBoolExpr
maybeBoolExpr = fmap scalarExpr
 
maybeScalarExpr :: MaybeScalarExpr -> A.MaybeScalarExpr
maybeScalarExpr = fmap scalarExpr
 
maybeSelectList :: MaybeSelectList -> A.MaybeSelectList
maybeSelectList = fmap selectList
 
onExpr :: OnExpr -> A.OnExpr
onExpr = fmap joinExpr
 
paramDefList :: ParamDefList -> A.ParamDefList
paramDefList = fmap paramDef
 
rowConstraintList :: RowConstraintList -> A.RowConstraintList
rowConstraintList = fmap rowConstraint
 
scalarExprDirectionPair ::
                        ScalarExprDirectionPair -> A.ScalarExprDirectionPair
scalarExprDirectionPair (a, b) = (scalarExpr a, direction b)
 
scalarExprDirectionPairList ::
                            ScalarExprDirectionPairList -> A.ScalarExprDirectionPairList
scalarExprDirectionPairList = fmap scalarExprDirectionPair
 
scalarExprList :: ScalarExprList -> A.ScalarExprList
scalarExprList = fmap scalarExpr
 
scalarExprListList :: ScalarExprListList -> A.ScalarExprListList
scalarExprListList = fmap scalarExprList
 
scalarExprListStatementListPair ::
                                ScalarExprListStatementListPair ->
                                  A.ScalarExprListStatementListPair
scalarExprListStatementListPair (a, b)
  = (scalarExprList a, statementList b)
 
scalarExprListStatementListPairList ::
                                    ScalarExprListStatementListPairList ->
                                      A.ScalarExprListStatementListPairList
scalarExprListStatementListPairList
  = fmap scalarExprListStatementListPair
 
scalarExprStatementListPair ::
                            ScalarExprStatementListPair -> A.ScalarExprStatementListPair
scalarExprStatementListPair (a, b)
  = (scalarExpr a, statementList b)
 
scalarExprStatementListPairList ::
                                ScalarExprStatementListPairList ->
                                  A.ScalarExprStatementListPairList
scalarExprStatementListPairList = fmap scalarExprStatementListPair
 
selectItemList :: SelectItemList -> A.SelectItemList
selectItemList = fmap selectItem
 
statementList :: StatementList -> A.StatementList
statementList = fmap statement
 
stringTypeNameListPair ::
                       StringTypeNameListPair -> A.StringTypeNameListPair
stringTypeNameListPair (a, b) = (a, typeNameList b)
 
stringTypeNameListPairList ::
                           StringTypeNameListPairList -> A.StringTypeNameListPairList
stringTypeNameListPairList = fmap stringTypeNameListPair
 
tableRefList :: TableRefList -> A.TableRefList
tableRefList = fmap tableRef
 
typeAttributeDefList ::
                     TypeAttributeDefList -> A.TypeAttributeDefList
typeAttributeDefList = fmap typeAttributeDef
 
typeNameList :: TypeNameList -> A.TypeNameList
typeNameList = fmap typeName
 
varDefList :: VarDefList -> A.VarDefList
varDefList = fmap varDef
 
withQueryList :: WithQueryList -> A.WithQueryList
withQueryList = fmap withQuery