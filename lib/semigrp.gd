#############################################################################
##
#W  semigrp.gd                  GAP library                     Thomas Breuer
##
##
#Y  Copyright (C)  1997,  Lehrstuhl D für Mathematik,  RWTH Aachen,  Germany
#Y  (C) 1998 School Math and Comp. Sci., University of St Andrews, Scotland
#Y  Copyright (C) 2002 The GAP Group
##
##  This file contains the declaration of operations for semigroups.
##

#############################################################################
##
#P  IsSemigroup( <D> )
##
##  <#GAPDoc Label="IsSemigroup">
##  <ManSection>
##  <Prop Name="IsSemigroup" Arg='D'/>
##
##  <Description>
##  returns <K>true</K> if the object <A>D</A> is a semigroup.
##  <Index>semigroup</Index>
##  A <E>semigroup</E> is a magma (see&nbsp;<Ref Chap="Magmas"/>) with
##  associative multiplication.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareSynonymAttr( "IsSemigroup", IsMagma and IsAssociative );

DeclareOperation("InversesOfSemigroupElement", 
[IsSemigroup, IsAssociativeElement]);

#############################################################################
##
#F  Semigroup( <gen1>, <gen2> ... ) . . . . semigroup generated by collection
#F  Semigroup( <gens> ) . . . . . . . . . . semigroup generated by collection
##
##  <#GAPDoc Label="Semigroup">
##  <ManSection>
##  <Heading>Semigroup</Heading>
##  <Func Name="Semigroup" Arg='gen1, gen2 ...'
##   Label="for various generators"/>
##  <Func Name="Semigroup" Arg='gens' Label="for a list"/>
##
##  <Description>
##  In the first form, <Ref Func="Semigroup" Label="for various generators"/>
##  returns the semigroup generated by the arguments <A>gen1</A>,
##  <A>gen2</A>, <M>\ldots</M>,
##  that is, the closure of these elements under multiplication.
##  In the second form, <Ref Func="Semigroup" Label="for a list"/> returns
##  the semigroup generated by the elements in the homogeneous list
##  <A>gens</A>;
##  a square matrix as only argument is treated as one generator,
##  not as a list of generators.
##  <P/>
##  It is <E>not</E> checked whether the underlying multiplication is
##  associative, use <Ref Func="Magma"/> and <Ref Func="IsAssociative"/>
##  if you want to check whether a magma is in fact a semigroup.
##  <P/>
##  <Example><![CDATA[
##  gap> a:= Transformation( [ 2, 3, 4, 1 ] );
##  Transformation( [ 2, 3, 4, 1 ] )
##  gap> b:= Transformation( [ 2, 2, 3, 4 ] );
##  Transformation( [ 2, 2 ] )
##  gap> s:= Semigroup(a, b);
##  <transformation semigroup on 4 pts with 2 generators>
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "Semigroup" );


#############################################################################
##
#F  Subsemigroup( <S>, <gens> ) . . .  subsemigroup of <S> generated by <gens>
#F  SubsemigroupNC( <S>, <gens> ) . .  subsemigroup of <S> generated by <gens>
##
##  <#GAPDoc Label="Subsemigroup">
##  <ManSection>
##  <Func Name="Subsemigroup" Arg='S, gens'/>
##  <Func Name="SubsemigroupNC" Arg='S, gens'/>
##
##  <Description>
##  are just synonyms of <Ref Func="Submagma"/> and <Ref Func="SubmagmaNC"/>,
##  respectively.
##  <P/>
##  <Example><![CDATA[
##  gap> a:=GeneratorsOfSemigroup(s)[1];
##  Transformation( [ 2, 3, 4, 1 ] )
##  gap> t:=Subsemigroup(s,[a]);
##  <commutative transformation semigroup on 4 pts with 1 generator>
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareSynonym( "Subsemigroup", Submagma );

DeclareSynonym( "SubsemigroupNC", SubmagmaNC );


#############################################################################
##
#O  SemigroupByGenerators( <gens> ) . . . . . . semigroup generated by <gens>
##
##  <#GAPDoc Label="SemigroupByGenerators">
##  <ManSection>
##  <Oper Name="SemigroupByGenerators" Arg='gens'/>
##
##  <Description>
##  is the underlying operation
##  of&nbsp;<Ref Func="Semigroup" Label="for various generators"/>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "SemigroupByGenerators", [ IsCollection ] );


