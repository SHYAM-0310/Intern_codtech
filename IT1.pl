% Removing duplicates from a list
remove_duplicates([], []).
remove_duplicates([Head|Tail], Result) :-
    member(Head, Tail),       % Check if Head is a duplicate
    remove_duplicates(Tail, Result). % Continue processing Tail
remove_duplicates([Head|Tail], [Head|Result]) :-
    remove_duplicates(Tail, Result). % Add Head to result if not a duplicate

% Normalizing a list of strings to lowercase
normalize_list([], []).
normalize_list([Head|Tail], [NormalizedHead|NormalizedTail]) :-
    downcase_atom(Head, NormalizedHead), % Convert string to lowercase
    normalize_list(Tail, NormalizedTail). % Process the rest of the list

% Example usage
:- initialization(main).
main :-
    % Example data
    Data = [apple, Banana, apple, ORANGE, bAnAna],
    % Remove duplicates
    remove_duplicates(Data, CleanedData),
    % Normalize data
    normalize_list(CleanedData, NormalizedData),
    % Print results
    write('Original Data: '), writeln(Data),
    write('Cleaned Data: '), writeln(CleanedData),
    write('Normalized Data: '), writeln(NormalizedData).
