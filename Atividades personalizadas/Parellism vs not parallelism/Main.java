import java.util.*;
import java.util.stream.Collectors;

public class Main {

    public static void main(String... args) {
        long startTime = System.currentTimeMillis();
        Integer[] intArray = {1, 2, 3, 4, 5, 6, 7, 8 ,13735, 15929, 17920, 21365, 21599, 34050, 34227, 42459, 47122, 49699, 51105, 52463, 53489, 58303, 58798, 61174, 63463, 66392, 68162, 70917, 75141, 76652, 81351, 84410, 89154, 92974, 96793, 99977, 104108, 110671, 111102, 113264, 120380, 121968, 122708, 136810, 144676, 151719, 159253, 168552, 169263, 178624, 180029, 180139, 186283, 186563, 187584, 198165, 198669, 198934, 202965, 203478, 206068, 209396, 211021, 227788, 235724, 239537, 246727, 247841, 249595, 254146, 257101, 261762, 265273, 269283, 273233, 273264, 274252, 275692, 275918, 288906, 291259, 292179, 301201, 309148, 316585, 318228, 321166, 321310, 328446, 333814, 340515, 347552, 349633, 350159, 354176, 356657, 356903, 360881, 363654, 364713, 365690, 370506, 373582, 380613, 389840, 392265, 394924, 398877, 410290, 413663, 414542, 420440, 423330, 442372, 442481, 455915, 457246, 457689, 459285, 461518, 470824, 471857, 488209, 491725, 492043, 494818, 510314, 511094, 512626, 518006, 519464, 524590, 531216, 548294, 548983, 550148, 554814, 559267, 580020, 580144, 589967, 597022, 603845, 608444, 613216, 620944, 633133, 635650, 640595, 644521, 647867, 652308, 663280, 669704, 689306, 689700, 700692, 707485, 710472, 711917, 715322, 724238, 724262, 724360, 732417, 734022, 744017, 770715, 777083, 784270, 784904, 787483, 792305, 793287, 793528, 794954, 798727, 803593, 806130, 808702, 809265, 819799, 830949, 831316, 841448, 842198, 844584, 868940, 872828, 873683, 878275, 879258, 882860, 907287, 915770, 923092, 938594, 938771, 940382, 941348, 941943, 954181, 967785, 971245, 978495, 979060, 981923, 996816};
        List<Integer> listOfIntegers =
                new ArrayList<>(Arrays.asList(intArray));

        System.out.println("listOfIntegers:");
        listOfIntegers
                .stream()
                .forEach(e -> System.out.print(e + " "));
        System.out.println("");

        System.out.println("listOfIntegers sorted in reverse order:");
        Comparator<Integer> normal = Integer::compare;
        Comparator<Integer> reversed = normal.reversed();
        Collections.sort(listOfIntegers, reversed);
        listOfIntegers
                .stream()
                .forEach(e -> System.out.print(e + " "));
        System.out.println("");

        System.out.println("Parallel stream");
        listOfIntegers
                .parallelStream()
                .forEach(e -> System.out.print(e + " "));
        System.out.println("");

        System.out.println("Another parallel stream:");
        listOfIntegers
                .parallelStream()
                .forEach(e -> System.out.print(e + " "));
        System.out.println("");

        System.out.println("With forEachOrdered:");
        listOfIntegers
                .parallelStream()
                .forEach(e -> System.out.print(e + " "));
        System.out.println("");
        long endTime = System.currentTimeMillis();
        System.out.println("That took " + (endTime - startTime) + " milliseconds");
    }
}
