int main() {
	// didnt sent go bit - the go bit sent when *leds is about to be written 
	int *rowA0 = (int*)0xC, *rowA1 = (int*)0x10, *rowA2 = (int*)0x14 , *rowA3 = (int*)0x18;
	*rowA0 = 33620225;// 2111
	*rowA1 = 16843009; // 1111
	*rowA2 = 16843009; // 1111
	*rowA3 = 16843009; // 1111
	int *colB0 = (int*)0x1C, *colB1 = (int*)0x20, *colB2 = (int*)0x24 , *colB3 = (int*)0x28;
	*colB0 = 16843009; // 1111
	*colB1 = 16843009; // 1111
	*colB2 = 16843009; // 1111
	*colB3 = 16843009; // 1111	
	
	int *leds0 = (int*)0x2C, *leds1 = (int*)0x30, *leds2 = (int*)0x34 , *leds3 = (int*)0x38; 
	
	*leds0 = (*rowA0) * (*colB0) + (*rowA0) * (*colB1) + (*rowA0) * (*colB2) + (*rowA0) * (*colB3);
	*leds1 = (*rowA1) * (*colB0) + (*rowA1) * (*colB1) + (*rowA1) * (*colB2) + (*rowA1) * (*colB3);
	*leds2 = (*rowA2) * (*colB0) + (*rowA2) * (*colB1) + (*rowA2) * (*colB2) + (*rowA2) * (*colB3);
	*leds3 = (*rowA3) * (*colB0) + (*rowA3) * (*colB1) + (*rowA3) * (*colB2) + (*rowA3) * (*colB3);


}