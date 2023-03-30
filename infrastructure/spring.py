def learning_rate_schedule(epoch):
    if epoch < 10:
        return 0.001
    elif epoch < 20:
        return 0.0001
    else:
        return 0.00001

epochs = 30
batch_size = 32
steps_per_epoch = 100
learning_rate = 0.001