#############################################################################
##
#A  AsSemigroup( <C> )  . . . . . . . .  collection <C> regarded as semigroup
##
##  <#GAPDoc Label="AsSemigroup">
##  <ManSection>
##  <Attr Name="AsSemigroup" Arg='C'/>
##
##  <Description>
##  If <A>C</A> is a collection whose elements form a semigroup
##  (see&nbsp;<Ref Func="IsSemigroup"/>) then <Ref Func="AsSemigroup"/>
##  returns this semigroup.
##  Otherwise <K>fail</K> is returned.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "AsSemigroup", IsCollection );


#############################################################################
##
#O  AsSubsemigroup( <D>, <C> )
##
##  <#GAPDoc Label="AsSubsemigroup">
##  <ManSection>
##  <Oper Name="AsSubsemigroup" Arg='D, C'/>
##
##  <Description>
##  Let <A>D</A> be a domain and <A>C</A> a collection.
##  If <A>C</A> is a subset of <A>D</A> that forms a semigroup then
##  <Ref Func="AsSubsemigroup"/>
##  returns this semigroup, with parent <A>D</A>.
##  Otherwise <K>fail</K> is returned.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation( "AsSubsemigroup", [ IsDomain, IsCollection ] );


#############################################################################
##
#A  GeneratorsOfSemigroup( <S> ) . . .  semigroup generators of semigroup <S>
##
##  <#GAPDoc Label="GeneratorsOfSemigroup">
##  <ManSection>
##  <Attr Name="GeneratorsOfSemigroup" Arg='S'/>
##
##  <Description>
##  Semigroup generators of a semigroup <A>D</A> are the same as magma
##  generators, see&nbsp;<Ref Func="GeneratorsOfMagma"/>.
##  <Example><![CDATA[
##  gap> GeneratorsOfSemigroup(s);
##  [ Transformation( [ 2, 3, 4, 1 ] ), Transformation( [ 2, 2 ] ) ]
##  gap> GeneratorsOfSemigroup(t);
##  [ Transformation( [ 2, 3, 4, 1 ] ) ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareSynonymAttr( "GeneratorsOfSemigroup", GeneratorsOfMagma );

#############################################################################
##
#A  CayleyGraphSemigroup( <S> ) 
#A  CayleyGraphDualSemigroup( <S> )
##
##  <ManSection>
##  <Attr Name="CayleyGraphSemigroup" Arg='S'/>
##  <Attr Name="CayleyGraphDualSemigroup" Arg='S'/>
##
##  <Description>
##  </Description>
##  </ManSection>
##
DeclareAttribute("CayleyGraphSemigroup",IsSemigroup);
DeclareAttribute("CayleyGraphDualSemigroup",IsSemigroup);

