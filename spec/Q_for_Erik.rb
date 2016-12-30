
# Stubs and Doubles

allow(class_name).to receive(:method_name).and_return(value)

allow(class_name).to (receive(:method_name).with(:argument).and_return(value1, value2, value3))

allow(class_name).to receive_messages(   \ # add new line?
  :method_1_name => value_1  \
  :method_2_name => value_2  \
  :method_3_name => value_3  \
  )

expect(user_name).to receive(:method_name)

# ###############

# what about calling method within a method ... how stub for this?

allow(class_name.:method_name).to receive(:called_method_name).and_return(value) # ?
