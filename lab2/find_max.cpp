#include <iostream>
#include <limits>
#include <vector>
#include <sstream>
#include <cctype>

int findMax(const std::vector<int>& arr) {
    if (arr.empty()) {
        std::cerr << "Ошибка: Пустой массив!" << std::endl;
        return std::numeric_limits<int>::min();
    }
    int max_value = arr[0];
    for (size_t i = 1; i < arr.size(); ++i) {
        if (arr[i] > max_value) {
            max_value = arr[i];
        }
    }
    return max_value;
}

bool isValidNumber(const std::string& str) {
    if (str.empty()) return false;
    for (char ch : str) {
        if (!std::isdigit(ch) && ch != '-' && ch != '+') return false;
    }
    return true;
}

int main() {
    std::cout << "Введите элементы массива через пробел:" << std::endl;
    std::string input_line;
    std::getline(std::cin, input_line);
    std::istringstream stream(input_line);
    
    std::vector<int> arr;
    std::string token;
    
    while (stream >> token) {
        if (!isValidNumber(token)) {
            std::cerr << "Ошибка: Введены некорректные данные!" << std::endl;
            return 1;
        }
        arr.push_back(std::stoi(token));
    }
    if (arr.empty()) {
        std::cerr << "Ошибка: массив пуст!" << std::endl;
        return 1;
    }
    int max_value = findMax(arr);
    std::cout << "Максимальное значение: " << max_value << std::endl;
    
    return 0;
}

