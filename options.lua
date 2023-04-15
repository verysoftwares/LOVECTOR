painting_with = 'rectangles'

function paint_with(shape)
    assert(shape=='rectangles' or shape=='circles', 'Invalid drawing shape, can be either \'rectangles\' or \'circles\'.')
    painting_with = shape
end