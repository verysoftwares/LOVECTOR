painting_with = 'squares'

function paint_with(shape)
    assert(shape=='squares' or shape=='circles', 'Invalid drawing shape, can be either \'squares\' or \'circles\'.')
    painting_with = shape
end