#############################################################################
##
#F  FreeSemigroup( [<wfilt>,]<rank> )
#F  FreeSemigroup( [<wfilt>,]<rank>, <name> )
#F  FreeSemigroup( [<wfilt>,]<name1>, <name2>, ... )
#F  FreeSemigroup( [<wfilt>,]<names> )
#F  FreeSemigroup( [<wfilt>,]infinity, <name>, <init> )
##
##  <#GAPDoc Label="FreeSemigroup">
##  <ManSection>
##  <Heading>FreeSemigroup</Heading>
##  <Func Name="FreeSemigroup" Arg='[wfilt, ]rank[, name]'
##   Label="for given rank"/>
##  <Func Name="FreeSemigroup" Arg='[wfilt, ]name1, name2, ...'
##   Label="for various names"/>
##  <Func Name="FreeSemigroup" Arg='[wfilt, ]names'
##   Label="for a list of names"/>
##  <Func Name="FreeSemigroup" Arg='[wfilt, ]infinity, name, init'
##   Label="for infinitely many generators"/>
##
##  <Description>
##  Called with a positive integer <A>rank</A>,
##  <Ref Func="FreeSemigroup" Label="for given rank"/> returns
##  a free semigroup on <A>rank</A> generators.
##  If the optional argument <A>name</A> is given then the generators are
##  printed as <A>name</A><C>1</C>, <A>name</A><C>2</C> etc.,
##  that is, each name is the concatenation of the string <A>name</A> and an
##  integer from <C>1</C> to <A>range</A>.
##  The default for <A>name</A> is the string <C>"s"</C>.
##  <P/>
##  Called in the second form,
##  <Ref Func="FreeSemigroup" Label="for various names"/> returns
##  a free semigroup on as many generators as arguments, printed as
##  <A>name1</A>, <A>name2</A> etc.
##  <P/>
##  Called in the third form,
##  <Ref Func="FreeSemigroup" Label="for a list of names"/> returns
##  a free semigroup on as many generators as the length of the list
##  <A>names</A>, the <M>i</M>-th generator being printed as
##  <A>names</A><M>[i]</M>.
##  <P/>
##  Called in the fourth form,
##  <Ref Func="FreeSemigroup" Label="for infinitely many generators"/>
##  returns a free semigroup on infinitely many generators, where the first
##  generators are printed by the names in the list <A>init</A>,
##  and the other generators by <A>name</A> and an appended number.
##  <P/>
##  If the extra argument <A>wfilt</A> is given, it must be either
##  <Ref Func="IsSyllableWordsFamily"/> or <Ref Func="IsLetterWordsFamily"/>
##  or <Ref Func="IsWLetterWordsFamily"/> or
##  <Ref Func="IsBLetterWordsFamily"/>.
##  This filter then specifies the representation used for the elements of
##  the free semigroup
##  (see&nbsp;<Ref Sect="Representations for Associative Words"/>).
##  If no such filter is given, a letter representation is used.
##  <P/>
##  <Example><![CDATA[
##  gap> f1 := FreeSemigroup( 3 );
##  <free semigroup on the generators [ s1, s2, s3 ]>
##  gap> f2 := FreeSemigroup( 3 , "generator" );
##  <free semigroup on the generators 
##  [ generator1, generator2, generator3 ]>
##  gap> f3 := FreeSemigroup( "gen1" , "gen2" );
##  <free semigroup on the generators [ gen1, gen2 ]>
##  gap> f4 := FreeSemigroup( ["gen1" , "gen2"] );
##  <free semigroup on the generators [ gen1, gen2 ]>
##  ]]></Example>
##  <P/>
##  Also see Chapter&nbsp;<Ref Chap="Semigroups"/>.
##  <P/>
##  Each free object defines a unique alphabet (and a unique family of words).
##  Its generators are the letters of this alphabet,
##  thus words of length one.
##  <P/>
##  <Example><![CDATA[
##  gap> FreeGroup( 5 );
##  <free group on the generators [ f1, f2, f3, f4, f5 ]>
##  gap> FreeGroup( "a", "b" );
##  <free group on the generators [ a, b ]>
##  gap> FreeGroup( infinity );
##  <free group with infinity generators>
##  gap> FreeSemigroup( "x", "y" );
##  <free semigroup on the generators [ x, y ]>
##  gap> FreeMonoid( 7 );
##  <free monoid on the generators [ m1, m2, m3, m4, m5, m6, m7 ]>
##  ]]></Example>
##  <P/>
##  Remember that names are just a help for printing and do not necessarily
##  distinguish letters.
##  It is possible to create arbitrarily weird situations by choosing strange
##  names for the letters.
##  <P/>
##  <Example><![CDATA[
##  gap> f:= FreeGroup( "x", "x" );  gens:= GeneratorsOfGroup( f );;
##  <free group on the generators [ x, x ]>
##  gap> gens[1] = gens[2];
##  false
##  gap> f:= FreeGroup( "f1*f2", "f2^-1", "Group( [ f1, f2 ] )" );
##  <free group on the generators [ f1*f2, f2^-1, Group( [ f1, f2 ] ) ]>
##  gap> gens:= GeneratorsOfGroup( f );;
##  gap> gens[1]*gens[2];
##  f1*f2*f2^-1
##  gap> gens[1]/gens[3];
##  f1*f2*Group( [ f1, f2 ] )^-1
##  gap> gens[3]/gens[1]/gens[2];
##  Group( [ f1, f2 ] )*f1*f2^-1*f2^-1^-1
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "FreeSemigroup" );


#############################################################################
##
#P  IsZeroGroup( <S> )  
##
##  <#GAPDoc Label="IsZeroGroup">
##  <ManSection>
##  <Prop Name="IsZeroGroup" Arg='S'/>
##
##  <Description>
##  is <K>true</K> if and only if the semigroup <A>S</A> is a group with zero
##  adjoined.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsZeroGroup", IsSemigroup );

#############################################################################
##
#P  IsSimpleSemigroup( <S> )  
##
##  <#GAPDoc Label="IsSimpleSemigroup">
##  <ManSection>
##  <Prop Name="IsSimpleSemigroup" Arg='S'/>
##
##  <Description>
##  is <K>true</K> if and only if the semigroup <A>S</A> has no proper
##  ideals.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsSimpleSemigroup", IsSemigroup );


#############################################################################
##
#P  IsZeroSimpleSemigroup( <S> )  
##
##  <#GAPDoc Label="IsZeroSimpleSemigroup">
##  <ManSection>
##  <Prop Name="IsZeroSimpleSemigroup" Arg='S'/>
##
##  <Description>
##  is <K>true</K> if and only if the semigroup has no proper ideals except
##  for 0, where <A>S</A> is a semigroup with zero. 
##  If the semigroup does not find its zero, then a break-loop is entered.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsZeroSimpleSemigroup", IsSemigroup );


