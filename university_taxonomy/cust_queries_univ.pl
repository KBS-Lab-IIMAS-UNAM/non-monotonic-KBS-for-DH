% ======================================================
% Customized queries for the university taxonomy
% ======================================================

%%%%%%%%%%%%%%%%%
%% Find all students enrolled in a specific course
%% e.g., open_kb('kb_university.txt',KB), students_course(ai,KB,Students).
students_course(Course,KB,Students):-
	  class_extension(students,KB,Stdt),
	  check_course(Stdt,Course,KB,Students).


check_course([],_,_,[]).
check_course([St|More],Course,KB,[St|Res]):-
	  object_relation_value(St,enrolled,KB,Val),
          (is_list(Val) ->
	    isElement(Course,Val),!;    
	    Val = Course,!
	  ),	  
          check_course(More,Course,KB,Res).
check_course([_|More],Course,KB,Res):-
	  check_course(More,Course,KB,Res).

	

%%%%%%%%%%%%%%%%%
%% Find all available rooms 
%% e.g., open_kb('kb_university.txt', KB), available_rooms(KB,Rooms).
available_rooms(KB,AvRooms):-
    class_extension(rooms,KB,Rooms),
    class_extension(courses,KB,Courses),
    check_availability(Courses,Rooms,KB,AvRooms).


check_availability([],Rooms,_,Rooms).
check_availability([Cr|More],Rooms,KB,AvRooms):-
    object_relation_value(Cr,at,KB,Val),
    ( is_list(Val)
      -> deleteList(Val,Rooms,NewRooms),!
      ;  deleteElement(Val,Rooms,NewRooms),!
    ),
    check_availability(More,NewRooms,KB,AvRooms).


deleteList([],Lst,Lst).
deleteList([H|T],L1,L2):-
    deleteElement(H,L1,Tmp),
    deleteList(T,Tmp,L2),!.
