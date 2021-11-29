int main() {
	//didnt sent a go bit when *leds0 is about to be written
	int *rowA0 = (int*)0xC *rowA1 = (int*)0x10, *rowA2 = (int*)0x14 , *rowA3 = (int*)0x18;
	*rowA0 = 33554432;//=2000, 2111 = 33620225
	*rowA1 = 0; //0000 1111 =16843009
	*rowA2 = 0; //0000 1111 =16843009
	*rowA3 = 0; //0000 1111 =16843009
	int *colB0 = (int*)0x1C, *colB1 = (int*)0x20, *colB2 = (int*)0x24 , *colB3 = (int*)0x28;
	*colB0 = 50331648; //=3000, 1111=16843009
	*colB1 = 0; //0000 1111=16843009
	*colB2 = 0; //0000 1111=16843009
	*colB3 = 0; //0000 1111=16843009
	
	int *leds0 = (int*)0x2C, *leds1 = (int*)0x30, *leds2 = (int*)0x34 , *leds3 = (int*)0x38; 
	
	*leds0 = (*rowA0) * (*colB0);

}