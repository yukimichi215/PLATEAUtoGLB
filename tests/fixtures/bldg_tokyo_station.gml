<?xml version="1.0" encoding="UTF-8"?>
<core:CityModel xmlns:app="http://www.opengis.net/citygml/appearance/2.0" xmlns:bldg="http://www.opengis.net/citygml/building/2.0" xmlns:brid="http://www.opengis.net/citygml/bridge/2.0" xmlns:core="http://www.opengis.net/citygml/2.0" xmlns:dem="http://www.opengis.net/citygml/relief/2.0" xmlns:frn="http://www.opengis.net/citygml/cityfurniture/2.0" xmlns:gen="http://www.opengis.net/citygml/generics/2.0" xmlns:gml="http://www.opengis.net/gml" xmlns:grp="http://www.opengis.net/citygml/cityobjectgroup/2.0" xmlns:luse="http://www.opengis.net/citygml/landuse/2.0" xmlns:pbase="http://www.opengis.net/citygml/profiles/base/2.0" xmlns:sch="http://www.ascc.net/xml/schematron" xmlns:smil20="http://www.w3.org/2001/SMIL20/" xmlns:smil20lang="http://www.w3.org/2001/SMIL20/Language" xmlns:tex="http://www.opengis.net/citygml/texturedsurface/2.0" xmlns:tran="http://www.opengis.net/citygml/transportation/2.0" xmlns:tun="http://www.opengis.net/citygml/tunnel/2.0" xmlns:uro="https://www.geospatial.jp/iur/uro/3.2" xmlns:veg="http://www.opengis.net/citygml/vegetation/2.0" xmlns:wtr="http://www.opengis.net/citygml/waterbody/2.0" xmlns:xAL="urn:oasis:names:tc:ciq:xsdschema:xAL:2.0" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="https://www.geospatial.jp/iur/uro/3.2 ../../schemas/iur/uro/3.2/urbanObject.xsd http://www.opengis.net/citygml/2.0 http://schemas.opengis.net/citygml/2.0/cityGMLBase.xsd http://www.opengis.net/citygml/landuse/2.0 http://schemas.opengis.net/citygml/landuse/2.0/landUse.xsd http://www.opengis.net/citygml/building/2.0 http://schemas.opengis.net/citygml/building/2.0/building.xsd http://www.opengis.net/citygml/transportation/2.0 http://schemas.opengis.net/citygml/transportation/2.0/transportation.xsd http://www.opengis.net/citygml/generics/2.0 http://schemas.opengis.net/citygml/generics/2.0/generics.xsd http://www.opengis.net/citygml/cityobjectgroup/2.0 http://schemas.opengis.net/citygml/cityobjectgroup/2.0/cityObjectGroup.xsd http://www.opengis.net/gml http://schemas.opengis.net/gml/3.1.1/base/gml.xsd http://www.opengis.net/citygml/appearance/2.0 http://schemas.opengis.net/citygml/appearance/2.0/appearance.xsd">
	<gml:boundedBy>
		<gml:Envelope srsName="http://www.opengis.net/def/crs/EPSG/0/6697" srsDimension="3">
			<gml:lowerCorner>35.67410276594146 139.76186100757667 -2.81</gml:lowerCorner>
			<gml:upperCorner>35.68365284827436 139.77528571696726 241.546</gml:upperCorner>
		</gml:Envelope>
	</gml:boundedBy>
	<core:cityObjectMember>
		<bldg:Building gml:id="bldg_1108a28a-dd5c-46fe-888e-37cce6567ff2">
			<core:creationDate>2024-03-15</core:creationDate>
			<gen:stringAttribute name="延べ面積換算係数">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="説明注記">
				<gen:value> </gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="大字・町コード">
				<gen:value>55</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="町・丁目コード">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="13+区市町村コード+大字・町コード+町・丁目コード">
				<gen:value>13101055001</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="地区計画">
				<gen:value>大手町・丸の内・有楽町地区</gen:value>
			</gen:stringAttribute>
			<bldg:class codeSpace="../../codelists/Building_class.xml">3003</bldg:class>
			<bldg:usage codeSpace="../../codelists/Building_usage.xml">431</bldg:usage>
			<bldg:measuredHeight uom="m">13.2</bldg:measuredHeight>
			<bldg:storeysAboveGround>2</bldg:storeysAboveGround>
			<bldg:storeysBelowGround>0</bldg:storeysBelowGround>
			<bldg:lod0RoofEdge>
				<gml:MultiSurface>
					<gml:surfaceMember>
						<gml:Polygon>
							<gml:exterior>
								<gml:LinearRing>
									<gml:posList>35.682804404564514 139.7674250772234 0 35.68237899304776 139.7672601613149 0 35.68036743674065 139.76650649264926 0 35.68018307409162 139.76644864640275 0 35.67995941112499 139.7663899494397 0 35.679934580787176 139.76647547843524 0 35.680071802424855 139.76653303242682 0 35.680146829411605 139.766561384342 0 35.68013835226995 139.7665862374712 0 35.68142605918643 139.7670890765682 0 35.68172701499836 139.76719812394668 0 35.68172923968606 139.76717862269837 0 35.68194062810622 139.76725844572468 0 35.68254960497594 139.76742523153112 0 35.68278923267535 139.76748766541385 0 35.682804404564514 139.7674250772234 0</gml:posList>
								</gml:LinearRing>
							</gml:exterior>
						</gml:Polygon>
					</gml:surfaceMember>
				</gml:MultiSurface>
			</bldg:lod0RoofEdge>
			<bldg:lod1Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682804404564514 139.7674250772234 3.3 35.68278923267535 139.76748766541385 3.3 35.68254960497594 139.76742523153112 3.3 35.68194062810622 139.76725844572468 3.3 35.68172923968606 139.76717862269837 3.3 35.68172701499836 139.76719812394668 3.3 35.68142605918643 139.7670890765682 3.3 35.68013835226995 139.7665862374712 3.3 35.680146829411605 139.766561384342 3.3 35.680071802424855 139.76653303242682 3.3 35.679934580787176 139.76647547843524 3.3 35.67995941112499 139.7663899494397 3.3 35.68018307409162 139.76644864640275 3.3 35.68036743674065 139.76650649264926 3.3 35.68237899304776 139.7672601613149 3.3 35.682804404564514 139.7674250772234 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682804404564514 139.7674250772234 3.3 35.68237899304776 139.7672601613149 3.3 35.68237899304776 139.7672601613149 15.2 35.682804404564514 139.7674250772234 15.2 35.682804404564514 139.7674250772234 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68237899304776 139.7672601613149 3.3 35.68036743674065 139.76650649264926 3.3 35.68036743674065 139.76650649264926 15.2 35.68237899304776 139.7672601613149 15.2 35.68237899304776 139.7672601613149 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68036743674065 139.76650649264926 3.3 35.68018307409162 139.76644864640275 3.3 35.68018307409162 139.76644864640275 15.2 35.68036743674065 139.76650649264926 15.2 35.68036743674065 139.76650649264926 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68018307409162 139.76644864640275 3.3 35.67995941112499 139.7663899494397 3.3 35.67995941112499 139.7663899494397 15.2 35.68018307409162 139.76644864640275 15.2 35.68018307409162 139.76644864640275 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.67995941112499 139.7663899494397 3.3 35.679934580787176 139.76647547843524 3.3 35.679934580787176 139.76647547843524 15.2 35.67995941112499 139.7663899494397 15.2 35.67995941112499 139.7663899494397 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.679934580787176 139.76647547843524 3.3 35.680071802424855 139.76653303242682 3.3 35.680071802424855 139.76653303242682 15.2 35.679934580787176 139.76647547843524 15.2 35.679934580787176 139.76647547843524 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680071802424855 139.76653303242682 3.3 35.680146829411605 139.766561384342 3.3 35.680146829411605 139.766561384342 15.2 35.680071802424855 139.76653303242682 15.2 35.680071802424855 139.76653303242682 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680146829411605 139.766561384342 3.3 35.68013835226995 139.7665862374712 3.3 35.68013835226995 139.7665862374712 15.2 35.680146829411605 139.766561384342 15.2 35.680146829411605 139.766561384342 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68013835226995 139.7665862374712 3.3 35.68142605918643 139.7670890765682 3.3 35.68142605918643 139.7670890765682 15.2 35.68013835226995 139.7665862374712 15.2 35.68013835226995 139.7665862374712 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68142605918643 139.7670890765682 3.3 35.68172701499836 139.76719812394668 3.3 35.68172701499836 139.76719812394668 15.2 35.68142605918643 139.7670890765682 15.2 35.68142605918643 139.7670890765682 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68172701499836 139.76719812394668 3.3 35.68172923968606 139.76717862269837 3.3 35.68172923968606 139.76717862269837 15.2 35.68172701499836 139.76719812394668 15.2 35.68172701499836 139.76719812394668 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68172923968606 139.76717862269837 3.3 35.68194062810622 139.76725844572468 3.3 35.68194062810622 139.76725844572468 15.2 35.68172923968606 139.76717862269837 15.2 35.68172923968606 139.76717862269837 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68194062810622 139.76725844572468 3.3 35.68254960497594 139.76742523153112 3.3 35.68254960497594 139.76742523153112 15.2 35.68194062810622 139.76725844572468 15.2 35.68194062810622 139.76725844572468 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68254960497594 139.76742523153112 3.3 35.68278923267535 139.76748766541385 3.3 35.68278923267535 139.76748766541385 15.2 35.68254960497594 139.76742523153112 15.2 35.68254960497594 139.76742523153112 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68278923267535 139.76748766541385 3.3 35.682804404564514 139.7674250772234 3.3 35.682804404564514 139.7674250772234 15.2 35.68278923267535 139.76748766541385 15.2 35.68278923267535 139.76748766541385 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682804404564514 139.7674250772234 15.2 35.68237899304776 139.7672601613149 15.2 35.68036743674065 139.76650649264926 15.2 35.68018307409162 139.76644864640275 15.2 35.67995941112499 139.7663899494397 15.2 35.679934580787176 139.76647547843524 15.2 35.680071802424855 139.76653303242682 15.2 35.680146829411605 139.766561384342 15.2 35.68013835226995 139.7665862374712 15.2 35.68142605918643 139.7670890765682 15.2 35.68172701499836 139.76719812394668 15.2 35.68172923968606 139.76717862269837 15.2 35.68194062810622 139.76725844572468 15.2 35.68254960497594 139.76742523153112 15.2 35.68278923267535 139.76748766541385 15.2 35.682804404564514 139.7674250772234 15.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod1Solid>
			<bldg:lod2Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember xlink:href="#poly-1708a830-9f4e-4401-b6f7-85c82bccdf87"/>
							<gml:surfaceMember xlink:href="#poly-c6b483eb-50af-4f1f-980b-b1bf01375fa1"/>
							<gml:surfaceMember xlink:href="#poly-e13cb8ca-39ae-4fbc-8ba9-fe77a1b1fba0"/>
							<gml:surfaceMember xlink:href="#poly-31dacdf2-c141-4efd-b991-992ed6f4f239"/>
							<gml:surfaceMember xlink:href="#poly-080e1f18-58f8-4de4-8197-efe5801a798d"/>
							<gml:surfaceMember xlink:href="#poly-32015563-faf9-4130-983f-91631f1f8e5b"/>
							<gml:surfaceMember xlink:href="#poly-6f3136f0-de2e-4a04-b828-7dde773a1e16"/>
							<gml:surfaceMember xlink:href="#poly-57bb5e45-82db-494f-8bf0-6188227c3e92"/>
							<gml:surfaceMember xlink:href="#poly-939c8906-c8d9-453b-a3da-6a9d52c3de34"/>
							<gml:surfaceMember xlink:href="#poly-42b0ed4e-3d45-4d33-b70b-258a6a872778"/>
							<gml:surfaceMember xlink:href="#poly-9768bdd1-2685-4d41-8828-d5393e6f7c78"/>
							<gml:surfaceMember xlink:href="#poly-a654c7e7-551b-4633-9bd3-559716ba1a4b"/>
							<gml:surfaceMember xlink:href="#poly-65c83c47-8727-40e5-8ff0-f60d63008d09"/>
							<gml:surfaceMember xlink:href="#poly-987859a3-5fbb-4fad-b6fc-c851a14531ce"/>
							<gml:surfaceMember xlink:href="#poly-6906c7dd-37bc-40c0-b55a-cd53d5e3fdcd"/>
							<gml:surfaceMember xlink:href="#poly-4cbaf62b-d5bc-48d0-bc2d-46557ca8b546"/>
							<gml:surfaceMember xlink:href="#poly-5d940d80-5e1d-4b8f-b8dc-bf9f621fd38f"/>
							<gml:surfaceMember xlink:href="#poly-18c0cb62-bcf3-447f-8569-bf0f7bf34485"/>
							<gml:surfaceMember xlink:href="#poly-d5885dc2-2076-47f6-94fd-b6bc6ce4c19b"/>
							<gml:surfaceMember xlink:href="#poly-fd40cfb3-de38-42f4-bb65-4df2cfdac116"/>
							<gml:surfaceMember xlink:href="#poly-c2ba6bb1-3616-472f-b916-0fccd6e85dd4"/>
							<gml:surfaceMember xlink:href="#poly-cf8371df-9708-4383-9c07-686a65c7e0b0"/>
							<gml:surfaceMember xlink:href="#poly-37c1136b-a047-4599-b8ac-5d32f1971eda"/>
							<gml:surfaceMember xlink:href="#poly-bbb66a86-18da-46f1-a139-13585695641f"/>
							<gml:surfaceMember xlink:href="#poly-36f79bd7-e381-4097-ba9b-034b45d9e5a6"/>
							<gml:surfaceMember xlink:href="#poly-ebc5d95d-149c-4019-92b8-b54c84ef597f"/>
							<gml:surfaceMember xlink:href="#poly-d70d6e0f-a00a-45a2-8c5b-7e89e5670ba6"/>
							<gml:surfaceMember xlink:href="#poly-85a8ee28-ba70-4101-850c-d4b5101d92a2"/>
							<gml:surfaceMember xlink:href="#poly-5d0ee75f-12aa-4553-b724-4fa49e95328b"/>
							<gml:surfaceMember xlink:href="#poly-ee9b15f6-a69f-4dbe-9f86-1666c3afea01"/>
							<gml:surfaceMember xlink:href="#poly-f1b442ee-d60e-467f-bf97-e7f7ea91b0e7"/>
							<gml:surfaceMember xlink:href="#poly-3f1927a8-86bd-407b-8a30-b209f165405a"/>
							<gml:surfaceMember xlink:href="#poly-031b4d39-3931-4c49-97a6-0acc15cd6395"/>
							<gml:surfaceMember xlink:href="#poly-73c34c09-6575-407b-86d9-6b2e01a1e82b"/>
							<gml:surfaceMember xlink:href="#poly-f2def8be-050d-475d-9122-fb4db741a1c1"/>
							<gml:surfaceMember xlink:href="#poly-8adf0679-e141-40df-94bc-3dec17af829b"/>
							<gml:surfaceMember xlink:href="#poly-2f276445-21d0-4801-b5f4-d0ce3b2f51a3"/>
							<gml:surfaceMember xlink:href="#poly-99a5b958-2061-43d1-aa64-e5964361a0ed"/>
							<gml:surfaceMember xlink:href="#poly-393365b3-2b9c-4917-ba53-f1bf4f746644"/>
							<gml:surfaceMember xlink:href="#poly-d5a1c6af-21e3-4cf6-a294-c576a6901a55"/>
							<gml:surfaceMember xlink:href="#poly-577bf634-a47a-4f0b-abe9-5325dbb56b48"/>
							<gml:surfaceMember xlink:href="#poly-99dcb208-08ad-46e0-bebe-ac86995aa5ee"/>
							<gml:surfaceMember xlink:href="#poly-e23cb44b-255d-4270-a083-34fb8167b44b"/>
							<gml:surfaceMember xlink:href="#poly-dfaa3b53-7132-4842-8099-af85bb21feb1"/>
							<gml:surfaceMember xlink:href="#poly-eba96606-38d5-4821-bf43-4a903098ce5e"/>
							<gml:surfaceMember xlink:href="#poly-1a3551e9-74b6-4c92-81e2-0ce44d0187d5"/>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod2Solid>
			<bldg:outerBuildingInstallation>
				<bldg:BuildingInstallation gml:id="bldg_1108a28a-dd5c-46fe-888e-37cce6567ff2_BuildingInstallation_1070">
					<bldg:lod2Geometry>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-cbc7e577-121b-4312-8f1c-f454ed17df16">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680909157597235 139.7667930273927 14.163 35.6809134830195 139.76677461831125 14.163 35.68092171414538 139.76677751702448 14.163 35.680917388722676 139.76679592610768 14.163 35.680909157597235 139.7667930273927 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-96deb168-db45-4780-9cb7-a9e286f37285">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68130995778616 139.76693321119185 14.163 35.681307421640135 139.76694358714684 14.163 35.681291923919325 139.7669378882899 14.163 35.68129446006486 139.76692751233674 14.163 35.68130995778616 139.76693321119185 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-34d801ab-6334-4b53-8224-915341ce34ce">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681683502664185 139.76711044016665 14.163 35.68168801575061 139.76708899261868 14.163 35.681696120493605 139.7670915600619 14.163 35.68169159839302 139.76711300761932 14.163 35.681683502664185 139.76711044016665 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-ab4a9b96-4bdb-491f-8331-f88904611b04">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-ab4a9b96-4bdb-491f-8331-f88904611b04_0">
											<gml:posList>35.6809134830195 139.76677461831125 14.163 35.680909157597235 139.7667930273927 14.163 35.680909157597235 139.7667930273927 16.248 35.6809134830195 139.76677461831125 16.248 35.6809134830195 139.76677461831125 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-8afd203b-2dc5-48c4-adf4-1b4b858bd6ea">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-8afd203b-2dc5-48c4-adf4-1b4b858bd6ea_0">
											<gml:posList>35.680909157597235 139.7667930273927 14.163 35.680917388722676 139.76679592610768 14.163 35.680917388722676 139.76679592610768 16.248 35.680909157597235 139.7667930273927 16.248 35.680909157597235 139.7667930273927 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-e3fb2f02-e163-4618-ab06-202b4b7fdde9">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-e3fb2f02-e163-4618-ab06-202b4b7fdde9_0">
											<gml:posList>35.68092171414538 139.76677751702448 16.248 35.6809134830195 139.76677461831125 16.248 35.680909157597235 139.7667930273927 16.248 35.680917388722676 139.76679592610768 16.248 35.68092171414538 139.76677751702448 16.248</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-b6b4508e-2358-4aa3-8b81-f2e16ba2ee31">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-b6b4508e-2358-4aa3-8b81-f2e16ba2ee31_0">
											<gml:posList>35.68092171414538 139.76677751702448 14.163 35.6809134830195 139.76677461831125 14.163 35.6809134830195 139.76677461831125 16.248 35.68092171414538 139.76677751702448 16.248 35.68092171414538 139.76677751702448 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-e84035f4-2497-4ba8-b036-780c08b422e6">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-e84035f4-2497-4ba8-b036-780c08b422e6_0">
											<gml:posList>35.680917388722676 139.76679592610768 14.163 35.68092171414538 139.76677751702448 14.163 35.68092171414538 139.76677751702448 16.248 35.680917388722676 139.76679592610768 16.248 35.680917388722676 139.76679592610768 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-611768fe-6366-440a-abc7-ca07968c6e4c">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-611768fe-6366-440a-abc7-ca07968c6e4c_0">
											<gml:posList>35.68129446006486 139.76692751233674 14.163 35.681291923919325 139.7669378882899 14.163 35.681291923919325 139.7669378882899 15.971 35.68129446006486 139.76692751233674 15.971 35.68129446006486 139.76692751233674 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-3beefb60-f0de-42c0-8670-7587db621065">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-3beefb60-f0de-42c0-8670-7587db621065_0">
											<gml:posList>35.681291923919325 139.7669378882899 14.163 35.681307421640135 139.76694358714684 14.163 35.681307421640135 139.76694358714684 15.971 35.681291923919325 139.7669378882899 15.971 35.681291923919325 139.7669378882899 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-369738a8-7634-4597-9980-3293ec58124d">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-369738a8-7634-4597-9980-3293ec58124d_0">
											<gml:posList>35.681291923919325 139.7669378882899 15.971 35.681307421640135 139.76694358714684 15.971 35.68130995778616 139.76693321119185 15.971 35.68129446006486 139.76692751233674 15.971 35.681291923919325 139.7669378882899 15.971</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-a50f65ab-d43f-436c-8e61-9dc50ab07295">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-a50f65ab-d43f-436c-8e61-9dc50ab07295_0">
											<gml:posList>35.68130995778616 139.76693321119185 14.163 35.68129446006486 139.76692751233674 14.163 35.68129446006486 139.76692751233674 15.971 35.68130995778616 139.76693321119185 15.971 35.68130995778616 139.76693321119185 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-4036b0af-bbce-4c16-a6db-ba23bf414321">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-4036b0af-bbce-4c16-a6db-ba23bf414321_0">
											<gml:posList>35.68130995778616 139.76693321119185 14.163 35.68130995778616 139.76693321119185 15.971 35.681307421640135 139.76694358714684 15.971 35.681307421640135 139.76694358714684 14.163 35.68130995778616 139.76693321119185 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-6fe49bfb-8b76-41c5-86a1-cc8cffc598e0">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-6fe49bfb-8b76-41c5-86a1-cc8cffc598e0_0">
											<gml:posList>35.68168801575061 139.76708899261868 14.163 35.681683502664185 139.76711044016665 14.163 35.681683502664185 139.76711044016665 16.748 35.68168801575061 139.76708899261868 16.748 35.68168801575061 139.76708899261868 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-f8e9b7e9-e690-457d-b7fe-5e682a0294ce">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-f8e9b7e9-e690-457d-b7fe-5e682a0294ce_0">
											<gml:posList>35.681683502664185 139.76711044016665 14.163 35.68169159839302 139.76711300761932 14.163 35.68169159839302 139.76711300761932 16.748 35.681683502664185 139.76711044016665 16.748 35.681683502664185 139.76711044016665 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-7c0de81e-2340-4b68-9a9d-3e381111a212">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-7c0de81e-2340-4b68-9a9d-3e381111a212_0">
											<gml:posList>35.681696120493605 139.7670915600619 16.748 35.68168801575061 139.76708899261868 16.748 35.681683502664185 139.76711044016665 16.748 35.68169159839302 139.76711300761932 16.748 35.681696120493605 139.7670915600619 16.748</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-18481c27-ce5b-49d9-8fd4-5f44ed7ca016">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-18481c27-ce5b-49d9-8fd4-5f44ed7ca016_0">
											<gml:posList>35.681696120493605 139.7670915600619 14.163 35.68168801575061 139.76708899261868 14.163 35.68168801575061 139.76708899261868 16.748 35.681696120493605 139.7670915600619 16.748 35.681696120493605 139.7670915600619 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-efebfd0d-a79f-44d7-8275-7a8a30c541eb">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-efebfd0d-a79f-44d7-8275-7a8a30c541eb_0">
											<gml:posList>35.68169159839302 139.76711300761932 14.163 35.681696120493605 139.7670915600619 14.163 35.681696120493605 139.7670915600619 16.748 35.68169159839302 139.76711300761932 16.748 35.68169159839302 139.76711300761932 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2Geometry>
				</bldg:BuildingInstallation>
			</bldg:outerBuildingInstallation>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-1708a830-9f4e-4401-b6f7-85c82bccdf87">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-1708a830-9f4e-4401-b6f7-85c82bccdf87">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-1708a830-9f4e-4401-b6f7-85c82bccdf87">
											<gml:posList>35.680071801523475 139.7665330324276 3.255 35.679934580787176 139.76647547843524 3.255 35.679959411125 139.7663899494397 3.255 35.68018307409162 139.76644864640275 3.255 35.68036743674066 139.76650649264926 3.255 35.682378993047756 139.76726016131488 3.255 35.68280440456452 139.7674250772234 3.255 35.68278923267535 139.76748766541385 3.255 35.68254960497594 139.76742523153112 3.255 35.681940628106226 139.76725844572465 3.255 35.68172923968605 139.76717862269837 3.255 35.68172701499835 139.76719812394668 3.255 35.68142605918643 139.7670890765682 3.255 35.68013835226996 139.7665862374712 3.255 35.680146829411605 139.766561384342 3.255 35.680071801523475 139.7665330324276 3.255</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-939c8906-c8d9-453b-a3da-6a9d52c3de34">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-939c8906-c8d9-453b-a3da-6a9d52c3de34">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-939c8906-c8d9-453b-a3da-6a9d52c3de34">
											<gml:posList>35.68006811673053 139.7664875856856 14.163 35.679934580787176 139.76647547843524 14.163 35.680071801523475 139.7665330324276 14.163 35.6800871976603 139.76651806114603 14.163 35.680092630336006 139.7664971435101 14.163 35.68006811673053 139.7664875856856 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-42b0ed4e-3d45-4d33-b70b-258a6a872778">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-42b0ed4e-3d45-4d33-b70b-258a6a872778">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-42b0ed4e-3d45-4d33-b70b-258a6a872778">
											<gml:posList>35.68019526684825 139.7664760564064 19.007 35.68026839932302 139.76654855619836 19.688 35.680283557396926 139.76649442124565 19.007 35.68019526684825 139.7664760564064 19.007</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-c6b483eb-50af-4f1f-980b-b1bf01375fa1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c6b483eb-50af-4f1f-980b-b1bf01375fa1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c6b483eb-50af-4f1f-980b-b1bf01375fa1">
											<gml:posList>35.680107030486596 139.76644166149157 14.163 35.68019526684825 139.7664760564064 14.163 35.68018307409162 139.76644864640275 14.163 35.679959411125 139.7663899494397 14.163 35.680076733413934 139.76645434732455 14.163 35.68010600511436 139.76644560634122 14.163 35.680107030486596 139.76644166149157 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-4cbaf62b-d5bc-48d0-bc2d-46557ca8b546">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-4cbaf62b-d5bc-48d0-bc2d-46557ca8b546">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-4cbaf62b-d5bc-48d0-bc2d-46557ca8b546">
											<gml:posList>35.68172923968605 139.76717862269837 14.163 35.681940628106226 139.76725844572465 14.163 35.68254960497594 139.76742523153112 14.163 35.68278923267535 139.76748766541385 14.163 35.68280440456452 139.7674250772234 14.163 35.682378993047756 139.76726016131488 14.163 35.68036743674066 139.76650649264926 14.163 35.680283557396926 139.76649442124565 14.163 35.680253241224726 139.7666026911306 14.163 35.68016927879086 139.76657080029892 14.163 35.68013835226996 139.7665862374712 14.163 35.68142605918643 139.7670890765682 14.163 35.68172701499835 139.76719812394668 14.163 35.68172923968605 139.76717862269837 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-57bb5e45-82db-494f-8bf0-6188227c3e92">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-57bb5e45-82db-494f-8bf0-6188227c3e92">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-57bb5e45-82db-494f-8bf0-6188227c3e92">
											<gml:posList>35.68019526684825 139.7664760564064 19.007 35.680107030486596 139.76644166149157 19.007 35.680097451369924 139.76647855742527 19.688 35.68026839932302 139.76654855619836 19.688 35.68019526684825 139.7664760564064 19.007</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-32015563-faf9-4130-983f-91631f1f8e5b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-32015563-faf9-4130-983f-91631f1f8e5b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-32015563-faf9-4130-983f-91631f1f8e5b">
											<gml:posList>35.68019904450934 139.76646147040367 14.163 35.680283557396926 139.76649442124565 14.163 35.68036743674066 139.76650649264926 14.163 35.68018307409162 139.76644864640275 14.163 35.68019526684825 139.7664760564064 14.163 35.68019904450934 139.76646147040367 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-a654c7e7-551b-4633-9bd3-559716ba1a4b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a654c7e7-551b-4633-9bd3-559716ba1a4b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a654c7e7-551b-4633-9bd3-559716ba1a4b">
											<gml:posList>35.680146829411605 139.766561384342 14.163 35.6801732719286 139.76655465641267 14.163 35.6800871976603 139.76651806114603 14.163 35.680071801523475 139.7665330324276 14.163 35.680146829411605 139.766561384342 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-9768bdd1-2685-4d41-8828-d5393e6f7c78">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-9768bdd1-2685-4d41-8828-d5393e6f7c78">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-9768bdd1-2685-4d41-8828-d5393e6f7c78">
											<gml:posList>35.6801732719286 139.76655465641267 19.007 35.68026839932302 139.76654855619836 19.688 35.680097451369924 139.76647855742527 19.688 35.6800871976603 139.76651806114603 19.007 35.6801732719286 139.76655465641267 19.007</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-6906c7dd-37bc-40c0-b55a-cd53d5e3fdcd">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-6906c7dd-37bc-40c0-b55a-cd53d5e3fdcd">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-6906c7dd-37bc-40c0-b55a-cd53d5e3fdcd">
											<gml:posList>35.6801732719286 139.76655465641267 19.007 35.68016927879086 139.76657080029892 19.007 35.680253241224726 139.7666026911306 19.007 35.6801732719286 139.76655465641267 19.007</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-6f3136f0-de2e-4a04-b828-7dde773a1e16">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-6f3136f0-de2e-4a04-b828-7dde773a1e16">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-6f3136f0-de2e-4a04-b828-7dde773a1e16">
											<gml:posList>35.680283557396926 139.76649442124565 19.007 35.68019904450934 139.76646147040367 19.007 35.68019526684825 139.7664760564064 19.007 35.680283557396926 139.76649442124565 19.007</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-65c83c47-8727-40e5-8ff0-f60d63008d09">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-65c83c47-8727-40e5-8ff0-f60d63008d09">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-65c83c47-8727-40e5-8ff0-f60d63008d09">
											<gml:posList>35.68016927879086 139.76657080029892 14.163 35.6801732719286 139.76655465641267 14.163 35.680146829411605 139.766561384342 14.163 35.68013835226996 139.7665862374712 14.163 35.68016927879086 139.76657080029892 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-080e1f18-58f8-4de4-8197-efe5801a798d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-080e1f18-58f8-4de4-8197-efe5801a798d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-080e1f18-58f8-4de4-8197-efe5801a798d">
											<gml:posList>35.680092630336006 139.7664971435101 18.973 35.680101561851586 139.76646273383142 18.973 35.68007703923585 139.76645318707156 17.916 35.68006811673053 139.7664875856856 17.916 35.680092630336006 139.7664971435101 18.973</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-e13cb8ca-39ae-4fbc-8ba9-fe77a1b1fba0">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e13cb8ca-39ae-4fbc-8ba9-fe77a1b1fba0">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e13cb8ca-39ae-4fbc-8ba9-fe77a1b1fba0">
											<gml:posList>35.68006811673053 139.7664875856856 14.163 35.680076733413934 139.76645434732455 14.163 35.679959411125 139.7663899494397 14.163 35.679934580787176 139.76647547843524 14.163 35.68006811673053 139.7664875856856 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-987859a3-5fbb-4fad-b6fc-c851a14531ce">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-987859a3-5fbb-4fad-b6fc-c851a14531ce">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-987859a3-5fbb-4fad-b6fc-c851a14531ce">
											<gml:posList>35.680253241224726 139.7666026911306 19.007 35.68026839932302 139.76654855619836 19.688 35.6801732719286 139.76655465641267 19.007 35.680253241224726 139.7666026911306 19.007</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-31dacdf2-c141-4efd-b991-992ed6f4f239">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-31dacdf2-c141-4efd-b991-992ed6f4f239">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-31dacdf2-c141-4efd-b991-992ed6f4f239">
											<gml:posList>35.680076733413934 139.76645434732455 14.163 35.680101238038965 139.76646396038535 14.163 35.68010600511436 139.76644560634122 14.163 35.680076733413934 139.76645434732455 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-36f79bd7-e381-4097-ba9b-034b45d9e5a6">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-36f79bd7-e381-4097-ba9b-034b45d9e5a6">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-36f79bd7-e381-4097-ba9b-034b45d9e5a6">
											<gml:posList>35.680101238038965 139.76646396038535 14.163 35.68007703923585 139.76645318707156 17.916 35.680101561851586 139.76646273383142 18.973 35.680101238038965 139.76646396038535 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ee9b15f6-a69f-4dbe-9f86-1666c3afea01">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ee9b15f6-a69f-4dbe-9f86-1666c3afea01">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ee9b15f6-a69f-4dbe-9f86-1666c3afea01">
											<gml:posList>35.680071801523475 139.7665330324276 14.163 35.680071801523475 139.7665330324276 3.255 35.680146829411605 139.766561384342 3.255 35.680146829411605 139.766561384342 14.163 35.680071801523475 139.7665330324276 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-d5885dc2-2076-47f6-94fd-b6bc6ce4c19b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d5885dc2-2076-47f6-94fd-b6bc6ce4c19b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d5885dc2-2076-47f6-94fd-b6bc6ce4c19b">
											<gml:posList>35.679959411125 139.7663899494397 14.163 35.679959411125 139.7663899494397 3.255 35.679934580787176 139.76647547843524 3.255 35.679934580787176 139.76647547843524 14.163 35.679959411125 139.7663899494397 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-eba96606-38d5-4821-bf43-4a903098ce5e">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-eba96606-38d5-4821-bf43-4a903098ce5e">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-eba96606-38d5-4821-bf43-4a903098ce5e">
											<gml:posList>35.68278923267535 139.76748766541385 14.163 35.68254960497594 139.76742523153112 14.163 35.68254960497594 139.76742523153112 3.255 35.68278923267535 139.76748766541385 3.255 35.68278923267535 139.76748766541385 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-dfaa3b53-7132-4842-8099-af85bb21feb1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-dfaa3b53-7132-4842-8099-af85bb21feb1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-dfaa3b53-7132-4842-8099-af85bb21feb1">
											<gml:posList>35.682378993047756 139.76726016131488 14.163 35.68280440456452 139.7674250772234 14.163 35.68280440456452 139.7674250772234 3.255 35.682378993047756 139.76726016131488 3.255 35.682378993047756 139.76726016131488 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-393365b3-2b9c-4917-ba53-f1bf4f746644">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-393365b3-2b9c-4917-ba53-f1bf4f746644">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-393365b3-2b9c-4917-ba53-f1bf4f746644">
											<gml:posList>35.68036743674066 139.76650649264926 14.163 35.68036743674066 139.76650649264926 3.255 35.68018307409162 139.76644864640275 3.255 35.68018307409162 139.76644864640275 14.163 35.68036743674066 139.76650649264926 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-031b4d39-3931-4c49-97a6-0acc15cd6395">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-031b4d39-3931-4c49-97a6-0acc15cd6395">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-031b4d39-3931-4c49-97a6-0acc15cd6395">
											<gml:posList>35.680107030486596 139.76644166149157 14.163 35.680107030486596 139.76644166149157 19.007 35.68019526684825 139.7664760564064 19.007 35.68019526684825 139.7664760564064 14.163 35.680107030486596 139.76644166149157 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-1a3551e9-74b6-4c92-81e2-0ce44d0187d5">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-1a3551e9-74b6-4c92-81e2-0ce44d0187d5">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-1a3551e9-74b6-4c92-81e2-0ce44d0187d5">
											<gml:posList>35.68280440456452 139.7674250772234 14.163 35.68278923267535 139.76748766541385 14.163 35.68278923267535 139.76748766541385 3.255 35.68280440456452 139.7674250772234 3.255 35.68280440456452 139.7674250772234 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-3f1927a8-86bd-407b-8a30-b209f165405a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-3f1927a8-86bd-407b-8a30-b209f165405a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-3f1927a8-86bd-407b-8a30-b209f165405a">
											<gml:posList>35.680146829411605 139.766561384342 14.163 35.680146829411605 139.766561384342 3.255 35.68013835226996 139.7665862374712 3.255 35.68013835226996 139.7665862374712 14.163 35.680146829411605 139.766561384342 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-5d0ee75f-12aa-4553-b724-4fa49e95328b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-5d0ee75f-12aa-4553-b724-4fa49e95328b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-5d0ee75f-12aa-4553-b724-4fa49e95328b">
											<gml:posList>35.680107030486596 139.76644166149157 19.007 35.680107030486596 139.76644166149157 14.163 35.68010600511436 139.76644560634122 14.163 35.680101238038965 139.76646396038535 14.163 35.680101561851586 139.76646273383142 18.973 35.680097451369924 139.76647855742527 19.688 35.680107030486596 139.76644166149157 19.007</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-99a5b958-2061-43d1-aa64-e5964361a0ed">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-99a5b958-2061-43d1-aa64-e5964361a0ed">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-99a5b958-2061-43d1-aa64-e5964361a0ed">
											<gml:posList>35.680253241224726 139.7666026911306 14.163 35.680283557396926 139.76649442124565 14.163 35.680283557396926 139.76649442124565 19.007 35.68026839932302 139.76654855619836 19.688 35.680253241224726 139.7666026911306 19.007 35.680253241224726 139.7666026911306 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-bbb66a86-18da-46f1-a139-13585695641f">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-bbb66a86-18da-46f1-a139-13585695641f">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-bbb66a86-18da-46f1-a139-13585695641f">
											<gml:posList>35.680101238038965 139.76646396038535 14.163 35.680076733413934 139.76645434732455 14.163 35.68007703923585 139.76645318707156 17.916 35.680101238038965 139.76646396038535 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-cf8371df-9708-4383-9c07-686a65c7e0b0">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-cf8371df-9708-4383-9c07-686a65c7e0b0">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-cf8371df-9708-4383-9c07-686a65c7e0b0">
											<gml:posList>35.680076733413934 139.76645434732455 14.163 35.68006811673053 139.7664875856856 14.163 35.68006811673053 139.7664875856856 17.916 35.68007703923585 139.76645318707156 17.916 35.680076733413934 139.76645434732455 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-d5a1c6af-21e3-4cf6-a294-c576a6901a55">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d5a1c6af-21e3-4cf6-a294-c576a6901a55">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d5a1c6af-21e3-4cf6-a294-c576a6901a55">
											<gml:posList>35.682378993047756 139.76726016131488 3.255 35.68036743674066 139.76650649264926 3.255 35.68036743674066 139.76650649264926 14.163 35.682378993047756 139.76726016131488 14.163 35.682378993047756 139.76726016131488 3.255</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-18c0cb62-bcf3-447f-8569-bf0f7bf34485">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-18c0cb62-bcf3-447f-8569-bf0f7bf34485">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-18c0cb62-bcf3-447f-8569-bf0f7bf34485">
											<gml:posList>35.68172701499835 139.76719812394668 14.163 35.68142605918643 139.7670890765682 14.163 35.68142605918643 139.7670890765682 3.255 35.68172701499835 139.76719812394668 3.255 35.68172701499835 139.76719812394668 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-99dcb208-08ad-46e0-bebe-ac86995aa5ee">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-99dcb208-08ad-46e0-bebe-ac86995aa5ee">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-99dcb208-08ad-46e0-bebe-ac86995aa5ee">
											<gml:posList>35.681940628106226 139.76725844572465 14.163 35.68172923968605 139.76717862269837 14.163 35.68172923968605 139.76717862269837 3.255 35.681940628106226 139.76725844572465 3.255 35.681940628106226 139.76725844572465 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-c2ba6bb1-3616-472f-b916-0fccd6e85dd4">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c2ba6bb1-3616-472f-b916-0fccd6e85dd4">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c2ba6bb1-3616-472f-b916-0fccd6e85dd4">
											<gml:posList>35.68018307409162 139.76644864640275 14.163 35.68018307409162 139.76644864640275 3.255 35.679959411125 139.7663899494397 3.255 35.679959411125 139.7663899494397 14.163 35.68018307409162 139.76644864640275 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-2f276445-21d0-4801-b5f4-d0ce3b2f51a3">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-2f276445-21d0-4801-b5f4-d0ce3b2f51a3">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-2f276445-21d0-4801-b5f4-d0ce3b2f51a3">
											<gml:posList>35.68019904450934 139.76646147040367 14.163 35.68019904450934 139.76646147040367 19.007 35.680283557396926 139.76649442124565 19.007 35.680283557396926 139.76649442124565 14.163 35.68019904450934 139.76646147040367 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-e23cb44b-255d-4270-a083-34fb8167b44b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e23cb44b-255d-4270-a083-34fb8167b44b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e23cb44b-255d-4270-a083-34fb8167b44b">
											<gml:posList>35.68254960497594 139.76742523153112 14.163 35.681940628106226 139.76725844572465 14.163 35.681940628106226 139.76725844572465 3.255 35.68254960497594 139.76742523153112 3.255 35.68254960497594 139.76742523153112 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-f2def8be-050d-475d-9122-fb4db741a1c1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-f2def8be-050d-475d-9122-fb4db741a1c1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-f2def8be-050d-475d-9122-fb4db741a1c1">
											<gml:posList>35.68019904450934 139.76646147040367 14.163 35.68019526684825 139.7664760564064 14.163 35.68019526684825 139.7664760564064 19.007 35.68019904450934 139.76646147040367 19.007 35.68019904450934 139.76646147040367 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-5d940d80-5e1d-4b8f-b8dc-bf9f621fd38f">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-5d940d80-5e1d-4b8f-b8dc-bf9f621fd38f">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-5d940d80-5e1d-4b8f-b8dc-bf9f621fd38f">
											<gml:posList>35.68013835226996 139.7665862374712 14.163 35.68013835226996 139.7665862374712 3.255 35.68142605918643 139.7670890765682 3.255 35.68142605918643 139.7670890765682 14.163 35.68013835226996 139.7665862374712 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-577bf634-a47a-4f0b-abe9-5325dbb56b48">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-577bf634-a47a-4f0b-abe9-5325dbb56b48">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-577bf634-a47a-4f0b-abe9-5325dbb56b48">
											<gml:posList>35.68172701499835 139.76719812394668 14.163 35.68172701499835 139.76719812394668 3.255 35.68172923968605 139.76717862269837 3.255 35.68172923968605 139.76717862269837 14.163 35.68172701499835 139.76719812394668 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-fd40cfb3-de38-42f4-bb65-4df2cfdac116">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-fd40cfb3-de38-42f4-bb65-4df2cfdac116">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-fd40cfb3-de38-42f4-bb65-4df2cfdac116">
											<gml:posList>35.679934580787176 139.76647547843524 14.163 35.679934580787176 139.76647547843524 3.255 35.680071801523475 139.7665330324276 3.255 35.680071801523475 139.7665330324276 14.163 35.679934580787176 139.76647547843524 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-d70d6e0f-a00a-45a2-8c5b-7e89e5670ba6">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d70d6e0f-a00a-45a2-8c5b-7e89e5670ba6">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d70d6e0f-a00a-45a2-8c5b-7e89e5670ba6">
											<gml:posList>35.680097451369924 139.76647855742527 19.688 35.680092630336006 139.7664971435101 18.973 35.6800871976603 139.76651806114603 19.007 35.680097451369924 139.76647855742527 19.688</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-85a8ee28-ba70-4101-850c-d4b5101d92a2">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-85a8ee28-ba70-4101-850c-d4b5101d92a2">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-85a8ee28-ba70-4101-850c-d4b5101d92a2">
											<gml:posList>35.680101561851586 139.76646273383142 18.973 35.680092630336006 139.7664971435101 18.973 35.680097451369924 139.76647855742527 19.688 35.680101561851586 139.76646273383142 18.973</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-8adf0679-e141-40df-94bc-3dec17af829b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-8adf0679-e141-40df-94bc-3dec17af829b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-8adf0679-e141-40df-94bc-3dec17af829b">
											<gml:posList>35.68016927879086 139.76657080029892 14.163 35.680253241224726 139.7666026911306 14.163 35.680253241224726 139.7666026911306 19.007 35.68016927879086 139.76657080029892 19.007 35.68016927879086 139.76657080029892 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ebc5d95d-149c-4019-92b8-b54c84ef597f">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ebc5d95d-149c-4019-92b8-b54c84ef597f">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ebc5d95d-149c-4019-92b8-b54c84ef597f">
											<gml:posList>35.680092630336006 139.7664971435101 14.163 35.6800871976603 139.76651806114603 14.163 35.6800871976603 139.76651806114603 19.007 35.680092630336006 139.7664971435101 18.973 35.680092630336006 139.7664971435101 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-73c34c09-6575-407b-86d9-6b2e01a1e82b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-73c34c09-6575-407b-86d9-6b2e01a1e82b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-73c34c09-6575-407b-86d9-6b2e01a1e82b">
											<gml:posList>35.68016927879086 139.76657080029892 19.007 35.6801732719286 139.76655465641267 19.007 35.6801732719286 139.76655465641267 14.163 35.68016927879086 139.76657080029892 14.163 35.68016927879086 139.76657080029892 19.007</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-f1b442ee-d60e-467f-bf97-e7f7ea91b0e7">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-f1b442ee-d60e-467f-bf97-e7f7ea91b0e7">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-f1b442ee-d60e-467f-bf97-e7f7ea91b0e7">
											<gml:posList>35.6800871976603 139.76651806114603 14.163 35.6801732719286 139.76655465641267 14.163 35.6801732719286 139.76655465641267 19.007 35.6800871976603 139.76651806114603 19.007 35.6800871976603 139.76651806114603 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-37c1136b-a047-4599-b8ac-5d32f1971eda">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-37c1136b-a047-4599-b8ac-5d32f1971eda">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-37c1136b-a047-4599-b8ac-5d32f1971eda">
											<gml:posList>35.680092630336006 139.7664971435101 14.163 35.680092630336006 139.7664971435101 18.973 35.68006811673053 139.7664875856856 17.916 35.68006811673053 139.7664875856856 14.163 35.680092630336006 139.7664971435101 14.163</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:address>
				<core:Address>
					<core:xalAddress>
						<xAL:AddressDetails>
							<xAL:Country>
								<xAL:CountryName>日本</xAL:CountryName>
								<xAL:Locality>
									<xAL:LocalityName Type="Town">東京都千代田区丸の内一丁目</xAL:LocalityName>
								</xAL:Locality>
							</xAL:Country>
						</xAL:AddressDetails>
					</core:xalAddress>
				</core:Address>
			</bldg:address>
			<uro:bldgDataQualityAttribute>
				<uro:DataQualityAttribute>
					<uro:geometrySrcDescLod0 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod0>
					<uro:geometrySrcDescLod1 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod1>
					<uro:geometrySrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod2>
					<uro:geometrySrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">999</uro:geometrySrcDescLod3>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">201</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">000</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">023</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">400</uro:thematicSrcDesc>
					<uro:appearanceSrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">1</uro:appearanceSrcDescLod2>
					<uro:appearanceSrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">99</uro:appearanceSrcDescLod3>
					<uro:lodType codeSpace="../../codelists/Building_lodType.xml">2.2</uro:lodType>
					<uro:lod1HeightType codeSpace="../../codelists/DataQualityAttribute_lod1HeightType.xml">2</uro:lod1HeightType>
					<uro:publicSurveyDataQualityAttribute>
						<uro:PublicSurveyDataQualityAttribute>
							<uro:srcScaleLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod0>
							<uro:srcScaleLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod1>
							<uro:srcScaleLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod2>
							<uro:publicSurveySrcDescLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod0>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod2>
						</uro:PublicSurveyDataQualityAttribute>
					</uro:publicSurveyDataQualityAttribute>
				</uro:DataQualityAttribute>
			</uro:bldgDataQualityAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">10</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.13</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">31</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.177</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">8</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.177</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:HighTideRiskAttribute>
					<uro:description codeSpace="../../codelists/HighTideRiskAttribute_description.xml">2</uro:description>
					<uro:rank codeSpace="../../codelists/HighTideRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.08</uro:depth>
				</uro:HighTideRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">100</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key100.xml">11</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">101</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key101.xml">1</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">102</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key102.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">103</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key103.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">104</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key104.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">105</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key105.xml">9</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">106</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key106.xml">10</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:buildingDetailAttribute>
				<uro:BuildingDetailAttribute>
					<uro:buildingRoofEdgeArea uom="m2">3582.6924</uro:buildingRoofEdgeArea>
					<uro:fireproofStructureType codeSpace="../../codelists/BuildingDetailAttribute_fireproofStructureType.xml">1001</uro:fireproofStructureType>
					<uro:urbanPlanType codeSpace="../../codelists/Common_urbanPlanType.xml">21</uro:urbanPlanType>
					<uro:areaClassificationType codeSpace="../../codelists/Common_areaClassificationType.xml">22</uro:areaClassificationType>
					<uro:districtsAndZonesType codeSpace="../../codelists/Common_districtsAndZonesType.xml">10</uro:districtsAndZonesType>
					<uro:landUseType codeSpace="../../codelists/Common_landUseType.xml">216</uro:landUseType>
					<uro:detailedUsage codeSpace="../../codelists/BuildingDetailAttribute_detailedUsage.xml">1431</uro:detailedUsage>
					<uro:specifiedBuildingCoverageRate>80</uro:specifiedBuildingCoverageRate>
					<uro:specifiedFloorAreaRate>900</uro:specifiedFloorAreaRate>
					<uro:surveyYear>2021</uro:surveyYear>
				</uro:BuildingDetailAttribute>
			</uro:buildingDetailAttribute>
			<uro:buildingIDAttribute>
				<uro:BuildingIDAttribute>
					<uro:buildingID>13101-bldg-353</uro:buildingID>
					<uro:prefecture codeSpace="../../codelists/Common_localPublicAuthorities.xml">13</uro:prefecture>
					<uro:city codeSpace="../../codelists/Common_localPublicAuthorities.xml">13101</uro:city>
				</uro:BuildingIDAttribute>
			</uro:buildingIDAttribute>
		</bldg:Building>
	</core:cityObjectMember>
	<core:cityObjectMember>
		<bldg:Building gml:id="bldg_2b101e06-9f9c-488b-b833-26e3ece73683">
			<core:creationDate>2024-03-15</core:creationDate>
			<gen:stringAttribute name="延べ面積換算係数">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="説明注記">
				<gen:value> </gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="大字・町コード">
				<gen:value>55</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="町・丁目コード">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="13+区市町村コード+大字・町コード+町・丁目コード">
				<gen:value>13101055001</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="地区計画">
				<gen:value>大手町・丸の内・有楽町地区</gen:value>
			</gen:stringAttribute>
			<bldg:class codeSpace="../../codelists/Building_class.xml">3003</bldg:class>
			<bldg:usage codeSpace="../../codelists/Building_usage.xml">431</bldg:usage>
			<bldg:measuredHeight uom="m">12.3</bldg:measuredHeight>
			<bldg:storeysAboveGround>2</bldg:storeysAboveGround>
			<bldg:storeysBelowGround>0</bldg:storeysBelowGround>
			<bldg:lod0RoofEdge>
				<gml:MultiSurface>
					<gml:surfaceMember>
						<gml:Polygon>
							<gml:exterior>
								<gml:LinearRing>
									<gml:posList>35.682205013942394 139.7673982929148 0 35.68196881494117 139.76732590280739 0 35.68120610124317 139.7670468018576 0 35.6799353488464 139.7665601022455 0 35.67990206996446 139.76668982848778 0 35.68018661614617 139.7668222737218 0 35.681702222595476 139.76738677491937 0 35.68184835839089 139.76742963077726 0 35.68197916620483 139.767463992535 0 35.68210203916153 139.76749327889928 0 35.68250934689396 139.7675684016636 0 35.682758042288405 139.76761426760575 0 35.682773408645446 139.76754454231553 0 35.68252882857928 139.7674766878077 0 35.682205013942394 139.7673982929148 0</gml:posList>
								</gml:LinearRing>
							</gml:exterior>
						</gml:Polygon>
					</gml:surfaceMember>
				</gml:MultiSurface>
			</bldg:lod0RoofEdge>
			<bldg:lod1Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682205013942394 139.7673982929148 3.2 35.68252882857928 139.7674766878077 3.2 35.682773408645446 139.76754454231553 3.2 35.682758042288405 139.76761426760575 3.2 35.68250934689396 139.7675684016636 3.2 35.68210203916153 139.76749327889928 3.2 35.68197916620483 139.767463992535 3.2 35.68184835839089 139.76742963077726 3.2 35.681702222595476 139.76738677491937 3.2 35.68018661614617 139.7668222737218 3.2 35.67990206996446 139.76668982848778 3.2 35.6799353488464 139.7665601022455 3.2 35.68120610124317 139.7670468018576 3.2 35.68196881494117 139.76732590280739 3.2 35.682205013942394 139.7673982929148 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682205013942394 139.7673982929148 3.2 35.68196881494117 139.76732590280739 3.2 35.68196881494117 139.76732590280739 15.3 35.682205013942394 139.7673982929148 15.3 35.682205013942394 139.7673982929148 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68196881494117 139.76732590280739 3.2 35.68120610124317 139.7670468018576 3.2 35.68120610124317 139.7670468018576 15.3 35.68196881494117 139.76732590280739 15.3 35.68196881494117 139.76732590280739 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68120610124317 139.7670468018576 3.2 35.6799353488464 139.7665601022455 3.2 35.6799353488464 139.7665601022455 15.3 35.68120610124317 139.7670468018576 15.3 35.68120610124317 139.7670468018576 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.6799353488464 139.7665601022455 3.2 35.67990206996446 139.76668982848778 3.2 35.67990206996446 139.76668982848778 15.3 35.6799353488464 139.7665601022455 15.3 35.6799353488464 139.7665601022455 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.67990206996446 139.76668982848778 3.2 35.68018661614617 139.7668222737218 3.2 35.68018661614617 139.7668222737218 15.3 35.67990206996446 139.76668982848778 15.3 35.67990206996446 139.76668982848778 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68018661614617 139.7668222737218 3.2 35.681702222595476 139.76738677491937 3.2 35.681702222595476 139.76738677491937 15.3 35.68018661614617 139.7668222737218 15.3 35.68018661614617 139.7668222737218 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681702222595476 139.76738677491937 3.2 35.68184835839089 139.76742963077726 3.2 35.68184835839089 139.76742963077726 15.3 35.681702222595476 139.76738677491937 15.3 35.681702222595476 139.76738677491937 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68184835839089 139.76742963077726 3.2 35.68197916620483 139.767463992535 3.2 35.68197916620483 139.767463992535 15.3 35.68184835839089 139.76742963077726 15.3 35.68184835839089 139.76742963077726 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68197916620483 139.767463992535 3.2 35.68210203916153 139.76749327889928 3.2 35.68210203916153 139.76749327889928 15.3 35.68197916620483 139.767463992535 15.3 35.68197916620483 139.767463992535 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68210203916153 139.76749327889928 3.2 35.68250934689396 139.7675684016636 3.2 35.68250934689396 139.7675684016636 15.3 35.68210203916153 139.76749327889928 15.3 35.68210203916153 139.76749327889928 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68250934689396 139.7675684016636 3.2 35.682758042288405 139.76761426760575 3.2 35.682758042288405 139.76761426760575 15.3 35.68250934689396 139.7675684016636 15.3 35.68250934689396 139.7675684016636 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682758042288405 139.76761426760575 3.2 35.682773408645446 139.76754454231553 3.2 35.682773408645446 139.76754454231553 15.3 35.682758042288405 139.76761426760575 15.3 35.682758042288405 139.76761426760575 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682773408645446 139.76754454231553 3.2 35.68252882857928 139.7674766878077 3.2 35.68252882857928 139.7674766878077 15.3 35.682773408645446 139.76754454231553 15.3 35.682773408645446 139.76754454231553 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68252882857928 139.7674766878077 3.2 35.682205013942394 139.7673982929148 3.2 35.682205013942394 139.7673982929148 15.3 35.68252882857928 139.7674766878077 15.3 35.68252882857928 139.7674766878077 3.2</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682205013942394 139.7673982929148 15.3 35.68196881494117 139.76732590280739 15.3 35.68120610124317 139.7670468018576 15.3 35.6799353488464 139.7665601022455 15.3 35.67990206996446 139.76668982848778 15.3 35.68018661614617 139.7668222737218 15.3 35.681702222595476 139.76738677491937 15.3 35.68184835839089 139.76742963077726 15.3 35.68197916620483 139.767463992535 15.3 35.68210203916153 139.76749327889928 15.3 35.68250934689396 139.7675684016636 15.3 35.682758042288405 139.76761426760575 15.3 35.682773408645446 139.76754454231553 15.3 35.68252882857928 139.7674766878077 15.3 35.682205013942394 139.7673982929148 15.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod1Solid>
			<bldg:lod2Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember xlink:href="#poly-a5ea20fd-9e75-44a9-a3ce-cbad9c471879"/>
							<gml:surfaceMember xlink:href="#poly-b2b4f1f2-a48f-41c8-891b-2ac9c64a357e"/>
							<gml:surfaceMember xlink:href="#poly-4b645430-6a0a-4daa-afb7-fbd7d8fa60b8"/>
							<gml:surfaceMember xlink:href="#poly-ee4fa789-44e8-4bf8-98fe-e18b4d3d1e31"/>
							<gml:surfaceMember xlink:href="#poly-c3ecdf12-11d2-41dd-a707-6f010574edf8"/>
							<gml:surfaceMember xlink:href="#poly-a5be6a74-cb26-481f-aeeb-a766aec2be7f"/>
							<gml:surfaceMember xlink:href="#poly-168d4576-49bc-4e8c-98d7-8a7a8863079c"/>
							<gml:surfaceMember xlink:href="#poly-ea0f35eb-d18e-4189-9275-047a6c5f0ad1"/>
							<gml:surfaceMember xlink:href="#poly-375d7bc2-1e3f-4652-ab88-29112a6c797f"/>
							<gml:surfaceMember xlink:href="#poly-1f4e6ebe-a078-453c-b89f-75023fc7699b"/>
							<gml:surfaceMember xlink:href="#poly-e9898054-a761-4bf5-ae0b-55472a02b332"/>
							<gml:surfaceMember xlink:href="#poly-7a7395fe-0d5d-4a33-a47b-73ef46bb8325"/>
							<gml:surfaceMember xlink:href="#poly-2a98dd73-366d-4ab8-9320-ed1d9c53d451"/>
							<gml:surfaceMember xlink:href="#poly-c49c7e75-886e-4a9b-b26d-1c7866560c61"/>
							<gml:surfaceMember xlink:href="#poly-f6339ca8-a3c1-45ca-b6f1-df1e8ffaeb16"/>
							<gml:surfaceMember xlink:href="#poly-4a9384bc-e3a3-4da9-bc21-d4f09b5c9720"/>
							<gml:surfaceMember xlink:href="#poly-c0df01cb-2fcd-4b13-b80a-3a01537ca5ec"/>
							<gml:surfaceMember xlink:href="#poly-15f00e74-6f04-4d83-8c8a-3ab7b34a8d92"/>
							<gml:surfaceMember xlink:href="#poly-185332fc-eb6c-446b-b754-9276e4dadd79"/>
							<gml:surfaceMember xlink:href="#poly-c2d435c3-5994-43df-b3d8-026b0cfbd2d9"/>
							<gml:surfaceMember xlink:href="#poly-32436093-a204-4149-bb52-7e1844d2ed60"/>
							<gml:surfaceMember xlink:href="#poly-59a82cd9-e457-4897-8881-3c135e455622"/>
							<gml:surfaceMember xlink:href="#poly-657c9fd0-2c96-4811-8970-ba104e87f18d"/>
							<gml:surfaceMember xlink:href="#poly-4c6e87d8-2e3c-476f-bd06-f769888d988d"/>
							<gml:surfaceMember xlink:href="#poly-991fc236-5d87-4b42-9a3b-807acbc3c037"/>
							<gml:surfaceMember xlink:href="#poly-bc891ee6-0259-4c08-98d3-32e80f4a2865"/>
							<gml:surfaceMember xlink:href="#poly-2c8e66c1-230d-4973-ac00-2c90646d801a"/>
							<gml:surfaceMember xlink:href="#poly-90ead407-aab3-4b85-82ab-1f6d7cae4a7a"/>
							<gml:surfaceMember xlink:href="#poly-d617a2a7-7422-43ea-a726-7b4c164205cf"/>
							<gml:surfaceMember xlink:href="#poly-69d16d19-4e1b-4398-be47-72ad3cfc46cf"/>
							<gml:surfaceMember xlink:href="#poly-2470ea8c-b141-4696-a0b9-95a6601d6aeb"/>
							<gml:surfaceMember xlink:href="#poly-0152be95-4ff5-4ec6-8cb5-0b70a31e0a66"/>
							<gml:surfaceMember xlink:href="#poly-5e613bd3-0f22-4547-8113-5415966d3d6a"/>
							<gml:surfaceMember xlink:href="#poly-30f8fd84-8dda-41e1-be20-5bdd08ccf6d3"/>
							<gml:surfaceMember xlink:href="#poly-aacc0e98-e50c-43ef-8d47-111722e63cf5"/>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod2Solid>
			<bldg:outerBuildingInstallation>
				<bldg:BuildingInstallation gml:id="bldg_2b101e06-9f9c-488b-b833-26e3ece73683_BuildingInstallation_1070">
					<bldg:lod2Geometry>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-52bd4804-b2b5-4c73-961f-96f8c7f07d23">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680238606383604 139.76670655094588 16 35.68025038974047 139.76671093810398 16 35.68024522739641 139.76673177820868 16 35.68022492432067 139.76672421641388 16 35.680231255835515 139.7666986580086 16 35.680239784563405 139.76670182158495 16 35.680238606383604 139.76670655094588 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-75baae9f-e1e0-4018-83b1-882d4603dc56">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680463188495985 139.76681401256488 16 35.68045576881743 139.76684413461737 16 35.68043249966413 139.76683553675642 16 35.68043991933446 139.76680540366422 16 35.680463188495985 139.76681401256488 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-5f34f00d-f190-4648-944e-7cbef86fde9a">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681047749072775 139.76706463129298 16 35.68104997975446 139.7670560564084 16 35.68106581124524 139.76706224109537 16 35.68106358056312 139.76707081598147 16 35.681047749072775 139.76706463129298 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-efaaa95d-58d9-456c-8b9b-e6621a22af81">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68106358056312 139.76707081598147 16 35.68106581124524 139.76706224109537 16 35.68106581124524 139.76706224109537 17.067 35.68106358056312 139.76707081598147 17.067 35.68106358056312 139.76707081598147 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-65507f05-b19a-4039-920a-1ecf9e012f9d">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68106949865026 139.76706368529958 16 35.68106726796803 139.76707226018604 16 35.68106726796803 139.76707226018604 17.067 35.68106949865026 139.76706368529958 17.067 35.68106949865026 139.76706368529958 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-99a8794d-bac4-4970-bb10-583b10c8d0db">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68106726796803 139.76707226018604 16 35.68106949865026 139.76706368529958 16 35.68108689886098 139.76707047631814 16 35.68108466818436 139.767079062254 16 35.68106726796803 139.76707226018604 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-7f79c107-aa13-40e4-9c05-0e9f8ef2c737">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68142325029655 139.7671936130183 16 35.68142086748867 139.76720422085666 16 35.68140689363786 139.76719950393633 16 35.68140926743162 139.76718889610711 16 35.68142325029655 139.7671936130183 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-f0818b3b-fc9b-4b54-b67f-e53297c4377c">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68142086748867 139.76720422085666 16 35.68142325029655 139.7671936130183 16 35.68142325029655 139.7671936130183 16.592 35.68142086748867 139.76720422085666 16.592 35.68142086748867 139.76720422085666 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-6da960a2-4d20-459f-a4dc-4ecbd0a8f852">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68142664008343 139.7671947591904 16 35.681424257275445 139.76720536702916 16 35.681424257275445 139.76720536702916 16.592 35.68142664008343 139.7671947591904 16.592 35.68142664008343 139.7671947591904 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-f9846c0a-e691-402e-bf87-bba216f35157">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68144412993743 139.76720066637063 16 35.68144174712895 139.76721127421158 16 35.681424257275445 139.76720536702916 16 35.68142664008343 139.7671947591904 16 35.68144412993743 139.76720066637063 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-5c798832-b7be-4ee7-9507-06864b8c2912">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681417549534956 139.7672189834322 16 35.68140357568472 139.7672142665095 16 35.68140559881273 139.7672052388032 16 35.68141958167704 139.767209955717 16 35.681417549534956 139.7672189834322 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-b80804d3-8f30-4fd8-ac31-3e99b523c9c3">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681421323174 139.76721332385412 16 35.681438001635314 139.76721894446496 16 35.68143680572352 139.76722424838852 16 35.681420127262456 139.76721862777666 16 35.681421323174 139.76721332385412 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-381753e4-8536-4035-8544-cfbbc9301536">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-381753e4-8536-4035-8544-cfbbc9301536_0">
											<gml:posList>35.681421323174 139.76721332385412 16 35.681420127262456 139.76721862777666 16 35.681420127262456 139.76721862777666 16.592 35.681421323174 139.76721332385412 16.592 35.681421323174 139.76721332385412 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-24b14cc6-952c-4506-b4fe-4824aaab5358">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-24b14cc6-952c-4506-b4fe-4824aaab5358_0">
											<gml:posList>35.68022492432067 139.76672421641388 16.307 35.68022492432067 139.76672421641388 16 35.68024522739641 139.76673177820868 16 35.68024522739641 139.76673177820868 16.614 35.68022492432067 139.76672421641388 16.614 35.68022492432067 139.76672421641388 16.307</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-df55ae1d-d0c1-45bf-9274-af4a83252265">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-df55ae1d-d0c1-45bf-9274-af4a83252265_0">
											<gml:posList>35.680239784563405 139.76670182158495 16 35.680231255835515 139.7666986580086 16 35.680231255835515 139.7666986580086 16.614 35.680239784563405 139.76670182158495 16.614 35.680239784563405 139.76670182158495 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-93b60621-0094-4d3a-a15e-9d5ba16729a4">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-93b60621-0094-4d3a-a15e-9d5ba16729a4_0">
											<gml:posList>35.680231255835515 139.7666986580086 16.614 35.68022492432067 139.76672421641388 16.614 35.68024522739641 139.76673177820868 16.614 35.68025038974047 139.76671093810398 16.614 35.680238606383604 139.76670655094588 16.614 35.680239784563405 139.76670182158495 16.614 35.680231255835515 139.7666986580086 16.614</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-183f6f57-2659-437d-b50e-7bb2f47fc4dd">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-183f6f57-2659-437d-b50e-7bb2f47fc4dd_0">
											<gml:posList>35.680238606383604 139.76670655094588 16 35.680239784563405 139.76670182158495 16 35.680239784563405 139.76670182158495 16.614 35.680238606383604 139.76670655094588 16.614 35.680238606383604 139.76670655094588 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-bc3ad229-0f87-4f88-b4f6-95b853d81357">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-bc3ad229-0f87-4f88-b4f6-95b853d81357_0">
											<gml:posList>35.68025038974047 139.76671093810398 16 35.680238606383604 139.76670655094588 16 35.680238606383604 139.76670655094588 16.614 35.68025038974047 139.76671093810398 16.614 35.68025038974047 139.76671093810398 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-bae2f968-ef18-4c92-aff4-b96c713031a8">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-bae2f968-ef18-4c92-aff4-b96c713031a8_0">
											<gml:posList>35.68024522739641 139.76673177820868 16 35.68025038974047 139.76671093810398 16 35.68025038974047 139.76671093810398 16.614 35.68024522739641 139.76673177820868 16.614 35.68024522739641 139.76673177820868 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-230fc180-b1ca-41f8-bdab-4a34ff58ea6e">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-230fc180-b1ca-41f8-bdab-4a34ff58ea6e_0">
											<gml:posList>35.68043249966413 139.76683553675642 16 35.68043249966413 139.76683553675642 16.704 35.68043991933446 139.76680540366422 16.704 35.68043991933446 139.76680540366422 16 35.68043249966413 139.76683553675642 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-07b61c1c-e0dc-4dbd-9159-22f57b8caad4">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-07b61c1c-e0dc-4dbd-9159-22f57b8caad4_0">
											<gml:posList>35.68043249966413 139.76683553675642 16 35.68045576881743 139.76684413461737 16 35.68045576881743 139.76684413461737 16.704 35.68043249966413 139.76683553675642 16.704 35.68043249966413 139.76683553675642 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-b51305e7-407a-467f-9f67-e452d20cba7e">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-b51305e7-407a-467f-9f67-e452d20cba7e_0">
											<gml:posList>35.680463188495985 139.76681401256488 16.704 35.68043991933446 139.76680540366422 16.704 35.68043249966413 139.76683553675642 16.704 35.68045576881743 139.76684413461737 16.704 35.680463188495985 139.76681401256488 16.704</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-4350349b-9e5c-4454-8b52-a5a51b3e0a67">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-4350349b-9e5c-4454-8b52-a5a51b3e0a67_0">
											<gml:posList>35.680463188495985 139.76681401256488 16 35.68043991933446 139.76680540366422 16 35.68043991933446 139.76680540366422 16.704 35.680463188495985 139.76681401256488 16.704 35.680463188495985 139.76681401256488 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-d44af2b8-5fd8-4d5b-bc2e-36a50e0ea81b">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-d44af2b8-5fd8-4d5b-bc2e-36a50e0ea81b_0">
											<gml:posList>35.68045576881743 139.76684413461737 16 35.680463188495985 139.76681401256488 16 35.680463188495985 139.76681401256488 16.704 35.68045576881743 139.76684413461737 16.704 35.68045576881743 139.76684413461737 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-db6b698f-617e-4043-bc0b-39091da3f9a6">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-db6b698f-617e-4043-bc0b-39091da3f9a6_0">
											<gml:posList>35.68104997975446 139.7670560564084 16 35.681047749072775 139.76706463129298 16 35.681047749072775 139.76706463129298 17.067 35.68104997975446 139.7670560564084 17.067 35.68104997975446 139.7670560564084 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-c80e97cb-c72c-4232-bd2c-d81bb6ef6856">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-c80e97cb-c72c-4232-bd2c-d81bb6ef6856_0">
											<gml:posList>35.681047749072775 139.76706463129298 16 35.68106358056312 139.76707081598147 16 35.68106358056312 139.76707081598147 17.067 35.681047749072775 139.76706463129298 17.067 35.681047749072775 139.76706463129298 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-e8714995-4f3a-4e41-81fe-fadc4d163f07">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-e8714995-4f3a-4e41-81fe-fadc4d163f07_0">
											<gml:posList>35.681047749072775 139.76706463129298 17.067 35.68106358056312 139.76707081598147 17.067 35.68106581124524 139.76706224109537 17.067 35.68104997975446 139.7670560564084 17.067 35.681047749072775 139.76706463129298 17.067</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-00626923-dabb-4eaa-b753-77f8c6ef67d9">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-00626923-dabb-4eaa-b753-77f8c6ef67d9_0">
											<gml:posList>35.68106581124524 139.76706224109537 16 35.68104997975446 139.7670560564084 16 35.68104997975446 139.7670560564084 17.067 35.68106581124524 139.76706224109537 17.067 35.68106581124524 139.76706224109537 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-664e6505-095b-4342-ab70-4bac9800857f">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-664e6505-095b-4342-ab70-4bac9800857f_0">
											<gml:posList>35.68106726796803 139.76707226018604 16 35.68108466818436 139.767079062254 16 35.68108466818436 139.767079062254 17.067 35.68106726796803 139.76707226018604 17.067 35.68106726796803 139.76707226018604 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-66dd097d-dc2d-4902-9caf-d73ce9836f93">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-66dd097d-dc2d-4902-9caf-d73ce9836f93_0">
											<gml:posList>35.68106726796803 139.76707226018604 17.067 35.68108466818436 139.767079062254 17.067 35.68108689886098 139.76707047631814 17.067 35.68106949865026 139.76706368529958 17.067 35.68106726796803 139.76707226018604 17.067</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-909e9c80-87ee-4d40-a508-7f500b0722af">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-909e9c80-87ee-4d40-a508-7f500b0722af_0">
											<gml:posList>35.68108689886098 139.76707047631814 16 35.68106949865026 139.76706368529958 16 35.68106949865026 139.76706368529958 17.067 35.68108689886098 139.76707047631814 17.067 35.68108689886098 139.76707047631814 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-8a76a9b1-a227-4eda-abca-e584279ed4a1">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-8a76a9b1-a227-4eda-abca-e584279ed4a1_0">
											<gml:posList>35.68108466818436 139.767079062254 16 35.68108689886098 139.76707047631814 16 35.68108689886098 139.76707047631814 17.067 35.68108466818436 139.767079062254 17.067 35.68108466818436 139.767079062254 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-180cedb4-12e0-4b97-80a3-77a243ee8523">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-180cedb4-12e0-4b97-80a3-77a243ee8523_0">
											<gml:posList>35.68140559881273 139.7672052388032 16 35.68140357568472 139.7672142665095 16 35.68140357568472 139.7672142665095 16.592 35.68140559881273 139.7672052388032 16.592 35.68140559881273 139.7672052388032 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-1ce362ab-7954-4b8c-bd20-9badfaccc395">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-1ce362ab-7954-4b8c-bd20-9badfaccc395_0">
											<gml:posList>35.68140926743162 139.76718889610711 16 35.68140689363786 139.76719950393633 16 35.68140689363786 139.76719950393633 16.592 35.68140926743162 139.76718889610711 16.592 35.68140926743162 139.76718889610711 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-ad749c82-8914-418a-8909-65d1b28e9c8f">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-ad749c82-8914-418a-8909-65d1b28e9c8f_0">
											<gml:posList>35.68140357568472 139.7672142665095 16 35.681417549534956 139.7672189834322 16 35.681417549534956 139.7672189834322 16.592 35.68140357568472 139.7672142665095 16.592 35.68140357568472 139.7672142665095 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-d4f536df-aa2e-4969-95b6-71c9e2e7f535">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-d4f536df-aa2e-4969-95b6-71c9e2e7f535_0">
											<gml:posList>35.681417549534956 139.7672189834322 16.592 35.68141958167704 139.767209955717 16.592 35.68140559881273 139.7672052388032 16.592 35.68140357568472 139.7672142665095 16.592 35.681417549534956 139.7672189834322 16.592</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-50631094-5116-4de6-a4a8-8a6d4fc34da3">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-50631094-5116-4de6-a4a8-8a6d4fc34da3_0">
											<gml:posList>35.68141958167704 139.767209955717 16 35.68140559881273 139.7672052388032 16 35.68140559881273 139.7672052388032 16.592 35.68141958167704 139.767209955717 16.592 35.68141958167704 139.767209955717 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-1bb4f969-d93e-4ef3-acad-08947cfe69f3">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-1bb4f969-d93e-4ef3-acad-08947cfe69f3_0">
											<gml:posList>35.68140689363786 139.76719950393633 16 35.68142086748867 139.76720422085666 16 35.68142086748867 139.76720422085666 16.592 35.68140689363786 139.76719950393633 16.592 35.68140689363786 139.76719950393633 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-84b1f6ec-4b21-43c5-8981-59618fe5fcbe">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-84b1f6ec-4b21-43c5-8981-59618fe5fcbe_0">
											<gml:posList>35.68140689363786 139.76719950393633 16.592 35.68142086748867 139.76720422085666 16.592 35.68142325029655 139.7671936130183 16.592 35.68140926743162 139.76718889610711 16.592 35.68140689363786 139.76719950393633 16.592</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-a5bcef7f-aff3-4dfd-97a6-3708fc461f2c">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-a5bcef7f-aff3-4dfd-97a6-3708fc461f2c_0">
											<gml:posList>35.68142325029655 139.7671936130183 16 35.68140926743162 139.76718889610711 16 35.68140926743162 139.76718889610711 16.592 35.68142325029655 139.7671936130183 16.592 35.68142325029655 139.7671936130183 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-aa0e496d-b790-45d6-a1c8-800d37a7fea9">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-aa0e496d-b790-45d6-a1c8-800d37a7fea9_0">
											<gml:posList>35.681417549534956 139.7672189834322 16 35.68141958167704 139.767209955717 16 35.68141958167704 139.767209955717 16.592 35.681417549534956 139.7672189834322 16.592 35.681417549534956 139.7672189834322 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-81c41eb4-a37c-4573-828a-6aba77d3410b">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-81c41eb4-a37c-4573-828a-6aba77d3410b_0">
											<gml:posList>35.681420127262456 139.76721862777666 16 35.68143680572352 139.76722424838852 16 35.68143680572352 139.76722424838852 16.592 35.681420127262456 139.76721862777666 16.592 35.681420127262456 139.76721862777666 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-a63990f0-17cf-49f9-ade5-4512ff511131">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-a63990f0-17cf-49f9-ade5-4512ff511131_0">
											<gml:posList>35.68143680572352 139.76722424838852 16.592 35.681438001635314 139.76721894446496 16.592 35.681421323174 139.76721332385412 16.592 35.681420127262456 139.76721862777666 16.592 35.68143680572352 139.76722424838852 16.592</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-d3aed118-51c1-4fd8-bf5d-c27545049bdc">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-d3aed118-51c1-4fd8-bf5d-c27545049bdc_0">
											<gml:posList>35.681438001635314 139.76721894446496 16 35.681421323174 139.76721332385412 16 35.681421323174 139.76721332385412 16.592 35.681438001635314 139.76721894446496 16.592 35.681438001635314 139.76721894446496 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-7aa7524b-2142-40b3-8fb2-1ced5b7a868a">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-7aa7524b-2142-40b3-8fb2-1ced5b7a868a_0">
											<gml:posList>35.681424257275445 139.76720536702916 16 35.68144174712895 139.76721127421158 16 35.68144174712895 139.76721127421158 16.592 35.681424257275445 139.76720536702916 16.592 35.681424257275445 139.76720536702916 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-b013719c-8e7d-4748-8539-0c279befd4ed">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-b013719c-8e7d-4748-8539-0c279befd4ed_0">
											<gml:posList>35.68144412993743 139.76720066637063 16.592 35.68142664008343 139.7671947591904 16.592 35.681424257275445 139.76720536702916 16.592 35.68144174712895 139.76721127421158 16.592 35.68144412993743 139.76720066637063 16.592</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-279288c2-0a3c-49ab-bc3e-0e29b87c40bd">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-279288c2-0a3c-49ab-bc3e-0e29b87c40bd_0">
											<gml:posList>35.68144412993743 139.76720066637063 16 35.68142664008343 139.7671947591904 16 35.68142664008343 139.7671947591904 16.592 35.68144412993743 139.76720066637063 16.592 35.68144412993743 139.76720066637063 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-b6028157-bbdb-4d42-860a-d43aa5f121fa">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-b6028157-bbdb-4d42-860a-d43aa5f121fa_0">
											<gml:posList>35.68143680572352 139.76722424838852 16 35.681438001635314 139.76721894446496 16 35.681438001635314 139.76721894446496 16.592 35.68143680572352 139.76722424838852 16.592 35.68143680572352 139.76722424838852 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-51e7581c-4c71-4f57-8678-877293904347">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-51e7581c-4c71-4f57-8678-877293904347_0">
											<gml:posList>35.68144174712895 139.76721127421158 16 35.68144412993743 139.76720066637063 16 35.68144412993743 139.76720066637063 16.592 35.68144174712895 139.76721127421158 16.592 35.68144174712895 139.76721127421158 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2Geometry>
				</bldg:BuildingInstallation>
			</bldg:outerBuildingInstallation>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-a5ea20fd-9e75-44a9-a3ce-cbad9c471879">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a5ea20fd-9e75-44a9-a3ce-cbad9c471879">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a5ea20fd-9e75-44a9-a3ce-cbad9c471879">
											<gml:posList>35.68277340864544 139.76754454231553 3.23 35.682758042288405 139.76761426760575 3.23 35.68250934689396 139.7675684016636 3.23 35.68210203916153 139.76749327889928 3.23 35.68197916620484 139.767463992535 3.23 35.681848358390894 139.76742963077726 3.23 35.68170222259547 139.7673867749194 3.23 35.68018661614618 139.76682227372183 3.23 35.679902069964456 139.7666898284878 3.23 35.6799353488464 139.7665601022455 3.23 35.68120610124318 139.7670468018576 3.23 35.68196881494117 139.76732590280739 3.23 35.682205013942394 139.7673982929148 3.23 35.682528829480646 139.76747668780698 3.23 35.68277340864544 139.76754454231553 3.23</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-375d7bc2-1e3f-4652-ab88-29112a6c797f">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-375d7bc2-1e3f-4652-ab88-29112a6c797f">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-375d7bc2-1e3f-4652-ab88-29112a6c797f">
											<gml:posList>35.68252323709718 139.76750255561893 16 35.68250934689396 139.7675684016636 16 35.6827580332747 139.76761426761314 16 35.68277340864544 139.76754454231553 16 35.682528829480646 139.76747668780698 16 35.68252323709718 139.76750255561893 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-a5be6a74-cb26-481f-aeeb-a766aec2be7f">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a5be6a74-cb26-481f-aeeb-a766aec2be7f">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a5be6a74-cb26-481f-aeeb-a766aec2be7f">
											<gml:posList>35.682528829480646 139.76747668780698 16 35.682205013942394 139.7673982929148 16 35.68225267115309 139.76743432509292 16 35.68252323709718 139.76750255561893 16 35.682528829480646 139.76747668780698 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-b2b4f1f2-a48f-41c8-891b-2ac9c64a357e">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b2b4f1f2-a48f-41c8-891b-2ac9c64a357e">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b2b4f1f2-a48f-41c8-891b-2ac9c64a357e">
											<gml:posList>35.6799353488464 139.7665601022455 16 35.679902069964456 139.7666898284878 16 35.680184312932234 139.76674851072252 16 35.68020219227114 139.76667634389375 16 35.6799353488464 139.7665601022455 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-ea0f35eb-d18e-4189-9275-047a6c5f0ad1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ea0f35eb-d18e-4189-9275-047a6c5f0ad1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ea0f35eb-d18e-4189-9275-047a6c5f0ad1">
											<gml:posList>35.682233819856094 139.76751009601233 16 35.68210203916153 139.76749327889928 16 35.68250934689396 139.7675684016636 16 35.682233819856094 139.76751009601233 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-ee4fa789-44e8-4bf8-98fe-e18b4d3d1e31">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ee4fa789-44e8-4bf8-98fe-e18b4d3d1e31">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ee4fa789-44e8-4bf8-98fe-e18b4d3d1e31">
											<gml:posList>35.680184312932234 139.76674851072252 16 35.679902069964456 139.7666898284878 16 35.68018661614618 139.76682227372183 16 35.68021598464538 139.76676030536103 16 35.680184312932234 139.76674851072252 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-c3ecdf12-11d2-41dd-a707-6f010574edf8">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c3ecdf12-11d2-41dd-a707-6f010574edf8">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c3ecdf12-11d2-41dd-a707-6f010574edf8">
											<gml:posList>35.68225267115309 139.76743432509292 16 35.682205013942394 139.7673982929148 16 35.68196881494117 139.76732590280739 16 35.68120610124318 139.7670468018576 16 35.6799353488464 139.7665601022455 16 35.68020219227114 139.76667634389375 16 35.68023386399124 139.76668813850634 16 35.68021598464538 139.76676030536103 16 35.68018661614618 139.76682227372183 16 35.68170222259547 139.7673867749194 16 35.681848358390894 139.76742963077726 16 35.68197916620484 139.767463992535 16 35.68210203916153 139.76749327889928 16 35.682233819856094 139.76751009601233 16 35.68223948507633 139.76748555398197 16 35.682227873809495 139.76748262478225 16 35.682235555488944 139.767436847039 16 35.68225157507215 139.7674408884455 16 35.68225267115309 139.76743432509292 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-4b645430-6a0a-4daa-afb7-fbd7d8fa60b8">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-4b645430-6a0a-4daa-afb7-fbd7d8fa60b8">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-4b645430-6a0a-4daa-afb7-fbd7d8fa60b8">
											<gml:posList>35.68023386399124 139.76668813850634 16.614 35.68020219227114 139.76667634389375 16.614 35.680184312932234 139.76674851072252 16.614 35.68021598464538 139.76676030536103 16.614 35.68023386399124 139.76668813850634 16.614</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-168d4576-49bc-4e8c-98d7-8a7a8863079c">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-168d4576-49bc-4e8c-98d7-8a7a8863079c">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-168d4576-49bc-4e8c-98d7-8a7a8863079c">
											<gml:posList>35.682235555488944 139.767436847039 18.729 35.682227873809495 139.76748262478225 18.729 35.68223948507633 139.76748555398197 18.729 35.682233819856094 139.76751009601233 18.729 35.68250934689396 139.7675684016636 18.729 35.68252323709718 139.76750255561893 18.729 35.68225267115309 139.76743432509292 18.729 35.68225157507215 139.7674408884455 18.729 35.682235555488944 139.767436847039 18.729</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-32436093-a204-4149-bb52-7e1844d2ed60">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-32436093-a204-4149-bb52-7e1844d2ed60">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-32436093-a204-4149-bb52-7e1844d2ed60">
											<gml:posList>35.68210203916153 139.76749327889928 16 35.68197916620484 139.767463992535 16 35.68197916620484 139.767463992535 3.23 35.68210203916153 139.76749327889928 3.23 35.68210203916153 139.76749327889928 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-15f00e74-6f04-4d83-8c8a-3ab7b34a8d92">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-15f00e74-6f04-4d83-8c8a-3ab7b34a8d92">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-15f00e74-6f04-4d83-8c8a-3ab7b34a8d92">
											<gml:posList>35.68120610124318 139.7670468018576 16 35.68196881494117 139.76732590280739 16 35.68196881494117 139.76732590280739 3.23 35.68120610124318 139.7670468018576 3.23 35.68120610124318 139.7670468018576 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-0152be95-4ff5-4ec6-8cb5-0b70a31e0a66">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0152be95-4ff5-4ec6-8cb5-0b70a31e0a66">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0152be95-4ff5-4ec6-8cb5-0b70a31e0a66">
											<gml:posList>35.68250934689396 139.7675684016636 16 35.68252323709718 139.76750255561893 16 35.68252323709718 139.76750255561893 18.729 35.68250934689396 139.7675684016636 18.729 35.68250934689396 139.7675684016636 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-c0df01cb-2fcd-4b13-b80a-3a01537ca5ec">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c0df01cb-2fcd-4b13-b80a-3a01537ca5ec">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c0df01cb-2fcd-4b13-b80a-3a01537ca5ec">
											<gml:posList>35.68170222259547 139.7673867749194 16 35.68018661614618 139.76682227372183 16 35.68018661614618 139.76682227372183 3.23 35.68170222259547 139.7673867749194 3.23 35.68170222259547 139.7673867749194 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-69d16d19-4e1b-4398-be47-72ad3cfc46cf">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-69d16d19-4e1b-4398-be47-72ad3cfc46cf">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-69d16d19-4e1b-4398-be47-72ad3cfc46cf">
											<gml:posList>35.682233819856094 139.76751009601233 18.729 35.682233819856094 139.76751009601233 16 35.68250934689396 139.7675684016636 16 35.68250934689396 139.7675684016636 18.729 35.682233819856094 139.76751009601233 18.729</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-c49c7e75-886e-4a9b-b26d-1c7866560c61">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c49c7e75-886e-4a9b-b26d-1c7866560c61">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c49c7e75-886e-4a9b-b26d-1c7866560c61">
											<gml:posList>35.68023386399124 139.76668813850634 16.614 35.68023386399124 139.76668813850634 16 35.68020219227114 139.76667634389375 16 35.68020219227114 139.76667634389375 16.614 35.68023386399124 139.76668813850634 16.614</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-4a9384bc-e3a3-4da9-bc21-d4f09b5c9720">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-4a9384bc-e3a3-4da9-bc21-d4f09b5c9720">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-4a9384bc-e3a3-4da9-bc21-d4f09b5c9720">
											<gml:posList>35.6799353488464 139.7665601022455 16 35.68120610124318 139.7670468018576 16 35.68120610124318 139.7670468018576 3.23 35.6799353488464 139.7665601022455 3.23 35.6799353488464 139.7665601022455 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-30f8fd84-8dda-41e1-be20-5bdd08ccf6d3">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-30f8fd84-8dda-41e1-be20-5bdd08ccf6d3">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-30f8fd84-8dda-41e1-be20-5bdd08ccf6d3">
											<gml:posList>35.682528829480646 139.76747668780698 16 35.68277340864544 139.76754454231553 16 35.68277340864544 139.76754454231553 3.23 35.682528829480646 139.76747668780698 3.23 35.682528829480646 139.76747668780698 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-2c8e66c1-230d-4973-ac00-2c90646d801a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-2c8e66c1-230d-4973-ac00-2c90646d801a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-2c8e66c1-230d-4973-ac00-2c90646d801a">
											<gml:posList>35.68225267115309 139.76743432509292 18.729 35.68225267115309 139.76743432509292 16 35.68225157507215 139.7674408884455 16 35.68225157507215 139.7674408884455 18.729 35.68225267115309 139.76743432509292 18.729</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-7a7395fe-0d5d-4a33-a47b-73ef46bb8325">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-7a7395fe-0d5d-4a33-a47b-73ef46bb8325">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-7a7395fe-0d5d-4a33-a47b-73ef46bb8325">
											<gml:posList>35.68020219227114 139.76667634389375 16.614 35.68020219227114 139.76667634389375 16 35.680184312932234 139.76674851072252 16 35.680184312932234 139.76674851072252 16.614 35.68020219227114 139.76667634389375 16.614</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-2470ea8c-b141-4696-a0b9-95a6601d6aeb">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-2470ea8c-b141-4696-a0b9-95a6601d6aeb">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-2470ea8c-b141-4696-a0b9-95a6601d6aeb">
											<gml:posList>35.68252323709718 139.76750255561893 18.729 35.68252323709718 139.76750255561893 16 35.68225267115309 139.76743432509292 16 35.68225267115309 139.76743432509292 18.729 35.68252323709718 139.76750255561893 18.729</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-e9898054-a761-4bf5-ae0b-55472a02b332">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e9898054-a761-4bf5-ae0b-55472a02b332">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e9898054-a761-4bf5-ae0b-55472a02b332">
											<gml:posList>35.68018661614618 139.76682227372183 16 35.679902069964456 139.7666898284878 16 35.679902069964456 139.7666898284878 3.23 35.68018661614618 139.76682227372183 3.23 35.68018661614618 139.76682227372183 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-bc891ee6-0259-4c08-98d3-32e80f4a2865">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-bc891ee6-0259-4c08-98d3-32e80f4a2865">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-bc891ee6-0259-4c08-98d3-32e80f4a2865">
											<gml:posList>35.68225157507215 139.7674408884455 18.729 35.68225157507215 139.7674408884455 16 35.682235555488944 139.767436847039 16 35.682235555488944 139.767436847039 18.729 35.68225157507215 139.7674408884455 18.729</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-1f4e6ebe-a078-453c-b89f-75023fc7699b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-1f4e6ebe-a078-453c-b89f-75023fc7699b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-1f4e6ebe-a078-453c-b89f-75023fc7699b">
											<gml:posList>35.679902069964456 139.7666898284878 16 35.6799353488464 139.7665601022455 16 35.6799353488464 139.7665601022455 3.23 35.679902069964456 139.7666898284878 3.23 35.679902069964456 139.7666898284878 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-185332fc-eb6c-446b-b754-9276e4dadd79">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-185332fc-eb6c-446b-b754-9276e4dadd79">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-185332fc-eb6c-446b-b754-9276e4dadd79">
											<gml:posList>35.681848358390894 139.76742963077726 16 35.68170222259547 139.7673867749194 16 35.68170222259547 139.7673867749194 3.23 35.681848358390894 139.76742963077726 3.23 35.681848358390894 139.76742963077726 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-2a98dd73-366d-4ab8-9320-ed1d9c53d451">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-2a98dd73-366d-4ab8-9320-ed1d9c53d451">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-2a98dd73-366d-4ab8-9320-ed1d9c53d451">
											<gml:posList>35.680184312932234 139.76674851072252 16.614 35.680184312932234 139.76674851072252 16 35.68021598464538 139.76676030536103 16 35.68021598464538 139.76676030536103 16.614 35.680184312932234 139.76674851072252 16.614</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-657c9fd0-2c96-4811-8970-ba104e87f18d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-657c9fd0-2c96-4811-8970-ba104e87f18d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-657c9fd0-2c96-4811-8970-ba104e87f18d">
											<gml:posList>35.682235555488944 139.767436847039 18.729 35.682235555488944 139.767436847039 16 35.682227873809495 139.76748262478225 16 35.682227873809495 139.76748262478225 18.729 35.682235555488944 139.767436847039 18.729</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-90ead407-aab3-4b85-82ab-1f6d7cae4a7a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-90ead407-aab3-4b85-82ab-1f6d7cae4a7a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-90ead407-aab3-4b85-82ab-1f6d7cae4a7a">
											<gml:posList>35.68250934689396 139.7675684016636 3.23 35.68250934689396 139.7675684016636 16 35.68210203916153 139.76749327889928 16 35.68210203916153 139.76749327889928 3.23 35.68250934689396 139.7675684016636 3.23</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-991fc236-5d87-4b42-9a3b-807acbc3c037">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-991fc236-5d87-4b42-9a3b-807acbc3c037">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-991fc236-5d87-4b42-9a3b-807acbc3c037">
											<gml:posList>35.68223948507633 139.76748555398197 18.729 35.68223948507633 139.76748555398197 16 35.682233819856094 139.76751009601233 16 35.682233819856094 139.76751009601233 18.729 35.68223948507633 139.76748555398197 18.729</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-4c6e87d8-2e3c-476f-bd06-f769888d988d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-4c6e87d8-2e3c-476f-bd06-f769888d988d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-4c6e87d8-2e3c-476f-bd06-f769888d988d">
											<gml:posList>35.682227873809495 139.76748262478225 18.729 35.682227873809495 139.76748262478225 16 35.68223948507633 139.76748555398197 16 35.68223948507633 139.76748555398197 18.729 35.682227873809495 139.76748262478225 18.729</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-c2d435c3-5994-43df-b3d8-026b0cfbd2d9">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c2d435c3-5994-43df-b3d8-026b0cfbd2d9">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c2d435c3-5994-43df-b3d8-026b0cfbd2d9">
											<gml:posList>35.68197916620484 139.767463992535 16 35.681848358390894 139.76742963077726 16 35.681848358390894 139.76742963077726 3.23 35.68197916620484 139.767463992535 3.23 35.68197916620484 139.767463992535 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-5e613bd3-0f22-4547-8113-5415966d3d6a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-5e613bd3-0f22-4547-8113-5415966d3d6a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-5e613bd3-0f22-4547-8113-5415966d3d6a">
											<gml:posList>35.682758042288405 139.76761426760575 3.23 35.6827580332747 139.76761426761314 16 35.68250934689396 139.7675684016636 16 35.68250934689396 139.7675684016636 3.23 35.682758042288405 139.76761426760575 3.23</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-d617a2a7-7422-43ea-a726-7b4c164205cf">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d617a2a7-7422-43ea-a726-7b4c164205cf">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d617a2a7-7422-43ea-a726-7b4c164205cf">
											<gml:posList>35.682205013942394 139.7673982929148 16 35.682528829480646 139.76747668780698 16 35.682528829480646 139.76747668780698 3.23 35.682205013942394 139.7673982929148 3.23 35.682205013942394 139.7673982929148 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-f6339ca8-a3c1-45ca-b6f1-df1e8ffaeb16">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-f6339ca8-a3c1-45ca-b6f1-df1e8ffaeb16">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-f6339ca8-a3c1-45ca-b6f1-df1e8ffaeb16">
											<gml:posList>35.68021598464538 139.76676030536103 16 35.68023386399124 139.76668813850634 16 35.68023386399124 139.76668813850634 16.614 35.68021598464538 139.76676030536103 16.614 35.68021598464538 139.76676030536103 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-aacc0e98-e50c-43ef-8d47-111722e63cf5">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-aacc0e98-e50c-43ef-8d47-111722e63cf5">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-aacc0e98-e50c-43ef-8d47-111722e63cf5">
											<gml:posList>35.68277340864544 139.76754454231553 16 35.6827580332747 139.76761426761314 16 35.682758042288405 139.76761426760575 3.23 35.68277340864544 139.76754454231553 3.23 35.68277340864544 139.76754454231553 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-59a82cd9-e457-4897-8881-3c135e455622">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-59a82cd9-e457-4897-8881-3c135e455622">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-59a82cd9-e457-4897-8881-3c135e455622">
											<gml:posList>35.68196881494117 139.76732590280739 16 35.682205013942394 139.7673982929148 16 35.682205013942394 139.7673982929148 3.23 35.68196881494117 139.76732590280739 3.23 35.68196881494117 139.76732590280739 16</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:address>
				<core:Address>
					<core:xalAddress>
						<xAL:AddressDetails>
							<xAL:Country>
								<xAL:CountryName>日本</xAL:CountryName>
								<xAL:Locality>
									<xAL:LocalityName Type="Town">東京都千代田区丸の内一丁目</xAL:LocalityName>
								</xAL:Locality>
							</xAL:Country>
						</xAL:AddressDetails>
					</core:xalAddress>
				</core:Address>
			</bldg:address>
			<uro:bldgDataQualityAttribute>
				<uro:DataQualityAttribute>
					<uro:geometrySrcDescLod0 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod0>
					<uro:geometrySrcDescLod1 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod1>
					<uro:geometrySrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod2>
					<uro:geometrySrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">999</uro:geometrySrcDescLod3>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">201</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">000</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">023</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">400</uro:thematicSrcDesc>
					<uro:appearanceSrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">1</uro:appearanceSrcDescLod2>
					<uro:appearanceSrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">99</uro:appearanceSrcDescLod3>
					<uro:lodType codeSpace="../../codelists/Building_lodType.xml">2.2</uro:lodType>
					<uro:lod1HeightType codeSpace="../../codelists/DataQualityAttribute_lod1HeightType.xml">2</uro:lod1HeightType>
					<uro:publicSurveyDataQualityAttribute>
						<uro:PublicSurveyDataQualityAttribute>
							<uro:srcScaleLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod0>
							<uro:srcScaleLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod1>
							<uro:srcScaleLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod2>
							<uro:publicSurveySrcDescLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod0>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod2>
						</uro:PublicSurveyDataQualityAttribute>
					</uro:publicSurveyDataQualityAttribute>
				</uro:DataQualityAttribute>
			</uro:bldgDataQualityAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">10</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.14</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">31</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.15</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">8</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.15</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:HighTideRiskAttribute>
					<uro:description codeSpace="../../codelists/HighTideRiskAttribute_description.xml">2</uro:description>
					<uro:rank codeSpace="../../codelists/HighTideRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.11</uro:depth>
				</uro:HighTideRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">100</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key100.xml">11</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">101</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key101.xml">1</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">102</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key102.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">103</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key103.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">104</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key104.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">105</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key105.xml">9</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">106</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key106.xml">10</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:buildingDetailAttribute>
				<uro:BuildingDetailAttribute>
					<uro:buildingRoofEdgeArea uom="m2">4095.69785</uro:buildingRoofEdgeArea>
					<uro:fireproofStructureType codeSpace="../../codelists/BuildingDetailAttribute_fireproofStructureType.xml">1001</uro:fireproofStructureType>
					<uro:urbanPlanType codeSpace="../../codelists/Common_urbanPlanType.xml">21</uro:urbanPlanType>
					<uro:areaClassificationType codeSpace="../../codelists/Common_areaClassificationType.xml">22</uro:areaClassificationType>
					<uro:districtsAndZonesType codeSpace="../../codelists/Common_districtsAndZonesType.xml">10</uro:districtsAndZonesType>
					<uro:landUseType codeSpace="../../codelists/Common_landUseType.xml">216</uro:landUseType>
					<uro:detailedUsage codeSpace="../../codelists/BuildingDetailAttribute_detailedUsage.xml">1431</uro:detailedUsage>
					<uro:specifiedBuildingCoverageRate>80</uro:specifiedBuildingCoverageRate>
					<uro:specifiedFloorAreaRate>900</uro:specifiedFloorAreaRate>
					<uro:surveyYear>2021</uro:surveyYear>
				</uro:BuildingDetailAttribute>
			</uro:buildingDetailAttribute>
			<uro:buildingIDAttribute>
				<uro:BuildingIDAttribute>
					<uro:buildingID>13101-bldg-4177</uro:buildingID>
					<uro:prefecture codeSpace="../../codelists/Common_localPublicAuthorities.xml">13</uro:prefecture>
					<uro:city codeSpace="../../codelists/Common_localPublicAuthorities.xml">13101</uro:city>
				</uro:BuildingIDAttribute>
			</uro:buildingIDAttribute>
		</bldg:Building>
	</core:cityObjectMember>
	<core:cityObjectMember>
		<bldg:Building gml:id="bldg_5c10c04e-d235-4783-85c3-01b691187319">
			<core:creationDate>2024-03-15</core:creationDate>
			<gen:stringAttribute name="延べ面積換算係数">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="説明注記">
				<gen:value> </gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="大字・町コード">
				<gen:value>55</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="町・丁目コード">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="13+区市町村コード+大字・町コード+町・丁目コード">
				<gen:value>13101055001</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="地区計画">
				<gen:value>大手町・丸の内・有楽町地区</gen:value>
			</gen:stringAttribute>
			<bldg:class codeSpace="../../codelists/Building_class.xml">3003</bldg:class>
			<bldg:usage codeSpace="../../codelists/Building_usage.xml">431</bldg:usage>
			<bldg:measuredHeight uom="m">20.3</bldg:measuredHeight>
			<bldg:storeysAboveGround>3</bldg:storeysAboveGround>
			<bldg:storeysBelowGround>0</bldg:storeysBelowGround>
			<bldg:lod0RoofEdge>
				<gml:MultiSurface>
					<gml:surfaceMember>
						<gml:Polygon>
							<gml:exterior>
								<gml:LinearRing>
									<gml:posList>35.682374472096484 139.76672746773846 0 35.68233286917354 139.766702810238 0 35.68222096967751 139.76663184322027 0 35.68204628923377 139.76652769671625 0 35.68180445614706 139.7664066703969 0 35.6817672185757 139.7663886382897 0 35.681545063811974 139.76630111536923 0 35.681453655233206 139.7662678716947 0 35.68146082411813 139.7662408649001 0 35.68122552406198 139.7661492660715 0 35.68121266218513 139.76619899174852 0 35.68095770496363 139.76611060260444 0 35.6807407129967 139.76605366805134 0 35.68052228016052 139.76599916550114 0 35.680387781037155 139.76597331654142 0 35.68038499284276 139.7659841455723 0 35.681174975589464 139.76634419074284 0 35.68116445228289 139.76638507620578 0 35.68140733435692 139.76647966328122 0 35.681417947893564 139.76643888810926 0 35.68171907375128 139.76656093618223 0 35.68208223037308 139.76671287332283 0 35.68250932959304 139.7669145739359 0 35.682513991794174 139.76690042871658 0 35.682538631232326 139.76690941236077 0 35.682548550880675 139.766868681437 0 35.68252354786548 139.7668542183299 0 35.68252783734445 139.76683599672546 0 35.68237113460411 139.76673939121173 0 35.682374472096484 139.76672746773846 0</gml:posList>
								</gml:LinearRing>
							</gml:exterior>
						</gml:Polygon>
					</gml:surfaceMember>
				</gml:MultiSurface>
			</bldg:lod0RoofEdge>
			<bldg:lod1Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682374472096484 139.76672746773846 3.4 35.68237113460411 139.76673939121173 3.4 35.68252783734445 139.76683599672546 3.4 35.68252354786548 139.7668542183299 3.4 35.682548550880675 139.766868681437 3.4 35.682538631232326 139.76690941236077 3.4 35.682513991794174 139.76690042871658 3.4 35.68250932959304 139.7669145739359 3.4 35.68208223037308 139.76671287332283 3.4 35.68171907375128 139.76656093618223 3.4 35.681417947893564 139.76643888810926 3.4 35.68140733435692 139.76647966328122 3.4 35.68116445228289 139.76638507620578 3.4 35.681174975589464 139.76634419074284 3.4 35.68038499284276 139.7659841455723 3.4 35.680387781037155 139.76597331654142 3.4 35.68052228016052 139.76599916550114 3.4 35.6807407129967 139.76605366805134 3.4 35.68095770496363 139.76611060260444 3.4 35.68121266218513 139.76619899174852 3.4 35.68122552406198 139.7661492660715 3.4 35.68146082411813 139.7662408649001 3.4 35.681453655233206 139.7662678716947 3.4 35.681545063811974 139.76630111536923 3.4 35.6817672185757 139.7663886382897 3.4 35.68180445614706 139.7664066703969 3.4 35.68204628923377 139.76652769671625 3.4 35.68222096967751 139.76663184322027 3.4 35.68233286917354 139.766702810238 3.4 35.682374472096484 139.76672746773846 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682374472096484 139.76672746773846 3.4 35.68233286917354 139.766702810238 3.4 35.68233286917354 139.766702810238 23.4 35.682374472096484 139.76672746773846 23.4 35.682374472096484 139.76672746773846 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68233286917354 139.766702810238 3.4 35.68222096967751 139.76663184322027 3.4 35.68222096967751 139.76663184322027 23.4 35.68233286917354 139.766702810238 23.4 35.68233286917354 139.766702810238 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68222096967751 139.76663184322027 3.4 35.68204628923377 139.76652769671625 3.4 35.68204628923377 139.76652769671625 23.4 35.68222096967751 139.76663184322027 23.4 35.68222096967751 139.76663184322027 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68204628923377 139.76652769671625 3.4 35.68180445614706 139.7664066703969 3.4 35.68180445614706 139.7664066703969 23.4 35.68204628923377 139.76652769671625 23.4 35.68204628923377 139.76652769671625 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68180445614706 139.7664066703969 3.4 35.6817672185757 139.7663886382897 3.4 35.6817672185757 139.7663886382897 23.4 35.68180445614706 139.7664066703969 23.4 35.68180445614706 139.7664066703969 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.6817672185757 139.7663886382897 3.4 35.681545063811974 139.76630111536923 3.4 35.681545063811974 139.76630111536923 23.4 35.6817672185757 139.7663886382897 23.4 35.6817672185757 139.7663886382897 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681545063811974 139.76630111536923 3.4 35.681453655233206 139.7662678716947 3.4 35.681453655233206 139.7662678716947 23.4 35.681545063811974 139.76630111536923 23.4 35.681545063811974 139.76630111536923 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681453655233206 139.7662678716947 3.4 35.68146082411813 139.7662408649001 3.4 35.68146082411813 139.7662408649001 23.4 35.681453655233206 139.7662678716947 23.4 35.681453655233206 139.7662678716947 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68146082411813 139.7662408649001 3.4 35.68122552406198 139.7661492660715 3.4 35.68122552406198 139.7661492660715 23.4 35.68146082411813 139.7662408649001 23.4 35.68146082411813 139.7662408649001 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68122552406198 139.7661492660715 3.4 35.68121266218513 139.76619899174852 3.4 35.68121266218513 139.76619899174852 23.4 35.68122552406198 139.7661492660715 23.4 35.68122552406198 139.7661492660715 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68121266218513 139.76619899174852 3.4 35.68095770496363 139.76611060260444 3.4 35.68095770496363 139.76611060260444 23.4 35.68121266218513 139.76619899174852 23.4 35.68121266218513 139.76619899174852 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68095770496363 139.76611060260444 3.4 35.6807407129967 139.76605366805134 3.4 35.6807407129967 139.76605366805134 23.4 35.68095770496363 139.76611060260444 23.4 35.68095770496363 139.76611060260444 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.6807407129967 139.76605366805134 3.4 35.68052228016052 139.76599916550114 3.4 35.68052228016052 139.76599916550114 23.4 35.6807407129967 139.76605366805134 23.4 35.6807407129967 139.76605366805134 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68052228016052 139.76599916550114 3.4 35.680387781037155 139.76597331654142 3.4 35.680387781037155 139.76597331654142 23.4 35.68052228016052 139.76599916550114 23.4 35.68052228016052 139.76599916550114 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680387781037155 139.76597331654142 3.4 35.68038499284276 139.7659841455723 3.4 35.68038499284276 139.7659841455723 23.4 35.680387781037155 139.76597331654142 23.4 35.680387781037155 139.76597331654142 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68038499284276 139.7659841455723 3.4 35.681174975589464 139.76634419074284 3.4 35.681174975589464 139.76634419074284 23.4 35.68038499284276 139.7659841455723 23.4 35.68038499284276 139.7659841455723 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681174975589464 139.76634419074284 3.4 35.68116445228289 139.76638507620578 3.4 35.68116445228289 139.76638507620578 23.4 35.681174975589464 139.76634419074284 23.4 35.681174975589464 139.76634419074284 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68116445228289 139.76638507620578 3.4 35.68140733435692 139.76647966328122 3.4 35.68140733435692 139.76647966328122 23.4 35.68116445228289 139.76638507620578 23.4 35.68116445228289 139.76638507620578 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68140733435692 139.76647966328122 3.4 35.681417947893564 139.76643888810926 3.4 35.681417947893564 139.76643888810926 23.4 35.68140733435692 139.76647966328122 23.4 35.68140733435692 139.76647966328122 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681417947893564 139.76643888810926 3.4 35.68171907375128 139.76656093618223 3.4 35.68171907375128 139.76656093618223 23.4 35.681417947893564 139.76643888810926 23.4 35.681417947893564 139.76643888810926 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68171907375128 139.76656093618223 3.4 35.68208223037308 139.76671287332283 3.4 35.68208223037308 139.76671287332283 23.4 35.68171907375128 139.76656093618223 23.4 35.68171907375128 139.76656093618223 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68208223037308 139.76671287332283 3.4 35.68250932959304 139.7669145739359 3.4 35.68250932959304 139.7669145739359 23.4 35.68208223037308 139.76671287332283 23.4 35.68208223037308 139.76671287332283 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68250932959304 139.7669145739359 3.4 35.682513991794174 139.76690042871658 3.4 35.682513991794174 139.76690042871658 23.4 35.68250932959304 139.7669145739359 23.4 35.68250932959304 139.7669145739359 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682513991794174 139.76690042871658 3.4 35.682538631232326 139.76690941236077 3.4 35.682538631232326 139.76690941236077 23.4 35.682513991794174 139.76690042871658 23.4 35.682513991794174 139.76690042871658 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682538631232326 139.76690941236077 3.4 35.682548550880675 139.766868681437 3.4 35.682548550880675 139.766868681437 23.4 35.682538631232326 139.76690941236077 23.4 35.682538631232326 139.76690941236077 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682548550880675 139.766868681437 3.4 35.68252354786548 139.7668542183299 3.4 35.68252354786548 139.7668542183299 23.4 35.682548550880675 139.766868681437 23.4 35.682548550880675 139.766868681437 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68252354786548 139.7668542183299 3.4 35.68252783734445 139.76683599672546 3.4 35.68252783734445 139.76683599672546 23.4 35.68252354786548 139.7668542183299 23.4 35.68252354786548 139.7668542183299 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68252783734445 139.76683599672546 3.4 35.68237113460411 139.76673939121173 3.4 35.68237113460411 139.76673939121173 23.4 35.68252783734445 139.76683599672546 23.4 35.68252783734445 139.76683599672546 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68237113460411 139.76673939121173 3.4 35.682374472096484 139.76672746773846 3.4 35.682374472096484 139.76672746773846 23.4 35.68237113460411 139.76673939121173 23.4 35.68237113460411 139.76673939121173 3.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682374472096484 139.76672746773846 23.4 35.68233286917354 139.766702810238 23.4 35.68222096967751 139.76663184322027 23.4 35.68204628923377 139.76652769671625 23.4 35.68180445614706 139.7664066703969 23.4 35.6817672185757 139.7663886382897 23.4 35.681545063811974 139.76630111536923 23.4 35.681453655233206 139.7662678716947 23.4 35.68146082411813 139.7662408649001 23.4 35.68122552406198 139.7661492660715 23.4 35.68121266218513 139.76619899174852 23.4 35.68095770496363 139.76611060260444 23.4 35.6807407129967 139.76605366805134 23.4 35.68052228016052 139.76599916550114 23.4 35.680387781037155 139.76597331654142 23.4 35.68038499284276 139.7659841455723 23.4 35.681174975589464 139.76634419074284 23.4 35.68116445228289 139.76638507620578 23.4 35.68140733435692 139.76647966328122 23.4 35.681417947893564 139.76643888810926 23.4 35.68171907375128 139.76656093618223 23.4 35.68208223037308 139.76671287332283 23.4 35.68250932959304 139.7669145739359 23.4 35.682513991794174 139.76690042871658 23.4 35.682538631232326 139.76690941236077 23.4 35.682548550880675 139.766868681437 23.4 35.68252354786548 139.7668542183299 23.4 35.68252783734445 139.76683599672546 23.4 35.68237113460411 139.76673939121173 23.4 35.682374472096484 139.76672746773846 23.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod1Solid>
			<bldg:lod2Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember xlink:href="#poly-9ff6b9ea-fd81-43dd-9de2-1b6180176107"/>
							<gml:surfaceMember xlink:href="#poly-82451de5-92f9-4744-9801-45e3308794a2"/>
							<gml:surfaceMember xlink:href="#poly-9adbdca4-528f-495c-bae0-e00db885c174"/>
							<gml:surfaceMember xlink:href="#poly-c1fd841e-84e2-4775-b9e9-a1335aeb31cb"/>
							<gml:surfaceMember xlink:href="#poly-76749101-9f0e-4237-8231-3f389ad415cc"/>
							<gml:surfaceMember xlink:href="#poly-5ddb99a1-d610-4323-94be-f528c58cd1d3"/>
							<gml:surfaceMember xlink:href="#poly-4637c443-884b-4af4-ae44-95b02d316291"/>
							<gml:surfaceMember xlink:href="#poly-fb4748bc-5412-46ca-b03d-0f9ad1fb756b"/>
							<gml:surfaceMember xlink:href="#poly-66938b8d-b684-44e1-8039-52f2e2fcbd43"/>
							<gml:surfaceMember xlink:href="#poly-fc3b53cf-4b6b-46fc-99e8-f992929f447e"/>
							<gml:surfaceMember xlink:href="#poly-e5c43bc2-341f-4f28-9cb3-72f1c8166e31"/>
							<gml:surfaceMember xlink:href="#poly-826b0b6b-da28-4564-92e6-eb61f6215981"/>
							<gml:surfaceMember xlink:href="#poly-3e73213b-71c6-46af-b3f2-10d4437ebeb8"/>
							<gml:surfaceMember xlink:href="#poly-a5696a05-d741-4cdd-b03d-c248a201a4f8"/>
							<gml:surfaceMember xlink:href="#poly-3e296698-fcdb-4afa-9c94-9b8807849fef"/>
							<gml:surfaceMember xlink:href="#poly-d1696dad-507b-4b4b-a901-68e718695117"/>
							<gml:surfaceMember xlink:href="#poly-247ec678-ec28-4a76-af6d-4d2f17c18c78"/>
							<gml:surfaceMember xlink:href="#poly-d048e805-eed5-4562-a504-fefbf407498d"/>
							<gml:surfaceMember xlink:href="#poly-e9fcef1e-4100-4539-953d-6212a2614d86"/>
							<gml:surfaceMember xlink:href="#poly-a699b9a3-bd89-46ff-bd0e-e02577aa4387"/>
							<gml:surfaceMember xlink:href="#poly-922d8aff-0496-4faa-9c97-a02033dd5e66"/>
							<gml:surfaceMember xlink:href="#poly-aa027c89-6a63-4f81-831c-5d45b439b495"/>
							<gml:surfaceMember xlink:href="#poly-0808935e-f1b0-488a-b5db-2e4a925db059"/>
							<gml:surfaceMember xlink:href="#poly-4bc9a0fc-3bac-43c8-9b6f-a3cadc9efc79"/>
							<gml:surfaceMember xlink:href="#poly-62b3246a-2eb6-4d39-bb62-b345b8676bbc"/>
							<gml:surfaceMember xlink:href="#poly-64018457-95eb-4aad-a537-f41ecf753b52"/>
							<gml:surfaceMember xlink:href="#poly-12036fae-ed7b-470a-9a91-a6a863129469"/>
							<gml:surfaceMember xlink:href="#poly-0a237e2e-9f8e-4e0d-a559-8328118b19ba"/>
							<gml:surfaceMember xlink:href="#poly-24b1f3e7-b51b-46a3-9027-937785aa2084"/>
							<gml:surfaceMember xlink:href="#poly-f9dd27d6-1e27-4ba5-9062-06294682c920"/>
							<gml:surfaceMember xlink:href="#poly-7010a875-810a-473c-8b3c-ebb36b07a938"/>
							<gml:surfaceMember xlink:href="#poly-447ec6b7-6f72-450c-9cde-c7a63f73890e"/>
							<gml:surfaceMember xlink:href="#poly-32ff0133-9c79-4087-a7bb-dcc82db94e50"/>
							<gml:surfaceMember xlink:href="#poly-6286a6dd-6719-4180-bca8-d622e61838af"/>
							<gml:surfaceMember xlink:href="#poly-45be955f-be62-4926-a660-98c9b372d4ad"/>
							<gml:surfaceMember xlink:href="#poly-6b6652c2-5382-4ea9-a68b-a80e5b7e5a9a"/>
							<gml:surfaceMember xlink:href="#poly-0a9917e2-0ab1-4aab-975f-5542c710cba0"/>
							<gml:surfaceMember xlink:href="#poly-38f24ccf-94f3-426c-95df-a77b59fe8ee1"/>
							<gml:surfaceMember xlink:href="#poly-8510d0cd-bf18-4119-ab5b-fd8608c6be9f"/>
							<gml:surfaceMember xlink:href="#poly-40bf49c0-88c4-407d-8337-b6504b486a48"/>
							<gml:surfaceMember xlink:href="#poly-bd8570a9-da67-4a2a-8b22-6044b38a307b"/>
							<gml:surfaceMember xlink:href="#poly-5c181d71-0e3f-48a2-b275-784e2a77e1dd"/>
							<gml:surfaceMember xlink:href="#poly-41eacea8-610a-4b97-a847-42475ac2e776"/>
							<gml:surfaceMember xlink:href="#poly-0a923023-f407-4b80-92d8-51c1e504c022"/>
							<gml:surfaceMember xlink:href="#poly-f9fb31d5-c0bf-48cf-ba88-b9a4101cccd4"/>
							<gml:surfaceMember xlink:href="#poly-79e1c0ba-8ac6-4129-8b70-7b2844cd7103"/>
							<gml:surfaceMember xlink:href="#poly-87a821ad-3055-4820-bf9c-e4497823d662"/>
							<gml:surfaceMember xlink:href="#poly-8ca97646-16b9-47c3-96db-d08ac9604fc4"/>
							<gml:surfaceMember xlink:href="#poly-b6038a9d-a3ba-46a9-be78-4d2bcf4e94e1"/>
							<gml:surfaceMember xlink:href="#poly-7dd7ca2d-7c7c-45a9-ba04-cb9d05133ad7"/>
							<gml:surfaceMember xlink:href="#poly-df3f2be8-3822-43dd-b4d8-c5b8fe913e22"/>
							<gml:surfaceMember xlink:href="#poly-5e1adafd-d47c-455c-854a-4ad156ab8c73"/>
							<gml:surfaceMember xlink:href="#poly-f597693c-f92c-448a-aa0e-491a0fece5b0"/>
							<gml:surfaceMember xlink:href="#poly-d556fbdc-5185-4700-90fd-b62f03a080e7"/>
							<gml:surfaceMember xlink:href="#poly-b44a51e7-c2b4-493b-8760-b3fbf8c181a9"/>
							<gml:surfaceMember xlink:href="#poly-46cf00d8-990c-4ca5-9787-21d5a60709a2"/>
							<gml:surfaceMember xlink:href="#poly-50319cc5-0528-4fbd-922a-0cdd4bbe7fa8"/>
							<gml:surfaceMember xlink:href="#poly-0109b030-40df-4fe5-be6d-b8cfae748cbd"/>
							<gml:surfaceMember xlink:href="#poly-79df5a7e-7e2a-4c6b-8700-3eeca5cf60b3"/>
							<gml:surfaceMember xlink:href="#poly-d6e0b52b-3664-4ddf-aaa4-0b354bbbc3d2"/>
							<gml:surfaceMember xlink:href="#poly-5dc2ac39-cdf4-4172-893c-487ee7fee4d9"/>
							<gml:surfaceMember xlink:href="#poly-372ea6c7-5e26-40ba-a969-03212281927d"/>
							<gml:surfaceMember xlink:href="#poly-093b989e-db08-4e57-8482-e5d0af2ef181"/>
							<gml:surfaceMember xlink:href="#poly-786191c6-4e4d-4ece-b523-23be693b8594"/>
							<gml:surfaceMember xlink:href="#poly-dd8ca001-d14c-485e-a27a-59b50c0c60e4"/>
							<gml:surfaceMember xlink:href="#poly-0583de4f-221e-442b-abb7-1214844a7e90"/>
							<gml:surfaceMember xlink:href="#poly-e1e71efa-4f57-4620-bd95-32dd73f0419a"/>
							<gml:surfaceMember xlink:href="#poly-abdaaaa1-fd8c-4456-90fb-9537d8952d01"/>
							<gml:surfaceMember xlink:href="#poly-3b7eaefe-2d88-4476-82a5-2f696999e87e"/>
							<gml:surfaceMember xlink:href="#poly-53bc5912-4223-4524-bed5-d0fb000cd8e5"/>
							<gml:surfaceMember xlink:href="#poly-a7a5f9e6-30a8-4f32-a05e-14c31a185a5f"/>
							<gml:surfaceMember xlink:href="#poly-4cdd777a-96db-4d32-8318-9926c203cb05"/>
							<gml:surfaceMember xlink:href="#poly-686b813e-74df-4d84-8ae7-f0f9c51fa9e4"/>
							<gml:surfaceMember xlink:href="#poly-397b6f51-73b9-45a9-81e4-91af675509d6"/>
							<gml:surfaceMember xlink:href="#poly-bbfe640a-889e-44db-88a6-af6be28f4aec"/>
							<gml:surfaceMember xlink:href="#poly-90c77a46-c0ce-41b6-9f21-4c7c2d60a37c"/>
							<gml:surfaceMember xlink:href="#poly-b5895c77-7d88-48f3-874f-0bb856f17e19"/>
							<gml:surfaceMember xlink:href="#poly-c5576606-13b9-42fe-b679-61d6a0584972"/>
							<gml:surfaceMember xlink:href="#poly-dccd7b68-97a4-4581-bfa4-3d52e83ed618"/>
							<gml:surfaceMember xlink:href="#poly-99ec5e03-537f-4f4b-a0ce-51084e0e5268"/>
							<gml:surfaceMember xlink:href="#poly-8327dd6a-9894-44b0-a956-723ef3336710"/>
							<gml:surfaceMember xlink:href="#poly-7db328ee-bf65-4242-a966-2954b2e3a0e6"/>
							<gml:surfaceMember xlink:href="#poly-ed053091-8f9b-4f4c-8788-4764ec2d3286"/>
							<gml:surfaceMember xlink:href="#poly-820cd84c-030e-45da-9dc8-f285795f3306"/>
							<gml:surfaceMember xlink:href="#poly-23a12a8b-4e9c-4821-a1ff-053647bdb5e4"/>
							<gml:surfaceMember xlink:href="#poly-b6a4edde-84d9-4af0-9418-b97bbf8f2d04"/>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod2Solid>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-66938b8d-b684-44e1-8039-52f2e2fcbd43">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-66938b8d-b684-44e1-8039-52f2e2fcbd43">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-66938b8d-b684-44e1-8039-52f2e2fcbd43">
											<gml:posList>35.681212662185125 139.76619899174852 3.404 35.68146082411813 139.7662408649001 3.404 35.68145365523321 139.7662678716947 3.404 35.681212662185125 139.76619899174852 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-3e296698-fcdb-4afa-9c94-9b8807849fef">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-3e296698-fcdb-4afa-9c94-9b8807849fef">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-3e296698-fcdb-4afa-9c94-9b8807849fef">
											<gml:posList>35.68204628923377 139.76652769671625 3.404 35.68222096967751 139.76663184322027 3.404 35.68233286917354 139.766702810238 3.404 35.68204628923377 139.76652769671625 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-c1fd841e-84e2-4775-b9e9-a1335aeb31cb">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c1fd841e-84e2-4775-b9e9-a1335aeb31cb">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c1fd841e-84e2-4775-b9e9-a1335aeb31cb">
											<gml:posList>35.68038499284277 139.7659841455723 3.404 35.680387781037155 139.76597331654142 3.404 35.68052228016051 139.76599916550114 3.404 35.68038499284277 139.7659841455723 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-fc3b53cf-4b6b-46fc-99e8-f992929f447e">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-fc3b53cf-4b6b-46fc-99e8-f992929f447e">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-fc3b53cf-4b6b-46fc-99e8-f992929f447e">
											<gml:posList>35.68145365523321 139.7662678716947 3.404 35.68154506381198 139.76630111536923 3.404 35.68176721947707 139.76638863828893 3.404 35.68145365523321 139.7662678716947 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-62b3246a-2eb6-4d39-bb62-b345b8676bbc">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-62b3246a-2eb6-4d39-bb62-b345b8676bbc">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-62b3246a-2eb6-4d39-bb62-b345b8676bbc">
											<gml:posList>35.68038499284277 139.7659841455723 3.404 35.68204628923377 139.76652769671625 3.404 35.68208223037308 139.76671287332283 3.404 35.68038499284277 139.7659841455723 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-3e73213b-71c6-46af-b3f2-10d4437ebeb8">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-3e73213b-71c6-46af-b3f2-10d4437ebeb8">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-3e73213b-71c6-46af-b3f2-10d4437ebeb8">
											<gml:posList>35.681212662185125 139.76619899174852 3.404 35.68145365523321 139.7662678716947 3.404 35.68204628923377 139.76652769671625 3.404 35.681212662185125 139.76619899174852 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-826b0b6b-da28-4564-92e6-eb61f6215981">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-826b0b6b-da28-4564-92e6-eb61f6215981">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-826b0b6b-da28-4564-92e6-eb61f6215981">
											<gml:posList>35.68145365523321 139.7662678716947 3.404 35.68176721947707 139.76638863828893 3.404 35.68204628923377 139.76652769671625 3.404 35.68145365523321 139.7662678716947 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-d1696dad-507b-4b4b-a901-68e718695117">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d1696dad-507b-4b4b-a901-68e718695117">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d1696dad-507b-4b4b-a901-68e718695117">
											<gml:posList>35.68233286917354 139.766702810238 3.404 35.682374472096484 139.76672746773846 3.404 35.682371134604104 139.76673939121173 3.404 35.68233286917354 139.766702810238 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-a699b9a3-bd89-46ff-bd0e-e02577aa4387">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a699b9a3-bd89-46ff-bd0e-e02577aa4387">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a699b9a3-bd89-46ff-bd0e-e02577aa4387">
											<gml:posList>35.682371134604104 139.76673939121173 3.404 35.68252354786548 139.76685421832988 3.404 35.68253863123233 139.76690941236077 3.404 35.682371134604104 139.76673939121173 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-aa027c89-6a63-4f81-831c-5d45b439b495">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-aa027c89-6a63-4f81-831c-5d45b439b495">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-aa027c89-6a63-4f81-831c-5d45b439b495">
											<gml:posList>35.682513991794174 139.76690042871658 3.404 35.682509330494405 139.76691457393517 3.404 35.68208223037308 139.76671287332283 3.404 35.682513991794174 139.76690042871658 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-a5696a05-d741-4cdd-b03d-c248a201a4f8">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a5696a05-d741-4cdd-b03d-c248a201a4f8">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a5696a05-d741-4cdd-b03d-c248a201a4f8">
											<gml:posList>35.68038499284277 139.7659841455723 3.404 35.681212662185125 139.76619899174852 3.404 35.68204628923377 139.76652769671625 3.404 35.68038499284277 139.7659841455723 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-4637c443-884b-4af4-ae44-95b02d316291">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-4637c443-884b-4af4-ae44-95b02d316291">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-4637c443-884b-4af4-ae44-95b02d316291">
											<gml:posList>35.68038499284277 139.7659841455723 3.404 35.68095770496364 139.76611060260444 3.404 35.681212662185125 139.76619899174852 3.404 35.68038499284277 139.7659841455723 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-0808935e-f1b0-488a-b5db-2e4a925db059">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0808935e-f1b0-488a-b5db-2e4a925db059">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0808935e-f1b0-488a-b5db-2e4a925db059">
											<gml:posList>35.68253863123233 139.76690941236077 3.404 35.682513991794174 139.76690042871658 3.404 35.68208223037308 139.76671287332283 3.404 35.68253863123233 139.76690941236077 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-64018457-95eb-4aad-a537-f41ecf753b52">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-64018457-95eb-4aad-a537-f41ecf753b52">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-64018457-95eb-4aad-a537-f41ecf753b52">
											<gml:posList>35.68038499284277 139.7659841455723 3.404 35.68208223037308 139.76671287332283 3.404 35.68171907375128 139.76656093618223 3.404 35.68038499284277 139.7659841455723 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-922d8aff-0496-4faa-9c97-a02033dd5e66">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-922d8aff-0496-4faa-9c97-a02033dd5e66">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-922d8aff-0496-4faa-9c97-a02033dd5e66">
											<gml:posList>35.68204628923377 139.76652769671625 3.404 35.682371134604104 139.76673939121173 3.404 35.68253863123233 139.76690941236077 3.404 35.68204628923377 139.76652769671625 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-5ddb99a1-d610-4323-94be-f528c58cd1d3">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-5ddb99a1-d610-4323-94be-f528c58cd1d3">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-5ddb99a1-d610-4323-94be-f528c58cd1d3">
											<gml:posList>35.68038499284277 139.7659841455723 3.404 35.68052228016051 139.76599916550114 3.404 35.68095770496364 139.76611060260444 3.404 35.68038499284277 139.7659841455723 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-4bc9a0fc-3bac-43c8-9b6f-a3cadc9efc79">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-4bc9a0fc-3bac-43c8-9b6f-a3cadc9efc79">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-4bc9a0fc-3bac-43c8-9b6f-a3cadc9efc79">
											<gml:posList>35.68204628923377 139.76652769671625 3.404 35.68253863123233 139.76690941236077 3.404 35.68208223037308 139.76671287332283 3.404 35.68204628923377 139.76652769671625 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-12036fae-ed7b-470a-9a91-a6a863129469">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-12036fae-ed7b-470a-9a91-a6a863129469">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-12036fae-ed7b-470a-9a91-a6a863129469">
											<gml:posList>35.681417947893564 139.76643888810923 3.404 35.68038499284277 139.7659841455723 3.404 35.68171907375128 139.76656093618223 3.404 35.681417947893564 139.76643888810923 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-9ff6b9ea-fd81-43dd-9de2-1b6180176107">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-9ff6b9ea-fd81-43dd-9de2-1b6180176107">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-9ff6b9ea-fd81-43dd-9de2-1b6180176107">
											<gml:posList>35.681417947893564 139.76643888810923 3.404 35.68140733435692 139.76647966328122 3.404 35.68116445228291 139.7663850762058 3.404 35.681417947893564 139.76643888810923 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-d048e805-eed5-4562-a504-fefbf407498d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d048e805-eed5-4562-a504-fefbf407498d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d048e805-eed5-4562-a504-fefbf407498d">
											<gml:posList>35.682371134604104 139.76673939121173 3.404 35.68252783734446 139.76683599672546 3.404 35.68252354786548 139.76685421832988 3.404 35.682371134604104 139.76673939121173 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-e9fcef1e-4100-4539-953d-6212a2614d86">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e9fcef1e-4100-4539-953d-6212a2614d86">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e9fcef1e-4100-4539-953d-6212a2614d86">
											<gml:posList>35.68252354786548 139.76685421832988 3.404 35.68254855088068 139.766868681437 3.404 35.68253863123233 139.76690941236077 3.404 35.68252354786548 139.76685421832988 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-82451de5-92f9-4744-9801-45e3308794a2">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-82451de5-92f9-4744-9801-45e3308794a2">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-82451de5-92f9-4744-9801-45e3308794a2">
											<gml:posList>35.681417947893564 139.76643888810923 3.404 35.68116445228291 139.7663850762058 3.404 35.68117497558948 139.76634419074284 3.404 35.681417947893564 139.76643888810923 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-e5c43bc2-341f-4f28-9cb3-72f1c8166e31">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e5c43bc2-341f-4f28-9cb3-72f1c8166e31">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e5c43bc2-341f-4f28-9cb3-72f1c8166e31">
											<gml:posList>35.68176721947707 139.76638863828893 3.404 35.68180445614707 139.76640667039686 3.404 35.68204628923377 139.76652769671625 3.404 35.68176721947707 139.76638863828893 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-fb4748bc-5412-46ca-b03d-0f9ad1fb756b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-fb4748bc-5412-46ca-b03d-0f9ad1fb756b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-fb4748bc-5412-46ca-b03d-0f9ad1fb756b">
											<gml:posList>35.681212662185125 139.76619899174852 3.404 35.68122552406198 139.7661492660715 3.404 35.68146082411813 139.7662408649001 3.404 35.681212662185125 139.76619899174852 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-76749101-9f0e-4237-8231-3f389ad415cc">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-76749101-9f0e-4237-8231-3f389ad415cc">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-76749101-9f0e-4237-8231-3f389ad415cc">
											<gml:posList>35.68052228016051 139.76599916550114 3.404 35.6807407129967 139.76605366805134 3.404 35.68095770496364 139.76611060260444 3.404 35.68052228016051 139.76599916550114 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-9adbdca4-528f-495c-bae0-e00db885c174">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-9adbdca4-528f-495c-bae0-e00db885c174">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-9adbdca4-528f-495c-bae0-e00db885c174">
											<gml:posList>35.681417947893564 139.76643888810923 3.404 35.68117497558948 139.76634419074284 3.404 35.68038499284277 139.7659841455723 3.404 35.681417947893564 139.76643888810923 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-247ec678-ec28-4a76-af6d-4d2f17c18c78">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-247ec678-ec28-4a76-af6d-4d2f17c18c78">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-247ec678-ec28-4a76-af6d-4d2f17c18c78">
											<gml:posList>35.68204628923377 139.76652769671625 3.404 35.68233286917354 139.766702810238 3.404 35.682371134604104 139.76673939121173 3.404 35.68204628923377 139.76652769671625 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-6286a6dd-6719-4180-bca8-d622e61838af">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-6286a6dd-6719-4180-bca8-d622e61838af">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-6286a6dd-6719-4180-bca8-d622e61838af">
											<gml:posList>35.681417947893564 139.76643888810923 24.5 35.68145365523321 139.7662678716947 24.5 35.68128589333034 139.76643236967197 27.126 35.681417947893564 139.76643888810923 24.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-32ff0133-9c79-4087-a7bb-dcc82db94e50">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-32ff0133-9c79-4087-a7bb-dcc82db94e50">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-32ff0133-9c79-4087-a7bb-dcc82db94e50">
											<gml:posList>35.681417947893564 139.76643888810923 24.5 35.68145888425067 139.76626977858643 24.5 35.68145365523321 139.7662678716947 24.5 35.681417947893564 139.76643888810923 24.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-0a237e2e-9f8e-4e0d-a559-8328118b19ba">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0a237e2e-9f8e-4e0d-a559-8328118b19ba">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0a237e2e-9f8e-4e0d-a559-8328118b19ba">
											<gml:posList>35.680080309915375 139.76594971213984 19.8 35.68007816306718 139.7659791005557 19.8 35.6803776177238 139.7660129861085 19.8 35.68038499284277 139.7659841455723 19.8 35.680080309915375 139.76594971213984 19.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-447ec6b7-6f72-450c-9cde-c7a63f73890e">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-447ec6b7-6f72-450c-9cde-c7a63f73890e">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-447ec6b7-6f72-450c-9cde-c7a63f73890e">
											<gml:posList>35.68145365523321 139.7662678716947 24.5 35.68146082411813 139.7662408649001 24.5 35.68128589333034 139.76643236967197 27.126 35.68145365523321 139.7662678716947 24.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-38f24ccf-94f3-426c-95df-a77b59fe8ee1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-38f24ccf-94f3-426c-95df-a77b59fe8ee1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-38f24ccf-94f3-426c-95df-a77b59fe8ee1">
											<gml:posList>35.68254855088068 139.766868681437 22.4 35.68252637005964 139.7668558510833 22.4 35.682513991794174 139.76690042871658 22.4 35.68253862221862 139.76690941236825 22.4 35.68254855088068 139.766868681437 22.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-24b1f3e7-b51b-46a3-9027-937785aa2084">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-24b1f3e7-b51b-46a3-9027-937785aa2084">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-24b1f3e7-b51b-46a3-9027-937785aa2084">
											<gml:posList>35.68117497558948 139.76634419074284 23.1 35.681212662185125 139.76619899174852 23.1 35.68095770496364 139.76611060260444 23.1 35.6807407129967 139.76605366805134 23.1 35.68052228016051 139.76599916550114 23.1 35.680387781037155 139.76597331654142 23.1 35.68036223773953 139.7660728772209 23.1 35.68080695923938 139.76620695449665 23.1 35.68117497558948 139.76634419074284 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-f9dd27d6-1e27-4ba5-9062-06294682c920">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-f9dd27d6-1e27-4ba5-9062-06294682c920">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-f9dd27d6-1e27-4ba5-9062-06294682c920">
											<gml:posList>35.68128589333034 139.76643236967197 27.126 35.68134700125532 139.76619655918591 27.126 35.68122552406198 139.7661492660715 24.5 35.68116445228291 139.7663850762058 24.5 35.68128589333034 139.76643236967197 27.126</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-7010a875-810a-473c-8b3c-ebb36b07a938">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-7010a875-810a-473c-8b3c-ebb36b07a938">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-7010a875-810a-473c-8b3c-ebb36b07a938">
											<gml:posList>35.68146082411813 139.7662408649001 24.5 35.68134700125532 139.76619655918591 27.126 35.68128589333034 139.76643236967197 27.126 35.68146082411813 139.7662408649001 24.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-45be955f-be62-4926-a660-98c9b372d4ad">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-45be955f-be62-4926-a660-98c9b372d4ad">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-45be955f-be62-4926-a660-98c9b372d4ad">
											<gml:posList>35.681417947893564 139.76643888810923 24.5 35.68128589333034 139.76643236967197 27.126 35.68140733435692 139.76647966328122 24.5 35.681417947893564 139.76643888810923 24.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-6b6652c2-5382-4ea9-a68b-a80e5b7e5a9a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-6b6652c2-5382-4ea9-a68b-a80e5b7e5a9a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-6b6652c2-5382-4ea9-a68b-a80e5b7e5a9a">
											<gml:posList>35.68145888425067 139.76626977858643 20.5 35.68145709464485 139.76627718210204 20.5 35.681548395031854 139.76631038168787 20.5 35.68166144416355 139.7663573729407 20.5 35.681741965723845 139.76639345414068 20.5 35.68181349004752 139.76642676991676 20.5 35.681987114749774 139.76651245580285 20.5 35.68209641337297 139.76657440954642 20.5 35.682371134604104 139.76673939121173 20.5 35.682374472096484 139.76672746773846 20.5 35.68233286917354 139.766702810238 20.5 35.68222096967751 139.76663184322027 20.5 35.68204628923377 139.76652769671625 20.5 35.68180445614707 139.76640667039686 20.5 35.68176721947707 139.76638863828893 20.5 35.68154506381198 139.76630111536923 20.5 35.68145888425067 139.76626977858643 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-0a9917e2-0ab1-4aab-975f-5542c710cba0">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0a9917e2-0ab1-4aab-975f-5542c710cba0">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0a9917e2-0ab1-4aab-975f-5542c710cba0">
											<gml:posList>35.68181349004752 139.76642676991676 23.1 35.681741965723845 139.76639345414068 23.1 35.68166144416355 139.7663573729407 23.1 35.681548395031854 139.76631038168787 23.1 35.68145709464485 139.76627718210204 23.1 35.681417947893564 139.76643888810923 23.1 35.68171907375128 139.76656093618223 23.1 35.68208223037308 139.76671287332283 23.1 35.682509330494405 139.76691457393517 23.1 35.682513991794174 139.76690042871658 23.1 35.68252637005964 139.7668558510833 23.1 35.68252354786548 139.76685421832988 23.1 35.68252783734446 139.76683599672546 23.1 35.68209641337297 139.76657440954642 23.1 35.681987114749774 139.76651245580285 23.1 35.68181349004752 139.76642676991676 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-46cf00d8-990c-4ca5-9787-21d5a60709a2">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-46cf00d8-990c-4ca5-9787-21d5a60709a2">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-46cf00d8-990c-4ca5-9787-21d5a60709a2">
											<gml:posList>35.68134700125532 139.76619655918591 27.126 35.68146082411813 139.7662408649001 24.5 35.68146082411813 139.7662408649001 3.404 35.68122552406198 139.7661492660715 3.404 35.68122552406198 139.7661492660715 24.5 35.68134700125532 139.76619655918591 27.126</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-90c77a46-c0ce-41b6-9f21-4c7c2d60a37c">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-90c77a46-c0ce-41b6-9f21-4c7c2d60a37c">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-90c77a46-c0ce-41b6-9f21-4c7c2d60a37c">
											<gml:posList>35.68252783734446 139.76683599672546 23.1 35.682371134604104 139.76673939121173 20.5 35.68209641337297 139.76657440954642 20.5 35.68252783734446 139.76683599672546 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-686b813e-74df-4d84-8ae7-f0f9c51fa9e4">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-686b813e-74df-4d84-8ae7-f0f9c51fa9e4">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-686b813e-74df-4d84-8ae7-f0f9c51fa9e4">
											<gml:posList>35.68222096967751 139.76663184322027 20.5 35.68233286917354 139.766702810238 20.5 35.68233286917354 139.766702810238 3.404 35.68222096967751 139.76663184322027 3.404 35.68222096967751 139.76663184322027 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-5c181d71-0e3f-48a2-b275-784e2a77e1dd">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-5c181d71-0e3f-48a2-b275-784e2a77e1dd">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-5c181d71-0e3f-48a2-b275-784e2a77e1dd">
											<gml:posList>35.68117497558948 139.76634419074284 3.404 35.6803776177238 139.7660129861085 4.997 35.68038499284277 139.7659841455723 3.404 35.68117497558948 139.76634419074284 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-e1e71efa-4f57-4620-bd95-32dd73f0419a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e1e71efa-4f57-4620-bd95-32dd73f0419a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e1e71efa-4f57-4620-bd95-32dd73f0419a">
											<gml:posList>35.68176721947707 139.76638863828893 20.5 35.68180445614707 139.76640667039686 20.5 35.68180445614707 139.76640667039686 3.404 35.68176721947707 139.76638863828893 3.404 35.68176721947707 139.76638863828893 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-8327dd6a-9894-44b0-a956-723ef3336710">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-8327dd6a-9894-44b0-a956-723ef3336710">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-8327dd6a-9894-44b0-a956-723ef3336710">
											<gml:posList>35.682509330494405 139.76691457393517 23.1 35.682509330494405 139.76691457393517 3.404 35.682513991794174 139.76690042871658 3.404 35.682513991794174 139.76690042871658 22.4 35.682513991794174 139.76690042871658 23.1 35.682509330494405 139.76691457393517 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-093b989e-db08-4e57-8482-e5d0af2ef181">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-093b989e-db08-4e57-8482-e5d0af2ef181">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-093b989e-db08-4e57-8482-e5d0af2ef181">
											<gml:posList>35.68166144416355 139.7663573729407 20.5 35.681548395031854 139.76631038168787 20.5 35.681548395031854 139.76631038168787 23.1 35.68166144416355 139.7663573729407 23.1 35.68166144416355 139.7663573729407 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-0109b030-40df-4fe5-be6d-b8cfae748cbd">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0109b030-40df-4fe5-be6d-b8cfae748cbd">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0109b030-40df-4fe5-be6d-b8cfae748cbd">
											<gml:posList>35.68145709464485 139.76627718210204 23.1 35.68145709464485 139.76627718210204 20.5 35.68145888425067 139.76626977858643 20.5 35.68145888425067 139.76626977858643 24.5 35.681417947893564 139.76643888810923 24.5 35.681417947893564 139.76643888810923 23.1 35.68145709464485 139.76627718210204 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-397b6f51-73b9-45a9-81e4-91af675509d6">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-397b6f51-73b9-45a9-81e4-91af675509d6">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-397b6f51-73b9-45a9-81e4-91af675509d6">
											<gml:posList>35.682509330494405 139.76691457393517 23.1 35.68208223037308 139.76671287332283 23.1 35.68208223037308 139.76671287332283 3.404 35.682509330494405 139.76691457393517 3.404 35.682509330494405 139.76691457393517 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ed053091-8f9b-4f4c-8788-4764ec2d3286">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ed053091-8f9b-4f4c-8788-4764ec2d3286">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ed053091-8f9b-4f4c-8788-4764ec2d3286">
											<gml:posList>35.68252783734446 139.76683599672546 23.1 35.68252354786548 139.76685421832988 23.1 35.68252354786548 139.76685421832988 3.404 35.68252783734446 139.76683599672546 3.404 35.68252783734446 139.76683599672546 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-d6e0b52b-3664-4ddf-aaa4-0b354bbbc3d2">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d6e0b52b-3664-4ddf-aaa4-0b354bbbc3d2">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d6e0b52b-3664-4ddf-aaa4-0b354bbbc3d2">
											<gml:posList>35.68145365523321 139.7662678716947 3.404 35.68145365523321 139.7662678716947 24.5 35.68145888425067 139.76626977858643 24.5 35.68145888425067 139.76626977858643 20.5 35.68154506381198 139.76630111536923 20.5 35.68154506381198 139.76630111536923 3.404 35.68145365523321 139.7662678716947 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-abdaaaa1-fd8c-4456-90fb-9537d8952d01">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-abdaaaa1-fd8c-4456-90fb-9537d8952d01">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-abdaaaa1-fd8c-4456-90fb-9537d8952d01">
											<gml:posList>35.681987114749774 139.76651245580285 20.5 35.68181349004752 139.76642676991676 20.5 35.68181349004752 139.76642676991676 23.1 35.681987114749774 139.76651245580285 23.1 35.681987114749774 139.76651245580285 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-786191c6-4e4d-4ece-b523-23be693b8594">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-786191c6-4e4d-4ece-b523-23be693b8594">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-786191c6-4e4d-4ece-b523-23be693b8594">
											<gml:posList>35.68154506381198 139.76630111536923 20.5 35.68176721947707 139.76638863828893 20.5 35.68176721947707 139.76638863828893 3.404 35.68154506381198 139.76630111536923 3.404 35.68154506381198 139.76630111536923 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-5dc2ac39-cdf4-4172-893c-487ee7fee4d9">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-5dc2ac39-cdf4-4172-893c-487ee7fee4d9">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-5dc2ac39-cdf4-4172-893c-487ee7fee4d9">
											<gml:posList>35.681548395031854 139.76631038168787 20.5 35.68145709464485 139.76627718210204 20.5 35.68145709464485 139.76627718210204 23.1 35.681548395031854 139.76631038168787 23.1 35.681548395031854 139.76631038168787 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-40bf49c0-88c4-407d-8337-b6504b486a48">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-40bf49c0-88c4-407d-8337-b6504b486a48">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-40bf49c0-88c4-407d-8337-b6504b486a48">
											<gml:posList>35.6803776177238 139.7660129861085 4.997 35.680080309915375 139.76594971213984 3.404 35.68038499284277 139.7659841455723 3.404 35.6803776177238 139.7660129861085 4.997</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-b6a4edde-84d9-4af0-9418-b97bbf8f2d04">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b6a4edde-84d9-4af0-9418-b97bbf8f2d04">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b6a4edde-84d9-4af0-9418-b97bbf8f2d04">
											<gml:posList>35.68254855088068 139.766868681437 22.4 35.68253862221862 139.76690941236825 22.4 35.68253863123233 139.76690941236077 3.404 35.68254855088068 139.766868681437 3.404 35.68254855088068 139.766868681437 22.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-df3f2be8-3822-43dd-b4d8-c5b8fe913e22">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-df3f2be8-3822-43dd-b4d8-c5b8fe913e22">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-df3f2be8-3822-43dd-b4d8-c5b8fe913e22">
											<gml:posList>35.6807407129967 139.76605366805134 23.1 35.68095770496364 139.76611060260444 23.1 35.68095770496364 139.76611060260444 3.404 35.6807407129967 139.76605366805134 3.404 35.6807407129967 139.76605366805134 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-c5576606-13b9-42fe-b679-61d6a0584972">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c5576606-13b9-42fe-b679-61d6a0584972">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c5576606-13b9-42fe-b679-61d6a0584972">
											<gml:posList>35.682374472096484 139.76672746773846 20.5 35.682371134604104 139.76673939121173 20.5 35.682371134604104 139.76673939121173 3.404 35.682374472096484 139.76672746773846 3.404 35.682374472096484 139.76672746773846 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-41eacea8-610a-4b97-a847-42475ac2e776">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-41eacea8-610a-4b97-a847-42475ac2e776">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-41eacea8-610a-4b97-a847-42475ac2e776">
											<gml:posList>35.68117497558948 139.76634419074284 3.404 35.68080695923938 139.76620695449665 3.404 35.6803776177238 139.7660129861085 4.997 35.68117497558948 139.76634419074284 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-87a821ad-3055-4820-bf9c-e4497823d662">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-87a821ad-3055-4820-bf9c-e4497823d662">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-87a821ad-3055-4820-bf9c-e4497823d662">
											<gml:posList>35.680387781037155 139.76597331654142 23.1 35.680387781037155 139.76597331654142 3.404 35.68038499284277 139.7659841455723 3.404 35.68038499284277 139.7659841455723 19.8 35.6803776177238 139.7660129861085 19.8 35.6803776177238 139.7660129861085 4.997 35.68036223773953 139.7660728772209 3.404 35.68036223773953 139.7660728772209 23.1 35.680387781037155 139.76597331654142 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-0a923023-f407-4b80-92d8-51c1e504c022">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0a923023-f407-4b80-92d8-51c1e504c022">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0a923023-f407-4b80-92d8-51c1e504c022">
											<gml:posList>35.68007816306718 139.7659791005557 19.8 35.680080309915375 139.76594971213984 19.8 35.680080309915375 139.76594971213984 3.404 35.68007816306718 139.7659791005557 3.404 35.68007816306718 139.7659791005557 19.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-0583de4f-221e-442b-abb7-1214844a7e90">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0583de4f-221e-442b-abb7-1214844a7e90">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0583de4f-221e-442b-abb7-1214844a7e90">
											<gml:posList>35.68181349004752 139.76642676991676 20.5 35.681741965723845 139.76639345414068 20.5 35.681741965723845 139.76639345414068 23.1 35.68181349004752 139.76642676991676 23.1 35.68181349004752 139.76642676991676 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-50319cc5-0528-4fbd-922a-0cdd4bbe7fa8">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-50319cc5-0528-4fbd-922a-0cdd4bbe7fa8">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-50319cc5-0528-4fbd-922a-0cdd4bbe7fa8">
											<gml:posList>35.68140733435692 139.76647966328122 24.5 35.68140733435692 139.76647966328122 3.404 35.681417947893564 139.76643888810923 3.404 35.681417947893564 139.76643888810923 23.1 35.681417947893564 139.76643888810923 24.5 35.68140733435692 139.76647966328122 24.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-820cd84c-030e-45da-9dc8-f285795f3306">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-820cd84c-030e-45da-9dc8-f285795f3306">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-820cd84c-030e-45da-9dc8-f285795f3306">
											<gml:posList>35.68253862221862 139.76690941236825 22.4 35.682513991794174 139.76690042871658 22.4 35.682513991794174 139.76690042871658 3.404 35.68253863123233 139.76690941236077 3.404 35.68253862221862 139.76690941236825 22.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-b5895c77-7d88-48f3-874f-0bb856f17e19">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b5895c77-7d88-48f3-874f-0bb856f17e19">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b5895c77-7d88-48f3-874f-0bb856f17e19">
											<gml:posList>35.68233286917354 139.766702810238 20.5 35.682374472096484 139.76672746773846 20.5 35.682374472096484 139.76672746773846 3.404 35.68233286917354 139.766702810238 3.404 35.68233286917354 139.766702810238 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-372ea6c7-5e26-40ba-a969-03212281927d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-372ea6c7-5e26-40ba-a969-03212281927d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-372ea6c7-5e26-40ba-a969-03212281927d">
											<gml:posList>35.68171907375128 139.76656093618223 23.1 35.681417947893564 139.76643888810923 23.1 35.681417947893564 139.76643888810923 3.404 35.68171907375128 139.76656093618223 3.404 35.68171907375128 139.76656093618223 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-79df5a7e-7e2a-4c6b-8700-3eeca5cf60b3">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-79df5a7e-7e2a-4c6b-8700-3eeca5cf60b3">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-79df5a7e-7e2a-4c6b-8700-3eeca5cf60b3">
											<gml:posList>35.68146082411813 139.7662408649001 24.5 35.68145365523321 139.7662678716947 24.5 35.68145365523321 139.7662678716947 3.404 35.68146082411813 139.7662408649001 3.404 35.68146082411813 139.7662408649001 24.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-3b7eaefe-2d88-4476-82a5-2f696999e87e">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-3b7eaefe-2d88-4476-82a5-2f696999e87e">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-3b7eaefe-2d88-4476-82a5-2f696999e87e">
											<gml:posList>35.68208223037308 139.76671287332283 23.1 35.68171907375128 139.76656093618223 23.1 35.68171907375128 139.76656093618223 3.404 35.68208223037308 139.76671287332283 3.404 35.68208223037308 139.76671287332283 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-5e1adafd-d47c-455c-854a-4ad156ab8c73">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-5e1adafd-d47c-455c-854a-4ad156ab8c73">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-5e1adafd-d47c-455c-854a-4ad156ab8c73">
											<gml:posList>35.68117497558948 139.76634419074284 23.1 35.68080695923938 139.76620695449665 23.1 35.68080695923938 139.76620695449665 3.404 35.68117497558948 139.76634419074284 3.404 35.68117497558948 139.76634419074284 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-7db328ee-bf65-4242-a966-2954b2e3a0e6">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-7db328ee-bf65-4242-a966-2954b2e3a0e6">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-7db328ee-bf65-4242-a966-2954b2e3a0e6">
											<gml:posList>35.682513991794174 139.76690042871658 23.1 35.682513991794174 139.76690042871658 22.4 35.68252637005964 139.7668558510833 22.4 35.68252637005964 139.7668558510833 23.1 35.682513991794174 139.76690042871658 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-b6038a9d-a3ba-46a9-be78-4d2bcf4e94e1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b6038a9d-a3ba-46a9-be78-4d2bcf4e94e1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b6038a9d-a3ba-46a9-be78-4d2bcf4e94e1">
											<gml:posList>35.68080695923938 139.76620695449665 23.1 35.68036223773953 139.7660728772209 23.1 35.68036223773953 139.7660728772209 3.404 35.68080695923938 139.76620695449665 3.404 35.68080695923938 139.76620695449665 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-8510d0cd-bf18-4119-ab5b-fd8608c6be9f">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-8510d0cd-bf18-4119-ab5b-fd8608c6be9f">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-8510d0cd-bf18-4119-ab5b-fd8608c6be9f">
											<gml:posList>35.6803776177238 139.7660129861085 4.997 35.68007816306718 139.7659791005557 3.404 35.680080309915375 139.76594971213984 3.404 35.6803776177238 139.7660129861085 4.997</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-dccd7b68-97a4-4581-bfa4-3d52e83ed618">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-dccd7b68-97a4-4581-bfa4-3d52e83ed618">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-dccd7b68-97a4-4581-bfa4-3d52e83ed618">
											<gml:posList>35.68252783734446 139.76683599672546 23.1 35.68252783734446 139.76683599672546 3.404 35.682371134604104 139.76673939121173 3.404 35.68252783734446 139.76683599672546 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-99ec5e03-537f-4f4b-a0ce-51084e0e5268">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-99ec5e03-537f-4f4b-a0ce-51084e0e5268">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-99ec5e03-537f-4f4b-a0ce-51084e0e5268">
											<gml:posList>35.68252783734446 139.76683599672546 23.1 35.682371134604104 139.76673939121173 3.404 35.682371134604104 139.76673939121173 20.5 35.68252783734446 139.76683599672546 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-53bc5912-4223-4524-bed5-d0fb000cd8e5">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-53bc5912-4223-4524-bed5-d0fb000cd8e5">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-53bc5912-4223-4524-bed5-d0fb000cd8e5">
											<gml:posList>35.68180445614707 139.76640667039686 20.5 35.68204628923377 139.76652769671625 20.5 35.68204628923377 139.76652769671625 3.404 35.68180445614707 139.76640667039686 3.404 35.68180445614707 139.76640667039686 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-79e1c0ba-8ac6-4129-8b70-7b2844cd7103">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-79e1c0ba-8ac6-4129-8b70-7b2844cd7103">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-79e1c0ba-8ac6-4129-8b70-7b2844cd7103">
											<gml:posList>35.680080309915375 139.76594971213984 19.8 35.68038499284277 139.7659841455723 19.8 35.68038499284277 139.7659841455723 3.404 35.680080309915375 139.76594971213984 3.404 35.680080309915375 139.76594971213984 19.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-a7a5f9e6-30a8-4f32-a05e-14c31a185a5f">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a7a5f9e6-30a8-4f32-a05e-14c31a185a5f">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a7a5f9e6-30a8-4f32-a05e-14c31a185a5f">
											<gml:posList>35.68209641337297 139.76657440954642 20.5 35.681987114749774 139.76651245580285 20.5 35.681987114749774 139.76651245580285 23.1 35.68209641337297 139.76657440954642 23.1 35.68209641337297 139.76657440954642 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-b44a51e7-c2b4-493b-8760-b3fbf8c181a9">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b44a51e7-c2b4-493b-8760-b3fbf8c181a9">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b44a51e7-c2b4-493b-8760-b3fbf8c181a9">
											<gml:posList>35.68128589333034 139.76643236967197 27.126 35.68116445228291 139.7663850762058 24.5 35.68116445228291 139.7663850762058 3.404 35.68140733435692 139.76647966328122 3.404 35.68140733435692 139.76647966328122 24.5 35.68128589333034 139.76643236967197 27.126</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-7dd7ca2d-7c7c-45a9-ba04-cb9d05133ad7">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-7dd7ca2d-7c7c-45a9-ba04-cb9d05133ad7">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-7dd7ca2d-7c7c-45a9-ba04-cb9d05133ad7">
											<gml:posList>35.68052228016051 139.76599916550114 23.1 35.6807407129967 139.76605366805134 23.1 35.6807407129967 139.76605366805134 3.404 35.68052228016051 139.76599916550114 3.404 35.68052228016051 139.76599916550114 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-d556fbdc-5185-4700-90fd-b62f03a080e7">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d556fbdc-5185-4700-90fd-b62f03a080e7">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d556fbdc-5185-4700-90fd-b62f03a080e7">
											<gml:posList>35.68122552406198 139.7661492660715 24.5 35.68122552406198 139.7661492660715 3.404 35.681212662185125 139.76619899174852 3.404 35.681212662185125 139.76619899174852 23.1 35.68117497558948 139.76634419074284 23.1 35.68117497558948 139.76634419074284 3.404 35.68116445228291 139.7663850762058 3.404 35.68116445228291 139.7663850762058 24.5 35.68122552406198 139.7661492660715 24.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-23a12a8b-4e9c-4821-a1ff-053647bdb5e4">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-23a12a8b-4e9c-4821-a1ff-053647bdb5e4">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-23a12a8b-4e9c-4821-a1ff-053647bdb5e4">
											<gml:posList>35.68252354786548 139.76685421832988 3.404 35.68252354786548 139.76685421832988 23.1 35.68252637005964 139.7668558510833 23.1 35.68252637005964 139.7668558510833 22.4 35.68254855088068 139.766868681437 22.4 35.68254855088068 139.766868681437 3.404 35.68252354786548 139.76685421832988 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-bd8570a9-da67-4a2a-8b22-6044b38a307b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-bd8570a9-da67-4a2a-8b22-6044b38a307b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-bd8570a9-da67-4a2a-8b22-6044b38a307b">
											<gml:posList>35.68080695923938 139.76620695449665 3.404 35.68036223773953 139.7660728772209 3.404 35.6803776177238 139.7660129861085 4.997 35.68080695923938 139.76620695449665 3.404</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-bbfe640a-889e-44db-88a6-af6be28f4aec">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-bbfe640a-889e-44db-88a6-af6be28f4aec">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-bbfe640a-889e-44db-88a6-af6be28f4aec">
											<gml:posList>35.68252783734446 139.76683599672546 23.1 35.68209641337297 139.76657440954642 20.5 35.68209641337297 139.76657440954642 23.1 35.68252783734446 139.76683599672546 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-dd8ca001-d14c-485e-a27a-59b50c0c60e4">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-dd8ca001-d14c-485e-a27a-59b50c0c60e4">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-dd8ca001-d14c-485e-a27a-59b50c0c60e4">
											<gml:posList>35.681741965723845 139.76639345414068 20.5 35.68166144416355 139.7663573729407 20.5 35.68166144416355 139.7663573729407 23.1 35.681741965723845 139.76639345414068 23.1 35.681741965723845 139.76639345414068 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-f9fb31d5-c0bf-48cf-ba88-b9a4101cccd4">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-f9fb31d5-c0bf-48cf-ba88-b9a4101cccd4">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-f9fb31d5-c0bf-48cf-ba88-b9a4101cccd4">
											<gml:posList>35.6803776177238 139.7660129861085 4.997 35.6803776177238 139.7660129861085 19.8 35.68007816306718 139.7659791005557 19.8 35.68007816306718 139.7659791005557 3.404 35.6803776177238 139.7660129861085 4.997</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-8ca97646-16b9-47c3-96db-d08ac9604fc4">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-8ca97646-16b9-47c3-96db-d08ac9604fc4">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-8ca97646-16b9-47c3-96db-d08ac9604fc4">
											<gml:posList>35.680387781037155 139.76597331654142 23.1 35.68052228016051 139.76599916550114 23.1 35.68052228016051 139.76599916550114 3.404 35.680387781037155 139.76597331654142 3.404 35.680387781037155 139.76597331654142 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-f597693c-f92c-448a-aa0e-491a0fece5b0">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-f597693c-f92c-448a-aa0e-491a0fece5b0">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-f597693c-f92c-448a-aa0e-491a0fece5b0">
											<gml:posList>35.68095770496364 139.76611060260444 23.1 35.681212662185125 139.76619899174852 23.1 35.681212662185125 139.76619899174852 3.404 35.68095770496364 139.76611060260444 3.404 35.68095770496364 139.76611060260444 23.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-4cdd777a-96db-4d32-8318-9926c203cb05">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-4cdd777a-96db-4d32-8318-9926c203cb05">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-4cdd777a-96db-4d32-8318-9926c203cb05">
											<gml:posList>35.68204628923377 139.76652769671625 20.5 35.68222096967751 139.76663184322027 20.5 35.68222096967751 139.76663184322027 3.404 35.68204628923377 139.76652769671625 3.404 35.68204628923377 139.76652769671625 20.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:address>
				<core:Address>
					<core:xalAddress>
						<xAL:AddressDetails>
							<xAL:Country>
								<xAL:CountryName>日本</xAL:CountryName>
								<xAL:Locality>
									<xAL:LocalityName Type="Town">東京都千代田区丸の内一丁目</xAL:LocalityName>
								</xAL:Locality>
							</xAL:Country>
						</xAL:AddressDetails>
					</core:xalAddress>
				</core:Address>
			</bldg:address>
			<uro:bldgDataQualityAttribute>
				<uro:DataQualityAttribute>
					<uro:geometrySrcDescLod0 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod0>
					<uro:geometrySrcDescLod1 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod1>
					<uro:geometrySrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod2>
					<uro:geometrySrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">999</uro:geometrySrcDescLod3>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">201</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">000</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">023</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">400</uro:thematicSrcDesc>
					<uro:appearanceSrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">1</uro:appearanceSrcDescLod2>
					<uro:appearanceSrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">99</uro:appearanceSrcDescLod3>
					<uro:lodType codeSpace="../../codelists/Building_lodType.xml">2.2</uro:lodType>
					<uro:lod1HeightType codeSpace="../../codelists/DataQualityAttribute_lod1HeightType.xml">2</uro:lod1HeightType>
					<uro:publicSurveyDataQualityAttribute>
						<uro:PublicSurveyDataQualityAttribute>
							<uro:srcScaleLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod0>
							<uro:srcScaleLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod1>
							<uro:srcScaleLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod2>
							<uro:publicSurveySrcDescLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod0>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod2>
						</uro:PublicSurveyDataQualityAttribute>
					</uro:publicSurveyDataQualityAttribute>
				</uro:DataQualityAttribute>
			</uro:bldgDataQualityAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">10</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.13</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">31</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.178</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">8</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.178</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:HighTideRiskAttribute>
					<uro:description codeSpace="../../codelists/HighTideRiskAttribute_description.xml">2</uro:description>
					<uro:rank codeSpace="../../codelists/HighTideRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.25</uro:depth>
				</uro:HighTideRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">100</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key100.xml">11</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">101</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key101.xml">1</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">102</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key102.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">103</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key103.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">104</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key104.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">105</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key105.xml">9</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">106</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key106.xml">10</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:buildingDetailAttribute>
				<uro:BuildingDetailAttribute>
					<uro:buildingRoofEdgeArea uom="m2">3376.6759</uro:buildingRoofEdgeArea>
					<uro:fireproofStructureType codeSpace="../../codelists/BuildingDetailAttribute_fireproofStructureType.xml">1001</uro:fireproofStructureType>
					<uro:urbanPlanType codeSpace="../../codelists/Common_urbanPlanType.xml">21</uro:urbanPlanType>
					<uro:areaClassificationType codeSpace="../../codelists/Common_areaClassificationType.xml">22</uro:areaClassificationType>
					<uro:districtsAndZonesType codeSpace="../../codelists/Common_districtsAndZonesType.xml">10</uro:districtsAndZonesType>
					<uro:landUseType codeSpace="../../codelists/Common_landUseType.xml">216</uro:landUseType>
					<uro:detailedUsage codeSpace="../../codelists/BuildingDetailAttribute_detailedUsage.xml">1431</uro:detailedUsage>
					<uro:specifiedBuildingCoverageRate>80</uro:specifiedBuildingCoverageRate>
					<uro:specifiedFloorAreaRate>900</uro:specifiedFloorAreaRate>
					<uro:surveyYear>2021</uro:surveyYear>
				</uro:BuildingDetailAttribute>
			</uro:buildingDetailAttribute>
			<uro:buildingIDAttribute>
				<uro:BuildingIDAttribute>
					<uro:buildingID>13101-bldg-384</uro:buildingID>
					<uro:prefecture codeSpace="../../codelists/Common_localPublicAuthorities.xml">13</uro:prefecture>
					<uro:city codeSpace="../../codelists/Common_localPublicAuthorities.xml">13101</uro:city>
				</uro:BuildingIDAttribute>
			</uro:buildingIDAttribute>
		</bldg:Building>
	</core:cityObjectMember>
	<core:cityObjectMember>
		<bldg:Building gml:id="bldg_00133552-aa2d-431f-9786-877cd4ab98bc">
			<gml:name>東京駅</gml:name>
			<core:creationDate>2024-03-15</core:creationDate>
			<gen:stringAttribute name="延べ面積換算係数">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="説明注記">
				<gen:value> </gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="大字・町コード">
				<gen:value>55</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="町・丁目コード">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="13+区市町村コード+大字・町コード+町・丁目コード">
				<gen:value>13101055001</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="地区計画">
				<gen:value>大手町・丸の内・有楽町地区</gen:value>
			</gen:stringAttribute>
			<bldg:class codeSpace="../../codelists/Building_class.xml">3003</bldg:class>
			<bldg:usage codeSpace="../../codelists/Building_usage.xml">431</bldg:usage>
			<bldg:measuredHeight uom="m">14.8</bldg:measuredHeight>
			<bldg:storeysAboveGround>2</bldg:storeysAboveGround>
			<bldg:storeysBelowGround>0</bldg:storeysBelowGround>
			<bldg:lod0RoofEdge>
				<gml:MultiSurface>
					<gml:surfaceMember>
						<gml:Polygon>
							<gml:exterior>
								<gml:LinearRing>
									<gml:posList>35.68235265219252 139.7680315482301 0 35.682185789322325 139.76801312374045 0 35.68191075940929 139.7679735756389 0 35.681601460919204 139.7679037847766 0 35.68148218885105 139.76786587774592 0 35.68138013404091 139.7678299453555 0 35.680641027437204 139.76754915407395 0 35.67967943313576 139.7671838387889 0 35.67943257493263 139.76707003222998 0 35.679409812587245 139.7671470521656 0 35.67940909501222 139.7671534603116 0 35.679588616566505 139.76725981027755 0 35.679733151187946 139.7673413325263 0 35.67981321627775 139.76738379971644 0 35.680023648428744 139.76747708918285 0 35.68018088239532 139.7675422513766 0 35.68060629060686 139.76770152996897 0 35.681313236192985 139.76796621901718 0 35.68145252286986 139.76801184325438 0 35.681592257037245 139.76805161194767 0 35.681834401233836 139.76810101951062 0 35.68208589983847 139.76814710540026 0 35.68223283044604 139.7681601328855 0 35.68296935357799 139.76818328711468 0 35.68297610237988 139.7681620694726 0 35.683151427763804 139.7681780570067 0 35.68315535868215 139.76811320191905 0 35.6829906700062 139.76809820018747 0 35.6829944482807 139.76808438711157 0 35.68247108759104 139.76803929575465 0 35.68235265219252 139.7680315482301 0</gml:posList>
								</gml:LinearRing>
							</gml:exterior>
						</gml:Polygon>
					</gml:surfaceMember>
				</gml:MultiSurface>
			</bldg:lod0RoofEdge>
			<bldg:lod1Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68235265219252 139.7680315482301 3.3 35.68247108759104 139.76803929575465 3.3 35.6829944482807 139.76808438711157 3.3 35.6829906700062 139.76809820018747 3.3 35.68315535868215 139.76811320191905 3.3 35.683151427763804 139.7681780570067 3.3 35.68297610237988 139.7681620694726 3.3 35.68296935357799 139.76818328711468 3.3 35.68223283044604 139.7681601328855 3.3 35.68208589983847 139.76814710540026 3.3 35.681834401233836 139.76810101951062 3.3 35.681592257037245 139.76805161194767 3.3 35.68145252286986 139.76801184325438 3.3 35.681313236192985 139.76796621901718 3.3 35.68060629060686 139.76770152996897 3.3 35.68018088239532 139.7675422513766 3.3 35.680023648428744 139.76747708918285 3.3 35.67981321627775 139.76738379971644 3.3 35.679733151187946 139.7673413325263 3.3 35.679588616566505 139.76725981027755 3.3 35.67940909501222 139.7671534603116 3.3 35.679409812587245 139.7671470521656 3.3 35.67943257493263 139.76707003222998 3.3 35.67967943313576 139.7671838387889 3.3 35.680641027437204 139.76754915407395 3.3 35.68138013404091 139.7678299453555 3.3 35.68148218885105 139.76786587774592 3.3 35.681601460919204 139.7679037847766 3.3 35.68191075940929 139.7679735756389 3.3 35.682185789322325 139.76801312374045 3.3 35.68235265219252 139.7680315482301 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68235265219252 139.7680315482301 3.3 35.682185789322325 139.76801312374045 3.3 35.682185789322325 139.76801312374045 18.1 35.68235265219252 139.7680315482301 18.1 35.68235265219252 139.7680315482301 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682185789322325 139.76801312374045 3.3 35.68191075940929 139.7679735756389 3.3 35.68191075940929 139.7679735756389 18.1 35.682185789322325 139.76801312374045 18.1 35.682185789322325 139.76801312374045 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68191075940929 139.7679735756389 3.3 35.681601460919204 139.7679037847766 3.3 35.681601460919204 139.7679037847766 18.1 35.68191075940929 139.7679735756389 18.1 35.68191075940929 139.7679735756389 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681601460919204 139.7679037847766 3.3 35.68148218885105 139.76786587774592 3.3 35.68148218885105 139.76786587774592 18.1 35.681601460919204 139.7679037847766 18.1 35.681601460919204 139.7679037847766 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68148218885105 139.76786587774592 3.3 35.68138013404091 139.7678299453555 3.3 35.68138013404091 139.7678299453555 18.1 35.68148218885105 139.76786587774592 18.1 35.68148218885105 139.76786587774592 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68138013404091 139.7678299453555 3.3 35.680641027437204 139.76754915407395 3.3 35.680641027437204 139.76754915407395 18.1 35.68138013404091 139.7678299453555 18.1 35.68138013404091 139.7678299453555 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680641027437204 139.76754915407395 3.3 35.67967943313576 139.7671838387889 3.3 35.67967943313576 139.7671838387889 18.1 35.680641027437204 139.76754915407395 18.1 35.680641027437204 139.76754915407395 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.67967943313576 139.7671838387889 3.3 35.67943257493263 139.76707003222998 3.3 35.67943257493263 139.76707003222998 18.1 35.67967943313576 139.7671838387889 18.1 35.67967943313576 139.7671838387889 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.67943257493263 139.76707003222998 3.3 35.679409812587245 139.7671470521656 3.3 35.679409812587245 139.7671470521656 18.1 35.67943257493263 139.76707003222998 18.1 35.67943257493263 139.76707003222998 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.679409812587245 139.7671470521656 3.3 35.67940909501222 139.7671534603116 3.3 35.67940909501222 139.7671534603116 18.1 35.679409812587245 139.7671470521656 18.1 35.679409812587245 139.7671470521656 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.67940909501222 139.7671534603116 3.3 35.679588616566505 139.76725981027755 3.3 35.679588616566505 139.76725981027755 18.1 35.67940909501222 139.7671534603116 18.1 35.67940909501222 139.7671534603116 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.679588616566505 139.76725981027755 3.3 35.679733151187946 139.7673413325263 3.3 35.679733151187946 139.7673413325263 18.1 35.679588616566505 139.76725981027755 18.1 35.679588616566505 139.76725981027755 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.679733151187946 139.7673413325263 3.3 35.67981321627775 139.76738379971644 3.3 35.67981321627775 139.76738379971644 18.1 35.679733151187946 139.7673413325263 18.1 35.679733151187946 139.7673413325263 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.67981321627775 139.76738379971644 3.3 35.680023648428744 139.76747708918285 3.3 35.680023648428744 139.76747708918285 18.1 35.67981321627775 139.76738379971644 18.1 35.67981321627775 139.76738379971644 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680023648428744 139.76747708918285 3.3 35.68018088239532 139.7675422513766 3.3 35.68018088239532 139.7675422513766 18.1 35.680023648428744 139.76747708918285 18.1 35.680023648428744 139.76747708918285 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68018088239532 139.7675422513766 3.3 35.68060629060686 139.76770152996897 3.3 35.68060629060686 139.76770152996897 18.1 35.68018088239532 139.7675422513766 18.1 35.68018088239532 139.7675422513766 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68060629060686 139.76770152996897 3.3 35.681313236192985 139.76796621901718 3.3 35.681313236192985 139.76796621901718 18.1 35.68060629060686 139.76770152996897 18.1 35.68060629060686 139.76770152996897 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681313236192985 139.76796621901718 3.3 35.68145252286986 139.76801184325438 3.3 35.68145252286986 139.76801184325438 18.1 35.681313236192985 139.76796621901718 18.1 35.681313236192985 139.76796621901718 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68145252286986 139.76801184325438 3.3 35.681592257037245 139.76805161194767 3.3 35.681592257037245 139.76805161194767 18.1 35.68145252286986 139.76801184325438 18.1 35.68145252286986 139.76801184325438 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681592257037245 139.76805161194767 3.3 35.681834401233836 139.76810101951062 3.3 35.681834401233836 139.76810101951062 18.1 35.681592257037245 139.76805161194767 18.1 35.681592257037245 139.76805161194767 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681834401233836 139.76810101951062 3.3 35.68208589983847 139.76814710540026 3.3 35.68208589983847 139.76814710540026 18.1 35.681834401233836 139.76810101951062 18.1 35.681834401233836 139.76810101951062 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68208589983847 139.76814710540026 3.3 35.68223283044604 139.7681601328855 3.3 35.68223283044604 139.7681601328855 18.1 35.68208589983847 139.76814710540026 18.1 35.68208589983847 139.76814710540026 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68223283044604 139.7681601328855 3.3 35.68296935357799 139.76818328711468 3.3 35.68296935357799 139.76818328711468 18.1 35.68223283044604 139.7681601328855 18.1 35.68223283044604 139.7681601328855 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68296935357799 139.76818328711468 3.3 35.68297610237988 139.7681620694726 3.3 35.68297610237988 139.7681620694726 18.1 35.68296935357799 139.76818328711468 18.1 35.68296935357799 139.76818328711468 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68297610237988 139.7681620694726 3.3 35.683151427763804 139.7681780570067 3.3 35.683151427763804 139.7681780570067 18.1 35.68297610237988 139.7681620694726 18.1 35.68297610237988 139.7681620694726 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.683151427763804 139.7681780570067 3.3 35.68315535868215 139.76811320191905 3.3 35.68315535868215 139.76811320191905 18.1 35.683151427763804 139.7681780570067 18.1 35.683151427763804 139.7681780570067 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68315535868215 139.76811320191905 3.3 35.6829906700062 139.76809820018747 3.3 35.6829906700062 139.76809820018747 18.1 35.68315535868215 139.76811320191905 18.1 35.68315535868215 139.76811320191905 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.6829906700062 139.76809820018747 3.3 35.6829944482807 139.76808438711157 3.3 35.6829944482807 139.76808438711157 18.1 35.6829906700062 139.76809820018747 18.1 35.6829906700062 139.76809820018747 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.6829944482807 139.76808438711157 3.3 35.68247108759104 139.76803929575465 3.3 35.68247108759104 139.76803929575465 18.1 35.6829944482807 139.76808438711157 18.1 35.6829944482807 139.76808438711157 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68247108759104 139.76803929575465 3.3 35.68235265219252 139.7680315482301 3.3 35.68235265219252 139.7680315482301 18.1 35.68247108759104 139.76803929575465 18.1 35.68247108759104 139.76803929575465 3.3</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68235265219252 139.7680315482301 18.1 35.682185789322325 139.76801312374045 18.1 35.68191075940929 139.7679735756389 18.1 35.681601460919204 139.7679037847766 18.1 35.68148218885105 139.76786587774592 18.1 35.68138013404091 139.7678299453555 18.1 35.680641027437204 139.76754915407395 18.1 35.67967943313576 139.7671838387889 18.1 35.67943257493263 139.76707003222998 18.1 35.679409812587245 139.7671470521656 18.1 35.67940909501222 139.7671534603116 18.1 35.679588616566505 139.76725981027755 18.1 35.679733151187946 139.7673413325263 18.1 35.67981321627775 139.76738379971644 18.1 35.680023648428744 139.76747708918285 18.1 35.68018088239532 139.7675422513766 18.1 35.68060629060686 139.76770152996897 18.1 35.681313236192985 139.76796621901718 18.1 35.68145252286986 139.76801184325438 18.1 35.681592257037245 139.76805161194767 18.1 35.681834401233836 139.76810101951062 18.1 35.68208589983847 139.76814710540026 18.1 35.68223283044604 139.7681601328855 18.1 35.68296935357799 139.76818328711468 18.1 35.68297610237988 139.7681620694726 18.1 35.683151427763804 139.7681780570067 18.1 35.68315535868215 139.76811320191905 18.1 35.6829906700062 139.76809820018747 18.1 35.6829944482807 139.76808438711157 18.1 35.68247108759104 139.76803929575465 18.1 35.68235265219252 139.7680315482301 18.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod1Solid>
			<bldg:lod2Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember xlink:href="#poly-b4da2a87-d37a-47ef-a272-cb70df3b9bd2"/>
							<gml:surfaceMember xlink:href="#poly-0d4fc989-0f85-47ef-8710-b08168ab17bd"/>
							<gml:surfaceMember xlink:href="#poly-27fbae18-4b99-4920-8603-9093dede5599"/>
							<gml:surfaceMember xlink:href="#poly-d1540a16-7114-4594-8c85-c254a0221212"/>
							<gml:surfaceMember xlink:href="#poly-034b6e12-5ab3-4456-8341-6c10c51cc8d1"/>
							<gml:surfaceMember xlink:href="#poly-184c74fd-dfc9-49f5-a3c8-bee5bc00495e"/>
							<gml:surfaceMember xlink:href="#poly-a115894f-5519-42e4-955a-32bb4ddb589d"/>
							<gml:surfaceMember xlink:href="#poly-e010efa5-f5e0-4d8b-ab0e-d20645cfe5b5"/>
							<gml:surfaceMember xlink:href="#poly-16ec7249-c847-4053-bd48-5aa0a5061d47"/>
							<gml:surfaceMember xlink:href="#poly-d51602d6-d585-44dd-89f7-9d58b366764d"/>
							<gml:surfaceMember xlink:href="#poly-2a935400-9037-40d0-8fd4-46ab8619a7cc"/>
							<gml:surfaceMember xlink:href="#poly-edd7dac2-b369-4796-9305-f331b7f2829d"/>
							<gml:surfaceMember xlink:href="#poly-7a932199-a77a-42be-ae8c-d6ea43849047"/>
							<gml:surfaceMember xlink:href="#poly-1acc49b7-f7af-462a-8505-0204ddfbf214"/>
							<gml:surfaceMember xlink:href="#poly-b17067ab-5091-47b2-8033-10fed9e4aefd"/>
							<gml:surfaceMember xlink:href="#poly-19c64b14-bd42-4c0a-aa15-95de73bdaf28"/>
							<gml:surfaceMember xlink:href="#poly-3c06c33c-eb6b-45b4-ac17-0ae24ddf4baf"/>
							<gml:surfaceMember xlink:href="#poly-20caaf94-74ef-4dc7-991e-c0538816c0ae"/>
							<gml:surfaceMember xlink:href="#poly-3228eb82-8c56-4af1-a30b-9221eb60d350"/>
							<gml:surfaceMember xlink:href="#poly-f6ed6f02-27bb-443c-8972-3877a9d86933"/>
							<gml:surfaceMember xlink:href="#poly-d288132d-5836-4de6-a9b9-6b246a10eb9b"/>
							<gml:surfaceMember xlink:href="#poly-5b2cd6e6-af6b-4c00-bcb0-72e937fa8d3f"/>
							<gml:surfaceMember xlink:href="#poly-f89c9b27-ff32-4e71-9c73-2beada730557"/>
							<gml:surfaceMember xlink:href="#poly-aa59f7a7-5434-48fb-ac52-3ba39775453b"/>
							<gml:surfaceMember xlink:href="#poly-6763edf7-87ee-4ee3-9c15-bff7a16dcc1e"/>
							<gml:surfaceMember xlink:href="#poly-9dd35313-23da-400e-b612-ddcfad99a64c"/>
							<gml:surfaceMember xlink:href="#poly-956de693-8e14-4fb2-bc0f-33e0ff64511a"/>
							<gml:surfaceMember xlink:href="#poly-411d5b2b-0e8d-40b5-904b-cfdc83b9e3b6"/>
							<gml:surfaceMember xlink:href="#poly-eb85abd2-1775-42f4-8daa-aef6fdd75519"/>
							<gml:surfaceMember xlink:href="#poly-bc1662d5-dfd3-4d5d-b356-670b05e68695"/>
							<gml:surfaceMember xlink:href="#poly-8ffb0773-d17a-4543-8353-4ab52c055eda"/>
							<gml:surfaceMember xlink:href="#poly-44576f61-ed6d-4eaa-bef3-9476cde73f7f"/>
							<gml:surfaceMember xlink:href="#poly-7a793ed6-5c73-4533-b1ac-1004d371a453"/>
							<gml:surfaceMember xlink:href="#poly-0d8dc00f-c562-4777-a485-c6f1829c399a"/>
							<gml:surfaceMember xlink:href="#poly-23750228-fe0b-4942-918e-694bd23dd7a1"/>
							<gml:surfaceMember xlink:href="#poly-b5425a53-e545-48e2-8707-4d0a62f7943a"/>
							<gml:surfaceMember xlink:href="#poly-ede550fa-9a4c-4c8e-ace4-ae7ea265417b"/>
							<gml:surfaceMember xlink:href="#poly-8f060b3b-842e-4ac6-899e-7e7f24b95e26"/>
							<gml:surfaceMember xlink:href="#poly-5e201b45-6e9b-48e2-a7dd-81d2dee38736"/>
							<gml:surfaceMember xlink:href="#poly-294a77ad-27fd-45cc-b1fe-d6e1d49f3b6d"/>
							<gml:surfaceMember xlink:href="#poly-c3da5a96-d5ca-4413-8704-5eab1e4312fc"/>
							<gml:surfaceMember xlink:href="#poly-4f9e57ef-8f7e-4e2e-969d-3ae51394827d"/>
							<gml:surfaceMember xlink:href="#poly-0357bbe1-0914-402d-99a7-f0706927452a"/>
							<gml:surfaceMember xlink:href="#poly-56f80881-b117-4ca4-a947-55932b0fa3de"/>
							<gml:surfaceMember xlink:href="#poly-a6c1380c-04ab-41c9-bc5d-4ebae2cfea7b"/>
							<gml:surfaceMember xlink:href="#poly-b7b24a6f-c812-4919-bed5-87f9476061c6"/>
							<gml:surfaceMember xlink:href="#poly-ba0ae98a-e69c-4053-bcc6-f541ff93e3b2"/>
							<gml:surfaceMember xlink:href="#poly-a0084e6b-4965-4fe8-a6ae-00f4a9e5da48"/>
							<gml:surfaceMember xlink:href="#poly-ba9388d6-8664-491c-8120-70ade7ec64b1"/>
							<gml:surfaceMember xlink:href="#poly-9c18ef7f-1c69-4b39-87f5-ec970d7b276f"/>
							<gml:surfaceMember xlink:href="#poly-f387bc3a-6bda-4b8f-a4c2-fc055ee4b808"/>
							<gml:surfaceMember xlink:href="#poly-582dd087-e3f9-45f8-a2b8-b2290b939607"/>
							<gml:surfaceMember xlink:href="#poly-ba61df39-52e2-4deb-a04a-c60b40f7c0d8"/>
							<gml:surfaceMember xlink:href="#poly-90b1c588-a2e8-4af9-b70c-c47cd6ae1a1b"/>
							<gml:surfaceMember xlink:href="#poly-7932ac53-207a-4203-be03-d30679ad1adf"/>
							<gml:surfaceMember xlink:href="#poly-d38cd7d9-4a8f-4981-bd32-d46ee7388228"/>
							<gml:surfaceMember xlink:href="#poly-f2a7ff89-c15c-40ea-a186-4cbc03768b53"/>
							<gml:surfaceMember xlink:href="#poly-1968cff1-b341-41c2-8b66-e94c86b4b653"/>
							<gml:surfaceMember xlink:href="#poly-d51ff071-e0fb-482f-911a-ab620fda9680"/>
							<gml:surfaceMember xlink:href="#poly-0e6a0ca1-930d-42d6-8970-debf17ff55b9"/>
							<gml:surfaceMember xlink:href="#poly-b6789fb2-9b6b-4ca7-a1d7-ddf156b8377a"/>
							<gml:surfaceMember xlink:href="#poly-793a49f3-8b6a-4902-a561-25fda9b82f1c"/>
							<gml:surfaceMember xlink:href="#poly-23c57463-62cb-441e-8f66-547b7e446b2b"/>
							<gml:surfaceMember xlink:href="#poly-37ca1552-b7b3-49b8-a7f5-c29a3200d789"/>
							<gml:surfaceMember xlink:href="#poly-345f7edd-ae91-484f-b1ba-e80f81a0712b"/>
							<gml:surfaceMember xlink:href="#poly-09d83ee7-0d41-492e-803b-fffbf0454bf0"/>
							<gml:surfaceMember xlink:href="#poly-6615a69a-2942-4a54-b5d0-91437ce7b162"/>
							<gml:surfaceMember xlink:href="#poly-6ac97277-0dfa-418f-8860-87db98ac0fb4"/>
							<gml:surfaceMember xlink:href="#poly-cde4b9dc-864d-45fb-8d05-c8a43c009209"/>
							<gml:surfaceMember xlink:href="#poly-e7532bf9-531a-4652-8a7d-5445bea6e74b"/>
							<gml:surfaceMember xlink:href="#poly-327b94c9-d353-4812-a580-554869b0d806"/>
							<gml:surfaceMember xlink:href="#poly-13e8d0d2-0caf-4229-9093-e5f1aebd6518"/>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod2Solid>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-b4da2a87-d37a-47ef-a272-cb70df3b9bd2">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b4da2a87-d37a-47ef-a272-cb70df3b9bd2">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b4da2a87-d37a-47ef-a272-cb70df3b9bd2">
											<gml:posList>35.681834401233836 139.76810101951062 3.28 35.68159225703724 139.76805161194767 3.28 35.68145252286986 139.76801184325438 3.28 35.681313236193 139.76796621901718 3.28 35.68060629060685 139.76770152996897 3.28 35.6806410274372 139.76754915407398 3.28 35.68138013404089 139.7678299453555 3.28 35.68148218885106 139.76786587774592 3.28 35.681601460919204 139.7679037847766 3.28 35.68191075940929 139.76797357563888 3.28 35.682185789322325 139.76801312374045 3.28 35.68235265219252 139.7680315482301 3.28 35.68247108759104 139.76803929575465 3.28 35.68299444828071 139.76808438711157 3.28 35.682990670006205 139.76809820018747 3.28 35.68315535868214 139.76811320191905 3.28 35.68315142776381 139.7681780570067 3.28 35.68297610237988 139.7681620694726 3.28 35.68296935357799 139.76818328711468 3.28 35.68223283044604 139.7681601328855 3.28 35.68208589983847 139.76814710540026 3.28 35.681834401233836 139.76810101951062 3.28</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-0d4fc989-0f85-47ef-8710-b08168ab17bd">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0d4fc989-0f85-47ef-8710-b08168ab17bd">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0d4fc989-0f85-47ef-8710-b08168ab17bd">
											<gml:posList>35.67940909501222 139.76715346031162 3.28 35.679409812587245 139.7671470521656 3.28 35.67943257493263 139.76707003222998 3.28 35.67967943313576 139.7671838387889 3.28 35.6806410274372 139.76754915407398 3.28 35.68060629060685 139.76770152996897 3.28 35.68018088239533 139.7675422513766 3.28 35.68002364752738 139.7674770891836 3.28 35.67981321627775 139.76738379971644 3.28 35.67973315118795 139.7673413325263 3.28 35.679588616566505 139.76725981027755 3.28 35.67940909501222 139.76715346031162 3.28</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-edd7dac2-b369-4796-9305-f331b7f2829d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-edd7dac2-b369-4796-9305-f331b7f2829d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-edd7dac2-b369-4796-9305-f331b7f2829d">
											<gml:posList>35.680641396100015 139.76754750766764 18.8 35.68061473703224 139.7675374319774 18.8 35.680608647509075 139.7675607917537 18.8 35.68058113222849 139.76766646317878 18.8 35.68057504268625 139.76768983398318 18.8 35.68060629060685 139.76770152996897 18.8 35.680641396100015 139.76754750766764 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-d1540a16-7114-4594-8c85-c254a0221212">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d1540a16-7114-4594-8c85-c254a0221212">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d1540a16-7114-4594-8c85-c254a0221212">
											<gml:posList>35.679409812587245 139.7671470521656 18.8 35.67940909501222 139.76715346031162 18.8 35.679588616566505 139.76725981027755 18.8 35.67973315118795 139.7673413325263 18.8 35.67967943313576 139.7671838387889 18.8 35.67968557680261 139.76722635571556 18.8 35.67967776116189 139.76725783661183 18.8 35.67960732256459 139.76723157945685 18.8 35.67961513819857 139.7672000985857 18.8 35.67943257493263 139.76707003222998 18.8 35.679409812587245 139.7671470521656 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-a115894f-5519-42e4-955a-32bb4ddb589d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a115894f-5519-42e4-955a-32bb4ddb589d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a115894f-5519-42e4-955a-32bb4ddb589d">
											<gml:posList>35.67981321627775 139.76738379971644 18.8 35.67981192036347 139.76732176872494 18.8 35.679791535545526 139.76731301375233 18.8 35.67973315118795 139.7673413325263 18.8 35.67981321627775 139.76738379971644 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-3228eb82-8c56-4af1-a30b-9221eb60d350">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-3228eb82-8c56-4af1-a30b-9221eb60d350">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-3228eb82-8c56-4af1-a30b-9221eb60d350">
											<gml:posList>35.68315142776381 139.7681780570067 14.4 35.68315535868214 139.76811320191905 14.4 35.682990670006205 139.76809820018747 14.4 35.68297610237988 139.7681620694726 14.4 35.68315142776381 139.7681780570067 14.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-2a935400-9037-40d0-8fd4-46ab8619a7cc">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-2a935400-9037-40d0-8fd4-46ab8619a7cc">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-2a935400-9037-40d0-8fd4-46ab8619a7cc">
											<gml:posList>35.68029638468979 139.76755968915072 18.8 35.68058113222849 139.76766646317878 18.8 35.680594894390275 139.76761363299542 21.325 35.680309371269814 139.76750620796366 21.325 35.68029638468979 139.76755968915072 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-19c64b14-bd42-4c0a-aa15-95de73bdaf28">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-19c64b14-bd42-4c0a-aa15-95de73bdaf28">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-19c64b14-bd42-4c0a-aa15-95de73bdaf28">
											<gml:posList>35.68145252286986 139.76801184325438 18.8 35.68159225703724 139.76805161194767 18.8 35.681834401233836 139.76810101951062 18.8 35.68208589983847 139.76814710540026 18.8 35.68223283044604 139.7681601328855 18.8 35.68296935357799 139.76818328711468 18.8 35.68297610237988 139.7681620694726 18.8 35.682990670006205 139.76809820018747 18.8 35.68299444828071 139.76808438711157 18.8 35.68247108759104 139.76803929575465 18.8 35.68235265219252 139.7680315482301 18.8 35.682185789322325 139.76801312374045 18.8 35.68191075940929 139.76797357563888 18.8 35.681601460919204 139.7679037847766 18.8 35.68162168705101 139.7679689724446 18.8 35.68161552155593 139.76800197728204 18.8 35.68159014408413 139.7679948610859 18.8 35.681596309577316 139.7679618562584 18.8 35.68148218885106 139.76786587774592 18.8 35.68138013404089 139.7678299453555 18.8 35.680853554628435 139.76770104024536 18.8 35.68084713322799 139.76772744951697 18.8 35.680822223372274 139.76771835555436 18.8 35.68082863575704 139.76769194629762 18.8 35.680641396100015 139.76754750766764 18.8 35.68060629060685 139.76770152996897 18.8 35.681313236193 139.76796621901718 18.8 35.68145252286986 139.76801184325438 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-034b6e12-5ab3-4456-8341-6c10c51cc8d1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-034b6e12-5ab3-4456-8341-6c10c51cc8d1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-034b6e12-5ab3-4456-8341-6c10c51cc8d1">
											<gml:posList>35.67960732256459 139.76723157945685 20.768 35.67967776116189 139.76725783661183 20.768 35.67968557680261 139.76722635571556 20.768 35.67961513819857 139.7672000985857 20.768 35.67960732256459 139.76723157945685 20.768</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-20caaf94-74ef-4dc7-991e-c0538816c0ae">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-20caaf94-74ef-4dc7-991e-c0538816c0ae">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-20caaf94-74ef-4dc7-991e-c0538816c0ae">
											<gml:posList>35.68162168705101 139.7679689724446 19.285 35.681596309577316 139.7679618562584 19.285 35.68159014408413 139.7679948610859 19.285 35.68161552155593 139.76800197728204 19.285 35.68162168705101 139.7679689724446 19.285</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-3c06c33c-eb6b-45b4-ac17-0ae24ddf4baf">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-3c06c33c-eb6b-45b4-ac17-0ae24ddf4baf">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-3c06c33c-eb6b-45b4-ac17-0ae24ddf4baf">
											<gml:posList>35.681601460919204 139.7679037847766 18.8 35.68148218885106 139.76786587774592 18.8 35.681596309577316 139.7679618562584 18.8 35.68162168705101 139.7679689724446 18.8 35.681601460919204 139.7679037847766 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-b17067ab-5091-47b2-8033-10fed9e4aefd">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b17067ab-5091-47b2-8033-10fed9e4aefd">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b17067ab-5091-47b2-8033-10fed9e4aefd">
											<gml:posList>35.680853554628435 139.76770104024536 19.285 35.68082863575704 139.76769194629762 19.285 35.680822223372274 139.76771835555436 19.285 35.68084713322799 139.76772744951697 19.285 35.680853554628435 139.76770104024536 19.285</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-27fbae18-4b99-4920-8603-9093dede5599">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-27fbae18-4b99-4920-8603-9093dede5599">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-27fbae18-4b99-4920-8603-9093dede5599">
											<gml:posList>35.67967943313576 139.7671838387889 18.8 35.67943257493263 139.76707003222998 18.8 35.67961513819857 139.7672000985857 18.8 35.67968557680261 139.76722635571556 18.8 35.67967943313576 139.7671838387889 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-e010efa5-f5e0-4d8b-ab0e-d20645cfe5b5">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e010efa5-f5e0-4d8b-ab0e-d20645cfe5b5">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e010efa5-f5e0-4d8b-ab0e-d20645cfe5b5">
											<gml:posList>35.68018088239533 139.7675422513766 18.8 35.6802906378459 139.76758334683734 18.8 35.68029638468979 139.76755968915072 18.8 35.68032235781998 139.7674527157117 18.8 35.68032809563049 139.76742906906142 18.8 35.67967943313576 139.7671838387889 18.8 35.67973315118795 139.7673413325263 18.8 35.679791535545526 139.76731301375233 18.8 35.67979802200084 139.76729033881708 18.8 35.67981839780668 139.76729909379205 18.8 35.67981192036347 139.76732176872494 18.8 35.67981321627775 139.76738379971644 18.8 35.68002364752738 139.7674770891836 18.8 35.68018088239533 139.7675422513766 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-184c74fd-dfc9-49f5-a3c8-bee5bc00495e">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-184c74fd-dfc9-49f5-a3c8-bee5bc00495e">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-184c74fd-dfc9-49f5-a3c8-bee5bc00495e">
											<gml:posList>35.67981839780668 139.76729909379205 19.402 35.67979802200084 139.76729033881708 19.402 35.679791535545526 139.76731301375233 19.402 35.67981192036347 139.76732176872494 19.402 35.67981839780668 139.76729909379205 19.402</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-16ec7249-c847-4053-bd48-5aa0a5061d47">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-16ec7249-c847-4053-bd48-5aa0a5061d47">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-16ec7249-c847-4053-bd48-5aa0a5061d47">
											<gml:posList>35.68032235781998 139.7674527157117 18.8 35.680608647509075 139.7675607917537 18.8 35.68061473703224 139.7675374319774 18.8 35.68032809563049 139.76742906906142 18.8 35.68032235781998 139.7674527157117 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-1acc49b7-f7af-462a-8505-0204ddfbf214">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-1acc49b7-f7af-462a-8505-0204ddfbf214">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-1acc49b7-f7af-462a-8505-0204ddfbf214">
											<gml:posList>35.680641396100015 139.76754750766764 18.8 35.68082863575704 139.76769194629762 18.8 35.680853554628435 139.76770104024536 18.8 35.68138013404089 139.7678299453555 18.8 35.680641396100015 139.76754750766764 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-7a932199-a77a-42be-ae8c-d6ea43849047">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-7a932199-a77a-42be-ae8c-d6ea43849047">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-7a932199-a77a-42be-ae8c-d6ea43849047">
											<gml:posList>35.68058113222849 139.76766646317878 18.8 35.68029638468979 139.76755968915072 18.8 35.6802906378459 139.76758334683734 18.8 35.68057504268625 139.76768983398318 18.8 35.68058113222849 139.76766646317878 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-d51602d6-d585-44dd-89f7-9d58b366764d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d51602d6-d585-44dd-89f7-9d58b366764d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d51602d6-d585-44dd-89f7-9d58b366764d">
											<gml:posList>35.680309371269814 139.76750620796366 21.325 35.680594894390275 139.76761363299542 21.325 35.680608647509075 139.7675607917537 18.8 35.68032235781998 139.7674527157117 18.8 35.680309371269814 139.76750620796366 21.325</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-0d8dc00f-c562-4777-a485-c6f1829c399a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0d8dc00f-c562-4777-a485-c6f1829c399a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0d8dc00f-c562-4777-a485-c6f1829c399a">
											<gml:posList>35.67981192036347 139.76732176872494 18.8 35.67981839780668 139.76729909379205 18.8 35.67981839780668 139.76729909379205 19.402 35.67981192036347 139.76732176872494 19.402 35.67981192036347 139.76732176872494 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-56f80881-b117-4ca4-a947-55932b0fa3de">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-56f80881-b117-4ca4-a947-55932b0fa3de">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-56f80881-b117-4ca4-a947-55932b0fa3de">
											<gml:posList>35.68082863575704 139.76769194629762 18.8 35.680822223372274 139.76771835555436 18.8 35.680822223372274 139.76771835555436 19.285 35.68082863575704 139.76769194629762 19.285 35.68082863575704 139.76769194629762 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ede550fa-9a4c-4c8e-ace4-ae7ea265417b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ede550fa-9a4c-4c8e-ace4-ae7ea265417b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ede550fa-9a4c-4c8e-ace4-ae7ea265417b">
											<gml:posList>35.68018088239533 139.7675422513766 18.8 35.68002364752738 139.7674770891836 18.8 35.68002364752738 139.7674770891836 3.28 35.68018088239533 139.7675422513766 3.28 35.68018088239533 139.7675422513766 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ba61df39-52e2-4deb-a04a-c60b40f7c0d8">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ba61df39-52e2-4deb-a04a-c60b40f7c0d8">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ba61df39-52e2-4deb-a04a-c60b40f7c0d8">
											<gml:posList>35.681596309577316 139.7679618562584 18.8 35.68159014408413 139.7679948610859 18.8 35.68159014408413 139.7679948610859 19.285 35.681596309577316 139.7679618562584 19.285 35.681596309577316 139.7679618562584 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-6ac97277-0dfa-418f-8860-87db98ac0fb4">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-6ac97277-0dfa-418f-8860-87db98ac0fb4">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-6ac97277-0dfa-418f-8860-87db98ac0fb4">
											<gml:posList>35.68299444828071 139.76808438711157 18.8 35.682990670006205 139.76809820018747 18.8 35.682990670006205 139.76809820018747 14.4 35.682990670006205 139.76809820018747 3.28 35.68299444828071 139.76808438711157 3.28 35.68299444828071 139.76808438711157 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-345f7edd-ae91-484f-b1ba-e80f81a0712b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-345f7edd-ae91-484f-b1ba-e80f81a0712b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-345f7edd-ae91-484f-b1ba-e80f81a0712b">
											<gml:posList>35.68247108759104 139.76803929575465 18.8 35.68299444828071 139.76808438711157 18.8 35.68299444828071 139.76808438711157 3.28 35.68247108759104 139.76803929575465 3.28 35.68247108759104 139.76803929575465 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-6615a69a-2942-4a54-b5d0-91437ce7b162">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-6615a69a-2942-4a54-b5d0-91437ce7b162">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-6615a69a-2942-4a54-b5d0-91437ce7b162">
											<gml:posList>35.68297610237988 139.7681620694726 14.4 35.682990670006205 139.76809820018747 14.4 35.682990670006205 139.76809820018747 18.8 35.68297610237988 139.7681620694726 18.8 35.68297610237988 139.7681620694726 14.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-411d5b2b-0e8d-40b5-904b-cfdc83b9e3b6">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-411d5b2b-0e8d-40b5-904b-cfdc83b9e3b6">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-411d5b2b-0e8d-40b5-904b-cfdc83b9e3b6">
											<gml:posList>35.67973315118795 139.7673413325263 18.8 35.679588616566505 139.76725981027755 18.8 35.679588616566505 139.76725981027755 3.28 35.67973315118795 139.7673413325263 3.28 35.67973315118795 139.7673413325263 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-23750228-fe0b-4942-918e-694bd23dd7a1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-23750228-fe0b-4942-918e-694bd23dd7a1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-23750228-fe0b-4942-918e-694bd23dd7a1">
											<gml:posList>35.68002364752738 139.7674770891836 18.8 35.67981321627775 139.76738379971644 18.8 35.67981321627775 139.76738379971644 3.28 35.68002364752738 139.7674770891836 3.28 35.68002364752738 139.7674770891836 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-cde4b9dc-864d-45fb-8d05-c8a43c009209">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-cde4b9dc-864d-45fb-8d05-c8a43c009209">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-cde4b9dc-864d-45fb-8d05-c8a43c009209">
											<gml:posList>35.68315142776381 139.7681780570067 14.4 35.68297610237988 139.7681620694726 14.4 35.68297610237988 139.7681620694726 3.28 35.68315142776381 139.7681780570067 3.28 35.68315142776381 139.7681780570067 14.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ba0ae98a-e69c-4053-bcc6-f541ff93e3b2">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ba0ae98a-e69c-4053-bcc6-f541ff93e3b2">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ba0ae98a-e69c-4053-bcc6-f541ff93e3b2">
											<gml:posList>35.68084713322799 139.76772744951697 18.8 35.680853554628435 139.76770104024536 18.8 35.680853554628435 139.76770104024536 19.285 35.68084713322799 139.76772744951697 19.285 35.68084713322799 139.76772744951697 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ba9388d6-8664-491c-8120-70ade7ec64b1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ba9388d6-8664-491c-8120-70ade7ec64b1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ba9388d6-8664-491c-8120-70ade7ec64b1">
											<gml:posList>35.68145252286986 139.76801184325438 18.8 35.681313236193 139.76796621901718 18.8 35.681313236193 139.76796621901718 3.28 35.68145252286986 139.76801184325438 3.28 35.68145252286986 139.76801184325438 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-0357bbe1-0914-402d-99a7-f0706927452a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0357bbe1-0914-402d-99a7-f0706927452a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0357bbe1-0914-402d-99a7-f0706927452a">
											<gml:posList>35.68061473703224 139.7675374319774 18.8 35.680641396100015 139.76754750766764 18.8 35.6806410274372 139.76754915407398 3.28 35.68061473703224 139.7675374319774 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-d38cd7d9-4a8f-4981-bd32-d46ee7388228">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d38cd7d9-4a8f-4981-bd32-d46ee7388228">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d38cd7d9-4a8f-4981-bd32-d46ee7388228">
											<gml:posList>35.68161552155593 139.76800197728204 18.8 35.68162168705101 139.7679689724446 18.8 35.68162168705101 139.7679689724446 19.285 35.68161552155593 139.76800197728204 19.285 35.68161552155593 139.76800197728204 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-8f060b3b-842e-4ac6-899e-7e7f24b95e26">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-8f060b3b-842e-4ac6-899e-7e7f24b95e26">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-8f060b3b-842e-4ac6-899e-7e7f24b95e26">
											<gml:posList>35.67967943313576 139.7671838387889 3.28 35.68032809563049 139.76742906906142 18.8 35.6806410274372 139.76754915407398 3.28 35.67967943313576 139.7671838387889 3.28</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-bc1662d5-dfd3-4d5d-b356-670b05e68695">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-bc1662d5-dfd3-4d5d-b356-670b05e68695">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-bc1662d5-dfd3-4d5d-b356-670b05e68695">
											<gml:posList>35.67981321627775 139.76738379971644 18.8 35.67973315118795 139.7673413325263 18.8 35.67973315118795 139.7673413325263 3.28 35.67981321627775 139.76738379971644 3.28 35.67981321627775 139.76738379971644 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-a0084e6b-4965-4fe8-a6ae-00f4a9e5da48">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a0084e6b-4965-4fe8-a6ae-00f4a9e5da48">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a0084e6b-4965-4fe8-a6ae-00f4a9e5da48">
											<gml:posList>35.6806410274372 139.76754915407398 3.28 35.680641396100015 139.76754750766764 18.8 35.68138013404089 139.7678299453555 18.8 35.6806410274372 139.76754915407398 3.28</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-37ca1552-b7b3-49b8-a7f5-c29a3200d789">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-37ca1552-b7b3-49b8-a7f5-c29a3200d789">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-37ca1552-b7b3-49b8-a7f5-c29a3200d789">
											<gml:posList>35.68296935357799 139.76818328711468 18.8 35.68223283044604 139.7681601328855 18.8 35.68223283044604 139.7681601328855 3.28 35.68296935357799 139.76818328711468 3.28 35.68296935357799 139.76818328711468 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-956de693-8e14-4fb2-bc0f-33e0ff64511a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-956de693-8e14-4fb2-bc0f-33e0ff64511a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-956de693-8e14-4fb2-bc0f-33e0ff64511a">
											<gml:posList>35.67968557680261 139.76722635571556 18.8 35.67961513819857 139.7672000985857 18.8 35.67961513819857 139.7672000985857 20.768 35.67968557680261 139.76722635571556 20.768 35.67968557680261 139.76722635571556 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-7932ac53-207a-4203-be03-d30679ad1adf">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-7932ac53-207a-4203-be03-d30679ad1adf">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-7932ac53-207a-4203-be03-d30679ad1adf">
											<gml:posList>35.68162168705101 139.7679689724446 18.8 35.681596309577316 139.7679618562584 18.8 35.681596309577316 139.7679618562584 19.285 35.68162168705101 139.7679689724446 19.285 35.68162168705101 139.7679689724446 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-d288132d-5836-4de6-a9b9-6b246a10eb9b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d288132d-5836-4de6-a9b9-6b246a10eb9b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d288132d-5836-4de6-a9b9-6b246a10eb9b">
											<gml:posList>35.67940909501222 139.76715346031162 18.8 35.679409812587245 139.7671470521656 18.8 35.679409812587245 139.7671470521656 3.28 35.67940909501222 139.76715346031162 3.28 35.67940909501222 139.76715346031162 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-4f9e57ef-8f7e-4e2e-969d-3ae51394827d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-4f9e57ef-8f7e-4e2e-969d-3ae51394827d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-4f9e57ef-8f7e-4e2e-969d-3ae51394827d">
											<gml:posList>35.680608647509075 139.7675607917537 18.8 35.680594894390275 139.76761363299542 21.325 35.68058113222849 139.76766646317878 18.8 35.680608647509075 139.7675607917537 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-c3da5a96-d5ca-4413-8704-5eab1e4312fc">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c3da5a96-d5ca-4413-8704-5eab1e4312fc">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c3da5a96-d5ca-4413-8704-5eab1e4312fc">
											<gml:posList>35.68032809563049 139.76742906906142 18.8 35.68061473703224 139.7675374319774 18.8 35.6806410274372 139.76754915407398 3.28 35.68032809563049 139.76742906906142 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-582dd087-e3f9-45f8-a2b8-b2290b939607">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-582dd087-e3f9-45f8-a2b8-b2290b939607">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-582dd087-e3f9-45f8-a2b8-b2290b939607">
											<gml:posList>35.68148218885106 139.76786587774592 18.8 35.681601460919204 139.7679037847766 18.8 35.681601460919204 139.7679037847766 3.28 35.68148218885106 139.76786587774592 3.28 35.68148218885106 139.76786587774592 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-44576f61-ed6d-4eaa-bef3-9476cde73f7f">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-44576f61-ed6d-4eaa-bef3-9476cde73f7f">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-44576f61-ed6d-4eaa-bef3-9476cde73f7f">
											<gml:posList>35.679791535545526 139.76731301375233 18.8 35.67981192036347 139.76732176872494 18.8 35.67981192036347 139.76732176872494 19.402 35.679791535545526 139.76731301375233 19.402 35.679791535545526 139.76731301375233 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-8ffb0773-d17a-4543-8353-4ab52c055eda">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-8ffb0773-d17a-4543-8353-4ab52c055eda">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-8ffb0773-d17a-4543-8353-4ab52c055eda">
											<gml:posList>35.67979802200084 139.76729033881708 18.8 35.679791535545526 139.76731301375233 18.8 35.679791535545526 139.76731301375233 19.402 35.67979802200084 139.76729033881708 19.402 35.67979802200084 139.76729033881708 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-f89c9b27-ff32-4e71-9c73-2beada730557">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-f89c9b27-ff32-4e71-9c73-2beada730557">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-f89c9b27-ff32-4e71-9c73-2beada730557">
											<gml:posList>35.679588616566505 139.76725981027755 18.8 35.67940909501222 139.76715346031162 18.8 35.67940909501222 139.76715346031162 3.28 35.679588616566505 139.76725981027755 3.28 35.679588616566505 139.76725981027755 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-b5425a53-e545-48e2-8707-4d0a62f7943a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b5425a53-e545-48e2-8707-4d0a62f7943a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b5425a53-e545-48e2-8707-4d0a62f7943a">
											<gml:posList>35.67967943313576 139.7671838387889 3.28 35.67967943313576 139.7671838387889 18.8 35.68032809563049 139.76742906906142 18.8 35.67967943313576 139.7671838387889 3.28</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-f2a7ff89-c15c-40ea-a186-4cbc03768b53">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-f2a7ff89-c15c-40ea-a186-4cbc03768b53">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-f2a7ff89-c15c-40ea-a186-4cbc03768b53">
											<gml:posList>35.681834401233836 139.76810101951062 18.8 35.68159225703724 139.76805161194767 18.8 35.68159225703724 139.76805161194767 3.28 35.681834401233836 139.76810101951062 3.28 35.681834401233836 139.76810101951062 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-d51ff071-e0fb-482f-911a-ab620fda9680">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d51ff071-e0fb-482f-911a-ab620fda9680">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d51ff071-e0fb-482f-911a-ab620fda9680">
											<gml:posList>35.68208589983847 139.76814710540026 18.8 35.681834401233836 139.76810101951062 18.8 35.681834401233836 139.76810101951062 3.28 35.68208589983847 139.76814710540026 3.28 35.68208589983847 139.76814710540026 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-b7b24a6f-c812-4919-bed5-87f9476061c6">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b7b24a6f-c812-4919-bed5-87f9476061c6">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b7b24a6f-c812-4919-bed5-87f9476061c6">
											<gml:posList>35.680853554628435 139.76770104024536 18.8 35.68082863575704 139.76769194629762 18.8 35.68082863575704 139.76769194629762 19.285 35.680853554628435 139.76770104024536 19.285 35.680853554628435 139.76770104024536 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-327b94c9-d353-4812-a580-554869b0d806">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-327b94c9-d353-4812-a580-554869b0d806">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-327b94c9-d353-4812-a580-554869b0d806">
											<gml:posList>35.68315535868214 139.76811320191905 14.4 35.68315142776381 139.7681780570067 14.4 35.68315142776381 139.7681780570067 3.28 35.68315535868214 139.76811320191905 3.28 35.68315535868214 139.76811320191905 14.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-294a77ad-27fd-45cc-b1fe-d6e1d49f3b6d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-294a77ad-27fd-45cc-b1fe-d6e1d49f3b6d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-294a77ad-27fd-45cc-b1fe-d6e1d49f3b6d">
											<gml:posList>35.68018088239533 139.7675422513766 3.28 35.68060629060685 139.76770152996897 3.28 35.68060629060685 139.76770152996897 18.8 35.68057504268625 139.76768983398318 18.8 35.6802906378459 139.76758334683734 18.8 35.68018088239533 139.7675422513766 18.8 35.68018088239533 139.7675422513766 3.28</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-a6c1380c-04ab-41c9-bc5d-4ebae2cfea7b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a6c1380c-04ab-41c9-bc5d-4ebae2cfea7b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a6c1380c-04ab-41c9-bc5d-4ebae2cfea7b">
											<gml:posList>35.680822223372274 139.76771835555436 18.8 35.68084713322799 139.76772744951697 18.8 35.68084713322799 139.76772744951697 19.285 35.680822223372274 139.76771835555436 19.285 35.680822223372274 139.76771835555436 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-23c57463-62cb-441e-8f66-547b7e446b2b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-23c57463-62cb-441e-8f66-547b7e446b2b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-23c57463-62cb-441e-8f66-547b7e446b2b">
											<gml:posList>35.68235265219252 139.7680315482301 18.8 35.68247108759104 139.76803929575465 18.8 35.68247108759104 139.76803929575465 3.28 35.68235265219252 139.7680315482301 3.28 35.68235265219252 139.7680315482301 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-5b2cd6e6-af6b-4c00-bcb0-72e937fa8d3f">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-5b2cd6e6-af6b-4c00-bcb0-72e937fa8d3f">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-5b2cd6e6-af6b-4c00-bcb0-72e937fa8d3f">
											<gml:posList>35.679409812587245 139.7671470521656 18.8 35.67943257493263 139.76707003222998 18.8 35.67943257493263 139.76707003222998 3.28 35.679409812587245 139.7671470521656 3.28 35.679409812587245 139.7671470521656 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-1968cff1-b341-41c2-8b66-e94c86b4b653">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-1968cff1-b341-41c2-8b66-e94c86b4b653">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-1968cff1-b341-41c2-8b66-e94c86b4b653">
											<gml:posList>35.681601460919204 139.7679037847766 18.8 35.68191075940929 139.76797357563888 18.8 35.68191075940929 139.76797357563888 3.28 35.681601460919204 139.7679037847766 3.28 35.681601460919204 139.7679037847766 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-9c18ef7f-1c69-4b39-87f5-ec970d7b276f">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-9c18ef7f-1c69-4b39-87f5-ec970d7b276f">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-9c18ef7f-1c69-4b39-87f5-ec970d7b276f">
											<gml:posList>35.68138013404089 139.7678299453555 18.8 35.68148218885106 139.76786587774592 18.8 35.68148218885106 139.76786587774592 3.28 35.68138013404089 139.7678299453555 3.28 35.68138013404089 139.7678299453555 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-eb85abd2-1775-42f4-8daa-aef6fdd75519">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-eb85abd2-1775-42f4-8daa-aef6fdd75519">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-eb85abd2-1775-42f4-8daa-aef6fdd75519">
											<gml:posList>35.67967776116189 139.76725783661183 18.8 35.67968557680261 139.76722635571556 18.8 35.67968557680261 139.76722635571556 20.768 35.67967776116189 139.76725783661183 20.768 35.67967776116189 139.76725783661183 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-f6ed6f02-27bb-443c-8972-3877a9d86933">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-f6ed6f02-27bb-443c-8972-3877a9d86933">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-f6ed6f02-27bb-443c-8972-3877a9d86933">
											<gml:posList>35.68060629060685 139.76770152996897 18.8 35.68060629060685 139.76770152996897 3.28 35.681313236193 139.76796621901718 3.28 35.681313236193 139.76796621901718 18.8 35.68060629060685 139.76770152996897 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-aa59f7a7-5434-48fb-ac52-3ba39775453b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-aa59f7a7-5434-48fb-ac52-3ba39775453b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-aa59f7a7-5434-48fb-ac52-3ba39775453b">
											<gml:posList>35.67943257493263 139.76707003222998 18.8 35.67967943313576 139.7671838387889 18.8 35.67967943313576 139.7671838387889 3.28 35.67943257493263 139.76707003222998 3.28 35.67943257493263 139.76707003222998 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-09d83ee7-0d41-492e-803b-fffbf0454bf0">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-09d83ee7-0d41-492e-803b-fffbf0454bf0">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-09d83ee7-0d41-492e-803b-fffbf0454bf0">
											<gml:posList>35.68296935357799 139.76818328711468 18.8 35.68296935357799 139.76818328711468 3.28 35.68297610237988 139.7681620694726 3.28 35.68297610237988 139.7681620694726 14.4 35.68297610237988 139.7681620694726 18.8 35.68296935357799 139.76818328711468 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-0e6a0ca1-930d-42d6-8970-debf17ff55b9">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0e6a0ca1-930d-42d6-8970-debf17ff55b9">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0e6a0ca1-930d-42d6-8970-debf17ff55b9">
											<gml:posList>35.68191075940929 139.76797357563888 18.8 35.682185789322325 139.76801312374045 18.8 35.682185789322325 139.76801312374045 3.28 35.68191075940929 139.76797357563888 3.28 35.68191075940929 139.76797357563888 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-5e201b45-6e9b-48e2-a7dd-81d2dee38736">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-5e201b45-6e9b-48e2-a7dd-81d2dee38736">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-5e201b45-6e9b-48e2-a7dd-81d2dee38736">
											<gml:posList>35.68029638468979 139.76755968915072 18.8 35.680309371269814 139.76750620796366 21.325 35.68032235781998 139.7674527157117 18.8 35.68029638468979 139.76755968915072 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-7a793ed6-5c73-4533-b1ac-1004d371a453">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-7a793ed6-5c73-4533-b1ac-1004d371a453">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-7a793ed6-5c73-4533-b1ac-1004d371a453">
											<gml:posList>35.67981839780668 139.76729909379205 18.8 35.67979802200084 139.76729033881708 18.8 35.67979802200084 139.76729033881708 19.402 35.67981839780668 139.76729909379205 19.402 35.67981839780668 139.76729909379205 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-793a49f3-8b6a-4902-a561-25fda9b82f1c">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-793a49f3-8b6a-4902-a561-25fda9b82f1c">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-793a49f3-8b6a-4902-a561-25fda9b82f1c">
											<gml:posList>35.682185789322325 139.76801312374045 18.8 35.68235265219252 139.7680315482301 18.8 35.68235265219252 139.7680315482301 3.28 35.682185789322325 139.76801312374045 3.28 35.682185789322325 139.76801312374045 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-f387bc3a-6bda-4b8f-a4c2-fc055ee4b808">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-f387bc3a-6bda-4b8f-a4c2-fc055ee4b808">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-f387bc3a-6bda-4b8f-a4c2-fc055ee4b808">
											<gml:posList>35.68159225703724 139.76805161194767 18.8 35.68145252286986 139.76801184325438 18.8 35.68145252286986 139.76801184325438 3.28 35.68159225703724 139.76805161194767 3.28 35.68159225703724 139.76805161194767 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-13e8d0d2-0caf-4229-9093-e5f1aebd6518">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-13e8d0d2-0caf-4229-9093-e5f1aebd6518">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-13e8d0d2-0caf-4229-9093-e5f1aebd6518">
											<gml:posList>35.68138013404089 139.7678299453555 3.28 35.6806410274372 139.76754915407398 3.28 35.68138013404089 139.7678299453555 18.8 35.68138013404089 139.7678299453555 3.28</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-9dd35313-23da-400e-b612-ddcfad99a64c">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-9dd35313-23da-400e-b612-ddcfad99a64c">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-9dd35313-23da-400e-b612-ddcfad99a64c">
											<gml:posList>35.67960732256459 139.76723157945685 18.8 35.67967776116189 139.76725783661183 18.8 35.67967776116189 139.76725783661183 20.768 35.67960732256459 139.76723157945685 20.768 35.67960732256459 139.76723157945685 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-6763edf7-87ee-4ee3-9c15-bff7a16dcc1e">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-6763edf7-87ee-4ee3-9c15-bff7a16dcc1e">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-6763edf7-87ee-4ee3-9c15-bff7a16dcc1e">
											<gml:posList>35.67961513819857 139.7672000985857 18.8 35.67960732256459 139.76723157945685 18.8 35.67960732256459 139.76723157945685 20.768 35.67961513819857 139.7672000985857 20.768 35.67961513819857 139.7672000985857 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-e7532bf9-531a-4652-8a7d-5445bea6e74b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e7532bf9-531a-4652-8a7d-5445bea6e74b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e7532bf9-531a-4652-8a7d-5445bea6e74b">
											<gml:posList>35.682990670006205 139.76809820018747 14.4 35.68315535868214 139.76811320191905 14.4 35.68315535868214 139.76811320191905 3.28 35.682990670006205 139.76809820018747 3.28 35.682990670006205 139.76809820018747 14.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-90b1c588-a2e8-4af9-b70c-c47cd6ae1a1b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-90b1c588-a2e8-4af9-b70c-c47cd6ae1a1b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-90b1c588-a2e8-4af9-b70c-c47cd6ae1a1b">
											<gml:posList>35.68159014408413 139.7679948610859 18.8 35.68161552155593 139.76800197728204 18.8 35.68161552155593 139.76800197728204 19.285 35.68159014408413 139.7679948610859 19.285 35.68159014408413 139.7679948610859 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-b6789fb2-9b6b-4ca7-a1d7-ddf156b8377a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b6789fb2-9b6b-4ca7-a1d7-ddf156b8377a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b6789fb2-9b6b-4ca7-a1d7-ddf156b8377a">
											<gml:posList>35.68223283044604 139.7681601328855 18.8 35.68208589983847 139.76814710540026 18.8 35.68208589983847 139.76814710540026 3.28 35.68223283044604 139.7681601328855 3.28 35.68223283044604 139.7681601328855 18.8</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:address>
				<core:Address>
					<core:xalAddress>
						<xAL:AddressDetails>
							<xAL:Country>
								<xAL:CountryName>日本</xAL:CountryName>
								<xAL:Locality>
									<xAL:LocalityName Type="Town">東京都千代田区丸の内一丁目</xAL:LocalityName>
								</xAL:Locality>
							</xAL:Country>
						</xAL:AddressDetails>
					</core:xalAddress>
				</core:Address>
			</bldg:address>
			<uro:bldgDataQualityAttribute>
				<uro:DataQualityAttribute>
					<uro:geometrySrcDescLod0 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod0>
					<uro:geometrySrcDescLod1 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod1>
					<uro:geometrySrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod2>
					<uro:geometrySrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">999</uro:geometrySrcDescLod3>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">201</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">000</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">023</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">400</uro:thematicSrcDesc>
					<uro:appearanceSrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">1</uro:appearanceSrcDescLod2>
					<uro:appearanceSrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">99</uro:appearanceSrcDescLod3>
					<uro:lodType codeSpace="../../codelists/Building_lodType.xml">2.2</uro:lodType>
					<uro:lod1HeightType codeSpace="../../codelists/DataQualityAttribute_lod1HeightType.xml">2</uro:lod1HeightType>
					<uro:publicSurveyDataQualityAttribute>
						<uro:PublicSurveyDataQualityAttribute>
							<uro:srcScaleLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod0>
							<uro:srcScaleLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod1>
							<uro:srcScaleLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod2>
							<uro:publicSurveySrcDescLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod0>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod2>
						</uro:PublicSurveyDataQualityAttribute>
					</uro:publicSurveyDataQualityAttribute>
				</uro:DataQualityAttribute>
			</uro:bldgDataQualityAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">10</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.12</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">31</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.115</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">8</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.115</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:HighTideRiskAttribute>
					<uro:description codeSpace="../../codelists/HighTideRiskAttribute_description.xml">2</uro:description>
					<uro:rank codeSpace="../../codelists/HighTideRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.14</uro:depth>
				</uro:HighTideRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">100</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key100.xml">11</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">101</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key101.xml">1</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">102</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key102.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">103</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key103.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">104</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key104.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">105</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key105.xml">9</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">106</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key106.xml">10</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:buildingDetailAttribute>
				<uro:BuildingDetailAttribute>
					<uro:buildingRoofEdgeArea uom="m2">5356.7638</uro:buildingRoofEdgeArea>
					<uro:fireproofStructureType codeSpace="../../codelists/BuildingDetailAttribute_fireproofStructureType.xml">1001</uro:fireproofStructureType>
					<uro:urbanPlanType codeSpace="../../codelists/Common_urbanPlanType.xml">21</uro:urbanPlanType>
					<uro:areaClassificationType codeSpace="../../codelists/Common_areaClassificationType.xml">22</uro:areaClassificationType>
					<uro:districtsAndZonesType codeSpace="../../codelists/Common_districtsAndZonesType.xml">10</uro:districtsAndZonesType>
					<uro:landUseType codeSpace="../../codelists/Common_landUseType.xml">216</uro:landUseType>
					<uro:detailedUsage codeSpace="../../codelists/BuildingDetailAttribute_detailedUsage.xml">1431</uro:detailedUsage>
					<uro:specifiedBuildingCoverageRate>80</uro:specifiedBuildingCoverageRate>
					<uro:specifiedFloorAreaRate>900</uro:specifiedFloorAreaRate>
					<uro:surveyYear>2021</uro:surveyYear>
				</uro:BuildingDetailAttribute>
			</uro:buildingDetailAttribute>
			<uro:buildingIDAttribute>
				<uro:BuildingIDAttribute>
					<uro:buildingID>13101-bldg-2544</uro:buildingID>
					<uro:prefecture codeSpace="../../codelists/Common_localPublicAuthorities.xml">13</uro:prefecture>
					<uro:city codeSpace="../../codelists/Common_localPublicAuthorities.xml">13101</uro:city>
				</uro:BuildingIDAttribute>
			</uro:buildingIDAttribute>
		</bldg:Building>
	</core:cityObjectMember>
	<core:cityObjectMember>
		<bldg:Building gml:id="bldg_982a7829-06a8-49d8-8ab8-ee6584794864">
			<core:creationDate>2024-03-15</core:creationDate>
			<gen:stringAttribute name="延べ面積換算係数">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="説明注記">
				<gen:value> </gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="大字・町コード">
				<gen:value>55</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="町・丁目コード">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="13+区市町村コード+大字・町コード+町・丁目コード">
				<gen:value>13101055001</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="地区計画">
				<gen:value>大手町・丸の内・有楽町地区</gen:value>
			</gen:stringAttribute>
			<bldg:class codeSpace="../../codelists/Building_class.xml">3003</bldg:class>
			<bldg:usage codeSpace="../../codelists/Building_usage.xml">431</bldg:usage>
			<bldg:measuredHeight uom="m">9.9</bldg:measuredHeight>
			<bldg:storeysAboveGround>2</bldg:storeysAboveGround>
			<bldg:storeysBelowGround>0</bldg:storeysBelowGround>
			<bldg:lod0RoofEdge>
				<gml:MultiSurface>
					<gml:surfaceMember>
						<gml:Polygon>
							<gml:exterior>
								<gml:LinearRing>
									<gml:posList>35.681166805317055 139.76646699329308 0 35.6808835434249 139.7663591719767 0 35.68089672100534 139.76629353756175 0 35.68061636934651 139.76618386982085 0 35.68049261443902 139.7661415505095 0 35.68048852775554 139.76615148577713 0 35.68020325200333 139.7660696853095 0 35.6802300164487 139.76609068646678 0 35.680224659574016 139.76611808905443 0 35.680200120952 139.766112210207 0 35.68019320091423 139.76614898247018 0 35.68026226739384 139.76617118553654 0 35.68174357884888 139.76673417884777 0 35.68198259466042 139.76683042804945 0 35.68220387319542 139.7669136007703 0 35.68221350435227 139.76687277082544 0 35.68199450616436 139.76675681730651 0 35.681989331856805 139.7667723328026 0 35.68194594458907 139.7667499637856 0 35.68194317169561 139.7667706587222 0 35.681822907072316 139.76671519902655 0 35.68137810243484 139.7665422070372 0 35.68138230283991 139.76652760942204 0 35.681171023236594 139.7664498657634 0 35.681166805317055 139.76646699329308 0</gml:posList>
								</gml:LinearRing>
							</gml:exterior>
						</gml:Polygon>
					</gml:surfaceMember>
				</gml:MultiSurface>
			</bldg:lod0RoofEdge>
			<bldg:lod1Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681166805317055 139.76646699329308 3.5 35.681171023236594 139.7664498657634 3.5 35.68138230283991 139.76652760942204 3.5 35.68137810243484 139.7665422070372 3.5 35.681822907072316 139.76671519902655 3.5 35.68194317169561 139.7667706587222 3.5 35.68194594458907 139.7667499637856 3.5 35.681989331856805 139.7667723328026 3.5 35.68199450616436 139.76675681730651 3.5 35.68221350435227 139.76687277082544 3.5 35.68220387319542 139.7669136007703 3.5 35.68198259466042 139.76683042804945 3.5 35.68174357884888 139.76673417884777 3.5 35.68026226739384 139.76617118553654 3.5 35.68019320091423 139.76614898247018 3.5 35.680200120952 139.766112210207 3.5 35.680224659574016 139.76611808905443 3.5 35.6802300164487 139.76609068646678 3.5 35.68020325200333 139.7660696853095 3.5 35.68048852775554 139.76615148577713 3.5 35.68049261443902 139.7661415505095 3.5 35.68061636934651 139.76618386982085 3.5 35.68089672100534 139.76629353756175 3.5 35.6808835434249 139.7663591719767 3.5 35.681166805317055 139.76646699329308 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681166805317055 139.76646699329308 3.5 35.6808835434249 139.7663591719767 3.5 35.6808835434249 139.7663591719767 13.1 35.681166805317055 139.76646699329308 13.1 35.681166805317055 139.76646699329308 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.6808835434249 139.7663591719767 3.5 35.68089672100534 139.76629353756175 3.5 35.68089672100534 139.76629353756175 13.1 35.6808835434249 139.7663591719767 13.1 35.6808835434249 139.7663591719767 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68089672100534 139.76629353756175 3.5 35.68061636934651 139.76618386982085 3.5 35.68061636934651 139.76618386982085 13.1 35.68089672100534 139.76629353756175 13.1 35.68089672100534 139.76629353756175 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68061636934651 139.76618386982085 3.5 35.68049261443902 139.7661415505095 3.5 35.68049261443902 139.7661415505095 13.1 35.68061636934651 139.76618386982085 13.1 35.68061636934651 139.76618386982085 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68049261443902 139.7661415505095 3.5 35.68048852775554 139.76615148577713 3.5 35.68048852775554 139.76615148577713 13.1 35.68049261443902 139.7661415505095 13.1 35.68049261443902 139.7661415505095 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68048852775554 139.76615148577713 3.5 35.68020325200333 139.7660696853095 3.5 35.68020325200333 139.7660696853095 13.1 35.68048852775554 139.76615148577713 13.1 35.68048852775554 139.76615148577713 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68020325200333 139.7660696853095 3.5 35.6802300164487 139.76609068646678 3.5 35.6802300164487 139.76609068646678 13.1 35.68020325200333 139.7660696853095 13.1 35.68020325200333 139.7660696853095 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.6802300164487 139.76609068646678 3.5 35.680224659574016 139.76611808905443 3.5 35.680224659574016 139.76611808905443 13.1 35.6802300164487 139.76609068646678 13.1 35.6802300164487 139.76609068646678 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680224659574016 139.76611808905443 3.5 35.680200120952 139.766112210207 3.5 35.680200120952 139.766112210207 13.1 35.680224659574016 139.76611808905443 13.1 35.680224659574016 139.76611808905443 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680200120952 139.766112210207 3.5 35.68019320091423 139.76614898247018 3.5 35.68019320091423 139.76614898247018 13.1 35.680200120952 139.766112210207 13.1 35.680200120952 139.766112210207 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68019320091423 139.76614898247018 3.5 35.68026226739384 139.76617118553654 3.5 35.68026226739384 139.76617118553654 13.1 35.68019320091423 139.76614898247018 13.1 35.68019320091423 139.76614898247018 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68026226739384 139.76617118553654 3.5 35.68174357884888 139.76673417884777 3.5 35.68174357884888 139.76673417884777 13.1 35.68026226739384 139.76617118553654 13.1 35.68026226739384 139.76617118553654 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68174357884888 139.76673417884777 3.5 35.68198259466042 139.76683042804945 3.5 35.68198259466042 139.76683042804945 13.1 35.68174357884888 139.76673417884777 13.1 35.68174357884888 139.76673417884777 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68198259466042 139.76683042804945 3.5 35.68220387319542 139.7669136007703 3.5 35.68220387319542 139.7669136007703 13.1 35.68198259466042 139.76683042804945 13.1 35.68198259466042 139.76683042804945 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68220387319542 139.7669136007703 3.5 35.68221350435227 139.76687277082544 3.5 35.68221350435227 139.76687277082544 13.1 35.68220387319542 139.7669136007703 13.1 35.68220387319542 139.7669136007703 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68221350435227 139.76687277082544 3.5 35.68199450616436 139.76675681730651 3.5 35.68199450616436 139.76675681730651 13.1 35.68221350435227 139.76687277082544 13.1 35.68221350435227 139.76687277082544 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68199450616436 139.76675681730651 3.5 35.681989331856805 139.7667723328026 3.5 35.681989331856805 139.7667723328026 13.1 35.68199450616436 139.76675681730651 13.1 35.68199450616436 139.76675681730651 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681989331856805 139.7667723328026 3.5 35.68194594458907 139.7667499637856 3.5 35.68194594458907 139.7667499637856 13.1 35.681989331856805 139.7667723328026 13.1 35.681989331856805 139.7667723328026 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68194594458907 139.7667499637856 3.5 35.68194317169561 139.7667706587222 3.5 35.68194317169561 139.7667706587222 13.1 35.68194594458907 139.7667499637856 13.1 35.68194594458907 139.7667499637856 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68194317169561 139.7667706587222 3.5 35.681822907072316 139.76671519902655 3.5 35.681822907072316 139.76671519902655 13.1 35.68194317169561 139.7667706587222 13.1 35.68194317169561 139.7667706587222 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681822907072316 139.76671519902655 3.5 35.68137810243484 139.7665422070372 3.5 35.68137810243484 139.7665422070372 13.1 35.681822907072316 139.76671519902655 13.1 35.681822907072316 139.76671519902655 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68137810243484 139.7665422070372 3.5 35.68138230283991 139.76652760942204 3.5 35.68138230283991 139.76652760942204 13.1 35.68137810243484 139.7665422070372 13.1 35.68137810243484 139.7665422070372 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68138230283991 139.76652760942204 3.5 35.681171023236594 139.7664498657634 3.5 35.681171023236594 139.7664498657634 13.1 35.68138230283991 139.76652760942204 13.1 35.68138230283991 139.76652760942204 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681171023236594 139.7664498657634 3.5 35.681166805317055 139.76646699329308 3.5 35.681166805317055 139.76646699329308 13.1 35.681171023236594 139.7664498657634 13.1 35.681171023236594 139.7664498657634 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681166805317055 139.76646699329308 13.1 35.6808835434249 139.7663591719767 13.1 35.68089672100534 139.76629353756175 13.1 35.68061636934651 139.76618386982085 13.1 35.68049261443902 139.7661415505095 13.1 35.68048852775554 139.76615148577713 13.1 35.68020325200333 139.7660696853095 13.1 35.6802300164487 139.76609068646678 13.1 35.680224659574016 139.76611808905443 13.1 35.680200120952 139.766112210207 13.1 35.68019320091423 139.76614898247018 13.1 35.68026226739384 139.76617118553654 13.1 35.68174357884888 139.76673417884777 13.1 35.68198259466042 139.76683042804945 13.1 35.68220387319542 139.7669136007703 13.1 35.68221350435227 139.76687277082544 13.1 35.68199450616436 139.76675681730651 13.1 35.681989331856805 139.7667723328026 13.1 35.68194594458907 139.7667499637856 13.1 35.68194317169561 139.7667706587222 13.1 35.681822907072316 139.76671519902655 13.1 35.68137810243484 139.7665422070372 13.1 35.68138230283991 139.76652760942204 13.1 35.681171023236594 139.7664498657634 13.1 35.681166805317055 139.76646699329308 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod1Solid>
			<bldg:lod2Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember xlink:href="#poly-0033fde9-d8ac-42d3-b6a1-f230122b236b"/>
							<gml:surfaceMember xlink:href="#poly-ef8d4ec5-7694-45d4-b228-13e97bd23e73"/>
							<gml:surfaceMember xlink:href="#poly-e96e755d-d1d3-45e1-8d23-502af6b9b700"/>
							<gml:surfaceMember xlink:href="#poly-2dd153e9-232a-404d-8909-a49c1a703c1a"/>
							<gml:surfaceMember xlink:href="#poly-80fcd88d-2dd0-4c40-8fd9-8e85ff7eff21"/>
							<gml:surfaceMember xlink:href="#poly-03616a2a-fdc9-4cb3-81f3-3a88498cc52b"/>
							<gml:surfaceMember xlink:href="#poly-5b8cea14-3082-4ea1-b7b7-c771cf6b23fc"/>
							<gml:surfaceMember xlink:href="#poly-e14dffde-5929-4f0b-b3f8-b9cdd4c3bc31"/>
							<gml:surfaceMember xlink:href="#poly-ed2c6134-8e13-4eec-bdfc-617404350382"/>
							<gml:surfaceMember xlink:href="#poly-31588d34-662d-45a8-a81f-15d82ed112ac"/>
							<gml:surfaceMember xlink:href="#poly-c0b2b90f-810f-40c8-bcd0-e29a7fd154b9"/>
							<gml:surfaceMember xlink:href="#poly-1298c67a-224e-4a03-94a6-c9f3dd693954"/>
							<gml:surfaceMember xlink:href="#poly-9b06fdbe-4bf9-48e5-b749-33a2750d1db0"/>
							<gml:surfaceMember xlink:href="#poly-b09c1c9c-3950-4936-97c8-71871e002ecc"/>
							<gml:surfaceMember xlink:href="#poly-9e37bee0-553f-4597-8a42-286c7976825c"/>
							<gml:surfaceMember xlink:href="#poly-3bd8480c-b6d5-44e8-93e9-56d8451a6c06"/>
							<gml:surfaceMember xlink:href="#poly-ed34346d-55b7-41d5-8b61-de8d74061626"/>
							<gml:surfaceMember xlink:href="#poly-a227914d-dcf7-4735-9dae-774229c797e9"/>
							<gml:surfaceMember xlink:href="#poly-60da0cc1-ea10-4e25-8ffb-0b3e91f94bc2"/>
							<gml:surfaceMember xlink:href="#poly-0400e9f9-952b-437a-b671-058121223520"/>
							<gml:surfaceMember xlink:href="#poly-07787edf-971c-4234-ad12-e3f703a92cf0"/>
							<gml:surfaceMember xlink:href="#poly-696ce487-377b-4799-9f6d-c87023fb8524"/>
							<gml:surfaceMember xlink:href="#poly-47fcf6a2-4986-4d2d-ae65-1731d9274e75"/>
							<gml:surfaceMember xlink:href="#poly-6b94f4ec-351a-481e-8a81-153efad2761a"/>
							<gml:surfaceMember xlink:href="#poly-189a3372-1689-49cb-9222-7363621dae68"/>
							<gml:surfaceMember xlink:href="#poly-b021b565-924c-4a93-8a28-7a94a905bef2"/>
							<gml:surfaceMember xlink:href="#poly-a1cec9c0-c6f5-49de-ac1e-7a9755a465c5"/>
							<gml:surfaceMember xlink:href="#poly-996692fb-3724-42b2-b71e-692a93329514"/>
							<gml:surfaceMember xlink:href="#poly-55091c27-dd3c-4a39-96be-09229a9d958e"/>
							<gml:surfaceMember xlink:href="#poly-221ca299-181b-4c1d-9480-cc0d969f3679"/>
							<gml:surfaceMember xlink:href="#poly-c10e831d-0427-4ab8-9484-c8419f316b55"/>
							<gml:surfaceMember xlink:href="#poly-d2710a2b-87ad-4cc2-a330-e10ac46b77e7"/>
							<gml:surfaceMember xlink:href="#poly-b671a872-de7b-42f5-b036-3135aa985d0b"/>
							<gml:surfaceMember xlink:href="#poly-e5162591-0fc7-45c4-b53b-20b0654d9a20"/>
							<gml:surfaceMember xlink:href="#poly-977c46e7-a214-4726-b6f3-847a49d60ec1"/>
							<gml:surfaceMember xlink:href="#poly-07cc9246-d08c-434c-ae89-fac475e7a129"/>
							<gml:surfaceMember xlink:href="#poly-606d1c21-59e9-412c-9aef-44e2230258f3"/>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod2Solid>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-0033fde9-d8ac-42d3-b6a1-f230122b236b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0033fde9-d8ac-42d3-b6a1-f230122b236b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0033fde9-d8ac-42d3-b6a1-f230122b236b">
											<gml:posList>35.68117102323659 139.7664498657634 3.48 35.68138230283991 139.76652760942204 3.48 35.681378101533454 139.76654220703796 3.48 35.681822907072316 139.76671519902655 3.48 35.68194317169561 139.7667706587222 3.48 35.68194594549044 139.76674996378486 3.48 35.68198933185681 139.7667723328026 3.48 35.68199450616436 139.76675681730651 3.48 35.68221350435228 139.76687277082544 3.48 35.68220387319541 139.7669136007703 3.48 35.68198259466042 139.76683042804945 3.48 35.68174357884889 139.76673417884777 3.48 35.68026226739385 139.76617118553654 3.48 35.68019320091424 139.76614898247018 3.48 35.680200120951994 139.766112210207 3.48 35.68022465957402 139.76611808905443 3.48 35.68023001644869 139.76609068646678 3.48 35.680203252003324 139.7660696853095 3.48 35.68048852775555 139.76615148577713 3.48 35.68049261443902 139.7661415505095 3.48 35.68061636934651 139.76618386982085 3.48 35.68089672100534 139.76629353756178 3.48 35.68088354342489 139.7663591719767 3.48 35.681166805317055 139.76646699329308 3.48 35.68117102323659 139.7664498657634 3.48</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-03616a2a-fdc9-4cb3-81f3-3a88498cc52b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-03616a2a-fdc9-4cb3-81f3-3a88498cc52b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-03616a2a-fdc9-4cb3-81f3-3a88498cc52b">
											<gml:posList>35.68088354342489 139.7663591719767 13.1 35.68088537715802 139.76635006713178 13.1 35.680601312127976 139.76624081108085 13.1 35.680479627201365 139.7662089299881 13.1 35.680332266993 139.7661695139242 13.1 35.68026226739385 139.76617118553654 13.1 35.68174357884889 139.76673417884777 13.1 35.681822907072316 139.76671519902655 13.1 35.681378101533454 139.76654220703796 13.1 35.68138230283991 139.76652760942204 13.1 35.68117102323659 139.7664498657634 13.1 35.681166805317055 139.76646699329308 13.1 35.68088354342489 139.7663591719767 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-80fcd88d-2dd0-4c40-8fd9-8e85ff7eff21">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-80fcd88d-2dd0-4c40-8fd9-8e85ff7eff21">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-80fcd88d-2dd0-4c40-8fd9-8e85ff7eff21">
											<gml:posList>35.680601312127976 139.76624081108085 16.646 35.68088537715802 139.76635006713178 16.646 35.68089672100534 139.76629353756178 16.646 35.68061636934651 139.76618386982085 16.646 35.680601312127976 139.76624081108085 16.646</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-5b8cea14-3082-4ea1-b7b7-c771cf6b23fc">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-5b8cea14-3082-4ea1-b7b7-c771cf6b23fc">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-5b8cea14-3082-4ea1-b7b7-c771cf6b23fc">
											<gml:posList>35.68194317169561 139.7667706587222 13.1 35.681822907072316 139.76671519902655 13.1 35.68174357884889 139.76673417884777 13.1 35.68198259466042 139.76683042804945 13.1 35.68198933185681 139.7667723328026 13.1 35.68194594549044 139.76674996378486 13.1 35.68194317169561 139.7667706587222 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-ef8d4ec5-7694-45d4-b228-13e97bd23e73">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ef8d4ec5-7694-45d4-b228-13e97bd23e73">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ef8d4ec5-7694-45d4-b228-13e97bd23e73">
											<gml:posList>35.68019320091424 139.76614898247018 13.1 35.68026226739385 139.76617118553654 13.1 35.680332266993 139.7661695139242 13.1 35.68023001644869 139.76609068646678 13.1 35.68022465957402 139.76611808905443 13.1 35.680200120951994 139.766112210207 13.1 35.68019320091424 139.76614898247018 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-e96e755d-d1d3-45e1-8d23-502af6b9b700">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e96e755d-d1d3-45e1-8d23-502af6b9b700">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e96e755d-d1d3-45e1-8d23-502af6b9b700">
											<gml:posList>35.680332266993 139.7661695139242 16.871 35.680479627201365 139.7662089299881 16.871 35.68048852775555 139.76615148577713 16.871 35.680203252003324 139.7660696853095 16.871 35.680332266993 139.7661695139242 16.871</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-e14dffde-5929-4f0b-b3f8-b9cdd4c3bc31">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e14dffde-5929-4f0b-b3f8-b9cdd4c3bc31">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e14dffde-5929-4f0b-b3f8-b9cdd4c3bc31">
											<gml:posList>35.68198933185681 139.7667723328026 13.1 35.68198259466042 139.76683042804945 13.1 35.68220387319541 139.7669136007703 13.1 35.68221350435228 139.76687277082544 13.1 35.68199450616436 139.76675681730651 13.1 35.68198933185681 139.7667723328026 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-2dd153e9-232a-404d-8909-a49c1a703c1a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-2dd153e9-232a-404d-8909-a49c1a703c1a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-2dd153e9-232a-404d-8909-a49c1a703c1a">
											<gml:posList>35.68049261443902 139.7661415505095 13.1 35.68048852775555 139.76615148577713 13.1 35.680479627201365 139.7662089299881 13.1 35.680601312127976 139.76624081108085 13.1 35.68061636934651 139.76618386982085 13.1 35.68049261443902 139.7661415505095 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-606d1c21-59e9-412c-9aef-44e2230258f3">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-606d1c21-59e9-412c-9aef-44e2230258f3">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-606d1c21-59e9-412c-9aef-44e2230258f3">
											<gml:posList>35.68221350435228 139.76687277082544 13.1 35.68220387319541 139.7669136007703 13.1 35.68220387319541 139.7669136007703 3.48 35.68221350435228 139.76687277082544 3.48 35.68221350435228 139.76687277082544 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-996692fb-3724-42b2-b71e-692a93329514">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-996692fb-3724-42b2-b71e-692a93329514">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-996692fb-3724-42b2-b71e-692a93329514">
											<gml:posList>35.68088354342489 139.7663591719767 13.1 35.681166805317055 139.76646699329308 13.1 35.681166805317055 139.76646699329308 3.48 35.68088354342489 139.7663591719767 3.48 35.68088354342489 139.7663591719767 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-0400e9f9-952b-437a-b671-058121223520">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0400e9f9-952b-437a-b671-058121223520">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0400e9f9-952b-437a-b671-058121223520">
											<gml:posList>35.680332266993 139.7661695139242 16.871 35.680332266993 139.7661695139242 13.1 35.680479627201365 139.7662089299881 13.1 35.680479627201365 139.7662089299881 16.871 35.680332266993 139.7661695139242 16.871</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-b021b565-924c-4a93-8a28-7a94a905bef2">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b021b565-924c-4a93-8a28-7a94a905bef2">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b021b565-924c-4a93-8a28-7a94a905bef2">
											<gml:posList>35.68089672100534 139.76629353756178 16.646 35.68089672100534 139.76629353756178 3.48 35.68061636934651 139.76618386982085 3.48 35.68061636934651 139.76618386982085 13.1 35.68061636934651 139.76618386982085 16.646 35.68089672100534 139.76629353756178 16.646</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-60da0cc1-ea10-4e25-8ffb-0b3e91f94bc2">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-60da0cc1-ea10-4e25-8ffb-0b3e91f94bc2">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-60da0cc1-ea10-4e25-8ffb-0b3e91f94bc2">
											<gml:posList>35.680203252003324 139.7660696853095 16.871 35.68048852775555 139.76615148577713 16.871 35.68048852775555 139.76615148577713 13.1 35.68048852775555 139.76615148577713 3.48 35.680203252003324 139.7660696853095 3.48 35.680203252003324 139.7660696853095 16.871</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-189a3372-1689-49cb-9222-7363621dae68">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-189a3372-1689-49cb-9222-7363621dae68">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-189a3372-1689-49cb-9222-7363621dae68">
											<gml:posList>35.680601312127976 139.76624081108085 16.646 35.680601312127976 139.76624081108085 13.1 35.68088537715802 139.76635006713178 13.1 35.68088537715802 139.76635006713178 16.646 35.680601312127976 139.76624081108085 16.646</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-b09c1c9c-3950-4936-97c8-71871e002ecc">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b09c1c9c-3950-4936-97c8-71871e002ecc">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b09c1c9c-3950-4936-97c8-71871e002ecc">
											<gml:posList>35.68019320091424 139.76614898247018 13.1 35.680200120951994 139.766112210207 13.1 35.680200120951994 139.766112210207 3.48 35.68019320091424 139.76614898247018 3.48 35.68019320091424 139.76614898247018 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-9b06fdbe-4bf9-48e5-b749-33a2750d1db0">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-9b06fdbe-4bf9-48e5-b749-33a2750d1db0">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-9b06fdbe-4bf9-48e5-b749-33a2750d1db0">
											<gml:posList>35.68220387319541 139.7669136007703 13.1 35.68198259466042 139.76683042804945 13.1 35.68198259466042 139.76683042804945 3.48 35.68220387319541 139.7669136007703 3.48 35.68220387319541 139.7669136007703 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-1298c67a-224e-4a03-94a6-c9f3dd693954">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-1298c67a-224e-4a03-94a6-c9f3dd693954">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-1298c67a-224e-4a03-94a6-c9f3dd693954">
											<gml:posList>35.68194317169561 139.7667706587222 13.1 35.68194594549044 139.76674996378486 13.1 35.68194594549044 139.76674996378486 3.48 35.68194317169561 139.7667706587222 3.48 35.68194317169561 139.7667706587222 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-b671a872-de7b-42f5-b036-3135aa985d0b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b671a872-de7b-42f5-b036-3135aa985d0b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b671a872-de7b-42f5-b036-3135aa985d0b">
											<gml:posList>35.681822907072316 139.76671519902655 13.1 35.68194317169561 139.7667706587222 13.1 35.68194317169561 139.7667706587222 3.48 35.681822907072316 139.76671519902655 3.48 35.681822907072316 139.76671519902655 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ed34346d-55b7-41d5-8b61-de8d74061626">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ed34346d-55b7-41d5-8b61-de8d74061626">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ed34346d-55b7-41d5-8b61-de8d74061626">
											<gml:posList>35.68026226739385 139.76617118553654 13.1 35.68019320091424 139.76614898247018 13.1 35.68019320091424 139.76614898247018 3.48 35.68026226739385 139.76617118553654 3.48 35.68026226739385 139.76617118553654 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-47fcf6a2-4986-4d2d-ae65-1731d9274e75">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-47fcf6a2-4986-4d2d-ae65-1731d9274e75">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-47fcf6a2-4986-4d2d-ae65-1731d9274e75">
											<gml:posList>35.68049261443902 139.7661415505095 13.1 35.68061636934651 139.76618386982085 13.1 35.68061636934651 139.76618386982085 3.48 35.68049261443902 139.7661415505095 3.48 35.68049261443902 139.7661415505095 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-31588d34-662d-45a8-a81f-15d82ed112ac">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-31588d34-662d-45a8-a81f-15d82ed112ac">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-31588d34-662d-45a8-a81f-15d82ed112ac">
											<gml:posList>35.68174357884889 139.76673417884777 13.1 35.68026226739385 139.76617118553654 13.1 35.68026226739385 139.76617118553654 3.48 35.68174357884889 139.76673417884777 3.48 35.68174357884889 139.76673417884777 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-e5162591-0fc7-45c4-b53b-20b0654d9a20">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e5162591-0fc7-45c4-b53b-20b0654d9a20">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e5162591-0fc7-45c4-b53b-20b0654d9a20">
											<gml:posList>35.68194594549044 139.76674996378486 13.1 35.68198933185681 139.7667723328026 13.1 35.68198933185681 139.7667723328026 3.48 35.68194594549044 139.76674996378486 3.48 35.68194594549044 139.76674996378486 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-977c46e7-a214-4726-b6f3-847a49d60ec1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-977c46e7-a214-4726-b6f3-847a49d60ec1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-977c46e7-a214-4726-b6f3-847a49d60ec1">
											<gml:posList>35.68198933185681 139.7667723328026 13.1 35.68199450616436 139.76675681730651 13.1 35.68199450616436 139.76675681730651 3.48 35.68198933185681 139.7667723328026 3.48 35.68198933185681 139.7667723328026 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-a1cec9c0-c6f5-49de-ac1e-7a9755a465c5">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a1cec9c0-c6f5-49de-ac1e-7a9755a465c5">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a1cec9c0-c6f5-49de-ac1e-7a9755a465c5">
											<gml:posList>35.68089672100534 139.76629353756178 3.48 35.68089672100534 139.76629353756178 16.646 35.68088537715802 139.76635006713178 16.646 35.68088537715802 139.76635006713178 13.1 35.68088354342489 139.7663591719767 13.1 35.68088354342489 139.7663591719767 3.48 35.68089672100534 139.76629353756178 3.48</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-d2710a2b-87ad-4cc2-a330-e10ac46b77e7">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d2710a2b-87ad-4cc2-a330-e10ac46b77e7">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d2710a2b-87ad-4cc2-a330-e10ac46b77e7">
											<gml:posList>35.681378101533454 139.76654220703796 13.1 35.681822907072316 139.76671519902655 13.1 35.681822907072316 139.76671519902655 3.48 35.681378101533454 139.76654220703796 3.48 35.681378101533454 139.76654220703796 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-221ca299-181b-4c1d-9480-cc0d969f3679">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-221ca299-181b-4c1d-9480-cc0d969f3679">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-221ca299-181b-4c1d-9480-cc0d969f3679">
											<gml:posList>35.68117102323659 139.7664498657634 13.1 35.68138230283991 139.76652760942204 13.1 35.68138230283991 139.76652760942204 3.48 35.68117102323659 139.7664498657634 3.48 35.68117102323659 139.7664498657634 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-07cc9246-d08c-434c-ae89-fac475e7a129">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-07cc9246-d08c-434c-ae89-fac475e7a129">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-07cc9246-d08c-434c-ae89-fac475e7a129">
											<gml:posList>35.68199450616436 139.76675681730651 13.1 35.68221350435228 139.76687277082544 13.1 35.68221350435228 139.76687277082544 3.48 35.68199450616436 139.76675681730651 3.48 35.68199450616436 139.76675681730651 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-3bd8480c-b6d5-44e8-93e9-56d8451a6c06">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-3bd8480c-b6d5-44e8-93e9-56d8451a6c06">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-3bd8480c-b6d5-44e8-93e9-56d8451a6c06">
											<gml:posList>35.68022465957402 139.76611808905443 13.1 35.68023001644869 139.76609068646678 13.1 35.68023001644869 139.76609068646678 3.48 35.68022465957402 139.76611808905443 3.48 35.68022465957402 139.76611808905443 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-a227914d-dcf7-4735-9dae-774229c797e9">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a227914d-dcf7-4735-9dae-774229c797e9">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a227914d-dcf7-4735-9dae-774229c797e9">
											<gml:posList>35.680332266993 139.7661695139242 13.1 35.680332266993 139.7661695139242 16.871 35.680203252003324 139.7660696853095 16.871 35.68023001644869 139.76609068646678 13.1 35.680332266993 139.7661695139242 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-c10e831d-0427-4ab8-9484-c8419f316b55">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c10e831d-0427-4ab8-9484-c8419f316b55">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c10e831d-0427-4ab8-9484-c8419f316b55">
											<gml:posList>35.68138230283991 139.76652760942204 13.1 35.681378101533454 139.76654220703796 13.1 35.681378101533454 139.76654220703796 3.48 35.68138230283991 139.76652760942204 3.48 35.68138230283991 139.76652760942204 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ed2c6134-8e13-4eec-bdfc-617404350382">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ed2c6134-8e13-4eec-bdfc-617404350382">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ed2c6134-8e13-4eec-bdfc-617404350382">
											<gml:posList>35.680200120951994 139.766112210207 13.1 35.68022465957402 139.76611808905443 13.1 35.68022465957402 139.76611808905443 3.48 35.680200120951994 139.766112210207 3.48 35.680200120951994 139.766112210207 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-6b94f4ec-351a-481e-8a81-153efad2761a">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-6b94f4ec-351a-481e-8a81-153efad2761a">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-6b94f4ec-351a-481e-8a81-153efad2761a">
											<gml:posList>35.68061636934651 139.76618386982085 16.646 35.68061636934651 139.76618386982085 13.1 35.680601312127976 139.76624081108085 13.1 35.680601312127976 139.76624081108085 16.646 35.68061636934651 139.76618386982085 16.646</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-9e37bee0-553f-4597-8a42-286c7976825c">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-9e37bee0-553f-4597-8a42-286c7976825c">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-9e37bee0-553f-4597-8a42-286c7976825c">
											<gml:posList>35.68023001644869 139.76609068646678 3.48 35.68023001644869 139.76609068646678 13.1 35.680203252003324 139.7660696853095 16.871 35.680203252003324 139.7660696853095 3.48 35.68023001644869 139.76609068646678 3.48</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-696ce487-377b-4799-9f6d-c87023fb8524">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-696ce487-377b-4799-9f6d-c87023fb8524">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-696ce487-377b-4799-9f6d-c87023fb8524">
											<gml:posList>35.68048852775555 139.76615148577713 13.1 35.68049261443902 139.7661415505095 13.1 35.68049261443902 139.7661415505095 3.48 35.68048852775555 139.76615148577713 3.48 35.68048852775555 139.76615148577713 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-c0b2b90f-810f-40c8-bcd0-e29a7fd154b9">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c0b2b90f-810f-40c8-bcd0-e29a7fd154b9">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c0b2b90f-810f-40c8-bcd0-e29a7fd154b9">
											<gml:posList>35.68198259466042 139.76683042804945 13.1 35.68174357884889 139.76673417884777 13.1 35.68174357884889 139.76673417884777 3.48 35.68198259466042 139.76683042804945 3.48 35.68198259466042 139.76683042804945 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-07787edf-971c-4234-ad12-e3f703a92cf0">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-07787edf-971c-4234-ad12-e3f703a92cf0">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-07787edf-971c-4234-ad12-e3f703a92cf0">
											<gml:posList>35.680479627201365 139.7662089299881 16.871 35.680479627201365 139.7662089299881 13.1 35.68048852775555 139.76615148577713 13.1 35.68048852775555 139.76615148577713 16.871 35.680479627201365 139.7662089299881 16.871</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-55091c27-dd3c-4a39-96be-09229a9d958e">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-55091c27-dd3c-4a39-96be-09229a9d958e">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-55091c27-dd3c-4a39-96be-09229a9d958e">
											<gml:posList>35.681166805317055 139.76646699329308 13.1 35.68117102323659 139.7664498657634 13.1 35.68117102323659 139.7664498657634 3.48 35.681166805317055 139.76646699329308 3.48 35.681166805317055 139.76646699329308 13.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:address>
				<core:Address>
					<core:xalAddress>
						<xAL:AddressDetails>
							<xAL:Country>
								<xAL:CountryName>日本</xAL:CountryName>
								<xAL:Locality>
									<xAL:LocalityName Type="Town">東京都千代田区丸の内一丁目</xAL:LocalityName>
								</xAL:Locality>
							</xAL:Country>
						</xAL:AddressDetails>
					</core:xalAddress>
				</core:Address>
			</bldg:address>
			<uro:bldgDataQualityAttribute>
				<uro:DataQualityAttribute>
					<uro:geometrySrcDescLod0 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod0>
					<uro:geometrySrcDescLod1 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod1>
					<uro:geometrySrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod2>
					<uro:geometrySrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">999</uro:geometrySrcDescLod3>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">201</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">000</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">023</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">400</uro:thematicSrcDesc>
					<uro:appearanceSrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">1</uro:appearanceSrcDescLod2>
					<uro:appearanceSrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">99</uro:appearanceSrcDescLod3>
					<uro:lodType codeSpace="../../codelists/Building_lodType.xml">2.2</uro:lodType>
					<uro:lod1HeightType codeSpace="../../codelists/DataQualityAttribute_lod1HeightType.xml">2</uro:lod1HeightType>
					<uro:publicSurveyDataQualityAttribute>
						<uro:PublicSurveyDataQualityAttribute>
							<uro:srcScaleLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod0>
							<uro:srcScaleLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod1>
							<uro:srcScaleLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod2>
							<uro:publicSurveySrcDescLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod0>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod2>
						</uro:PublicSurveyDataQualityAttribute>
					</uro:publicSurveyDataQualityAttribute>
				</uro:DataQualityAttribute>
			</uro:bldgDataQualityAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">10</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.14</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">31</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.153</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">8</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.153</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:HighTideRiskAttribute>
					<uro:description codeSpace="../../codelists/HighTideRiskAttribute_description.xml">2</uro:description>
					<uro:rank codeSpace="../../codelists/HighTideRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.19</uro:depth>
				</uro:HighTideRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">100</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key100.xml">11</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">101</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key101.xml">1</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">102</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key102.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">103</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key103.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">104</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key104.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">105</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key105.xml">9</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">106</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key106.xml">10</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:buildingDetailAttribute>
				<uro:BuildingDetailAttribute>
					<uro:buildingRoofEdgeArea uom="m2">1520.23095</uro:buildingRoofEdgeArea>
					<uro:fireproofStructureType codeSpace="../../codelists/BuildingDetailAttribute_fireproofStructureType.xml">1001</uro:fireproofStructureType>
					<uro:urbanPlanType codeSpace="../../codelists/Common_urbanPlanType.xml">21</uro:urbanPlanType>
					<uro:areaClassificationType codeSpace="../../codelists/Common_areaClassificationType.xml">22</uro:areaClassificationType>
					<uro:districtsAndZonesType codeSpace="../../codelists/Common_districtsAndZonesType.xml">10</uro:districtsAndZonesType>
					<uro:landUseType codeSpace="../../codelists/Common_landUseType.xml">216</uro:landUseType>
					<uro:detailedUsage codeSpace="../../codelists/BuildingDetailAttribute_detailedUsage.xml">1431</uro:detailedUsage>
					<uro:specifiedBuildingCoverageRate>80</uro:specifiedBuildingCoverageRate>
					<uro:specifiedFloorAreaRate>900</uro:specifiedFloorAreaRate>
					<uro:surveyYear>2021</uro:surveyYear>
				</uro:BuildingDetailAttribute>
			</uro:buildingDetailAttribute>
			<uro:buildingIDAttribute>
				<uro:BuildingIDAttribute>
					<uro:buildingID>13101-bldg-1258</uro:buildingID>
					<uro:prefecture codeSpace="../../codelists/Common_localPublicAuthorities.xml">13</uro:prefecture>
					<uro:city codeSpace="../../codelists/Common_localPublicAuthorities.xml">13101</uro:city>
				</uro:BuildingIDAttribute>
			</uro:buildingIDAttribute>
		</bldg:Building>
	</core:cityObjectMember>
	<core:cityObjectMember>
		<bldg:Building gml:id="bldg_c73515a2-f903-442b-ae10-c2c6aa5a6a38">
			<gml:name>東京駅</gml:name>
			<core:creationDate>2024-03-15</core:creationDate>
			<gen:stringAttribute name="延べ面積換算係数">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="説明注記">
				<gen:value> </gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="大字・町コード">
				<gen:value>55</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="町・丁目コード">
				<gen:value>1</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="13+区市町村コード+大字・町コード+町・丁目コード">
				<gen:value>13101055001</gen:value>
			</gen:stringAttribute>
			<gen:stringAttribute name="地区計画">
				<gen:value>大手町・丸の内・有楽町地区</gen:value>
			</gen:stringAttribute>
			<bldg:class codeSpace="../../codelists/Building_class.xml">3003</bldg:class>
			<bldg:usage codeSpace="../../codelists/Building_usage.xml">431</bldg:usage>
			<bldg:measuredHeight uom="m">10.6</bldg:measuredHeight>
			<bldg:storeysAboveGround>2</bldg:storeysAboveGround>
			<bldg:storeysBelowGround>0</bldg:storeysBelowGround>
			<bldg:lod0RoofEdge>
				<gml:MultiSurface>
					<gml:surfaceMember>
						<gml:Polygon>
							<gml:exterior>
								<gml:LinearRing>
									<gml:posList>35.681918393936904 139.76687026463765 0 35.68192050856669 139.76686375569906 0 35.68031194560935 139.76625851961583 0 35.680310880885344 139.7662727167117 0 35.68030148580832 139.76626771999676 0 35.68026997077499 139.76639176700095 0 35.680279571554635 139.76639549307973 0 35.68027576657668 139.76640794693134 0 35.68226935713172 139.76715785976467 0 35.682280591566176 139.76711476367117 0 35.68227646064336 139.7671099612474 0 35.682282434413914 139.76708771688433 0 35.682287157748554 139.7670896242672 0 35.68230189108863 139.76703307996056 0 35.681918393936904 139.76687026463765 0</gml:posList>
								</gml:LinearRing>
							</gml:exterior>
						</gml:Polygon>
					</gml:surfaceMember>
				</gml:MultiSurface>
			</bldg:lod0RoofEdge>
			<bldg:lod1Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681918393936904 139.76687026463765 3.5 35.68230189108863 139.76703307996056 3.5 35.682287157748554 139.7670896242672 3.5 35.682282434413914 139.76708771688433 3.5 35.68227646064336 139.7671099612474 3.5 35.682280591566176 139.76711476367117 3.5 35.68226935713172 139.76715785976467 3.5 35.68027576657668 139.76640794693134 3.5 35.680279571554635 139.76639549307973 3.5 35.68026997077499 139.76639176700095 3.5 35.68030148580832 139.76626771999676 3.5 35.680310880885344 139.7662727167117 3.5 35.68031194560935 139.76625851961583 3.5 35.68192050856669 139.76686375569906 3.5 35.681918393936904 139.76687026463765 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681918393936904 139.76687026463765 3.5 35.68192050856669 139.76686375569906 3.5 35.68192050856669 139.76686375569906 14.1 35.681918393936904 139.76687026463765 14.1 35.681918393936904 139.76687026463765 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68192050856669 139.76686375569906 3.5 35.68031194560935 139.76625851961583 3.5 35.68031194560935 139.76625851961583 14.1 35.68192050856669 139.76686375569906 14.1 35.68192050856669 139.76686375569906 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68031194560935 139.76625851961583 3.5 35.680310880885344 139.7662727167117 3.5 35.680310880885344 139.7662727167117 14.1 35.68031194560935 139.76625851961583 14.1 35.68031194560935 139.76625851961583 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680310880885344 139.7662727167117 3.5 35.68030148580832 139.76626771999676 3.5 35.68030148580832 139.76626771999676 14.1 35.680310880885344 139.7662727167117 14.1 35.680310880885344 139.7662727167117 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68030148580832 139.76626771999676 3.5 35.68026997077499 139.76639176700095 3.5 35.68026997077499 139.76639176700095 14.1 35.68030148580832 139.76626771999676 14.1 35.68030148580832 139.76626771999676 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68026997077499 139.76639176700095 3.5 35.680279571554635 139.76639549307973 3.5 35.680279571554635 139.76639549307973 14.1 35.68026997077499 139.76639176700095 14.1 35.68026997077499 139.76639176700095 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680279571554635 139.76639549307973 3.5 35.68027576657668 139.76640794693134 3.5 35.68027576657668 139.76640794693134 14.1 35.680279571554635 139.76639549307973 14.1 35.680279571554635 139.76639549307973 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68027576657668 139.76640794693134 3.5 35.68226935713172 139.76715785976467 3.5 35.68226935713172 139.76715785976467 14.1 35.68027576657668 139.76640794693134 14.1 35.68027576657668 139.76640794693134 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68226935713172 139.76715785976467 3.5 35.682280591566176 139.76711476367117 3.5 35.682280591566176 139.76711476367117 14.1 35.68226935713172 139.76715785976467 14.1 35.68226935713172 139.76715785976467 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682280591566176 139.76711476367117 3.5 35.68227646064336 139.7671099612474 3.5 35.68227646064336 139.7671099612474 14.1 35.682280591566176 139.76711476367117 14.1 35.682280591566176 139.76711476367117 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68227646064336 139.7671099612474 3.5 35.682282434413914 139.76708771688433 3.5 35.682282434413914 139.76708771688433 14.1 35.68227646064336 139.7671099612474 14.1 35.68227646064336 139.7671099612474 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682282434413914 139.76708771688433 3.5 35.682287157748554 139.7670896242672 3.5 35.682287157748554 139.7670896242672 14.1 35.682282434413914 139.76708771688433 14.1 35.682282434413914 139.76708771688433 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.682287157748554 139.7670896242672 3.5 35.68230189108863 139.76703307996056 3.5 35.68230189108863 139.76703307996056 14.1 35.682287157748554 139.7670896242672 14.1 35.682287157748554 139.7670896242672 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68230189108863 139.76703307996056 3.5 35.681918393936904 139.76687026463765 3.5 35.681918393936904 139.76687026463765 14.1 35.68230189108863 139.76703307996056 14.1 35.68230189108863 139.76703307996056 3.5</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon>
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681918393936904 139.76687026463765 14.1 35.68192050856669 139.76686375569906 14.1 35.68031194560935 139.76625851961583 14.1 35.680310880885344 139.7662727167117 14.1 35.68030148580832 139.76626771999676 14.1 35.68026997077499 139.76639176700095 14.1 35.680279571554635 139.76639549307973 14.1 35.68027576657668 139.76640794693134 14.1 35.68226935713172 139.76715785976467 14.1 35.682280591566176 139.76711476367117 14.1 35.68227646064336 139.7671099612474 14.1 35.682282434413914 139.76708771688433 14.1 35.682287157748554 139.7670896242672 14.1 35.68230189108863 139.76703307996056 14.1 35.681918393936904 139.76687026463765 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod1Solid>
			<bldg:lod2Solid>
				<gml:Solid>
					<gml:exterior>
						<gml:CompositeSurface>
							<gml:surfaceMember xlink:href="#poly-ba1f3416-c694-47d9-b769-256f58120040"/>
							<gml:surfaceMember xlink:href="#poly-c565dc4c-7a8b-4c1a-b9c4-913f732a507c"/>
							<gml:surfaceMember xlink:href="#poly-bafa97a8-7c6f-4a28-a138-3a99d3582139"/>
							<gml:surfaceMember xlink:href="#poly-782737c4-9b75-4055-b15f-37c9fe435379"/>
							<gml:surfaceMember xlink:href="#poly-f4318873-92a5-4a80-9eee-d8cd0f8015b1"/>
							<gml:surfaceMember xlink:href="#poly-ebcd3358-171b-4886-96a2-bfc6acb77d90"/>
							<gml:surfaceMember xlink:href="#poly-5f75a4e6-e965-48e7-b365-fe21c64fcb08"/>
							<gml:surfaceMember xlink:href="#poly-6c45325e-ccc3-4b41-a695-937dc96e77fa"/>
							<gml:surfaceMember xlink:href="#poly-e2d23e94-b19b-49e8-bc52-dab12f537d55"/>
							<gml:surfaceMember xlink:href="#poly-e44110dd-cd1d-4ced-8f63-842caa128a91"/>
							<gml:surfaceMember xlink:href="#poly-587fe328-0eec-4ece-86f3-64963df35c67"/>
							<gml:surfaceMember xlink:href="#poly-028bba40-cd13-47cd-89e9-b1f4555b5376"/>
							<gml:surfaceMember xlink:href="#poly-73967737-1a9b-4652-bed1-110847430333"/>
							<gml:surfaceMember xlink:href="#poly-ef0f59a3-6b4a-4fbf-973e-6ced470e879d"/>
							<gml:surfaceMember xlink:href="#poly-365fd284-4532-4ae3-9192-d42766ded31d"/>
							<gml:surfaceMember xlink:href="#poly-d994b9a2-c655-4a8e-9f17-b33868c67901"/>
							<gml:surfaceMember xlink:href="#poly-b1f8f7f5-e4f9-400a-8a0b-17d642aa3ca1"/>
							<gml:surfaceMember xlink:href="#poly-a6609a80-f1cd-4831-a124-9a64bd742626"/>
							<gml:surfaceMember xlink:href="#poly-0b9e649a-833c-415a-b562-25af628c8c24"/>
							<gml:surfaceMember xlink:href="#poly-22cbabdc-8cda-4fb7-bb8d-be69dc993c5f"/>
							<gml:surfaceMember xlink:href="#poly-c8376e7b-09ee-49a8-a434-faab3d5ce50c"/>
							<gml:surfaceMember xlink:href="#poly-42ae6d1f-d09c-4a5c-a3cf-76d9ee07dc27"/>
							<gml:surfaceMember xlink:href="#poly-df5753a8-0c3f-4b49-bf59-c6385d9e62d9"/>
							<gml:surfaceMember xlink:href="#poly-e7db5fe1-b025-4dd7-92e9-54f8fe6bce72"/>
							<gml:surfaceMember xlink:href="#poly-ea4f9147-3c1c-46ce-995a-a0a8934a97be"/>
							<gml:surfaceMember xlink:href="#poly-c6abe919-4d83-4851-90c4-615816b6795b"/>
							<gml:surfaceMember xlink:href="#poly-9f884b75-44cf-46b7-8fff-d81bacfd8a19"/>
						</gml:CompositeSurface>
					</gml:exterior>
				</gml:Solid>
			</bldg:lod2Solid>
			<bldg:outerBuildingInstallation>
				<bldg:BuildingInstallation gml:id="bldg_c73515a2-f903-442b-ae10-c2c6aa5a6a38_BuildingInstallation_1070">
					<bldg:lod2Geometry>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-02a70951-3fe1-4511-8554-c51e9f251155">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.680923678597075 139.7665811643598 14.274 35.680919802365246 139.7665968221992 14.274 35.68090562987561 139.76659154214624 14.274 35.68090951512047 139.76657588430186 14.274 35.680923678597075 139.7665811643598 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-d0748191-ce14-42f1-965d-df1146274136">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.6809282850299 139.76654942043706 14.274 35.68092477753733 139.7665635865302 14.274 35.68091443667064 139.76655973949318 14.274 35.68091795317035 139.7665455623465 14.274 35.6809282850299 139.76654942043706 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-84346705-dea0-497f-bc38-a4556fc24022">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.681732560719034 139.76689122180557 14.1 35.6817229769793 139.76688730777295 14.1 35.681728293295286 139.76686775976177 14.1 35.68173787703563 139.76687167379228 14.1 35.681732560719034 139.76689122180557 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-2bc108f0-7c84-4466-9884-ee4e00b98bf9">
									<gml:exterior>
										<gml:LinearRing>
											<gml:posList>35.68173349383897 139.76691608968906 14.1 35.681738360376286 139.76689817712847 14.1 35.681747781832264 139.76690202501064 14.1 35.681742915294386 139.7669199375731 14.1 35.68173349383897 139.76691608968906 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-717cdb8f-83a1-4c5b-acce-765fb5de9e32">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-717cdb8f-83a1-4c5b-acce-765fb5de9e32_0">
											<gml:posList>35.68090951512047 139.76657588430186 14.274 35.68090562987561 139.76659154214624 14.274 35.68090562987561 139.76659154214624 15.55 35.68090951512047 139.76657588430186 15.55 35.68090951512047 139.76657588430186 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-44c150c7-d38d-4d69-b6ef-d63be38826c6">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-44c150c7-d38d-4d69-b6ef-d63be38826c6_0">
											<gml:posList>35.68090562987561 139.76659154214624 14.274 35.680919802365246 139.7665968221992 14.274 35.680919802365246 139.7665968221992 15.55 35.68090562987561 139.76659154214624 15.55 35.68090562987561 139.76659154214624 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-e9746bb1-f102-4d75-af82-055223988b8f">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-e9746bb1-f102-4d75-af82-055223988b8f_0">
											<gml:posList>35.680923678597075 139.7665811643598 15.55 35.68090951512047 139.76657588430186 15.55 35.68090562987561 139.76659154214624 15.55 35.680919802365246 139.7665968221992 15.55 35.680923678597075 139.7665811643598 15.55</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-edaa878d-925b-44ba-a0e3-9882044bd1ab">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-edaa878d-925b-44ba-a0e3-9882044bd1ab_0">
											<gml:posList>35.68091795317035 139.7665455623465 14.274 35.68091443667064 139.76655973949318 14.274 35.68091443667064 139.76655973949318 15.55 35.68091795317035 139.7665455623465 15.55 35.68091795317035 139.7665455623465 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-327c4909-3ba8-4f19-80de-ab18bf6c4b61">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-327c4909-3ba8-4f19-80de-ab18bf6c4b61_0">
											<gml:posList>35.680923678597075 139.7665811643598 14.274 35.68090951512047 139.76657588430186 14.274 35.68090951512047 139.76657588430186 15.55 35.680923678597075 139.7665811643598 15.55 35.680923678597075 139.7665811643598 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-370adbd6-5c6c-4ffc-bcf4-b1f9d96554ec">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-370adbd6-5c6c-4ffc-bcf4-b1f9d96554ec_0">
											<gml:posList>35.68091443667064 139.76655973949318 14.274 35.68092477753733 139.7665635865302 14.274 35.68092477753733 139.7665635865302 15.55 35.68091443667064 139.76655973949318 15.55 35.68091443667064 139.76655973949318 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-419b1a93-fb53-4bd6-8a5d-fd4a636d25e4">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-419b1a93-fb53-4bd6-8a5d-fd4a636d25e4_0">
											<gml:posList>35.6809282850299 139.76654942043706 15.55 35.68091795317035 139.7665455623465 15.55 35.68091443667064 139.76655973949318 15.55 35.68092477753733 139.7665635865302 15.55 35.6809282850299 139.76654942043706 15.55</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-59dffea3-657a-42e5-a679-3cae1da96b75">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-59dffea3-657a-42e5-a679-3cae1da96b75_0">
											<gml:posList>35.680919802365246 139.7665968221992 14.274 35.680923678597075 139.7665811643598 14.274 35.680923678597075 139.7665811643598 15.55 35.680919802365246 139.7665968221992 15.55 35.680919802365246 139.7665968221992 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-a752842e-f288-48c4-9d80-78044293568d">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-a752842e-f288-48c4-9d80-78044293568d_0">
											<gml:posList>35.68091795317035 139.7665455623465 14.274 35.68091795317035 139.7665455623465 15.55 35.6809282850299 139.76654942043706 15.55 35.6809282850299 139.76654942043706 14.274 35.68091795317035 139.7665455623465 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-682e0e17-5c60-4504-b2de-88208095557e">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-682e0e17-5c60-4504-b2de-88208095557e_0">
											<gml:posList>35.68092477753733 139.7665635865302 14.274 35.6809282850299 139.76654942043706 14.274 35.6809282850299 139.76654942043706 15.55 35.68092477753733 139.7665635865302 15.55 35.68092477753733 139.7665635865302 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-1c7c6489-3e79-472b-aec5-1dc684e8a647">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-1c7c6489-3e79-472b-aec5-1dc684e8a647_0">
											<gml:posList>35.681728293295286 139.76686775976177 14.1 35.6817229769793 139.76688730777295 14.1 35.6817229769793 139.76688730777295 15.845 35.681728293295286 139.76686775976177 15.845 35.681728293295286 139.76686775976177 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-4ff49423-d695-4dae-8f87-a8dd0027b3e5">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-4ff49423-d695-4dae-8f87-a8dd0027b3e5_0">
											<gml:posList>35.6817229769793 139.76688730777295 14.1 35.681732560719034 139.76689122180557 14.1 35.681732560719034 139.76689122180557 15.845 35.6817229769793 139.76688730777295 15.845 35.6817229769793 139.76688730777295 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-e190d8f5-57af-49d8-aab2-ec00fb7e429e">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-e190d8f5-57af-49d8-aab2-ec00fb7e429e_0">
											<gml:posList>35.681728293295286 139.76686775976177 15.845 35.6817229769793 139.76688730777295 15.845 35.681732560719034 139.76689122180557 15.845 35.68173787703563 139.76687167379228 15.845 35.681728293295286 139.76686775976177 15.845</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-af7d4506-67c4-4294-a41f-bec4c73f1597">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-af7d4506-67c4-4294-a41f-bec4c73f1597_0">
											<gml:posList>35.68173787703563 139.76687167379228 14.1 35.681728293295286 139.76686775976177 14.1 35.681728293295286 139.76686775976177 15.845 35.68173787703563 139.76687167379228 15.845 35.68173787703563 139.76687167379228 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-bfdfc888-2559-41d6-9fed-99d98ee9f774">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-bfdfc888-2559-41d6-9fed-99d98ee9f774_0">
											<gml:posList>35.68173787703563 139.76687167379228 14.1 35.68173787703563 139.76687167379228 15.845 35.681732560719034 139.76689122180557 15.845 35.681732560719034 139.76689122180557 14.1 35.68173787703563 139.76687167379228 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-7a52bff3-bba8-4409-bf26-d7c9644d2702">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-7a52bff3-bba8-4409-bf26-d7c9644d2702_0">
											<gml:posList>35.681738360376286 139.76689817712847 14.1 35.68173349383897 139.76691608968906 14.1 35.68173349383897 139.76691608968906 15.931 35.681738360376286 139.76689817712847 15.931 35.681738360376286 139.76689817712847 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-f35b66b0-7180-48b4-a3c8-a1156d440ce7">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-f35b66b0-7180-48b4-a3c8-a1156d440ce7_0">
											<gml:posList>35.68173349383897 139.76691608968906 14.1 35.681742915294386 139.7669199375731 14.1 35.681742915294386 139.7669199375731 15.931 35.68173349383897 139.76691608968906 15.931 35.68173349383897 139.76691608968906 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-954914b1-8f37-47bb-93cd-14f8b083f8f0">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-954914b1-8f37-47bb-93cd-14f8b083f8f0_0">
											<gml:posList>35.681747781832264 139.76690202501064 15.931 35.681738360376286 139.76689817712847 15.931 35.68173349383897 139.76691608968906 15.931 35.681742915294386 139.7669199375731 15.931 35.681747781832264 139.76690202501064 15.931</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-2f55d6dc-adcc-4065-8c20-149dfe750fea">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-2f55d6dc-adcc-4065-8c20-149dfe750fea_0">
											<gml:posList>35.681738360376286 139.76689817712847 14.1 35.681738360376286 139.76689817712847 15.931 35.681747781832264 139.76690202501064 15.931 35.681747781832264 139.76690202501064 14.1 35.681738360376286 139.76689817712847 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
							<gml:surfaceMember>
								<gml:Polygon gml:id="fme-gen-7d9c1f1f-4f20-4166-b893-0526bf2f80d7">
									<gml:exterior>
										<gml:LinearRing gml:id="fme-gen-7d9c1f1f-4f20-4166-b893-0526bf2f80d7_0">
											<gml:posList>35.681747781832264 139.76690202501064 14.1 35.681747781832264 139.76690202501064 15.931 35.681742915294386 139.7669199375731 15.931 35.681742915294386 139.7669199375731 14.1 35.681747781832264 139.76690202501064 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2Geometry>
				</bldg:BuildingInstallation>
			</bldg:outerBuildingInstallation>
			<bldg:boundedBy>
				<bldg:GroundSurface gml:id="surface-ba1f3416-c694-47d9-b769-256f58120040">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ba1f3416-c694-47d9-b769-256f58120040">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ba1f3416-c694-47d9-b769-256f58120040">
											<gml:posList>35.680310880885344 139.7662727167117 3.47 35.68031194560934 139.76625851961583 3.47 35.681920508566684 139.76686375569906 3.47 35.68191839393691 139.76687026463765 3.47 35.682301891088635 139.76703307996056 3.47 35.68228715774856 139.7670896242672 3.47 35.68228243351253 139.76708771688507 3.47 35.68227646064336 139.7671099612474 3.47 35.68228059156617 139.76711476367117 3.47 35.682269357131716 139.76715785976467 3.47 35.68027576657668 139.76640794693134 3.47 35.680279572456016 139.76639549307896 3.47 35.68026997077499 139.76639176700095 3.47 35.680301485808315 139.76626771999676 3.47 35.680310880885344 139.7662727167117 3.47</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:GroundSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-bafa97a8-7c6f-4a28-a138-3a99d3582139">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-bafa97a8-7c6f-4a28-a138-3a99d3582139">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-bafa97a8-7c6f-4a28-a138-3a99d3582139">
											<gml:posList>35.68116040404819 139.7667407065737 13.4 35.681590673065315 139.7669025640065 13.4 35.6816265902775 139.7667512786464 13.4 35.68119935777494 139.7665877843576 13.4 35.68116040404819 139.7667407065737 13.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-c565dc4c-7a8b-4c1a-b9c4-913f732a507c">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c565dc4c-7a8b-4c1a-b9c4-913f732a507c">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c565dc4c-7a8b-4c1a-b9c4-913f732a507c">
											<gml:posList>35.68116040404819 139.7667407065737 14.274 35.68119935777494 139.7665877843576 14.274 35.68031193659563 139.7662585196234 14.274 35.680310880885344 139.7662727167117 14.274 35.680301485808315 139.76626771999676 14.274 35.68026997077499 139.76639176700095 14.274 35.680279572456016 139.76639549307896 14.274 35.68027576657668 139.76640794693134 14.274 35.68116040404819 139.7667407065737 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-782737c4-9b75-4055-b15f-37c9fe435379">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-782737c4-9b75-4055-b15f-37c9fe435379">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-782737c4-9b75-4055-b15f-37c9fe435379">
											<gml:posList>35.681590673065315 139.7669025640065 14.1 35.68208706210251 139.7670892814584 14.1 35.68211980751323 139.7669557849583 14.1 35.68191839393691 139.76687026463765 14.1 35.681920508566684 139.76686375569906 14.1 35.6816265902775 139.7667512786464 14.1 35.681590673065315 139.7669025640065 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:RoofSurface gml:id="surface-f4318873-92a5-4a80-9eee-d8cd0f8015b1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-f4318873-92a5-4a80-9eee-d8cd0f8015b1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-f4318873-92a5-4a80-9eee-d8cd0f8015b1">
											<gml:posList>35.68208706210251 139.7670892814584 13.4 35.682269357131716 139.76715785976467 13.4 35.68228059156617 139.76711476367117 13.4 35.68227646064336 139.7671099612474 13.4 35.68228243351253 139.76708771688507 13.4 35.68228715774856 139.7670896242672 13.4 35.682301891088635 139.76703307996056 13.4 35.68211980751323 139.7669557849583 13.4 35.68208706210251 139.7670892814584 13.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:RoofSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-587fe328-0eec-4ece-86f3-64963df35c67">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-587fe328-0eec-4ece-86f3-64963df35c67">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-587fe328-0eec-4ece-86f3-64963df35c67">
											<gml:posList>35.68027576657668 139.76640794693134 14.274 35.680279572456016 139.76639549307896 14.274 35.680279572456016 139.76639549307896 3.47 35.68027576657668 139.76640794693134 3.47 35.68027576657668 139.76640794693134 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ea4f9147-3c1c-46ce-995a-a0a8934a97be">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ea4f9147-3c1c-46ce-995a-a0a8934a97be">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ea4f9147-3c1c-46ce-995a-a0a8934a97be">
											<gml:posList>35.68228243351253 139.76708771688507 13.4 35.68227646064336 139.7671099612474 13.4 35.68227646064336 139.7671099612474 3.47 35.68228243351253 139.76708771688507 3.47 35.68228243351253 139.76708771688507 13.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-df5753a8-0c3f-4b49-bf59-c6385d9e62d9">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-df5753a8-0c3f-4b49-bf59-c6385d9e62d9">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-df5753a8-0c3f-4b49-bf59-c6385d9e62d9">
											<gml:posList>35.68228059156617 139.76711476367117 13.4 35.682269357131716 139.76715785976467 13.4 35.682269357131716 139.76715785976467 3.47 35.68228059156617 139.76711476367117 3.47 35.68228059156617 139.76711476367117 13.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-d994b9a2-c655-4a8e-9f17-b33868c67901">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-d994b9a2-c655-4a8e-9f17-b33868c67901">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-d994b9a2-c655-4a8e-9f17-b33868c67901">
											<gml:posList>35.68116040404819 139.7667407065737 14.274 35.68116040404819 139.7667407065737 13.4 35.68119935777494 139.7665877843576 13.4 35.68119935777494 139.7665877843576 14.274 35.68116040404819 139.7667407065737 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ef0f59a3-6b4a-4fbf-973e-6ced470e879d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ef0f59a3-6b4a-4fbf-973e-6ced470e879d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ef0f59a3-6b4a-4fbf-973e-6ced470e879d">
											<gml:posList>35.680310880885344 139.7662727167117 14.274 35.68031193659563 139.7662585196234 14.274 35.68031194560934 139.76625851961583 3.47 35.680310880885344 139.7662727167117 3.47 35.680310880885344 139.7662727167117 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-42ae6d1f-d09c-4a5c-a3cf-76d9ee07dc27">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-42ae6d1f-d09c-4a5c-a3cf-76d9ee07dc27">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-42ae6d1f-d09c-4a5c-a3cf-76d9ee07dc27">
											<gml:posList>35.68191839393691 139.76687026463765 3.47 35.68191839393691 139.76687026463765 14.1 35.68211980751323 139.7669557849583 14.1 35.68211980751323 139.7669557849583 13.4 35.682301891088635 139.76703307996056 13.4 35.682301891088635 139.76703307996056 3.47 35.68191839393691 139.76687026463765 3.47</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-e2d23e94-b19b-49e8-bc52-dab12f537d55">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e2d23e94-b19b-49e8-bc52-dab12f537d55">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e2d23e94-b19b-49e8-bc52-dab12f537d55">
											<gml:posList>35.6816265902775 139.7667512786464 13.4 35.681920508566684 139.76686375569906 14.1 35.68031194560934 139.76625851961583 3.47 35.6816265902775 139.7667512786464 13.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-c6abe919-4d83-4851-90c4-615816b6795b">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c6abe919-4d83-4851-90c4-615816b6795b">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c6abe919-4d83-4851-90c4-615816b6795b">
											<gml:posList>35.68228715774856 139.7670896242672 13.4 35.68228243351253 139.76708771688507 13.4 35.68228243351253 139.76708771688507 3.47 35.68228715774856 139.7670896242672 3.47 35.68228715774856 139.7670896242672 13.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-e44110dd-cd1d-4ced-8f63-842caa128a91">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e44110dd-cd1d-4ced-8f63-842caa128a91">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e44110dd-cd1d-4ced-8f63-842caa128a91">
											<gml:posList>35.680279572456016 139.76639549307896 14.274 35.68026997077499 139.76639176700095 14.274 35.68026997077499 139.76639176700095 3.47 35.680279572456016 139.76639549307896 3.47 35.680279572456016 139.76639549307896 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-c8376e7b-09ee-49a8-a434-faab3d5ce50c">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-c8376e7b-09ee-49a8-a434-faab3d5ce50c">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-c8376e7b-09ee-49a8-a434-faab3d5ce50c">
											<gml:posList>35.68208706210251 139.7670892814584 14.1 35.68208706210251 139.7670892814584 13.4 35.68211980751323 139.7669557849583 13.4 35.68211980751323 139.7669557849583 14.1 35.68208706210251 139.7670892814584 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-b1f8f7f5-e4f9-400a-8a0b-17d642aa3ca1">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-b1f8f7f5-e4f9-400a-8a0b-17d642aa3ca1">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-b1f8f7f5-e4f9-400a-8a0b-17d642aa3ca1">
											<gml:posList>35.68208706210251 139.7670892814584 13.4 35.68208706210251 139.7670892814584 14.1 35.681590673065315 139.7669025640065 14.1 35.681590673065315 139.7669025640065 13.4 35.68116040404819 139.7667407065737 13.4 35.68116040404819 139.7667407065737 14.274 35.68027576657668 139.76640794693134 14.274 35.68027576657668 139.76640794693134 3.47 35.682269357131716 139.76715785976467 3.47 35.682269357131716 139.76715785976467 13.4 35.68208706210251 139.7670892814584 13.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-0b9e649a-833c-415a-b562-25af628c8c24">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-0b9e649a-833c-415a-b562-25af628c8c24">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-0b9e649a-833c-415a-b562-25af628c8c24">
											<gml:posList>35.6816265902775 139.7667512786464 13.4 35.6816265902775 139.7667512786464 14.1 35.681920508566684 139.76686375569906 14.1 35.6816265902775 139.7667512786464 13.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-9f884b75-44cf-46b7-8fff-d81bacfd8a19">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-9f884b75-44cf-46b7-8fff-d81bacfd8a19">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-9f884b75-44cf-46b7-8fff-d81bacfd8a19">
											<gml:posList>35.682301891088635 139.76703307996056 13.4 35.68228715774856 139.7670896242672 13.4 35.68228715774856 139.7670896242672 3.47 35.682301891088635 139.76703307996056 3.47 35.682301891088635 139.76703307996056 13.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-5f75a4e6-e965-48e7-b365-fe21c64fcb08">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-5f75a4e6-e965-48e7-b365-fe21c64fcb08">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-5f75a4e6-e965-48e7-b365-fe21c64fcb08">
											<gml:posList>35.6816265902775 139.7667512786464 13.4 35.68031194560934 139.76625851961583 3.47 35.68119935777494 139.7665877843576 13.4 35.6816265902775 139.7667512786464 13.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-ebcd3358-171b-4886-96a2-bfc6acb77d90">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-ebcd3358-171b-4886-96a2-bfc6acb77d90">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-ebcd3358-171b-4886-96a2-bfc6acb77d90">
											<gml:posList>35.68031194560934 139.76625851961583 3.47 35.68119935777494 139.7665877843576 14.274 35.68119935777494 139.7665877843576 13.4 35.68031194560934 139.76625851961583 3.47</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-22cbabdc-8cda-4fb7-bb8d-be69dc993c5f">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-22cbabdc-8cda-4fb7-bb8d-be69dc993c5f">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-22cbabdc-8cda-4fb7-bb8d-be69dc993c5f">
											<gml:posList>35.681920508566684 139.76686375569906 14.1 35.68191839393691 139.76687026463765 14.1 35.68191839393691 139.76687026463765 3.47 35.681920508566684 139.76686375569906 3.47 35.681920508566684 139.76686375569906 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-6c45325e-ccc3-4b41-a695-937dc96e77fa">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-6c45325e-ccc3-4b41-a695-937dc96e77fa">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-6c45325e-ccc3-4b41-a695-937dc96e77fa">
											<gml:posList>35.681920508566684 139.76686375569906 14.1 35.681920508566684 139.76686375569906 3.47 35.68031194560934 139.76625851961583 3.47 35.681920508566684 139.76686375569906 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-a6609a80-f1cd-4831-a124-9a64bd742626">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-a6609a80-f1cd-4831-a124-9a64bd742626">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-a6609a80-f1cd-4831-a124-9a64bd742626">
											<gml:posList>35.6816265902775 139.7667512786464 14.1 35.6816265902775 139.7667512786464 13.4 35.681590673065315 139.7669025640065 13.4 35.681590673065315 139.7669025640065 14.1 35.6816265902775 139.7667512786464 14.1</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-028bba40-cd13-47cd-89e9-b1f4555b5376">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-028bba40-cd13-47cd-89e9-b1f4555b5376">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-028bba40-cd13-47cd-89e9-b1f4555b5376">
											<gml:posList>35.68026997077499 139.76639176700095 14.274 35.680301485808315 139.76626771999676 14.274 35.680301485808315 139.76626771999676 3.47 35.68026997077499 139.76639176700095 3.47 35.68026997077499 139.76639176700095 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-73967737-1a9b-4652-bed1-110847430333">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-73967737-1a9b-4652-bed1-110847430333">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-73967737-1a9b-4652-bed1-110847430333">
											<gml:posList>35.680301485808315 139.76626771999676 14.274 35.680310880885344 139.7662727167117 14.274 35.680310880885344 139.7662727167117 3.47 35.680301485808315 139.76626771999676 3.47 35.680301485808315 139.76626771999676 14.274</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-365fd284-4532-4ae3-9192-d42766ded31d">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-365fd284-4532-4ae3-9192-d42766ded31d">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-365fd284-4532-4ae3-9192-d42766ded31d">
											<gml:posList>35.68031194560934 139.76625851961583 3.47 35.68031193659563 139.7662585196234 14.274 35.68119935777494 139.7665877843576 14.274 35.68031194560934 139.76625851961583 3.47</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:boundedBy>
				<bldg:WallSurface gml:id="surface-e7db5fe1-b025-4dd7-92e9-54f8fe6bce72">
					<bldg:lod2MultiSurface>
						<gml:MultiSurface>
							<gml:surfaceMember>
								<gml:Polygon gml:id="poly-e7db5fe1-b025-4dd7-92e9-54f8fe6bce72">
									<gml:exterior>
										<gml:LinearRing gml:id="linr-e7db5fe1-b025-4dd7-92e9-54f8fe6bce72">
											<gml:posList>35.68227646064336 139.7671099612474 13.4 35.68228059156617 139.76711476367117 13.4 35.68228059156617 139.76711476367117 3.47 35.68227646064336 139.7671099612474 3.47 35.68227646064336 139.7671099612474 13.4</gml:posList>
										</gml:LinearRing>
									</gml:exterior>
								</gml:Polygon>
							</gml:surfaceMember>
						</gml:MultiSurface>
					</bldg:lod2MultiSurface>
				</bldg:WallSurface>
			</bldg:boundedBy>
			<bldg:address>
				<core:Address>
					<core:xalAddress>
						<xAL:AddressDetails>
							<xAL:Country>
								<xAL:CountryName>日本</xAL:CountryName>
								<xAL:Locality>
									<xAL:LocalityName Type="Town">東京都千代田区丸の内一丁目</xAL:LocalityName>
								</xAL:Locality>
							</xAL:Country>
						</xAL:AddressDetails>
					</core:xalAddress>
				</core:Address>
			</bldg:address>
			<uro:bldgDataQualityAttribute>
				<uro:DataQualityAttribute>
					<uro:geometrySrcDescLod0 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod0>
					<uro:geometrySrcDescLod1 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod1>
					<uro:geometrySrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">000</uro:geometrySrcDescLod2>
					<uro:geometrySrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_geometrySrcDesc.xml">999</uro:geometrySrcDescLod3>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">201</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">000</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">023</uro:thematicSrcDesc>
					<uro:thematicSrcDesc codeSpace="../../codelists/DataQualityAttribute_thematicSrcDesc.xml">400</uro:thematicSrcDesc>
					<uro:appearanceSrcDescLod2 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">1</uro:appearanceSrcDescLod2>
					<uro:appearanceSrcDescLod3 codeSpace="../../codelists/DataQualityAttribute_appearanceSrcDesc.xml">99</uro:appearanceSrcDescLod3>
					<uro:lodType codeSpace="../../codelists/Building_lodType.xml">2.2</uro:lodType>
					<uro:lod1HeightType codeSpace="../../codelists/DataQualityAttribute_lod1HeightType.xml">2</uro:lod1HeightType>
					<uro:publicSurveyDataQualityAttribute>
						<uro:PublicSurveyDataQualityAttribute>
							<uro:srcScaleLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod0>
							<uro:srcScaleLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod1>
							<uro:srcScaleLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_srcScale.xml">1</uro:srcScaleLod2>
							<uro:publicSurveySrcDescLod0 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod0>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">023</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod1 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod1>
							<uro:publicSurveySrcDescLod2 codeSpace="../../codelists/PublicSurveyDataQualityAttribute_geometrySrcDesc.xml">012</uro:publicSurveySrcDescLod2>
						</uro:PublicSurveyDataQualityAttribute>
					</uro:publicSurveyDataQualityAttribute>
				</uro:DataQualityAttribute>
			</uro:bldgDataQualityAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">10</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.13</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">31</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.174</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:RiverFloodingRiskAttribute>
					<uro:description codeSpace="../../codelists/RiverFloodingRiskAttribute_description.xml">8</uro:description>
					<uro:rank codeSpace="../../codelists/RiverFloodingRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.174</uro:depth>
					<uro:adminType codeSpace="../../codelists/RiverFloodingRiskAttribute_adminType.xml">2</uro:adminType>
					<uro:scale codeSpace="../../codelists/RiverFloodingRiskAttribute_scale.xml">2</uro:scale>
				</uro:RiverFloodingRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgDisasterRiskAttribute>
				<uro:HighTideRiskAttribute>
					<uro:description codeSpace="../../codelists/HighTideRiskAttribute_description.xml">2</uro:description>
					<uro:rank codeSpace="../../codelists/HighTideRiskAttribute_rank.xml">1</uro:rank>
					<uro:depth uom="m">0.02</uro:depth>
				</uro:HighTideRiskAttribute>
			</uro:bldgDisasterRiskAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">100</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key100.xml">11</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">101</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key101.xml">1</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">102</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key102.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">103</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key103.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">104</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key104.xml">0</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">105</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key105.xml">9</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:bldgKeyValuePairAttribute>
				<uro:KeyValuePairAttribute>
					<uro:key codeSpace="../../codelists/KeyValuePairAttribute_key.xml">106</uro:key>
					<uro:codeValue codeSpace="../../codelists/KeyValuePairAttribute_key106.xml">10</uro:codeValue>
				</uro:KeyValuePairAttribute>
			</uro:bldgKeyValuePairAttribute>
			<uro:buildingDetailAttribute>
				<uro:BuildingDetailAttribute>
					<uro:buildingRoofEdgeArea uom="m2">3175.55305</uro:buildingRoofEdgeArea>
					<uro:fireproofStructureType codeSpace="../../codelists/BuildingDetailAttribute_fireproofStructureType.xml">1001</uro:fireproofStructureType>
					<uro:urbanPlanType codeSpace="../../codelists/Common_urbanPlanType.xml">21</uro:urbanPlanType>
					<uro:areaClassificationType codeSpace="../../codelists/Common_areaClassificationType.xml">22</uro:areaClassificationType>
					<uro:districtsAndZonesType codeSpace="../../codelists/Common_districtsAndZonesType.xml">10</uro:districtsAndZonesType>
					<uro:landUseType codeSpace="../../codelists/Common_landUseType.xml">216</uro:landUseType>
					<uro:detailedUsage codeSpace="../../codelists/BuildingDetailAttribute_detailedUsage.xml">1431</uro:detailedUsage>
					<uro:specifiedBuildingCoverageRate>80</uro:specifiedBuildingCoverageRate>
					<uro:specifiedFloorAreaRate>900</uro:specifiedFloorAreaRate>
					<uro:surveyYear>2021</uro:surveyYear>
				</uro:BuildingDetailAttribute>
			</uro:buildingDetailAttribute>
			<uro:buildingIDAttribute>
				<uro:BuildingIDAttribute>
					<uro:buildingID>13101-bldg-2313</uro:buildingID>
					<uro:prefecture codeSpace="../../codelists/Common_localPublicAuthorities.xml">13</uro:prefecture>
					<uro:city codeSpace="../../codelists/Common_localPublicAuthorities.xml">13101</uro:city>
				</uro:BuildingIDAttribute>
			</uro:buildingIDAttribute>
		</bldg:Building>
	</core:cityObjectMember>
</core:CityModel>
