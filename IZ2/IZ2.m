% Правила нечеткого вывода
rules = [
    [1, 1, 1, 1, 2],
    [1, 1, 1, 3, 3],
    [2, 2, 1, 1, 2],
    [1, 1, 1, 2, 2],
    [2, 2, 1, 2, 3],
    [2, 2, 1, 3, 3],
    [3, 3, 1, 1, 3],
    [3, 3, 1, 2, 3],
    [3, 3, 1, 3, 3],
    [1, 1, 2, 1, 1],
    [1, 1, 2, 2, 1],
    [1, 1, 2, 3, 2],
    [2, 2, 2, 1, 1],
    [2, 2, 2, 2, 2],
    [2, 2, 2, 3, 3],
    [3, 3, 2, 1, 2],
    [3, 3, 2, 2, 3],
    [3, 3, 2, 3, 3],
    [1, 1, 3, 1, 1],
    [1, 1, 3, 2, 1],
    [1, 1, 3, 3, 2],
    [2, 2, 3, 1, 1],
    [2, 2, 3, 2, 2],
    [2, 2, 3, 3, 2],
    [3, 3, 3, 1, 1],
    [3, 3, 3, 2, 2],
    [3, 2, 1, 1, 2],
    [3, 3, 3, 3, 3]
]

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% maxMinResult = calcAggregationMaxMin([34, 4, 3, 3], [2, 2, 2, 2]);
% disp('Степень уверенности (максиминная):');
% disp(maxMinResult);
% 
% algResult = calcAggregationAlg([34, 4, 3, 3], [2, 2, 2, 2]);
% disp('Степень уверенности (алгебраическая):');
% disp(algResult);
% 
% % Определяем диапазон для графиков
% x = linspace(0, 1, 1000); % Степень принадлежности входная
% minValues = min(x, x); % Значение для максиминной агрегации (просто x)
% algValues = x.*x; % Значение для алгебраической агрегации
% figure;
% hold on;
% plot(x, minValues, 'r', 'DisplayName', 'maxMin');
% plot(x, algValues, 'b', 'DisplayName', 'Alg');
% xlabel('Степень принадлежности входная');
% ylabel('Результат вычисления условия правила');
% legend;
% title('Сравнение степеней уверенности: максиминная и алгебраическая агрегация');
% grid on; 
% hold off;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
calcMinImplic([34, 4, 3, 3],[2 2 2 2 2],[1, 2, 3, 4]);
calcProdImplic([34, 4, 3, 3],[2 2 2 2 2],[1, 2, 3, 4]);

% Определяем диапазон для графиков
x = linspace(0, 1, 1000); % Степень принадлежности входная
figure;
hold on;
plot(x, min(x, x), 'r', 'DisplayName', 'Min');
plot(x, x.*x, 'b', 'DisplayName', 'Prod');
xlabel('Степень принадлежности входная');
ylabel('Результат вычисления импликации');
legend;
grid on;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Определяем диапазон для графиков
input = [34, 4, 3, 3 8];
x = linspace(1, 20, 1000000); % Степень принадлежности входная
figure;
hold on;
plot(x, calcMaxAcc(x, input, rules), 'Color', 'r', 'DisplayName', 'MaxAcc');
plot(x, calcSumAcc(x, input, rules), 'Color', 'b', 'DisplayName', 'SumAcc');
xlabel('Время');
ylabel('Степень принадлежности');
legend;
grid on;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
bis = calcBissect(x, input, rules);
centr = calcCentroid(x, input, rules);
% disp(bis);
% disp(centr);

figure;
hold on;
plot(x, calcMaxAcc(x, input, rules), 'Color', 'r');
plot([bis, bis], [0, 1], 'Color', 'b', 'DisplayName', 'Bissector');
plot([centr, centr], [0, 1], 'Color', 'g', 'DisplayName', 'Centroid');
xlabel('Время')
ylabel('Степень принадлежности')
legend;

function output = calcTeor(x, number)
    if (number == 1)
        output = trapmf(x, [0, 0, 15, 35]);
    elseif (number == 2)
        output = trapmf(x, [20, 30, 50, 65]);
    else
        output = trapmf(x, [55, 65, 100, 100]);
    end
end

function output = calcPract(x, number)
    if (number == 1)
        output = trapmf(x, [0, 0, 2, 4]);
    elseif (number == 2)
        output = trimf(x, [3, 5, 7]);
    else
        output = trapmf(x, [6, 8, 10, 10]);
    end
end

function output = calcUnderst(x, number)
    if (number == 1)
        output = trapmf(x, [0, 0, 1.5, 3]);
    elseif (number == 2)
        output = trimf(x, [2.5, 4, 5]);
    else
        output = trimf(x, [4,5,5]);
    end
end

function output = calcGrade(x, number)
    if (number == 1)
        output = trapmf(x, [0, 0, 2, 3]);
    elseif (number == 2)
        output = trimf(x, [2.5, 4, 5]);
    else
        output = trimf(x, [4,5,5]);
    end
end

function output = calcTime(x, number)
    if (number == 1)
        output = trimf(x, [0, 0, 8]);
    elseif (number == 2)
        output = trimf(x, [4, 10, 16]);
    else
        output = trapmf(x, [10, 14, 20, 20]);
    end
end

function output = calcAggregationMaxMin(vals, row)
    output = min(calcTeor(vals(1), row(1)), ...
                 min(calcPract(vals(2), row(2)), ...
                 min(calcUnderst(vals(3), row(3)), ...
                 calcGrade(vals(4), row(4)))));
end

function output = calcAggregationAlg(vals, row)
    output = calcTeor(vals(1), row(1)) * ...
             calcPract(vals(2), row(2)) * ...
             calcUnderst(vals(3), row(3)) * ...
             calcGrade(vals(4), row(4));
end

function output = calcMinImplic(vals, row, outputVal)
    output = min(calcAggregationMaxMin(vals, row),calcTime(outputVal, row(5)));
end

function output = calcProdImplic(vals, row, outputVal)
    output = calcTime(outputVal, row(5)) .* calcAggregationMaxMin(vals, row);
end

function output = calcMaxAcc(x, vals, rows)
    xOut = x;
    output = 0;
    for i = 1:length(rows)
        row = rows(i, :);
        output = max(calcMinImplic(vals, row, xOut), output);
    end
end

function output = calcSumAcc(x, vals, rows)
    xOut = x;
    output = 0;
    for i = 1:length(rows)
        row = rows(i, :);
        output = calcMinImplic(vals, row, xOut) + output;
    end
    output = min(1,output);
end

function output = calcCentroid(x, input, rules)
    mf = calcMaxAcc(x, input, rules);
    numerator = trapz(x, x .* mf);
    denominator = trapz(x, mf);
    output = numerator / denominator;
end

function output = calcBissect(x, input, rules)
    mf = calcMaxAcc(x, input, rules);
    totalArea = trapz(x, mf);
    halfArea = totalArea / 2;
    currentArea = 0;
    output = NaN;

    for i=1:length(x)
        currentArea = currentArea + trapz(x(i:i + 1), mf(i:i + 1));
        if currentArea >= halfArea
            output = x(i);
            break;
        end
    end
end