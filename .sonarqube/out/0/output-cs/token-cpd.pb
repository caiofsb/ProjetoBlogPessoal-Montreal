∞@
@C:\Dev\BlogPessoalBackend\BlogPessoal\Services\UsuarioService.cs
	namespace 	
BlogPessoal
 
. 
Services 
; 
public 
class 
UsuarioService 
( 
IUsuarioRepository		 

repository		 !
,		! "
IPasswordHasher

 
<

 
Usuario

 
>

 
passwordHasher

 +
)

+ ,
{ 
public 

async 
Task 
< 
List 
< 
UsuarioResponseDto -
>- .
>. /
ListarAsync0 ;
(; <
)< =
{ 
var 
usuarios 
= 
await 

repository '
.' (
ListarAsync( 3
(3 4
)4 5
;5 6
return 
usuarios 
. 
Select 
( 
MapearParaResponse &
)& '
. 
ToList 
( 
) 
; 
} 
public 

async 
Task 
< 
UsuarioResponseDto (
?( )
>) *
BuscarPorIdAsync+ ;
(; <
long< @
idA C
)C D
{ 
if 

( 
id 
<= 
$num 
) 
{ 	
return 
null 
; 
} 	
var 
usuario 
= 
await 

repository &
.& '
BuscarPorIdAsync' 7
(7 8
id8 :
): ;
;; <
return 
usuario 
is 
null 
?  
null! %
:& '
MapearParaResponse( :
(: ;
usuario; B
)B C
;C D
} 
public!! 

async!! 
Task!! 
<!! 
UsuarioResponseDto!! (
?!!( )
>!!) *

CriarAsync!!+ 5
(!!5 6
UsuarioCreateDto!!6 F
dto!!G J
)!!J K
{"" 
var## 
emailNormalizado## 
=## 
dto## "
.##" #
Email### (
.##( )
Trim##) -
(##- .
)##. /
.##/ 0
ToLowerInvariant##0 @
(##@ A
)##A B
;##B C
var%% 
usuarioExistente%% 
=%% 
await%% $

repository%%% /
.%%/ 0
BuscarPorEmailAsync%%0 C
(%%C D
emailNormalizado%%D T
)%%T U
;%%U V
if'' 

('' 
usuarioExistente'' 
is'' 
not''  #
null''$ (
)''( )
{(( 	
return)) 
null)) 
;)) 
}** 	
var,, 
usuario,, 
=,, 
new,, 
Usuario,, !
{-- 	
Nome.. 
=.. 
dto.. 
... 
Nome.. 
... 
Trim..  
(..  !
)..! "
,.." #
UsuarioNome// 
=// 
dto// 
.// 
UsuarioNome// )
.//) *
Trim//* .
(//. /
)/// 0
,//0 1
Email00 
=00 
emailNormalizado00 $
,00$ %
Foto11 
=11 
dto11 
.11 
Foto11 
.11 
Trim11  
(11  !
)11! "
,11" #
Tipo22 
=22 
string22 
.22 
IsNullOrWhiteSpace22 ,
(22, -
dto22- 0
.220 1
Tipo221 5
)225 6
?227 8
$str229 A
:22B C
dto22D G
.22G H
Tipo22H L
.22L M
Trim22M Q
(22Q R
)22R S
.22S T
ToUpperInvariant22T d
(22d e
)22e f
}33 	
;33	 

usuario55 
.55 
Senha55 
=55 
passwordHasher55 &
.55& '
HashPassword55' 3
(553 4
usuario554 ;
,55; <
dto55= @
.55@ A
Senha55A F
)55F G
;55G H
var77 
usuarioCriado77 
=77 
await77 !

repository77" ,
.77, -

CriarAsync77- 7
(777 8
usuario778 ?
)77? @
;77@ A
return99 
MapearParaResponse99 !
(99! "
usuarioCriado99" /
)99/ 0
;990 1
}:: 
public<< 

async<< 
Task<< 
<<< 
UsuarioResponseDto<< (
?<<( )
><<) *
AtualizarAsync<<+ 9
(<<9 :
long<<: >
id<<? A
,<<A B
UsuarioUpdateDto<<C S
dto<<T W
)<<W X
{== 
if>> 

(>> 
id>> 
<=>> 
$num>> 
)>> 
{?? 	
return@@ 
null@@ 
;@@ 
}AA 	
varCC 
usuarioCC 
=CC 
newCC 
UsuarioCC !
{DD 	
IdEE 
=EE 
idEE 
,EE 
NomeFF 
=FF 
dtoFF 
.FF 
NomeFF 
.FF 
TrimFF  
(FF  !
)FF! "
,FF" #
UsuarioNomeGG 
=GG 
dtoGG 
.GG 
UsuarioNomeGG )
.GG) *
TrimGG* .
(GG. /
)GG/ 0
,GG0 1
FotoHH 
=HH 
dtoHH 
.HH 
FotoHH 
.HH 
TrimHH  
(HH  !
)HH! "
,HH" #
TipoII 
=II 
stringII 
.II 
IsNullOrWhiteSpaceII ,
(II, -
dtoII- 0
.II0 1
TipoII1 5
)II5 6
?II7 8
$strII9 A
:IIB C
dtoIID G
.IIG H
TipoIIH L
.IIL M
TrimIIM Q
(IIQ R
)IIR S
.IIS T
ToUpperInvariantIIT d
(IId e
)IIe f
}JJ 	
;JJ	 

varLL 
usuarioAtualizadoLL 
=LL 
awaitLL  %

repositoryLL& 0
.LL0 1
AtualizarAsyncLL1 ?
(LL? @
usuarioLL@ G
)LLG H
;LLH I
returnNN 
usuarioAtualizadoNN  
isNN! #
nullNN$ (
?NN) *
nullNN+ /
:NN0 1
MapearParaResponseNN2 D
(NND E
usuarioAtualizadoNNE V
)NNV W
;NNW X
}OO 
publicQQ 

asyncQQ 
TaskQQ 
<QQ 
boolQQ 
>QQ 
DeletarAsyncQQ (
(QQ( )
longQQ) -
idQQ. 0
)QQ0 1
{RR 
ifSS 

(SS 
idSS 
<=SS 
$numSS 
)SS 
{TT 	
returnUU 
falseUU 
;UU 
}VV 	
returnXX 
awaitXX 

repositoryXX 
.XX  
DeletarAsyncXX  ,
(XX, -
idXX- /
)XX/ 0
;XX0 1
}YY 
private[[ 
static[[ 
UsuarioResponseDto[[ %
MapearParaResponse[[& 8
([[8 9
Usuario[[9 @
usuario[[A H
)[[H I
{\\ 
return]] 
new]] 
UsuarioResponseDto]] %
{^^ 	
Id__ 
=__ 
usuario__ 
.__ 
Id__ 
,__ 
Nome`` 
=`` 
usuario`` 
.`` 
Nome`` 
,``  
UsuarioNomeaa 
=aa 
usuarioaa !
.aa! "
UsuarioNomeaa" -
,aa- .
Emailbb 
=bb 
usuariobb 
.bb 
Emailbb !
,bb! "
Fotocc 
=cc 
usuariocc 
.cc 
Fotocc 
,cc  
Tipodd 
=dd 
usuariodd 
.dd 
Tipodd 
}ee 	
;ee	 

}ff 
}gg ›
=C:\Dev\BlogPessoalBackend\BlogPessoal\Services\TemaService.cs
	namespace 	
BlogPessoal
 
. 
Services 
; 
public 
class 
TemaService 
( 
ITemaRepository (

repository) 3
)3 4
{ 
public		 

async		 
Task		 
<		 
List		 
<		 
Tema		 
>		  
>		  !
ListarAsync		" -
(		- .
)		. /
{

 
return 
await 

repository 
.  
ListarAsync  +
(+ ,
), -
;- .
} 
public 

async 
Task 
< 
Tema 
? 
> 
BuscarPorIdAsync -
(- .
long. 2
id3 5
)5 6
{ 
if 

( 
id 
<= 
$num 
) 
{ 	
return 
null 
; 
} 	
return 
await 

repository 
.  
BuscarPorIdAsync  0
(0 1
id1 3
)3 4
;4 5
} 
public 

async 
Task 
< 
Tema 
> 

CriarAsync &
(& '
TemaDto' .
dto/ 2
)2 3
{ 
var 
tema 
= 
new 
Tema 
{ 	
	Descricao 
= 
dto 
. 
	Descricao %
.% &
Trim& *
(* +
)+ ,
} 	
;	 

return 
await 

repository 
.  

CriarAsync  *
(* +
tema+ /
)/ 0
;0 1
}   
public"" 

async"" 
Task"" 
<"" 
Tema"" 
?"" 
>"" 
AtualizarAsync"" +
(""+ ,
long"", 0
id""1 3
,""3 4
TemaDto""5 <
dto""= @
)""@ A
{## 
if$$ 

($$ 
id$$ 
<=$$ 
$num$$ 
)$$ 
{%% 	
return&& 
null&& 
;&& 
}'' 	
var)) 
tema)) 
=)) 
new)) 
Tema)) 
{** 	
Id++ 
=++ 
id++ 
,++ 
	Descricao,, 
=,, 
dto,, 
.,, 
	Descricao,, %
.,,% &
Trim,,& *
(,,* +
),,+ ,
}-- 	
;--	 

return// 
await// 

repository// 
.//  
AtualizarAsync//  .
(//. /
tema/// 3
)//3 4
;//4 5
}00 
public22 

async22 
Task22 
<22 
bool22 
>22 
DeletarAsync22 (
(22( )
long22) -
id22. 0
)220 1
{33 
if44 

(44 
id44 
<=44 
$num44 
)44 
{55 	
return66 
false66 
;66 
}77 	
return99 
await99 

repository99 
.99  
DeletarAsync99  ,
(99, -
id99- /
)99/ 0
;990 1
}:: 
};; …P
AC:\Dev\BlogPessoalBackend\BlogPessoal\Services\PostagemService.cs
	namespace 	
BlogPessoal
 
. 
Services 
; 
public 
class 
PostagemService 
( 
IPostagemRepository		 

repository		 "
,		" #
IGeminiService

 
geminiService

  
)

  !
{ 
public 

async 
Task 
< 
List 
< 
PostagemResponseDto .
>. /
>/ 0
ListarAsync1 <
(< =
)= >
{ 
var 
	postagens 
= 
await 

repository (
.( )
ListarAsync) 4
(4 5
)5 6
;6 7
return 
	postagens 
. 
Select 
( 
MapearParaResponse &
)& '
. 
ToList 
( 
) 
; 
} 
public 

async 
Task 
< 
PostagemResponseDto )
?) *
>* +
BuscarPorIdAsync, <
(< =
long= A
idB D
)D E
{ 
if 

( 
id 
<= 
$num 
) 
{ 	
return 
null 
; 
} 	
var 
postagem 
= 
await 

repository '
.' (
BuscarPorIdAsync( 8
(8 9
id9 ;
); <
;< =
return 
postagem 
is 
null 
?  !
null" &
:' (
MapearParaResponse) ;
(; <
postagem< D
)D E
;E F
} 
public!! 

