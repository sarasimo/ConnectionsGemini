///@description Keeps a number in range. Goes to highest position value is under min. Goes to min postiton if max is exceeded
///@param {real} value the value being clamped
///@param {real} min the lowest value can get
///@param {real} max the highest value can get
function clamp_cycle(_n, _min, _max)
{
    if (_n < _min) _n = _max;
        
    if (_n > _max) _n = _min;
        
    return _n;
}


///@description keeps a number in range of given array. Goes to highest position if under 0. Goes to 0 postiton if array size is exceeded
///@param {int} position variable pointing to a position in the array
///@param {array} array the array to get the lenght off
function clamp_cycle_array(_n, array)
{
    var _lp = array_length(array) -1;
    
    return clamp_cycle(_n, 0, _lp);
}


word_array = []; 