############################################################################
##
#A  ANonReesCongruenceOfSemigroup( <S> )
##
##  <ManSection>
##  <Attr Name="ANonReesCongruenceOfSemigroup" Arg='S'/>
##
##  <Description>
##  for a semigroup <A>S</A>, returns a non-Rees congruence if one exists
##  or otherwise returns <K>fail</K>.
##  </Description>
##  </ManSection>
##
DeclareAttribute("ANonReesCongruenceOfSemigroup",IsSemigroup);


############################################################################
##
#P  IsReesCongruenceSemigroup( <S> )
##
##  <#GAPDoc Label="IsReesCongruenceSemigroup">
##  <ManSection>
##  <Prop Name="IsReesCongruenceSemigroup" Arg='S'/>
##
##  <Description>
##  returns <K>true</K> if <A>S</A> is a Rees Congruence semigroup, that is,
##  if all congruences of <A>S</A> are Rees Congruences.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty( "IsReesCongruenceSemigroup", IsSemigroup );


#############################################################################
##
#O  HomomorphismFactorSemigroup( <S>, <C> )
#O  HomomorphismFactorSemigroupByClosure( <S>, <L> )
#O  FactorSemigroup( <S>, <C> )
#O  FactorSemigroupByClosure( <S>, <L> )
##
##  <ManSection>
##  <Oper Name="HomomorphismFactorSemigroup" Arg='S, C'/>
##  <Oper Name="HomomorphismFactorSemigroupByClosure" Arg='S, L'/>
##  <Oper Name="FactorSemigroup" Arg='S, C'/>
##  <Oper Name="FactorSemigroupByClosure" Arg='S, L'/>
##
##  <Description>
##  each find the quotient of <A>S</A> by a congruence.
##  <P/>
##  In the first form <A>C</A> is a congruence and
##  <Ref Func="HomomorphismFactorSemigroup"/>
##  returns a homomorphism <M><A>S</A> \rightarrow <A>S</A>/<A>C</A></M>.
##  <P/>
##  In the second form, <A>L</A> is a list of pairs of elements of <A>S</A>.
##  Returns a homomorphism <M><A>S</A> \rightarrow <A>S</A>/<A>C</A></M>,
##  where <A>C</A> is the congruence generated by <A>L</A>.
##  <P/>
##  <C>FactorSemigroup(<A>S</A>, <A>C</A>)</C> returns 
##    <C>Range( HomomorphismFactorSemigroup(<A>S</A>, <A>C</A>) )</C>.
##  <P/>
##  <C>FactorSemigroupByClosure(<A>S</A>, <A>L</A>)</C> returns 
##    <C>Range( HomomorphismFactorSemigroupByClosure(<A>S</A>, <A>L</A>) )</C>.
##  </Description>
##  </ManSection>
##
DeclareOperation( "HomomorphismFactorSemigroup",  
	[ IsSemigroup, IsSemigroupCongruence ] );

DeclareOperation( "HomomorphismFactorSemigroupByClosure",  
	[ IsSemigroup, IsList ] );

DeclareOperation( "FactorSemigroup",  
	[ IsSemigroup, IsSemigroupCongruence ] );

DeclareOperation( "FactorSemigroupByClosure",  
	[ IsSemigroup, IsList ] );


#############################################################################
##
#O  IsRegularSemigroupElement( <S>, <x> )
##
##  <#GAPDoc Label="IsRegularSemigroupElement">
##  <ManSection>
##  <Oper Name="IsRegularSemigroupElement" Arg='S, x'/>
##
##  <Description>
##  returns <K>true</K> if <A>x</A> has a general inverse in <A>S</A>, i.e.,
##  there is an element <M>y \in <A>S</A></M>
##  such that <M><A>x</A> y <A>x</A> = <A>x</A></M> and
##  <M>y <A>x</A> y = y</M>.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareOperation("IsRegularSemigroupElement", [IsSemigroup, 
    IsAssociativeElement]);

#############################################################################
##
#P  IsRegularSemigroup( <S> )
##
##  <#GAPDoc Label="IsRegularSemigroup">
##  <ManSection>
##  <Prop Name="IsRegularSemigroup" Arg='S'/>
##
##  <Description>
##  returns <K>true</K> if <A>S</A> is regular, i.e.,
##  if every &D;-class of <A>S</A> is regular.
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareProperty("IsRegularSemigroup", IsSemigroup);