async!! 
Task!! 
<!! 
List!! 
<!! 
PostagemResponseDto!! .
>!!. /
>!!/ 0!
BuscarPorUsuarioAsync!!1 F
(!!F G
long!!G K
	usuarioId!!L U
)!!U V
{"" 
if## 

(## 
	usuarioId## 
<=## 
$num## 
)## 
{$$ 	
return%% 
[%% 
]%% 
;%% 
}&& 	
var(( 
	postagens(( 
=(( 
await(( 

repository(( (
.((( )!
BuscarPorUsuarioAsync(() >
(((> ?
	usuarioId((? H
)((H I
;((I J
return** 
	postagens** 
.++ 
Select++ 
(++ 
MapearParaResponse++ &
)++& '
.,, 
ToList,, 
(,, 
),, 
;,, 
}-- 
public// 

async// 
Task// 
<// 
List// 
<// 
PostagemResponseDto// .
>//. /
>/// 0
BuscarPorTemaAsync//1 C
(//C D
long//D H
temaId//I O
)//O P
{00 
if11 

(11 
temaId11 
<=11 
$num11 
)11 
{22 	
return33 
[33 
]33 
;33 
}44 	
var66 
	postagens66 
=66 
await66 

repository66 (
.66( )
BuscarPorTemaAsync66) ;
(66; <
temaId66< B
)66B C
;66C D
return88 
	postagens88 
.99 
Select99 
(99 
MapearParaResponse99 &
)99& '
.:: 
ToList:: 
(:: 
):: 
;:: 
};; 
public== 

async== 
Task== 
<== 
PostagemResponseDto== )
>==) *

CriarAsync==+ 5
(==5 6
PostagemCreateDto==6 G
dto==H K
,==K L
long==M Q
	usuarioId==R [
)==[ \
{>> 
var?? 
resultadoIA?? 
=?? 
await?? 
geminiService??  -
.??- .
GerarResumoAsync??. >
(??> ?
dto??? B
.??B C
Texto??C H
)??H I
;??I J
varAA 
postagemAA 
=AA 
newAA 
PostagemAA #
{BB 	
TituloCC 
=CC 
dtoCC 
.CC 
TituloCC 
.CC  
TrimCC  $
(CC$ %
)CC% &
,CC& '
TextoDD 
=DD 
dtoDD 
.DD 
TextoDD 
.DD 
TrimDD "
(DD" #
)DD# $
,DD$ %
	UsuarioIdEE 
=EE 
	usuarioIdEE !
,EE! "
TemaIdFF 
=FF 
dtoFF 
.FF 
TemaIdFF 
,FF  
DataGG 
=GG 
DateTimeGG 
.GG 
UtcNowGG "
,GG" #
ResumoIAHH 
=HH 
resultadoIAHH "
.HH" #
ResumoHH# )
,HH) *
TagsIAII 
=II 
resultadoIAII  
.II  !
TagsII! %
,II% &
CategoriaIAJJ 
=JJ 
resultadoIAJJ %
.JJ% &
	CategoriaJJ& /
}KK 	
;KK	 

varMM 
postagemCriadaMM 
=MM 
awaitMM "

repositoryMM# -
.MM- .

CriarAsyncMM. 8
(MM8 9
postagemMM9 A
)MMA B
;MMB C
returnOO 
MapearParaResponseOO !
(OO! "
postagemCriadaOO" 0
)OO0 1
;OO1 2
}PP 
publicRR 

asyncRR 
TaskRR 
<RR 
PostagemResponseDtoRR )
?RR) *
>RR* +
AtualizarAsyncRR, :
(RR: ;
longRR; ?
idRR@ B
,RRB C
PostagemUpdateDtoRRD U
dtoRRV Y
)RRY Z
{SS 
ifTT 

(TT 
idTT 
<=TT 
$numTT 
)TT 
{UU 	
returnVV 
nullVV 
;VV 
}WW 	
varYY 
resultadoIAYY 
=YY 
awaitYY 
geminiServiceYY  -
.YY- .
GerarResumoAsyncYY. >
(YY> ?
dtoYY? B
.YYB C
TextoYYC H
)YYH I
;YYI J
var[[ 
postagem[[ 
=[[ 
new[[ 
Postagem[[ #
{\\ 	
Id]] 
=]] 
id]] 
,]] 
Titulo^^ 
=^^ 
dto^^ 
.^^ 
Titulo^^ 
.^^  
Trim^^  $
(^^$ %
)^^% &
,^^& '
Texto__ 
=__ 
dto__ 
.__ 
Texto__ 
.__ 
Trim__ "
(__" #
)__# $
,__$ %
TemaId`` 
=`` 
dto`` 
.`` 
TemaId`` 
,``  
ResumoIAaa 
=aa 
resultadoIAaa "
.aa" #
Resumoaa# )
,aa) *
TagsIAbb 
=bb 
resultadoIAbb  
.bb  !
Tagsbb! %
,bb% &
CategoriaIAcc 
=cc 
resultadoIAcc %
.cc% &
	Categoriacc& /
}dd 	
;dd	 

varff 
postagemAtualizadaff 
=ff  
awaitff! &

repositoryff' 1
.ff1 2
AtualizarAsyncff2 @
(ff@ A
postagemffA I
)ffI J
;ffJ K
returnhh 
postagemAtualizadahh !
ishh" $
nullhh% )
?hh* +
nullhh, 0
:hh1 2
MapearParaResponsehh3 E
(hhE F
postagemAtualizadahhF X
)hhX Y
;hhY Z
}ii 
publickk 

asynckk 
Taskkk 
<kk 
boolkk 
>kk 
DeletarAsynckk (
(kk( )
longkk) -
idkk. 0
)kk0 1
{ll 
ifmm 

(mm 
idmm 
<=mm 
$nummm 
)mm 
{nn 	
returnoo 
falseoo 
;oo 
}pp 	
returnrr 
awaitrr 

repositoryrr 
.rr  
DeletarAsyncrr  ,
(rr, -
idrr- /
)rr/ 0
;rr0 1
}ss 
privateuu 
staticuu 
PostagemResponseDtouu &
MapearParaResponseuu' 9
(uu9 :
Postagemuu: B
postagemuuC K
)uuK L
{vv 
returnww 
newww 
PostagemResponseDtoww &
{xx 	
Idyy 
=yy 
postagemyy 
.yy 
Idyy 
,yy 
Titulozz 
=zz 
postagemzz 
.zz 
Titulozz $
,zz$ %
Texto{{ 
={{ 
postagem{{ 
.{{ 
Texto{{ "
,{{" #
Data|| 
=|| 
postagem|| 
.|| 
Data||  
,||  !
ResumoIA}} 
=}} 
postagem}} 
.}}  
ResumoIA}}  (
,}}( )
TagsIA~~ 
=~~ 
postagem~~ 
.~~ 
TagsIA~~ $
,~~$ %
CategoriaIA 
= 
postagem "
." #
CategoriaIA# .
,. /
	UsuarioId
ÄÄ 
=
ÄÄ 
postagem
ÄÄ  
.
ÄÄ  !
	UsuarioId
ÄÄ! *
,
ÄÄ* +
UsuarioNome
ÅÅ 
=
ÅÅ 
postagem
ÅÅ "
.
ÅÅ" #
Usuario
ÅÅ# *
?
ÅÅ* +
.
ÅÅ+ ,
UsuarioNome
ÅÅ, 7
??
ÅÅ8 :
string
ÅÅ; A
.
ÅÅA B
Empty
ÅÅB G
,
ÅÅG H
TemaId
ÇÇ 
=
ÇÇ 
postagem
ÇÇ 
.
ÇÇ 
TemaId
ÇÇ $
,
ÇÇ$ %
TemaDescricao
ÉÉ 
=
ÉÉ 
postagem
ÉÉ $
.
ÉÉ$ %
Tema
ÉÉ% )
?
ÉÉ) *
.
ÉÉ* +
	Descricao
ÉÉ+ 4
??
ÉÉ5 7
string
ÉÉ8 >
.
ÉÉ> ?
Empty
ÉÉ? D
}
ÑÑ 	
;
ÑÑ	 

}
ÖÖ 
}ÜÜ ä
BC:\Dev\BlogPessoalBackend\BlogPessoal\Services\IA\PromptBuilder.cs
	namespace 	
BlogPessoal
 
. 
Services 
. 
IA !
;! "
public 
static 
class 
PromptBuilder !
{ 
public 

static 
string %
CriarPromptResumoPostagem 2
(2 3
string3 9
texto: ?
)? @
{ 
return 
$"""

$str 
{ 	
texto	 
} 

        """ 
; 
} 
} ‡
CC:\Dev\BlogPessoalBackend\BlogPessoal\Services\IA\IGeminiService.cs
	namespace 	
BlogPessoal
 
. 
Services 
. 
IA !
;! "
public 
	interface 
IGeminiService 
{ 
Task 
< 	
ResultadoIA	 
> 
GerarResumoAsync &
(& '
string' -
texto. 3
)3 4
;4 5
} çL
BC:\Dev\BlogPessoalBackend\BlogPessoal\Services\IA\GeminiService.cs
	namespace 	
BlogPessoal
 
. 
Services 
. 
IA !
;! "
public		 
class		 
GeminiService		 
(		 

HttpClient

 

httpClient

 
,

 
IOptions 
< 
GeminiOptions 
> 
options #
)# $
:% &
IGeminiService' 5
{ 
private 
readonly 
GeminiOptions "
_options# +
=, -
options. 5
.5 6
Value6 ;
;; <
public 

async 
Task 
< 
ResultadoIA !
>! "
GerarResumoAsync# 3
(3 4
string4 :
texto; @
)@ A
{ 
if 

( 
string 
. 
IsNullOrWhiteSpace %
(% &
_options& .
.. /
ApiKey/ 5
)5 6
||7 9
_options 
. 
ApiKey 
== 
$str 6
)6 7
{ 	
return 
new 
ResultadoIA "
{ 
Resumo 
= 
$str g
,g h
Tags 
= 
$str 1
,1 2
	Categoria 
= 
$str *
} 
; 
} 	
var 
prompt 
= 
PromptBuilder "
." #%
CriarPromptResumoPostagem# <
(< =
texto= B
)B C
;C D
var 
requestBody 
= 
new 
{ 	
contents   
=   
new   
[   
]   
{!! 
new"" 
{## 
parts$$ 
=$$ 
new$$ 
[$$  
]$$  !
{%% 
new&& 
{'' 
text((  
=((! "
prompt((# )
})) 
}** 
}++ 
},, 
}-- 	
;--	 

var// 
json// 
=// 
JsonSerializer// !
.//! "
	Serialize//" +
(//+ ,
requestBody//, 7
)//7 8
;//8 9
using11 
var11 
request11 
=11 
new11 
HttpRequestMessage11  2
(112 3

HttpMethod22 
.22 
Post22 
,22 
$"33 
$str33 F
{33F G
_options33G O
.33O P
Model33P U
}33U V
$str33V f
"33f g
)33g h
;33h i
request55 
.55 
Headers55 
.55 
Add55 
(55 
$str55 ,
,55, -
_options55. 6
.556 7
ApiKey557 =
)55= >
;55> ?
request66 
.66 
Content66 
=66 
new66 
StringContent66 +
(66+ ,
json66, 0
,660 1
Encoding662 :
.66: ;
UTF866; ?
,66? @
$str66A S
)66S T
;66T U
using88 
var88 
response88 
=88 
await88 "

httpClient88# -
.88- .
	SendAsync88. 7
(887 8
request888 ?
)88? @
;88@ A
if:: 

(:: 
!:: 
response:: 
.:: 
IsSuccessStatusCode:: )
)::) *
{;; 	
return<< 
new<< 
ResultadoIA<< "
{== 
Resumo>> 
=>> 
$str>> T
,>>T U
Tags?? 
=?? 
$str?? )
,??) *
	Categoria@@ 
=@@ 
$str@@ *
}AA 
;AA 
}BB 	
varDD 
responseContentDD 
=DD 
awaitDD #
responseDD$ ,
.DD, -
ContentDD- 4
.DD4 5
ReadAsStringAsyncDD5 F
(DDF G
)DDG H
;DDH I
varEE 
textoGeradoEE 
=EE 
ExtrairTextoGeradoEE ,
(EE, -
responseContentEE- <
)EE< =
;EE= >
returnGG 
InterpretarRespostaGG "
(GG" #
textoGeradoGG# .
)GG. /
;GG/ 0
}HH 
privateJJ 
staticJJ 
stringJJ 
ExtrairTextoGeradoJJ ,
(JJ, -
stringJJ- 3
jsonJJ4 8
)JJ8 9
{KK 
tryLL 
{MM 	
usingNN 
varNN 
documentNN 
=NN  
JsonDocumentNN! -
.NN- .
ParseNN. 3
(NN3 4
jsonNN4 8
)NN8 9
;NN9 :
varPP 
rootPP 
=PP 
documentPP 
.PP  
RootElementPP  +
;PP+ ,
varRR 
textoRR 
=RR 
rootRR 
.SS 
GetPropertySS 
(SS 
$strSS )
)SS) *
[SS* +
$numSS+ ,
]SS, -
.TT 
GetPropertyTT 
(TT 
$strTT &
)TT& '
.UU 
GetPropertyUU 
(UU 
$strUU $
)UU$ %
[UU% &
$numUU& '
]UU' (
.VV 
GetPropertyVV 
(VV 
$strVV #
)VV# $
.WW 
	GetStringWW 
(WW 
)WW 
;WW 
returnYY 
textoYY 
??YY 
stringYY "
.YY" #
EmptyYY# (
;YY( )
}ZZ 	
catch[[ 
{\\ 	
return]] 
string]] 
.]] 
Empty]] 
;]]  
}^^ 	
}__ 
privateaa 
staticaa 
ResultadoIAaa 
InterpretarRespostaaa 2
(aa2 3
stringaa3 9
textoaa: ?
)aa? @
{bb 
ifcc 

(cc 
stringcc 
.cc 
IsNullOrWhiteSpacecc %
(cc% &
textocc& +
)cc+ ,
)cc, -
{dd 	
returnee 
newee 
ResultadoIAee "
{ff 
Resumogg 
=gg 
$strgg M
,ggM N
Tagshh 
=hh 
$strhh ,
,hh, -
	Categoriaii 
=ii 
$strii (
}jj 
;jj 
}kk 	
varmm 
	resultadomm 
=mm 
newmm 
ResultadoIAmm '
{nn 	
Resumooo 
=oo 
textooo 
,oo 
Tagspp 
=pp 
$strpp '
,pp' (
	Categoriaqq 
=qq 
$strqq 
}rr 	
;rr	 

vartt 
linhastt 
=tt 
textott 
.uu 
Splituu 
(uu 
$charuu 
,uu 
StringSplitOptionsuu +
.uu+ ,
RemoveEmptyEntriesuu, >
|uu? @
StringSplitOptionsuuA S
.uuS T
TrimEntriesuuT _
)uu_ `
;uu` a
foreachww 
(ww 
varww 
linhaww 
inww 
linhasww $
)ww$ %
{xx 	
ifyy 
(yy 
linhayy 
.yy 

StartsWithyy  
(yy  !
$stryy! *
,yy* +
StringComparisonyy, <
.yy< =
OrdinalIgnoreCaseyy= N
)yyN O
)yyO P
{zz 
	resultado{{ 
.{{ 
Resumo{{  
={{! "
linha{{# (
.{{( )
Replace{{) 0
({{0 1
$str{{1 :
,{{: ;
string{{< B
.{{B C
Empty{{C H
,{{H I
StringComparison{{J Z
.{{Z [
OrdinalIgnoreCase{{[ l
){{l m
.{{m n
Trim{{n r
({{r s
){{s t
;{{t u
}|| 
if~~ 
(~~ 
linha~~ 
.~~ 

StartsWith~~  
(~~  !
$str~~! (
,~~( )
StringComparison~~* :
.~~: ;
OrdinalIgnoreCase~~; L
)~~L M
)~~M N
{ 
	resultado
ÄÄ 
.
ÄÄ 
Tags
ÄÄ 
=
ÄÄ  
linha
ÄÄ! &
.
ÄÄ& '
Replace
ÄÄ' .
(
ÄÄ. /
$str
ÄÄ/ 6
,
ÄÄ6 7
string
ÄÄ8 >
.
ÄÄ> ?
Empty
ÄÄ? D
,
ÄÄD E
StringComparison
ÄÄF V
.
ÄÄV W
OrdinalIgnoreCase
ÄÄW h
)
ÄÄh i
.
ÄÄi j
Trim
ÄÄj n
(
ÄÄn o
)
ÄÄo p
;
ÄÄp q
}
ÅÅ 
if
ÉÉ 
(
ÉÉ 
linha
ÉÉ 
.
ÉÉ 

StartsWith
ÉÉ  
(
ÉÉ  !
$str
ÉÉ! -
,
ÉÉ- .
StringComparison
ÉÉ/ ?
.
ÉÉ? @
OrdinalIgnoreCase
ÉÉ@ Q
)
ÉÉQ R
)
ÉÉR S
{
ÑÑ 
	resultado
ÖÖ 
.
ÖÖ 
	Categoria
ÖÖ #
=
ÖÖ$ %
linha
ÖÖ& +
.
ÖÖ+ ,
Replace
ÖÖ, 3
(
ÖÖ3 4
$str
ÖÖ4 @
,
ÖÖ@ A
string
ÖÖB H
.
ÖÖH I
Empty
ÖÖI N
,
ÖÖN O
StringComparison
ÖÖP `
.
ÖÖ` a
OrdinalIgnoreCase
ÖÖa r
)
ÖÖr s
.
ÖÖs t
Trim
ÖÖt x
(
ÖÖx y
)
ÖÖy z
;
ÖÖz {
}
ÜÜ 
}
áá 	
return
ââ 
	resultado
ââ 
;
ââ 
}
ää 
}ãã ú3
=C:\Dev\BlogPessoalBackend\BlogPessoal\Services\AuthService.cs
	namespace 	
BlogPessoal
 
. 
Services 
; 
public 
class 
AuthService 
( 
IUsuarioRepository 
usuarioRepository (
,( )
IPasswordHasher 
< 
Usuario 
> 
passwordHasher +
,+ ,
IOptions 
< 
JwtSettings 
> 

jwtOptions $
)$ %
{ 
private 
readonly 
JwtSettings  
_jwtSettings! -
=. /

jwtOptions0 :
.: ;
Value; @
;@ A
public 

async 
Task 
< #
UsuarioLoginResponseDto -
?- .
>. /

LoginAsync0 :
(: ;
UsuarioLoginDto; J
dtoK N
)N O
{ 
var 
email 
= 
dto 
. 
Email 
. 
Trim "
(" #
)# $
.$ %
ToLowerInvariant% 5
(5 6
)6 7
;7 8
var 
usuario 
= 
await 
usuarioRepository -
.- .
BuscarPorEmailAsync. A
(A B
emailB G
)G H
;H I
if 

( 
usuario 
is 
null 
) 
{ 	
return 
null 
; 
} 	
var   
resultadoSenha   
=   
passwordHasher   +
.  + , 
VerifyHashedPassword  , @
(  @ A
usuario!! 
,!! 
usuario"" 
."" 
Senha"" 
,"" 
dto## 
.## 
Senha## 
)## 
;## 
if%% 

(%% 
resultadoSenha%% 
==%% &
PasswordVerificationResult%% 8
.%%8 9
Failed%%9 ?
)%%? @
{&& 	
return'' 
null'' 
;'' 
}(( 	
var** 
expiraEm** 
=** 
DateTime** 
.**  
UtcNow**  &
.**& '

AddMinutes**' 1
(**1 2
_jwtSettings**2 >
.**> ?
ExpirationMinutes**? P
)**P Q
;**Q R
var++ 
token++ 
=++ 

GerarToken++ 
(++ 
usuario++ &
,++& '
expiraEm++( 0
)++0 1
;++1 2
return-- 
new-- #
UsuarioLoginResponseDto-- *
{.. 	
Id// 
=// 
usuario// 
.// 
Id// 
,// 
Nome00 
=00 
usuario00 
.00 
Nome00 
,00  
UsuarioNome11 
=11 
usuario11 !
.11! "
UsuarioNome11" -
,11- .
Email22 
=22 
usuario22 
.22 
Email22 !
,22! "
Tipo33 
=33 
usuario33 
.33 
Tipo33 
,33  
Token44 
=44 
token44 
,44 
ExpiraEm55 
=55 
expiraEm55 
}66 	
;66	 

}77 
private99 
string99 

GerarToken99 
(99 
Usuario99 %
usuario99& -
,99- .
DateTime99/ 7
expiraEm998 @
)99@ A
{:: 
var;; 
claims;; 
=;; 
new;; 
List;; 
<;; 
Claim;; #
>;;# $
{<< 	
new== 
(== #
JwtRegisteredClaimNames== '
.==' (
Sub==( +
,==+ ,
usuario==- 4
.==4 5
Id==5 7
.==7 8
ToString==8 @
(==@ A
)==A B
)==B C
,==C D
new>> 
(>> 

ClaimTypes>> 
.>> 
NameIdentifier>> )
,>>) *
usuario>>+ 2
.>>2 3
Id>>3 5
.>>5 6
ToString>>6 >
(>>> ?
)>>? @
)>>@ A
,>>A B
new?? 
(?? #
JwtRegisteredClaimNames?? '
.??' (
Email??( -
,??- .
usuario??/ 6
.??6 7
Email??7 <
)??< =
,??= >
new@@ 
(@@ 

ClaimTypes@@ 
.@@ 
Email@@  
,@@  !
usuario@@" )
.@@) *
Email@@* /
)@@/ 0
,@@0 1
newAA 
(AA 

ClaimTypesAA 
.AA 
NameAA 
,AA  
usuarioAA! (
.AA( )
UsuarioNomeAA) 4
)AA4 5
,AA5 6
newBB 
(BB 

ClaimTypesBB 
.BB 
RoleBB 
,BB  
usuarioBB! (
.BB( )
TipoBB) -
)BB- .
}CC 	
;CC	 

varEE 
chaveEE 
=EE 
newEE  
SymmetricSecurityKeyEE ,
(EE, -
EncodingEE- 5
.EE5 6
UTF8EE6 :
.EE: ;
GetBytesEE; C
(EEC D
_jwtSettingsEED P
.EEP Q
KeyEEQ T
)EET U
)EEU V
;EEV W
varFF 
credenciaisFF 
=FF 
newFF 
SigningCredentialsFF 0
(FF0 1
chaveFF1 6
,FF6 7
SecurityAlgorithmsFF8 J
.FFJ K

HmacSha256FFK U
)FFU V
;FFV W
varHH 
tokenHH 
=HH 
newHH 
JwtSecurityTokenHH (
(HH( )
issuerII 
:II 
_jwtSettingsII  
.II  !
IssuerII! '
,II' (
audienceJJ 
:JJ 
_jwtSettingsJJ "
.JJ" #
AudienceJJ# +
,JJ+ ,
claimsKK 
:KK 
claimsKK 
,KK 
expiresLL 
:LL 
expiraEmLL 
,LL 
signingCredentialsMM 
:MM 
credenciaisMM  +
)MM+ ,
;MM, -
returnOO 
newOO #
JwtSecurityTokenHandlerOO *
(OO* +
)OO+ ,
.OO, -

WriteTokenOO- 7
(OO7 8
tokenOO8 =
)OO= >
;OO> ?
}PP 
}QQ ¸'
GC:\Dev\BlogPessoalBackend\BlogPessoal\Repositories\UsuarioRepository.cs
	namespace 	
BlogPessoal
 
. 
Repositories "
;" #
public 
class 
UsuarioRepository 
( 
AppDbContext +
context, 3
)3 4
:5 6
IUsuarioRepository7 I
{ 
public		 

async		 
Task		 
<		 
List		 
<		 
Usuario		 "
>		" #
>		# $
ListarAsync		% 0
(		0 1
)		1 2
{

 
return 
await 
context 
. 
Usuarios %
. 
AsNoTracking 
( 
) 
. 
OrderBy 
( 
usuario 
=> 
usuario  '
.' (
Nome( ,
), -
. 
ToListAsync 
( 
) 
; 
} 
public 

async 
Task 
< 
Usuario 
? 
> 
BuscarPorIdAsync  0
(0 1
long1 5
id6 8
)8 9
{ 
return 
await 
context 
. 
Usuarios %
. 
FirstOrDefaultAsync  
(  !
usuario! (
=>) +
usuario, 3
.3 4
Id4 6
==7 9
id: <
)< =
;= >
} 
public 

async 
Task 
< 
Usuario 
? 
> 
BuscarPorEmailAsync  3
(3 4
string4 :
email; @
)@ A
{ 
return 
await 
context 
. 
Usuarios %
. 
FirstOrDefaultAsync  
(  !
usuario! (
=>) +
usuario, 3
.3 4
Email4 9
==: <
email= B
)B C
;C D
} 
public 

async 
Task 
< 
Usuario 
> 

CriarAsync )
() *
Usuario* 1
usuario2 9
)9 :
{ 
context 
. 
Usuarios 
. 
Add 
( 
usuario $
)$ %
;% &
await   
context   
.   
SaveChangesAsync   &
(  & '
)  ' (
;  ( )
return"" 
usuario"" 
;"" 
}## 
public%% 

async%% 
Task%% 
<%% 
Usuario%% 
?%% 
>%% 
AtualizarAsync%%  .
(%%. /
Usuario%%/ 6
usuario%%7 >
)%%> ?
{&& 
var'' 
usuarioExistente'' 
='' 
await'' $
BuscarPorIdAsync''% 5
(''5 6
usuario''6 =
.''= >
Id''> @
)''@ A
;''A B
if)) 

()) 
usuarioExistente)) 
is)) 
null))  $
)))$ %
{** 	
return++ 
null++ 
;++ 
},, 	
usuarioExistente.. 
... 
Nome.. 
=.. 
usuario..  '
...' (
Nome..( ,
;.., -
usuarioExistente// 
.// 
UsuarioNome// $
=//% &
usuario//' .
.//. /
UsuarioNome/// :
;//: ;
usuarioExistente00 
.00 
Foto00 
=00 
usuario00  '
.00' (
Foto00( ,
;00, -
usuarioExistente11 
.11 
Tipo11 
=11 
usuario11  '
.11' (
Tipo11( ,
;11, -
await33 
context33 
.33 
SaveChangesAsync33 &
(33& '
)33' (
;33( )
return55 
usuarioExistente55 
;55  
}66 
public88 

async88 
Task88 
<88 
bool88 
>88 
DeletarAsync88 (
(88( )
long88) -
id88. 0
)880 1
{99 
var:: 
usuario:: 
=:: 
await:: 
BuscarPorIdAsync:: ,
(::, -
id::- /
)::/ 0
;::0 1
if<< 

(<< 
usuario<< 
is<< 
null<< 
)<< 
{== 	
return>> 
false>> 
;>> 
}?? 	
contextAA 
.AA 
UsuariosAA 
.AA 
RemoveAA 
(AA  
usuarioAA  '
)AA' (
;AA( )
awaitBB 
contextBB 
.BB 
SaveChangesAsyncBB &
(BB& '
)BB' (
;BB( )
returnDD 
trueDD 
;DD 
}EE 
}FF Æ
DC:\Dev\BlogPessoalBackend\BlogPessoal\Repositories\TemaRepository.cs
	namespace 	
BlogPessoal
 
. 
Repositories "
;" #
public 
class 
TemaRepository 
( 
AppDbContext (
context) 0
)0 1
:2 3
ITemaRepository4 C
{ 
public		 

async		 
Task		 
<		 
List		 
<		 
Tema		 
>		  
>		  !
ListarAsync		" -
(		- .
)		. /
{

 
return 
await 
context 
. 
Temas "
. 
AsNoTracking 
( 
) 
. 
OrderBy 
( 
tema 
=> 
tema !
.! "
	Descricao" +
)+ ,
. 
ToListAsync 
( 
) 
; 
} 
public 

async 
Task 
< 
Tema 
? 
> 
BuscarPorIdAsync -
(- .
long. 2
id3 5
)5 6
{ 
return 
await 
context 
. 
Temas "
. 
FirstOrDefaultAsync  
(  !
tema! %
=>& (
tema) -
.- .
Id. 0
==1 3
id4 6
)6 7
;7 8
} 
public 

async 
Task 
< 
Tema 
> 

CriarAsync &
(& '
Tema' +
tema, 0
)0 1
{ 
context 
. 
Temas 
. 
Add 
( 
tema 
) 
;  
await 
context 
. 
SaveChangesAsync &
(& '
)' (
;( )
return 
tema 
; 
} 
public 

async 
Task 
< 
Tema 
? 
> 
AtualizarAsync +
(+ ,
Tema, 0
tema1 5
)5 6
{   
var!! 
temaExistente!! 
=!! 
await!! !
BuscarPorIdAsync!!" 2
(!!2 3
tema!!3 7
.!!7 8
Id!!8 :
)!!: ;
;!!; <
if## 

(## 
temaExistente## 
is## 
null## !
)##! "
{$$ 	
return%% 
null%% 
;%% 
}&& 	
temaExistente(( 
.(( 
	Descricao(( 
=((  !
tema((" &
.((& '
	Descricao((' 0
;((0 1
await** 
context** 
.** 
SaveChangesAsync** &
(**& '
)**' (
;**( )
return,, 
temaExistente,, 
;,, 
}-- 
public// 

async// 
Task// 
<// 
bool// 
>// 
DeletarAsync// (
(//( )
long//) -
id//. 0
)//0 1
{00 
var11 
tema11 
=11 
await11 
BuscarPorIdAsync11 )
(11) *
id11* ,
)11, -
;11- .
if33 

(33 
tema33 
is33 
null33 
)33 
{44 	
return55 
false55 
;55 
}66 	
context88 
.88 
Temas88 
.88 
Remove88 
(88 
tema88 !
)88! "
;88" #
await99 
context99 
.99 
SaveChangesAsync99 &
(99& '
)99' (
;99( )
return;; 
true;; 
;;; 
}<< 
}== ≤C
HC:\Dev\BlogPessoalBackend\BlogPessoal\Repositories\PostagemRepository.cs
	namespace 	
BlogPessoal
 
. 
Repositories "
;" #
public 
class 
PostagemRepository 
(  
AppDbContext  ,
context- 4
)4 5
:6 7
IPostagemRepository8 K
{ 
public		 

async		 
Task		 
<		 
List		 
<		 
Postagem		 #
>		# $
>		$ %
ListarAsync		& 1
(		1 2
)		2 3
{

 
return 
await 
context 
. 
	Postagens &
. 
AsNoTracking 
( 
) 
. 
Include 
( 
postagem 
=>  
postagem! )
.) *
Usuario* 1
)1 2
. 
Include 
( 
postagem 
=>  
postagem! )
.) *
Tema* .
). /
. 
OrderByDescending 
( 
postagem '
=>( *
postagem+ 3
.3 4
Data4 8
)8 9
. 
ToListAsync 
( 
) 
; 
} 
public 

async 
Task 
< 
Postagem 
? 
>  
BuscarPorIdAsync! 1
(1 2
long2 6
id7 9
)9 :
{ 
return 
await 
context 
. 
	Postagens &
. 
Include 
( 
postagem 
=>  
postagem! )
.) *
Usuario* 1
)1 2
. 
Include 
( 
postagem 
=>  
postagem! )
.) *
Tema* .
). /
. 
FirstOrDefaultAsync  
(  !
postagem! )
=>* ,
postagem- 5
.5 6
Id6 8
==9 ;
id< >
)> ?
;? @
} 
public 

async 
Task 
< 
List 
< 
Postagem #
># $
>$ %!
BuscarPorUsuarioAsync& ;
(; <
long< @
	usuarioIdA J
)J K
{ 
return 
await 
context 
. 
	Postagens &
. 
AsNoTracking 
( 
) 
. 
Include 
( 
postagem 
=>  
postagem! )
.) *
Usuario* 1
)1 2
.   
Include   
(   
postagem   
=>    
postagem  ! )
.  ) *
Tema  * .
)  . /
.!! 
Where!! 
(!! 
postagem!! 
=>!! 
postagem!! '
.!!' (
	UsuarioId!!( 1
==!!2 4
	usuarioId!!5 >
)!!> ?
."" 
OrderByDescending"" 
("" 
postagem"" '
=>""( *
postagem""+ 3
.""3 4
Data""4 8
)""8 9
.## 
ToListAsync## 
(## 
)## 
;## 
}$$ 
public&& 

async&& 
Task&& 
<&& 
List&& 
<&& 
Postagem&& #
>&&# $
>&&$ %
BuscarPorTemaAsync&&& 8
(&&8 9
long&&9 =
temaId&&> D
)&&D E
{'' 
return(( 
await(( 
context(( 
.(( 
	Postagens(( &
.)) 
AsNoTracking)) 
()) 
))) 
.** 
Include** 
(** 
postagem** 
=>**  
postagem**! )
.**) *
Usuario*** 1
)**1 2
.++ 
Include++ 
(++ 
postagem++ 
=>++  
postagem++! )
.++) *
Tema++* .
)++. /
.,, 
Where,, 
(,, 
postagem,, 
=>,, 
postagem,, '
.,,' (
TemaId,,( .
==,,/ 1
temaId,,2 8
),,8 9
.-- 
OrderByDescending-- 
(-- 
postagem-- '
=>--( *
postagem--+ 3
.--3 4
Data--4 8
)--8 9
... 
ToListAsync.. 
(.. 
).. 
;.. 
}// 
public11 

async11 
Task11 
<11 
Postagem11 
>11 

CriarAsync11  *
(11* +
Postagem11+ 3
postagem114 <
)11< =
{22 
context33 
.33 
	Postagens33 
.33 
Add33 
(33 
postagem33 &
)33& '
;33' (
await44 
context44 
.44 
SaveChangesAsync44 &
(44& '
)44' (
;44( )
return66 
await66 
BuscarPorIdAsync66 %
(66% &
postagem66& .
.66. /
Id66/ 1
)661 2
??663 5
postagem666 >
;66> ?
}77 
public99 

async99 
Task99 
<99 
Postagem99 
?99 
>99  
AtualizarAsync99! /
(99/ 0
Postagem990 8
postagem999 A
)99A B
{:: 
var;; 
postagemExistente;; 
=;; 
await;;  %
context;;& -
.;;- .
	Postagens;;. 7
.<< 
FirstOrDefaultAsync<<  
(<<  !
item<<! %
=><<& (
item<<) -
.<<- .
Id<<. 0
==<<1 3
postagem<<4 <
.<<< =
Id<<= ?
)<<? @
;<<@ A
if>> 

(>> 
postagemExistente>> 
is>>  
null>>! %
)>>% &
{?? 	
return@@ 
null@@ 
;@@ 
}AA 	
postagemExistenteCC 
.CC 
TituloCC  
=CC! "
postagemCC# +
.CC+ ,
TituloCC, 2
;CC2 3
postagemExistenteDD 
.DD 
TextoDD 
=DD  !
postagemDD" *
.DD* +
TextoDD+ 0
;DD0 1
postagemExistenteEE 
.EE 
TemaIdEE  
=EE! "
postagemEE# +
.EE+ ,
TemaIdEE, 2
;EE2 3
postagemExistenteFF 
.FF 
ResumoIAFF "
=FF# $
postagemFF% -
.FF- .
ResumoIAFF. 6
;FF6 7
postagemExistenteGG 
.GG 
TagsIAGG  
=GG! "
postagemGG# +
.GG+ ,
TagsIAGG, 2
;GG2 3
postagemExistenteHH 
.HH 
CategoriaIAHH %
=HH& '
postagemHH( 0
.HH0 1
CategoriaIAHH1 <
;HH< =
awaitJJ 
contextJJ 
.JJ 
SaveChangesAsyncJJ &
(JJ& '
)JJ' (
;JJ( )
returnLL 
awaitLL 
BuscarPorIdAsyncLL %
(LL% &
postagemExistenteLL& 7
.LL7 8
IdLL8 :
)LL: ;
;LL; <
}MM 
publicOO 

asyncOO 
TaskOO 
<OO 
boolOO 
>OO 
DeletarAsyncOO (
(OO( )
longOO) -
idOO. 0
)OO0 1
{PP 
varQQ 
postagemQQ 
=QQ 
awaitQQ 
contextQQ $
.QQ$ %
	PostagensQQ% .
.RR 
FirstOrDefaultAsyncRR  
(RR  !
itemRR! %
=>RR& (
itemRR) -
.RR- .
IdRR. 0
==RR1 3
idRR4 6
)RR6 7
;RR7 8
ifTT 

(TT 
postagemTT 
isTT 
nullTT 
)TT 
{UU 	
returnVV 
falseVV 
;VV 
}WW 	
contextYY 
.YY 
	PostagensYY 
.YY 
RemoveYY  
(YY  !
postagemYY! )
)YY) *
;YY* +
awaitZZ 
contextZZ 
.ZZ 
SaveChangesAsyncZZ &
(ZZ& '
)ZZ' (
;ZZ( )
return\\ 
true\\ 
;\\ 
}]] 
}^^ ˛

HC:\Dev\BlogPessoalBackend\BlogPessoal\Repositories\IUsuarioRepository.cs
	namespace 	
BlogPessoal
 
. 
Repositories "
;" #
public 
	interface 
IUsuarioRepository #
{ 
Task 
< 	
List	 
< 
Usuario 
> 
> 
ListarAsync #
(# $
)$ %
;% &
Task		 
<		 	
Usuario			 
?		 
>		 
BuscarPorIdAsync		 #
(		# $
long		$ (
id		) +
)		+ ,
;		, -
Task 
< 	
Usuario	 
? 
> 
BuscarPorEmailAsync &
(& '
string' -
email. 3
)3 4
;4 5
Task 
< 	
Usuario	 
> 

CriarAsync 
( 
Usuario $
usuario% ,
), -
;- .
Task 
< 	
Usuario	 
? 
> 
AtualizarAsync !
(! "
Usuario" )
usuario* 1
)1 2
;2 3
Task 
< 	
bool	 
> 
DeletarAsync 
( 
long  
id! #
)# $
;$ %
} ó
IC:\Dev\BlogPessoalBackend\BlogPessoal\Repositories\IPostagemRepository.cs
	namespace 	
BlogPessoal
 
. 
Repositories "
;" #
public 
	interface 
IPostagemRepository $
{ 
Task 
< 	
List	 
< 
Postagem 
> 
> 
ListarAsync $
($ %
)% &
;& '
Task		 
<		 	
Postagem			 
?		 
>		 
BuscarPorIdAsync		 $
(		$ %
long		% )
id		* ,
)		, -
;		- .
Task 
< 	
List	 
< 
Postagem 
> 
> !
BuscarPorUsuarioAsync .
(. /
long/ 3
	usuarioId4 =
)= >
;> ?
Task 
< 	
List	 
< 
Postagem 
> 
> 
BuscarPorTemaAsync +
(+ ,
long, 0
temaId1 7
)7 8
;8 9
Task 
< 	
Postagem	 
> 

CriarAsync 
( 
Postagem &
postagem' /
)/ 0
;0 1
Task 
< 	
Postagem	 
? 
> 
AtualizarAsync "
(" #
Postagem# +
postagem, 4
)4 5
;5 6
Task 
< 	
bool	 
> 
DeletarAsync 
( 
long  
id! #
)# $
;$ %
} ó	
EC:\Dev\BlogPessoalBackend\BlogPessoal\Repositories\ITemaRepository.cs
	namespace 	
BlogPessoal
 
. 
Repositories "
;" #
public 
	interface 
ITemaRepository  
{ 
Task 
< 	
List	 
< 
Tema 
> 
> 
ListarAsync  
(  !
)! "
;" #
Task		 
<		 	
Tema			 
?		 
>		 
BuscarPorIdAsync		  
(		  !
long		! %
id		& (
)		( )
;		) *
Task 
< 	
Tema	 
> 

CriarAsync 
( 
Tema 
tema #
)# $
;$ %
Task 
< 	
Tema	 
? 
> 
AtualizarAsync 
( 
Tema #
tema$ (
)( )
;) *
Task 
< 	
bool	 
> 
DeletarAsync 
( 
long  
id! #
)# $
;$ %
} ™+
0C:\Dev\BlogPessoalBackend\BlogPessoal\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder 
. 
Services 
. #
AddSwaggerConfiguration (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddJwtConfiguration $
($ %
builder% ,
., -
Configuration- :
): ;
;; <
builder 
. 
Services 
. 
	Configure 
< 
GeminiOptions (
>( )
() *
builder 
. 
Configuration 
. 

GetSection $
($ %
$str% -
)- .
). /
;/ 0
var 
connectionString 
= 
builder 
. 
Configuration ,
., -
GetConnectionString- @
(@ A
$strA T
)T U
;U V
builder 
. 
Services 
. 
AddDbContext 
< 
AppDbContext *
>* +
(+ ,
options, 3
=>4 6
{ 
options 
. 
	UseNpgsql 
( 
connectionString &
)& '
;' (
} 
) 
; 
builder 
. 
Services 
. 
	AddScoped 
< 
ITemaRepository *
,* +
TemaRepository, :
>: ;
(; <
)< =
;= >
builder 
. 
Services 
. 
	AddScoped 
< 
IUsuarioRepository -
,- .
UsuarioRepository/ @
>@ A
(A B
)B C
;C D
builder 
. 
Services 
. 
	AddScoped 
< 
IPostagemRepository .
,. /
PostagemRepository0 B
>B C
(C D
)D E
;E F
builder 
. 
Services 
. 
	AddScoped 
< 
TemaService &
>& '
(' (
)( )
;) *
builder   
.   
Services   
.   
	AddScoped   
<   
UsuarioService   )
>  ) *
(  * +
)  + ,
;  , -
builder!! 
.!! 
Services!! 
.!! 
	AddScoped!! 
<!! 
PostagemService!! *
>!!* +
(!!+ ,
)!!, -
;!!- .
builder"" 
."" 
Services"" 
."" 
	AddScoped"" 
<"" 
AuthService"" &
>""& '
(""' (
)""( )
;"") *
builder## 
.## 
Services## 
.## 
	AddScoped## 
<## 
IPasswordHasher## *
<##* +
Usuario##+ 2
>##2 3
,##3 4
PasswordHasher##5 C
<##C D
Usuario##D K
>##K L
>##L M
(##M N
)##N O
;##O P
builder%% 
.%% 
Services%% 
.%% 
AddHttpClient%% 
<%% 
IGeminiService%% -
,%%- .
GeminiService%%/ <
>%%< =
(%%= >
)%%> ?
;%%? @
var'' 
app'' 
='' 	
builder''
 
.'' 
Build'' 
('' 
)'' 
;'' 
app)) 
.)) 
UseMiddleware)) 
<)) 
ExceptionMiddleware)) %
>))% &
())& '
)))' (
;))( )
app++ 
.++ #
UseSwaggerConfiguration++ 
(++ 
)++ 
;++ 
app-- 
.-- 
UseHttpsRedirection-- 
(-- 
)-- 
;-- 
app// 
.// 
UseAuthentication// 
(// 
)// 
;// 
app00 
.00 
UseAuthorization00 
(00 
)00 
;00 
app22 
.22 
MapControllers22 
(22 
)22 
;22 
app33 
.33 
MapGet33 

(33
 
$str33 
,33 
(33 
)33 
=>33 
{44 
return55 

Results55 
.55 
Ok55 
(55 
new55 
{66 
status77 
=77 
$str77 "
,77" #
ambiente88 
=88 
app88 
.88 
Environment88 "
.88" #
EnvironmentName88# 2
,882 3
data99 
=99 
DateTime99 
.99 
UtcNow99 
}:: 
):: 
;:: 
};; 
);; 
;;; 
app== 
.== 
Run== 
(== 
)== 	
;==	 

public?? 
partial?? 
class?? 
Program?? 
{?? 
}??  ﬂ

4C:\Dev\BlogPessoalBackend\BlogPessoal\Models\Tema.cs
	namespace 	
BlogPessoal
 
. 
Models 
; 
public 
class 
Tema 
{ 
public 

long 
Id 
{ 
get 
; 
set 
; 
}  
[		 
Required		 
(		 
ErrorMessage		 
=		 
$str		 A
)		A B
]		B C
[

 
StringLength

 
(

 
$num

 
,

 
MinimumLength

 $
=

% &
$num

' (
,

( )
ErrorMessage

* 6
=

7 8
$str

9 i
)

i j
]

j k
public 

string 
	Descricao 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 

ICollection 
< 
Postagem 
>  
	Postagens! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
=9 :
new; >
List? C
<C D
PostagemD L
>L M
(M N
)N O
;O P
} † 
7C:\Dev\BlogPessoalBackend\BlogPessoal\Models\Usuario.cs
	namespace 	
BlogPessoal
 
. 
Models 
; 
public 
class 
Usuario 
{ 
public 

long 
Id 
{ 
get 
; 
set 
; 
}  
[		 
Required		 
(		 
ErrorMessage		 
=		 
$str		 4
)		4 5
]		5 6
[

 
StringLength

 
(

 
$num

 
,

 
ErrorMessage

 #
=

$ %
$str

& Q
)

Q R
]

R S
public 

string 
Nome 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
[ 
Required 
( 
ErrorMessage 
= 
$str ?
)? @
]@ A
[ 
StringLength 
( 
$num 
, 
ErrorMessage "
=# $
$str% Z
)Z [
][ \
public 

string 
UsuarioNome 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
[ 
Required 
( 
ErrorMessage 
= 
$str 6
)6 7
]7 8
[ 
EmailAddress 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 
StringLength 
( 
$num 
, 
ErrorMessage #
=$ %
$str& S
)S T
]T U
public 

string 
Email 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
[ 
Required 
( 
ErrorMessage 
= 
$str 5
)5 6
]6 7
[ 
StringLength 
( 
$num 
, 
MinimumLength $
=% &
$num' (
,( )
ErrorMessage* 6
=7 8
$str9 e
)e f
]f g
public 

string 
Senha 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
[ 
StringLength 
( 
$num 
, 
ErrorMessage #
=$ %
$str& Q
)Q R
]R S
public 

string 
Foto 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
[ 
Required 
( 
ErrorMessage 
= 
$str ?
)? @
]@ A
[ 
StringLength 
( 
$num 
, 
ErrorMessage "
=# $
$str% O
)O P
]P Q
public 

string 
Tipo 
{ 
get 
; 
set !
;! "
}# $
=% &
$str' /
;/ 0
public!! 

ICollection!! 
<!! 
Postagem!! 
>!!  
	Postagens!!! *
{!!+ ,
get!!- 0
;!!0 1
set!!2 5
;!!5 6
}!!7 8
=!!9 :
new!!; >
List!!? C
<!!C D
Postagem!!D L
>!!L M
(!!M N
)!!N O
;!!O P
}"" ˛
8C:\Dev\BlogPessoalBackend\BlogPessoal\Models\Postagem.cs
	namespace 	
BlogPessoal
 
. 
Models 
; 
public 
class 
Postagem 
{ 
public 

long 
Id 
{ 
get 
; 
set 
; 
}  
[		 
Required		 
(		 
ErrorMessage		 
=		 
$str		 B
)		B C
]		C D
[

 
StringLength

 
(

 
$num

 
,

 
MinimumLength

 $
=

% &
$num

' (
,

( )
ErrorMessage

* 6
=

7 8
$str

9 f
)

f g
]

g h
public 

string 
Titulo 
{ 
get 
; 
set  #
;# $
}% &
=' (
string) /
./ 0
Empty0 5
;5 6
[ 
Required 
( 
ErrorMessage 
= 
$str A
)A B
]B C
[ 
StringLength 
( 
$num 
, 
MinimumLength %
=& '
$num( *
,* +
ErrorMessage, 8
=9 :
$str; i
)i j
]j k
public 

string 
Texto 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
public 

DateTime 
Data 
{ 
get 
; 
set  #
;# $
}% &
=' (
DateTime) 1
.1 2
UtcNow2 8
;8 9
[ 
StringLength 
( 
$num 
, 
ErrorMessage $
=% &
$str' d
)d e
]e f
public 

string 
? 
ResumoIA 
{ 
get !
;! "
set# &
;& '
}( )
[ 
StringLength 
( 
$num 
, 
ErrorMessage #
=$ %
$str& c
)c d
]d e
public 

string 
? 
TagsIA 
{ 
get 
;  
set! $
;$ %
}& '
[ 
StringLength 
( 
$num 
, 
ErrorMessage #
=$ %
$str& e
)e f
]f g
public 

string 
? 
CategoriaIA 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

long 
	UsuarioId 
{ 
get 
;  
set! $
;$ %
}& '
public 

Usuario 
? 
Usuario 
{ 
get !
;! "
set# &
;& '
}( )
public   

long   
TemaId   
{   
get   
;   
set   !
;  ! "
}  # $
public"" 

Tema"" 
?"" 
Tema"" 
{"" 
get"" 
;"" 
set""  
;""  !
}""" #
}## ‡^
VC:\Dev\BlogPessoalBackend\BlogPessoal\Migrations\20260521131052_RefazendoMigrations.cs
	namespace 	
BlogPessoal
 
. 

Migrations  
{ 
public

 

partial

 
class

 
RefazendoMigrations

 ,
:

- .
	Migration

/ 8
{ 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str 
, 
columns 
: 
table 
=> !
new" %
{ 
Id 
= 
table 
. 
Column %
<% &
long& *
>* +
(+ ,
type, 0
:0 1
$str2 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ D
,D E)
NpgsqlValueGenerationStrategyF c
.c d#
IdentityByDefaultColumnd {
){ |
,| }
	Descricao 
= 
table  %
.% &
Column& ,
<, -
string- 3
>3 4
(4 5
type5 9
:9 :
$str; S
,S T
	maxLengthU ^
:^ _
$num` c
,c d
nullablee m
:m n
falseo t
)t u
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% /
,/ 0
x1 2
=>3 5
x6 7
.7 8
Id8 :
): ;
;; <
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str  
,  !
columns 
: 
table 
=> !
new" %
{ 
Id   
=   
table   
.   
Column   %
<  % &
long  & *
>  * +
(  + ,
type  , 0
:  0 1
$str  2 :
,  : ;
nullable  < D
:  D E
false  F K
)  K L
.!! 

Annotation!! #
(!!# $
$str!!$ D
,!!D E)
NpgsqlValueGenerationStrategy!!F c
.!!c d#
IdentityByDefaultColumn!!d {
)!!{ |
,!!| }
Nome"" 
="" 
table""  
.""  !
Column""! '
<""' (
string""( .
>"". /
(""/ 0
type""0 4
:""4 5
$str""6 N
,""N O
	maxLength""P Y
:""Y Z
$num""[ ^
,""^ _
nullable""` h
:""h i
false""j o
)""o p
,""p q
UsuarioNome## 
=##  !
table##" '
.##' (
Column##( .
<##. /
string##/ 5
>##5 6
(##6 7
type##7 ;
:##; <
$str##= T
,##T U
	maxLength##V _
:##_ `
$num##a c
,##c d
nullable##e m
:##m n
false##o t
)##t u
,##u v
Email$$ 
=$$ 
table$$ !
.$$! "
Column$$" (
<$$( )
string$$) /
>$$/ 0
($$0 1
type$$1 5
:$$5 6
$str$$7 O
,$$O P
	maxLength$$Q Z
:$$Z [
$num$$\ _
,$$_ `
nullable$$a i
:$$i j
false$$k p
)$$p q
,$$q r
Senha%% 
=%% 
table%% !
.%%! "
Column%%" (
<%%( )
string%%) /
>%%/ 0
(%%0 1
type%%1 5
:%%5 6
$str%%7 O
,%%O P
	maxLength%%Q Z
:%%Z [
$num%%\ _
,%%_ `
nullable%%a i
:%%i j
false%%k p
)%%p q
,%%q r
Foto&& 
=&& 
table&&  
.&&  !
Column&&! '
<&&' (
string&&( .
>&&. /
(&&/ 0
type&&0 4
:&&4 5
$str&&6 N
,&&N O
	maxLength&&P Y
:&&Y Z
$num&&[ ^
,&&^ _
nullable&&` h
:&&h i
false&&j o
)&&o p
,&&p q
Tipo'' 
='' 
table''  
.''  !
Column''! '
<''' (
string''( .
>''. /
(''/ 0
type''0 4
:''4 5
$str''6 M
,''M N
	maxLength''O X
:''X Y
$num''Z \
,''\ ]
nullable''^ f
:''f g
false''h m
)''m n
}(( 
,(( 
constraints)) 
:)) 
table)) "
=>))# %
{** 
table++ 
.++ 

PrimaryKey++ $
(++$ %
$str++% 2
,++2 3
x++4 5
=>++6 8
x++9 :
.++: ;
Id++; =
)++= >
;++> ?
},, 
),, 
;,, 
migrationBuilder.. 
... 
CreateTable.. (
(..( )
name// 
:// 
$str// !
,//! "
columns00 
:00 
table00 
=>00 !
new00" %
{11 
Id22 
=22 
table22 
.22 
Column22 %
<22% &
long22& *
>22* +
(22+ ,
type22, 0
:220 1
$str222 :
,22: ;
nullable22< D
:22D E
false22F K
)22K L
.33 

Annotation33 #
(33# $
$str33$ D
,33D E)
NpgsqlValueGenerationStrategy33F c
.33c d#
IdentityByDefaultColumn33d {
)33{ |
,33| }
Titulo44 
=44 
table44 "
.44" #
Column44# )
<44) *
string44* 0
>440 1
(441 2
type442 6
:446 7
$str448 P
,44P Q
	maxLength44R [
:44[ \
$num44] `
,44` a
nullable44b j
:44j k
false44l q
)44q r
,44r s
Texto55 
=55 
table55 !
.55! "
Column55" (
<55( )
string55) /
>55/ 0
(550 1
type551 5
:555 6
$str557 P
,55P Q
	maxLength55R [
:55[ \
$num55] a
,55a b
nullable55c k
:55k l
false55m r
)55r s
,55s t
Data66 
=66 
table66  
.66  !
Column66! '
<66' (
DateTime66( 0
>660 1
(661 2
type662 6
:666 7
$str668 R
,66R S
nullable66T \
:66\ ]
false66^ c
)66c d
,66d e
ResumoIA77 
=77 
table77 $
.77$ %
Column77% +
<77+ ,
string77, 2
>772 3
(773 4
type774 8
:778 9
$str77: S
,77S T
	maxLength77U ^
:77^ _
$num77` d
,77d e
nullable77f n
:77n o
true77p t
)77t u
,77u v
TagsIA88 
=88 
table88 "
.88" #
Column88# )
<88) *
string88* 0
>880 1
(881 2
type882 6
:886 7
$str888 P
,88P Q
	maxLength88R [
:88[ \
$num88] `
,88` a
nullable88b j
:88j k
true88l p
)88p q
,88q r
CategoriaIA99 
=99  !
table99" '
.99' (
Column99( .
<99. /
string99/ 5
>995 6
(996 7
type997 ;
:99; <
$str99= U
,99U V
	maxLength99W `
:99` a
$num99b e
,99e f
nullable99g o
:99o p
true99q u
)99u v
,99v w
	UsuarioId:: 
=:: 
table::  %
.::% &
Column::& ,
<::, -
long::- 1
>::1 2
(::2 3
type::3 7
:::7 8
$str::9 A
,::A B
nullable::C K
:::K L
false::M R
)::R S
,::S T
TemaId;; 
=;; 
table;; "
.;;" #
Column;;# )
<;;) *
long;;* .
>;;. /
(;;/ 0
type;;0 4
:;;4 5
$str;;6 >
,;;> ?
nullable;;@ H
:;;H I
false;;J O
);;O P
}<< 
,<< 
constraints== 
:== 
table== "
=>==# %
{>> 
table?? 
.?? 

PrimaryKey?? $
(??$ %
$str??% 3
,??3 4
x??5 6
=>??7 9
x??: ;
.??; <
Id??< >
)??> ?
;??? @
table@@ 
.@@ 

ForeignKey@@ $
(@@$ %
nameAA 
:AA 
$strAA 9
,AA9 :
columnBB 
:BB 
xBB  !
=>BB" $
xBB% &
.BB& '
TemaIdBB' -
,BB- .
principalTableCC &
:CC& '
$strCC( /
,CC/ 0
principalColumnDD '
:DD' (
$strDD) -
,DD- .
onDeleteEE  
:EE  !
ReferentialActionEE" 3
.EE3 4
RestrictEE4 <
)EE< =
;EE= >
tableFF 
.FF 

ForeignKeyFF $
(FF$ %
nameGG 
:GG 
$strGG ?
,GG? @
columnHH 
:HH 
xHH  !
=>HH" $
xHH% &
.HH& '
	UsuarioIdHH' 0
,HH0 1
principalTableII &
:II& '
$strII( 2
,II2 3
principalColumnJJ '
:JJ' (
$strJJ) -
,JJ- .
onDeleteKK  
:KK  !
ReferentialActionKK" 3
.KK3 4
RestrictKK4 <
)KK< =
;KK= >
}LL 
)LL 
;LL 
migrationBuilderNN 
.NN 
CreateIndexNN (
(NN( )
nameOO 
:OO 
$strOO +
,OO+ ,
tablePP 
:PP 
$strPP "
,PP" #
columnQQ 
:QQ 
$strQQ  
)QQ  !
;QQ! "
migrationBuilderSS 
.SS 
CreateIndexSS (
(SS( )
nameTT 
:TT 
$strTT .
,TT. /
tableUU 
:UU 
$strUU "
,UU" #
columnVV 
:VV 
$strVV #
)VV# $
;VV$ %
migrationBuilderXX 
.XX 
CreateIndexXX (
(XX( )
nameYY 
:YY 
$strYY )
,YY) *
tableZZ 
:ZZ 
$strZZ !
,ZZ! "
column[[ 
:[[ 
$str[[ 
,[[  
unique\\ 
:\\ 
true\\ 
)\\ 
;\\ 
}]] 	
	protected`` 
override`` 
void`` 
Down``  $
(``$ %
MigrationBuilder``% 5
migrationBuilder``6 F
)``F G
{aa 	
migrationBuilderbb 
.bb 
	DropTablebb &
(bb& '
namecc 
:cc 
$strcc !
)cc! "
;cc" #
migrationBuilderee 
.ee 
	DropTableee &
(ee& '
nameff 
:ff 
$strff 
)ff 
;ff 
migrationBuilderhh 
.hh 
	DropTablehh &
(hh& '
nameii 
:ii 
$strii  
)ii  !
;ii! "
}jj 	
}kk 
}ll π
HC:\Dev\BlogPessoalBackend\BlogPessoal\Middlewares\ExceptionMiddleware.cs
	namespace 	
BlogPessoal
 
. 
Middlewares !
;! "
public 
class 
ExceptionMiddleware  
(  !
RequestDelegate! 0
next1 5
,5 6
ILogger7 >
<> ?
ExceptionMiddleware? R
>R S
loggerT Z
)Z [
{ 
public 

async 
Task 
InvokeAsync !
(! "
HttpContext" -
context. 5
)5 6
{		 
try

 
{ 	
await 
next 
( 
context 
) 
;  
} 	
catch 
( 
	Exception 
	exception "
)" #
{ 	
logger 
. 
LogError 
( 
	exception %
,% &
$str' A
)A B
;B C
context 
. 
Response 
. 
ContentType (
=) *
$str+ =
;= >
context 
. 
Response 
. 

StatusCode '
=( )
(* +
int+ .
). /
HttpStatusCode/ =
.= >
InternalServerError> Q
;Q R
var 
resposta 
= 
new 
{ 
status 
= 
context  
.  !
Response! )
.) *

StatusCode* 4
,4 5
mensagem 
= 
$str B
,B C
detalhe 
= 
$str 7
} 
; 
var 
json 
= 
JsonSerializer %
.% &
	Serialize& /
(/ 0
resposta0 8
)8 9
;9 :
await 
context 
. 
Response "
." #

WriteAsync# -
(- .
json. 2
)2 3
;3 4
} 	
}   
}!! 
>C:\Dev\BlogPessoalBackend\BlogPessoal\DTOs\UsuarioUpdateDto.cs
	namespace 	
BlogPessoal
 
. 
DTOs 
; 
public 
class 
UsuarioUpdateDto 
{ 
[ 
Required 
( 
ErrorMessage 
= 
$str 4
)4 5
]5 6
[ 
StringLength 
( 
$num 
, 
ErrorMessage #
=$ %
$str& Q
)Q R
]R S
public		 

string		 
Nome		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
=		% &
string		' -
.		- .
Empty		. 3
;		3 4
[ 
Required 
( 
ErrorMessage 
= 
$str ?
)? @
]@ A
[ 
StringLength 
( 
$num 
, 
ErrorMessage "
=# $
$str% Z
)Z [
][ \
public 

string 
UsuarioNome 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
[ 
StringLength 
( 
$num 
, 
ErrorMessage #
=$ %
$str& Q
)Q R
]R S
public 

string 
Foto 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
[ 
StringLength 
( 
$num 
, 
ErrorMessage "
=# $
$str% O
)O P
]P Q
public 

string 
Tipo 
{ 
get 
; 
set !
;! "
}# $
=% &
$str' /
;/ 0
} ∑
@C:\Dev\BlogPessoalBackend\BlogPessoal\DTOs\UsuarioResponseDto.cs
	namespace 	
BlogPessoal
 
. 
DTOs 
; 
public 
class 
UsuarioResponseDto 
{ 
public 

long 
Id 
{ 
get 
; 
set 
; 
}  
public 

string 
Nome 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
public		 

string		 
UsuarioNome		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
=		, -
string		. 4
.		4 5
Empty		5 :
;		: ;
public 

string 
Email 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
public 

string 
Foto 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
public 

string 
Tipo 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
} ‡
EC:\Dev\BlogPessoalBackend\BlogPessoal\DTOs\UsuarioLoginResponseDto.cs
	namespace 	
BlogPessoal
 
. 
DTOs 
; 
public 
class #
UsuarioLoginResponseDto $
{ 
public 

long 
Id 
{ 
get 
; 
set 
; 
}  
public 

string 
Nome 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
public		 

string		 
UsuarioNome		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
=		, -
string		. 4
.		4 5
Empty		5 :
;		: ;
public 

string 
Email 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
public 

string 
Tipo 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
public 

string 
Token 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
public 

DateTime 
ExpiraEm 
{ 
get "
;" #
set$ '
;' (
}) *
} ˛
=C:\Dev\BlogPessoalBackend\BlogPessoal\DTOs\UsuarioLoginDto.cs
	namespace 	
BlogPessoal
 
. 
DTOs 
; 
public 
class 
UsuarioLoginDto 
{ 
[ 
Required 
( 
ErrorMessage 
= 
$str 6
)6 7
]7 8
[ 
EmailAddress 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
public		 

string		 
Email		 
{		 
get		 
;		 
set		 "
;		" #
}		$ %
=		& '
string		( .
.		. /
Empty		/ 4
;		4 5
[ 
Required 
( 
ErrorMessage 
= 
$str 5
)5 6
]6 7
public 

string 
Senha 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
} Ó
<C:\Dev\BlogPessoalBackend\BlogPessoal\DTOs\TextoIARequest.cs
	namespace 	
BlogPessoal
 
. 
DTOs 
; 
public 
class 
TextoIARequest 
{ 
[ 
Required 
( 
ErrorMessage 
= 
$str 5
)5 6
]6 7
[ 
StringLength 
( 
$num 
, 
MinimumLength %
=& '
$num( *
,* +
ErrorMessage, 8
=9 :
$str; i
)i j
]j k
public		 

string		 
Texto		 
{		 
get		 
;		 
set		 "
;		" #
}		$ %
=		& '
string		( .
.		. /
Empty		/ 4
;		4 5
}

 §
>C:\Dev\BlogPessoalBackend\BlogPessoal\DTOs\UsuarioCreateDto.cs
	namespace 	
BlogPessoal
 
. 
DTOs 
; 
public 
class 
UsuarioCreateDto 
{ 
[ 
Required 
( 
ErrorMessage 
= 
$str 4
)4 5
]5 6
[ 
StringLength 
( 
$num 
, 
ErrorMessage #
=$ %
$str& Q
)Q R
]R S
public		 

string		 
Nome		 
{		 
get		 
;		 
set		 !
;		! "
}		# $
=		% &
string		' -
.		- .
Empty		. 3
;		3 4
[ 
Required 
( 
ErrorMessage 
= 
$str ?
)? @
]@ A
[ 
StringLength 
( 
$num 
, 
ErrorMessage "
=# $
$str% Z
)Z [
][ \
public 

string 
UsuarioNome 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
[ 
Required 
( 
ErrorMessage 
= 
$str 6
)6 7
]7 8
[ 
EmailAddress 
( 
ErrorMessage 
=  
$str! <
)< =
]= >
[ 
StringLength 
( 
$num 
, 
ErrorMessage #
=$ %
$str& S
)S T
]T U
public 

string 
Email 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
[ 
Required 
( 
ErrorMessage 
= 
$str 5
)5 6
]6 7
[ 
StringLength 
( 
$num 
, 
MinimumLength $
=% &
$num' (
,( )
ErrorMessage* 6
=7 8
$str9 e
)e f
]f g
public 

string 
Senha 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
[ 
StringLength 
( 
$num 
, 
ErrorMessage #
=$ %
$str& Q
)Q R
]R S
public 

string 
Foto 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
[ 
StringLength 
( 
$num 
, 
ErrorMessage "
=# $
$str% O
)O P
]P Q
public 

string 
Tipo 
{ 
get 
; 
set !
;! "
}# $
=% &
$str' /
;/ 0
} ‰
5C:\Dev\BlogPessoalBackend\BlogPessoal\DTOs\TemaDto.cs
	namespace 	
BlogPessoal
 
. 
DTOs 
; 
public 
class 
TemaDto 
{ 
[ 
Required 
( 
ErrorMessage 
= 
$str A
)A B
]B C
[ 
StringLength 
( 
$num 
, 
MinimumLength $
=% &
$num' (
,( )
ErrorMessage* 6
=7 8
$str9 i
)i j
]j k
public		 

string		 
	Descricao		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
=		* +
string		, 2
.		2 3
Empty		3 8
;		8 9
}

 º
9C:\Dev\BlogPessoalBackend\BlogPessoal\DTOs\ResultadoIA.cs
	namespace 	
BlogPessoal
 
. 
DTOs 
; 
public 
class 
ResultadoIA 
{ 
public 

string 
Resumo 
{ 
get 
; 
set  #
;# $
}% &
=' (
string) /
./ 0
Empty0 5
;5 6
public 

string 
Tags 
{ 
get 
; 
set !
;! "
}# $
=% &
string' -
.- .
Empty. 3
;3 4
public		 

string		 
	Categoria		 
{		 
get		 !
;		! "
set		# &
;		& '
}		( )
=		* +
string		, 2
.		2 3
Empty		3 8
;		8 9
}

 ı
?C:\Dev\BlogPessoalBackend\BlogPessoal\DTOs\PostagemUpdateDto.cs
	namespace 	
BlogPessoal
 
. 
DTOs 
; 
public 
class 
PostagemUpdateDto 
{ 
[ 
Required 
( 
ErrorMessage 
= 
$str B
)B C
]C D
[ 
StringLength 
( 
$num 
, 
MinimumLength $
=% &
$num' (
,( )
ErrorMessage* 6
=7 8
$str9 f
)f g
]g h
public		 

string		 
Titulo		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
=		' (
string		) /
.		/ 0
Empty		0 5
;		5 6
[ 
Required 
( 
ErrorMessage 
= 
$str A
)A B
]B C
[ 
StringLength 
( 
$num 
, 
MinimumLength %
=& '
$num( *
,* +
ErrorMessage, 8
=9 :
$str; i
)i j
]j k
public 

string 
Texto 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
[ 
Range 

(
 
$num 
, 
long 
. 
MaxValue 
, 
ErrorMessage )
=* +
$str, E
)E F
]F G
public 

long 
TemaId 
{ 
get 
; 
set !
;! "
}# $
} ß
AC:\Dev\BlogPessoalBackend\BlogPessoal\DTOs\PostagemResponseDto.cs
	namespace 	
BlogPessoal
 
. 
DTOs 
; 
public 
class 
PostagemResponseDto  
{ 
public 

long 
Id 
{ 
get 
; 
set 
; 
}  
public 

string 
Titulo 
{ 
get 
; 
set  #
;# $
}% &
=' (
string) /
./ 0
Empty0 5
;5 6
public		 

string		 
Texto		 
{		 
get		 
;		 
set		 "
;		" #
}		$ %
=		& '
string		( .
.		. /
Empty		/ 4
;		4 5
public 

DateTime 
Data 
{ 
get 
; 
set  #
;# $
}% &
public 

string 
? 
ResumoIA 
{ 
get !
;! "
set# &
;& '
}( )
public 

string 
? 
TagsIA 
{ 
get 
;  
set! $
;$ %
}& '
public 

string 
? 
CategoriaIA 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 

long 
	UsuarioId 
{ 
get 
;  
set! $
;$ %
}& '
public 

string 
UsuarioNome 
{ 
get  #
;# $
set% (
;( )
}* +
=, -
string. 4
.4 5
Empty5 :
;: ;
public 

long 
TemaId 
{ 
get 
; 
set !
;! "
}# $
public 

string 
TemaDescricao 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
string0 6
.6 7
Empty7 <
;< =
} ı
?C:\Dev\BlogPessoalBackend\BlogPessoal\DTOs\PostagemCreateDto.cs
	namespace 	
BlogPessoal
 
. 
DTOs 
; 
public 
class 
PostagemCreateDto 
{ 
[ 
Required 
( 
ErrorMessage 
= 
$str B
)B C
]C D
[ 
StringLength 
( 
$num 
, 
MinimumLength $
=% &
$num' (
,( )
ErrorMessage* 6
=7 8
$str9 f
)f g
]g h
public		 

string		 
Titulo		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
=		' (
string		) /
.		/ 0
Empty		0 5
;		5 6
[ 
Required 
( 
ErrorMessage 
= 
$str A
)A B
]B C
[ 
StringLength 
( 
$num 
, 
MinimumLength %
=& '
$num( *
,* +
ErrorMessage, 8
=9 :
$str; i
)i j
]j k
public 

string 
Texto 
{ 
get 
; 
set "
;" #
}$ %
=& '
string( .
.. /
Empty/ 4
;4 5
[ 
Range 

(
 
$num 
, 
long 
. 
MaxValue 
, 
ErrorMessage )
=* +
$str, E
)E F
]F G
public 

long 
TemaId 
{ 
get 
; 
set !
;! "
}# $
} Ü
:C:\Dev\BlogPessoalBackend\BlogPessoal\Data\AppDbContext.cs
	namespace 	
BlogPessoal
 
. 
Data 
; 
public 
class 
AppDbContext 
( 
DbContextOptions *
<* +
AppDbContext+ 7
>7 8
options9 @
)@ A
:B C
	DbContextD M
(M N
optionsN U
)U V
{ 
public 

DbSet 
< 
Usuario 
> 
Usuarios "
=># %
Set& )
<) *
Usuario* 1
>1 2
(2 3
)3 4
;4 5
public

 

DbSet

 
<

 
Tema

 
>

 
Temas

 
=>

 
Set

  #
<

# $
Tema

$ (
>

( )
(

) *
)

* +
;

+ ,
public 

DbSet 
< 
Postagem 
> 
	Postagens $
=>% '
Set( +
<+ ,
Postagem, 4
>4 5
(5 6
)6 7
;7 8
	protected 
override 
void 
OnModelCreating +
(+ ,
ModelBuilder, 8
modelBuilder9 E
)E F
{ 
base 
. 
OnModelCreating 
( 
modelBuilder )
)) *
;* +
modelBuilder 
. 
Entity 
< 
Usuario #
># $
($ %
)% &
. 
HasIndex 
( 
usuario 
=>  
usuario! (
.( )
Email) .
). /
. 
IsUnique 
( 
) 
; 
modelBuilder 
. 
Entity 
< 
Postagem $
>$ %
(% &
)& '
. 
HasOne 
( 
postagem 
=> 
postagem  (
.( )
Usuario) 0
)0 1
. 
WithMany 
( 
usuario 
=>  
usuario! (
.( )
	Postagens) 2
)2 3
. 
HasForeignKey 
( 
postagem #
=>$ &
postagem' /
./ 0
	UsuarioId0 9
)9 :
. 
OnDelete 
( 
DeleteBehavior $
.$ %
Restrict% -
)- .
;. /
modelBuilder 
. 
Entity 
< 
Postagem $
>$ %
(% &
)& '
. 
HasOne 
( 
postagem 
=> 
postagem  (
.( )
Tema) -
)- .
. 
WithMany 
( 
tema 
=> 
tema "
." #
	Postagens# ,
), -
. 
HasForeignKey 
( 
postagem #
=>$ &
postagem' /
./ 0
TemaId0 6
)6 7
.   
OnDelete   
(   
DeleteBehavior   $
.  $ %
Restrict  % -
)  - .
;  . /
}!! 
}"" ø)
GC:\Dev\BlogPessoalBackend\BlogPessoal\Controllers\UsuariosController.cs
	namespace 	
BlogPessoal
 
. 
Controllers !
;! "
[ 
ApiController 
] 
[		 
Route		 
(		 
$str		 
)		 
]		 
public

 
class

 
UsuariosController

 
(

  
UsuarioService

  .
service

/ 6
)

6 7
:

8 9
ControllerBase

: H
{ 
[ 
	Authorize 
( 
Roles 
= 
$str 
) 
]  
[ 
HttpGet 
] 
public 

async 
Task 
< 
IActionResult #
># $
Listar% +
(+ ,
), -
{ 
var 
usuarios 
= 
await 
service $
.$ %
ListarAsync% 0
(0 1
)1 2
;2 3
return 
Ok 
( 
usuarios 
) 
; 
} 
[ 
	Authorize 
] 
[ 
HttpGet 
( 
$str 
) 
] 
public 

async 
Task 
< 
IActionResult #
># $
BuscarPorId% 0
(0 1
long1 5
id6 8
)8 9
{ 
var 
usuario 
= 
await 
service #
.# $
BuscarPorIdAsync$ 4
(4 5
id5 7
)7 8
;8 9
if 

( 
usuario 
is 
null 
) 
{ 	
return 
NotFound 
( 
) 
; 
} 	
return   
Ok   
(   
usuario   
)   
;   
}!! 
[## 
HttpPost## 
]## 
public$$ 

async$$ 
Task$$ 
<$$ 
IActionResult$$ #
>$$# $
Criar$$% *
($$* +
[$$+ ,
FromBody$$, 4
]$$4 5
UsuarioCreateDto$$6 F
dto$$G J
)$$J K
{%% 
var&& 
usuario&& 
=&& 
await&& 
service&& #
.&&# $

CriarAsync&&$ .
(&&. /
dto&&/ 2
)&&2 3
;&&3 4
if(( 

((( 
usuario(( 
is(( 
null(( 
)(( 
{)) 	
return** 
Conflict** 
(** 
new** 
{++ 
mensagem,, 
=,, 
$str,, M
}-- 
)-- 
;-- 
}.. 	
return00 
CreatedAtAction00 
(00 
nameof00 %
(00% &
BuscarPorId00& 1
)001 2
,002 3
new004 7
{008 9
id00: <
=00= >
usuario00? F
.00F G
Id00G I
}00J K
,00K L
usuario00M T
)00T U
;00U V
}11 
[33 
	Authorize33 
]33 
[44 
HttpPut44 
(44 
$str44 
)44 
]44 
public55 

async55 
Task55 
<55 
IActionResult55 #
>55# $
	Atualizar55% .
(55. /
long55/ 3
id554 6
,556 7
[558 9
FromBody559 A
]55A B
UsuarioUpdateDto55C S
dto55T W
)55W X
{66 
var77 
usuario77 
=77 
await77 
service77 #
.77# $
AtualizarAsync77$ 2
(772 3
id773 5
,775 6
dto777 :
)77: ;
;77; <
if99 

(99 
usuario99 
is99 
null99 
)99 
{:: 	
return;; 
NotFound;; 
(;; 
);; 
;;; 
}<< 	
return>> 
Ok>> 
(>> 
usuario>> 
)>> 
;>> 
}?? 
[AA 
	AuthorizeAA 
(AA 
RolesAA 
=AA 
$strAA 
)AA 
]AA  
[BB 

HttpDeleteBB 
(BB 
$strBB 
)BB 
]BB 
publicCC 

asyncCC 
TaskCC 
<CC 
IActionResultCC #
>CC# $
DeletarCC% ,
(CC, -
longCC- 1
idCC2 4
)CC4 5
{DD 
varEE 
deletadoEE 
=EE 
awaitEE 
serviceEE $
.EE$ %
DeletarAsyncEE% 1
(EE1 2
idEE2 4
)EE4 5
;EE5 6
ifGG 

(GG 
!GG 
deletadoGG 
)GG 
{HH 	
returnII 
NotFoundII 
(II 
)II 
;II 
}JJ 	
returnLL 
	NoContentLL 
(LL 
)LL 
;LL 
}MM 
}NN º%
DC:\Dev\BlogPessoalBackend\BlogPessoal\Controllers\TemasController.cs
	namespace 	
BlogPessoal
 
. 
Controllers !
;! "
[ 
ApiController 
] 
[		 
Route		 
(		 
$str		 
)		 
]		 
public

 
class

 
TemasController

 
(

 
TemaService

 (
service

) 0
)

0 1
:

2 3
ControllerBase

4 B
{ 
[ 
HttpGet 
] 
public 

async 
Task 
< 
IActionResult #
># $
Listar% +
(+ ,
), -
{ 
var 
temas 
= 
await 
service !
.! "
ListarAsync" -
(- .
). /
;/ 0
return 
Ok 
( 
temas 
) 
; 
} 
[ 
HttpGet 
( 
$str 
) 
] 
public 

async 
Task 
< 
IActionResult #
># $
BuscarPorId% 0
(0 1
long1 5
id6 8
)8 9
{ 
var 
tema 
= 
await 
service  
.  !
BuscarPorIdAsync! 1
(1 2
id2 4
)4 5
;5 6
if 

( 
tema 
is 
null 
) 
{ 	
return 
NotFound 
( 
) 
; 
} 	
return 
Ok 
( 
tema 
) 
; 
} 
[!! 
	Authorize!! 
]!! 
["" 
HttpPost"" 
]"" 
public## 

async## 
Task## 
<## 
IActionResult## #
>### $
Criar##% *
(##* +
[##+ ,
FromBody##, 4
]##4 5
TemaDto##6 =
dto##> A
)##A B
{$$ 
var%% 
tema%% 
=%% 
await%% 
service%%  
.%%  !

CriarAsync%%! +
(%%+ ,
dto%%, /
)%%/ 0
;%%0 1
return'' 
CreatedAtAction'' 
('' 
nameof'' %
(''% &
BuscarPorId''& 1
)''1 2
,''2 3
new''4 7
{''8 9
id'': <
=''= >
tema''? C
.''C D
Id''D F
}''G H
,''H I
tema''J N
)''N O
;''O P
}(( 
[** 
	Authorize** 
]** 
[++ 
HttpPut++ 
(++ 
$str++ 
)++ 
]++ 
public,, 

async,, 
Task,, 
<,, 
IActionResult,, #
>,,# $
	Atualizar,,% .
(,,. /
long,,/ 3
id,,4 6
,,,6 7
[,,8 9
FromBody,,9 A
],,A B
TemaDto,,C J
dto,,K N
),,N O
{-- 
var.. 
tema.. 
=.. 
await.. 
service..  
...  !
AtualizarAsync..! /
(../ 0
id..0 2
,..2 3
dto..4 7
)..7 8
;..8 9
if00 

(00 
tema00 
is00 
null00 
)00 
{11 	
return22 
NotFound22 
(22 
)22 
;22 
}33 	
return55 
Ok55 
(55 
tema55 
)55 
;55 
}66 
[88 
	Authorize88 
(88 
Roles88 
=88 
$str88 
)88 
]88  
[99 

HttpDelete99 
(99 
$str99 
)99 
]99 
public:: 

async:: 
Task:: 
<:: 
IActionResult:: #
>::# $
Deletar::% ,
(::, -
long::- 1
id::2 4
)::4 5
{;; 
var<< 
deletado<< 
=<< 
await<< 
service<< $
.<<$ %
DeletarAsync<<% 1
(<<1 2
id<<2 4
)<<4 5
;<<5 6
if>> 

(>> 
!>> 
deletado>> 
)>> 
{?? 	
return@@ 
NotFound@@ 
(@@ 
)@@ 
;@@ 
}AA 	
returnCC 
	NoContentCC 
(CC 
)CC 
;CC 
}DD 
}EE Ã4
HC:\Dev\BlogPessoalBackend\BlogPessoal\Controllers\PostagensController.cs
	namespace 	
BlogPessoal
 
. 
Controllers !
;! "
[		 
	Authorize		 

]		
 
[

 
ApiController

 
]

 
[ 
Route 
( 
$str 
) 
] 
public 
class 
PostagensController  
(  !
PostagemService! 0
service1 8
)8 9
:: ;
ControllerBase< J
{ 
[ 
HttpGet 
] 
public 

async 
Task 
< 
IActionResult #
># $
Listar% +
(+ ,
), -
{ 
var 
	postagens 
= 
await 
service %
.% &
ListarAsync& 1
(1 2
)2 3
;3 4
return 
Ok 
( 
	postagens 
) 
; 
} 
[ 
HttpGet 
( 
$str 
) 
] 
public 

async 
Task 
< 
IActionResult #
># $
BuscarPorId% 0
(0 1
long1 5
id6 8
)8 9
{ 
var 
postagem 
= 
await 
service $
.$ %
BuscarPorIdAsync% 5
(5 6
id6 8
)8 9
;9 :
if 

( 
postagem 
is 
null 
) 
{ 	
return 
NotFound 
( 
) 
; 
} 	
return   
Ok   
(   
postagem   
)   
;   
}!! 
[## 
HttpGet## 
(## 
$str## '
)##' (
]##( )
public$$ 

async$$ 
Task$$ 
<$$ 
IActionResult$$ #
>$$# $
BuscarPorUsuario$$% 5
($$5 6
long$$6 :
	usuarioId$$; D
)$$D E
{%% 
var&& 
	postagens&& 
=&& 
await&& 
service&& %
.&&% &!
BuscarPorUsuarioAsync&&& ;
(&&; <
	usuarioId&&< E
)&&E F
;&&F G
return(( 
Ok(( 
((( 
	postagens(( 
)(( 
;(( 
})) 
[++ 
HttpGet++ 
(++ 
$str++ !
)++! "
]++" #
public,, 

async,, 
Task,, 
<,, 
IActionResult,, #
>,,# $
BuscarPorTema,,% 2
(,,2 3
long,,3 7
temaId,,8 >
),,> ?
{-- 
var.. 
	postagens.. 
=.. 
await.. 
service.. %
...% &
BuscarPorTemaAsync..& 8
(..8 9
temaId..9 ?
)..? @
;..@ A
return00 
Ok00 
(00 
	postagens00 
)00 
;00 
}11 
[33 
HttpPost33 
]33 
public44 

async44 
Task44 
<44 
IActionResult44 #
>44# $
Criar44% *
(44* +
[44+ ,
FromBody44, 4
]444 5
PostagemCreateDto446 G
dto44H K
)44K L
{55 
var66 
usuarioIdClaim66 
=66 
User66 !
.66! "
FindFirstValue66" 0
(660 1

ClaimTypes661 ;
.66; <
NameIdentifier66< J
)66J K
;66K L
if88 

(88 
!88 
long88 
.88 
TryParse88 
(88 
usuarioIdClaim88 )
,88) *
out88+ .
var88/ 2
	usuarioId883 <
)88< =
)88= >
{99 	
return:: 
Unauthorized:: 
(::  
new::  #
{;; 
mensagem<< 
=<< 
$str<< H
}== 
)== 
;== 
}>> 	
var@@ 
postagem@@ 
=@@ 
await@@ 
service@@ $
.@@$ %

CriarAsync@@% /
(@@/ 0
dto@@0 3
,@@3 4
	usuarioId@@5 >
)@@> ?
;@@? @
returnBB 
CreatedAtActionBB 
(BB 
nameofBB %
(BB% &
BuscarPorIdBB& 1
)BB1 2
,BB2 3
newBB4 7
{BB8 9
idBB: <
=BB= >
postagemBB? G
.BBG H
IdBBH J
}BBK L
,BBL M
postagemBBN V
)BBV W
;BBW X
}CC 
[EE 
HttpPutEE 
(EE 
$strEE 
)EE 
]EE 
publicFF 

asyncFF 
TaskFF 
<FF 
IActionResultFF #
>FF# $
	AtualizarFF% .
(FF. /
longFF/ 3
idFF4 6
,FF6 7
[FF8 9
FromBodyFF9 A
]FFA B
PostagemUpdateDtoFFC T
dtoFFU X
)FFX Y
{GG 
varHH 
postagemHH 
=HH 
awaitHH 
serviceHH $
.HH$ %
AtualizarAsyncHH% 3
(HH3 4
idHH4 6
,HH6 7
dtoHH8 ;
)HH; <
;HH< =
ifJJ 

(JJ 
postagemJJ 
isJJ 
nullJJ 
)JJ 
{KK 	
returnLL 
NotFoundLL 
(LL 
)LL 
;LL 
}MM 	
returnOO 
OkOO 
(OO 
postagemOO 
)OO 
;OO 
}PP 
[RR 

HttpDeleteRR 
(RR 
$strRR 
)RR 
]RR 
publicSS 

asyncSS 
TaskSS 
<SS 
IActionResultSS #
>SS# $
DeletarSS% ,
(SS, -
longSS- 1
idSS2 4
)SS4 5
{TT 
varUU 
deletadoUU 
=UU 
awaitUU 
serviceUU $
.UU$ %
DeletarAsyncUU% 1
(UU1 2
idUU2 4
)UU4 5
;UU5 6
ifWW 

(WW 
!WW 
deletadoWW 
)WW 
{XX 	
returnYY 
NotFoundYY 
(YY 
)YY 
;YY 
}ZZ 	
return\\ 
	NoContent\\ 
(\\ 
)\\ 
;\\ 
}]] 
}^^ ¥

AC:\Dev\BlogPessoalBackend\BlogPessoal\Controllers\IAController.cs
	namespace 	
BlogPessoal
 
. 
Controllers !
;! "
[ 
	Authorize 

]
 
[		 
ApiController		 
]		 
[

 
Route

 
(

 
$str

 
)

 
]

 
public 
class 
IAController 
( 
IGeminiService (
geminiService) 6
)6 7
:8 9
ControllerBase: H
{ 
[ 
HttpPost 
( 
$str 
) 
] 
public 

async 
Task 
< 
IActionResult #
># $
Resumir% ,
(, -
[- .
FromBody. 6
]6 7
TextoIARequest8 F
requestG N
)N O
{ 
var 
	resultado 
= 
await 
geminiService +
.+ ,
GerarResumoAsync, <
(< =
request= D
.D E
TextoE J
)J K
;K L
return 
Ok 
( 
	resultado 
) 
; 
} 
} ã
CC:\Dev\BlogPessoalBackend\BlogPessoal\Controllers\AuthController.cs
	namespace 	
BlogPessoal
 
. 
Controllers !
;! "
[ 
ApiController 
] 
[ 
Route 
( 
$str 
) 
] 
public		 
class		 
AuthController		 
(		 
AuthService		 '
service		( /
)		/ 0
:		1 2
ControllerBase		3 A
{

 
[ 
HttpPost 
( 
$str 
) 
] 
public 

async 
Task 
< 
IActionResult #
># $
Login% *
(* +
[+ ,
FromBody, 4
]4 5
UsuarioLoginDto6 E
dtoF I
)I J
{ 
var 
	resultado 
= 
await 
service %
.% &

LoginAsync& 0
(0 1
dto1 4
)4 5
;5 6
if 

( 
	resultado 
is 
null 
) 
{ 	
return 
Unauthorized 
(  
new  #
{ 
mensagem 
= 
$str 7
} 
) 
; 
} 	
return 
Ok 
( 
	resultado 
) 
; 
} 
} û
=C:\Dev\BlogPessoalBackend\BlogPessoal\Config\SwaggerConfig.cs
	namespace 	
BlogPessoal
 
. 
Config 
; 
public 
static 
class 
SwaggerConfig !
{ 
public 

static 
IServiceCollection $#
AddSwaggerConfiguration% <
(< =
this= A
IServiceCollectionB T
servicesU ]
)] ^
{ 
services		 
.		 #
AddEndpointsApiExplorer		 (
(		( )
)		) *
;		* +
services 
. 
AddSwaggerGen 
( 
options &
=>' )
{ 	
options 
. 

SwaggerDoc 
( 
$str #
,# $
new% (
OpenApiInfo) 4
{ 
Title 
= 
$str -
,- .
Version 
= 
$str 
, 
Description 
= 
$str x
,x y
Contact 
= 
new 
OpenApiContact ,
{ 
Name 
= 
$str (
} 
} 
) 
; 
options 
. !
AddSecurityDefinition )
() *
$str* 2
,2 3
new4 7!
OpenApiSecurityScheme8 M
{ 
Name 
= 
$str &
,& '
Description 
= 
$str R
,R S
In 
= 
ParameterLocation &
.& '
Header' -
,- .
Type 
= 
SecuritySchemeType )
.) *
ApiKey* 0
,0 1
Scheme 
= 
$str !
} 
) 
; 
}   	
)  	 

;  
 
return"" 
services"" 
;"" 
}## 
public%% 

static%% 
WebApplication%%  #
UseSwaggerConfiguration%%! 8
(%%8 9
this%%9 =
WebApplication%%> L
app%%M P
)%%P Q
{&& 
if'' 

('' 
app'' 
.'' 
Environment'' 
.'' 
IsDevelopment'' )
('') *
)''* +
)''+ ,
{(( 	
app)) 
.)) 

UseSwagger)) 
()) 
))) 
;)) 
app++ 
.++ 
UseSwaggerUI++ 
(++ 
options++ $
=>++% '
{,, 
options-- 
.-- 
SwaggerEndpoint-- '
(--' (
$str--( B
,--B C
$str--D Y
)--Y Z
;--Z [
options.. 
... 
RoutePrefix.. #
=..$ %
$str..& /
;../ 0
options// 
.// 
DocumentTitle// %
=//& '
$str//( =
;//= >
}00 
)00 
;00 
}11 	
return33 
app33 
;33 
}44 
}55 ê	
;C:\Dev\BlogPessoalBackend\BlogPessoal\Config\JwtSettings.cs
	namespace 	
BlogPessoal
 
. 
Config 
; 
public 
class 
JwtSettings 
{ 
public 

string 
Key 
{ 
get 
; 
set  
;  !
}" #
=$ %
string& ,
., -
Empty- 2
;2 3
public 

string 
Issuer 
{ 
get 
; 
set  #
;# $
}% &
=' (
string) /
./ 0
Empty0 5
;5 6
public		 

string		 
Audience		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
=		) *
string		+ 1
.		1 2
Empty		2 7
;		7 8
public 

int 
ExpirationMinutes  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
$num1 4
;4 5
} ﬁ
9C:\Dev\BlogPessoalBackend\BlogPessoal\Config\JwtConfig.cs
	namespace 	
BlogPessoal
 
. 
Config 
; 
public 
static 
class 
	JwtConfig 
{ 
public		 

static		 
IServiceCollection		 $
AddJwtConfiguration		% 8
(		8 9
this

 
IServiceCollection

 
services

  (
,

( )
IConfiguration 
configuration $
)$ %
{ 
services 
. 
	Configure 
< 
JwtSettings &
>& '
(' (
configuration( 5
.5 6

GetSection6 @
(@ A
$strA F
)F G
)G H
;H I
var 
jwtSettings 
= 
configuration '
. 

GetSection 
( 
$str 
) 
. 
Get 
< 
JwtSettings 
> 
( 
) 
??  "
new# &
JwtSettings' 2
(2 3
)3 4
;4 5
var 
key 
= 
Encoding 
. 
UTF8 
.  
GetBytes  (
(( )
jwtSettings) 4
.4 5
Key5 8
)8 9
;9 :
services 
. 
AddAuthentication 
( 
options &
=>' )
{ 
options 
. %
DefaultAuthenticateScheme 1
=2 3
JwtBearerDefaults4 E
.E F 
AuthenticationSchemeF Z
;Z [
options 
. "
DefaultChallengeScheme .
=/ 0
JwtBearerDefaults1 B
.B C 
AuthenticationSchemeC W
;W X
} 
) 
. 
AddJwtBearer 
( 
options !
=>" $
{ 
options 
.  
RequireHttpsMetadata ,
=- .
false/ 4
;4 5
options 
. 
	SaveToken !
=" #
true$ (
;( )
options   
.   %
TokenValidationParameters   1
=  2 3
new  4 7%
TokenValidationParameters  8 Q
{!! $
ValidateIssuerSigningKey"" ,
=""- .
true""/ 3
,""3 4
IssuerSigningKey## $
=##% &
new##' * 
SymmetricSecurityKey##+ ?
(##? @
key##@ C
)##C D
,##D E
ValidateIssuer%% "
=%%# $
true%%% )
,%%) *
ValidIssuer&& 
=&&  !
jwtSettings&&" -
.&&- .
Issuer&&. 4
,&&4 5
ValidateAudience(( $
=((% &
true((' +
,((+ ,
ValidAudience)) !
=))" #
jwtSettings))$ /
.))/ 0
Audience))0 8
,))8 9
ValidateLifetime++ $
=++% &
true++' +
,+++ ,
	ClockSkew,, 
=,, 
TimeSpan,,  (
.,,( )
Zero,,) -
}-- 
;-- 
}.. 
).. 
;.. 
services00 
.00 
AddAuthorization00 !
(00! "
)00" #
;00# $
return22 
services22 
;22 
}33 
}44 ∞
=C:\Dev\BlogPessoalBackend\BlogPessoal\Config\GeminiOptions.cs
	namespace 	
BlogPessoal
 
. 
Config 
; 
public 
class 
GeminiOptions 
{ 
public 

string 
ApiKey 
{ 
get 
; 
set  #
;# $
}% &
=' (
string) /
./ 0
Empty0 5
;5 6
public 

string 
Model 
{ 
get 
; 
set "
;" #
}$ %
=& '
$str( ?
;? @
} 