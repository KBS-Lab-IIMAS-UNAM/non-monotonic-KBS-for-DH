% ====================================================================
% Customized queries for the astronomical images of New Spain taxonomy
% ====================================================================

%%%%%%%%%%%%%%%%%
%% Gets all images with a keyword
%% e.g., open_kb('kb_ains_final.txt',KB), extension_keyword(luna,KB,ImgKW).
extension_keyword(KW,KB,ImgKW):-
	  sons_of_class(imagenes,KB,List_Imgs),
	  check_keyword_img(List_Imgs,KW,KB,ImgKW).


check_keyword_img([],_,_,[]).
check_keyword_img([Img|More],KW,KB,[Img|Res]):-
	  class_property_value(Img,palabras_clave,KB,Val),
          (is_list(Val)
           -> isElement(KW,Val),!
           ;  KW = Val,!
	  ),
          check_keyword_img(More,KW,KB,Res).
check_keyword_img([_|More],KW,KB,Res):-
	  check_keyword_img(More,KW,KB,Res).

	

%%%%%%%%%%%%%%%%%
%% Get all images in the KB. Note this is just an alias of
%% objects_of_a_class(imagenes,KB,Imgs).
%% e.g., open_kb('kb_ains_final.txt',KB), extension_all_images(KB,Ans).
extension_all_images(KB,Imgs):-
    objects_of_a_class(imagenes,KB,Imgs).



%%%%%%%%%%%%%%%%%
%% Gets all books in a library
%% e.g., open_kb('kb_ains_final.txt',KB), extension_books_in_library(jcb,KB,Books). 
extension_books_in_library(Library,KB,Books):-
          relation_extension(se_encuentra_en,KB,Relations),
          book_lib(Relations,Library,KB,Books).

book_lib([],_,_,[]).

book_lib([B:Lst|More],Library,KB,[B|Books]):- 
         classes_of_individual(B,KB,Classes),
         isElement(libros,Classes),
         isElement(Library,Lst),
         book_lib(More,Library,KB,Books),!.

book_lib([_|More],Library,KB,Books):-
         book_lib(More,Library,KB,Books).



%%%%%%%%%%%%%%%%%
%% Finds the content of an archive
%% e.g., open_kb('kb_ains_final.txt',KB),content_of(reportorio_martinez_jcb,KB,Content).
content_of(Archive,KB,Content):-
        relation_extension(contenida_en,KB,Relations), 
        check_content(Relations,Archive,Content).

check_content([],_,[]).

check_content([Val:Lst|More],Archive,[Val|Content]):-
        isElement(Archive,Lst),
	check_content(More,Archive,Content),!.

check_content([_|More],Archive,Content):-
	check_content(More,Archive,Content).

