import pygame
# from constants import *
from constants import SCREEN_WIDTH
from constants import SCREEN_HEIGHT

def main():
    pygame.init()
    print("Starting asteroids!")
    screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                return
        screen.fill(color="black")
        pygame.display.flip()

if __name__ == "__main__":
    main()