#############################################################################
##
#P  IsInverseSemigroup( <S> )
##
##  <ManSection>
##  <Prop Name="IsInverseSemigroup" Arg='S'/>
##
##  <Description>
##  returns <K>true</K> if <A>S</A> is an inverse semigroup, i.e.,
##  if every element of <A>S</A> has a unique (semigroup) inverse.
##  </Description>
##  </ManSection>
##
DeclareProperty("IsInverseSemigroup", IsSemigroup);


#############################################################################
##
#O  DisplaySemigroup( <S> )
##
##  <ManSection>
##  <Oper Name="DisplaySemigroup" Arg='S'/>
##
##  <Description>
##  Produces a convenient display of a semigroup's DClass
##  structure.   Let <A>S</A> have degree <M>n</M>.   Then for each <M>r\leq n</M>, we
##  show all D classes of rank <M>n</M>.   
##  <P/>
##  A regular D class with a single H class of size 120 appears as
##  <Example><![CDATA[
##  *[H size = 120, 1 L classes, 1 R classes] 
##  ]]></Example>
##  (the <C>*</C> denoting regularity).
##  </Description>
##  </ManSection>
##
DeclareOperation("DisplaySemigroup", 
    [IsSemigroup]);

# Everything from here...

DeclareOperation("IsSubsemigroup", [IsSemigroup, IsSemigroup]);

DeclareProperty("IsBand", IsSemigroup);
DeclareProperty("IsBrandtSemigroup", IsSemigroup);
DeclareProperty("IsCliffordSemigroup", IsSemigroup);
DeclareProperty("IsCommutativeSemigroup", IsSemigroup);
DeclareProperty("IsCompletelyRegularSemigroup", IsSemigroup);
DeclareProperty("IsCompletelySimpleSemigroup", IsSemigroup);
DeclareProperty("IsGroupAsSemigroup", IsSemigroup);
DeclareProperty("IsIdempotentGenerated", IsSemigroup);
DeclareProperty("IsLeftZeroSemigroup", IsSemigroup);
DeclareProperty("IsMonogenicSemigroup", IsSemigroup);
DeclareProperty("IsMonoidAsSemigroup", IsSemigroup);
DeclareProperty("IsOrthodoxSemigroup", IsSemigroup);
DeclareProperty("IsRectangularBand", IsSemigroup);
DeclareProperty("IsRightZeroSemigroup", IsSemigroup);
DeclareProperty("IsSemiband", IsSemigroup);
DeclareProperty("IsSemilatticeAsSemigroup", IsSemigroup);
DeclareProperty("IsZeroSemigroup", IsSemigroup);

InstallTrueMethod(IsBand, IsSemilatticeAsSemigroup);
InstallTrueMethod(IsBrandtSemigroup, IsInverseSemigroup and                     IsZeroSimpleSemigroup);
InstallTrueMethod(IsCliffordSemigroup, IsSemilatticeAsSemigroup);
InstallTrueMethod(IsCompletelyRegularSemigroup, IsCliffordSemigroup);
InstallTrueMethod(IsCompletelyRegularSemigroup, IsSimpleSemigroup);
InstallTrueMethod(IsCompletelySimpleSemigroup, IsSimpleSemigroup and IsFinite);
InstallTrueMethod(IsGroupAsSemigroup, IsInverseSemigroup and IsSimpleSemigroup);
InstallTrueMethod(IsIdempotentGenerated, IsSemilatticeAsSemigroup);
InstallTrueMethod(IsInverseSemigroup, IsSemilatticeAsSemigroup);
InstallTrueMethod(IsInverseSemigroup, IsCliffordSemigroup);
InstallTrueMethod(IsLeftZeroSemigroup, IsInverseSemigroup and IsTrivial);
InstallTrueMethod(IsRegularSemigroup, IsInverseSemigroup);
InstallTrueMethod(IsRegularSemigroup, IsSimpleSemigroup);
InstallTrueMethod(IsMonoidAsSemigroup, IsGroupAsSemigroup);
InstallTrueMethod(IsOrthodoxSemigroup, IsInverseSemigroup);
InstallTrueMethod(IsRightZeroSemigroup, IsInverseSemigroup and IsTrivial);
InstallTrueMethod(IsSemiband, IsIdempotentGenerated);
InstallTrueMethod(IsSemilatticeAsSemigroup, IsCommutative and IsBand);
InstallTrueMethod(IsSimpleSemigroup, IsGroupAsSemigroup);
InstallTrueMethod(IsZeroSemigroup, IsInverseSemigroup and IsTrivial);
InstallTrueMethod(IsGroupAsSemigroup, IsCommutative and IsSimpleSemigroup);

# to here was added by JDM.


#############################################################################
##
#E

