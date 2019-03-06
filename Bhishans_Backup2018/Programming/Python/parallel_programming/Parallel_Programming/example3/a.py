import multiprocessing
import Queue
import time

def add_messages(q):
    while True:
        # Retrieve from the queue
        message_to_add = q.get()
        print "(Add to DB)"

if __name__ == "__main__":
    q = multiprocessing.Queue()
    p_add = multiprocessing.Process(target=add_messages, args=(q,))
    p_add.start()

    while True:
        input_message = "Type a message: "

        # Add the new message to the queue:
        q.put(input_message)

        # Let the processes catch up before printing "Type a message: " again. (Shell purposes only)
        time.sleep(1)
