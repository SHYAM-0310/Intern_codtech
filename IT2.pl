% Calculate accuracy
accuracy(Actual, Predicted, Accuracy) :-
    length(Actual, Total),
    length(Predicted, Total),
    same_length(Actual, Predicted),
    correct_predictions(Actual, Predicted, Correct),
    Accuracy is Correct / Total.

% Count correct predictions
correct_predictions([], [], 0).
correct_predictions([A|At], [P|Pt], Correct) :-
    (A = P ->
        correct_predictions(At, Pt, RestCorrect),
        Correct is RestCorrect + 1
    ;
        correct_predictions(At, Pt, Correct)
    ).

% Example usage
:- initialization(main).
main :-
    % Example data
    Actual = [yes, no, yes, yes, no],
    Predicted = [yes, no, no, yes, yes],
    % Calculate accuracy
    accuracy(Actual, Predicted, Accuracy),
    % Print results
    write('Actual Values: '), writeln(Actual),
    write('Predicted Values: '), writeln(Predicted),
    write('Accuracy: '), writeln(Accuracy).
