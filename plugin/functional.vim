function! IntCompare(i1, i2)
    return a:i1 - a:i2
endfunction

function! Sorted(l)
    let l:new_list = deepcopy(a:l)
    call sort(l:new_list, "IntCompare")
    return l:new_list
endfunction

function! Reversed(l)
    let new_list = deepcopy(a:l)
    call reverse(new_list)
    return new_list
endfunction

function! Append(l, val)
    let new_list = deepcopy(a:l)
    call add(new_list, a:val)
    return new_list
endfunction

function! Assoc(l, i, val)
    let new_list = deepcopy(a:l)
    call new_list[a:i] = a:val
    return new_list
endfunction

function! Pop(l, i)
    let new_list = deepcopy(a:l)
    call remove(new_list, a:i)
    return new_list
endfunction

" echo function("Sorted")([3, 2, 1])
" echo Reversed(Sorted(Append([1, 2, 4, 6, 5, 3], 10)))

" Map and Filter
function! Mapped(fn, l)
    let new_list = deepcopy(a:l)
    call map(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

function! Filtered(fn, l)
    let new_list = deepcopy(a:l)
    call filter(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

" FIXME: Should be from left to right, no recursion required
function! Reduced(fn, l)
    let length = len(a:l)

    if length < 2
        return 0
    elseif length == 2
        return a:fn(a:l[0], a:l[1])
    else
        return a:fn(a:l[0], Reduced(a:fn, a:l[1:]))
    endif
endfunction

function! Add(v1, v2)
    return a:v1 + a:v2
endfunction

