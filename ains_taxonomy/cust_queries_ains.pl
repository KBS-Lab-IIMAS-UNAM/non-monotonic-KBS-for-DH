% ====================================================================
% Customized queries for the astronomical images of New Spain taxonomy
% ====================================================================

%%%%%%%%%%%%%%%%%
%% Gets all images with a keyword
%% e.g., open_kb('kb_ains_final.txt',KB), extension_keyword(luna,KB,ImgKW).
extension_keyword(KW,KB,ImgKW):-
	  sons_of_class(images,KB,List_Imgs),
	  check_keyword_img(List_Imgs,KW,KB,ImgKW).


check_keyword_img([],_,_,[]).
check_keyword_img([Img|More],KW,KB,[Img|Res]):-
	  class_property_value(Img,key_words,KB,Val),
          (is_list(Val)
           -> isElement(KW,Val),!
           ;  KW = Val,!
	  ),
          check_keyword_img(More,KW,KB,Res).
check_keyword_img([_|More],KW,KB,Res):-
	  check_keyword_img(More,KW,KB,Res).

	

%%%%%%%%%%%%%%%%%
%% Get all images in the KB. Note this is just an alias of
%% objects_of_a_class(images,KB,Imgs).
%% e.g., open_kb('kb_ains_final.txt',KB), extension_all_images(KB,Ans).
extension_all_images(KB,Imgs):-
    objects_of_a_class(images,KB,Imgs).



%%%%%%%%%%%%%%%%%
%% Gets all books in a library
%% e.g., open_kb('kb_ains_final.txt',KB), extension_books_in_library(jcb,KB,Books). 
extension_books_in_library(Library,KB,Books):-
          relation_extension(held_in,KB,Relations),
          book_lib(Relations,Library,KB,Books).

book_lib([],_,_,[]).

book_lib([B:Lst|More],Library,KB,[B|Books]):- 
         classes_of_individual(B,KB,Classes),
         isElement(books,Classes),
         isElement(Library,Lst),
         book_lib(More,Library,KB,Books),!.

book_lib([_|More],Library,KB,Books):-
         book_lib(More,Library,KB,Books).



%%%%%%%%%%%%%%%%%
%% Returns the content of a book
%% e.g., open_kb('kb_ains_final.txt',KB),contents_of(reportorio_martinez_jcb,KB,Content).
contents_of(Book,KB,Content):-
        relation_extension(includes,KB,Relations), 
        check_contents(Relations,Book,Content).

check_contents([],_,unknown).

check_contents([Book:Content|_],Book,Content):-!.

check_contents([_|More],Book,Content):-
check_content(More,Book,Content).



%%%%%%%%%%%%%%%%%
%% Gets the repository where an image is included
%% e.g., open_kb('kb_ains_final.txt',KB),included_in(selenografia_oculus_bnm,KB,Repo).
%% e.g., open_kb('kb_ains_final.txt',KB),included_in(selenografia_alzate_jcb,KB,Repo).
included_in(Image,KB,Repo):-
        relation_extension(includes,KB,Relations), 
        check_repo(Relations,Image,Repo).

check_repo([],_,unknown).

check_repo([Repo:Lst|_],Image,Repo):-
        isElement(Image,Lst),!.

check_repo([_|More],Image,Repo):-
        check_repo(More,Image,Repo).
